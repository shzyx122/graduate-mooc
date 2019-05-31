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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>static/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">


    <!-- Morris Charts CSS -->
    <link href="<%=basePath%>static/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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

        .link_button {
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            border: solid 1px #20538D;
            text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.4);
            -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 1px rgba(0, 0, 0, 0.2);
            -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 1px rgba(0, 0, 0, 0.2);
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 1px rgba(0, 0, 0, 0.2);
            background: #4479BA;
            color: #FFF;
            padding: 8px 12px;
            text-decoration: none;
            float:right;
        }

    </style>
</head>
<body>
<div id="wrapper">

    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">慕课平台</a>
        </div>
        <!-- /.navbar-header -->
        <!--右边的消息-->
        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">  <!--邮件-->
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-messages">
                    <li>
                        <a href="#">
                            <div>
                                <strong>John Smith</strong>
                                <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                            </div>
                            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <strong>John Smith</strong>
                                <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                            </div>
                            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <strong>John Smith</strong>
                                <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                            </div>
                            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>Read All Messages</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-messages -->
            </li>
            <!-- /.dropdown -->
            <li class="dropdown">  <!--任务进度-->
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-tasks">
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 1</strong>
                                    <span class="pull-right text-muted">40% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                        <span class="sr-only">40% Complete (success)</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 2</strong>
                                    <span class="pull-right text-muted">20% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                        <span class="sr-only">20% Complete</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 3</strong>
                                    <span class="pull-right text-muted">60% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        <span class="sr-only">60% Complete (warning)</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>Task 4</strong>
                                    <span class="pull-right text-muted">80% Complete</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                        <span class="sr-only">80% Complete (danger)</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>See All Tasks</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-tasks -->
            </li>
            <!-- /.dropdown -->
            <li class="dropdown"> <!--消息-->
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-comment fa-fw"></i> New Comment
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                <span class="pull-right text-muted small">12 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-envelope fa-fw"></i> Message Sent
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-tasks fa-fw"></i> 新任务
                                <span id="newTask" class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>See All Alerts</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-alerts -->
            </li>
            <!-- /.dropdown -->
            <li class="dropdown"> <!--账户-->
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="/student/stuInfo"><i class="fa fa-user fa-fw"></i> 个人信息</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> 设置</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="/logout"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <!-- /.navbar-static-side -->
    </nav>
    <div id="page-wrapper">
        <div class="container-fluid courseIntroBox">
            <div class="row">
            <ul class="xyTabs clearfix">
                <li class="cur"><a href="#" id="info">课程介绍</a></li>
                <li><a href="#" id="chap">课程章节</a></li>
                <li><a href="#" id="chat">师生互动</a></li>
            </ul>
                <a href="" class="link_button btn btn-default">加入课程</a><!--登录  完成课业进入课程列表-->
            <div class="xyCourseIntro">

            </div>


            </div>
        </div>
    </div>
</div>
<!-- jQuery -->
<script src="<%=basePath%>static/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>static/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>static/vendor/metisMenu/metisMenu.min.js"></script>


<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>static/dist/js/sb-admin-2.js"></script>
<script type="text/javascript">

    var tno=''; //taskno用来设置learn

    function trans(obj){  //一位前+0
        if((obj + '').length === 1){
            obj = '0' + (obj + '');
        }
        return obj;
    }

    function queryDisc(){
        console.log("query")
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
                    tno=data[i].taskno; //获取taskno用来设置learn
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

        var user = '<%=request.getSession().getAttribute("suser")%>';
        $.ajaxSettings.async = false;
        queryDisc();
        $(".link_button").attr('href','/student/attend?stu='+user+'&taskno='+tno);
        //此处需要判断当前登录用户是否已经选过这门课，更改按钮文本和链接地址
        var $firLi=$("ul.xyTabs li").eq(0);
        var $secLi=$("ul.xyTabs li").eq(1);
        var $thirLi=$("ul li").eq(2);


        $firLi.on("click",function(){  //description
            //先移出所有样式再给指定li添加class="cur"
            console.log("fir")
            $('li').removeClass("cur");
            $firLi.addClass("cur");
            queryDisc();

        });

        $secLi.on("click",function() {  //chapter
            console.log("sec")
            $('li').removeClass("cur");
            $secLi.addClass("cur");
            $.ajax({
                url: '/qchapter',
                type: 'get',
                async: false,
                success: function (data) {
                    $('.xyCourseIntro').html("");
                    //$('.xyCourseIntro').append("<ul>");
                    //$('.xyCourseIntro').append("<ul>");
                    for (var i = 0; i < data.length; i++) {
                        $('.xyCourseIntro ').append("<p>" + data[i].chname + "</p>\n");
                    }
                    //$('.xyCourseIntro').append("</ul>");
                }
            });
        });
        /*$thirLi.on("click",function(){  //chat
            $('li').removeClass("cur");
            $thirLi.addClass("cur");
            //$.get('');
        });*/
        //new task
        var task = '<%=request.getSession().getAttribute("newTask")%>';
        console.log("task",task,typeof task);
        var content=""
        if(task=="null")  //不知道为什么要判断成字符串才行   似乎如果session里面还没有该属性就获取的话会是"null"
            content='暂无新任务'
        if(task!=="null") {
            console.log("task不为空",task);
            content=task;
        }
        $("#newTask").html(content)
    });
</script>
</body>
</html>
