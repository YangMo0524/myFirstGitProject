//��������2013.11.12
var swfu;
var photonum = parseInt('20');
var attachmentsCount = parseInt('0');
var maxUploadNum = parseInt('20');
var limitUploadNum = maxUploadNum - attachmentsCount;
var editor;
function fileQueueError(file, errorCode, message) {
    try {
        var imageName = "error.gif";
        var errorName = "";
        if (errorCode === SWFUpload.errorCode_QUEUE_LIMIT_EXCEEDED) {
            errorName = "ÿ���ϴ����ܳ���20��ͼƬ��";
        };
        if (errorName !== "") {
			showdialog('�ļ��ϴ�',errorName,'200px');
            return;
        };
        switch (errorCode) {
            case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
            alert("�޷��ϴ����ֽ��ļ���");
            break;
            case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
            alert("�ļ��ߴ���󣬲��ܳ���2M��");
            this.debug("Error Code: File too big, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
            break;
            case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
            alert("��֧�ֵ��ļ����ͣ�");
            break;
            default:
            alert("�������ϴ���ͼƬ���й���.\n\n" + (message == 0 ? "���Ѵﵽ�ϴ����ƣ�": "�������ѡ��" + (message > 1 ? "�ϴ�" + message + "��ͼƬ.": "1��ͼƬ��")));
            break;
        };
    } catch(ex) {
        this.debug(ex);
    };
};
function fileDialogComplete(numFilesSelected, numFilesQueued) {
    try {
        if (numFilesQueued > 0) {
            $("#up_load").show();
			$("#BtnImg a").remove();
            this.startUpload();
        };
    } catch(ex) {
        this.debug(ex);
    };
};
function uploadProgress(file, bytesLoaded ,bytesTotal) {
    try {
        var percent = Math.ceil((bytesLoaded / bytesTotal) * 100);
        var progress = new FileProgress(file, this.customSettings.upload_target);
        progress.setProgress(percent);
        if (percent === 100) {
            //progress.toggleCancel(false, this);
        }// else {
//            progress.setStatus("Uploading..." + percent + "%");
//            progress.toggleCancel(true, this);
//        };
    } catch(ex) {
        this.debug(ex);
    };
};
function is_Undefined_upgrade(variable) {
    return typeof variable == 'undefined' ? true: false;
};
function uploadError(file, errorCode, message) {
    var imageName = "error.gif";
    var progress;
    try {
        switch (errorCode) {
            case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
            try {
                progress = new FileProgress(file, this.customSettings.upload_target);
                progress.setCancelled();
                progress.setStatus("cancelled");
                progress.toggleCancel(false);
            }
            catch(ex1) {
                this.debug(ex1);
            }
            break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
            try {
                progress = new FileProgress(file, this.customSettings.upload_target);
                progress.setCancelled();
                progress.setStatus("stopped");
                progress.toggleCancel(true);
            }
            catch(ex2) {
                this.debug(ex2);
            }
            case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
            imageName = "uploadlimit.gif";
            break;
            default:
            alert(message);
            break;
        }
    } catch(ex3) {
        this.debug(ex3);
    };
};
function queueComplete(id) {
    swfu = null;
    changeLimitUploadNum();
};
function SplitDemo(src) {
    var ss;
    var s = src;
    ss = s.split("/");
    return (ss[ss.length - 1]);
};
function imgUrl(src) {
    var ss;
    var s = src;
    var url = "";
    ss = s.split("/");
    for (var i = 0; i < ss.length - 1; i++)
    {
        url += ss[i] + "/";
    }
    return url + ss[ss.length - 1].replace("s", "");
};
function dk_round(v, e)
 {
    var t = 1;
    e = Math.round(e);
    for (; e > 0; t *= 10, e--);
    for (; e < 0; t /= 10, e++);
    return Math.round(v * t) / t;
};
function fadeIn(element, opacity) {
    var reduceOpacityBy = 5;
    var rate = 30;
if (opacity < 100) {
        opacity += reduceOpacityBy;
        if (opacity > 100) {
            opacity = 100;
        };
        if (element.filters) {
            try {
                element.filters.item("DXImageTransform.Microsoft.Alpha").opacity = opacity;
            } catch(e) {
                element.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=' + opacity + ')';
            };
        } else {
            element.style.opacity = opacity / 100;
        };
    };
    if (opacity < 100) {
        setTimeout(function() {
            fadeIn(element, opacity);
        },rate);
    };
};
var uploadCount = 0;
var upload_files = [];
function FileProgress(file, targetID) {};

