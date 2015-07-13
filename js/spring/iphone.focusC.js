//2014.9.12
(function($) {
	$.fn.extend({
		focusC: function(option) {
			var _this=$(this);	
			var boxMask,boxCont,boxThis,boxBtnL,boxBtnR,boxTot,boxWd,boxHt,boxMax,boxesWd,boxesHt,boxDis,boxUnit,boxTar,boxTimer,boxNow,boxBtnThis,boxRollDir,boxShowNum;
			var _auto,_sp,_delay,_num;
			var _posXSt,_posYSt,_posXLast,_posYLast;
			var boxJump;
			var fullscreen;
			var boxTl;
			if(option){
				_delay=option.delay!=null?option.delay:5000;
				_sp=option.speed!=null?option.speed:1;
				_auto=option.auto!=null?option.auto:false;
				_num=option.num!=null?option.num:false;
				fullscreen=option.fullscreen;
			}//end if
			else{
				_delay=5000;
				_sp=1;
				_auto=false;
				_num=false;
			}//end else	
			init();	
			function init(){
				boxMask=_this.children("div.boxMask");
				boxCont=boxMask.children();
				boxThis=boxCont.children();
				boxTot=boxThis.length;//实际有几张图
				boxBtn=_this.children("div.boxBtn");
				boxBtnL=_this.children("div.boxBtnL");
				boxBtnR=_this.children("div.boxBtnR");
				window_resize();
				$(window).on('resize',window_resize);
				boxTar=0;
				boxNow=1;
				boxRollDir=-1;
				boxShowNum=1;
				boxJump=false;
				boxCont.append(boxThis.first().clone());
				boxThis=boxCont.children();
				boxMax=boxThis.length;
				boxesWd=boxMax*boxWd;//总长度
				boxesHt=boxMax*boxHt;//总高度
				boxCont.width(boxesWd);
				boxDis=boxesWd-boxWd;boxUnit=boxWd;	
				for(var i=1; i<boxMax;i++){
					if(!_num){boxBtn.append('<span></span>');}else{boxBtn.append('<span>'+i+'</span>');}
				}//end for		
				_this.on("off",_this_off);	
				_this.on("reset",resetFunc).on("goto",gotoFunc).on("prev",prevFunc).on("next",nextFunc).on("stop",stopFunc).on("play",playFunc);
				boxCont.on('swipeleft',swipeleft_handler);
				boxCont.on('swiperight',swiperight_handler);
				if(boxBtnL.length>0) boxBtnL.on('touchend',boxBtnL_click);
				if(boxBtnR.length>0) boxBtnR.on('touchend',boxBtnR_click);
				if(boxBtn.length>0){
					boxBtnThis=boxBtn.children();	
					boxBtnThis.on('click',boxBtnThis_click);
					boxBtnThis.eq(boxNow-1).click();
				}//end if
				timerFunc();
			}//end func
			
			//关闭功能
			function _this_off(e){
				_this.off();
				boxCont.off();
				boxThis.off();
				if(boxBtnL.length>0) boxBtnL.off();
				if(boxBtnR.length>0) boxBtnR.off();
				if(boxBtn.length>0) boxBtnThis.off();
				if(_auto) clearInterval(boxTimer);
			}//end func
			
			//---------屏幕自适应
			function window_resize(e){
				if(fullscreen){
					boxWd=$(window).width();
					boxHt=$(window).height();
				}//end if
				else{
					boxWd=_this.width();
					boxHt=_this.height();
				}//end else
				boxesWd=boxMax*boxWd;//总长度
				boxesHt=boxMax*boxHt;//总高度
				boxMask.css({width:boxWd,height:boxHt});
				boxCont.width(boxesWd);
				boxDis=boxesWd-boxWd;		
				boxThis.css({width:boxWd,height:boxHt});
				boxJump=true;
				boxMotion();		
			}//end func

			//---------自定义事件
			function stopFunc(event){
				clearInterval(boxTimer);
			}//end func
			function playFunc(event){
				timerFunc();
			}//end func
			function prevFunc(event){
				boxRollDir=1;
				boxRollFunc();
			}//end func
			function nextFunc(event){
				boxRollDir=-1;
				boxRollFunc();
			}//end func
			function resetFunc(event){
				if(window.console) console.log('focus reset');
				boxNow=1;
				boxJump=true;
				TweenLite.killTweensOf(boxCont);
				boxMotion();
				if(boxBtn.length>0) boxBtnChange();
			}//end func
			function gotoFunc(event,value1,value2){
				console.log('value1:'+value1);
				if(boxDis>0){
					boxNow=value1+1;
					console.log('boxNow:'+boxNow);
					boxJump=true;
					TweenLite.killTweensOf(boxCont);
					boxTar=-boxWd*(boxNow-1);
					console.log('boxTar:'+boxTar);
					boxMotion();
					if(boxBtn.length>0) boxBtnChange();
				}//end if
			}//end func
			
			//---------------touch swipe 事件
			function swipeleft_handler(e){
				if(window.console) console.log('focus swipe left');
				e.preventDefault();
				boxBtnR_click();
			}//end func
			function swiperight_handler(e){
				if(window.console) console.log('focus swipe right');
				e.preventDefault();
				boxBtnL_click();
			}//end func
			
			//----------鼠标事件			
			function boxBtnThis_click(e){
				var _obj=$(e.target);
				var _id=_obj.index();
				if(!boxCont.hasClass("moving") && boxDis>0){
					boxNow=_id+1;    
					boxTar=-boxWd*(boxNow-1);
					boxMotion();
					if(boxBtn.length>0) boxBtnChange();
				}//end if
			}//end func
			function boxBtnL_click(e){
				boxRollDir=1;
				boxRollFunc();
			}//end func
			function boxBtnR_click(e){
				boxRollDir=-1;
				boxRollFunc();
			}//end func			
			function timerFunc(){
				if(_auto){
					clearInterval(boxTimer);
					boxTimer=setInterval(boxRollFunc,_delay);
				}//end if
			}//end func			
			function boxRollFunc(){
				if(!boxCont.hasClass("moving") && boxDis>0){			
						boxTar+=boxUnit*boxRollDir;	
						if(boxRollDir==-1 && boxTar<-boxDis){
							TweenLite.set(boxCont,{transform:'translate3d('+ 0 +'px,'+ 0 +'px,0px)'});
							boxTar=-boxUnit;
						}//end if(boxRollDir==-1) 
						else if(boxRollDir==1 && boxTar>0){	
							boxTar=-boxesWd+boxShowNum*boxUnit;
							TweenLite.set(boxCont,{transform:'translate3d('+ boxTar +'px,'+ 0 +'px,0px)'});
							boxTar+=boxUnit;
						}//end else (boxRollDir==-1)				
					boxMotion();			   
					if(boxRollDir==-1){
					  boxNow++;
					  boxNow=boxNow>boxTot?1:boxNow;
					}//end if
					else{
					  boxNow--;
					  boxNow=boxNow<1?boxTot:boxNow; 
					}//end else				
					if(boxBtn.length>0) boxBtnChange();
				}//end if(!boxCont.hasClass("moving") && boxDis>0)
			}//end func	
			function boxMotion(){
				if(boxJump){
					boxJump=false;
					if(boxNow==1) TweenLite.set(boxCont,{transform:'translate3d('+ 0 +'px,'+ 0 +'px,0px)'});
					else TweenLite.set(boxCont,{transform:'translate3d('+ boxTar +'px,'+ 0 +'px,0px)'});
				}//end if
				else{
					boxCont.addClass('moving');
					boxTl=TweenLite.to(boxCont,_sp, {transform:'translate3d('+ boxTar +'px,'+ 0 +'px,0px)', ease:Quart.easeOut,onComplete:function(){
						if(boxNow==1) TweenLite.set(boxCont,{transform:'translate3d('+ 0 +'px,'+ 0 +'px,0px)'});
						boxMotionComplete();
					}});
				}//end else
			}//end func		
			function boxMotionComplete(){
				boxCont.removeClass('moving');
			}//end if
			function boxBtnChange(){
				boxBtnThis.removeClass().eq(boxNow-1).addClass("active");
			}//end func
		},//end fn		
		focusReset: function() {
			$(this).trigger('reset');
		},//end fn	
		focusGoto: function(value1,value2) {
			value1=value1!=null?value1:0;
			value2=value2!=null?value2:true;
			$(this).trigger('goto', [value1,value2]);
		},//end fn
		focusPrev: function() {
			$(this).trigger('prev');
		},//end fn
		focusNext: function() {
			$(this).trigger('next');
		},//end fn
		focusStop: function() {
			$(this).trigger('stop');
		},//end fn
		focusPlay: function() {
			$(this).trigger('play');
		},//end fn
		focusOff: function() {
			$(this).trigger('off');
		}//end fn	
	});//end extend	
})(jQuery);//闭包