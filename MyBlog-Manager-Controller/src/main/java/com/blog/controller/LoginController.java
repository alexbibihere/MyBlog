package com.blog.controller;

import com.blog.pojo.Loginlog;
import com.blog.pojo.User;
import com.blog.service.LogService;
import com.blog.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author: yan
 * @Date: 2017/12/19/0019 17:58
 * @Description: 登录相关
 */
@RequestMapping("/login")
@Controller
public class LoginController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private UserService userService;
    @Autowired
    private LogService logService;

    /**
     * 管理员登录
     * @param username
     * @param password
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/login")
    public String login(@Param("user") String username, @Param("password") String password, HttpServletRequest request, Model model) throws Exception {
        Map<String, Object> params = new HashMap<String, Object>();
        User user = userService.checkLogin(username, password);
        request.getSession().setAttribute("userInfo",user);
        if (user != null) {
            Loginlog log = new Loginlog();
            log.setUserId(user.getId());
            log.setLoginTime(new Date());
            log.setUsername(user.getUsername());
            log.setIpAddress(getIpAddr(request));
            logService.insertSelective(log);
            model.addAttribute("user", user);
            return "index";
        }
        return "login";
    }




    /**
     * 获取当前网络ip
     * @param request
     * @return
     */
    public String getIpAddr(HttpServletRequest request) {
        String ipAddress = request.getHeader("x-forwarded-for");
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
            if (ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")) {
                //根据网卡取本机配置的IP
                InetAddress inet = null;
                try {
                    inet = InetAddress.getLocalHost();
                } catch (UnknownHostException e) {
                    e.printStackTrace();
                }
                ipAddress = inet.getHostAddress();
            }
        }
        //对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
        if (ipAddress != null && ipAddress.length() > 15) { //"***.***.***.***".length() = 15
            if (ipAddress.indexOf(",") > 0) {
                ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
            }
        }
        return ipAddress;
    }
}
