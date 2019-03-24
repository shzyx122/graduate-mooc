package com.graduate.mooc.mapper;

import com.graduate.mooc.domain.Chapter;
import com.graduate.mooc.domain.Chapter;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface ChapterMap {
    List<Chapter> findChapterByName(String name);

    List<Chapter> findChapterByCID(String cid);

    Chapter findChapterByID(String chid);
    
    public List<Chapter> ListChapter();

    public void insertChapter(Chapter chp);

    public void delete(String id);

    public void update(String chid,String chname,String video,int exstate);

    void upEntity(Chapter ch);

    void click(String chid,int click);
}
