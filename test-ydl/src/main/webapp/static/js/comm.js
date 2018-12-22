//不显示倒计时
function showdialog(title, html, width, height, icon) {
    var api = $.dialog({ id: showdialog, title: title, max: false, min: false, lock: true, content: html, width: width, height: height, icon: icon, resize: false });
}
//title倒计时	
function showdialog_time(title, html, width, height, icon) {
    var api = $.dialog({
        title: title,
        max: false,
        min: false,
        lock: true,
        width: width,
        height: height,
        icon: icon,
        resize: false,
        init: function() {
            var that = this,
                i = 5;
            var fn = function() {
                that.title(i + '秒后关闭');
                !i && that.close();
                i--;
            };
            timer = setInterval(fn, 1000);
            fn();
        },
        close: function() { clearInterval(timer); },
        content: html
    });
}

function apiclose() {
    var api = $.dialog({ id: showdialog });
    api.close();
}
//----功能类
function sLogin() {
    var title = "用户登录";
    var html = 'url:/forum/sj_login.asp';
    showdialog(title, html, '400px', '200px');
}

function daka(username, niname) {
    var username = username;
    var niname = niname;
    var html = "<div id=showdetails><div class=showdetails></div></div>";
    var title = "论坛签到";
    showdialog(title, html, '360px');
    $.post("/forum/ajax_bbs.asp", { username: escape(username), pwd: escape(niname), action: "daka" }, function(data) {
        switch (data) {
            case "0":
                apiclose();
                sLogin();
                break;
            case "1":
                $.get('/forum/user/mood_xq.asp?ac=qd', function(data) {
                    if (data) { $("#showdetails").html(data); }
                });
                break;
            case "2":
                apiclose();
                showdialog_time("信息提示", "您今日已签到,请明天继续", "", "", "success.gif");
                break;
            default:
                $("#showdetails").html("签到失败");
                break;
        }
    });
}

function opdg_ft(id, url, width, height, title) {
    $.post(url, function(Data) {
        html = unescape(Data);
        showdialog(title, html, width, height);
    });
}

function opdg(url, title) {
    html = 'url:' + url;
    showdialog(title, html);
}

function show_box(id, data, width, height, title, t) {
    var title = "信息提示";
    html = unescape(data);
    showdialog_time(title, html, width, height);
}
//添加好友
function addfriend(u) {
    var s = "addfriend"
    $.post("/forum/boarding.asp", { u: u, s: s }, function(data) {
        if (data != "login") {
            var title = "添加好友";
            html = unescape(data);
            showdialog_time(title, html);
        } else { sLogin(); }
    });
}

function showdetails(id, action) {
    var title = "兑换中心";
    var html = "<div id=showdetails><div class=showdetails></div></div>";
    showdialog(title, html, '380px');
    $.post("/forum/buydetails.asp?tid=" + id + "", { action: action }, function(data) { $("#showdetails").html(data); });
}

function buydetails(mids, tid, uid, rid, action) {
    var title = "兑换中心";
    var html = "<div id=showdetails><div class=showdetails></div></div>";
    showdialog(title, html, '380px');
    $.post("/forum/buydetails.asp", { mids: mids, tid: tid, uid: uid, rid: rid, action: action }, function(data) { $("#showdetails").html(data); });
}

function propuse(mids, tid, uid, rid) {
    var title = "道具中心";
    var html = "<div id=showdetails><div class=showdetails></div></div>";
    showdialog(title, html, '380px');
    $.post("/forum/proproute.asp?" + Math.random(), { mids: mids, tid: tid, uid: uid, rid: rid }, function(data) {
        if (data == 0) { buydetails(mids, tid, uid, rid, "route"); } else { $("#showdetails").html(data); }
    });
}

function getTask(tid, action) {
    var title = "任务中心";
    var html = "<div id=showdetails><div class=showdetails></div></div>";
    showdialog(title, html);
    $.post("/forum/taskdetails.asp", { tid: tid, action: action }, function(data) {
        var arrRs = eval("(" + data + ")");
        apiclose();
        if (action == 'view') { showdialog(title, arrRs.message); } else {
            var icon = 'success.gif';
            if (arrRs.status == 0) { icon = 'alert.gif'; }
            showdialog(title, arrRs.message, "", "", icon);
        }
    });
}

