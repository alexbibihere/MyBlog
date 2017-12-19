package com.blog.controller;


import com.blog.pojo.Loginlog;
import com.blog.pojo.Msg;
import com.blog.pojo.User;
import com.blog.service.*;
import com.blog.utils.MD5Util;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import java.util.Date;
import java.util.HashMap;
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
    @Autowired
    private ArticleService articleService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private LinkService linkService;
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
    public String login(@Param("user") String username, @Param("password") String password,HttpServletRequest request, Model model) throws Exception {
        Map<String, Object> params = new HashMap<String, Object>();
       User user = userService.checkLogin(username, password);
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
     * 检查用户名是否可用
     * @param username
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkUser")
    public Msg checkUser(@RequestParam("username")String username){
       User user = userService.selectByNick(username);
     if (user ==null){
         return Msg.success();
     }else{
      return  Msg.fail();
     }
    }

    /**
     * 增加用户
     * @param user
     * @return
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public Msg addNotice(User user){
        user.setPassword(MD5Util.MD5Encode(user.getPassword(),"utf-8"));
        userService.insertSelective(user);
        logger.info("有新用户注册", user);
        return  Msg.success();
    }

    /**
        * 查询用户列表
     */
    @RequestMapping("/getAllUser")
    @ResponseBody
    public Msg getUsers(@RequestParam(value="pn",defaultValue="1")Integer pn){
        PageHelper.startPage(pn, 5);
        List<User> user=userService.selectByParams(null);
        PageInfo<User> pageInfo = new PageInfo<>(user,5);
        return Msg.success().add("pageInfo",pageInfo);
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
        return "user";
    }

    /**
     * 获取统计数量
     * @return
     */
    @RequestMapping(value = "/getCount",method = RequestMethod.GET)
    @ResponseBody
    public Msg getCount(){
        User user = new User();
        int article =articleService.countByParams(null);
        int link=    linkService.countByParams(null);
        int comment = commentService.countByParams(null);
        user.setArticleNum(article);
        user.setIsDeleted(link);
        user.setId(comment);
        return Msg.success().add("user",user);
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
