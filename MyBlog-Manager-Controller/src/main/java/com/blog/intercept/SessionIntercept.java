package com.blog.intercept;

import com.blog.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author: yan
 * @Date: 2017/12/19/0019 18:20
 * @Description: session 拦截
 */
public class SessionIntercept implements HandlerInterceptor{

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

        String uri =request.getRequestURI();
        if (uri.indexOf("login")>0){
            return  true;
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userInfo");
        if (user !=null){
            return  true;
        }
        //转发登录页面
        request.getRequestDispatcher("login").forward(request,response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
