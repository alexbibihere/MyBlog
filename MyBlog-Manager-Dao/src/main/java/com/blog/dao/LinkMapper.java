package com.blog.dao;

import com.blog.pojo.Link;

import java.util.List;
import java.util.Map;

public interface LinkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Link record);

    int insertSelective(Link record);

    List<Link> selectByAll();

    Link selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Link record);

    int updateByPrimaryKey(Link record);

    List<Link> selectByParams(Map<String, Object> params);

    int countByParams(Map<String, Object> params);
}