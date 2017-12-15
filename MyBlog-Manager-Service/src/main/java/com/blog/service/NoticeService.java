package com.blog.service;


import com.blog.pojo.Notice;
import com.blog.utils.PageResult;
import com.sun.tools.corba.se.idl.constExpr.Not;

import java.util.List;
import java.util.Map;

/**
 *
 * @author yandeguang
 * @date 2017/7/11/0011
 */
public interface NoticeService {
    int deleteByPrimaryKey(Integer id);

    int insert(Notice record);

    int insertSelective(Notice record);

    PageResult<Notice> selectByAll(Integer pageNo, Integer pageSize);

    Notice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKeyWithBLOBs(Notice record);

    int updateByPrimaryKey(Notice record);

    List<Notice> selectByParams(Map<String, Object> params);

    int countByParams(Map<String, Object> params);

}
