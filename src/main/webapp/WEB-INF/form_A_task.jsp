<%--
  Created by IntelliJ IDEA.
  User: shzyx122
  Date: 2019/2/12
  Time: 15:21
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
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <form role="form" action="<%=basePath%>setTask" method="post">
                    <input type="hidden" name=taskno >
                    <input type="hidden" name=cid value="${cform.cid}" >
                    <div class="form-group">
                        <label>课程名</label>
                        <input class="form-control"  value="${cform.cname}" readonly>
                    </div>
                    <div class="form-group">
                        <label>起始时间</label>
                        <input class="form-control" name="begin" type="datetime-local" id="date">
                    </div>
                    <div class="form-group">
                        <label>课时</label>
                        <input class="form-control" name="during" value="${cform.during}" readonly>
                    </div>
                    <div class="form-group">
                        <label>授课老师</label>
                        <input class="form-control" name="tid" value="${tname}" readonly>
                    </div>
                    <button type="submit" id="sub" class="btn btn-default">提交</button>
                    <button type="reset" class="btn btn-default">重置</button>
                </form>
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

    $(document).ready(function(){  //date赋初始值 默认是当前时间的下一天---24小时后

        var myDate = new Date(),
            Y = trans(myDate.getFullYear()),
            M = trans(myDate.getMonth() + 1),
            D = trans(myDate.getDate()+1),
            hour = trans(myDate.getHours()),
            minute = trans(myDate.getMinutes());

        var curDay = Y + '-' + M + '-' + D;

        //console.log(curDay);
        $('#date').val(curDay + 'T'+hour+':'+minute)

    });

    var index = parent.layer.getFrameIndex(window.name);
    $('#sub').on('click', function(){
        var info='课程安排完毕';
        //alert(info);
        parent.$('#a_${cform.cid}').parent('td').html(info);  //将链接的单元格内容设置为一个text,意味着安排后无法删除，可以在下方表格修改
        parent.layer.tips('设置了开课时间', '#parentIframe', {time: 2000});
        parent.location.reload();
        parent.layer.close(index);
    });

</script>
</body>
</html>
