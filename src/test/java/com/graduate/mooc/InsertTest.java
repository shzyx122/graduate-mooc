package com.graduate.mooc;

import com.graduate.mooc.domain.Teacher;
import org.apache.ibatis.session.SqlSession;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import java.io.FileNotFoundException;

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


}
