package com.graduate.mooc.mapper;

import com.graduate.mooc.domain.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface AdminMap {
    List<Admin> findAdminByName(String name);

    List<Admin> findAdminByID(String id);

    public List<Admin> ListAdmin();

    public int insertAdmin(Admin adm);

    public int delete(int id);

    public int Update(Admin adm);
}
