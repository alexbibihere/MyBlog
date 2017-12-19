package com.blog.service.impl;


import com.blog.dao.NoticeMapper;
import com.blog.pojo.Notice;
import com.blog.service.NoticeService;
import com.blog.utils.BeanUtil;
import com.blog.utils.PageResult;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by yandeguang on 2017/7/11/0011.
 */
@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int rows = noticeMapper.deleteByPrimaryKey(id);
        if (rows > 0) {
            System.out.println("删除成功:deleteById");
        }
        return rows;
    }

    @Override
    public int insert(Notice record) {
        int id = noticeMapper.insert(record);
        return id;
    }
    @Override
    public int insertSelective(Notice record) {
        int id = noticeMapper.insertSelective(record);
        return id;
    }

    @Override
    public PageResult<Notice> selectByAll(Integer pageNo, Integer pageSize) {

        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?10:pageSize;
        //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
        PageHelper.startPage(pageNo,pageSize);
        return BeanUtil.toPageResult(noticeMapper.selectByAll());
    }

    @Override
    public Notice selectByPrimaryKey(Integer id) {
        Notice notice = noticeMapper.selectByPrimaryKey(id);
        return notice;
    }

    @Override
    public int updateByPrimaryKeySelective(Notice record) {
        int rows = noticeMapper.updateByPrimaryKeySelective(record);
        return rows;
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(Notice record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Notice record) {
        int rows = noticeMapper.updateByPrimaryKey(record);
        return rows;
    }
    @Override
    public List<Notice> selectByParams(Map<String, Object> params) {
        List<Notice> noticeList = noticeMapper.selectByParams(params);
        System.out.println("根据参数查询成功:selectByParams");
        return noticeList;
    }

    @Override
    public int countByParams(Map<String, Object> params) {
        int count = noticeMapper.countByParams(params);
        return count;
    }

    @Override
    public Notice selectByLast() {
        Notice notice = noticeMapper.selectByLast();
        return notice;
    }
}
