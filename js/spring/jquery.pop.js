//2013.11.20
(function($) {	
	$.fn.extend({
		popOn: function(option) {	
			var _this=$(this);
			var _box,_mask;
			var _y,_fade;
			var _mouseover;
			if(option){
				_y=option.y!=null?option.y:($(window).height()-_this.outerHeight())/2; //默认赋值
				_fade=option.fade!=null?option.fade:250;
				_mouseover=option.mouseover!=null?option.mouseover:false;
			}//end if
			else{
				_y=($(window).height()-_this.outerHeight())/2; //默认赋值
				_fade=250;
				_mouseover=false;
			}//end else
			init();
			function init(){
				if(!_this.parent().hasClass("popBox"))_this.wrap("<div class='popBox'></div>").before("<div class='popMask'></div>");
				_box=_this.parent();
				_mask=_this.siblings();
				_box.css("position","fixed");
				if(_fade<=1){_this.show();}else{_this.fadeIn(_fade);}
				maskReset();
				_this.on('resize',scrollFunc).one('close',closeFunc).find(".close").one('click',closeFunc);//end on
				if(_mouseover) _this.one("mouseleave",mouseoversFunc)
				$(window).on('resize',maskReset).on('scroll',scrollFunc);//end on
			}//end func	
			function mouseoversFunc(event){
				closeFunc();
				thumbBox.off('mouseenter',pic_click);
				setTimeout(function(){thumbBox.on('mouseenter',pic_click);},250);
			}//end func
			function closeFunc(event){
				$(window).off('resize',maskReset).off('scroll',scrollFunc);
				_this.off('resize',scrollFunc).unwrap().hide();
				_mask.remove();
			}//end func
			function maskReset(event){
				//alert("window resize");//测试on用
				_mask.css({width:$(window).width(),height:$(window).height()});
				_this.css("top",_y);
				scrollFunc();
			}//end func
			function scrollFunc(event){
				_this.css("left",Math.floor($(window).width()/2-_this.outerWidth()/2));
			}//end func
		},//end fn
		popOff: function() {
			$(this).trigger('close');
		}//end fn
	});//end extend	
})(jQuery);//闭包