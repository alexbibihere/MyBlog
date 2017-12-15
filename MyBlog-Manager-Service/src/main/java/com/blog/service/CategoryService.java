package com.blog.service;

import com.blog.pojo.Category;
import com.blog.utils.PageResult;

import java.util.List;
import java.util.Map;

/**
 * Created by yandeguang on 2017/7/22/0022.
 */
public interface CategoryService {
    int deleteByPrimaryKey(Integer id);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Category record);

    PageResult<Category> selectByAll(Integer pageNo, Integer pageSize);

    int updateByPrimaryKey(Category record);

    List<Category> selectByParams(Map<String, Object> params);

    int countByParams(Map<String, Object> params);
}
