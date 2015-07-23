
	//alert($(window).width()+'/'+$(window).height());
	
	// 框架
	var wrapBox=$('.wrap');
	var loadBox=$('#loadBox');
	
	var explainBox=$('section.explainBox');
	
	//是否是三星S4
	var isS4=os.android && screen.width==1080 && window.innerHeight>=850 && window.devicePixelRatio==3;
	//alert('s4:'+isS4);
	//是否是iphone5
	var isIp5=os.ios && screen.width==320 && screen.height==568;
	//是否是iphone4
	var isIp4=os.ios && screen.width==320 && screen.height==480;

	//touch 
	var mutiTouch;
	var posLast1=[],posLast2=[],disLast,disSt,degSt,degLast;
	
	
	//imgBox
	var imgStep=1;
	var imgCv,imgCanvas;
	var imgBox=$('section.imgBox');
	var imgShell=imgBox.children('.shell');
	var imgPanel=imgBox.children('.panel');
	var imgBtnAdd=imgPanel.children('a.btnAdd');
	var imgBtnSub=imgPanel.children('a.btnSub');
	var imgBtnR1=imgPanel.children('a.btnR1');
	var imgBtnR2=imgPanel.children('a.btnR2');
	var imgBtnCf=imgBox.children('a.btnCf');
	var imgSign=imgBox.children('.sign');
	var imgScale,imgSaleMin=0.1,imgScaleMax=1,imgScaleTimer;
	if(isS4) imgScaleMax=0.55;
	var imgRotation=0,imgRotaionTimer;
	var imgWatch;

	
	//拍照
	var cameraBox=$('section.cameraBox');
	var btnCamera=$('#btnCamera');
	var fileInput=$('#fileInput');
	
	//watch
	var watchBox=$('section.watchBox');
	var watchFocus=$('.focus');
	var watchList=watchFocus.children('ul');
	var watchNow=0,watchMax=35,watchSelected=false;
	
	loadFunc();
	
	function loadFunc(){
		//载入图
		loadBox.show();
		var loader = new PxLoader();
		for(var i=1; i<=watchMax; i++) loader.addImage('../images/spring/watch/w'+i+'.png');	
		loader.addCompletionListener(function() {
			if(window.console) console.log('load complete');
			loadBox.hide();
			init();
			loader=null;
		});			
		loader.start();	
	}//end func	
	
	function init(){
		
		//focus
		for(var i=0; i<watchMax; i++){
			var li=$('<li></li>').appendTo(watchList);
			var wt=$('<img>').attr({src:'../images/spring/watch/w'+(i+1)+'.png'}).appendTo(li);
		}//end for
		watchFocus.css({width:$(window).width()}).focusR();				
		
		addEvent();
		
	}//end init
	

	function addEvent(){
		btnCamera.on('click',function(){fileInput.click();});
		//fileInput.on('change',fileSelected);
		imgPanel.on('touchstart',noEvent);
		imgBtnCf.on('click',imgBtnCf_click);
	}//end func
	
	function addImgEvent(obj){
		removeImgEvent();
		imgBtnAdd.on('touchstart',{obj:obj,offset:1},imgScale_touchstart);
		imgBtnAdd.on('touchend',imgScale_touchend);
		imgBtnSub.on('touchstart',{obj:obj,offset:-1},imgScale_touchstart);
		imgBtnSub.on('touchend',imgScale_touchend);
		imgBtnR1.on('touchstart',{obj:obj,offset:1},imgBtnR_touchstart);
		imgBtnR2.on('touchstart',{obj:obj,offset:-1},imgBtnR_touchstart);
		imgBtnR1.on('touchend',imgBtnR_touchend);
		imgBtnR2.on('touchend',imgBtnR_touchend);
		imgShell.on('touchstart',imgShell_touchstart);
		imgShell.on('touchmove',{obj:obj},imgShell_touchmove);
		imgShell.on('touchend',{obj:obj},imgShell_touchend);
	}//end func
	
	function removeImgEvent(){
		imgBtnSub.off();
		imgBtnAdd.off();
		imgBtnR1.off();
		imgBtnR2.off();
		imgShell.off();
	}//end func
	
	//-------------事件
	//确定按钮
	function imgBtnCf_click(e){
		if(imgStep==1){
			imgStep=2;
			watchSelected=false;
			explainBox.hide();
			imgPanel.hide();
			imgSign.show();
			watchBox.show();
		}//end if
		else{
			if(watchSelected){
				loadBox.show();
				imgSend();
			}//end if
			else{
				$('#popAlert').popOn({text:'请选择一款NOMOS腕表'});
			}//end else
		}//end else
	}//end func
	
	//-------AJAX发送图片
	function imgSend(){
		//模拟一下发送图片然后跳转到结果页
		/*
		setTimeout(function(){
			window.location.href='result.html';
		},1000);
		*/
		//ajax发送图片数据到服务器
		if(!Img.id || !Img.src){
			$('#popAlert').popOn({text:'文件错误，请重新开始~', url:window.location.href});
		}else{
			var data=$('canvas')[0].toDataURL("image/png").split(","); 
			$.post("handler.php?action=update", { data:data[1],id:Img.id,src:Img.src },function(resp){
				if(resp.code == 200){
					window.location.href = 'result.html?id=' + resp.id +"&src="+ resp.src +"&marks="+ resp.mark;
				}
				if(data.code == 12) $('#popAlert').popOn({text:'参数错误，请重新上传~',url:"index.php"});
				if(data.code == 13) $('#popAlert').popOn({text:'图片数据错误，请重新上传~'});
				if(data.code == 14) $('#popAlert').popOn({text:'数据库错误，请重新提交~'});
			}, "json");
		}
	}//end func
	
	
	//手表轮播按钮
	function watch_click(id){
		console.log('watch id:'+id);
		if(imgWatch) imgCanvas.removeChild(imgWatch);
		imgWatch = imgCanvas.display.image({
			x:imgCv.width()/2,
			y:imgCv.height()/2,
			origin: { x: "center", y: "center" },
			image: '../images/spring/watch/w'+id+'.png',
		});
		imgCanvas.addChild(imgWatch);
		imgPanel.show();
		imgStep=2;
		imgScale=1;
		imgScale=0.5;
		watchSelected=true;
		imgScaleSet(imgWatch);
		addImgEvent(imgWatch);
	}//end if
	  
	  function imgCreat(src){
			cameraBox.hide();
			$('<img>').attr({src:src}).one('load',imgLoad);
	  }//end func
	  
	  function imgLoad(e){
		  	console.log($(this).width()+'/'+$(this).height());
			loadBox.hide();
			imgBox.show();
			imgShell.empty().css({height:imgShell.width()*0.75});
			$('<canvas></canvas>').attr({width:imgShell.width(),height:imgShell.height()}).prependTo(imgShell);
			imgCv=$('canvas');
			imgCanvas = oCanvas.create({
				canvas: imgCv[0]
			});
			imgPic = imgCanvas.display.image({
				x:imgCv.width()/2,
				y:imgCv.height()/2,
				origin: { x: "center", y: "center" },
				image: this,
			});
			imgCanvas.addChild(imgPic);
			imgStep=1;
			imgRotation=0;
			if(os.ios) imgScale=0.3;
			else if(isS4) imgScale=imgScaleMax;
			else imgScale=0.5;
			imgScaleSet(imgPic);
			if(os.android) setTimeout(function(){
				imgCv[0].style.opacity = imgCv[0].style.opacity ? "" : "0.999";
			},250);
			addImgEvent(imgPic);
	}//end func
	
	
	//-------------------canvas操控
	
	//-------单指双指触控
	function imgShell_touchstart(e){
		e.preventDefault();
		if(event.touches.length==1){
			mutiTouch=false;
			posLast1=[event.touches[0].clientX,event.touches[0].clientY];
		}//end if
		else if(event.touches.length>=2 && os.ios){
			mutiTouch=true;
			posLast1=[event.touches[0].clientX,event.touches[0].clientY];
			posLast2=[event.touches[1].clientX,event.touches[1].clientY];
			disLast=getDis(posLast1,posLast2);
			degSt=degLast=getDeg(posLast1,posLast2);
		}//end if
	}//end func
	
	function imgShell_touchmove(e){
		e.preventDefault();
		if(!mutiTouch && event.touches.length==1){
			var pos=[event.touches[0].clientX,event.touches[0].clientY];
			e.data.obj.move(pos[0]-posLast1[0], pos[1]-posLast1[1]);
			posLast1=pos;
			imgCanvas.redraw();
			if(os.android) imgCv[0].style.opacity = imgCv[0].style.opacity ? "" : "0.999";
		}//end if
		else if(event.touches.length>=2 && os.ios){
			var pos1=[event.touches[0].clientX,event.touches[0].clientY];
			var pos2=[event.touches[1].clientX,event.touches[1].clientY];
			var dis=getDis(pos1,pos2);
			if(dis>disLast && Math.abs(dis-disLast)>0.5) imgScaleFunc(e.data.obj,1,0.01);
			else if(dis<disLast && Math.abs(dis-disLast)>0.5) imgScaleFunc(e.data.obj,-1,0.01);
			var deg=getDeg(pos1,pos2);
			var degDis=deg-degLast;
			if( degDis>15 || degDis<-15) degDis+=180;
			e.data.obj.rotate(degDis);
			imgCanvas.redraw();
			if(os.android) imgCv[0].style.opacity = imgCv[0].style.opacity ? "" : "0.999";
			posLast1=pos1;
			posLast2=pos2;
			disLast=dis;
			degLast=deg;
		}//end if
	}//end func

	function imgShell_touchend(e){
		if(event.touches.length>=1) mutiTouch=true;
		else mutiTouch=false;
	}//end func
	
	
	//图片缩放
	function imgScale_touchstart(e){
		e.preventDefault();
		clearInterval(imgScaleTimer);
		imgScaleTimer=setInterval(imgScaleFunc,33,e.data.obj,e.data.offset);
	}//end func
	
	function imgScale_touchend(e){
		e.preventDefault();
		clearInterval(imgScaleTimer);
	}//end func
	
	function imgScaleFunc(obj,offset,speed){
		speed=speed!=null?speed:0.01;
		imgScale+=speed*offset;
		imgScale=imgScale<=imgSaleMin?imgSaleMin:imgScale;
		imgScale=imgScale>=imgScaleMax?imgScaleMax:imgScale;
		imgScaleSet(obj);
	}//end func
	
	function imgScaleSet(obj){
		obj.scale(imgScale);
		imgCanvas.redraw();
		if(os.android) imgCv[0].style.opacity = imgCv[0].style.opacity ? "" : "0.999";
	}//end func
	
	
	//图片旋转
	function imgBtnR_touchstart(e){
		e.preventDefault();
		if(imgStep==1){
			e.data.obj.rotate(e.data.offset*90);
			imgCanvas.redraw();
			if(os.android) imgCv[0].style.opacity = imgCv[0].style.opacity ? "" : "0.999";
		}//end if
		else{
			clearInterval(imgRotaionTimer);
			imgRotaionTimer=setInterval(imgRotaionFunc,33,e.data.obj,e.data.offset);
		}//end else
	}//end func
	
	function imgBtnR_touchend(e){
		e.preventDefault();
		if(imgStep==2) clearInterval(imgRotaionTimer);
	}//end func
	
	function imgRotaionFunc(obj,offset,speed){
		speed=speed!=null?speed:1;
		obj.rotate(offset*speed);
		imgCanvas.redraw();
		if(os.android) imgCv[0].style.opacity = imgCv[0].style.opacity ? "" : "0.999";
	}//end func
	
	//数学函数
	function getDis(pos1,pos2){
		var lineX=pos2[0]-pos1[0];
		var lineY=pos2[1]-pos1[1];
		return Math.sqrt(Math.pow(Math.abs(lineX),2)+Math.pow(Math.abs(lineY),2));
	}//end func
	
	function getDeg(pos1,pos2){
		var lineX=pos2[0]-pos1[0];
		var lineY=pos2[1]-pos1[1];
		return Math.atan(lineY/lineX)*180/Math.PI;
	}//end func
	