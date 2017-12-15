package com.blog.controller;


import com.blog.pojo.Category;
import com.blog.pojo.Msg;
import com.blog.service.CategoryService;
import com.blog.utils.PageResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by yan on 2017年12月12日
 * 栏目相关
 * @author WISIG
 */
@Controller
@RequestMapping("/category")
public class CategoryController extends BaseController{

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private CategoryService categoryService;

   /* *//**
     * 增加栏目
     * @param
     * @param
     * @return
     *//*
    @RequestMapping("/add")
    public String addCategory(Category category, Model model, HttpServletRequest request){

        String titleImages = request.getParameter("titleImages");

        System.out.print("titleImages:"+titleImages);

        Integer count = categoryService.insert(category);

        return "category"; }*/


    @RequestMapping("/getAllCategory")
    public String getAllCategory( Model model, HttpServletRequest request){

        List<Category> categoryList = categoryService.selectByParams(null);
        model.addAttribute("categoryList", categoryList);
        int count= categoryService.countByParams(null);
        model.addAttribute("count",count);
        //request.setAttribute("categoryList", categoryList);
        return "category";
       }
    /**
     * 添加栏目
     * @param category
     * @return
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public Msg addCategory(Category category){
        categoryService.insertSelective(category);
        return  Msg.success();
    }

   /* *//**
     * 查询所有栏目的信息
     * @return
     *//*
    @RequestMapping("/getAllCategory")
    @ResponseBody
    public String selectByAll(Integer pageNo,Integer pageSize){
        logger.info("分页查询用户信息列表请求入参：pageNumber{},pageSize{}", pageNo,pageSize);
        try {
            PageResult<Category> categoryList = categoryService.selectByAll(pageNo, pageSize);
            return responseSuccess(categoryList);
        } catch (Exception e) {
            return responseFail(e.getMessage());
        }
    }*/

    /**
     * 删除栏目
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public String deleteCategory(String id){
        categoryService.deleteByPrimaryKey(Integer.parseInt(id));
        return "category";
    }

    /**
     * 根据id返回单条公告信息
     */
    @RequestMapping(value="/getCategory",method = RequestMethod.GET)
    @ResponseBody
    public Msg getCategory(int id) {
        Category category = categoryService.selectByPrimaryKey(id);
        return Msg.success().add("category",category);
    }

    /**
     * 修改栏目
     * @param category
     * @return
     */
    @ResponseBody
    @RequestMapping( "/update/{id}")
    public Msg updateCategory(Category category){
        categoryService.updateByPrimaryKeySelective(category);
        return Msg.success();
    }
}
