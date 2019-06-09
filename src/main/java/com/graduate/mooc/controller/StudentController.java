package com.graduate.mooc.controller;

import com.graduate.mooc.domain.*;
import com.graduate.mooc.mapper.*;
//import com.sun.org.apache.xpath.internal.operations.String;
import com.graduate.mooc.service.ExamServ;
import com.graduate.mooc.service.InfoServ;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Chao Wax on 2019/3/14
 */
@Controller
@RequestMapping("/student")
public class StudentController {   //要统计课程总分，个人所有学过的课程总分放在个人信息或者首页中
    @Autowired
    LearnMap lMap;

    @Autowired
    StudentMap stMap;

    @Autowired
    TaskMap tkMap;

    @Autowired
    CourseMap cMap;

    @Autowired
    ChapterMap chMap;

    @Autowired
    StudentMap stuMap;

    @Autowired
    VideoMap vMap;

    @Autowired
    MatchMap matMap;

    @Autowired
    SubjectMap subMap;

    @Autowired
    ChscoreMap chsMap;

    @Autowired
    ExamServ exServ;

    @Autowired
    InfoServ inServ;

/*
courseinfo 中点击加入课程  video learn
 */
    @GetMapping("/attend")
    public String attend(@RequestParam("taskno") String taskno,@RequestParam("stu") String stu,
                         HttpSession session){
        System.out.println("attend " +stu+" learn "+taskno);
        String sno=stuMap.findStudentByName(stu).getSno();
        session.setAttribute("myTask", taskno);  //设置任务 以后操作根据任务来
        session.setAttribute("mySno",sno);
        Learn learn = lMap.findLearnByInfo(sno,taskno); //设置learn，如果原先没有则添加，否则不触发
        System.out.println("learned "+learn);
        if(learn==null) {
            Learn l = new Learn();
            l.setGrade(-1);
            l.setStu(stMap.findStudentByName(stu));
            l.setTask(tkMap.findTaskByTno(taskno));

            //video表所有章节关联  初始化视频观看

            List<Chapter> chs = chMap.findChapterByCID((String)session.getAttribute("cRoot"));
            for(Chapter ch:chs){  //创建video表
                Video v = new Video();
                v.setSno(sno);
                v.setPlay(0);
                //v.setState(0);
                v.setChid(ch.getChid());
                //System.out.println(v);
                v.setTaskno(taskno);
                //设置时间初始化
                v.setTime(new Time(StringToDate("0:0:0:0","HH:mm:ss:SSS").getTime()));
                vMap.addVideo(v);
                System.out.println("video insert "+v);

                Chscore chscore = new Chscore();  //录入个人章节成绩
                chscore.setChid(ch.getChid());
                chscore.setSno(sno);
                chscore.setScore(-1);
                chscore.setTaskno(taskno);
                chsMap.insertChscore(chscore);
                System.out.println("chscore insert "+chscore);
            }
            lMap.insertLearn(l);


            //新任务消息
            Task  newTask = tkMap.findTaskByTno(taskno);
            Course newCourse = cMap.findCourseByID(newTask.getCourse().getCid());
            session.setAttribute("newTask",newCourse.getCname());
            System.out.println("new task "+session.getAttribute("newTask"));

        }
        System.out.println("learn succeeded  " + session.getAttribute("cRoot"));
            //跳转至学习进度页面   原先入口页面在登录状态下更改按钮


        String cid = tkMap.findTaskByTno(taskno).getCourse().getCid();
        session.setAttribute("myCid",cid);
        System.out.println("myTask mySno myCid"+" "+taskno+" "+sno+" "+cid);



        return "progress";
    }



