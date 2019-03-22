<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>欢迎来到学习页面</title>
    <style type="text/css">
        .right{position:fixed;right:0px;top:0px;width:303px;border-left:7px solid #504f55;}
    </style>
</head>
<body>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="left" style="margin-right: 310px;">

            </div>
            <div class="right ui-widget-content" id="selector" style="right: 0px;">
                <div class="switchbtn" style="background-position: 0px -45px;"></div><!--右侧目录隐藏-->
                <div class="showcontent">
                    <div class="thiscontent chapter" style="display: block; height: 422px;" id="content1">
                        <!--放链接-->
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

<script type="text/javascript">
    //video.currentTime；//获取视频当前播放时间

    //如果视频加载完成 播放按钮图片显示，视频图片设置为空，显示视频内容
   /* video.oncanplay=function(){
        $("#playimg").show();
        $("#video").attr("poster","");
    }*/

    //视频播放事件，点击播放可以记录学习进度，有获取当前视频播放时间属性
  /* video.onplay=function(){
        if($("#is_record").val()==null || $("#is_record").val()==''){
            $.ajax({*/

    //视频暂停事件
    //video.onpause=function(){

    //audio.addEventListener('ended', function () { 耶可以绑定onended方法

    function getVideo(chapter) {
        $.get("/course/getVideo?myCh=" + chapter, function (data) {
            alert(data);
            //if(data!=''&&!data) {
                $(".left").append('<video src="" width="320" height="240" controls="controls">\n' +
                    '                Your browser does not support the video tag.\n' +
                    '            </video>')
                $("video").attr('src', '<%=basePath%>static/videos/' + data);//获取视频资源
                $("video").bind('play', function () { //一旦播放就统计播放量？点击量

                });

                $("video").bind('ended', function () { //播放完成意味着任务点完成
                    alert($("video").attr("currentTime"));
                });
           // }
        });
    }

    $(document).ready( function () {

        var chapter = '<%=request.getSession().getAttribute("myChapter")%>';
        getVideo(chapter);

        $.ajax({  //获取一门课的章节
            url: '/qchapter',
            type: 'get',
            async: true,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#content1").append("<h4 class='clearfix'><span class='icon'>"+(i+1)+
                        "<a href='/course/study/"+data[i].chid+"'>" + data[i].chname +
                        "</a>\n <span class='chapterNumber'></span></h4>");

                }
            }
        });
    });
</script>

</body>
</html>