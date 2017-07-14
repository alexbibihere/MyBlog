package com.blog.dao;

import com.blog.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/7/12.
 */
@Repository
public interface UserMapper {

     List<User> findUserAll();
}
