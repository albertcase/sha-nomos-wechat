<div class="wrap">
<!-- InstanceBeginEditable name="content" -->

	<section class="listBox" id="showlist">
    	<h3><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/spring/list/logo.png"></h3>
    	<ul>
    	<?php 
    	$layout = "";
    	foreach( $data as $x){
    	$layout = $layout."<li><img src='".Yii::app()->request->baseUrl."/".$x['src']."'><i>".$x['score']."分</i></li>";
    	}
    	$layout = $layout."<li><a href='".Yii::app()->request->baseUrl."/' class='btnMore'><img src='".Yii::app()->request->baseUrl."/images/spring/list/btn_more.png'></a></li>";
    	echo $layout;
    	?>
    	</ul>
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
	<img src="<?php echo Yii::app()->request->baseUrl; ?>/images/spring/common/share.png"/>
</div>
<!--end shareWx -->

<div id="loadBox"><span></span></div>
<!--end loadBox -->

<div id="turnBox"><span></span></div>
<script>
$(document).ready(function(e) {
	var listBox=$("#showlist ul");
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
			url : "site/handler/action/getTop",

			cache:false,
			dataType:"json",
			success: function(resp){
				if(resp.code == 200){
					alert("aaaaaaa");
					creatWatch(resp.data);
					alert("aaaaaaa");
				}
			}
		});
		
	}//end func
	
	function creatWatch(data){
		for(var i=0; i<data.length; i++){
			var li=$('<li></li>').appendTo(listBox);
			var img=$('<img>').attr({src:data[i].src}).appendTo(li);
			var score=$('<i></i>').html(data[i].score+'分').appendTo(li);
		}//end for
		var more=$('<li><a href="<?php echo Yii::app()->request->baseUrl; ?>/site/index.php" class="btnMore"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/spring/list/btn_more.png"></a></li>').appendTo(listBox);
	}//end func
	
	
	
});
</script>