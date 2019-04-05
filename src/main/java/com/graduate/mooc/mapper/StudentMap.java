package com.graduate.mooc.mapper;

import com.graduate.mooc.domain.Student;
import com.graduate.mooc.domain.Student;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface StudentMap {
    Student findStudentByName(String name);

    Student findStudentByID(String id);

    public List<Student> ListStudent();

    public int insertStudent(Student stu);

    public int delete(int id);

    public int Update(Student stu);
}
