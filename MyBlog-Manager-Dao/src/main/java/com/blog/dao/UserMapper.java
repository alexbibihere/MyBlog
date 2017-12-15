package com.blog.dao;

import com.blog.pojo.User;

import java.util.List;
import java.util.Map;


public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    Integer insertSelective(User record);


    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    int deleteByPrimaryKey(int id);

    List<User> selectByParams (Map<String,Object> params);
    List<User> selectByAll();
    int countByParams(Map<String, Object> params);
}