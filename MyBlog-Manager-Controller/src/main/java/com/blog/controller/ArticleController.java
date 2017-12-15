package com.blog.controller;

import com.blog.pojo.Article;
import com.blog.service.ArticleService;
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

/**
 * Created by Administrator on 2017/7/14.
 *丁俊
 */
@Controller
@RequestMapping("/article")
public class ArticleController extends BaseController{

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private ArticleService articleService;

    /**
     * 增加文章的信息
     * @param article
     * @param model
     * @return
     */
    @RequestMapping("/add")
    public String addArticle(Article article, Model model, HttpServletRequest request){

        String titleImages = request.getParameter("titleImages");

        System.out.print("titleImages:"+titleImages);

        Integer count = articleService.insertArticle(article);

        return "article"; }

    ;

    /**
     * 查询所有文章的信息
     * @return
     */
    @RequestMapping("/select")
    @ResponseBody
    public String selectByAll(Integer pageNo,Integer pageSize){
        logger.info("分页查询用户信息列表请求入参：pageNumber{},pageSize{}", pageNo,pageSize);
        try {
            PageResult<Article> articleList = articleService.selectByAll(pageNo, pageSize);
            int count = articleService.countByParams(null);
            articleList.setTotal(count);
            return responseSuccess(articleList);
        } catch (Exception e) {
            return responseFail(e.getMessage());
        }
    }

    /**
     * 删除文章
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public String deleteArticle(String id){
        articleService.deleteArticle(Integer.parseInt(id));
        return "article";
    }

    /**
     * 修改文章的信息之前，查询单个的文章信息，回显
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/get")
    public String getArticle(String id,Model model){
        Article article = articleService.getArticle(Integer.parseInt(id));
        model.addAttribute("article",article);
        return "update-article";
    }

    /**
     * 修改文章
     * @param article
     * @return
     */
    @RequestMapping("/update")
    public String modifyArticle(Article article,String id){
        article.setId(Integer.parseInt(id));
        articleService.updateArticle(article);
        return "article";
    }
}
