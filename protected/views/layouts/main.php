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
<script type="text/javascript">var BASEURL='<?php echo Yii::app()->request->baseUrl; ?>';</script>
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
<script type="text/javascript">
var _hmt = _hmt || [];
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fce97de6ac4acb27164e76e770615e2f3' type='text/javascript'%3E%3C/script%3E"));
</script>
<script>

</body>
</html>

