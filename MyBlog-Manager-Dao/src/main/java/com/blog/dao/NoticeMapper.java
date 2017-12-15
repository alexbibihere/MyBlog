package com.blog.dao;


import com.blog.pojo.Notice;

import java.util.List;
import java.util.Map;

public interface NoticeMapper {
    int deleteByPrimaryKey(int id);

    int insert(Notice record);

    int insertSelective(Notice record);

    List<Notice> selectByAll();

    Notice selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKeyWithBLOBs(Notice record);

    int updateByPrimaryKey(Notice record);

    List<Notice> selectByParams(Map<String, Object> params);

    int countByParams(Map<String, Object> params);

}