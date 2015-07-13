<!DOCTYPE html>
<html><!-- InstanceBegin template="/Templates/index.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>NOMOS 腕表</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<meta http-equiv="cleartype" content="on">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes"><!--网站开启对web app程序的支持-->
<meta name="apple-mobile-web-app-status-bar-style" content="black"><!--控制状态栏显示样式-->
<meta name="apple-touch-fullscreen" content="no"><!--是否全屏-->
<meta name="format-detection" content="telephone=no"><!--使设备浏览网页时对数字不启用电话功能-->
<!-- Fav Icon -->
<link rel="shortcut icon" href="<?php echo Yii::app()->request->baseUrl; ?>/images/spring/favicon.ico">
<!-- css -->
<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/spring/iphone.css" />
<script>
//平台检测
var os=detectOS();
//------------判断浏览器、操作系统
function detectOS() {
	var	userAgent=navigator.userAgent;
	//console.log(userAgent);
	var os = {};
	os.android = userAgent.match(/(Android)\s+([\d.]+)/) || userAgent.match(/Silk-Accelerated/) ? true : false;
	os.androidICS = os.android && userAgent.match(/(Android)\s4/) ? true : false;
	os.ipad = userAgent.match(/(iPad).*OS\s([\d_]+)/) ? true : false;
	os.iphone = !os.ipad && userAgent.match(/(iPhone\sOS)\s([\d_]+)/) ? true : false;
	os.ios = os.ipad || os.iphone;
	os.wp=userAgent.match(/Windows Phone/) || userAgent.match(/IEMobile/) ? true : false;
	os.supportsTouch = ((window.DocumentTouch && document instanceof window.DocumentTouch) || 'ontouchstart' in window);
	return os;
}//end func
//微信检测
var isWeixin=detectWeixin();
function detectWeixin(){
	var ua = navigator.userAgent.toLowerCase();
	if(ua.match(/MicroMessenger/i)=="micromessenger") return true;
	else return false;
}//end func
</script>
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/spring/jquery.js"></script>
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/spring/ajaxfileupload.js"></script>
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/spring/framwork.iphone.js"></script>
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/spring/iphone.pop.js"></script>
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/spring/iphone.focusR.js"></script>
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/spring/common.js"></script>

<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<body>
	<?php echo $content; ?>

<!-- InstanceBeginEditable name="script" -->




<!--<script>
$(document).ready(function(e) {
    monitorAdd({obj:$('.btnMore'),category:'列表页',label:'更多按钮'});
});
</script>-->
<!-- InstanceEndEditable -->
<script>
var lineLink = "http://t.buzzreader.cn/cloud/nomos/",
	imgUrl = "<?php echo Yii::app()->request->baseUrl; ?>/images/spring/share.jpg",
	shareTitle = 'NOMOS腕表',
	descContent = "足不出户却能坐拥几十款精美腕表？NOMOS试戴功能就能做到！";

function shareFriend() {
	WeixinJSBridge.invoke("sendAppMessage", {
		img_url: imgUrl,
		img_width: "212",
		img_height: "212",
		link: lineLink,
		desc: descContent,
		title: shareTitle
	},
	function (res) { 
		if(res.err_msg != 'send_app_msg:cancel' && res.err_msg != 'share_timeline:cancel') {
			monitorFunc(null,{label:'转发朋友'});
		} 
	})
}
function shareTimeline() {
	WeixinJSBridge.invoke("shareTimeline", {
		img_url: imgUrl,
		img_width: "212",
		img_height: "212",
		link: lineLink,
		desc: descContent,
		title: descContent
	},
	function (res) {
		if(res.err_msg != 'send_app_msg:cancel' && res.err_msg != 'share_timeline:cancel') {
			monitorFunc(null,{label:"分享朋友圈"});
		} 
	})
}	
document.addEventListener("WeixinJSBridgeReady",
function () {
	WeixinJSBridge.on("menu:share:appmessage",
	function (e) {
		shareFriend()
	});
	WeixinJSBridge.on("menu:share:timeline",
	function (e) {
		shareTimeline()
	})
});
</script>
<script type="text/javascript">
var _hmt = _hmt || [];
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fce97de6ac4acb27164e76e770615e2f3' type='text/javascript'%3E%3C/script%3E"));
</script>
<script>
//------------监测函数
function monitorAdd(option){
	if(option){
		var obj=option.obj;
		var action=option.action||'click';
		var category=option.category||'页面监测';
		var label=option.label||'';
		if(obj && obj.length>0){
			if(obj.length==1) obj.on(action,{category:category,action:action,label:label},monitorFunc);
			else obj.each(function(i) {$(this).on(action,{category:category,action:action,label:label+(i+1)},monitorFunc);});
		}//end if
	}//end if
}//end func
function monitorFunc(e,option){
	if(e) var data=e.data;
	else var data=option;
	if(data){
		if(!data.action) data.action='系统交互行为';
		_hmt.push(['_trackEvent', data.category, data.action, data.category+'——'+data.label]);
		if(window.console) console.log('项目类别：'+data.category+' | '+'交互行为：'+data.action+' | '+'项目说明：'+data.category+'——'+data.label);
	}//end if
}//end func
</body>
</html>

