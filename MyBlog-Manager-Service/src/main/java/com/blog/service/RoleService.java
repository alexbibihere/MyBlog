package com.blog.service;

import com.blog.pojo.Role;

/**
 * Created by yandeguang on 2017/7/22/0022.
 */
public interface RoleService {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
}
