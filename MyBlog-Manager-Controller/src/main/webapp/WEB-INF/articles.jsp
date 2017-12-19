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


</head>
<body>
<header>
    <div class="widewrapper subheader">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index">Yan</a>
            <ul class="nav nav-pills navbar-nav">
                <li>
                    <a href="${contextPath}/front">主页</a>
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
                            <input class="searchfield" id="searchbox" type="text" placeholder="请输入">
                            <button class="searchbutton" type="submit">
                                <i class="fa fa-search"></i>
                            </button>
                        </form>
                    </div>

                </div>
            </nav>

        </div>
    </div>

</header>
<!--主显示内容 -->
<div class="widewrapper main">
    <div class="container">
        <div class="row">
                <div  class="col-sm-9  main" id="main">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover" id="userList">
                            <thead>
                            <tr>
                                <th><span ></span> <span class="visible-lg"></span></th>
                                <th><span ></span> <span class="visible-lg"></span></th>

                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-6" id="page_info_area"></div>
                        <div class="col-md-6" id="page_nav_area"></div>
                    </div>
                </div>

            <aside class="col-md-3 blog-aside">

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
<script type="application/javascript">
    //获取最新公告
    $(function () {
        getNotice();
        getArticle();
    });
    function getNotice() {
        $.ajax({
            type: "GET",
            url: "${contextPath}/notice/getNewNotice",
            success: function (result) {
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
            type: "GET",
            url: "${contextPath}/article/getNewArticles",
            success: function (result) {
                console.log(result);
                var count = result.map.articleList;
                $.each(count, function (index, item) {
                    var article = $("<a href='${contextPath}/article/getArticle'></a>").append(item.title).addClass("articleI").attr("id", item.id).attr("href", item.id);
                    /*   $('#hre').attr('href','http://keleyi.com');
                     var a='<a href="">动态链接</a>';*/

                    /*   var titleTd = $("<p></p>").append(item.title);*/
                    $("<li></li>").append(article).appendTo($("#latest"));
                });
            }
        });
    }

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
<%--<script type="application/javascript">

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
    //构建用户表
    function build_user_table(result) {
        /*  $("#cre ").empty();*/

        var user = result.map.pageInfo.list;
        $.each(user, function (index, item) {

            var div2 = $("<div></div>").addClass("row");
            var div3 = $("<div></div>").addClass("col-md-6 col-sm-6");
            var article =$("<article></article>").addClass("blog-teaser");

            var userIdTd = $("<td></td>").append(item.id);
            var titleImagesTd = $("<td></td>").append(item.titleImages);
            var titleTd = $("<td></td>").append(item.title);
            var createTimeTd = $("<td></td>").append(getMyDate(item.createTime));
            var articleDescribeTd = $("<td></td>").append(getMyDate(item.articleDescribe));
            /*  var editbtn = $("<button></button>").addClass("btn btn-primary btn-sm editbtn")
             .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
             .append("编辑").attr("editid", item.id);*/

            var operate = $("<td></td>");
            $("<tr></tr>").append(userIdTd).append(titleImagesTd).append(titleTd)
                .append(titleTd)
                .append(createTimeTd).append(articleDescribeTd).append(operate).append(article)
                .append(div2).append(div3).appendTo($("#cre "));
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


    function getUser(id) {
        $.ajax({
            type: "GET",
            data: "id=" + id,
            url: "${pageContext.request.contextPath}/user/getUser",
            success: function (result) {
                //console.log(result);
                var user = result.map.user;
                $("#username").val(user.username);
                $("#password").val(user.password);
            }
        })
    }
    $(document).on("click", ".delbtn", function () {
        deleteMethod($(this).attr("delid"));
    });





    //校验用户名是否可用
    $("#uname").change(function () {
        var username = this.value;
        $.ajax({
            type:"POST",
            url:"${path}/user/checkUser",
            data:"username="+username,
            success:function (result) {
                if(result.code==100){
                    showValidateMsg("#uname","success","用户名可用");
                    $("#user_add").attr("save", "yes");
                }else{
                    showValidateMsg("#uname","error","用户名已存在");
                    $("#user_add").attr("save", "no");
                }
            }
        })

    });

    function showValidateMsg(ele, status, msg) {
        $(ele).parent().removeClass("has-error has-success");
        $(ele).next("span").text("");
        if (status == "success") {
            $(ele).parent().addClass("has-success ");
            $(ele).next("span").text(msg);
        } else {
            $(ele).parent().addClass("has-error ");
            $(ele).next("span").text(msg);
        }
    }


</script>--%>
<script type="application/javascript">
    $(function () {
        //alert("hello");
        toPage(1);

    });
    function toPage(pn) {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/article/getArticles",
            data: "pn=" + pn,
            success: function (result) {
                //console.log(result);
                build_user_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        })
    }
    //构建用户表
    function build_user_table(result) {
        $("#userList tbody").empty();

        var user = result.map.pageInfo.list;
        $.each(user, function (index, item) {
            /*
             var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
             */
            //var checkBoxTd = $("<td></td>").append($("<input></input>").attr("type","checkbox"));
           /* var userIdTd = $("<td></td>").append(item.id);*/
            var titleTd = $("<td></td>").append(item.title);

            var createTimeTd = $("<td></td>").append(getMyDate(item.modifiedTime));

            $("<tr></tr>").append(titleTd).append(createTimeTd).appendTo($("#userList tbody"));
        });
    }

    //页码信息
    function build_page_info(result) {
        $("#page_info_area").empty();

        lastPageNum = result.map.pageInfo.pages;
        currentPageNum = result.map.pageInfo.pageNum;
    }

    //分页信息
    function build_page_nav(result) {
        $("#page_nav_area").empty();

        var ul = $("<ul></ul>").addClass("pagination");

        var firstPage = $("<li></li>").append($("<a></a>").append("1"));
        var prePage = $("<li></li>").append($("<a></a>").append("<"));
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
            .append($("<a></a>").append(">"));
        var lastPage = $("<li></li>").append($("<a></a>").append(">>"));
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

    //绑定编辑按钮 查询公告 填充到弹出的模态框中
    $(document).on("click", ".editbtn", function () {
        $("#editUser form")[0].reset();
        getUser($(this).attr("editid"));
        $("#editUser").modal({
            drop: "static"
        });
    });

    // 点击保存用户
    $("#user_add").click(function () {
        //判断用户名可用则按钮可点击
        if ($(this).attr("save")=="no"){
            return false;
        }
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/user/add",
            data: $("#addUser form").serialize(),
            success: function (result) {
                $("#addUser").modal.hide();
                parent.location.reload();
            }
        })
    });


    function getUser(id) {
        $.ajax({
            type: "GET",
            data: "id=" + id,
            url: "${pageContext.request.contextPath}/user/getUser",
            success: function (result) {
                //console.log(result);
                var user = result.map.user;
                $("#username").val(user.username);
                $("#password").val(user.password);
            }
        })
    }
    $(document).on("click", ".delbtn", function () {
        deleteMethod($(this).attr("delid"));
    });

    //是否确认删除
    function deleteMethod(id) {
        if (event.srcElement.outerText == "删除") {
            if (window.confirm("此操作不可逆，是否确认？")) {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/user/delete",
                    data: "id=" + id,
                    cache: false, //不缓存此页面
                    success: function (data) {
                        window.location.reload();
                    }
                });
            }
            ;
        }
        ;
    }

    $("#main table tbody tr td a").click(function () {
        var name = $(this);
        var id = name.attr("rel"); //对应id
        if (name.attr("name") === "see") {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/user/getUser",
                data: "id=" + id,
                cache: false, //不缓存此页面
                success: function (data) {
                    var data = JSON.parse(data);
                    $('#username').val(data.username);
                    $('#password').val(data.password);
                    $('#id').val(data.id);
                    $('#seeUser').modal('show');
                }
            });
        } else if (name.attr("name") === "delete") {
            if (window.confirm("此操作不可逆，是否确认？")) {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/user/delete",
                    data: "id=" + id,
                    cache: false, //不缓存此页面
                    success: function (data) {
                        window.location.reload();
                    }
                });
            }
            ;
        }
        ;
    });

    function getMyDate(str) {
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

    //校验用户名是否可用
    $("#uname").change(function () {
        var username = this.value;
        $.ajax({
            type:"POST",
            url:"${path}/user/checkUser",
            data:"username="+username,
            success:function (result) {
                if(result.code==100){
                    showValidateMsg("#uname","success","用户名可用");
                    $("#user_add").attr("save", "yes");
                }else{
                    showValidateMsg("#uname","error","用户名已存在");
                    $("#user_add").attr("save", "no");
                }
            }
        })

    });

    function showValidateMsg(ele, status, msg) {
        $(ele).parent().removeClass("has-error has-success");
        $(ele).next("span").text("");
        if (status == "success") {
            $(ele).parent().addClass("has-success ");
            $(ele).next("span").text(msg);
        } else {
            $(ele).parent().addClass("has-error ");
            $(ele).next("span").text(msg);
        }
    }
</script>
<script type="application/javascript">

    function getStrLength(str) {
        var realLength = 0, len = str.length, charCode = -1;
        for (var i = 0; i < len; i++) {
            charCode = str.charCodeAt(i);
            if (charCode >= 0 && charCode <= 128) {
                realLength += 1;
            } else {
                realLength += 2;
            }
        }
        return realLength;
    }

    function cutstr(str, len) {
        var str_length = 0;
        var str_len = 0;
        str_cut = new String();
        str_len = str.length;
        for (var i = 0; i < str_len; i++) {
            a = str.charAt(i);
            str_length++;
            if (escape(a).length > 4) {
                //中文字符的长度经编码之后大于4
                str_length++;
            }
            str_cut = str_cut.concat(a);
            if (str_length >= len) {
                str_cut = str_cut.concat("...");
                return str_cut;
            }
        }
        //如果给定字符串小于指定长度，则返回源字符串；
        if (str_length < len) {
            return str;
        }
    }


</script>
</body>
</html>