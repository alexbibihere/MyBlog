<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page" />
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>文章 - 异清轩博客管理系统</title>
  <script src="${path}/js/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${path}/css/style.css">
<link rel="stylesheet" type="text/css" href="${path}/css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="${path}/images/icon/icon.png">
<link rel="shortcut icon" href="${path}/images/icon/favicon.ico">
  <script src="${path}/js/html5shiv.min.js" type="text/javascript"></script>
  <script src="${path}/js/respond.min.js" type="text/javascript"></script>
  <script src="${path}/js/bootstrap.min.js"></script>
  <script src="${path}/js/admin-scripts.js"></script>
  <script src="${path}/js/bootstrap-paginator.min.js"></script>
  <script src="${path}/js/selectivizr-min.js" type="text/javascript"></script>
  <script src="${path}/js/bootstrap-paginator.js" type="text/javascript"></script>
<!--[if gte IE 9]>
<![endif]-->
<!--[if lt IE 9]>
  <script>window.location.href='upgrade-browser.html';</script>
<![endif]-->
  <script type="application/javascript">
    var PAGESIZE = 10;
    var options = {
      currentPage: 1,  //当前页数
      totalPages: 10,  //总页数，这里只是暂时的，后头会根据查出来的条件进行更改
      numberOfPages:5,
      size:"normal",
      alignment:"andright",
      itemTexts: function (type, page, current) {
        switch (type) {
          case "first":
            return "第一页";
          case "prev":
            return "前一页";
          case "next":
            return "后一页";
          case "last":
            return "最后页";
          case "page":
            return  page;
        }
      },
      onPageClicked: function (e, originalEvent, type, page) {
        buildTable(page,PAGESIZE);//默认每页最多10条
      }
    }

    //获取当前项目的路径
    var urlRootContext = (function () {
      var strPath = window.document.location.pathname;
      var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
      return postPath;
    })();

    //生成表格
    function buildTable(pageNo,pageSize) {
      var url = "${pageContext.request.contextPath}/article/findList"; //请求的网址
      var reqParams = {'pageNo':pageNo,'pageSize':pageSize};//请求数据
      $(function () {
        $.ajax({
          type:"POST",
          url:url,
          data:reqParams,
          async:false,
          dataType:"json",
          success: function(data){
            if(data.isError == false) {
              // options.totalPages = data.pages;
              var newoptions = {
                currentPage: 1,  //当前页数
                totalPages: data.pages==0?1:data.pages,  //总页数
                /*numberOfPages:data.pages==0?1:data.pages,*/
                size:"normal",
                alignment:"andright",
                itemTexts: function (type, page,current) {
                  switch (type) {
                    case "first":
                      return "第一页";
                    case "prev":
                      return "前一页";
                    case "next":
                      return "后一页";
                    case "last":
                      return "最后页";
                    case "page":
                      return  page;
                  }
                },
                /*点击事件，用于听过Ajax来刷新整个list列表*/
                onPageClicked: function (e, originalEvent, type, page) {
                  buildTable(page,PAGESIZE);//默认每页最多10条
                }
              }

              $('#bottomTab').bootstrapPaginator(newoptions); //重新设置总页面数目

              var dataList = data.dataList;
              $("#ArticleList").empty();//清空表格内容
              if (dataList.length > 0 ) {
                $(dataList).each(function(){//重新生成
                  if(this.isDel != 1){
                    $("#ArticleList").append("<tr>");
                    $('<td><input type="checkbox" name="checkbox[]" value="" /></td>').appendTo('#ArticleList');
                    $('<td>' + this.title + '</td>').addClass("article-title").appendTo($('#ArticleList'));
                    $("#ArticleList").append('<td>' + this.column + '</td>');
                    $('<td>' + this.label + '</td>').addClass("hidden-sm").appendTo($('#ArticleList'));
                    $("#ArticleList").append('<td class="hidden-sm">' + 0 + '</td>').addClass("hidden-sm");
                    $("#ArticleList").append('<td>' + this.releaseDate + '</td>');
                    $("#ArticleList").append("<a href='${pageContext.request.contextPath}/article/get?id="+this.id+"'>修改</a>" +
                          "<a href='javascript:void(0);' onclick='deleteMethod("+this.id+")'>删除</a></td>");
                    $("#ArticleList").append("</tr>");
                  }
                });
              } else {
                $("#ArticleList").append('<tr><th colspan ="7"><center>查询无数据</center></th></tr>');
              }
            }else{
              alert(data.errorMsg);
            }
          },
          error: function(e){
            alert("查询失败:" + e);
          }
        });
      });
    }
    //渲染完就执行
    $(function() {
      //生成底部分页栏
      $('.bottomTab').bootstrapPaginator(options);
      buildTable(1,10);//默认空白查全部

      /*//查询使用
      $("#queryButton").bind("click",function(){
        buildTable(1,PAGESIZE);
      });*/

    });
  </script>
