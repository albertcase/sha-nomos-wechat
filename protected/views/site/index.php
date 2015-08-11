<div class="wrap">
<!-- InstanceBeginEditable name="content" -->
	<section class="explainBox">
    	<h3><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/spring/index/w1.jpg"></h3>
        <h4>请按照提示<br>拍摄或上传一张手腕照片并发给我们</h4>
        <p><i>1</i>拍摄时手机平行于手臂,中指平行于画面,中指拇指均抵住画面边缘</p>
        <p><i>2</i>上传照片后调整大小,使中指拇指均抵住画面边缘</p>
    </section>

    <!--end explain -->

    <section class="list_btn">
        <a href="<?php echo Yii::app()->request->baseUrl; ?>/site/list">
            <img src="<?php echo Yii::app()->request->baseUrl; ?>/images/spring/index/list_btn.jpg" width="100%"/>
        </a>
    </section>    
    
    <section class="cameraBox">
        <a id="btnCamera"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/spring/index/btn_camera.png"></a>
    </section>
    <!--end camera -->
    
    <section class="imgBox">
    	<div class="shell"></div>
        <div class="panel">
            <a class="btn btnAdd"></a>
            <a class="btn btnSub"></a>
            <a class="btn btnR1"></a>
            <a class="btn btnR2"></a>
      	</div>
      	<a class="btnCf"></a> 
      	<div class="sign">拖动腕表至手腕适当位置</div>
    </section>
    <!--end imgBox -->

    
    <section class="watchBox">
    	<h3><span>请选择一款NOMOS腕表</span></h3>
        <div class="focus">
       	  	<ul></ul>  
            <a class="boxBtn"></a>
            <a class="boxBtnL"></a>
            <a class="boxBtnR"></a>
   	  	</div>
  	</section>
    <!--end choice -->
    
    
  <!--end camera -->
  
  
  <div class="fileBox"><input type="file" accept="image/jpeg" name="fileInput" id="fileInput" viewid=<?php echo $views; ?> /></div>  
    
<!-- InstanceEndEditable -->
</div>
<!--end wrap -->
    
    <div id="popAlert">
        <p class="text"></p>
        <p class="btn"><a class="close">确认</a></p>
    </div>
    <!--end popAlert -->
    
    <div id="shareBox">
    	<img src="<?php echo Yii::app()->request->baseUrl; ?>/images/spring/common/share.png">
    </div>
    <!--end shareWx -->
    
	<div id="loadBox"><span></span></div>
    <!--end loadBox -->
    
    <div id="turnBox"><span></span></div>

<!-- InstanceBeginEditable name="script" -->
<script type="text/javascript">var BASEURL='<?php echo Yii::app()->request->baseUrl; ?>'</script>
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/spring/ocanvas.js"></script>
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/spring/nomos.js"></script>
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/spring/index.js"></script>

<script>
$(document).ready(function(e) {
    $("#fileInput").upload({callback:function(resp){
        imgCreat(resp.src);
    }});
    monitorAdd({obj:$('#btnCamera'),category:'拍照页',label:'拍照按钮'});
    monitorAdd({obj:$('.focus li'),category:'拍照页',label:'手表选择'});
});
</script>
