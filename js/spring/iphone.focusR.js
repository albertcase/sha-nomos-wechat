//2014.9.28
(function($) {	
	jQuery.fn.extend({
		focusR: function() {	
			var _this=$(this);
			var boxCont,boxThis,boxBtn,boxBtnL,boxBtnR,boxWd,boxHt,boxMax,boxesWd,boxesHt,boxDis,boxTimer,boxNow,boxDir,boxJump,boxSp=0.75;
			var watchCall=watchCall||window.watchCall;
			init();
			
			function init(){
				boxWd=_this.width();
				boxHt=_this.height();
				boxCont=_this.children('ul');
				boxThis=boxCont.children().css({width:_this.width(),height:_this.height()});
				boxBtn=_this.children("a.boxBtn");
				boxBtnL=_this.children("a.boxBtnL");
				boxBtnR=_this.children("a.boxBtnR");
				boxMax=boxThis.length;//一共有几张图
				console.log('boxMax:'+boxMax);
				boxesWd=boxMax*boxWd;//总长度
				boxesHt=boxMax*boxHt;//总高度
				boxNow=1;
				boxDir=-1;
				boxJump=false;
				boxThis.css({width:_this.width(),height:_this.height()});
				boxCont.width(boxesWd);
				boxDis=boxesWd-boxWd;
				_this.on('swipeleft',swipeleft_handler).on('swiperight',swiperight_handler);
				boxThis.children('img').on('click',box_click);
				if(boxMax<=1){
					boxBtnL.hide();
					boxBtnR.hide();
					boxBtn.hide();
				}//end if
				if(boxBtnL.length>0) boxBtnL.on('click',boxBtnL_click);
				if(boxBtnR.length>0) boxBtnR.on('click',boxBtnR_click);
				boxBtnChange();
			}//end func	
			
			function box_click(e){
				watch_click(boxNow);
			}//end func
			
			//---------------touch swipe 事件
			function swipeleft_handler(e){
				e.preventDefault();
				boxBtnR_click();
			}//end func
			function swiperight_handler(e){
				e.preventDefault();
				boxBtnL_click();
			}//end func
			
			//----------事件	
			function boxBtnL_click(e){
				if(!boxCont.hasClass("moving") && boxDis>0 && boxNow > 1){	
					boxNow--;
					boxDir=-1;
					boxMotion();
					boxBtnChange();
				}//end if
			}//end func
			function boxBtnR_click(e){
				if(!boxCont.hasClass("moving") && boxDis>0 && boxNow < boxMax){	
					boxNow++;
					boxDir=1;
					boxMotion();
					boxBtnChange();
				}//end if
			}//end func		
			function boxRollFunc(){
				if(!boxCont.hasClass("moving") && boxDis>0){		
					if(boxNow==1 || boxNow==boxMax)boxDir=-boxDir;
					if(boxDir==-1){ boxNow--;}else{boxNow++;}
					boxMotion();
					boxBtnChange();
				}//end if(!boxCont.hasClass("moving") && boxDis>0)
			}//end func			
			function boxMotion(){
				if(boxJump){
					boxJump=false;
					TweenLite.set(boxCont, {transform:'translate3d('+ -(boxNow-1) * boxWd +'px,'+ 0 +'px,0px)'});
				}//end if
				else{
					boxCont.addClass('moving');
					TweenLite.to(boxCont,boxSp, {transform:'translate3d('+ -(boxNow-1) * boxWd +'px,'+ 0 +'px,0px)', ease:Power1.easeInOut,onComplete:boxMotionComplete});
				}//end else				
			}//end func
			function boxMotionComplete(){
				boxCont.removeClass('moving');
			}//end if		
			function boxBtnChange(){
				if(boxBtnL.length>0 && boxBtnR.length>0){
					if(boxNow==1){
						boxBtnL.removeClass("active");
						boxBtnR.addClass("active");
					}else if(boxNow==boxMax){
						boxBtnL.addClass("active");
						boxBtnR.removeClass("active");
					}else{
						boxBtnL.addClass("active");
						boxBtnR.addClass("active");
					}//end if
				}//end if
				boxBtn.html(boxNow+'/'+boxMax);
			}//end func
		}//end fn	
	});//end extend
})(jQuery);//闭包
