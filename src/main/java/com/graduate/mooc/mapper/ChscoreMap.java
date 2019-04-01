package com.graduate.mooc.mapper;

import com.graduate.mooc.domain.Chscore;

import java.util.List;

/**
 * Created by Chao Wax on 2019/4/1
 */
public interface ChscoreMap {

    List<Chscore> listChscore(Chscore ch);

    void insertChscore(Chscore ch);
}
