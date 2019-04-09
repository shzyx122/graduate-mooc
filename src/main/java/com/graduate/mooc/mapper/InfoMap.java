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

    //所有报名的task
    List<Map<String,Object>> myCourses(String sno);

    //进度里面看章节是否已经完成
    Map<String,Object> myChState(String taskno,String chid,String sno);//应该也是要taskno
}
