package com.blog.controller;

import com.blog.pojo.Article;
import com.blog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Administrator on 2017/7/14.
 */
@Controller
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping("/Article/add")
    public String addArticle(Article article, Model model){

        Integer count = articleService.insertArticle(article);

        return "redirect:/Article/findList";
    };

    @RequestMapping("/Article/findList")
    public String findArticleList(Model model,Article article){

        List<Article> articleList = articleService.findArticleList(article);

        model.addAttribute("articleList",articleList);

        return "article";
    }
}
