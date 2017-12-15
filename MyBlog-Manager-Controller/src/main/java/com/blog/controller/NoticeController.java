package com.blog.controller;


import com.blog.pojo.Msg;
import com.blog.pojo.Notice;
import com.blog.service.NoticeService;
import com.blog.utils.PageResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 公告相关
 *
 *
 * @author yandeguang
 * @date 2017/7/11/0011
 */
@Controller
@RequestMapping("/notice")
public class NoticeController extends  BaseController{

    private org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(getClass());
    @Resource
    private NoticeService noticeService;

    /**
     * 添加公告
     * @param notice
     * @return
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public Msg addNotice(Notice notice){
        noticeService.insert(notice);
        return  Msg.success();
    }

    /**
     * 查询所有公告
     * @return
     */
    @RequestMapping("/getAllNotice")
    @ResponseBody
    public String getAllNotice(Integer pageNo,Integer pageSize){
        //logger.info("分页查询用户信息列表请求入参：pageNumber{},pageSize{}", pageNo,pageSize);
        try {
            PageResult<Notice> articleList = noticeService.selectByAll(pageNo, pageSize);
            return responseSuccess(articleList);
        } catch (Exception e) {
            return responseFail(e.getMessage());
        }
    }

    /**
     * 根据id返回单条公告信息
     */
    @RequestMapping("/getNotice")
    @ResponseBody
    public Msg getNotice(int id) {
        Notice noticeList = noticeService.selectByPrimaryKey(id);
        return Msg.success().add("noticeList",noticeList);
    }
   /* *//**
     * 根据id查询单条数据
     *//*
    @RequestMapping("/getNotice")
    public String getNotice(int id, HttpServletRequest request, Model model) {
        model.addAttribute("user", noticeService.selectByPrimaryKey(id));
        request.setAttribute("user", noticeService.selectByPrimaryKey(id));
        return "editNotice";
    }*/

    /**
     * 公告删除
     */
    @RequestMapping("/delete")
    public String delete(int id) {
        Notice user = noticeService.selectByPrimaryKey(id);
        user.setIsDeleted(1);
        noticeService.updateByPrimaryKey(user);
        //pojo.addAttribute("user", user);
        return "notice";
    }


    /**
     * 更新公告
     */
    @RequestMapping("/update")
    public String updateNotice(Notice notice, HttpServletRequest request, Model model) {
        noticeService.updateByPrimaryKey(notice);
        Notice tblNotice = noticeService.selectByPrimaryKey(notice.getId());
        request.setAttribute("tblNotice", tblNotice);
        model.addAttribute("tblNotice", tblNotice);
        return "redirect:/Notice/getAllNotice";
    }


}