package com.blog.controller;

import com.alibaba.fastjson.JSONObject;
import com.blog.pojo.Loginlog;
import com.blog.pojo.Msg;
import com.blog.service.LogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yandeguang on 2017/7/17/0017.
 * 登录日志相关
 */
@Controller
@RequestMapping("/log")
public class LoginlogController {
    @Autowired
    private LogService logService;


    /**
     * 添加日志
     */
    @RequestMapping("/add")
    public  String addlog(Loginlog loginlog){

        logService.insert(loginlog);
        Loginlog log1 = logService.selectByPrimaryKey(loginlog.getId());
        System.out.println(JSONObject.toJSONString(log1));
        //model.addAttribute("log1",log1);
        return "redirect:/log/getAlllog";
    }


    /**
     * 查询日志列表
     */
    @RequestMapping("/getLog")
    @ResponseBody
    public Msg getUsers(@RequestParam(value="pn",defaultValue="1")Integer pn){
        PageHelper.startPage(pn, 5);
        List<Loginlog> logList=logService.selectByParams(null);
        PageInfo<Loginlog> pageInfo = new PageInfo<>(logList,5);
        return Msg.success().add("pageInfo",pageInfo);
    }
    /**
     * 获取登录信息
     * @return
     */
    @RequestMapping(value = "/getLoginLog",method = RequestMethod.GET)
    @ResponseBody
    public Msg getLoginLog(Long id){
        int count = logService.countByParams(null);
        //获取上次登录次数、时间、ip
        Loginlog loginlog= logService.selectByLast(id);
        loginlog.setType(count);

        return Msg.success().add("loginlog",loginlog);
    }

/*
    *//**
     * 查询所有日志
     *//*
    @RequestMapping(value = "/getAllLog",method = RequestMethod.GET)
    public String getAlllog(HttpServletRequest request, Model model) {
        Map<String,Object> params = new HashMap<String,Object>();
        List<Loginlog> logList = logService.selectByParams(params);
        model.addAttribute("logList", logList);
        request.setAttribute("logList", logList);
        return "loginlog";
    }*/


    }
