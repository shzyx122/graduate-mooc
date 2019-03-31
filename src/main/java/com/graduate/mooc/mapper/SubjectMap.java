package com.graduate.mooc.mapper;

import com.graduate.mooc.domain.Subject;
import com.graduate.mooc.domain.Subject;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface SubjectMap {
    List<Subject> findSubjectByChid(String chid);

    Subject findSubjectByID(String id);

    public List<Subject> ListSubject();

    public int insertSubject(Subject sub);

    public int delete(String id);

    public int Update(Subject sub);
}
