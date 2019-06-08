package com.graduate.mooc.controller;

import com.graduate.mooc.domain.Course;
import com.graduate.mooc.domain.Task;
import com.graduate.mooc.domain.Teacher;
import com.graduate.mooc.mapper.CourseMap;
import com.graduate.mooc.mapper.TaskMap;
import com.graduate.mooc.mapper.TeacherMap;
import com.graduate.mooc.service.CouServ;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;

@Controller

public class AdminController {
    @Autowired
    public TeacherMap team;
    @RequestMapping(value="/addTea",method = RequestMethod.GET)
        public String tea(ModelMap model){
        List<Teacher> tlist=team.ListTeacher();
        model.addAttribute("tlist",tlist);
        return "admin/addTea";
    }
    @RequestMapping(value="/insertTea",method = RequestMethod.POST)
    public String addTea(Teacher t){
        System.out.println("要添加老师 "+t);
        if(t.getPass().equals(""))   //密码默认初始值
            t.setPass("123456");
        team.insertTeacher(t);
        System.out.println("添加老师成功");
        return "redirect:addTea";
    }

    /*
    查看课程并设置任务
     */
    @RequestMapping(value="/task",method = RequestMethod.GET)
    public String task(ModelMap model){
        return "admin/A_task";
    }

    @Autowired
    TaskMap tkmap;
    @RequestMapping(value = "/getTask",method = RequestMethod.GET) //ajax find tasks
    @ResponseBody
    public List<Task> getTtask(){
        List<Task> t =tkmap.ListTask();
        System.out.println(t);
        return tkmap.ListTask();
    }

    @Autowired
    CourseMap coum;
    @RequestMapping(value="/qcou",method = RequestMethod.GET) //查询课程ajax
    @ResponseBody
    public List<Course> qcou(){
        List<Course> cl = coum.ListCourse();
        System.out.println(cl);
        return cl;
    }

    @RequestMapping(value="/delcou",method = RequestMethod.GET)
    public String delcou(@RequestParam("cou") String cid ){
        System.out.println(cid);
        coum.delete(cid);
        System.out.println("删除成功");
        return "redirect:/task";
    }


    /*
    课程任务设置
     */
    @RequestMapping(value = "/task_form",method = RequestMethod.GET)
    public String task_form(@RequestParam("cou") String cid,HttpSession session){
        Course c=coum.findCourseByID(cid);
        session.setAttribute("cform",c);
        Teacher t = team.findTeacherByID(c.getTid());
        session.setAttribute("tname",t.getTname());
        return "admin/form_A_task";
    }



    @Autowired
    TaskMap tm;
    @RequestMapping(value = "/setTask",method = RequestMethod.POST)
    @ResponseBody
    public String setTask(@RequestParam("begin")String beg,@RequestParam("cid")String cid,
    @RequestParam("during")Integer dur ){
        Task t = new Task();
        Course c=coum.findCourseByID(cid);
        t.setCourse(c);

        System.out.println("param="+beg);
        String timemode=beg.replaceAll("T"," ");
        System.out.println("replace T "+timemode);
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime time = LocalDateTime.parse(timemode, fmt);
        System.out.println("final time "+time);
        t.setBegin(time);

        LocalDateTime end = time.plus(7*dur,ChronoUnit.DAYS);   //日期加法
        t.setEnd(end);
        System.out.println(end);
/*
每次一门课进行安排后都设置状态
 */
        tm.insertTask(t);
        c.setState(1);
        coum.update(c);
        return "succeeded! Please close the window and wait for the refresh!";
    }


}
