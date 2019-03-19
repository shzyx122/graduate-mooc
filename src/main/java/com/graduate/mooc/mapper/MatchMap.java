package com.graduate.mooc.mapper;

import com.graduate.mooc.domain.Match;
import com.graduate.mooc.domain.Match;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
@Mapper
public interface MatchMap {
    List<Match> findMatchByInfo(String sno,String taskno);

    List<Match> findMatchByID(String id);

    public List<Match> ListMatch();

    public int insertMatch(Match mat);

    public int delete(int id);

    public int Update(Match mat);
}