FileProgress.prototype.setTimer = function(timer) {
    this.fileProgressElement["FP_TIMER"] = timer;
};
FileProgress.prototype.getTimer = function(timer) {
    return this.fileProgressElement["FP_TIMER"] || null;
};
FileProgress.prototype.reset = function() {
    this.appear();
};
FileProgress.prototype.setProgress = function(percentage) {
    var fileID = this.fileProgressID;
	$.dialog.tips('ͼƬ�ϴ���,�����ĵȴ�������',1,'loading.gif');
};
FileProgress.prototype.setComplete = function() {};
FileProgress.prototype.setError = function() {
    alert("setError");
};
FileProgress.prototype.setCancelled = function() {
    var oSelf = this;
    this.setTimer(setTimeout(function() {
        oSelf.disappear();
    },
    2000));
};
FileProgress.prototype.setStatus = function(status) {
    };
FileProgress.prototype.toggleCancel = function(file, show, swfUploadInstance) {};

FileProgress.prototype.appear = function() {
    if (this.getTimer() !== null) {
        clearTimeout(this.getTimer());
        this.setTimer(null);
    };
};
FileProgress.prototype.disappear = function() {
    this.fileProgressWrapper.style.display = "none";
    this.setTimer(null);
};
function swfu_init() {
    var settings = {
		upload_url: "http://up9.ccoo.cn/upload.ashx?filesrc=bbs&sh=225&sw=300&mode=s&stretch=1&print="+ watermark+"&siteid="+ siteid +"&frmpage="+ params,
        post_params: {"ASPSESSID": "xcjado55x0kp1df2l1lb0ymn"},
        file_size_limit: "5120 KB",
        file_types: "*.jpg;*.gif;*.jpeg;*.png;",
        file_types_description: "ѡ��ͼƬ",
        file_upload_limit: limitUploadNum,
        file_queue_error_handler: fileQueueError,
        file_dialog_complete_handler: fileDialogComplete,
        upload_progress_handler: uploadProgress,
        upload_error_handler: uploadError,
        upload_success_handler: uploadSuccess,
        upload_complete_handler: uploadComplete,
        queue_complete_handler: queueComplete,
        button_image_url: "http://c.imgccoo.cn/x7/bbsv6/images/upoload_edit.png",
        button_placeholder_id: "spanButtonPlaceholder",
        button_width: 50,
        button_height: 57,
        button_text: '<span class="button"></span>',
        button_text_style: '.button { font-family: Helvetica, Arial, sans-serif; font-size: 14pt; color:red } .buttonSmall { font-size: 10pt; }',
        button_text_top_padding: 1,
        button_text_left_padding: 5,
        button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
        button_cursor: SWFUpload.CURSOR.HAND,
        flash_url: "/swfupload.swf",
        custom_settings: { upload_target: "thumbnailss" }
    };
    swfu = new SWFUpload(settings);
};


function uploadComplete(file) {
    try {
        if (this.getStats().files_queued > 0) {
            this.startUpload();
        } else {
			apiclose();
            var progress = new FileProgress(file, this.customSettings.upload_target);
            progress.setComplete();
			progress.toggleCancel(false);
			$("#picpop").attr("style","display:none");
        };

    } catch(ex) {
        this.debug(ex);
    };
};
function uploadSuccess(file, serverData) {
    try {
        var progress = new FileProgress(file, this.customSettings.progressTarget);
        progress.setComplete();
        updateQueue(file, serverData);

    } catch(ex) {
        this.debug(ex);
    };
};

