package com.graduate.mooc;

import com.graduate.mooc.service.ExamServ;
import com.graduate.mooc.service.InfoServ;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MoocApplicationTests {

    @Test
    public void contextLoads() {
    }

    @Autowired
    ExamServ exs;

    @Test
    public void exam() {

        System.out.println(exs.queryIncompleteVideos("1b9ecb26a7ca1037b0b07e977ba3bfd4","e261837d0425ead527010e28e2514ae1"));
        System.out.println(exs.ChaptersDiffSubjects("1b9ecb26a7ca1037b0b07e977ba3bfd4","e261837d0425ead527010e28e2514ae1"));

        System.out.println(exs.totalScore("1b9ecb26a7ca1037b0b07e977ba3bfd4","e261837d0425ead527010e28e2514ae1"));
    }

    @Autowired
    InfoServ infs;
    @Test
    public void info(){
        System.out.println(infs.myCourses("e261837d0425ead527010e28e2514ae1"));
    }
}

