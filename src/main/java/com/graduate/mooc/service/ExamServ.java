package com.graduate.mooc.service;

import com.graduate.mooc.mapper.ExamMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Chao Wax on 2019/4/4
 */
@Service
public class ExamServ {
    @Autowired
    ExamMap eMap;

    public int queryIncompleteVideos(String cid,String sno){
        int count=eMap.queryIncompleteVideos(cid,sno);
        System.out.println(cid+" 课程中学生："+sno+"没完成的视频数 "+count);
        return count;
    }

    public int ChaptersDiffSubjects(String cid,String sno){
        int sub=eMap.queryCompletedSubjects(cid,sno);
        int ch=eMap.queryCountChapters(cid);
        System.out.println(cid+" 课程中学生："+sno+"完成习题的章节数 "+sub+" 章节总数 "+ch);
        return ch-sub;
    }


    public double totalScore(String taskno,String sno){
        int chNums=eMap.countChapters(taskno);
        int examScore=eMap.scoreForExam(taskno,sno);
        int chScores = eMap.scoresForChapters(taskno,sno);
        double score=examScore/chNums*0.4+chScores*0.6;
        System.out.println("总分 "+score);
        return score;
    }



}
