package com.blog.dao;

import com.blog.pojo.Loginlog;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface LoginlogMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Loginlog record);

    int insertSelective(Loginlog record);

    Loginlog selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Loginlog record);

    int updateByPrimaryKey(Loginlog record);

    List<Loginlog> selectByParams(Map<String, Object> params);

    int countByParams(Map<String, Object> params);

    Loginlog selectByLast(Long id);
}