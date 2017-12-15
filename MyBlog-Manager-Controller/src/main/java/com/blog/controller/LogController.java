package com.blog.controller;

import com.alibaba.fastjson.JSONObject;
import com.blog.pojo.Log;
import com.blog.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yandeguang on 2017/7/17/0017.
 * 登录日志相关
 */
@Controller
@RequestMapping("/log")
public class LogController {
    @Autowired
    private LogService logService;


    /**
     * 添加日志
     */
    @RequestMapping("/add")
    public  String addlog(Log log){

        logService.insert(log);
        Log log1 = logService.selectByPrimaryKey(log.getId());
        System.out.println(JSONObject.toJSONString(log1));
        //model.addAttribute("log1",log1);
        return "redirect:/log/getAlllog";
    }



    /**
     * 查询所有日志
     */
    @RequestMapping(value = "/getAllLog",method = RequestMethod.GET)
    public String getAlllog(HttpServletRequest request, Model model) {
        Map<String,Object> params = new HashMap<String,Object>();
        List<Log> logList = logService.selectByParams(params);
        model.addAttribute("logList", logList);
        request.setAttribute("logList", logList);
        return "log";
    }

    /**
     * 根据id查询单条数据
     */
    @RequestMapping("/getLog")
    public String getlog(Long id, HttpServletRequest request, Model model) {
        model.addAttribute("log", logService.selectByPrimaryKey(id));
        request.setAttribute("log", logService.selectByPrimaryKey(id));
        return "edit-log";
    }
/*

    */
/**
     * 日志删除
     *//*

    @RequestMapping("/delete")
    public String delete(Long id) {
        Log log = logService.selectByPrimaryKey(id);
        logService.updateByPrimaryKey(log);
        return "redirect:/log/getAlllog";
    }
*/


    
}
