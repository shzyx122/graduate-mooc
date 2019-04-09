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

    public int queryIncompleteVideos(String taskno,String sno){
        int count=eMap.queryIncompleteVideos(taskno,sno);
        System.out.println(taskno+" 课程中学生："+sno+"没完成的视频数 "+count);
        return count;
    }

    public int ChaptersDiffSubjects(String taskno,String sno){
        int sub=eMap.queryCompletedSubjects(taskno,sno);
        int ch=eMap.queryCountChapters(taskno);
        System.out.println(taskno+" 课程中学生："+sno+"完成习题的章节数 "+sub+" 章节总数 "+ch);
        return ch-sub;
    }


    public double totalScore(String taskno,String sno){
        int chNums=eMap.countChapters(taskno);
        int examScore=eMap.scoreForExam(taskno,sno);
        int chScores = eMap.scoresForChapters(taskno,sno);
        double score=(chScores/chNums)*0.6+examScore*0.4;
        System.out.println("总分 "+score+" num "+chNums+" exsc "+examScore+" chsc "+chScores);
        return score;
    }



}
