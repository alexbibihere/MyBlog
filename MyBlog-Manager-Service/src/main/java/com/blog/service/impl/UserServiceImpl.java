package com.blog.service.impl;

import com.blog.dao.UserMapper;
import com.blog.service.UserService;
import com.blog.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/7/12.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> findAllUser() {
        List<User> findAllUser = userMapper.findUserAll();
        System.out.print("查询到了"+findAllUser);
        return findAllUser;

    }
}
