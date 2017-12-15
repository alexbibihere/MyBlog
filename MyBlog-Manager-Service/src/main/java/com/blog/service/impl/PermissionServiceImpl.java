package com.blog.service.impl;

import com.blog.dao.PermissionMapper;
import com.blog.pojo.Permission;
import com.blog.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by yandeguang on 2017/7/22/0022.
 */
@Service
@Transactional
public class PermissionServiceImpl implements PermissionService{
    @Autowired
    private PermissionMapper permissionMapper;


    public int deleteByPrimaryKey(int id) {
        int rows = permissionMapper.deleteByPrimaryKey(id);
        if (rows > 0) {
            System.out.println("删除成功:deleteById");
        }
        return rows;
    }


    public int insert(Permission record) {
        int id = permissionMapper.insert(record);
        return id;
    }

    public int insertSelective(Permission record) {
        int id = permissionMapper.insertSelective(record);
        return id;
    }


    public Permission selectByPrimaryKey(int id) {
        Permission permission = permissionMapper.selectByPrimaryKey(id);
        return permission;
    }


    public int updateByPrimaryKeySelective(Permission record) {
        int rows = permissionMapper.updateByPrimaryKeySelective(record);
        return rows;
    }


    public int updateByPrimaryKeyWithBLOBs(Permission record) {
        return 0;
    }


    public int updateByPrimaryKey(Permission record) {
        int rows = permissionMapper.updateByPrimaryKey(record);
        return rows;
    }


}