    @GetMapping("/myProgress")
    @ResponseBody
    public List<Map<String,Object>> myProgress(@RequestParam("cid") String cid,@RequestParam("sno") String sno,
                           HttpSession session){
        String taskno=(String)session.getAttribute("myTask");
        System.out.println("progress task "+taskno+" "+cid+" "+sno);
        int sub=exServ.ChaptersDiffSubjects(taskno,sno);  //该名学生当前课程安排中剩余未完成章节习题数
        int chv=exServ.queryIncompleteVideos(taskno,sno);  //没看的视频数
        List<Chapter> chlist = chMap.findChapterByCID(cid);
        System.out.println(chlist);
        List<Map<String,Object>> res = new ArrayList<>();
        for(Chapter ch:chlist){
            Map<String,Object> map = new HashMap<>();
            map.put("chid",ch.getChid());     //这里有chid  加上sno作为条件，将score和play塞入结果  score!=null并play!=0
            map.put("chname",ch.getChname());
            if(ch.getExstate()==1) {  //考试的章节
                if (sub == 0 && chv == 0) {  //可以开放考试
                    map.put("state","exam");
                } else {   //考试章节还不能考试
                    map.put("state","prepare");
                }
            }
            else{  //非考试章节
                map.put("state","normal");
            }
            Map<String,Object> mych = inServ.myChState(taskno,ch.getChid(),sno);  //用来判断章节是否已经完成
            if(mych!=null) {
                map.put("play", mych.get("play"));
                map.put("score", mych.get("score"));
                System.out.println("mych " + mych);
                System.out.println("map " + map);
            }
            res.add(map);
        }
        System.out.println("chp "+res);
        return res;
    }



    /*
    chapters中看完视频之后
     */
    @PostMapping("/learned")  //end 之后 play字段+1
    @ResponseBody
    public String learned(@RequestParam("myCh")String chid,HttpSession session,@RequestBody Map<String,String> learn){
        String sno = (String)session.getAttribute("suser");
        String stu=stuMap.findStudentByName(sno).getSno();

        String taskno=(String)session.getAttribute("myTask");
        System.out.println("learned taskno "+taskno );

        System.out.println("learn "+learn);
        String tt =learn.get("total");   //用字符串截取，保留小数点前的位数
        if(tt.contains("."))
            tt=tt.substring(0, tt.indexOf("."));
        long total=Long.parseLong(tt);  //前端现在传入毫秒
        //total=total.replace(".", ":");
        //String tt = learn.get("total");
        //System.out.println(tt);
        //Date total=StringToDate(tt,"HH:mm:ss:SSS");
        System.out.println("total "+total);

        SimpleDateFormat formatter=new SimpleDateFormat("HH:mm:ss:SSS");
        Date date=null;
        date=StringToDate("0:0:8:125","HH:mm:ss:SSS"); //把String 转换成date

        Time time=new Time(date.getTime());
        System.out.println(time);  //time
        System.out.println(formatter.format(time));  //time转成了string
        //Timestamp
        System.out.println("开始");
        System.out.println(formatter.format(new Date(time.getTime()+total))); //long total 日期时间加法应该这样
        try {
            System.out.println(new Time(StringToDate("0:0:0:0","HH:mm:ss:SSS").getTime()));
        }catch (Exception e){
            e.printStackTrace();
        }

//塞入数据库累加

        Video v = new Video();
        System.out.println(chid+" "+stu);
        v.setChid(chid);
        v.setSno(stu);
        v.setTaskno(taskno);
        Video vc=vMap.ListVideo(v).get(0); //由于在上方初始化了time，所以可能会出错
        System.out.println("vc "+vc);
        if(vc.getTime()==null||vc.getTime().equals(""))
           vc.setTime(new Time(StringToDate("0:0:0:0","HH:mm:ss:SSS").getTime()));  //初始化全0
        System.out.println(" get time "+vc.getTime());
        Time vctime = vc.getTime();

        Date d =StringToDate(formatter.format(vctime.getTime()),"HH:mm:ss:SSS");
        Time uptime=new Time(d.getTime()+total);//原先是long total

        System.out.println(uptime);
        System.out.println("uptime "+formatter.format(uptime));
        vc.setTime(uptime);
        vc.setPlay(vc.getPlay()+1);
        vMap.updateVideo(vc);
        return "finished this watch";
        //能入库，现在需要显示在chapters上
    }

