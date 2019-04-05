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


    //一门课程安排对应的章节数
    Integer countChapters(String taskno);

    //一个人该门课程所有章节的总分
    Integer scoresForChapters(String taskno,String sno);

    //此人该门课考试成绩
    Integer scoreForExam(String taskno,String sno);

}
