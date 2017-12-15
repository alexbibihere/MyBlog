package com.blog.service;

import com.blog.pojo.Permission;

/**
 * Created by yandeguang on 2017/7/22/0022.
 */
public interface PermissionService {

    int deleteByPrimaryKey(int id);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);
}
