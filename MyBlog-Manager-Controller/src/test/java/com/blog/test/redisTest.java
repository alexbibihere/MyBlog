package com.blog.test;
import com.blog.utils.JedisClient;
import com.blog.pojo.User;
import com.blog.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by Administrator on 2017/7/11.
 */

@RunWith(value = SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext-*.xml","classpath:spring/spring-mvc.xml"})
public class redisTest {

    @Autowired
    private JedisClient jedisClient;

    @Autowired
    private UserService userService;

    @Test
    public void testString(){

        //String s = jedisClient.set("name", "xiaomling");

        String name = jedisClient.get("name");

        System.out.print(name);
    }

    @Test
    public void testUsers(){

        List<User> userList = userService.findAllUser();

        System.out.print(userList.toString());
    }
}