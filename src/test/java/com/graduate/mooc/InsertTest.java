package com.graduate.mooc;

import com.graduate.mooc.domain.Teacher;
import com.graduate.mooc.service.ExamServ;
import org.apache.ibatis.session.SqlSession;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.FileNotFoundException;
@RunWith(SpringRunner.class)
@SpringBootTest
public class InsertTest {
    private SqlSessionFactory factory;
    @Test
    public void testGetGeneratedKey1() throws FileNotFoundException {
        SqlSession session = factory.openSession();
        String statement = "cn.kolbe.mybatis.domain.UserMapper.getGeneratedKey1";
        Teacher t = new Teacher();
        int result = session.update(statement, t);		// result为受影响的行数
        session.commit();
        System.out.println(t);				// 输出 User [id=null, name=User_02, password=123456]
        System.out.println("result:" + result);                 // 输入 result: 1

    }
    @Autowired
    ExamServ exs;
    @Test
    public void exam() {
        System.out.println(exs.ChaptersDiffSubjects("1b9ecb26a7ca1037b0b07e977ba3bfd4","e261837d0425ead527010e28e2514ae1"));
        System.out.println(exs.queryIncompleteVideos("1b9ecb26a7ca1037b0b07e977ba3bfd4","e261837d0425ead527010e28e2514ae1"));
    }
}
