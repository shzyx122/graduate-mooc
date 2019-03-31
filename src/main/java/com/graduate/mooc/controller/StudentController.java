package com.graduate.mooc.controller;

import com.graduate.mooc.domain.Chapter;
import com.graduate.mooc.domain.Learn;
import com.graduate.mooc.domain.Match;
import com.graduate.mooc.domain.Video;
import com.graduate.mooc.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by Chao Wax on 2019/3/14
 */
@Controller
@RequestMapping("/student")
public class StudentController {
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
/*
courseinfo 中点击加入课程
 */
    @GetMapping("/attend")
    public String attend(@RequestParam("taskno") String taskno,@RequestParam("stu") String stu,
                         HttpSession session){
        //System.out.println(stu+" learn "+taskno);
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
            }
            lMap.insertLearn(l);
        }
        System.out.println("learn succeeded  " + session.getAttribute("cRoot"));
            //跳转至学习进度页面   原先入口页面在登录状态下更改按钮
        session.setAttribute("myTask", taskno);  //设置任务 以后操作根据任务来

        return "progress";
    }

    /*
    chapters中看完视频之后
     */
    @PostMapping("/learned")  //end 之后 play字段+1
    @ResponseBody
    public String learned(@RequestParam("myCh")String chid,HttpSession session){
        String sno = (String)session.getAttribute("suser");
        String stu=stuMap.findStudentByName(sno).getSno();
        Video v = new Video();
        v.setChid(chid);
        v.setSno(stu);
        Video vc=vMap.ListVideo(v).get(0);
        vc.setPlay(vc.getPlay()+1);
        vMap.updateVideo(vc);
        return "finished this watch";
        //能入库，现在需要显示在chapters上
    }

    /*
    提交习题
     */
    @PostMapping("/handin")
    @ResponseBody
    public String handin(@RequestBody Map<String,Object> hand, HttpServletRequest req){
        System.out.println(hand);
        List<String> chlist = (List<String>)hand.get("choice");
        List<String> sublist = (List<String>)hand.get("subno");
        String stuno = (String)hand.get("sno");
        String task = (String)hand.get("taskno");
        List<String> mno = (List<String>) hand.get("mno");
        System.out.println(chlist);
        System.out.println(task);

        for(int i=0;i<mno.size();i++){
            Match mat = matMap.findMatchByID(mno.get(i));
            System.out.println("origin "+mat);
            mat.setChoice(chlist.get(i)==null?"none":chlist.get(i));
            mat.setSubject(subMap.findSubjectByID(sublist.get(i)));
            mat.setState(chlist.get(i)==null?0:1);
            matMap.Update(mat);
            System.out.println("now"+mat);

        }

        //System.out.println("handin "+match);Match match,
        /*request 不知道怎么弄
        System.out.println(req.getParameter("handin"));
        //JSONObject json = new org.json.JSONObject(req.getParameter("handin"));
        String subno[] = req.getParameterValues("handin.subno");
        System.out.println(subno);
        String taskno = req.getParameter("taskno");
        System.out.println(taskno);
        String choice[] = req.getParameterValues("choice");
        System.out.println(choice);
        String sno = req.getParameter("sno");
        System.out.println(sno);
        String mno = req.getParameter("mno");
        System.out.println(mno);*/
        return "success";
    }
}
