
var url="http://count.ccoo.cn/stat.asp?siteid=178&shopid=0&style=&referer="+escape(document.referrer)+"&screenwidth="+(screen.width);
var script = document.createElement("script");
script.type = "text/javascript"; 
script.src = url; 
document.body.appendChild(script); 
