package com.blog.service;

import com.blog.pojo.Link;
import com.blog.utils.PageResult;

import java.util.List;
import java.util.Map;

/**
 * Created by yandeguang on 2017/7/22/0022.
 */
public interface LinkService {

    int deleteByPrimaryKey(Integer id);

    int insert(Link record);

    int insertSelective(Link record);

    Link selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(Link record);

    int updateByPrimaryKey(Link record);

    List<Link> selectByParams(Map<String, Object> params);

    int countByParams(Map<String, Object> params);

}
