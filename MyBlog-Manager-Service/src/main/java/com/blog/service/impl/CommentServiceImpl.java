package com.blog.service.impl;

import com.blog.dao.CommentMapper;
import com.blog.pojo.Comment;
import com.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by yandeguang on 2017/7/18/0018.
 */
@Service
@Transactional
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentMapper commentMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        int rows = commentMapper.deleteByPrimaryKey(id);
        if (rows > 0) {
            System.out.println("删除成功:deleteById");
        }
        return rows;
    }

    @Override
    public int insert(Comment record) {
        int id = commentMapper.insert(record);
        return id;
    }
    @Override
    public int insertSelective(Comment record) {
        record.setModifiedTime(new Date());
        record.setCreateTime(new Date());
        int id = commentMapper.insertSelective(record);
        return id;
    }

    @Override
    public Comment selectByPrimaryKey(Long id) {
        Comment Comment = commentMapper.selectByPrimaryKey(id);
        return Comment;
    }

    @Override
    public int updateByPrimaryKeySelective(Comment record) {
        int rows = commentMapper.updateByPrimaryKeySelective(record);
        return rows;
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(Comment record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Comment record) {
        int rows = commentMapper.updateByPrimaryKey(record);
        return rows;
    }

    public List<Comment> selectByParams(Map<String, Object> params) {
        List<Comment> commentList = commentMapper.selectByParams(params);
        return commentList;
    }

    @Override
    public int countByParams(Map params) {
        int count = commentMapper.countByParams(params);
        return count;
    }
}
