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
        ul,ol,dl{list-style:none;}
        .clearfix{overflow:hidden;zoom:1}
        .xyTabs{position:relative;margin-top:-1px}
        .xyTabs li{float:left;width:160px;height:68px;text-align:center;line-height:68px;font-size:16px}
        .xyTabs li a{display:block}
        .xyTabs li.cur{color:#38bb37;font-weight:bold;background:#f6f6f6;border-top:solid 4px #38bb37;}
        .xyTabs li.cur a{color:#38bb37;}
    </style>
</head>
<body>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <ul class="xyTabs clearfix">
                <li class="cur"><a href="#" id="myVid">章节视频</a></li>
                <li><a href="#" id="mySub">章节习题</a></li>
            </ul>

            <div id="current">当前时长：0:00</div>
            <div id="duration">总时长：0:00</div>
            <div class="left" style="margin-right: 310px;">

            </div>

            <span id="pro"></span>
            <div class="progress progress-striped active" style="width:100%">
	        <span id="hyTime" class="progress-bar progress-bar-success"  role="progressbar"  aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"      >
	        </span>
            </div> <span id="hy" ></span>
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
            $(".left").append('<video src="<%=basePath%>static/videos/'+ data.video+'" width="320" height="240" controls="controls">\n' +
                    '                Your browser does not support the video tag.\n' +
                    '            </video>');
/*
进入页面查找chapter中的click video中当前sno chid的time play
 */
            $(".left").append('<p>播放量: <span id="play"> '+data.play+' </span> </p>')
            $(".left").append('<p>我的浏览总时长: <span id="view">  </span> </p>')
            $(".left").append('<p>我的完成次数: <span id="view">  </span> </p>')

            $("video").bind('play', function () { //一旦播放就统计播放量？点击量
                $.post("/course/play?myCh="+chapter);//chapter表+1，用户播放时间开始累计
                //alert(this.duration);  //视频总长
            });

            $("video").bind('ended', function () { //播放完成意味着任务点完成  并且video表观看次数+1
                $.post("/student/learned?myCh="+chapter);
                //还要统计一下时长  并且浏览器关闭和页面退出也要触发
                //alert(this.currentTime);  //视频当前时长
            });

            $("video").bind('pause',function(){
                //alert(this.currentTime);
            });

            $("video").on("timeupdate",function(event){
                onTrackedVideoFrame(this.currentTime, this.duration);
            });

           // }
        });
    }

    function onTrackedVideoFrame(currentTime, duration){

        $("#current").text(currentTime);
        $("#duration").text(duration);
        var a=currentTime/duration;
        var b=(a*100).toFixed(0)+"%";
        document.getElementById('hyTime').style.width=b;
        $("#hy").text(b);
        if(currentTime==duration){
            $("#pro").text("(已完成)");
        }
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
        var $firLi=$("ul li").eq(0);
        var $secLi=$("ul li").eq(1);

        $firLi.on("click",function(){     //视频播放
            $('li').removeClass("cur");
            $firLi.addClass("cur");


        });

        $secLi.on("click",function() {      //习题
            $('li').removeClass("cur");
            $secLi.addClass("cur");
        });
    });
</script>

</body>
</html>