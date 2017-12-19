
    $(function () {
        //alert("hello");
        toPage(1);

    });
function toPage(pn) {
    $.ajax({
        type: "GET",
        url:  "article/getAllLog",
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

