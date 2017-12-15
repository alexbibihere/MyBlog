package com.blog.service.impl;

import com.blog.dao.AdminMapper;
import com.blog.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by yandeguang on 2017/7/22/0022.
 */
@Service
@Transactional
public class AdminServiceImpl {
    @Autowired
    private AdminMapper adminMapper;

    public int deleteByPrimaryKey(Integer id) {
        int rows = adminMapper.deleteByPrimaryKey(id);
        if (rows > 0) {
            System.out.println("删除成功:deleteById");
        }
        return rows;
    }


    public int insert(Admin record) {
        int id = adminMapper.insert(record);
        return id;
    }

    public int insertSelective(Admin record) {
        record.setModifiedTime(new Date());
        record.setCreateTime(new Date());
        int id = adminMapper.insertSelective(record);
        return id;
    }


    public Admin selectByPrimaryKey(Integer id) {
        Admin Admin = adminMapper.selectByPrimaryKey(id);
        return Admin;
    }


    public int updateByPrimaryKeySelective(Admin record) {
        int rows = adminMapper.updateByPrimaryKeySelective(record);
        return rows;
    }


    public int updateByPrimaryKeyWithBLOBs(Admin record) {
        return 0;
    }


    public int updateByPrimaryKey(Admin record) {
        int rows = adminMapper.updateByPrimaryKey(record);
        return rows;
    }

    public List<Admin> selectByParams(Map<String, Object> params) {
        List<Admin> adminList = adminMapper.selectByParams(params);
        return adminList;
    }


    public int countByParams(Map params) {
        int count = adminMapper.countByParams(params);
        return count;
    }
}
