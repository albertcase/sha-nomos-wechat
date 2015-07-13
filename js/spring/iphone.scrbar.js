//2014.7.17
(function($) {
	$.fn.extend({
		scrbar: function() {	
			var _this=$(this);
			var scrCont,scrChild,scrPanel,scrZone,scrHand,scrLineT,scrDisSize,scrHandSize,scrZoneSize,scrLineB,scrTar,scrCan,scrContSize,scrContSizeLast,scrTimer,scrInter;
			var scrChildNow,scrChildMax,scrPage,scrBtnPage,scrBtnPrev,scrBtnNext;
			var _sp=10;
			var _posXLast,_posYLast;
			init();	
			function init(){
				scrTar=0;
				scrCont=_this.children("div.scrCont");
				scrChild=scrCont.children();
				scrPanel=_this.children("div.scrPanel");
				scrZone=scrPanel.children("div.scrZone");
				scrHand=scrZone.children("div.scrHand");
				_this.on("off",_this_off);
				_this.on("touchstart",_this_touchstart);
				_this.on("touchmove",_this_touchmove);
				scrContSizeLast=scrContSize=0;
				sizeFunc();
				scrInter=setInterval(sizeFunc,250);	
			}//end func		
			
			//关闭功能
			function _this_off(e){
				_this.off();
				clearInterval(scrInter);
			}//end func		
			
			//-------------------------------高宽度侦测及初始化
			function sizeFunc(){
				scrContSize=scrCont.height();
				if(scrContSizeLast!=scrContSize){
					scrContSizeLast=scrContSize;//滚动内容上一次高
					//scrTar=0;
					scrDisSize=_this.height();//可见区域高度
					scrZone.css("height",_this.height());
					scrZoneSize=scrZone.height();//可滑动高度
					scrHandSize=scrHand.height();
					scrHand.css("top",-scrCont.position().top/(scrContSize-scrDisSize)*(scrZoneSize-scrHandSize));
					scrLineT=scrHandSize/2;
					scrLineB=scrZoneSize-scrHandSize/2;	
					if(scrContSize<=scrDisSize){
						scrCan=false;
						scrPanel.hide();
					}//end if
					else{
						scrCan=true;
						scrPanel.show();
					}//end else
				}//scrContSizeLast!=scrContSize					
			}//end func	
			//-----------------TOUCH事件
			function _this_touchstart(e){
				if(scrCan){
					_posXLast=event.touches[0].clientX;
					_posYLast=event.touches[0].clientY;
				}//end if
			}//end func
			function _this_touchmove(e){
				e.preventDefault();
				scrTar-=event.changedTouches[0].clientY-_posYLast;
				scrollFunc();
				_posXLast=event.changedTouches[0].clientX;
				_posYLast=event.changedTouches[0].clientY;
			}//end func
			//-------------------------------运动计算部分	 
			function scrollFunc(){
				scrTar=scrTar>scrLineB?scrLineB:scrTar;
				scrTar=scrTar<scrLineT?scrLineT:scrTar;
				var pos=-(scrTar-scrLineT)/(scrZoneSize-scrHandSize)*(scrContSize-scrDisSize);
				scrHand.css("top",scrTar-scrLineT);
				scrCont.css({"-webkit-transform":'translate3d('+ 0 +'px,'+ pos +'px,0px)'});		
			}//end func			
		},//end fn
		scrbarOff: function() {
			$(this).trigger('off');
		}//end fn	
	});//end extend
})(jQuery);//闭包