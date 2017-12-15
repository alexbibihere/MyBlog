package com.blog.service;

import com.blog.pojo.Article;
import com.blog.utils.PageResult;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/14.
 */
public interface ArticleService {
    Integer insertArticle(Article article);
    PageResult<Article> selectByAll(Integer pageNo,Integer pageSize);
    void deleteArticle(Integer id);
    Article getArticle(Integer id);
    void updateArticle(Article article);
    int countByParams(Map<String, Object> params);

    List<Article> selectByParams(Map<String, Object> params);
}
