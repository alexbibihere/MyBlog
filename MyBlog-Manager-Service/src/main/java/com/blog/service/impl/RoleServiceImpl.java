package com.blog.service.impl;

import com.blog.dao.RoleMapper;
import com.blog.pojo.Role;
import com.blog.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by yandeguang on 2017/7/22/0022.
 */
@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    public int deleteByPrimaryKey(Integer id) {
        int rows = roleMapper.deleteByPrimaryKey(id);
        if (rows > 0) {
            System.out.println("删除成功:deleteById");
        }
        return rows;
    }


    public int insert(Role record) {
        int id = roleMapper.insert(record);
        return id;
    }

    public int insertSelective(Role record) {
        int id = roleMapper.insertSelective(record);
        return id;
    }


    public Role selectByPrimaryKey(Integer id) {
        Role Role = roleMapper.selectByPrimaryKey(id);
        return Role;
    }


    public int updateByPrimaryKeySelective(Role record) {
        int rows = roleMapper.updateByPrimaryKeySelective(record);
        return rows;
    }


    public int updateByPrimaryKey(Role record) {
        int rows = roleMapper.updateByPrimaryKey(record);
        return rows;
    }

}
