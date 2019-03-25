package com.graduate.mooc.mapper;

import com.graduate.mooc.domain.Video;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by Chao Wax on 2019/3/24
 */
@Component
@Mapper
public interface VideoMap {

    List<Video> ListVideo(Video v);
    void addVideo(Video v);
    void deleteVideo(String vno);
    void updateVideo(Video v);

}
