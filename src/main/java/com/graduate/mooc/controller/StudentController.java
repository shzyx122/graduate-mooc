package com.graduate.mooc.controller;

import com.graduate.mooc.domain.Learn;
import com.graduate.mooc.mapper.LearnMap;
import com.graduate.mooc.mapper.StudentMap;
import com.graduate.mooc.mapper.TaskMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

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

    @GetMapping("/attend")
    public String attend(@RequestParam("taskno") String taskno,@RequestParam("stu") String stu,
                         HttpSession session){
        Learn l = new Learn();
        l.setGrade(-1);
        l.setStu(stMap.findStudentByName(stu));
        l.setTask(tkMap.findTaskByTno(taskno));
        lMap.insertLearn(l);
        System.out.println("learn succeeded  "+session.getAttribute("cRoot") );
        //跳转至学习进度页面   原先入口页面在登录状态下更改按钮
        return "progress";
    }

}
