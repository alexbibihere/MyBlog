package com.blog.service.impl;

import com.blog.dao.LinkMapper;
import com.blog.pojo.Link;
import com.blog.service.LinkService;
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
public class LinkServiceImpl implements LinkService{
    @Autowired
    private LinkMapper linkMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int rows = linkMapper.deleteByPrimaryKey(id);
        if (rows > 0) {
            System.out.println("删除成功:deleteById");
        }
        return rows;
    }

    @Override
    public int insert(Link record) {
        int id = linkMapper.insert(record);
        return id;
    }

    @Override
    public int insertSelective(Link record) {
        record.setModifiedTime(new Date());
        record.setCreateTime(new Date());
        int id = linkMapper.insertSelective(record);
        return id;
    }

    @Override
    public Link selectByPrimaryKey(Integer id) {
        Link link = linkMapper.selectByPrimaryKey(id);
        return link;
    }
    @Override
    public PageResult<Link> findList(Integer pageNo, Integer pageSize) {

        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?10:pageSize;
        //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
        PageHelper.startPage(pageNo,pageSize);
        return BeanUtil.toPageResult(linkMapper.selectByAll());
    }
    @Override
    public int updateByPrimaryKeySelective(Link record) {
        int rows = linkMapper.updateByPrimaryKeySelective(record);
        return rows;
    }

    @Override
    public int updateByPrimaryKey(Link record) {
        int rows = linkMapper.updateByPrimaryKey(record);
        return rows;
    }
    @Override
    public List<Link> selectByParams(Map<String, Object> params) {
        List<Link> linkList = linkMapper.selectByParams(params);
        return linkList;
    }

    @Override
    public int countByParams(Map params) {
        int count = linkMapper.countByParams(params);
        return count;
    }
}
