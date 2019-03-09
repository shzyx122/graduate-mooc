package com.graduate.mooc.mapper;

import com.graduate.mooc.domain.Course;
import com.graduate.mooc.domain.Course;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface CourseMap {
    List<Course> findCourseByName(String name);

    List<Course> findCourseByTid(String tid);

    Course findCourseByID(String id);

    List<Course> ListCourse();

    void insertCourse(Course cou);

    void delete(String id);

    void update(Course cou);
}
