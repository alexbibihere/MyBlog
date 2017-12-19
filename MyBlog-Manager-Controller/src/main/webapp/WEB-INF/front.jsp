<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
    request.setAttribute("contextPath", contextPath);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <!-- Bootstrap styles -->
    <link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">

    <!-- Font-Awesome -->
    <link rel="stylesheet" href="${contextPath}/css/font-awesome.min.css">

    <!-- Google Webfonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600|PT+Serif:400,400italic' rel='stylesheet'
          type='text/css'>

    <!-- Styles -->
    <link rel="stylesheet" href="${contextPath}/css/style1.css" id="theme-styles">

    <!--[if lt IE 9]>
    <script src="${contextPath}/js/vendor/google/html5-3.6-respond-1.1.0.min.js"></script>
    <![endif]-->
<%--<style>
    .ellipsis {
        overflow: hidden;
        height: 100px;
        line-height: 25px;
        margin: 20px;
        border: 2px solid #AAA;
    }
    .ellipsis:before {
        content:"";
        float: left;
        width: 5px; height: 100px;
    }
    .ellipsis > *:first-child {
        float: right;
        width: 100%;
        margin-left: -5px;
    }
    .ellipsis:after {
        content: "\02026";
        box-sizing: content-box;
        -webkit-box-sizing: content-box;
        -moz-box-sizing: content-box;
        float: right;
        position: relative;
        top: -25px;
        left: 100%;
        width: 3em;
        margin-left: -3em;
        padding-right: 5px;
        text-align: right;
        /*根据背景颜色更改渐变颜色*/
        background: -webkit-gradient(linear, left top, right top,
        from(rgba(255, 255, 255, 0)), to(white), color-stop(50%, white));
        background: -moz-linear-gradient(to right, rgba(255, 255, 255, 0), white 50%, white);
        background: -o-linear-gradient(to right, rgba(255, 255, 255, 0), white 50%, white);
        background: -ms-linear-gradient(to right, rgba(255, 255, 255, 0), white 50%, white);
        background: linear-gradient(to right, rgba(255, 255, 255, 0), white 50%, white);
    }
</style>--%>
</head>
<body>
<header>
    <div class="widewrapper subheader">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index">Yan</a>
            <ul class="nav nav-pills navbar-nav">
                <li>
                    <a href="${contextPath}/index">主页</a>
                </li>
                <li>
                    <a href="${contextPath}/articles">文章</a>
                </li>
                <li>
                    <a href="${contextPath}/about">关于</a>
                </li>
            </ul>
            <div id="mobile-nav-toggle" class="pull-right">
                <a href="${contextPath}" data-toggle="collapse" data-target=".clean-nav .navbar-collapse">
                    <i class="fa fa-bars"></i>
                </a>
            </div>

            <nav class="pull-right clean-nav">
                <div class="collapse navbar-collapse">
                    <div class="clean-searchbox">
                        <form action="#" method="get" accept-charset="utf-8">
                            <input class="searchfield" id="search" type="text" placeholder="请输入">
                            <button class="searchbutton" type="submit">
                                <i class="fa fa-search"></i>
                            </button>
                        </form>
                    </div>

                </div>
            </nav>

        </div>
    </div>
<%--
    <div class="widewrapper subheader">
        <div class="container">
            <div class="clean-breadcrumb">
                <a href="${contextPath}/#">我的博客</a>
            </div>
            <div class="clean-searchbox">
                <form action="#" method="get" accept-charset="utf-8">
                    <input class="searchfield" id="searchbox" type="text" placeholder="请输入">
                    <button class="searchbutton" type="submit">
                        <i class="fa fa-search"></i>
                    </button>
                </form>
            </div>
        </div>
    </div>
