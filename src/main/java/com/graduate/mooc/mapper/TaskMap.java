package com.graduate.mooc.mapper;

import com.graduate.mooc.domain.Task;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface TaskMap {
    List<Task> findTaskByTno(String tno);

    List<Task> findTaskByCID(String cid);


    public List<Task> ListTask();

    public int insertTask(Task adm);

    public int delete(int id);

    public int Update(Task adm);
}
