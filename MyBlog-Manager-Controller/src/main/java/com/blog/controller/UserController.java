package com.blog.controller;

import com.alibaba.fastjson.JSONObject;
import com.blog.pojo.Msg;
import com.blog.pojo.User;
import com.blog.service.UserService;
import com.blog.utils.PageResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;
import java.util.Map;


/**
 * Created by Administrator on 2017/7/12.
 * 丁俊
 */
@RequestMapping("/user")
@Controller
public class UserController extends  BaseController{
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private UserService userService;

    /**
     * 增加用户
     * @param user
     * @return
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public Msg addNotice(User user){
        userService.insertSelective(user);
        return  Msg.success();
    }



    /**
     * 查询用户列表
     */
    @RequestMapping("/getAllUser")
    public String getUsers(Model model) {
        List<User> userList = userService.selectByParams(null);
        for(User user:userList){
            if (user.getIsDeleted() !=1){
                model.addAttribute("userList", userList);
            }
        }
       int count= userService.countByParams(null);
        model.addAttribute("count",count);
        return "manage-user";
    }



    /**
     * 删除用户
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public String deleteUser(Integer id){
        User user = userService.selectByPrimaryKey(id);
        user.setIsDeleted(1);
        userService.updateByPrimaryKey(user);
        return "manage-user";
    }

  /*  *//**
     * 修改用户的信息之前，查询单个的文章信息，回显
     * @param id
     * @param model
     * @return
     *//*
    @RequestMapping("/getUser")
    public String getUser(int id,Model model){
        User user = userService.getUser(id);
        model.addAttribute("user",user);
        return "update-user";
    }*/

    /**
     * 根据id返回单条公告信息
     */
    @RequestMapping("/getUser")
    @ResponseBody
    public Msg getNotice(Integer id) {
        System.out.println(id);
        User user = userService.selectByPrimaryKey(id);
        return Msg.success().add("user",user);
    }


    /**
     * 修改文章
     * @param user
     * @return
     */
    @RequestMapping("/update")
    public String modifyUser(User user,String id){
        user.setId(Integer.parseInt(id));
        userService.updateUser(user);
        return "User";
    }

}