function encodeText(str){
    return (str == null ? "" : encodeURIComponent(str));
};
function updateQueue(ifile, serverData) {
    if (serverData){
		img = "<img src=" + imgUrl(serverData) + ">";
		editor.pasteHTML(img);
    };
};
function GetIE(){
	var Sys = {};
	var ua = navigator.userAgent.toLowerCase();
	var s;
	(s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
	(s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
	(s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
	(s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
	(s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
	if (Sys.ie){return ('IE:' + Sys.ie)};
};

//window.onload = function() {
$(function(){	
    if (!attachmentsCount) {
        swfu_init();
    } else {
        changeLimitUploadNum();
    };
	$(".GetStroe").each(function(){
		 var key = this.id || null;
		 var _self = this;	
		 $.post("User/storeUser.Asp",{username:key},function(data){
		     if(data){
			     $(_self).show();
			     $(_self).html(data);	 
			 };							
		 });
	});
	$(".market_san").each(function(){
		 var key = this.id || null;
		 var _self = this;	
		 $.post("Getmarket.asp",{username:key},function(data){
		     if(data!=0){
				 $(_self).attr("style","background:#fff"); 
                 $(_self).html(data);
                 $(_self).hide();
				 $(_self).fadeIn("slow");
			 };							
		 });
	});
	$(".topicreplyid").each(function() {
		var key = this.id || null;
		var _self = this;
		$.post("GetTopicGarde.asp", {
			topicreplyid: key
		},
		function(data) {
			if (data != 0) {
				$(_self).attr("style", "background:#fff");
				$(_self).html(data);
				$(_self).fadeIn("slow");
			};
		});
	});
});
function changeLimitUploadNum(uNum) {
    if (!is_Undefined_upgrade(uNum)) {
        parseInt(uNum) && parseInt(uNum) < 0 ? limitUploadNum--:limitUploadNum++;
    };
    $("#uploadlimit").html(" "  + limitUploadNum + " ");
};
function add_photo(){
	$.post('/forum/user/user_photo.asp',function(data) {
			if (!data) {
				alert('�����κ����');
				return false;
			} else if (data == 1)
			 {
				sLogin();
				return false;
			}
			var title = "�������";
			var text = "";
			text += '<div class="add_choose_photos"><span class="add_choose_photos_1">ѡ��<select id="select_my_jia_album">';
			text += '</select>����ڵ���Ƭ������ͼƬ����ѡ�У�</span><span class="add_choose_photos_2"><input type="checkbox" />ȫѡ</span></div>';
			text += '<div class="add_chose_zone"><ul class="add_chose_ul" id="my_album_chose_ul"></ul></div>';
			text += '<div class="add_photo_btn_zone"><a class="add_photo_btn_yes"><span></span>ȷ��</a><a class="add_photo_btn_no"><span></span>ȡ��</a></div>';
			html=unescape(text);
			
			showdialog(title,html,'630px','400px');
			$('#select_my_jia_album').html(data);
			loadMyAlbum($('#select_my_jia_album>option').eq(0).attr('value'));
			$('#select_my_jia_album').change(function() {
				var _v = $(this).val();
				loadMyAlbum(_v);
			});
			$('.add_photo_btn_yes').click(function() {
				var _id = $('#upbatchbox li').size();
				var picIds = new Array();
				var tid = parseInt($('#tid').val());
				var _chosed_imgs = $('.img_chosed img');
				//TODO
				for (var i = 0; i < _chosed_imgs.size() && i < photonum; i++) {
					picIds[i] = $(_chosed_imgs[i]).attr('picId');
					var id = 'AlbumUpload_' + (_id + i) + '_0';
					img = "<img src=" + imgUrl($(_chosed_imgs[i]).attr('src')) + ">";
					document.oncontextmenu = new Function('return false');
					editor.pasteHTML(img);
					$('#picpop').css('display', 'none');
				}
				apiclose();	
			});
			$('.add_photo_btn_no').click(function() {
				apiclose();
			});
		});
}
function loadMyAlbum(albumId){
	if(albumId == -1){
		$("#my_album_chose_ul").html('');
		return;
	};
	$.post('/forum/user/user_photo.asp?albumId='+albumId+'&t='+(new Date()).getTime(), function(data){	
		$("#my_album_chose_ul").html(data);

		$(".add_chose_ul li").click(function(){
			if($(this).attr("title")=="ѡ��"){
				$(this).removeClass("img_chosed").removeAttr("title","ѡ��").children("div").children("span").remove();
			}else{
				$(this).addClass("img_chosed").attr("title","ѡ��").children("div").append("<span></span>");
			};
		});
	});
	$(".add_chose_ul li").click(function(){
		if($(this).attr("title")=="ѡ��"){
			$(this).removeClass("img_chosed").removeAttr("title","ѡ��").children("div").children("span").remove();
		}else{
			$(this).addClass("img_chosed").attr("title","ѡ��").children("div").append("<span></span>");
		};
	});
	$(".add_choose_photos_2 input").click(function(){
		if($(this).attr("checked")){
			$(".add_chose_ul li").addClass("img_chosed").attr("title","ѡ��").children("div").append("<span></span>");
		}else{
			$(".add_chose_ul li").removeClass("img_chosed").removeAttr("title","ѡ��").children("div").children("span").remove();
		};
	});
};
function loadSm(ctype,layid){
			$("#Mediapop,#picpop").css("display","none");
			$("#xheditor_E").css("display","block");
			$(this).css("backgound","#666");
			var smiliesList = '';
			var u = "#smlist_0 ul";
			$(u).html("<div class=loadbq><img src=http://c.imgccoo.cn/x7/bbs/images/loading.gif>����������顭</div>");
			$.getJSON('bq.asp',{stype:ctype},function(jsonData){
			$.each(jsonData.results, function(i,v){
			smiliesList += '<li><img src=\"http://c.imgccoo.cn/bbs/Emotions/'+v.id+'.gif\" width=40 height=40 alt=\"'+v.alt+'\"  onclick=\"insertSm(\''+v.id+'\',\''+v.alt+'\');\"/></li>';
			});
			$(u).html(smiliesList);
			$('.xheditor_E li img').hover(function() {
				$(this).addClass("on");},function() {$(this).removeClass("on");});		
			});	
			}
			function insertSm(url,alts){
			picurl = '<img src="http://c.imgccoo.cn/bbs/Emotions/'+url+'.gif "/>';
			editor.pasteHTML(picurl);
			$("#xheditor_E").css("display","none");
}
function Emotclose(){
	$("#xheditor_E").css("display","none");
}
function pageInit(id)
{
var plugins={
		Img:{c:'xheBtnImg',t:'����ͼƬ',e:function(){
		edit_pic();		
		}},
		Media:{c:'xheBtnMedia',t:'������Ƶ',e:function(){
		edit_Media();
		}},
		Emot:{c:'xheBtnEmot',t:'�������',e:function(){
		loadSm(0,0);
		}},		
	    hide:{c:'xhebtnHiden',t:'�ظ��ɼ�',e:function(){
			var _this=this;
			_this.saveBookmark();
			var htmlhide=_this.getSelect() ;
			if(htmlhide=="")
				{alert('����δѡ�����õ�����');return false;
			}else{
				if (htmlhide.indexOf('[hide]')!=-1||htmlhide.indexOf('[/hide]')!=-1){
					  alert('�ò��������Ѿ����ûظ��ɼ�');return false;}
					_this.loadBookmark();
					_this.pasteHTML('[hide]'+htmlhide+'[/hide]');
					}
		}},
		atFriend:{c:'btnAtFriendn',t:'����Χ��',e:function(){
		sfriend();
		}},
		fujian:{c:'btnfujian',t:'�����ϴ�',e:function(){
			showWord('Updoc.asp');
		}}
}

	editor=$('#ccooeditor').xheditor({tools:'postmsg',plugins:plugins,showBlocktag:false,forcePtag:false,beforeSetSource:ubb2html,beforeGetSource:html2ubb,shortcuts:{'ctrl+enter':submitForm}});	

}
function submitForm(){document.form.EditSubmit.click();}
$(document).bind('click', function(e){
		var target = $(e.target), //�����¼�Դ					
		closest = target.closest('#xheditor_E');
		closest2 = target.closest('#Mediapop');
		if(closest.length == 0){
		$('#xheditor_E').css('display', 'none');
		}else{
		$('#xheditor_E').not(closest).css('display', 'none');
		}
		closest1 = target.closest('#picpop');
		if(closest1.length == 0){
			//$('#picpop').css('display', 'none');
			$('#picpop').css('left', '9999px');
			}else{
			$('#picpop').not(closest1).css('display', 'none');
		}
		if(closest2.length == 0){
		$('#Mediapop').css('display', 'none');
		}else{
		$('#Mediapop').not(closest2).css('display', 'none');
		}
//		if($.browser.version == "6.0"){
//		$("#replay").click(function(){editor.focus();return false;});
//		}		
});
function edit_pic(){ 
	//$('#picpop').css('display', 'block');
	$('#picpop').attr('style', 'left:0;display:block');
	$("#xheditor_E,#Mediapop").css("display","none");
} 
function web_photo(){
	title="����������ͼƬ��ַ";
	var html="<input type='text' value='http://' id='webimgurl' name='webimgurl' class='web_txt' onfocus='this.select();' /> <input type='button' value='���' class='web_btn' onclick='webimgurl()'; />";
	showdialog(title,html,"360px","80px");
}

function webimgurl(){
	var imgurl=$("#webimgurl").val();
	if (imgurl == "http://" || imgurl=="" || imgurl.length<20) 
	{
		alert('��������ȷ��ͼƬ��ַ��');
		return false;
	}
	webpicurl = '<img src="'+imgurl+'" />';
	editor.pasteHTML(webpicurl);
	apiclose();
}

function edit_Media(){
	$('#Mediapop').css('display', 'block');
	$("#picpop,#xheditor_E").css("display","none");
}
$(function(){
	$("#Mediasub").click(function(){
		var Mediaurl=$("#Mediaurl").val();
		if (Mediaurl=="" || Mediaurl.length<15) 
		{
		$("#vinfo").html("��������ȷ����Ƶ��ַ��").css("color","red")
		return false;
		}
		//editorMediaurl ="[media=480,400,false,false]"+Mediaurl+"[/media]"
		editorMediaurl ="[Flash=480,400]"+Mediaurl+"[/Flash]";
		editor.pasteHTML(editorMediaurl);
		$('#Mediapop').css('display', 'none');
	})
	$("#Mediaurl").focus(function(){
		$("#vinfo").html("ע�⣺��Ƶ��ַ����վ��ַ��֧���ſᡢ�������Ѻ������ӵ���Ƶ��վ�ṩ����Ƶ��ַ").css("color","#999999")	
	})
})
//��������б�
function sfriend(){
	var title = "�ҵĺ���";
	var html ="<div id=showdetails class=friends><div class=showdetails></div></div>";	
	showdialog(title,html,"440px");
	$.get("ajax.asp",{action:"friend",lable:"friends",time:Math.random()},function(data){
	   if(data){$(".friends").html(data);}
	});
}
function uploads(url)
{
	title='ͼƬ�ϴ�';
	var html='url:'+url;
	showdialog(title,html,'520px','360px');
}
function showWord(url)
{
	title='�ϴ�����';
	var html='url:'+url;
	showdialog(title,html,'450px','120px');
}

var AutoSaveTime=10000 ;//20��    
// ��ʱ������   
var AutoSaveTimer;  
// ��������һ���Զ�����״̬   
SetAutoSave();  
// �Զ����溯��   
function AutoSave() {  
	var FormContent=$("#ccooeditor").val();  
	if(!FormContent) return;  
	var url="autosave.asp";  
	var content="postcontent="+escape(FormContent)+"&auto=1";  
	$.ajax({ type: "POST", url: url, data: content, success: function(msg){ $("#autosavemsg").html(msg);}});   
}  
//�����Զ�����״̬����   
function SetAutoSave() {  
		   AutoSaveTimer=setInterval("AutoSave()",AutoSaveTime);  
}  
// �ָ���󱣴�Ĳݸ�   
function AutoSaveRestore() {  
	$("#autosavemsg").html("���ڻָ������Ժ򡭡�")  
	var url="/forum/autosave.asp";  
	var content="action=restore&auto=1";  
	$.ajax({ type: "POST", url: url, data: content, success: function(msg){if(msg){$("#ccooeditor").val(msg);$("#autosavemsg").html("�ָ��ɹ�");}else{$("#autosavemsg").html("û�пɻָ�������");}}});           
}  