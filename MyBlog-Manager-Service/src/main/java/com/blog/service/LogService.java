package com.blog.service;

import com.blog.pojo.Loginlog;

import java.util.List;
import java.util.Map;

/**
 * Created by yandeguang on 2017/7/17/0017.
 */
public interface LogService {
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
