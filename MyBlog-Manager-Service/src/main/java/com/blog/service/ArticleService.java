package com.blog.service;

import com.blog.pojo.Article;

import java.util.List;

/**
 * Created by Administrator on 2017/7/14.
 */
public interface ArticleService {
    Integer insertArticle(Article article);
    List<Article> findArticleList(Article article);
}
