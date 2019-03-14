package com.graduate.mooc.service;

import com.graduate.mooc.domain.Student;
import com.graduate.mooc.mapper.StudentMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StuServ {
    @Autowired
    public StudentMap stm;
    
    public boolean validate(String sname,String pass){
        Student s=stm.findStudentByName(sname);
            if(s.getPass().equals(pass))
                return true;
        return false;
    }
}
