package com.blog.controller;

import com.baidu.ueditor.ActionEnter;
import com.baidu.ueditor.define.ActionMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/**
 * Created by Administrator on 2017/7/21.
 * ueditor 核心类
 */
@Controller
@RequestMapping("/upload")
public class UeditorController {

    @RequestMapping(value = "/config", method = RequestMethod.GET)
    public @ResponseBody
    String ueUpload(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
        //这里就是把controller.jsp代码copy下来
        request.setCharacterEncoding( "utf-8" );
        response.setHeader("Content-Type" , "text/html");
        String roolPath = request.getSession().getServletContext().getRealPath("/");
        String configStr = new ActionEnter(request, roolPath).exec();
        return configStr;
    }
}
