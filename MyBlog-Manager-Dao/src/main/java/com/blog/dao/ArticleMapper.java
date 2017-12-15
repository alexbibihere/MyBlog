package com.blog.dao;

import com.blog.pojo.Article;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/14.
 */
public interface ArticleMapper {

    Integer insertArticle(Article article);

    List<Article> selectByAll();

    void deleteArticle(Article article);

    Article getArticle(Integer id);

    void updateArticle(Article article);

    List<Article> selectByParams(Map<String, Object> params);

    int countByParams(Map<String, Object> params);
}
