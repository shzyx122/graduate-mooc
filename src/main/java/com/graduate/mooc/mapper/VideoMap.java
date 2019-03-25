package com.graduate.mooc.mapper;

import com.graduate.mooc.domain.Video;

/**
 * Created by Chao Wax on 2019/3/24
 */
public interface VideoMap {

    void ListVideo(Video v);
    void addVideo(Video v);
    void deleteVideo(String vno);
    void updateVideo(Video v);

}
