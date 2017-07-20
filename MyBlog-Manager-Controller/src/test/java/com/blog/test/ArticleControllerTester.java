package com.blog.test;

import com.blog.controller.ArticleController;
import com.blog.pojo.Article;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by Administrator on 2017/7/15.
 */
@RunWith(value = SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext-*.xml","classpath:spring/spring-mvc.xml"})
public class ArticleControllerTester {
    @Autowired
    private ArticleController articleController;

      @Test
    public void testNotice() {
        Article article = new Article();
     /*   notice.setTitle("1");
        notice.setDescription("1");
        notice.setContent("1");
        notice.setCreateTime(new Date());
        notice.setVisibility(true);
        notice.setStatus(true);
        notice.setModifiedTime(new Date());
        notice.setKeywords("1");

        articleController.addArticle(notice);*/
        //a.out.println(notice1);

    }
}