function SendSmsInfo(users) {
    var title = "站内信";
    var html = "<div id=showdetails><div class=showdetails></div></div>";
    showdialog(title, html, "340px");
    $.post("/forum/mess_send.asp", { SmsUserName: users }, function(data) {
        if (data) { $("#showdetails").html(data); } else { $("#showdetails").html("系统繁忙，请稍后重试!"); }
    });
}

function SendMood() {
    var title = "发布心情";
    var html = "<div id=showdetails><div class=showdetails></div></div>";
    showdialog(title, html, "340px");
    $.post("/forum/user/mood_xq.asp", function(data) {
        if (data) { $("#showdetails").html(data); } else { $("#showdetails").html("系统繁忙，请稍后重试!"); }
    });
}

function userapply() {
    var title = "用户组申请";
    var html = "<div id=showdetails><div class=showdetails></div></div>";
    showdialog(title, html, "320px");
    $.post("/forum/ajax_bbs.asp", { action: "apply" }, function(data) {
        if (data) { $("#showdetails").html(data); } else { $("#showdetails").html("暂时未开放可以申请的用户组!"); }
    });
}

function getNetCookie(bigname, smallname) {
    var re = new RegExp("(\;|^)[^;]*(" + bigname + ")\=([^;]*)(;|$)");
    var match = re.exec(document.cookie);
    if (match) {
        var cookieValue = match != null ? match[3] : null;
        var reg = new RegExp("(^|&*)" + smallname + "=([^&]*)(&|$)");
        var r = cookieValue.match(reg);
        if (r != null) return r[2];
    }
    return null;
}

if (getNetCookie("task", "status")) {
    var taskinfo = unescape(unescape(unescape(getNetCookie("task", "status"))));
    $.dialog.tips(taskinfo, 5, "success.gif", function() {
        $.post("/forum/taskdetails.asp", { action: "cookie" });
    });
}
//----显示类
$(document).ready(function() {
        //论坛顶部通用导航 						   
        $(".topnav").hover(function() {
            $(this).addClass("curr_index");
            $(this).children("div").show();
        }, function() {
            $(this).removeClass("curr_index");
            $(this).children("div").hide();
        });
        $(".topnav li").hover(function() {
            $(this).addClass("tcurr");
        }, function() {
            $(this).removeClass("tcurr");
        });
        $(".mess_tx").hover(function() {
            $(".user_mess").show();
        }, function() {
            $(".user_mess").hide();
        });
        //快捷导航
        $(".kuaijie").hover(function() {
            $(".menu_kuaijie").show();
        }, function() {
            $(".menu_kuaijie").hide();
        });
        $(".bankuai_sub_l").hover(function() {
            $(this).children(".fabu").show();
        }, function() {
            $(this).children(".fabu").hide();
        });
        $(".fatopic_btn_con").hover(function() {
            $(this).children("div").show();
        }, function() {
            $(this).children("div").hide();
        });
        $(".huodong_tu").hover(function() {
            $(this).addClass("hdcurr");
        }, function() {
            $(this).removeClass("hdcurr");
        });
        $(".v7boxtop_tu").hover(function() {
                $(this).addClass("curr_tu");
            },
            function() {
                $(this).removeClass("curr_tu");
            });
        //版主管理
        /*$(".guanli").toggle(function(){
        $(this).parents(".topic_n").find(".manage_tip").attr("style","display:block");
        $(".cardlist_s").attr("style","display:none");
    },function(){
        $(this).parents(".topic_n").find(".manage_tip").attr("style","display:none");
    });
   $(".cardshop_btn").toggle(function(){
        $(".cardlist_s").attr("style","display:block");
        $(".manage_tip").attr("style","display:none");
    },function(){
        $(".cardlist_s").attr("style","display:none");

    });*/

        $(".guanli").click(function() {
            if ($(this).parents(".topic_n").find(".manage_tip").is(":visible")) {
                $(this).parents(".topic_n").find(".manage_tip").hide();
            } else {
                $(this).parents(".topic_n").find(".manage_tip").show();
                if ($(".cardlist_s").is(":visible")) { $(".cardlist_s").hide(); }
            }
        });

        $(".cardshop_btn").click(function() {
            if ($(".cardlist_s").is(":visible")) {
                console.log(333)
                $(".cardlist_s").hide();
            } else {
                console.log(444)
                $(".cardlist_s").show();
                if ($(".manage_tip").is(":visible")) { $(".manage_tip").hide(); }
            }
        });


        $(".manage_tip ul li").click(function() {
            $(this).parents(".manage_tip").hide();
        });

        /*$(document).click(function(){
            if($(".cardlist_s").is(":visible")){
                $(".cardlist_s").hide();
            }
            if($(".manage_tip").is(":visible")){
                $(".manage_tip").hide();
            }
        })*/

        //隔行换色
        $(".ph_index ul li").each(function(i) { this.style.backgroundColor = ['', '#f7f9fd'][i % 2] });
        $(".c_zhuanti_sub").each(function(i) { this.style.backgroundColor = ['', '#f0f9ff'][i % 2] });
        $("#lb_100 .lb_100").each(function(i) { this.style.backgroundColor = ['', '#efefef'][i % 2] });
        //关闭今日关注浮动
        $(".dayclose").click(function() { $("#dayfix").stop().fadeOut("slow"); });
        $(".bar_close").click(function() { $("#fix2").stop().fadeOut("slow"); });
        
        
    })
    //图片加载时自动缩略
