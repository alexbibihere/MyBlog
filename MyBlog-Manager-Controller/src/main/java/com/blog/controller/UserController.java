package com.blog.controller;

import com.alibaba.fastjson.JSONObject;
import com.blog.pojo.User;
import com.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Administrator on 2017/7/12.
 * 丁俊
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/users")
    public String findUsers(){

        List<User> userList = userService.findAllUser();
        System.out.println(JSONObject.toJSONString(userList));
        return "";
    }

}
