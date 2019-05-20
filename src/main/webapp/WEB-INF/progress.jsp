<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>我的学习进度</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>static/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>static/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">

    <!-- jQuery -->
    <script type="text/javascript" charset="utf8" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

    <!-- DataTables -->
    <script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
    <style type="text/css">
        .leveltwo h4 .icon {
            display: inline-block;
            height: 30px;
            line-height: 25px;
            font-size: 20px;
            color: #999;
            width: 82px;
            text-align: right;
        }
        .timeline em {
            width: 17px;
            height: 17px;
            line-height: 17px;
            text-align: center;
            color: #fff;
            display: inline-block;
            background: url(/static/imgs/bg.png) -18px 0px;
            float: right;
            margin: 4px 5px 0px;
            font-style: normal;
            font-size: 12px;
            font-weight: normal;
        }
        .timeline em.openlock {
            background-position: -36px 0px;
        }
        .timeline em.orange {
            background-position: -48px -160px;
        }
        .leveltwo h4 .articlename {
            margin-left: 5px;
            font-size: 20px;
        }

        .charter b {
            background: rgba(0, 0, 0, 0) url(/static/imgs/bg.png) repeat scroll -44px -63px;
            display: inline-block;
            height: 17px;
            margin: 0 3px -3px;
            width: 17px;
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
                            <i class="fa fa-tasks fa-fw"></i> New Task
                            <span class="pull-right text-muted small">4 minutes ago</span>
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
    </nav>

    <div id="page-wrapper">
        <div class="container-fluid courseIntroBox">

            <div class="continue-study" style="border-bottom:0px;border-radius: 5px 5px 0 0;">
                <span class="charter" style="font-size:16px;color:#333"><b></b>
                    待完成任务点
                </span>
                <div class="content1 roundcorner">
                    <div class="wwc" style="padding-bottom:0px;"></div>
                    <!--<div class="titlename"><span>统计</span><span>开发</span><div class="clear"></div></div>-->
                    <div id="msg_notice" style="display: none;padding-bottom:0px;">
                    </div>

                    <div class="timeline">
                        <!-- 第一级开始  -->
                        <div class="units">
                            <!-- <h2><span class="numbers"><b>1</b></span>-->
                                 <!--<a href="javascript:void(0)" title="绪论" style="cursor:default">
                                     绪论
                                 </a>-->
                            </h2>
                            <!-- 第二级开始  -->
                            <div class="leveltwo">

                            </div>
                        </div>
                    </div>
                </div>                                                                                                                                        											</span>
            </div>

        </div>
    </div>
</div>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>static/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>static/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>static/dist/js/sb-admin-2.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>

<script type="text/javascript">
    $(document).ready( function () {
        /*$.ajax({
            url: '/qchapter',
            type: 'get',
            async: false,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var content="";
                    if(data[i].exstate==1) //并且不能考试
                        content="<p>考试："+data[i].chname+"</p>";
                    //else if ==1  但是可以考试
                    else if(data[i].exstate==0)
                        content="<a href='/course/study/"+data[i].chid+"'>" + data[i].chname + "</a>\n";
                    $(".leveltwo").append("<h3 class='clearfix'><span class='icon'>"+(i+1)+content+
                         "</span><span class='chapterNumber'></span></h3>");
                }
            }
        });*/

        var sno = '<%=request.getSession().getAttribute("mySno")%>';
        var cid = '<%=request.getSession().getAttribute("myCid")%>';
        $.ajax({
            url: '/student/myProgress?cid='+cid+"&sno="+sno,  //有了config里面的配置之后就可以通过ip地址加端口的方式以绝对路径访问
            type: 'get',
            async: false,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    console.log(data[i])
                    var content="";
                    if(data[i].state=="exam"){ //要么特殊化，要么和normal合并
                        content="<span class='articlename'>开放考试:<a href='/course/study/"+data[i].chid+"'>" + data[i].chname + "</a></span>\n";
                    }else if(data[i].state=="prepare"){
                        content="<span class='articlename'><p>未开放考试："+data[i].chname+"</p></span>";
                    }
                    else if(data[i].state=="normal"){
                        //if(data[i].play!=null)//if(data[i].score!=null&&data[i].play!=null)
                        //加入score初始值的判断
                            if(data[i].play!=0&&data[i].play!=null&&data[i].score!=-1)
                                content+="<span class='icon'><span class='chapterNumber'>"+(i+1)+"</span><em class='openlock'></em></span>"
                            else if(data[i].play==null||data[i].play==0||data[i].score!=-1)
                                content+="<span class='icon'><span class='chapterNumber'>"+(i+1)+"</span><em class='orange'></em></span>"      //这层if是完成与否的图标
                        content+="<span class='articlename'><a href='/course/study/"+data[i].chid+"'>" + data[i].chname + "</a></span>\n";

                    }
                    $(".leveltwo").append("<h4 class='clearfix'>"+
                        ""+content+"</span></h4>");
                }
            }
        });

    });
</script>
</body>
</html>