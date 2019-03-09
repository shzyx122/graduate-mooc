package com.graduate.mooc.mapper;

import com.graduate.mooc.domain.Teacher;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface TeacherMap {
    List<Teacher> findTeacherByName(String name);

    Teacher findTeacherByID(String id);

    List<Teacher> ListTeacher();

    void insertTeacher(Teacher tea);

    int delete(int id);

    int Update(Teacher tea);


}
