package com.graduate.mooc.mapper;

import com.graduate.mooc.domain.Subject;
import com.graduate.mooc.domain.Subject;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface SubjectMap {
    List<Subject> findSubjectByName(String name);

    List<Subject> findSubjectByID(String id);

    public List<Subject> ListSubject();

    public int insertSubject(Subject sub);

    public int delete(int id);

    public int Update(Subject sub);
}
