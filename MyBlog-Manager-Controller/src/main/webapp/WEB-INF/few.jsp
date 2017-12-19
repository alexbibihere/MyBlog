<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <c:set var="BASE" value="${pageContext.request.contextPath}"/>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <title>黄新宇的时光盒</title>
    <meta http-equiv="Cache-Control" content="no-cache,no-transform,no-siteapp" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link rel="shortcut icon" type="image/x-icon" href="${BASE}/www/images/ico.ico" media="screen" />
    <link rel="stylesheet" href="${BASE}/www/css/userinfo/userinfo_index1.css">
    <link rel="stylesheet" href="${BASE}/www/css/userinfo/userinfo_index2.css">
    <link type="text/css" rel='stylesheet' href="${BASE}/www/css/showDialog/showDialog.css">
    <!-- 头部和脚步 -->
    <link rel='stylesheet' id='_bootstrap-css'  href='${BASE}/www/css/bootstrap.min.css' type='text/css' media='all' />
    <link rel='stylesheet' id='_main-css'  href='${BASE}/www/css/main_1.css' type='text/css' media='all' />
    <!--  end -->
    <link href="${BASE}/www/css/page/common.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="${BASE}/www/css/userinfo/userinfo_articlelist.css" type="text/css" /><!--    文博样式 -->
    <script src="${BASE}/www/js/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${BASE}/www/js/page/pagenav.js"></script>
    <style type="text/css"><!-- 标签 -->
    .b-tag:hover {
        background-color: #e26228; }

    .f-tag {
        color: #898989;
        font-size: 0.92308em;
        line-height: 1.2;
    }
    .f-tag:hover {
        color: #fff; }

    .b-tag {
        background-color: #f5f5f5;
        padding: 7px 10px;
        margin: 5px 6px 5px 0;
        border-radius: 3px;
        display: inline-block;
    }
    .b-tag:hover {
        background-color: #1DA7E8; }

    .cur{
        color: #fff;
        background-color: #1DA7E8;
    }

    .notice{
        background-color: #f5f5f5;
        padding: 7px 10px;
        margin: 5px 6px 5px 0;
        border-radius: 3px;
        display: inline-block;
        width: 100%;
        height: 150px;
    }
    </style>

</head>
<body>
<%--
<input type="hidden" id="blogId" value="${articleList.id}"/>
--%>

<%@ include file="head.jsp"%>
<%@ include file="userinfo_head.jsp"%>
<div class="page-content">
    <div id="content" class="right_sidebar">
        <div class="inner">
            <div class="general_content">
                <div class="main_content">
                    <!-- 文章列表 -->
                    <div class="block_blog_1">
                        <c:forEach var="ar" items="${articleList}">
                            <article class="blog_post">
                                <div class="tail"></div>
                                <h4 class="title" style="border-left: 5px solid #1fa6e6;"><a style="margin-left: 3px;" href="${BASE}/article/detail/${ar.id}">${ar.title}</a></h4>
                                <div><c:if test="${not empty articleList}"><a href="${BASE}/backStage/addArticle/${ar.id}">编辑</a></c:if></div>
                                <div><c:if test="${not empty articleList}"><a class="delart" data-id="${ar.id}">删除</a></c:if></div>
                                <div class="info">
                                    <div class="date"><p>${ar.createTime}</p></div>
                                    <div class="r_part">
                                        <a class="views">${ar.articleColumn}</a>
                                        <a  class="comments">${ar.keyword}</a>
                                    </div>
                                </div>
                                <div class="content_article">
                                    <c:if test="${fn:length(ar.content) > 130}"><p>${fn:substring(ar.content,0,130)}......</p> </c:if>
                                    <c:if test="${fn:length(ar.content) <= 130}"><p>${ar.content}</p> </c:if>
                                    <c:forEach var="url" items="${ar.label}">
                                        <img src="${url}" style="width:180px;height:100px" />
                                    </c:forEach>
                                </div>
                            </article>
                        </c:forEach>
                    </div>
                    <div class="row">
                        <div class="col-md-6" id="page_info_area"></div>
                        <div class="col-md-6" id="page_nav_area"></div>
                    </div>
                    <div class="line_2" style="margin:24px 0px 25px;"></div>

                </div>
                <!--  ********************************右边的展示区域*************************** -->
                <div class="sidebar">
                    <div class="separator" style="height:31px;"></div>
                    <div class="block_popular_posts">
                        <div style="margin-bottom: 40px">
                            <h4 >标签分类</h4>
                            <div>
                                <a class="cur f-tag b-tag " href="JavaScript:void(0)" data-id="">全部</a>
                                <c:forEach var="label" items="${labelList}">
                                    <a class="f-tag b-tag"   data-id="${label.labelId}">${label.labelName}(${label.articleNum})</a>
                                </c:forEach>
                            </div>
                        </div>
                        <div style="margin-bottom: 40px">
                            <h4 class="f-primary-b b-h4-special f-h4-special--gray f-h4-special">公告</h4>
                            <div class="date notice" ><p>暂无公告</p></div>
                        </div>
                        <div style="margin-bottom: 40px">
                            <h4>热门文章</h4>
                            <c:forEach var="hotar" items="${hotarlist}">
                                <div class="article">
                                    <div class="text">
                                        <p class="title"><a href="#">${hotar.articleName}</a></p>
                                        <div class="date"><p>${hotar.createTime}</p></div>
                                    </div>
                                </div>
                                <div class="line_3"></div>
                            </c:forEach>
                        </div>
                        <div style="margin-bottom: 40px">
                            <h4>最新评论</h4>
                            <c:forEach var="com" items="${commentList}">
                                <div class="article">
                                    <div class="text">
                                        <p class="title"><a href="${BASE}/article/detail/${com.articleId}">${com.content}</a></p>
                                        <div class="date"><p>${com.createTime}</p></div>
                                    </div>
                                </div>
                                <div class="line_3"></div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="separator" style="height:31px;"></div>
                    <div class="separator" style="height:31px;"></div>

                    <div class="block_calendar">
                        <!--  -->
                        <div class="line_2"></div>
                    </div>
                </div>

                <div class="clearboth"></div>
            </div>
        </div>
    </div>
</div>

<%@ include file="userinfo_foot.jsp"%>
<%@ include file="foot.jsp"%>



<script type="text/javascript" src="${BASE}/www/js/Dialog/showDialog.js"></script>
<script type="text/javascript" src="${BASE}/www/js/Dialog/zDialog.js"></script>



<script type="text/javascript" src="${BASE}/www/js/userinfo/userinfo.js"></script>
<script type="text/javascript" src="${BASE}/www/js/baidutuisong.js"></script>
<%@ include file="script.jsp"%>



<!-- end -->
</body>
</html>