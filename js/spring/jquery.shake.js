//2014.7.26
(function($) {	
	$.fn.extend({
		shakeOn: function(option) {		
			var _delay,_hold,_max,_now,_callback;
			var lastTime,lastX,lastY,lastZ;
			if(option){
				_callback=option.callback;
				_hold=option.hold!=null?option.hold:500;
				_max=option.max!=null?option.max:5;
				_delay=option.delay!=null?option.delay:100;
			}//end option
			if(_callback) init();
			function init(){
				_hold=500;
				_max=5;
				_now=0;
				lastTime=0;
				$(window).on('off',_this_off);
				if(window.DeviceMotionEvent) $(window).on('devicemotion',deviceMotionHandler);
			}//end func
			function _this_off(e){
				if (window.DeviceMotionEvent) $(window).off('devicemotion',deviceMotionHandler);
			}//end func
			function deviceMotionHandler(e) {
				var curTime = new Date().getTime();
				if ((curTime-lastTime)>_delay) {
					var diffTime = curTime -lastTime;
					lastTime = curTime;
					// 获取含重力的加速度
				　　var acceleration = event.accelerationIncludingGravity; 
					var speed = Math.abs(acceleration.x+acceleration.y+acceleration.z-lastX-lastY-lastZ)/diffTime*10000;
					if (speed >= _hold){
						_now++;
						if(_now>=_max){
							_now=0;
							_callback();
						}//end if
					}//end if
					else{
						_now--;
						_now=_now<0?0:_now;
					}//end else 
					lastX=acceleration.x;
					lastY=acceleration.y;
					lastZ=acceleration.z;
				}//end if
			}//end event	
		},//end fn
		shakeOff: function() {
			$(window).trigger('off');
		}//end fn
	});//end extend
})(jQuery);//闭包