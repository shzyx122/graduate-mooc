package com.graduate.mooc.mapper;

import com.graduate.mooc.domain.Handin;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface HandinMap {
    List<Handin> findHandinByName(String name);

    List<Handin> findHandinByID(String id);

    public List<Handin> ListHandin();

    public int insertHandin(Handin hd);

    public int delete(int id);

    public int Update(Handin hd);
}
