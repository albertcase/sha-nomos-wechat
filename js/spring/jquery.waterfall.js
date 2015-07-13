//2014.6.27
(function($) {
	$.fn.extend({
		waterfallInit: function(option) {
			var _this=$(this);
			var _box,_boxWd,_boxHt,_htMin,_boxColumn,_boxLast;
			var _boxSp,_boxImg,_boxPics,_boxPicsNow,_boxPicsMax,_boxAdd,_boxAni,_boxPadding;
			var _boxLoad=$('#waterfallLoad');
			var ie=document.all && navigator.userAgent.indexOf("MSIE")>0;
			if(option){
				_boxSp=option.space!=null?option.space:5;
				_boxImg=option.image!=null?option.image:".pic";
			}//end if
			else{
				_boxSp=5;
				_boxImg=".pic";
			}//end else			
			init();
			
			function init(){	
				//console.log('waterfall init');
				_boxAni=false;
				_boxLast=0;
				_boxPadding=0;
				if(_this.css("position")!="relative" && _this.css("position")!="absolute"  && _this.css("position")!="fixed") _this.css({position:"relative"})
				_this.on("reset",resetFunc).on("add",addFunc).on("resize",resetFunc);
				$(window).on("resize",resetFunc);
			}//end func
			
			function resetFunc(e){
				_boxAni=e?true:false;
				//console.log('reset _boxAni:'+_boxAni);
				_box=_this.children().css({position:"absolute"});
				_boxLast=_box.length;
				_boxWd=_box.first().outerWidth();
				_htMin=[];
				_boxColumn=Math.floor(_this.innerWidth()/(_boxWd+_boxSp*2));
				_boxColumn=_boxColumn<1?1:_boxColumn;
				_boxPics=_box.children(_boxImg).children("img");
				console.log(_boxColumn);
				console.log(_box.length<_boxColumn?_box.length:_boxColumn);
				var col=_box.length<_boxColumn?_box.length:_boxColumn;
				_boxPadding=Math.floor((_this.innerWidth()-(_boxWd+_boxSp*2)*col)/2);
				console.log('boxWd:'+_boxWd);
				console.log('boxWdes:'+(_boxWd+_boxSp*2)*col);
				console.log('boxPadding:'+_boxPadding);
				_box.hide();
				_boxAdd=false;
				boxPicsLoad();
			}//end func
			
			function addFunc(e){
				//console.log('waterfall add');
				//console.log('_boxLast:'+_boxLast);
				if(_boxLast>_boxColumn-1){
					_boxAni=false;
					//console.log('add _boxAni:'+_boxAni);
					var boxes=_this.children();
					_box=boxes.eq(_boxLast-1).nextAll().css({position:"absolute"});
					_boxPics=_box.children(_boxImg).children("img");
					_boxLast=boxes.length;
					_this.data({num:_boxLast});
					_box.hide();
					_boxAdd=true;
					boxPicsLoad();
				}//end if
				else resetFunc();
			}//end func
			
			function boxPicsLoad(){
				var loader = new PxLoader();
				if(_boxLoad.length>0) _boxLoad.show();
				_boxPics.each(function(i) {
				   loader.addImage($(this).attr('src'));
                });
				loader.addProgressListener(function(e) { 
					//loaderTxt.html(Math.round(e.completedCount/e.totalCount*100)); 
				});
				loader.addCompletionListener(function() {
					//console.log('all load complete!');	
					if(_boxLoad.length>0) _boxLoad.hide();
					if(!_boxAni) _box.fadeIn(250);
					else _box.show();
					boxFunc();
				});			
				loader.start();
			}//end func
			
			function boxFunc(){
				//console.log('_boxAni:'+_boxAni);
				for (var i=0; i<_box.length; i++){
					var box=_box.eq(i);
					var ht=box.outerHeight()+_boxSp;
					if(i<_boxColumn && !_boxAdd){
						_htMin[i]=ht+_boxSp;
						if(_boxAni) box.animate({left:_boxPadding+_boxSp + i * (_boxWd + _boxSp*2),top:0},500);
						else box.css({left:_boxPadding+_boxSp + i * (_boxWd + _boxSp*2),top:0});
					}//end 第一行
					else{
						var minH=Math.min.apply({}, _htMin);//获得最短列的高
						var minId;
						for(var j=0; j<_htMin.length; j++){
							if(minH==_htMin[j]){
								minId=j;
								break;
							}//end if
						}//end for //获得最短列的序列号
						_htMin[minId] += ht+_boxSp; //从新赋值最短列的高度
						//将单元塞入最短列的下方
						if(_boxAni) box.animate({left:_boxPadding+_boxSp + minId * (_boxWd + _boxSp*2),top:minH},500);
						else box.css({left:_boxPadding+_boxSp + minId * (_boxWd + _boxSp*2),top:minH});
					}//end 第二行以上
				}//end for
				_this.height(Math.max.apply({}, _htMin));
			}//end func
		},//end fn	
		waterfallReset: function() {
			$(this).trigger('reset');
		},//end fn
		waterfallAdd: function() {
			$(this).trigger('add');
		}//end fn
	});//end extend
})(jQuery);//闭包