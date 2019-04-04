package com.graduate.mooc;

import com.graduate.mooc.service.ExamServ;
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

        System.out.println(exs.queryIncompleteVideos("f55875daa72e1037b0b07e977ba3bfd4","e261837d0425ead527010e28e2514ae1"));
        System.out.println(exs.ChaptersDiffSubjects("f55875daa72e1037b0b07e977ba3bfd4","e261837d0425ead527010e28e2514ae1"));
    }
}

