package com.graduate.mooc.controller;

import com.graduate.mooc.domain.Chapter;
import com.graduate.mooc.domain.Learn;
import com.graduate.mooc.domain.Video;
import com.graduate.mooc.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

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
}
