package com.graduate.mooc.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by Chao Wax on 2019/4/6
 */
@Component
@Mapper
public interface InfoMap {

    List<Map<String,Object>> myCourses(String sno);

    Map<String,Object> myChState(String chid,String sno);//应该也是要taskno
}
