<div class="wrap">
<!-- InstanceBeginEditable name="content" -->

	<section class="listBox">
    	<h3><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/spring/list/logo.png"></h3>
    	<ul></ul>
    </section>
    <!--end result -->

    
<!-- InstanceEndEditable -->
</div>
<!--end wrap -->
    
<div id="popAlert">
    <p class="text"></p>
    <p class="btn"><a class="close">确认</a></p>
</div>
<!--end popAlert -->

<div id="shareBox">
	<img src="<?php echo Yii::app()->request->baseUrl; ?>/images/spring/logo.jpg"  />
</div>
<!--end shareWx -->

<div id="loadBox"><span></span></div>
<!--end loadBox -->

<div id="turnBox"><span></span></div>
<script>
$(document).ready(function(e) {
	var listBox=$('section.listBox ul');
    var watchData=[];
	var watchMax=8;
	
	init();
	
	function init(){
		
		getWatch();
		
	}//end func
	
	function getWatch(){
		
		//模拟生成数据
		/*for(var i=0; i<watchMax; i++){
			watchData.push({src:"images/result/pic.jpg",score:randomRange(40,99)});
		}//end for
		creatWatch(watchData);
		*/
		//ajax获取数据
		$.ajax({
			url : "handler.php?action=getTop",
			type:"GET",
			cache:false,
			dataType:"json",
			success: function(resp){
				if(resp.code == 200){
					creatWatch(resp.data);
				}
			}
		})
		
	}//end func
	
	function creatWatch(data){
		for(var i=0; i<data.length; i++){
			var li=$('<li></li>').appendTo(listBox);
			var img=$('<img>').attr({src:data[i].src}).appendTo(li);
			var score=$('<i></i>').html(data[i].score+'分').appendTo(li);
		}//end for
		var more=$('<li><a href="<?php echo Yii::app()->request->baseUrl; ?>/index.php" class="btnMore"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/spring/list/btn_more.png"></a></li>').appendTo(listBox);
	}//end func
	
	
	
});
</script>