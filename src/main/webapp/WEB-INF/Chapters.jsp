<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>欢迎来到学习页面</title>
</head>
<body>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <video src="" width="320" height="240" controls="controls">
                Your browser does not support the video tag.
            </video>
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
    $(document).ready( function () {
        $.get("/course/getVideo",function(data){
            alert(data);
            $("video").attr('src','<%=basePath%>static/videos/'+data);
            $("video").bind('play',function(){

            });

            $("video").bind('ended',function(){
                alert($("video").attr("currentTime"));
            });
        });
    });
</script>

</body>
</html>