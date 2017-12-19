package com.blog.service.impl;

import com.blog.dao.LoginlogMapper;
import com.blog.pojo.Loginlog;
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
    private LoginlogMapper logMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        int rows = logMapper.deleteByPrimaryKey(id);
        if (rows > 0) {
            System.out.println("删除成功:deleteById");
        }
        return rows;
    }

    @Override
    public int insert(Loginlog record) {
        int id = logMapper.insert(record);
        return id;
    }
    @Override
    public int insertSelective(Loginlog record) {
        record.setModifiedTime(new Date());
        record.setCreateTime(new Date());
        int id = logMapper.insertSelective(record);
        return id;
    }

    @Override
    public Loginlog selectByPrimaryKey(Long id) {
        Loginlog log = logMapper.selectByPrimaryKey(id);
        return log;
    }

    @Override
    public int updateByPrimaryKeySelective(Loginlog record) {
        int rows = logMapper.updateByPrimaryKeySelective(record);
        return rows;
    }



    @Override
    public int updateByPrimaryKey(Loginlog record) {
        int rows = logMapper.updateByPrimaryKey(record);
        return rows;
    }
    @Override
    public List<Loginlog> selectByParams(Map<String, Object> params) {
        List<Loginlog> logList = logMapper.selectByParams(params);
        return logList;
    }

    @Override
    public int countByParams(Map params) {
        int count = logMapper.countByParams(params);
        return count;
    }



    @Override
    public Loginlog selectByLast(Long id) {
        Loginlog logList = logMapper.selectByLast(id);
        return logList;
    }
}