function imgLoad(obj, maxwid) {
    var _MAX_LOOP = 30;
    var _loop = 0;
    if (!maxwid) {
        maxwid = 600;
    }

    var swin = $(window).width();

    smaxwid = maxwid;

    var img = new Image;
    img.src = obj.src;
    var func = function() {
        _loop++;
        if (img.readyState) {
            if (img.readyState == "complete") {
                window.clearInterval(_time);
                var wid = img.width;
                obj.width = wid > smaxwid ? smaxwid : wid;
            } else if (_loop >= _MAX_LOOP) {
                window.clearInterval(_time);
            }
        } else {
            window.clearInterval(_time);
            var wid = img.width;
            obj.width = wid > smaxwid ? smaxwid : wid;
        }
    }
    var _time = window.setInterval(func, 200);
}

//----验证类
function CheckLogin() {
    if (document.login.logname.value == "") {
        alert("请输入论坛账号");
        document.login.logname.focus();
        return false;
    }
    if (document.login.logpwd.value == "") {
        alert("请输入论坛密码");
        document.login.logpwd.focus();
        return false;
    }
}

//去除头部和尾部空格
function trimspace(obj) { obj.val($.trim(obj.val())); }

function countDown(secs) { document.all.gb.innerHTML = secs; if (--secs > 0) setTimeout("countDown(" + secs + ")", 1000); return false; }