    public static Date StringToDate(String dateStr,String formatStr){  //字符串转日期  然后用于time
        SimpleDateFormat formatter=new SimpleDateFormat(formatStr);
        Date date=null;
        try {
            date = formatter.parse(dateStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    /*
    提交习题 Chscore Match
     */
    @PostMapping("/handin")
    @ResponseBody
    public String handin(@RequestBody Map<String,Object> hand, HttpServletRequest req){
        System.out.println(hand);
        List<String> chlist = (List<String>)hand.get("choice");
        List<String> sublist = (List<String>)hand.get("subno");

        String task = (String)hand.get("taskno");
        List<String> mno = (List<String>) hand.get("mno");
        System.out.println(chlist);
        System.out.println(task);
        System.out.println();
        System.out.println("hadnin mno front "+mno);

        //修改mat表，录入选择结果
        for(int i=0;i<mno.size();i++){
            Match mat = matMap.findMatchByID(mno.get(i));
            System.out.println("origin "+mat);
            mat.setChoice(chlist.get(i)==null?"none":chlist.get(i));
            //做过了的题还会遍历一下第一道的origin，答案是选好了的  问题在于查询的时候没按照taskno找，所以找到的是所有的题目而不是匹配到的题目
            mat.setSubject(subMap.findSubjectByID(sublist.get(i)));
            mat.setState(chlist.get(i)==null||!mat.getSubject().getAnswer().equals(chlist.get(i))?0:1);
            matMap.Update(mat);
            System.out.println("now"+mat);

        }

        String mych=(String)hand.get("chapter");
        String mysno = (String)hand.get("sno");
        System.out.println(mych+" "+mysno);
        /*int score = (Integer)hand.get("score");
        System.out.println(score);*/
        //章节分数表  存放某人 某章节 章节比例 章节成绩   这样之后统计总分方便些
        List<Match> mlist = matMap.getSubject(mych,mysno,task);
        System.out.println(mlist.get(0));
        int chsc=0;
        for(int i = 0;i<mlist.size();i++){
            System.out.println(mlist.get(i).getSubject().getAnswer().equals(mlist.get(i).getChoice()));
            if(mlist.get(i).getSubject().getAnswer().equals(mlist.get(i).getChoice())){
                chsc+=mlist.get(i).getState()*mlist.get(i).getPercent(); //原先是subject里面有percent.getSubject()
            }
        }
        System.out.println("score "+chsc);
//更改score
        Chscore chs = chsMap.quertChsByDetails(task,mych,mysno);
        System.out.println("chs "+chs);
        chs.setScore(chsc);
        chsMap.updateChscore(chs);
        System.out.println("/student/handin upchs "+chs);
        /*Chscore chs = new Chscore();  //录入个人章节成绩
        chs.setChid(mych);
        chs.setSno(mysno);
        chs.setScore(chsc);
        chs.setTaskno(task);
        chsMap.insertChscore(chs);*/
        //如果是考试章节，就可以计算总分了
        Chapter ch = chMap.findChapterByID(mych);
        if(ch.getExstate()==1) {
            Learn l = new Learn();
            l.setStu(stuMap.findStudentByID(mysno));
            System.out.println(mysno+" "+stuMap.findStudentByID(mysno));
            l.setTask(tkMap.findTaskByTno(task));
            l.setGrade(exServ.totalScore(task,mysno));
            l.setLno(lMap.findLearnByInfo(mysno,task).getLno());
            System.out.println("完成总分计算 "+l);
            lMap.Update(l);

        }

        return "success";
    }

    //似乎没有用到
    @PostMapping("/chapterScore")
    public String score(@RequestBody Map<String,Object> scTable){
        System.out.println(scTable);
        System.out.println(scTable.get("chapter")+" "+scTable.get("student")+" "+scTable.get("score"));
        return "score received";
    }

    @GetMapping("/stuInfo")
    public String stuInfo(){
        return "student/stuInfo";
    }

    @GetMapping("/info")
    @ResponseBody
    public List<Map<String,Object>> info(HttpSession session){
        String stu=(String)session.getAttribute("suser");
        String sno=stuMap.findStudentByName(stu).getSno();
        System.out.println("info sno "+sno);
        List<Map<String,Object>> map = new ArrayList<>();
        map=inServ.myCourses(sno);
        return map;
    }

}
