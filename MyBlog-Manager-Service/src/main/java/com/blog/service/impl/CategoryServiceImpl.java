package com.blog.service.impl;

import com.blog.dao.CategoryMapper;
import com.blog.pojo.Category;
import com.blog.service.CategoryService;
import com.blog.utils.BeanUtil;
import com.blog.utils.PageResult;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by yandeguang on 2017/7/22/0022.
 */
@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        int rows = categoryMapper.deleteByPrimaryKey(id);
        if (rows > 0) {
            System.out.println("删除成功:deleteById");
        }
        return rows;
    }

    @Override
    public PageResult<Category> selectByAll(Integer pageNo, Integer pageSize) {

        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?10:pageSize;
        //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
        PageHelper.startPage(pageNo,pageSize);
        return BeanUtil.toPageResult(categoryMapper.selectByAll());
    }


    @Override
    public int insert(Category record) {
        record.setModifiedTime(new Date());
        record.setCreateTime(new Date());
        int id = categoryMapper.insert(record);
        return id;
    }
    @Override
    public int insertSelective(Category record) {
        record.setModifiedTime(new Date());
        record.setCreateTime(new Date());
        int id = categoryMapper.insertSelective(record);
        return id;
    }

    @Override
    public Category selectByPrimaryKey(Integer id) {
        Category Category = categoryMapper.selectByPrimaryKey(id);
        return Category;
    }

    @Override
    public int updateByPrimaryKeySelective(Category record) {
        int rows = categoryMapper.updateByPrimaryKeySelective(record);
        return rows;
    }

    @Override
    public int updateByPrimaryKey(Category record) {
        int rows = categoryMapper.updateByPrimaryKey(record);
        System.out.println(rows);
        return rows;
    }
    @Override
    public List<Category> selectByParams(Map<String, Object> params) {
        List<Category> categoryList = categoryMapper.selectByParams(params);

        return categoryList;
    }

    @Override
    public int countByParams(Map params) {
        int count = categoryMapper.countByParams(params);
        return count;
    }
}
