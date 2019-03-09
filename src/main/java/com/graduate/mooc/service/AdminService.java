package com.graduate.mooc.service;

import com.graduate.mooc.domain.Admin;
import com.graduate.mooc.mapper.AdminMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AdminService {
    @Autowired
    public AdminMap adm;

    public boolean validate(String aname,String pass){
        List<Admin> alist=adm.findAdminByName(aname);
        for(Admin a:alist){
            if(a.getPass().equals(pass))
                return true;
        }
        return false;
    }
}
