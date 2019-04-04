package com.graduate.mooc.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

/**
 * Created by Chao Wax on 2019/4/4
 */
@Component
@Mapper
public interface ExamMap {
    //某门课没看完的视频总数
    Integer queryIncompleteVideos(String cid,String sno);

    //某人某课完成习题的章节数量
    Integer queryCompletedSubjects(String cid,String sno);

    //某课章节数量
    Integer queryCountChapters(String cid);
}