--%>
</header>
<!--主显示内容 -->
<div class="widewrapper main">
    <div class="container">
        <div class="row">
            <div class="col-md-8 blog-main" id="cre">

              <%--  <c:if test="${!empty articleList}">
                    <c:forEach var="article" items="${articleList}">
                        <article class=" blog-teaser">
                            <header>
                                <img src="${article.titleImages}" alt="" id="images">
                                <h3><a href="${contextPath}/single.jsp" id="title">${article.title}</a></h3>
                                <span class="meta" id="time">${article.modifiedTime}</span>
                                <hr>
                            </header>
                            <div class="body" id="description">
                                getStrLength( ${article.content})
                            </div>
                            <div class="clearfix">
                                <a href="${contextPath}/single.jsp" class="btn btn-clean-one">阅读全文</a>
                            </div>
                        </article>
                    </c:forEach>
                </c:if>--%>
            <%--  <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <article class=" blog-teaser">
                            <header>
                                <img src="${contextPath}/images/1.jpg" alt="" id="images">
                                <h3><a href="${contextPath}/single.jsp" id="title">如何创建</a></h3>
                                <span class="meta" id="time">19 August 2015, John Doe</span>
                                <hr>
                            </header>
                            <div class="body" id="description">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatum, sit. Doloribus
                                dolores neque eos. Velit eveniet, necessitatibus aut sit tenetur perferendis! Commodi
                                pariatur dignissimos, quis sequi odit iusto cumque quod!
                            </div>
                            <div class="clearfix">
                                <a href="${contextPath}/single.jsp" class="btn btn-clean-one">阅读全文</a>
                            </div>
                        </article>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <article class="blog-teaser">
                            <header>
                                <img src="${contextPath}/images/2.jpg" alt="">
                                <h3><a href="${contextPath}/single.jsp">Clean Personal Blog Template</a></h3>
                                <span class="meta">19 August 2015, John Doe</span>
                                <hr>
                            </header>
                            <div class="body">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatum, sit. Doloribus
                                dolores neque eos. Velit eveniet, necessitatibus aut sit tenetur perferendis! Commodi
                                pariatur dignissimos, quis sequi odit iusto cumque quod!
                            </div>
                            <div class="clearfix">
                                <a href="${contextPath}/single.jsp" class="btn btn-clean-one">阅读全文</a>
                            </div>
                        </article>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <article class="blog-teaser">
                            <header>
                                <img src="${contextPath}/images/3.jpg" alt="">
                                <h3><a href="${contextPath}/single.jsp">Blackor - Responsive HTML5 Theme</a></h3>
                                <span class="meta">19 August 2015, John Doe</span>
                                <hr>
                            </header>
                            <div class="body">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatum, sit. Doloribus
                                dolores neque eos. Velit eveniet, necessitatibus aut sit tenetur perferendis! Commodi
                                pariatur dignissimos, quis sequi odit iusto cumque quod!
                            </div>
                            <div class="clearfix">
                                <a href="${contextPath}/single.jsp" class="btn btn-clean-one">阅读全文</a>
                            </div>
                        </article>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <article class="blog-teaser">
                            <header>
                                <img src="${contextPath}/images/4.jpg" alt="">
                                <h3><a href="${contextPath}/single.jsp">Yellow - HTML5 Template</a></h3>
                                <span class="meta">19 August 2015, John Doe</span>
                                <hr>
                            </header>
                            <div class="body">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatum, sit. Doloribus
                                dolores neque eos. Velit eveniet, necessitatibus aut sit tenetur perferendis! Commodi
                                pariatur dignissimos, quis sequi odit iusto cumque quod!
                            </div>
                            <div class="clearfix">
                                <a href="${contextPath}/single.jsp" class="btn btn-clean-one">阅读全文</a>
                            </div>
                        </article>
                    </div>
                </div>--%>
                  <footer class="message_footer">
                      <nav>
                          <div class="row">
                              <div class="col-md-6" id="page_info_area"></div>
                              <div class="col-md-6" id="page_nav_area"></div>
                          </div>
                      </nav>
                  </footer>

            </div>
            <!-- 右侧边栏-->
            <aside class="col-md-4 blog-aside">

                <div class="aside-widget">
                    <header>
                        <h3>公告</h3>
                    </header>
                    <div class="body">
                             <p id="hd" style="text-align: center"></p>
                            <span> <p id="notice" style="text-align: center"></p></span>
                            <small> <p id="sTime" style="text-align: right"></p></small>
                    </div>
                </div>

                <div class="aside-widget">
                    <header>
                        <h3>最近</h3>
                    </header>
                    <div class="body">
                        <ul class="clean-list" id="latest">

                          <%--  <li><a href="${contextPath}/">Blackor Responsive Theme</a></li>
                            <li><a href="${contextPath}/">Portfolio Bootstrap Template</a></li>
                            <li><a href="${contextPath}/">Clean Slider Template</a></li>
                            <li><a href="${contextPath}/">Clean - Responsive HTML5 Template</a></li>
                            <li><a href="${contextPath}/">Responsive Pricing Table</a></li>
                            <li><a href="${contextPath}/">Yellow HTML5 Template</a></li>--%>
                        </ul>
                    </div>
                </div>

                <div class="aside-widget">
                    <header>
                        <h3>标签</h3>
                    </header>
                    <div class="body clearfix">
                        <ul class="tags">
                            <li><a href="${contextPath}/#">HTML5</a></li>
                            <li><a href="${contextPath}/#">CSS3</a></li>
                            <li><a href="${contextPath}/#">COMPONENTS</a></li>
                            <li><a href="${contextPath}/#">TEMPLATE</a></li>
                            <li><a href="${contextPath}/#">PLUGIN</a></li>
                            <li><a href="${contextPath}/#">BOOTSTRAP</a></li>
                            <li><a href="${contextPath}/#">TUTORIAL</a></li>
                            <li><a href="${contextPath}/#">UI/UX</a></li>
                        </ul>
                    </div>
                </div>
            </aside>
        </div>
    </div>
