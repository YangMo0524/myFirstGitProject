//广告提示
// PC首页
$("div.advtip").each(function () {
	$(this).children("a").css({ position: 'relative', display: 'block' }).append('<span class="guanggao" style="position:absolute;z-index:9;left:2px;bottom:5px;margin:0;padding:0;width:19px;height:10px;background:url(http://c.imgccoo.cn/v10/images/advtip.png);"></span>');
});
$(".advtip").each(function() {
	if($(this).children().children('#scroll_div').length>0){
		$(this).children('#gongao').css({position:'relative',display: 'block'}).append('<span class="guanggao" style="position:absolute;z-index:9;left:2px;bottom:5px;margin:0;padding:0;width:19px;height:10px;background:url(http://c.imgccoo.cn/v10/images/advtip.png);"></span>');
	}else{
		$(this).children("a").css({position:'relative',display: 'block'})
	}
});
$(".advtip object").each(function() {
    $(this).parent(".advtip").css("position", "relative").append('<span class="guanggao" style="position:absolute;z-index:9;left:2px;bottom:5px;margin:0;padding:0;width:19px;height:10px;background:url(http://c.imgccoo.cn/v10/images/advtip.png);"></span>')
});

