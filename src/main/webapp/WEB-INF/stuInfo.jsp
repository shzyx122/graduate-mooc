<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
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
    <style type="text/css">
        .grid{ float:left; margin-left:20px; list-style-type:none;}
    </style>
    <title>我的个人信息</title>
</head>
<body>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-12">
                    <h1 class="page-header">我的课程</h1>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <ul id="courses">

                        </ul>

                    </div>
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

<!-- Morris Charts JavaScript -->
<script src="<%=basePath%>static/vendor/raphael/raphael.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>static/dist/js/sb-admin-2.js"></script>


<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>static/dist/js/sb-admin-2.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>

<script type="text/javascript">
    $(document).ready( function () {
        $.get("/student/info",function(data){
            for(var i=0;i<data.length;i++){
                $("#courses").append("<li class='grid'>" +
                    "<div>\n"+
                    "<a href='/course/front?cour="+data[i].cid+"'>\n" +
                    "   <img src='<%=basePath%>static/imgs/"+data[i].pic_path+"'>\n" +
                    "</a>\n" +
                    "</div>" +
                    "<div>\n"+
                    "<a href='/course/front?cour='\'+id+\'' title='"+name+"'>"+data[i].cname+"</a></div>" +
                    "<div>\n"+
                    "我的成绩:"+data[i].grade+
                    "<div>\n"+
                    "</li>");
            }
        });
    });


</script>


</body>
</html>