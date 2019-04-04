package com.graduate.mooc.controller;

import com.graduate.mooc.domain.*;
import com.graduate.mooc.mapper.*;
//import com.sun.org.apache.xpath.internal.operations.String;
import com.graduate.mooc.service.ExamServ;
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
/*
courseinfo 中点击加入课程  video learn
 */
    @GetMapping("/attend")
    public String attend(@RequestParam("taskno") String taskno,@RequestParam("stu") String stu,
                         HttpSession session){
        System.out.println("attend " +stu+" learn "+taskno);
        String sno=stuMap.findStudentByName(stu).getSno();
        Learn learn = lMap.findLearnByInfo(sno,taskno);
        System.out.println("learned "+learn);
        if(learn==null) {
            Learn l = new Learn();
            l.setGrade(-1);
            l.setStu(stMap.findStudentByName(stu));
            l.setTask(tkMap.findTaskByTno(taskno));

            //video表所有章节关联

            List<Chapter> chs = chMap.findChapterByCID((String)session.getAttribute("cRoot"));
            for(Chapter ch:chs){  //创建video表
                Video v = new Video();
                v.setSno(sno);
                v.setPlay(0);
                //v.setState(0);
                v.setChid(ch.getChid());
                //System.out.println(v);
                vMap.addVideo(v);
                System.out.println("video insert "+v);
            }
            lMap.insertLearn(l);
        }
        System.out.println("learn succeeded  " + session.getAttribute("cRoot"));
            //跳转至学习进度页面   原先入口页面在登录状态下更改按钮
        session.setAttribute("myTask", taskno);  //设置任务 以后操作根据任务来
        session.setAttribute("mySno",sno);

        String cid = tkMap.findTaskByTno(taskno).getCourse().getCid();
        session.setAttribute("myCid",cid);
        System.out.println("myTask mySno myCid"+" "+taskno+" "+sno+" "+cid);
        return "progress";
    }

    @GetMapping("/myProgress")
    @ResponseBody
    public List<Map<String,Object>> myProgress(@RequestParam("cid") String cid,@RequestParam("sno") String sno,
                           HttpSession session){
        System.out.println("progress "+cid+" "+sno);
        int sub=exServ.ChaptersDiffSubjects(cid,sno);
        int chv=exServ.queryIncompleteVideos(cid,sno);
        List<Chapter> chlist = chMap.findChapterByCID(cid);
        System.out.println(chlist);
        List<Map<String,Object>> res = new ArrayList<>();
        for(Chapter ch:chlist){
            Map<String,Object> map = new HashMap<>();
            map.put("chid",ch.getChid());
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

        System.out.println("learn "+learn);
        SimpleDateFormat formatter=new SimpleDateFormat("HH:mm:ss:SSS");
        long total=Long.parseLong(learn.get("total"));  //前端现在传入毫秒
        //total=total.replace(".", ":");
        System.out.println(total);

        Date date=null;
        date=StringToDate("0:0:8:125","HH:mm:ss:SSS"); //把String 转换成date

        Time time=new Time(date.getTime());
        System.out.println(time);  //time
        System.out.println(formatter.format(time));  //time转成了string
        //Timestamp
        System.out.println("开始");
        System.out.println(formatter.format(new Date(time.getTime()+total))); //日期时间加法应该这样
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
        Video vc=vMap.ListVideo(v).get(0);
        System.out.println("vc "+vc);
        if(vc.getTime()==null||vc.getTime().equals(""))
           vc.setTime(new Time(StringToDate("0:0:0:0","HH:mm:ss:SSS").getTime()));  //初始化全0
        System.out.println(" get time "+vc.getTime());
        Time vctime = vc.getTime();

        Date d =StringToDate(formatter.format(vctime.getTime()),"HH:mm:ss:SSS");
        Time uptime=new Time(d.getTime()+total);

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

        for(int i=0;i<mno.size();i++){
            Match mat = matMap.findMatchByID(mno.get(i));
            System.out.println("origin "+mat);
            mat.setChoice(chlist.get(i)==null?"none":chlist.get(i));
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
        List<Match> mlist = matMap.getSubject(mych,mysno);
        System.out.println(mlist.get(0));
        int chsc=0;
        for(int i = 0;i<mlist.size();i++){
            System.out.println(mlist.get(i).getSubject().getAnswer().equals(mlist.get(i).getChoice()));
            if(mlist.get(i).getSubject().getAnswer().equals(mlist.get(i).getChoice())){
                chsc+=mlist.get(i).getState()*mlist.get(i).getPercent(); //原先是subject里面有percent.getSubject()
            }
        }
        System.out.println("score "+chsc);

        Chscore chs = new Chscore();  //录入个人章节成绩
        chs.setChid(mych);
        chs.setSno(mysno);
        chs.setScore(chsc);
        chsMap.insertChscore(chs);

        return "success";
    }

    //似乎没有用到
    @PostMapping("/chapterScore")
    public String score(@RequestBody Map<String,Object> scTable){
        System.out.println(scTable);
        System.out.println(scTable.get("chapter")+" "+scTable.get("student")+" "+scTable.get("score"));
        return "score received";
    }

}