</div>
<!--底部 -->
<%--
<footer>
    <div class="widewrapper footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 footer-widget">
                    <h3><i class="fa fa-user"></i>About</h3>

                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi laboriosam nostrum consequatur
                        fugiat at, labore praesentium modi, quasi dolorum debitis reiciendis facilis, dolor saepe sint
                        nemo, earum molestias quas.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum, error aspernatur assumenda
                        quae eveniet.</p>
                </div>

                <div class="col-md-4 footer-widget">
                    <h3><i class="fa fa-pencil"></i> 最近</h3>
                    <ul class="clean-list">
                        <li><a href="${contextPath}/">Clean - Responsive HTML5 Template</a></li>
                        <li><a href="${contextPath}/">Responsive Pricing Table</a></li>
                        <li><a href="${contextPath}/">Yellow HTML5 Template</a></li>
                        <li><a href="${contextPath}/">Blackor Responsive Theme</a></li>
                        <li><a href="${contextPath}/">Portfolio Bootstrap Template</a></li>
                        <li><a href="${contextPath}/">Clean Slider Template</a></li>
                    </ul>
                </div>

                <div class="col-md-4 footer-widget">
                    <h3><i class="fa fa-envelope"></i>Contact Me</h3>

                    <p>Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil fugiat, cupiditate veritatis
                        excepturi tempore explicabo.</p>
                    <div class="footer-widget-icon">
                        <i class="fa fa-facebook"></i><i class="fa fa-twitter"></i><i class="fa fa-google"></i>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="widewrapper copyright">
        Copyright 2015 More Templates <a href="${contextPath}/http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
        - Collect from <a href="${contextPath}/http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
    </div>
</footer>
--%>

<script src="${contextPath}/js/jquery.min.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/js/modernizr.js"></script>
<script src="${contextPath}/js/mlellipsis.js"></script>
<script type="application/javascript">



    //获取最新公告
    $(function () {

        getNotice();
        getArticle();
//        document.getElementById("cre").mlellipsis(5);
    });
   function getNotice() {
       $.ajax({
            type:"GET",
           url:"${contextPath}/notice/getNewNotice",
           success:function (result) {
               console.log(result);
               var count = result.map.notice;
               $("#notice").text(count.content);
               $("#hd").text(count.title);
               $("#sTime").html(getMyDte(count.modifiedTime));
           }
       });
   }

    //获取最近五篇文章
    function getArticle() {
        $.ajax({
            type:"GET",
            url:"${contextPath}/article/getNewArticles",
            success:function (result) {
                console.log(result);
                var count = result.map.articleList;
                $.each(count, function (index, item) {
                    var article = $("<a href='${contextPath}/article/getArticle'></a>").append(item.title).addClass("articleI").attr("id",item.id).attr("href",item.id);
                 /*   $('#hre').attr('href','http://keleyi.com');
                    var a='<a href="">动态链接</a>';*/

                 /*   var titleTd = $("<p></p>").append(item.title);*/
                    $("<li></li>").append(article).appendTo($("#latest"));
                });
        }
    });
   }

   //搜索
    $("#search").click(function () {
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/",
        })
    });


    function getMyDte(str) {
        var oDate = new Date(str),
            oYear = oDate.getFullYear(),
            oMonth = oDate.getMonth() + 1,
            oDay = oDate.getDate(),
            oHour = oDate.getHours(),
            oMin = oDate.getMinutes(),
            oSen = oDate.getSeconds(),
            oTime = oYear + '-' + getzf(oMonth) + '-' + getzf(oDay) + ' ' + getzf(oHour) + ':' + getzf(oMin) + ':' + getzf(oSen);//最后拼接时间
        return oTime;
    }
    ;
    //补0操作
    function getzf(num) {
        if (parseInt(num) < 10) {
            num = '0' + num;
        }
        return num;
    }

