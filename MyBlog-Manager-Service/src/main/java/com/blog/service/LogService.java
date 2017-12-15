package com.blog.service;

import com.blog.pojo.Log;

import java.util.List;
import java.util.Map;

/**
 * Created by yandeguang on 2017/7/17/0017.
 */
public interface LogService {
    int deleteByPrimaryKey(Long id);

    int insert(Log record);

    int insertSelective(Log record);

    Log selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKey(Log record);

    List<Log> selectByParams(Map<String, Object> params);

    int countByParams(Map<String, Object> params);
}
