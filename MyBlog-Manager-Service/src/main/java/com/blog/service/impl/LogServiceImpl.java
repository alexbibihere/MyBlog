package com.blog.service.impl;

import com.blog.dao.LogMapper;
import com.blog.pojo.Log;
import com.blog.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by yandeguang on 2017/7/17/0017.
 */
@Service
@Transactional
public class LogServiceImpl implements LogService {
    @Autowired
    private LogMapper logMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        int rows = logMapper.deleteByPrimaryKey(id);
        if (rows > 0) {
            System.out.println("删除成功:deleteById");
        }
        return rows;
    }


    public int insert(Log record) {
        int id = logMapper.insert(record);
        return id;
    }

    public int insertSelective(Log record) {
        record.setModifiedTime(new Date());
        record.setCreateTime(new Date());
        int id = logMapper.insertSelective(record);
        return id;
    }


    public Log selectByPrimaryKey(Long id) {
        Log log = logMapper.selectByPrimaryKey(id);
        return log;
    }


    public int updateByPrimaryKeySelective(Log record) {
        int rows = logMapper.updateByPrimaryKeySelective(record);
        return rows;
    }


    public int updateByPrimaryKeyWithBLOBs(Log record) {
        return 0;
    }


    public int updateByPrimaryKey(Log record) {
        int rows = logMapper.updateByPrimaryKey(record);
        return rows;
    }

    public List<Log> selectByParams(Map<String, Object> params) {
        List<Log> logList = logMapper.selectByParams(params);
        return logList;
    }

    public int countByParams(Map params) {
        int count = logMapper.countByParams(params);
        return count;
    }
}
