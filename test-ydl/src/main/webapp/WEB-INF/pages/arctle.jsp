
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<script type="text/javascript">
    /* $(function () {
         getpreart("${article.artcleId},${article.artcleReleaseDate},${article.artcleReadNum}");
         getnextart("${article.artcleId},${article.artcleReleaseDate},${article.artcleReadNum}");
     })

    $(function () {
        function getpreart(artcleId,artcleReleaseDate,artcleReadNum) {
           var artcleId=artcleId;
           var artcleReleaseDate = artcleReleaseDate;
           var artcleReadNum = artcleReadNum;

           $.ajax({
               url:'/Artcle.html?act=getpreart&articleId='+articleId+'&artcleReleaseDate='+artcleReleaseDate+'&artcleReadNum'+artcleReadNum+'',
               method : 'post',
               dataType : 'json' ,
               success :function (data) {
                   var htmlText = '';
                   if (htmlText!=null){
                       htmlText+='上一篇：<a href="<%=request.getContextPath()%>/Artcle.html?act=info&articleId='+data.artcleId+'">';
                       htmlText+=data.artcleTitle+'</a>';
                   }
                   $("#preart").append(htmlText);
               }
           })
        }
    })
    $(function () {
        function getnextart(artcleId,artcleReleaseDate,artcleReadNum) {
            var artcleId=artcleId;
            var artcleReleaseDate = artcleReleaseDate;
            var artcleReadNum = artcleReadNum;

            $.ajax({
                url:'/Artcle.html?act=getnextart&articleId='+articleId+'&artcleReleaseDate='+artcleReleaseDate+'&artcleReadNum'+artcleReadNum+'',
                method : 'post',
                dataType : 'json' ,
                success :function (data) {
                    var htmlText = '';
                    if (htmlText!=null){
                        htmlText+='上一篇：<a href="<%=request.getContextPath()%>/Artcle.html?act=info&articleId='+data.artcleId+'">';
                        htmlText+=data.artcleTitle+'</a>';
                    }
                    $("#nextart").append(htmlText);
                }
            })
        }
    })*/
</script>
<jsp:include page="../../common/header.jsp"></jsp:include>
<div class="dangq">当前位置：<a href="/index.html">网站首页</a> >>
    <a href="<%=request.getContextPath()%>/Artcle.html?act=list&lableId=${article.label.labelId}">${article.label.labelName}</a>
</div>
<div class="main">
    <div class="ow-news">
        <div class="ncont">
            <h1 class="title">${article.artcleTitle}</h1>
            <div class="byline"><span class="source">文章来源：${article.artcleSource}</span><span class="author">文章编辑：${article.artcleEditor}</span><span class="datetime">发布时间： <fmt:formatDate type="both" dateStyle="long" timeStyle="long" value="${article.artcleReleaseDate}" /></span><span class="views">阅读次数：${article.artcleReadNum}<script src="/plus/hit.php?aid=11234" type="text/javascript"></script></span></div>
            <div class="content"><p>
                ${article.artcleContent}
            </p>
            </div>
                <%--<p>
                </p><div class="imgbox"><img src="https://img.chongshe.cn/image/20181101/20181101103357_39427.jpg" alt="“新职业”报告：宠物医生月入2万 超3成育婴师为男性"></div>
                <p></p>
                <p>
                    月嫂最舍得花钱
                </p>
                <p>
                    <a href="https://www.chongshe.cn/" target="_blank">宠物</a>医生收入最高
                </p>
                <p>
                    近几年，随着高校毕业生人数不断增多，以及生活服务业岗位出现巨大需求缺口，有相当一部分大学毕业生转向新职业。
                </p>
                <p>
                    数据显示，拥有大专及以上学历的新职业人群占比达60.27%，仅有11.76%文化程度在初中以下。另外，晚婚现象在新职业人群中也十分突出。报告发现，位居单身率排行前三名的新职业分别是：调酒师、装修设计师、早教师。
                </p>
                <p>
                    在消费升级背景下，消费者的需求旺盛并日趋多样化，新职业人群的收入也随之水涨船高。数据显示，新职业人群月收入高于5000元的已过半数，达到52.84%。其中，宠物医生平均月收入最高，有28.57%的月收入在2万元以上。
                </p>
                <p>
                    在消费结构上，新职业人群在休闲娱乐方面的消费占比不低。报告发现，最舍得花钱的新职业是月嫂，有26.67%的月嫂每月在休闲娱乐上消费2000元以上。
                </p>
                <p>
                </p><div class="imgbox"><img src="https://img.chongshe.cn/image/20181101/20181101103405_63765.jpg" alt="“新职业”报告：宠物医生月入2万 超3成育婴师为男性"></div>
                <p></p>
                <p>
                    对工作“忠诚度”更高
                </p>
                <p>
                    超3成新职业人群从未跳槽
                </p>
                <p>
                    与白领频频跳槽不同，新职业人群的跳槽数据格外惹眼。报告显示，有34.45%的新职业人群入职以来从未跳过槽;平均跳槽频率在3年以上才会跳一次的，占比达62.06%。这表明了相较于白领，新职业人群对工作“忠诚度”更高。
                </p>
                <p>
                    入职原因数据充分佐证了这一结论。报告发现，“喜欢这个行业和职业”是新职业人群最普遍的入职原因。73.67%的新职业人群是因为内心喜欢而选择这份工作，因“内心热爱”而脚踏实地、敢打敢拼。报告发现，新职业人群的工作强度相当大，平均一周工作50小时以上的占比达75.34%，忙起来不分昼夜。
                </p>
                <p>
                </p><div class="imgbox"><img src="https://img.chongshe.cn/image/20181101/20181101103411_56277.jpg" alt="“新职业”报告：宠物医生月入2万 超3成育婴师为男性"></div>
                <p></p>
                <p>
                    另外，由于社会观念的发展进步和就业群体的年轻化，越来越多的年轻人以“兴趣为导向”，就业观不再拘泥于传统大众视角。数据显示，在男性标签更强的汽车美容技师中，女性占比达23.08%;在劳动强度较大的宠物医生中，女性占比高达42.86%;而被大众普遍认为是“女性职业”的工作中，男性育婴师占比达33.33%。
                    华商报记者 汤晓燕
                </p>--%>

            <div class="prev-next">

                <c:if test="${perarticle==null}">
                    <div class="prev">
                        上一篇：没有了
                    </div>
                </c:if>

                <c:if test="${perarticle!=null}">
                <div class="prev" id="preart">上一篇：
                    <a href="<%=request.getContextPath()%>/Artcle.html?act=info&thisart=${prethisart}&labeltag=${labeltag}&label=${perarticle.label.labelId}&articleId=${perarticle.artcleId}" title="">${perarticle.artcleTitle}</a>
                </div>
                </c:if>
               <c:if test="${nextarticle!=null}">
                <div class="next" id="nextart">
                    下一篇：<a href="<%=request.getContextPath()%>/Artcle.html?act=info&thisart=${nextthisart}&labeltag=${labeltag}&label=${nextarticle.label.labelId}&articleId=${nextarticle.artcleId}">${nextarticle.artcleTitle}</a>
                </div>
               </c:if>
                <c:if test="${nextarticle==null}">
                    <div class="next">
                        下一篇：没有了
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <jsp:include page="../../common/lright.jsp"></jsp:include>
</div>

</div>
<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>