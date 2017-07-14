package com.blog.service.impl;

import com.blog.dao.ArticleMapper;
import com.blog.pojo.Article;
import com.blog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/7/14.
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public Integer insertArticle(Article article) {

        Integer count = articleMapper.insertArticle(article);

        return count;
    }

    @Override
    public List<Article> findArticleList(Article article) {

        List<Article> articleList = articleMapper.findArticleList(article);

        return articleList;
    }
}
