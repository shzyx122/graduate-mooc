<%--
  Created by IntelliJ IDEA.
  User: shzyx122
  Date: 2019/3/9
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>课程信息</title>
    <script type="text/javascript" charset="utf8" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <style>
        body{
            font:12px/1.5 MIcrosoft YaHei,Arial, Helvetica, sans-serif;
            color:#333;
            background:#f2f2f2
        }
        ul,ol,dl{list-style:none;}
        li{ float:left; margin-left:20px; list-style-type:none;}
        a{color:#202020;text-decoration:none;}

        .clearfix{overflow:hidden;zoom:1}

        .xyTabs{position:relative;margin-top:-1px}
        .xyTabs li{float:left;width:160px;height:68px;text-align:center;line-height:68px;font-size:16px}
        .xyTabs li a{display:block}
        .xyTabs li.cur{color:#38bb37;font-weight:bold;background:#f6f6f6;border-top:solid 4px #38bb37;}
        .xyTabs li.cur a{color:#38bb37;}
        .courseIntroBox{margin-top:26px;background:#fff;border-top:solid 1px #e0e0e0;}
        .fontGreen{color:#38bb37}
        .xyCourseIntro{background:#fff;margin-top:35px;padding:15px;}
    </style>
</head>
<body>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid courseIntroBox">
            <ul class="xyTabs clearfix">
                <li class="cur"><a href="#" id="info">课程介绍</a></li>
                <li><a href="#" id="chap">课程章节</a></li>
                <li><a href="#" id="chat">师生互动</a></li>
            </ul>
            <div class="xyCourseIntro">

            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    function trans(obj){  //一位前+0
        if((obj + '').length === 1){
            obj = '0' + (obj + '');
        }
        return obj;
    }

    function queryDisc(){
        $.get('/course/info',function(data){
            $('.xyCourseIntro').html("");
            var myDate = new Date(),
                Y = trans(myDate.getFullYear()),
                M = trans(myDate.getMonth() + 1),
                D = trans(myDate.getDate()+1),
                hour = trans(myDate.getHours()),
                minute = trans(myDate.getMinutes());

            var curDay = Y + '-' + M + '-' + D;

            for(var i=0;i<data.length;i++){
                if(curDay<data[i].end) {    //当前时间课程还没结束才显示
                    $('.xyCourseIntro').append("<p>开课时间:" + data[i].begin + "</p>\n");
                    if (i == (data.length-1)) {
                        $('.xyCourseIntro').append(
                            "<p>课时：" + data[i].course.during + "</p>\n" +
                            "<p>" + data[i].course.discrip + "</p>");
                    }
                }
                else $('.xyCourseIntro').append("<p>课程已结束</p>");
            }

        });
    }

    $(document).ready( function () {
        $.ajaxSettings.async = false;
        queryDisc();


        var $firLi=$("ul li").eq(0);
        var $secLi=$("ul li").eq(1);
        var $thirLi=$("ul li").eq(2);


        $firLi.on("click",function(){  //description
            //先移出所有样式再给指定li添加class="cur"
            $('li').removeClass("cur");
            $firLi.addClass("cur");
            queryDisc();

        });

        $secLi.on("click",function() {  //chapter
            $('li').removeClass("cur");
            $secLi.addClass("cur");
            $.ajax({
                url: '/qchapter',
                type: 'get',
                async: false,
                success: function (data) {
                    $('.xyCourseIntro').html("");
                    $('.xyCourseIntro').append("<ul>");
                    //$('.xyCourseIntro').append("<ul>");
                    for (var i = 0; i < data.length; i++) {
                        $('.xyCourseIntro ul').append("<li>" + data[i].chname + "</li>");
                    }
                    $('.xyCourseIntro').append("</ul>");
                }
            });
        });
        /*$thirLi.on("click",function(){  //chat
            $('li').removeClass("cur");
            $thirLi.addClass("cur");
            //$.get('');
        });*/
    });
</script>
</body>
</html>
