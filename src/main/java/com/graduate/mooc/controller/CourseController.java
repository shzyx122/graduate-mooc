package com.graduate.mooc.controller;

import com.graduate.mooc.domain.Course;
import com.graduate.mooc.mapper.CourseMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Chao Wax on 2019/3/9
 */
@Controller
@RequestMapping("/course")
public class CourseController {

    @GetMapping("/front")
    public String front(@RequestParam("cou")String cid, HttpSession session){
        session.setAttribute("reqCid",cid);
        return "CoursesInfo";
    }

    @Autowired
    CourseMap cMap;

    @GetMapping("info")
    @ResponseBody
    public Course info(@RequestParam("cid")String cid){
        return cMap.findCourseByID(cid);
    }


}
