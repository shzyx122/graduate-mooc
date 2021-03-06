<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>欢迎来到学习页面</title>
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">




    <!-- Morris Charts CSS -->
    <link href="<%=basePath%>static/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">

    <!-- jQuery -->
    <script type="text/javascript" charset="utf8" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

    <style type="text/css">
        .right{position:absolute;right:0px;top:0px;width:303px;border-left:7px solid #504f55;}
        ul,ol,dl{list-style:none;}
        li{ float:left; margin-left:20px; list-style-type:none;}
        a{color:#202020;text-decoration:none;}

        .clearfix{overflow:hidden;zoom:1}
        .xyTabs{position:relative;margin-top:-1px}
        .xyTabs li{float:left;width:160px;height:68px;text-align:center;line-height:68px;font-size:16px}
        .xyTabs li a{display:block}
        .xyTabs li.cur{color:#38bb37;font-weight:bold;background:#f6f6f6;border-top:solid 4px #38bb37;}
        .xyTabs li.cur a{color:#38bb37;}

        .leveltwo h3 .icon {
            display: inline-block;
            height: 25px;
            line-height: 25px;
            font-size: 14px;
            color: #999;
            width: 82px;
            text-align: right;
        }
        em {
            width: 17px;
            height: 17px;
            line-height: 17px;
            text-align: center;
            color: #fff;
            display: inline-block;
            background: url(/static/imgs/bg.png) -18px 0px;
            float: left;
            margin: 4px 5px 0px;
            font-style: normal;
            font-size: 12px;
            font-weight: normal;
        }
        em.openlock {
            background-position: -36px 0px;
        }
        em.orange {
            background-position: -48px -160px;
        }
        .leveltwo h3 .articlename {
            margin-left: 5px;
            font-size: 12px;
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
        <div class="container-fluid">
            <ul class="xyTabs clearfix">
                <li class="cur"><a href="#" id="myVid">章节视频</a></li>
                <li><a href="#" id="mySub">章节习题</a></li>
            </ul>


            <div class="left" style="margin-right: 310px;">

            </div>



            <div class="right ui-widget-content" id="selector" style="right: 0px;">
                <div class="switchbtn" style="background-position: 0px -45px;"></div><!--右侧目录隐藏-->
                <div class="showcontent">
                    <div class="thiscontent chapter" style="display: block; height: 422px;margin-top: 80px;" id="content1">
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
            if(data.state==1){
                $(".left").html("");
                $(".left").append('考试章节无视频，请直接答题');
            }else{

            $(".left").html("");
            $(".left").append('<div>当前时长：<p id="current">0:00</p></div>');
            $(".left").append('<div>总时长：<p id="duration">0:00</p></div>');
            $(".left").append('<video src="<%=basePath%>static/videos/'+ data.video+'" width="320" height="240" controls="controls">\n' +
                    '                Your browser does not support the video tag.\n' +
                    '            </video>');
/*
进入页面查找chapter中的click video中当前sno chid的time play
 */
            $(".left").append('<p>播放量: <span id="play"> '+data.play+' </span> </p>')
            $(".left").append('<p>我的浏览总时长: <span id="view">' +data.time+ '</span> </p>')
            $(".left").append('<p>我的完成次数: <span id="view">' +data.learned+ '</span> </p>')
            $(".left").append('<span id="pro"></span></br>');
            $(".left").append('<div class="progress progress-striped active"><span id="hyTime" class="progress-bar progress-bar-success" ' +
                ' role="progressbar"  aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" </span></div>');
            $(".left").append('<span id="hy" ></span>');
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

            }
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

//习题

    var subno=[];
    var mno=[];
    var sizes=0;
    var score=0;
    var stu;  //学号
    function getSub(chapter,mysno){
        $.get('/course/getSub?myCh=' + chapter+'&mySno='+mysno, function (data) {
            subno=[];
            mno=[];
            sizes=0;
            score=0;
                /*alert(data[0].subject.subno);
                alert(data[0].sno);
                alert(data[0].task.taskno);*/
                //alert(chapter)
            console.log("need the data for mno size "+data.length);
                sizes = data.length;
                stu=data[0].sno;
                $(".left").html("");
                $(".left").append("<form action='/student/handin' method=post  ></form>");
                $("form").append("<input type=hidden name=sno value=" + data[0].sno + ">");
                $("form").append("<input type=hidden name=mno value=" + data[0].mno + ">");
                $("form").append("<input type=hidden name=taskno value=" + data[0].task.taskno + ">");
                for (var i = 0; i < data.length; i++) {
                    subno.push(data[i].subject.subno);
                    mno.push(data[i].mno);  //导致切换tab再进来会累加
                    //$("form").append("<input type=hidden name=chid value="+chapter+">");
                    $("form").append("<input type=hidden name=subno" + i + " value=" + data[i].subject.subno + "></br>");
                    $("form").append("<div>" + (i+1) + "、 " + data[i].subject.question + "</div>");
                    if(data[i].state==-1) {  //还没答题
                        $("form").append("<ul><li><label><input type='radio' name=choice" + i + " value=A>A. " + data[i].subject.aitem + "</label></li>");
                        $("form").append("<li><label><input  type='radio' name=choice" + i + " value=B>B. " + data[i].subject.bitem + "</label></li>");
                        $("form").append("<li><label><input type='radio' name=choice" + i + " value=C>C. " + data[i].subject.citem + "</label></li>");
                        $("form").append("<li><label><input type='radio' name=choice" + i + " value=D>D. " + data[i].subject.ditem + "</label></li>");
                        $("form").append("</ul></br>");
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
                console.log("getthe data for mno "+mno.length,mno)
                $("form").append("</br>得分："+score);
                score=0; //否则切换过来又要累加了
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

        var sno = '<%=request.getSession().getAttribute("mySno")%>';
        var cid = '<%=request.getSession().getAttribute("myCid")%>';
        $.ajax({
            url: '/student/myProgress?cid='+cid+"&sno="+sno,  //有了config里面的配置之后就可以通过ip地址加端口的方式以绝对路径访问
            type: 'get',
            async: false,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var content="";
                    if(data[i].state=="exam"){ //要么特殊化，要么和normal合并
                        content="考试:<a href='/course/study/"+data[i].chid+"'>" + data[i].chname + "</a>\n";
                    }else if(data[i].state=="prepare"){
                        content="<p>考试："+data[i].chname+"</p>";
                    }
                    else if(data[i].state=="normal"){
                        console.log("score "+data[i].score)
                        console.log(typeof(data[i].score)=="undefined")
                        content="<a href='/course/study/"+data[i].chid+"'>" + data[i].chname + "</a>";
                        if(data[i].score!=null&&data[i].play!=null) {
                            if (data[i].score != -1)//data[i].play!=0
                                content = "<em class='openlock'></em><span class='articlename'>" +
                                    content + "<h5>习题已完成</h5></span></br>"
                        }
                        else if(typeof data[i].score =="undefined"||data[i].score==null||data[i].score==-1) {
                            console.log("orange")
                                content = "<em class='orange'></em><span class='articlename'>" +
                                    content + "<h5>此章节有习题</h5></span></br>"
                            }

//typeof data[i].score =="undefined" 判断未定义  可以有括号
                    }
                    $("#content1").append("<h3 class='clearfix'><span class='icon'><span class='chapterNumber'>"+
                        (i+1)+"</span></span>"+
                        content+
                        "</h3>");
                }
            }
        });
        /*$.ajax({  //获取一门课的章节      这是右侧导航栏
            url: '/qchapter',
            type: 'get',
            async: true,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {   //修改考试分支
                    if(data[i].exstate!=1)
                    $("#content1").append("<h4 class='clearfix'><span class='icon'>"+(i+1)+
                        "<a href='/course/study/"+data[i].chid+"'>" + data[i].chname +
                        "</a>\n <span class='chapterNumber'></span></h4>");

                }
            }
        });*/
        var $firLi=$("ul.xyTabs li").eq(0);
        var $secLi=$("ul.xyTabs li").eq(1);

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