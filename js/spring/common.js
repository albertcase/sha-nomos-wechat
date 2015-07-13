$(document).ready(function(e) {
	
	//框架
	var wrapBox=$('.wrap');
	var turnBox=$('#turnBox');
	
	//分享
	var btnShare=$('a.btnShare');
	var shareBox=$('#shareBox');
	
	//视频
	var videoBtn=$('a.btnVideo');
	var videoBox=$('#videoBox');
	var videoIframe;
	var videoClose=videoBox.children('a.close');
	
	init();

	
	function init(){
		window_resize();
		$(window).on('resize',window_resize);
		$(document).on('touchmove',noEvent);//IOS里禁止上下滑动拖动屏幕移动
		$(window).on( "orientationchange",window_orientationchange);
		addEvent();
	}//end func
	
	//自适应
	function window_resize(){
		wrapBox.css({height:$(window).height()});//保证内容高度不足情况下，wrap层背景能充满屏幕
		console.log($(window).width()+'/'+$(window).height());
		//alert('sereen size:'+screen.width+'/'+screen.height);
		//alert('window size:'+$(window).width()+'/'+$(window).height());

		
	}//end window_resize
	
	function window_orientationchange(e){
		if(e.orientation=='landscape') turnBox.show();
		else turnBox.hide();
	}//end func
	
	function addEvent(){
		
		//微信分享
		btnShare.on('click',btnShare_click);
		shareBox.on('click',shareBox_click);
		
		//-------------------优酷视频
		if(os.ios) video_ios();
		else videoBtn.on('click',video_android);
		videoClose.on('click',video_close);
		
	}//end func
	
	//---------微信分享
	function btnShare_click(e){
		shareBox.show();
	}//end func
	
	function shareBox_click(e){
		$(this).hide();
	}//end func
	
	//-------------------优酷视频播放-------------------
	function video_ios(){
		videoBtn.each(function(i) {
            var vid=$(this).data('vid');
			var iframe=$('<iframe src="http://player.youku.com/embed/'+vid+'" frameborder=0 allowfullscreen></iframe>').appendTo($(this));
        });
		videoBox.remove();
	}//end funcs
	
	function video_android(e){
		videoBox.show();
		var vid=$(this).data('vid');
		var ht=$(window).width()*9/16;
		videoIframe=$('<iframe src="http://player.youku.com/embed/'+vid+'" frameborder=0 allowfullscreen isAutoPlay="true"></iframe>').css({height:ht,marginTop:$(window).height()/2-ht/2}).prependTo(videoBox);
	}//end event
	
	function video_close(e){
		videoIframe.remove();
		videoBox.hide();
	}//end event
	
	

	
});


//--------------------------------公共函数
	
	function getTimer(t){//转换毫秒到字符串时间
		var sec=Math.floor(t/1000);
		if(sec<10) sec="0"+sec;
		else sec=String(sec);
		var mil=String(t%1000);
		mil=mil.substr(0, 2);
		return sec+'.'+mil;
	}//end func
	
	function hoverFunc(_this){
		var srcOrg,src,str;
		var img;
		if(_this.attr('src')) img=_this;
		else if(_this.find('img').length>0) img=_this.find('img');
		
		if(img){
			str=img.attr('src').split('.');
			srcOrg=img.attr('src');
			src=str[0]+'_active.'+str[1];
		}//end if
		_this.on('touchstart',function(e){
			_this.addClass('active');
			if(img) img.attr({src:src});
			setTimeout(function(){
				_this.removeClass('active');
				if(img) img.attr({src:srcOrg});
			},250);
		});		
	}//end func
	
	function noEvent(e){
		e.preventDefault();
	}//end func
	
	function getRound(num,n){
		n=n||2;
		var r=Math.pow(10, n);
		return Math.round(num*r)/r;
	}//end func
	
	function randomPlus() {
			return Math.random()<0.5?-1:1;
	}//end func  随机正负
		
	function randomRange(min, max) {
			var randomNumber;
			randomNumber = Math.floor(Math.random() * (max - min + 1)) + min;
			return randomNumber;
	}//end func
	
	function degToRa(degree) {
		return degree * Math.PI / 180;
	}//角度转弧度

	function raToDeg(radian) {
		return radian / Math.PI * 180;
	}//弧度转角度
	
	function getQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		var r = window.location.search.substr(1).match(reg);
		if (r != null) return unescape(r[2]); return null;
	}//end func
	
	//打印json数据
	function jsonPrint(data){
		console.log("-----------------------------------------------------------------------------");
		for(var i=0; i<data.length; i++) objectPrint(data[i]);
		console.log("-----------------------------------------------------------------------------");
	}//end func
	
	//打印object数据
	function objectPrint(data){
		console.log("-----------------------------------------------------------------------------");
		var info="";
		for(var i in data) info+=i+":"+data[i]+"  "
		console.log(info);
		console.log("-----------------------------------------------------------------------------");
	}//end func
	
	function mathAutoSize(aryNum,aryMax){
				var aryNow=new Array()
				var aryRate= aryNum[0]/aryNum[1];
				aryNow[0] = aryMax[0];
				aryNow[1] = Math.round(aryNow[0]/aryRate);
				if(aryNow[1]<aryMax[1]){
					aryNow[1]=aryMax[1];
					aryNow[0] = Math.round(aryNow[1]*aryRate);
				}//end if				
				return aryNow;
	}//end func	

	// http://paulirish.com/2011/requestanimationframe-for-smart-animating/
	// http://my.opera.com/emoller/blog/2011/12/20/requestanimationframe-for-smart-er-animating
	// requestAnimationFrame polyfill by Erik Möller. fixes from Paul Irish and Tino Zijdel
	// MIT license
	//PC的老式浏览器，还有安卓浏览器，不支持原生requestAnimationFrame
	(function() {
		var lastTime = 0;
		var vendors = ['ms', 'moz', 'webkit', 'o'];
		for (var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
			window.requestAnimationFrame = window[vendors[x] + 'RequestAnimationFrame'];
			window.cancelAnimationFrame = window[vendors[x] + 'CancelAnimationFrame'] || window[vendors[x] + 'CancelRequestAnimationFrame'];
		}
		if (!window.requestAnimationFrame) window.requestAnimationFrame = function(callback, element) {
			var currTime = new Date().getTime();
			var timeToCall = Math.max(0, 16 - (currTime - lastTime));
			var id = window.setTimeout(function() {
				callback(currTime + timeToCall);
			}, timeToCall);
			lastTime = currTime + timeToCall;
			return id;
		};
		if (!window.cancelAnimationFrame) window.cancelAnimationFrame = function(id) {
			clearTimeout(id);
		};
	}());