</script>
<script type="application/javascript">

    $(function () {
        //alert("hello");
        toPage(1);

    });
    function toPage(pn) {
        $.ajax({
            type: "GET",
            url:  "article/getArticles",
            data: "pn=" + pn,
            success: function (result) {
                console.log(result);
                build_user_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        })
    }
    //构建主页文章
    function build_user_table(result) {
          $("#cre ").empty();

        var user = result.map.pageInfo.list;
        $.each(user, function (index, item) {


            var article =$("<article></article>").addClass("blog-teaser");

            var userIdTd = $("<td></td>").append(item.id);
            var titleImagesTd = $("<img></img>").append(item.titleImages);
            var articleDescribeTd = $("<td></td>").append(item.content)/*.css({
                "text-overflow":"ellipsis",
                "display":"-webkit-box",
                "-webkit-line-clamp":"5",
                "-webkit-box-orient":"vertical",
                "overflow":"hidden"
            });*/;
            var titleTd = $("<a></a>").append(item.title);
            var createTimeTd = $("<td></td>").append(getMDate(item.modifiedTime));
            var head =$("<header></header>").append(titleImagesTd).append(titleTd).css({
                "text-align":"center",
                "font-family":"Arial",
                "font-size":"20px"
            });
            var div =$("<div></div>").append(articleDescribeTd).addClass("row");
            var operate = $("<small></small>").append(createTimeTd);
            $("<div></div>").append(article).append(head).append(div).append(operate)
                .appendTo($("#cre "));
        });
    }


    //页码信息
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append(
            "当前第" + result.map.pageInfo.pageNum + "页，总"
            + result.map.pageInfo.pages + "页，总"
            + result.map.pageInfo.total + "条记录");
        lastPageNum = result.map.pageInfo.pages;
        currentPageNum = result.map.pageInfo.pageNum;
    }

    //分页信息
    function build_page_nav(result) {
        $("#page_nav_area").empty();

        var ul = $("<ul></ul>").addClass("pagination");

        var firstPage = $("<li></li>").append($("<a></a>").append("首页"));
        var prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.map.pageInfo.hasPreviousPage == false) {
            firstPage.addClass("disabled");
            prePage.addClass("disabled");
        } else {
            firstPage.click(function () {
                toPage(1);
            });
            prePage.click(function () {
                toPage(result.map.pageInfo.pageNum - 1);
            });
        }

        var nextPage = $("<li></li>")
            .append($("<a></a>").append("&raquo;"));
        var lastPage = $("<li></li>").append($("<a></a>").append("末页"));
        if (result.map.pageInfo.hasNextPage == false) {
            lastPage.addClass("disabled");
            nextPage.addClass("disabled");
        } else {
            lastPage.click(function () {
                toPage(result.map.pageInfo.pages);
            });
            nextPage.click(function () {
                toPage(result.map.pageInfo.pageNum + 1);
            });
        }

        ul.append(firstPage).append(prePage);
        var nums = result.map.pageInfo.navigatepageNums;
        $.each(nums, function (index, item) {
            var num = $("<li></li>").append($("<a></a>").append(item));
            if (result.map.pageInfo.pageNum == item)
                num.addClass("active");
            num.click(function () {
                toPage(item);
            });
            ul.append(num);
        });
        ul.append(nextPage).append(lastPage);
        $("<nav></nav>").append(ul).appendTo("#page_nav_area");
        //$("#page_nav_area").append($("<nav></nav>").append(ul));
    }





    function getMDate(str) {
        var oDate = new Date(str),
            oYear = oDate.getFullYear(),
            oMonth = oDate.getMonth() + 1,
            oDay = oDate.getDate(),
            oHour = oDate.getHours(),
            oMin = oDate.getMinutes(),
            oSen = oDate.getSeconds(),
            oTime = oYear + '-' + getzf(oMonth) + '-' + getzf(oDay) + ' ' + getzf(oHour) + ':' + getzf(oMin) + ':' + getzf(oSen);//最后拼接时间
        return oTime;
    }
    ;
    //补0操作
    function getzf(num) {
        if (parseInt(num) < 10) {
            num = '0' + num;
        }
        return num;
    }





</script>
</body>
</html>