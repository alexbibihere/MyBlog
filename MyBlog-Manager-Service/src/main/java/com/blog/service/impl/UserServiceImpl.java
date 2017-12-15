package com.blog.service.impl;

import com.blog.dao.UserMapper;
import com.blog.service.UserService;
import com.blog.pojo.User;
import com.blog.utils.BeanUtil;
import com.blog.utils.PageResult;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/12.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public Integer insertSelective(User user) {
        user.setModifiedTime(new Date());
        user.setCreateTime(new Date());
        Integer count = userMapper.insertSelective(user);

        return count;
    }

    @Override
    public Integer insert(User user) {

        Integer count = userMapper.insert(user);
        System.out.println(count);
        return count;
    }
    @Override
    public int updateByPrimaryKey(User record) {
        int rows = userMapper.updateByPrimaryKey(record);
        return rows;
    }

    @Override
    public User selectByPrimaryKey(Integer id) {
        User user = userMapper.selectByPrimaryKey(id);
        System.out.println(user);
        return user;
    }

    @Override
    public List<User> selectByParams (Map<String, Object> params){
        List<User> userList =  userMapper.selectByParams(params);
        return userList;
    }

    @Override
    public int countByParams(Map<String, Object> params) {
        int count = userMapper.countByParams(params);
        System.out.println(count);
        return count;
    }

    @Override
    public PageResult<User> selectByAll(Integer pageNo, Integer pageSize) {

        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?10:pageSize;
        //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
        PageHelper.startPage(pageNo,pageSize);
        return BeanUtil.toPageResult(userMapper.selectByAll());
    }

    @Override
    public void deleteUser(Integer id) {

        User user = new User();
        user.setId(id);
        user.setIsDeleted(1);
        userMapper.updateByPrimaryKey(user);
    }



    @Override
    public void updateUser(User user) {
        userMapper.updateByPrimaryKey(user);
    }

}
