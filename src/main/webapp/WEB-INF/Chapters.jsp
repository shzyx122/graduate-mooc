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
        li{ float:left; margin-left:20px; list-style-type:none;}
        a{color:#202020;text-decoration:none;}

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
            //alert(data);
            //if(data!=''&&!data) {
            $(".left").html("");
            $(".left").append('<div id="current">当前时长：0:00</div>');
            $(".left").append('<div id="duration">总时长：0:00</div>');
            $(".left").append('<video src="<%=basePath%>static/videos/'+ data.video+'" width="320" height="240" controls="controls">\n' +
                    '                Your browser does not support the video tag.\n' +
                    '            </video>');
/*
进入页面查找chapter中的click video中当前sno chid的time play
 */
            $(".left").append('<p>播放量: <span id="play"> '+data.play+' </span> </p>')
            $(".left").append('<p>我的浏览总时长: <span id="view">' +data.time+ '</span> </p>')
            $(".left").append('<p>我的完成次数: <span id="view">' +data.learned+ '</span> </p>')

            $("video").bind('play', function () { //一旦播放就统计播放量？点击量
                $.post("/course/play?myCh="+chapter);//chapter表+1，用户播放时间开始累计
                //alert(this.duration);  //视频总长
            });

            $("video").bind('ended', function () { //播放完成意味着任务点完成  并且video表观看次数+1
                //$.post("/student/learned?myCh="+chapter);
                var total=$("#duration").text();
                //加在中途退出之后
                var curSec = timeToMills(this.currentTime);
                var durSec = timeToMills(this.duration);
                console.log(total);
                console.log(durSec);
                var learn={"total":durSec}; //原先传的total
                $.ajax({
                    type:'post',
                    url:"/student/learned?myCh="+chapter,
                    data:JSON.stringify(learn),
                    contentType:"application/json;charset =UTF-8",        //必须
                    dataType:"json",//必须

                });
                //浏览器关闭和页面退出也要触发
                //alert(this.currentTime);  //视频当前时长
            });

            $("video").bind('pause',function(){
                //alert(this.currentTime);
                //alert(this.duration);
            });


            $("video").on("timeupdate",function(event){
                var cur=this.currentTime;
                var dur=this.duration;
                onTrackedVideoFrame(cur, dur);
//后端用时分秒记录吧
            });

           // }
        });
    }

    function timeTrans(time){  //second
        var hour = Math.floor (time / 3600);   //向下取整
        var other = time % 3600;
        var minute = Math.floor (other / 60);
        var second = parseInt((other % 60));  // .toFixed (2) 四舍五入2位小数
        var ssec = ((other % 60)%1*1000).toFixed(0);
        return (hour + ':' + minute + ':' + second + ':'+ssec);
    }

    function timeToMills(time){
        var ssec=time*1000;
        return ssec;
    }

    function onTrackedVideoFrame(currentTime, duration){

        var cur = timeTrans(currentTime);
        $("#current").text(cur);

        var time=timeTrans(duration)
        $("#duration").text( time);

        var a=currentTime/duration;
        var b=(a*100).toFixed(0)+"%";
        document.getElementById('hyTime').style.width=b;
        $("#hy").text(b);
        if(currentTime==duration){
            $("#pro").text("(已完成)");
        }
    }



    var subno=[];
    var mno=[];
    var sizes=0;
    var score=0;
    var stu;  //学号
    function getSub(chapter,mysno){
        $.get('/course/getSub?myCh=' + chapter+'&mySno='+mysno, function (data) {

                /*alert(data[0].subject.subno);
                alert(data[0].sno);
                alert(data[0].task.taskno);*/
                //alert(chapter)
                sizes = data.length;
                stu=data[0].sno;
                $(".left").html("");
                $(".left").append("<form action='/student/handin' method=post  ></form>");
                $("form").append("<input type=hidden name=sno value=" + data[0].sno + ">");
                $("form").append("<input type=hidden name=mno value=" + data[0].mno + ">");
                $("form").append("<input type=hidden name=taskno value=" + data[0].task.taskno + ">");
                for (var i = 0; i < data.length; i++) {
                    subno.push(data[i].subject.subno);
                    mno.push(data[i].mno);
                    //$("form").append("<input type=hidden name=chid value="+chapter+">");
                    $("form").append("<input type=hidden name=subno" + i + " value=" + data[i].subject.subno + "></br>");
                    $("form").append("<div>" + (i+1) + "、 " + data[i].subject.question + "</div>");
                    if(data[i].state==-1) {
                        $("form").append("<ul><li><label><input type='radio' name=choice" + i + " value=A>A. " + data[i].subject.aitem + "</label></li>");
                        $("form").append("<li><label><input  type='radio' name=choice" + i + " value=B>B. " + data[i].subject.bitem + "</label></li>");
                        $("form").append("<li><label><input type='radio' name=choice" + i + " value=C>C. " + data[i].subject.citem + "</label></li>");
                        $("form").append("<li><label><input type='radio' name=choice" + i + " value=D>D. " + data[i].subject.ditem + "</label></li>");
                        $("form").append("</ul>");
                    }else{
                        var ch;
                        score+=data[i].percent*data[i].state;
                        console.log("score "+score+" "+data[i].percent*data[i].state);

                        $("form").append("我的答案："+data[i].choice+"</br>");
                        $("form").append("正确答案："+data[i].subject.answer+"</br>");
                        //alert(data[i].choice==data[i].subject.answer)
                        if(data[i].choice==data[i].subject.answer)
                            ch="正确"
                        else ch="错误"
                        $("form").append("结果："+ch+"</br>");
                       // $("form").append("结果："+data[i].choice==data[i].subject.answer?"正确":"错误");

                    }
                }
                $("form").append("</br>得分："+score);
                if(data[0].state==-1) {
                    $("form").append('</br><input type="button" onclick="typeSub(\''+chapter+'\')" value=提交 class="btn btn-default"></input>');
                }


        });

    }
//前端不动了，交给后端批改
    function typeSub(chapter){  //提交答案
        console.log(sizes);
        var choice=[];

        for(var i=0;i<sizes;i++){
            var ch="choice"+i;
            console.log($("input[name="+ch+"]:radio:checked").val())
            //console.log(ch);
            var res=$("input[name="+ch+"]:radio:checked").val();
            //console.log($(ch).val());
            choice.push(res);
        }
        console.log(choice);
        console.log(subno);
        console.log(mno);
        //var mno=$("input[name='mno']").val();
        var taskno=$("input[name='taskno']").val();
        var sno=$("input[name='sno']").val();
        var handin={"choice":choice,"subno":subno,"mno":mno,"taskno":taskno,"sno":sno,"chapter":chapter};

        $.ajax({
            type:'post',
            url:"/student/handin",
            data:JSON.stringify(handin),
            contentType:"application/json;charset =UTF-8",        //必须
            //dataType:"json",//必须   拿掉才会调用success 因为返回的数据类型不是严格按照json格式
            success:function(data){  //没有调用，应该是返回的数据类型不对
                if(data=="success")
                    location.reload(true);
            }
        });

    }




    $(document).ready( function () {

        var chapter = '<%=request.getSession().getAttribute("myChapter")%>';
        var mysno = '<%=request.getSession().getAttribute("mySno")%>';
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
            getVideo(chapter);

        });

        $secLi.on("click",function() {      //习题
            $('li').removeClass("cur");
            $secLi.addClass("cur");
            getSub(chapter,mysno);
        });

        $("body").bind('unload',function(){
            var time=$("#current").text();
            console.log(time);
            $.post("/student/time?myCh="+chapter);
        });
    });
</script>

</body>
</html>