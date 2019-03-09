package com.graduate.mooc.service;

import com.graduate.mooc.domain.Teacher;
import com.graduate.mooc.mapper.TeacherMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class TeaServ {
    @Autowired
    public TeacherMap team;

    public boolean validate(String tname,String pass){
        List<Teacher> tlist=team.findTeacherByName(tname);
        for(Teacher t:tlist){
            if(t.getPass().equals(pass))
                return true;
        }
        return false;
    }

    public String findIDByName(String name){
        List<Teacher> tlist=team.findTeacherByName(name);
        if(tlist.size()>1)
            return "";
        return tlist.get(0).getTid();
    }
}