jQuery.cookie = function(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set cookie
        options = options || {};
        if (value === null) {
            value = '';
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        // CAUTION: Needed to parenthesize options.path and options.domain
        // in the following expressions, otherwise they evaluate to undefined
        // in the packed version for some reason...
        var path = options.path ? '; path=' + (options.path) : '';
        var domain = options.domain ? '; domain=' + (options.domain) : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else { // only name given, get cookie
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
};

function setAppDownCookie(name, time, val) {
    var date = new Date();
    date.setTime(date.getTime() + time * 1000);
    $.cookie(name, val, { path: '/', expires: date });
}

function appDownNext() {
    $(".downBox-mask,.downBox").remove();
    setAppDownCookie("_lastTime", 3600 * 8, 1);
    setAppDownCookie("_appDialogTime", 14400, 2);
}

function appDownLink() {
    appDownNext();
    window.location.href = "http://c.imgccoo.cn/wap/downapp.html";
}

function appDownDialogShow(city) {
    var _html = '<div class="downBox-mask" style="width:100%;height:100%;background:#000;opacity:0.6;position:fixed;top:0;left:0;z-index:9999999;filter:alpha(opacity=60);filter: progid:DXImageTransform.Microsoft.Alpha(opacity=70)"></div><div class="downBox" style="width:480px;height:180px;padding:40px 30px;background:url(http://c.imgccoo.cn/website/images/appd.jpg) no-repeat #fff;position:fixed;top:50%;left:50%;z-index:99999999;margin-left:-270px;margin-top:-130px;border-radius:8px;"><div style = "float:left;font-family:' + "微软雅黑" + '" ><div style="font-size:18px;color:#006;text-align:center;" ><p>下载' + city + '客户端</p><p>（城市通APP）</p></div ><div style="font-size:16px;color:#666;line-height:1.6;margin-top:65px;"><p><i style="display:inline-block;width:8px;height:8px;background:#666;border-radius:50%;margin-right:5px;vertical-align:1px;"></i>操作更容易 更流畅 更省流量</p><p><i style="display:inline-block;width:8px;height:8px;background:#666;border-radius:50%;margin-right:5px;vertical-align:1px;"></i>本地热点资讯随时掌握</p><p><i style="display:inline-block;width:8px;height:8px;background:#666;border-radius:50%;margin-right:5px;vertical-align:1px;"></i>及时接受好友互动提醒</p></div></div><div style="float:right"><img src="http://c.imgccoo.cn/website/images/appd-ewm.jpg" alt="城市通二维码"><p style="color:#666;font-size:16px;text-align:center;font-family:' + "微软雅黑" + '">手机扫描下载</p></div><span onclick="appDownNext()" style = "position:absolute;top:0;right:0;width:34px;height:34px;color:#fff;background:#899fca;font-size:20px;text-align:center;line-height:34px;font-weight:bold;border-radius:0 8px 0 8px;cursor:pointer;">×</span></div>';
    $("body").append(_html)
}

function appDownDialogReplyShow(city) {
    var _html = '<div class="downBox-mask" style="width:100%;height:100%;background:#000;opacity:0.6;position:fixed;top:0;left:0;z-index:9999999;filter:alpha(opacity=60);filter: progid:DXImageTransform.Microsoft.Alpha(opacity=70)"></div><div class="downBox" style="background-position: -20px 0;width: 250px;height: 240px;padding: 30px 30px;background:url(http://c.imgccoo.cn/website/images/appd.jpg) no-repeat #fff;position:fixed;top:50%;left:50%;z-index:99999999;margin-left:-125px;margin-top:-130px;border-radius:8px;"><div style="font-family:微软雅黑;margin:0 auto"><div style="font-size:18px;color:#006;text-align:center;"><p>参与此贴评论需下载APP</p><p>' + city + '(城市通)</p></div></div><div style=""><img src="http://c.imgccoo.cn/website/images/appd-ewm.jpg" alt="城市通二维码" width="175" height="175" style="display:block;margin: 10px auto 0;"><p style="color:#666;font-size:16px;text-align:center;font-family:微软雅黑">手机扫描下载</p></div><span onclick="appDownNext()" style="position:absolute;top:0;right:0;width:34px;height:34px;color:#fff;background:#899fca;font-size:20px;text-align:center;line-height:34px;font-weight:bold;border-radius:0 8px 0 8px;cursor:pointer;">×</span></div>';
    $("body").append(_html)
}


function appDownstatus(city) {
    var _lastTime = $.cookie("_lastTime");
    var _appDialogTime = $.cookie("_appDialogTime");
    var timer = null;
    if (_lastTime == null) {
        if (_appDialogTime == null) {
            setAppDownCookie("_lastTime", 200, 1);
            setAppDownCookie("_appDialogTime", 14400, 1);
        }
    }
    _lastTime = $.cookie("_lastTime");
    _appDialogTime = $.cookie("_appDialogTime");
    if (_lastTime == null && _appDialogTime == 1) {
        if(window.location.href.indexOf("/forum/") > 0 || window.location.href.indexOf("/news/") > 0){
            appDownDialogShow(city);
        }
    }
    if (_lastTime == null && _appDialogTime == 2) {
        setAppDownCookie("_lastTime", 200, 1);
        setAppDownCookie("_appDialogTime", 14400, 1);
    }
}