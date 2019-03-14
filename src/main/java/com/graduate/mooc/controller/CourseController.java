package com.graduate.mooc.controller;

import com.alibaba.fastjson.JSONObject;
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

    //跳转课程详情页面  需要
    @GetMapping("/front")
    public String front(@RequestParam("cour")String cid, HttpSession session){
        session.setAttribute("reqCid",cid);
        session.setAttribute("cRoot",cid); //方便调用teacher已有接口
        return "CoursesInfo";
    }

    //进入页面就查询该门课程(没有结束的)
    @GetMapping("/info")
    @ResponseBody
    public List<Task> query(HttpSession session){
        String cid=(String)session.getAttribute("reqCid");
        System.out.println(tMap.findTaskByCID(cid));
       /* String user = (String)session.getAttribute("suser");//这坨似乎不需要 如果前端你是java代码获取的话
        JSONObject nn = new JSONObject();
        nn.put("suser", user);
        session.setAttribute("suser", nn);*/
        return tMap.findTaskByCID(cid);
    }



    /*@GetMapping("/info")
    @ResponseBody
    public Course info(@RequestParam("cid")String cid){
        return cMap.findCourseByID(cid);
    }*/


}
