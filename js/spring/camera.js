

$(document).ready(function(e) {
	var wrap=$('.wrap');
	var imgBtn=$('.imgBtn');
	var coverBox=$('.coverBox');
	var imgBox=$('#imgBox');
	var canvasBox=$('#canvasBox');
	var loadBox=$('#loadBox');
	var cv,canvas,canvasImg,canvasMask;
	var canvasScale=0.5;
	var canvasRotaion=0;
	var canvasR=5;
	var canvasReady=false;
	//是否是三星S4
	var isS4=os.android && screen.width==1080 && document.body.clientWidth==540 && document.body.clientHeight==851;
	//是否是iphone5
	var isIp5=os.ios && screen.width==320 && screen.height==568;
	//是否是iphone4
	var isIp4=os.ios && screen.width==320 && screen.height==480;
	
	var slogBox=$('.slog');
	
	
	//panel
	var mutiTouch;
	var posLast1=[],posLast2=[],disLast,disSt,degSt,degLast;
	var panelBox=$('#panelBox');
	var panelScale1=$('#panelScale1');
	var panelScale2=$('#panelScale2');
	var panelBar=$('#panelBar');
	var panelHand=$('#panelHand');
	var panelRotaion=$('#panelRotaion');
	var panelScaleTimer,panelRotaionTimer;
	
	//image
	var scaleMin=0.1,scaleMax=1;
	if(isS4) scaleMax=0.48;
	
	
	var btnCamera=$('#btnCamera');
	var btnRedo=$('#btnRedo');
	
	//file
	var fileInput=$('#fileInput');
	
	init();
	
	//初始化
	function init(){
		$(document).on('touchmove',noEvent);//IOS里禁止上下滑动拖动屏幕移
		window_resize();
		$(window).on('resize',window_resize);
		fileInput.on('change',fileSelected);
		btnRedo.on('click',btnRedo_click);
		btnCamera.on('click',btnCamera_click);
		panelScale1.on('touchstart',{offset:-1},panelScale_touchstart);
		panelScale1.on('touchend',panelScale_touchend);
		panelScale2.on('touchstart',{offset:1},panelScale_touchstart);
		panelScale2.on('touchend',panelScale_touchend);
		panelRotaion.on('touchstart',panelRotaion_touchstart);
		panelRotaion.on('touchend',panelRotaion_touchend);
		panelBar.on('touchstart',panelBar_touchstart);
		panelBar.on('touchmove',panelBar_touchmove);
		canvasBox.on('touchstart',canvasBox_touchstart);
		canvasBox.on('touchmove',canvasBox_touchmove);
		canvasBox.on('touchend',canvasBox_touchend);
	}//end func
	
	//自适应
	function window_resize(){
		canvasBox.css({height:imgBox.width()});
		//panelResize();
	}//end func
	
	function panelResize(){//panel自适应
		var htLeft=0;
		panelBar.siblings().each(function(i) {
            htLeft+=$(this).outerHeight(true);
        });
		var ht=canvasBox.outerHeight()-htLeft;
		console.log(ht);
		panelBar.height(ht);
	}//end func
	
	//--------canvas操控
	
	//-------单指双指触控
	function canvasBox_touchstart(e){
		e.preventDefault();
		if(canvasReady){
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
		}//end if
	}//end func
	
	function canvasBox_touchmove(e){
		e.preventDefault();
		if(canvasReady){
			if(!mutiTouch && event.touches.length==1){
				var pos=[event.touches[0].clientX,event.touches[0].clientY];
				canvasImg.move(pos[0]-posLast1[0], pos[1]-posLast1[1]);
				posLast1=pos;
				canvas.redraw();
				if(os.android) cv[0].style.opacity = cv[0].style.opacity ? "" : "0.999";
			}//end if
			else if(event.touches.length>=2 && os.ios){
				var pos1=[event.touches[0].clientX,event.touches[0].clientY];
				var pos2=[event.touches[1].clientX,event.touches[1].clientY];
				var dis=getDis(pos1,pos2);
				if(dis>disLast && Math.abs(dis-disLast)>0.5) panelScaleFunc(1,0.01);
				else if(dis<disLast && Math.abs(dis-disLast)>0.5) panelScaleFunc(-1,0.01);
				var deg=getDeg(pos1,pos2);
				var degDis=deg-degLast;
				//$('#sign').html('角度差:'+degDis);
				if( degDis>15 || degDis<-15) degDis+=180;
				/*
				if(degDis>0){
					if(degDis<15){}//顺时针
					else degDis=deg-(degLast+180);//逆时针
				}//end if
				else if(degDis<0){
					if(deg-degLast>-15){}//逆时针
					else degDis=deg-(degLast+180);//顺时针
				}//end else
				*/
				canvasImg.rotate(degDis);
				canvas.redraw();
				if(os.android) cv[0].style.opacity = cv[0].style.opacity ? "" : "0.999";
				//if(deg>degLast && Math.abs(deg-degLast)>0.5) canvasImg.rotate(deg);
				//else if(deg<degLast && Math.abs(deg-degLast)>0.5) canvasImg.rotate(deg);
				posLast1=pos1;
				posLast2=pos2;
				disLast=dis;
				degLast=deg;
			}//end if
		}//end if
	}//end func

	function canvasBox_touchend(e){
		if(canvasReady){
			if(event.touches.length>=1) mutiTouch=true;
			else mutiTouch=false;
		}//end if
	}//end func
	
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
	
	//图片缩放
	function panelScale_touchstart(e){
		e.preventDefault();
		clearInterval(panelScaleTimer);
		panelScaleTimer=setInterval(panelScaleFunc,33,e.data.offset);
	}//end func
	
	function panelScale_touchend(e){
		e.preventDefault();
		clearInterval(panelScaleTimer);
	}//end func
	
	function panelScaleFunc(offset,speed){
		speed=speed||0.05;
		canvasScale+=speed*offset;
		canvasScale=canvasScale<=scaleMin?scaleMin:canvasScale;
		canvasScale=canvasScale>=scaleMax?scaleMax:canvasScale;
		canvasScaleFunc();
	}//end func
	
	function panelBar_touchstart(e){
		e.preventDefault();
		var ht=panelBar.width()-panelHand.width();
		var dis=event.touches[0].clientX-panelBar.offset().left;
		dis=dis<=0?0:dis;
		dis=dis>=ht?ht:dis;
		canvasScale=scaleMin+(scaleMax-scaleMin)*dis/ht;
		console.log(canvasScale);
		canvasScaleFunc();
	}//end func
	
	function panelBar_touchmove(e){
		e.preventDefault();
		var ht=panelBar.width()-panelHand.width();
		var dis=event.touches[0].clientX-panelBar.offset().left;
		dis=dis<=0?0:dis;
		dis=dis>=ht?ht:dis;
		canvasScale=scaleMin+(scaleMax-scaleMin)*dis/ht;
		console.log(canvasScale);
		canvasScaleFunc();
	}//end func
	
	function canvasScaleFunc(){
		var ht=panelBar.width()-panelHand.width();
		panelHand.css({left:(canvasScale-scaleMin)/(scaleMax-scaleMin)*ht});
		canvasImg.scale(canvasScale);
		canvas.redraw();
		if(os.android) cv[0].style.opacity = cv[0].style.opacity ? "" : "0.999";
	}//end func
	
	
	//图片旋转	
	function panelRotaion_touchstart(e){
		e.preventDefault();
	}//end func
	
	function panelRotaion_touchend(e){
		e.preventDefault();
		canvasImg.rotate(90);
		canvas.redraw();
		if(os.android) cv[0].style.opacity = cv[0].style.opacity ? "" : "0.999";
	}//end func
	
	function panelRotaionFunc(){
		canvasImg.rotate(canvasR);
		canvas.redraw();
		if(os.android) cv[0].style.opacity = cv[0].style.opacity ? "" : "0.999";
	}//end func
	
	function panelRorationFunc(deg){
		canvasR=deg;
		canvasImg.rotate(canvasR);
		canvas.redraw();
		if(os.android) cv[0].style.opacity = cv[0].style.opacity ? "" : "0.999";
	}//end func
		
	//拍照按钮
	function btnCamera_click(e){
		fileInput.click(); 
	}//end func	
	
	//打开图片
	function fileSelected(e) {
        var file = this.files[0];
        if (file) {
			loadBox.show();
		  	var reader = new FileReader();  
		  	reader.onloadend = function() { 
				console.log('result.length: '+this.result.length);
				console.log('file path: '+fileInput.val());
				if(this.result.length>0){
					if(isIp5){
						//setTimeout(function(){imgCreat('http://42.121.34.64:8080/cloud/vface/images/pic3.jpg');},1000);//先示意一下
						
						
						//ajax 先把base64图片数据发送到服务器，生成图片地址返回，然后执行imgCreat()
							var data=this.result.split(",");
							$.post("/ImageHandler.ashx", { action:"CreateTempFile",data:data[1] },function(result){
								if(result){
									var src=result.src;
									imgCreat(src);
								}//end if
							}, "json");
						
					}//end if
					else{
						imgCreat(this.result); 
					}//end else
				}//end if
				else{
					alert('无法正确读取图片');
					loadBox.hide();
				}//end else
		  	}//end onload	
			reader.readAsDataURL(file);	
        }//end if
      }//end select
	  
	  	//重做按钮
		function btnRedo_click(e){
			slogBox.show();
			coverBox.show();
			imgBox.hide();
			panelBox.hide();
			imgBtn.hide();
			canvasBox.empty();
			fileInput.val('');
		}//end func
	  
	  function imgCreat(src){
		  	slogBox.hide();
		  	coverBox.hide();
			imgBox.show();
			canvasBox.empty();
			canvasImg=$('<img>').attr({src:src}).appendTo('body').one('load',imgLoad);
	  }//end func
	  
	  function imgLoad(e){
		  	console.log($(this).width()+'/'+$(this).height());
			$(this).remove();
			canvasBox.empty();
			$('<canvas></canvas>').attr({width:imgBox.width(),height:imgBox.width()}).appendTo(canvasBox);
			cv=$('canvas');
			canvas = oCanvas.create({
				canvas: cv[0],
				fps: 30
			});
			canvasImg = canvas.display.image({
				x:cv.width()/2,
				y:cv.height()/2,
				origin: { x: "center", y: "center" },
				image: this,
			});
			canvas.addChild(canvasImg);
			imgBtn.show();
			panelBox.show();
			//panelResize();
			canvasRotaion=0;
			if(isS4) canvasScale=scaleMax;
			else canvasScale=0.5;
			canvasScaleFunc();
			canvasReady=true;
			loadBox.hide();
	  }//edn func	
	
});