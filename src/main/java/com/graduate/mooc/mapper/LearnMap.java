package com.graduate.mooc.mapper;

import com.graduate.mooc.domain.Learn;
import com.graduate.mooc.domain.Learn;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface LearnMap {
    List<Learn> findLearnBySno(String sno);

    List<Learn> findLearnByID(String id);

    public List<Learn> ListLearn();

    public int insertLearn(Learn ln);

    public int delete(int id);

    public int Update(Learn ln);
}
