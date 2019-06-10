package com.graduate.mooc.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Chao Wax on 2019/6/10
 */
@Component
@Mapper
public interface StatisticsMap {

    List<LinkedHashMap<String,Object>> tasks(String tname);

    List<LinkedHashMap<String,Object>> rank(String taskno);

}
