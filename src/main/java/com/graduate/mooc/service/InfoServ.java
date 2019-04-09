package com.graduate.mooc.service;

import com.graduate.mooc.mapper.InfoMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Chao Wax on 2019/4/6
 */
@Service
public class InfoServ {

    @Autowired
    InfoMap inMap;

    public List<Map<String,Object>> myCourses(String sno){
        List<Map<String,Object>> map = inMap.myCourses(sno);
        System.out.println(map);
        return map;
    }

    public  Map<String,Object> myChState(String taskno,String chid,String sno){
        Map<String,Object> map = inMap.myChState(taskno,chid,sno);
        System.out.println(map);
        return map;
    }

}
