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
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready( function () {
        var $firLi=$("ul li").eq(0);
        var $secLi=$("ul li").eq(1);
        var $thirLi=$("ul li").eq(2);

        var info="";
        var chat="";
        var chat="";

        $firLi.on("click",function(){  //description
            $.get('/course/info',{"cid":""})
        });

        $secLi.on("click",function(){  //chapter
            $.get('')
        });

        $thirLi.on("click",function(){  //chat
            $.get('')
        });
    });
</script>
</body>
</html>
