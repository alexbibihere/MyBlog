package com.blog.controller;

import com.alibaba.fastjson.JSONObject;
import com.blog.pojo.Link;
import com.blog.service.LinkService;
import com.blog.utils.PageResult;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by yandeguang on 2017/7/20/0020.
 * 友情链接相关
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
        link.setModifiedTime(new Date());
        linkService.insertSelective(link);
        Link link1 = linkService.selectByPrimaryKey(link.getId());
        System.out.println(JSONObject.toJSONString(link1));
        //model.addAttribute("Link1",Link1);
        return "flink";
    }


    /**
     * 查询所有友情链接
     */
    @RequestMapping("/getAllLink")
    @ResponseBody
    public String getAllLink(Integer pageNo,Integer pageSize) {
        try {
            PageResult<Link> linkList =linkService.findList(pageNo,pageSize);
            return responseSuccess(linkList);
        } catch (Exception e) {
            return responseFail(e.getMessage());
        }
    }

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
