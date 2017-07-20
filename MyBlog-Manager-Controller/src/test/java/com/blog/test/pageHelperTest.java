package com.blog.test;

import com.blog.pojo.Article;
import com.blog.service.ArticleService;
import com.blog.utils.PageResult;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by Administrator on 2017/7/17.
 */
@RunWith(value = SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext-*.xml","classpath:spring/spring-mvc.xml"})
public class pageHelperTest {

    @Autowired
    private ArticleService articleService;

    @Test
    public void selectAll(){

        PageResult<Article> list = articleService.findArticleList(1, 4);

        System.out.print(list);
    }
}
