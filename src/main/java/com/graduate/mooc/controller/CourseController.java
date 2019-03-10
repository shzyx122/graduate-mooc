package com.graduate.mooc.controller;

import com.graduate.mooc.domain.Course;
import com.graduate.mooc.domain.Task;
import com.graduate.mooc.mapper.CourseMap;
import com.graduate.mooc.mapper.TaskMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;

/**
 * Created by Chao Wax on 2019/3/9
 */
@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    CourseMap cMap;

    @Autowired
    TaskMap tMap;

    //跳转课程详情页面
    @GetMapping("/front")
    public String front(@RequestParam("cour")String cid, HttpSession session){
        session.setAttribute("reqCid",cid);
        session.setAttribute("cRoot",cid);
        return "CoursesInfo";
    }

    //进入页面就查询该门课程(没有结束的)
    @GetMapping("/info")
    @ResponseBody
    public List<Task> query(HttpSession session){
        String cid=(String)session.getAttribute("reqCid");
        System.out.println(tMap.findTaskByCID(cid));
        return tMap.findTaskByCID(cid);
    }



    /*@GetMapping("/info")
    @ResponseBody
    public Course info(@RequestParam("cid")String cid){
        return cMap.findCourseByID(cid);
    }*/


}
