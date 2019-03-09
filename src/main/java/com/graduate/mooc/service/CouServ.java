package com.graduate.mooc.service;

import com.graduate.mooc.domain.Course;
import com.graduate.mooc.domain.Teacher;
import com.graduate.mooc.mapper.CourseMap;
import com.graduate.mooc.mapper.TeacherMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CouServ {
    @Autowired
    CourseMap coum;
    @Autowired
    TeacherMap team;

    public List<Course> findCourseByTid(String tname){ //传入教师用户名返回该教师所有课程
        List<Teacher> tea=team.findTeacherByName(tname);
        String tid="";
        for(Teacher t:tea)
            tid=t.getTid();
        return coum.findCourseByTid(tid);
    }
}
