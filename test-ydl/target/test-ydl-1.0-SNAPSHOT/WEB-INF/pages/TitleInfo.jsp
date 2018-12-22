<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/11/14
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/11/14
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<title>Title</title>
<link rel="stylesheet" href="../../static/css/common_v6.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/topiclist.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/board_v7.css" type="text/css" />
<script type="text/javascript">
    if (/Android|webOS|iPhone|iPod|BlackBerry|Windows CE|Windows Phone/i.test(navigator.userAgent)) {
        if (window.location.href.indexOf("?pc") < 0) {
            window.location.href="http://m.025002.com/bbs/boardshow.aspx?boardid=117326";
        }
    }
</script>
</head>
<body>
<style>
    body{background:#c8cde1 url(../../static/images/board_bg8.gif) top center no-repeat}
</style>
<a name="top_r" id="top_r"></a>
<script type="text/javascript" src="../../static/js/jquery.js"></script>
<script type="text/javascript" src="../../static/js/lhgdialog.js"></script>
<script type="text/javascript" src="../../static/js/comm.js"></script>
<jsp:include page="../../common/header.jsp"></jsp:include>
<div class="dangq" style="width: 952px;">当前位置：<a href="/">网站首页</a> >> <a href=https://www.chongshe.cn/news/>交流中心</a> >> <a href=https://www.chongshe.cn/news/cwxw/>宠物论坛</a></div>
<div class="board_box">
    <div class="board_head">
        <div class="board_pic"><img src="http://img.pccoo.cn/bbs/icon/bbs01.gif" alt="宠物交流中心"></div>
        <div class="board_nrbox">
            <div class="board_name"><span>宠物交流中心</span><br/>
                贴数：<i>${count}</i> </div>
            <div class="board_shuom"></div>

        </div>

        <form action="/communicate.html?act=communite" method="post">
            <div class="search" style="float:right;margin-top: 10px">
                <ul>
                    <li>
                        <input type="text" name="title" id="keywords" onfocus="if(this.value=='搜索其实很简单(*^__^*)') {this.value='';}" onblur="if(this.value=='') {this.value='搜索其实很简单(*^__^*)';}" value="搜索其实很简单(*^__^*)">
                        <input name="method" type="radio" checked="" value="1">标题
                        <input name="method" type="radio" value="2">昵称
                        <script>
                            $(function(){
                                if($("input[name=method]").value()==1){
                                    $("#keywords").attr('name',title);
                                }else{
                                    $("#keywords").attr('name',info);
                                }
                            })
                        </script>
                        <input type="submit"  value="搜索">
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div id="pbid" class="">
        <div class="board_position">
            <div class="board_dh">
                <ul>
                    <li class="board_hover"><a href="/communicate.html?act=communite">本版帖子</a></li>
                    <li><a href="/communicate.html?act=new" rel="nofollow">最新主题</a></li>
                    <li><a href="/communicate.html?act=images" rel="nofollow">图片</a></li>
                    <li><a href="/communicate.html?act=introduce" rel="nofollow">介绍</a></li>
                </ul>
                <div class="board_banben">
                    <ul>
                        <li class="board_banben1"><a href="board-112342-1-1.html" class="active" title="图文版"></a></li>
                        <li class="board_jiuban"><a href="javascript:void(0);" onclick="verSion(1)" title="切换到旧版">旧版</a></li>
                    </ul>
                </div>
                <div class="post_bk_btn_quick"><a href="/communicateEdit.html">发表新帖</a></div>
            </div>

        </div>
    </div>
    <div id="topic_new" >
        <table width="980" border="0" cellspacing="0" cellpadding="0">
            <input id="pageNum" name="pageNum" type="hidden"/>
            <tbody><tr>
                <td id="topiclist" valign="top">
                    <div date-topendtime="" class="topicshow">
                        <div class="topic_show_l">
                            <div class="topic_show_num" title="点击:${info.seeCount}回复:${info.replyCount}"><span><font color="red">${info.seeCount}</font>/${info.replyCount}</span></div>
                            <div class="topic_show_con">
                                <div class="topic_show_tit">
                                    ${info.title}
                                </div>
                                    ${info.info}
                                <div class="topic_show_img">
                                    <c:if test="${not empty info.image}">
                                        <img style="height:100%; weight:100%;" src="http://localhost:8080/petblog/image/${info.image}"></a>
                                    </c:if>
                                </div>
                            </div>
                            <div class="topic_show_l">
                                <div title="发帖时间"><fmt:formatDate value="${info.createDate}" pattern="yyyy-MM-dd"></fmt:formatDate></div>
                                <div class="topic_show_relpay">共${info.replyCount}条评论</div>
                                <div  title="最后回复时间"><fmt:formatDate value="${info.lastDate}" pattern="yyyy-MM-dd"></fmt:formatDate></div>
                            </div>
                        </div>
                        <form action="/communicate.html?act=addReply&id=${id}" method="post">
                            <textarea name="reply" ></textarea><br/>
                            <input type="submit" value="评论">
                        </form>
                        <ul type="circle">
                        <c:forEach items="${replyTOs}" var="re">
                            <li>${re.reply}</li>
                        </c:forEach>
                        </ul>
                    </div>
                </td>
                <td id="tool" valign="top">
                    <div class="com_r">
                        <div class="com_r_tit"><b>热帖排行</b></div>
                        <div class="ph_num">
                            <ul>
                                <c:forEach items="${hot}" var="h">
                                    <li><a href="/communicate.html?act=communite&title=${h.title}"   target="_blank" title="${h.title}">${h.title}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </td>
            </tr>
            </tbody></table>
        </form>
    </div>
</div>
</body>
</html>