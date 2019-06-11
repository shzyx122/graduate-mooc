<%--
  Created by IntelliJ IDEA.
  User: shzyx122
  Date: 2019/3/1
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>欢迎进入慕课平台</title>
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>static/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>static/dist/css/sb-admin-2.css" rel="stylesheet">

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
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">

    <!-- jQuery -->
    <script type="text/javascript" charset="utf8" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

    <!-- DataTables -->
    <script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
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
            <li class="dropdown"> <!--账户-->
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> 个人信息</a>
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
        <!--侧边栏-->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                        <!-- /input-group -->
                    </li>
                    <li>
                        <a href="/myTask"><i class="fa fa-dashboard fa-fw"></i> 课程成绩</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 信息管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/Cou">课程管理</a>
                            </li>

                        </ul>
                        <!-- /.nav-second-level -->
                    </li>

                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">

                <form role="form" id="uploadform" action="<%=basePath%>addSubs" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>批量添加题目</label>
                        <input type="file"  name="chfile">
                    </div>
                    <button type="submit" class="btn btn-default">提交</button>
                </form>

                <form role="form" action="<%=basePath%>assSub" method="post">
                    <input type="hidden" name=subno >
                    <div class="form-group">
                        <label>问题</label>
                        <input class="form-control" name="question" placeholder="输入题目问题">
                    </div>
                    <div class="form-group">
                        <label>答案</label>
                        <input class="form-control" name="answer" >
                    </div>
                    <div class="form-group">
                        <label>选项A：</label>
                        <input class="form-control" name="aitem">
                    </div>
                    <div class="form-group">
                        <label>选项B：</label>
                        <input class="form-control" name="bitem">
                    </div>
                    <div class="form-group">
                        <label>选项C：</label>
                        <input class="form-control" name="citem">
                    </div>
                    <div class="form-group">
                        <label>选项D：</label>
                        <input class="form-control" name="ditem">
                    </div>

                    <div class="form-group">
                        <label>章节号</label>
                        <input class="form-control" name="chid" value="${sub_ch}" readonly>
                    </div>
                    <button type="submit" class="btn btn-default">提交</button>
                    <button type="reset" class="btn btn-default">重置</button>
                </form>
            </div>


            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">题目列表</h1>
                </div>
                <form role="form"  action="<%=basePath%>upChap" method="post">
                    <input type="file" id="vfile" name="chFile" style="display:none">
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>
                            <th>题号</th>
                            <th>题目问题</th>
                            <th>答案</th>
                            <th>选项A</th>
                            <th>选项B</th>
                            <th>选项C</th>
                            <th>选项D</th>
                            <th>所属章节</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </form>
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

        var table = $('#dataTables-example').DataTable({
            ajax: {
                url: "/qsubjects",
                type: 'GET',
                dataSrc: ""
            },
            columns : [
                { data : "subno" },
                { data : "question" },
                { data : "answer" },
                { data : "aitem" },
                { data : "bitem"},
                { data : "citem"},
                { data : "ditem"},
                { data : "chapter.chid"},
                { data : null}
            ],
        });
    });

</script>
</body>
</html>
