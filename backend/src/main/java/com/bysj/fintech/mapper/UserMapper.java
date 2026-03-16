package com.bysj.fintech.mapper;

import com.bysj.fintech.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {

    @Select("""
            SELECT id, username, password, nickname, email, status, created_at AS createdAt, updated_at AS updatedAt
            FROM sys_user
            WHERE username = #{username}
            LIMIT 1
            """)
    User findByUsername(String username);

    @Insert("""
            INSERT INTO sys_user (username, password, nickname, email, status)
            VALUES (#{username}, #{password}, #{nickname}, #{email}, #{status})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(User user);
}
