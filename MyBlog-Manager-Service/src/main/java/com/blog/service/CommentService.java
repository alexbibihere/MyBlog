package com.blog.service;

import com.blog.pojo.Comment;

import java.util.List;
import java.util.Map;

/**
 * Created by yandeguang on 2017/7/18/0018.
 */
public interface CommentService {
    int deleteByPrimaryKey(Long id);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKeyWithBLOBs(Comment record);

    int updateByPrimaryKey(Comment record);

    int countByParams(Map<String, Object> params);

    List<Comment> selectByParams(Map<String, Object> params);
}
