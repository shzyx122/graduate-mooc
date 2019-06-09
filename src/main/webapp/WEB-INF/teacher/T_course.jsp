<%--
  Created by IntelliJ IDEA.
  User: shzyx122
  Date: 2019/2/5
  Time: 9:25
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

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>慕课平台</title>

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
    <script type="text/javascript">
        function uploadPic(cid) {  //上传文件    //每次上传都会比上次多上传1次
            $('#pfile').click();
            $('#pfile').change(function(){
                //alert('onchange'+$('#pfile').val())
                var myform = new FormData();
                myform.append('cFile', $('#pfile')[0].files[0]);
                $.ajax({

                    url:"<%=basePath%>upPic/" + cid ,
                    type: "POST",
                    //async: false,
                    //cache: false,
                    data: myform,
                    contentType: false,
                    processData: false,
                    success: function (data) {
                        window.location.reload();  //似乎不用dt创建表格就不能用他的ajax
                        //$('#dataTables-example').DataTable().ajax.reload();
                    },
                    error: function (data) {
                    }
                });

            });

        }
    </script>


</head>

<body>

<div id="wrapper">
    <!--顶部导航栏-->
    <!-- Navigation -->
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
                        <a href="#"><i class="fa fa-dashboard fa-fw"></i> 课程成绩</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 信息管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/Cou">课程管理</a>
                            </li>
                            <li>
                                <a href="morris.html">Morris.js Charts</a>
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
    <!--主要内容-->
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-12">
                        <h1 class="page-header">上传课程</h1>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            通过excel文件上传或提交表单信息
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" action="<%=basePath%>insertCou" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label>上传课程excel文件</label>
                                            <input type="file" name="coufile">
                                        </div>
                                        <button type="submit" class="btn btn-default">提交</button>
                                    </form>

                                    <form role="form" action="<%=basePath%>addCou" method="post">
                                        <input type="hidden" name=cid >
                                        <input type="hidden" name=state value="0" >
                                        <div class="form-group">
                                            <label>课程名</label>
                                            <input class="form-control" name="cname" placeholder="输入课程名">
                                        </div>
                                        <div class="form-group">
                                            <label>课时</label>
                                            <input class="form-control" name="during" placeholder="输入课时">
                                        </div>
                                        <div class="form-group">
                                            <label>授课老师</label>
                                            <input class="form-control" name="tid" value="${tuser}" readonly>
                                        </div>
                                        <button type="submit" class="btn btn-default">提交</button>
                                        <button type="reset" class="btn btn-default">重置</button>
                                    </form>
                                </div><!-- class -->

                            </div><!-- /.row (nested) -->

                        </div><!-- /.panel-body -->
                    </div><!--panel-->
                </div><!--class="col-lg-12-->
            </div><!-- /.row  -->

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">课程信息</h1>
                </div>
                <!-- /.col-lg-12 -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        我所开设的课程
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form role="form" action="<%=basePath%>upCou" method="post">
                            <input type="file" id="pfile" name="cFile" style="display:none">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                            <tr>
                                <th>课程名</th>
                                <th>课时</th>
                                <th>图片</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${clist}" var="c">
                                <tr class="odd gradeX">
                                    <c:if test="${edcou!=c.cid}">
                                        <td>${c.cname}</td>
                                        <td>${c.during}</td>
                                        <td>${c.picPath}</td>
                                        <td><a href="/edCou/${c.cid}">修改</a></br>
                                            <a href="<%=basePath%>chapter/${c.cid}">查看章节</a></br>
                                            <a href="#" onclick="uploadPic('${c.cid}')">上传图片</a>
                                        </td>
                                    </c:if>
                                    <c:if test="${edcou==c.cid}">
                                        <input type="hidden" name="cid" value="${c.cid}">
                                        <input type="hidden" name="state" value="0">
                                        <td><input type="text" value="${c.cname}" name="cname" size="12"></td>
                                        <td><input type="text" value="${c.during}" name="during" size="12"></td>
                                        <td><input type="text" readonly value="${c.picPath}" name="during" size="12">${c.picPath}</td>
                                        <td><button type="submit" class="btn btn-default">确认</button></td>
                                    </c:if>
                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>
                        <!-- /.table-responsive -->
                        </form>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="<%=basePath%>static/vendor/jquery/jquery.min.js"></script>

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
        $('#dataTables-example').DataTable();
    } );

</script>
</body>
</html>
