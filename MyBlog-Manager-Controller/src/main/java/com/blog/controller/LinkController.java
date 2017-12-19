package com.blog.controller;

import com.alibaba.fastjson.JSONObject;
import com.blog.pojo.Link;
import com.blog.pojo.Msg;
import com.blog.service.LinkService;
import com.blog.utils.PageResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
  *  @Author: Yan
  *  @Description: 友情链接相关
  *  @Date: 2017/12/15/0015
  */
@Controller
@RequestMapping("/link")
public class LinkController extends BaseController{
    private Logger logger = Logger.getLogger(LinkController.class);
    @Resource
    private LinkService linkService;


    /**
     * 添加友情链接
     */
    @RequestMapping("/add")
    public  String addLink(Link link){
        linkService.insertSelective(link);
        return "flink";
    }

    /**
     * 查询日志列表
     */
    @RequestMapping("/getAllLink")
    @ResponseBody
    public Msg getUsers(@RequestParam(value="pn",defaultValue="1")Integer pn){
        PageHelper.startPage(pn, 5);
        List<Link> logList=linkService.selectByParams(null);
        PageInfo<Link> pageInfo = new PageInfo<>(logList,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

   /* *//**
     * 查询所有友情链接
     *//*
    @RequestMapping("/getAllLink")
    @ResponseBody
    public String getAllLink(Integer pageNo,Integer pageSize) {
        try {
            PageResult<Link> linkList =linkService.findList(pageNo,pageSize);
            return responseSuccess(linkList);
        } catch (Exception e) {
            return responseFail(e.getMessage());
        }
    }*/

    /**
     * 根据id查询单条数据
     */
    @RequestMapping("/getLink")
    public String getLink(int id, HttpServletRequest request, Model model) {
        model.addAttribute("link", linkService.selectByPrimaryKey(id));
        request.setAttribute("link", linkService.selectByPrimaryKey(id));
        return "update-flink";
    }

    /**
     * 友情链接删除
     */
    @RequestMapping("/delete")
    public String delete(int id) {
        Link link = linkService.selectByPrimaryKey(id);
        logger.info("删除了" + link);
        linkService.deleteByPrimaryKey(id);
        return "redirect:/Link/getAllLink";
    }


    /**
     * 更新友情链接
     */
    @RequestMapping("/update")
    public String updateLink(Link link, HttpServletRequest request, Model model) {
        link.setModifiedTime(new Date());
        linkService.updateByPrimaryKey(link);
        Link tblLink = linkService.selectByPrimaryKey(link.getId());
        System.out.println("修改成功");
        request.setAttribute("tblLink", tblLink);
        model.addAttribute("tblLink", tblLink);
        return "redirect:/Link/getAllLink";
    }
}
