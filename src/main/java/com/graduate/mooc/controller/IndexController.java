package com.graduate.mooc.controller;

import com.graduate.mooc.domain.Admin;
import com.graduate.mooc.domain.Course;
import com.graduate.mooc.domain.Task;
import com.graduate.mooc.mapper.AdminMap;
import com.graduate.mooc.mapper.CourseMap;
import com.graduate.mooc.mapper.TaskMap;
import com.graduate.mooc.service.AdminService;
import com.graduate.mooc.service.StuServ;
import com.graduate.mooc.service.TeaServ;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller

public class IndexController {
    @RequestMapping("/")
    public String index(){
        return "login";
    }

    @Autowired
    public TeaServ tserv;
    @Autowired
    public AdminService aserv;
    @Autowired
    public StuServ sserv;
    @Autowired
    public TaskMap tMap;

    @RequestMapping(value="/login",method = RequestMethod.POST)  //登录验证
    public String login(@RequestParam(value="usertype") String usertype,
                        @RequestParam(value="username") String username,
                        @RequestParam(value="password") String password,HttpSession session){
        if(!usertype.equals("")) {

            if ("admin".equals(usertype))
                if (aserv.validate(username, password)) {
                    System.out.println("登录成功");
                    session.setAttribute("auser", username);
                    System.out.println("会话属性 auser:" + username);
                    return "admin/index";
                }

            if ("teacher".equals(usertype))
                if (tserv.validate(username, password)) {
                    System.out.println("登录成功");
                    session.setAttribute("tuser", username);
                    System.out.println("会话属性 tuser:" + username);
                    return "teacher/Tindex";
                }


            if ("student".equals(usertype))
                if (sserv.validate(username, password)) {
                    System.out.println("登录成功");
                    session.setAttribute("suser", username);
                    System.out.println("会话属性 suser:" + username);
                    session.setAttribute("newTask","暂无新任务");  //新任务会话属性初始化
                    return "student/Sindex";
                }

        }
        return "404";
    }

    @RequestMapping(value="/logout",method = RequestMethod.GET)  //登出
    public String logout(HttpSession session){
 //根据用户类型取消会话属性，跳转到对应首页。
        session.invalidate();//clear
        return "login";
    }

    @Autowired
    CourseMap coum;
    @RequestMapping(value = "/index",method=RequestMethod.GET)
    @ResponseBody
    public List<Task> indexCou(){ //应该是 task里面
        return tMap.ListTask();
    }

    @Autowired
    public AdminMap adm;
    @RequestMapping("/ListAdmin")
    @ResponseBody
    public List<Admin> ListAdmin(){
        return adm.ListAdmin();
    }
}
