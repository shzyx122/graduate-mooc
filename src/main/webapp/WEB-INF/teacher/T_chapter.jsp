<%--
  Created by IntelliJ IDEA.
  User: shzyx122
  Date: 2019/2/9
  Time: 10:17
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

    <!-- jQuery -->
    <script type="text/javascript" charset="utf8" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

    <!-- DataTables -->
    <script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
    <script type="text/javascript">
        function uploadVideo(chid) {  //上传文件    //每次上传都会比上次多上传1次
            $('#vfile').click();
            $('#vfile').change(function(){
                //alert('onchange'+$('#vfile').val())
                var myform = new FormData();
                myform.append('chFile', $('#vfile')[0].files[0]);
                /*var request = new XMLHttpRequest();
                request.open("POST",url );
                request.send(myform);*/
                console.log("formdata used")
                $.ajax({   //可能是ajax提交formdata导致的
                    url:"<%=basePath%>upvideo/" + chid ,
                    type: "POST",
                    //async: false,
                    //cache: false,
                    data: myform,
                    contentType: false,
                    processData: false,
                    success: function (data) {  //每次成功success都会多调用一次，其实是ajax多调用了一次
                        console.log("ready fresh")
                        window.location.reload();  //确实刷新后不会迭代上传，但是后端也刷新了，数据源会开个新的
                        //$('#dataTables-example').DataTable().ajax.reload(null,false);
                        console.log("fresh over",$('#vfile')[0].files)
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
                <form role="form" id="uploadform" action="<%=basePath%>insertChap" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>批量添加章节</label>
                        <input type="file"  name="chfile">
                    </div>
                    <button type="submit" class="btn btn-default">提交</button>
                </form>

                <form role="form" action="<%=basePath%>addChap" method="post">
                    <input type="hidden" name=chid >
                    <div class="form-group">
                        <label>章节名</label>
                        <input class="form-control" name="chname" placeholder="输入章节名">
                    </div>
                    <div class="form-group">
                        <label>是否考试</label>
                        <input class="form-control" name="exstate" >
                    </div>
                    <div class="form-group">
                        <label>课号</label>
                        <input class="form-control" name="cid" value="${cRoot}" readonly>
                    </div>
                    <button type="submit" class="btn btn-default">提交</button>
                    <button type="reset" class="btn btn-default">重置</button>
                </form>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">章节信息</h1>
                </div>
                <form role="form"  action="<%=basePath%>upChap" method="post">
                    <input type="file" id="vfile" name="chFile" style="display:none">
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>
                            <th>章节名</th>
                            <th>是否考试</th>
                            <th>视频地址</th>
                            <th>所属课程</th>
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
                url: "/qchapter",
                type: 'GET',
                dataSrc: ""
            },
            columns : [
                { data : "chname" },
                { data : "exstate" },
                { data : "video" },
                { data : "cid" },
                { data: null}

            ],
            columnDefs: [
                {
                    "targets": 4,   //对于第5列，每一行都换成链接
                    // 可以判断每行的video设置不一样的连接
                    "render" : function(data, type, row, meta) {
                        data = '<a href="<%=basePath%>delch?ch=' + row.chid + '" >删除</a></br>';
                        if (row.exstate != 1) {  //非考试章节

                            if (row.video !== '')
                                data += '视频已被上传</br><a href="#" onclick="uploadVideo(\'' + row.chid + '\')">重传视频</a></br>'; //改成重传和查看  重传可能需要删除原先目录的文件
                            else data += '<a href="#" onclick="uploadVideo(\'' + row.chid + '\')">上传视频</a></br>';
                        }
                        data+='<a href="<%=basePath%>subject/'+row.chid+'" >查看题库</a></br>'
                        return data;
                    }
                },
                {
                    "targets": 1,
                    "render" : function(data, type, row, meta) {
                        if(data!=='') {
                            if (data === 1)    //直接 if else 则有可能 空的时候也显式else里面的东西
                                return "考试";
                            else if (data === 0) return "非考试";
                        }
                        return '';

                    }
                },
                {
                    "targets": 2,
                    "render" : function(data, type, row, meta) {
                        if(data!=='')
                            return "视频已被上传";
                        return "尚未上传视频"

                    }
                },
//调试完后把2去掉
                {
                    targets: [0,2],
                    createdCell:function(cell, cellData, rowData, rowIndex, colIndex){
//td节点，单元格里的数据，正行的数据对象，单元格的行索引，单元格的列索引。
                        $(cell).click(function(){
                            console.info(rowData);//显示数据
                            $(this).html('<input type="text" size="16"/>');
                            var aInput = $(this).find(":input");
                            aInput.focus().val(cellData);
                            console.log("text "+cellData)
                        });

                        $(cell).on("blur",":input",function(){
                            var text = $(this).val(); //控件中的过程数据（编辑内容，最后想要显式的样子）
                            console.log("before")
                            //console.info(cell)
                           /* console.log(cellData)
                            console.log(text)
                            console.log(table.cell( cell ).data())*/
                            //$(cell).html(text);  //文本中的数据
                            table.cell( cell ).data(text);//将输入数据赋值到文本中
                            cellData=text;   //结点中的数据  不加的话再次文本框不会改变，改变的只有页面显示

                            $.post('<%=basePath%>upch',{  //json这里具体的值加引号会导致数据长度过长错误
                                'id':rowData.chid,'name':rowData.chname,
                                'vid':rowData.video,'ex':rowData.exstate });
                            console.log("after")
                            //console.info(cell)
                            /*console.log(cellData)
                            console.log(text)
                            console.log(table.cell( cell ).data())*/
                            table.ajax.reload(null, false);
                        });

                        $(cell).on("blur",":input",function(e){  //取消事件冒泡
                            e.stopPropagation();
                        });
                    }
                },
                {
                    targets: 1,  //第二列考试状态下拉框修改
                    createdCell:function(cell, cellData, rowData, rowIndex, colIndex){

                        $(cell).click(function(){
                            console.info(rowData);
                            console.info(cellData);//显示数据
                            console.info(cell);//单元格节点
                            $(this).html('<select name="state">' +
                                '<option value="0">非考试</option>' +
                                '<option value="1">考试</option>' +
                                '</select>');
                            var sel = $(this).find("select");
                            sel.focus().val(cellData);
                            console.info(sel.focus().val(cellData));
                        });

                        $(cell).on("blur",":input",function(){
                            var text = $(this).val();
                            var htm = $("select option[value="+text+"]").text();  //文本不变不是cell.html的问题
                            table.cell( cell ).data(text);
                            cellData=htm;
                            //文本内容没变，只是值改变，所以还是要刷新下
                            $.post('<%=basePath%>upch',{
                                'id':rowData.chid,'name':rowData.chname,
                                'vid':rowData.video,'ex':rowData.exstate });

                            table.ajax.reload(null, false);
                           // window.location.reload();
                        });

                        $(cell).on("click",":input",function(e){
                            e.stopPropagation();
                        });
                        $(cell).on("blur",":input",function(e){
                            e.stopPropagation();
                        });
                    }
                }

            ]


        });

    });


</script>
</body>
</html>