</head>

<%
   String contextPath = request.getContextPath();
   request.setAttribute("contextPath",contextPath);
%>
<body class="user-select">
<section class="container-fluid">
  <header>
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand" href="/">YlsatCMS</a> </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="">消息 <span class="badge">1</span></a></li>
            <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">admin <span class="caret"></span></a>
              <ul class="dropdown-menu dropdown-menu-left">
                <li><a title="查看或修改个人信息" data-toggle="modal" data-target="#seeUserInfo">个人信息</a></li>
                <li><a title="查看您的登录记录" data-toggle="modal" data-target="#seeUserLoginlog">登录记录</a></li>
              </ul>
            </li>
            <li><a href="login.html" onClick="if(!confirm('是否确认退出？'))return false;">退出登录</a></li>
            <li><a data-toggle="modal" data-target="#WeChat">帮助</a></li>
          </ul>
          <form action="" method="post" class="navbar-form navbar-right" role="search">
            <div class="input-group">
              <input type="text" class="form-control" autocomplete="off" placeholder="键入关键字搜索" maxlength="15">
              <span class="input-group-btn">
              <button class="btn btn-default" type="submit">搜索</button>
              </span> </div>
          </form>
        </div>
      </div>
    </nav>
  </header>
  <div class="row">
    <aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
      <ul class="nav nav-sidebar">
        <li><a href="index.html">报告</a></li>
      </ul>
      <ul class="nav nav-sidebar">
        <li class="active"><a href="${contextPath}/article">文章</a></li>
        <li><a href="notice.html">公告</a></li>
        <li><a href="comment.html">评论</a></li>
        <li><a data-toggle="tooltip" data-placement="top" title="网站暂无留言功能">留言</a></li>
      </ul>
      <ul class="nav nav-sidebar">
        <li><a href="category.html">栏目</a></li>
        <li><a class="dropdown-toggle" id="otherMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">其他</a>
          <ul class="dropdown-menu" aria-labelledby="otherMenu">
            <li><a href="flink.html">友情链接</a></li>
            <li><a href="loginlog.html">访问记录</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav nav-sidebar">
        <li><a class="dropdown-toggle" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">用户</a>
          <ul class="dropdown-menu" aria-labelledby="userMenu">
            <li><a href="#">管理用户组</a></li>
            <li><a href="manage-user.html">管理用户</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="loginlog.html">管理登录日志</a></li>
          </ul>
        </li>
        <li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">设置</a>
          <ul class="dropdown-menu" aria-labelledby="settingMenu">
            <li><a href="setting.html">基本设置</a></li>
            <li><a href="readset.html">用户设置</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">安全配置</a></li>
            <li role="separator" class="divider"></li>
            <li class="disabled"><a>扩展菜单</a></li>
          </ul>
        </li>
      </ul>
    </aside>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <form action="" method="post" >
        <h1 class="page-header">操作</h1>
        <ol class="breadcrumb">
          <li><a href="add-article.html">增加文章</a></li>
        </ol>
        <h1 class="page-header">管理 <span class="badge">7</span></h1>
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">选择</span></th>
                <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">标题</span></th>
                <th><span class="glyphicon glyphicon-list"></span> <span class="visible-lg">栏目</span></th>
                <th class="hidden-sm"><span class="glyphicon glyphicon-tag"></span> <span class="visible-lg">标签</span></th>
                <th class="hidden-sm"><span class="glyphicon glyphicon-comment"></span> <span class="visible-lg">评论</span></th>
                <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">日期</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
            </thead>
            <tbody id="ArticleList"></tbody>
          </table>
        </div>
        <footer class="message_footer">
          <nav>
            <div class="btn-toolbar operation" role="toolbar">
              <div class="btn-group" role="group"> <a class="btn btn-default" onClick="select()">全选</a> <a class="btn btn-default" onClick="reverse()">反选</a>
                <a class="btn btn-default" onClick="noselect()">不选</a> </div>
              <div class="btn-group" role="group">
                <button type="submit" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="删除全部选中" name="checkbox_delete">删除</button>
              </div>
            </div>
            <!-- 底部分页按钮 -->
            <ul class="bottomTab" style="margin: 15px;margin-left: 400px"></ul>
          </nav>
        </footer>
      </form>
    </div>
  </div>
