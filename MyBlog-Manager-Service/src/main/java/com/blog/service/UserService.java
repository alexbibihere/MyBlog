package com.blog.service;

import com.blog.pojo.User;
import com.blog.utils.PageResult;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/12.
 */
public interface UserService {

    Integer insertSelective(User user);

    Integer insert(User user);

    PageResult<User> selectByAll(Integer pageNo, Integer pageSize);

    void deleteUser(Integer id);

    void updateUser(User user);

    int updateByPrimaryKey(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectByParams(Map<String, Object> params);

    int countByParams(Map<String, Object> params);

    User checkLogin(String username, String password);

    User selectByNick(String username) ;
}
