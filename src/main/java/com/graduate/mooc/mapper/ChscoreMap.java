package com.graduate.mooc.mapper;

import com.graduate.mooc.domain.Chscore;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Chao Wax on 2019/4/1
 */
@Component
@Mapper
public interface ChscoreMap {

    List<Chscore> listChscore(Chscore ch);

    void insertChscore(Chscore ch);
}