</section>
<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <form action="" method="post">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" >个人信息</h4>
        </div>
        <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
              <tr> </tr>
            </thead>
            <tbody>
              <tr>
                <td wdith="20%">姓名:</td>
                <td width="80%"><input type="text" value="王雨" class="form-control" name="truename" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">用户名:</td>
                <td width="80%"><input type="text" value="admin" class="form-control" name="username" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">电话:</td>
                <td width="80%"><input type="text" value="18538078281" class="form-control" name="usertel" maxlength="13" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">旧密码:</td>
                <td width="80%"><input type="password" class="form-control" name="old_password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">新密码:</td>
                <td width="80%"><input type="password" class="form-control" name="password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">确认密码:</td>
                <td width="80%"><input type="password" class="form-control" name="new_password" maxlength="18" autocomplete="off" /></td>
              </tr>
            </tbody>
            <tfoot>
              <tr></tr>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary">提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
<!-- 条用新浪接口,获取ip -->
<%--<script type="text/javascript" src="http://counter.sina.com.cn/ip/" charset="utf-8"></script>--%>
<!--个人登录记录模态框-->
<div class="modal fade" id="seeUserLoginlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >登录记录</h4>
      </div>
      <div class="modal-body">
        <table class="table" style="margin-bottom:0px;">
          <thead>
            <tr>
              <th>登录IP</th>
              <th>登录时间</th>
              <th>状态</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>::1:55570</td>
              <td>2016-01-08 15:50:28</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:64377</td>
              <td>2016-01-08 10:27:44</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:64027</td>
              <td>2016-01-08 10:19:25</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:57081</td>
              <td>2016-01-06 10:35:12</td>
              <td>成功</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
  <div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">微信扫一扫</h4>
      </div>
      <div class="modal-body" style="text-align:center"> <img src="${pageContext.request.contextPath}/images/weixin.jpg" alt="" style="cursor:pointer"/> </div>
    </div>
  </div>
</div>
<!--提示模态框-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
      </div>
      <div class="modal-body"> <img src="${pageContext.request.contextPath}/images/baoman/baoman_01.gif" alt="深思熟虑" />
        <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--右键菜单列表-->
<div id="rightClickMenu">
  <ul class="list-group rightClickMenuList">
    <li class="list-group-item disabled">欢迎访问博客</li>
    <li class="list-group-item"><span>IP：ILData[0]</span>
    <script type="application/javascript"></script>
    </li>
    <li class="list-group-item"><span>地址：</span>河南省郑州市</li>
    <li class="list-group-item"><span>系统：</span>Windows10 </li>
    <li class="list-group-item"><span>浏览器：</span>Chrome47</li>
  </ul>
</div>
<script type="application/javascript">
//是否确认删除
/*$(function() {
});*/
function deleteMethod(id){
  if (event.srcElement.outerText == "删除")
  {
    if(window.confirm("此操作不可逆，是否确认？"))
    {
      $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/article/delete",
        data: "id=" + id,
        cache: false, //不缓存此页面
        success: function (data) {
          window.location.reload();
        }
      });
    };
  };
}
</script>
</body>
</html>
