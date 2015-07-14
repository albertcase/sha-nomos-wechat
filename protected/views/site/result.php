<div class="wrap">
<!-- InstanceBeginEditable name="content" -->

	<section class="resultBox">
    	
        <div class="pic">
        	<h4><img id="watchImg"></h4>
            <p>长按图片保存至手机</p>
        </div>
        
        <table class="score" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="bar">
            	<p><span>肤色搭配</span><i class="scoreBar"></i></p>
                <p><span>手型搭配</span><i class="scoreBar"></i></p>
                <p><span>时尚指数</span><i class="scoreBar"></i></p>
                <p><span>综合评分</span><i class="scoreBar"></i></p>
                <h4 id="scoreWord"></h4>
            </td>
            <td class="tot">
            	<span><i class="scoreTot"></i></span>
            </td>
          </tr>
        </table>

        <table class="btns" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><a href="<?php echo Yii::app()->request->baseUrl; ?>/site/contact" class="link1"><span class="one">联络我们</span></a></td>
            <!--<td><a href="#" class="link2"><span>NOMOS<br>专卖店</span></a></td> -->
            <td><a href="<?php echo Yii::app()->request->baseUrl; ?>/site/list" class="link3"><span>上传照片至<br>腕间留影</span></a></td>
            <td><a class="btnShare"><span>分享到<br>朋友圈</span></a></td>
          </tr>
        </table>

        
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
    	<img src="<?php echo Yii::app()->request->baseUrl; ?>/images/spring/common/share.png">
    </div>
    <!--end shareWx -->
    
	<div id="loadBox"><span></span></div>
    <!--end loadBox -->
    
    <div id="turnBox"><span></span></div>



<script>
$(document).ready(function(e) {
    var watchScore;
    var watchImg=$('#watchImg');
    var watchScoreBar=$('i.scoreBar');
    var watchScoreTot=$('i.scoreTot');
    var watchScoreWord=$('#scoreWord');
    
    init();
    
    function init(){
        getWatch();
        getScore();
        addEvent();
    }//end func
    
    function getWatch(){//获得合成好的手表图片
        var src=getQueryString('src');
        src=src||'images/spring/result/pic.jpg';
        watchImg.attr({src:'<?php echo Yii::app()->request->baseUrl; ?>/'+src});
    }//end func
    
    function getScore(){//获得比分
        //模拟随机给score赋值
        var scoreList = getQueryString('marks').split(",");
        console.log(scoreList);
        //var scoreList=[randomRange(10,25),randomRange(10,25),randomRange(10,25),randomRange(10,25)];
        watchScore=0;       
        for(var i=0; i<scoreList.length; i++){
            watchScoreBar.eq(i).css({width:scoreList[i]/25*6+'em'});
            watchScore+=parseInt(scoreList[i]);
            watchScore=watchScore==100?99:watchScore;
        }//end for
        watchScoreTot.html(watchScore);
        if(watchScore<=69){
            watchScoreWord.html('不够拉风没关系，下一款就是你的菜！');
            descContent='NOMOS试戴中我得了'+watchScore+'分，下一款会更棒！不信来看！'
        }//end if
        else if(watchScore<=79){
            watchScoreWord.html('就快找到更适合你的腕表啦，么么哒！');
            descContent='NOMOS试戴我得了'+watchScore+'分，你要和我去找找更适合的吗？'
        }//end if
        else if(watchScore<=89){
            watchScoreWord.html('这款腕表如此衬你，你爸妈造吗？！');
            descContent='NOMOS试戴我得了'+watchScore+'分，连我爸妈都赞不绝口！你呢？'
        }//end if
        else{
            watchScoreWord.html('萌萌哒! 整个人都开始闪耀起来了呢！');
            descContent='NOMOS试戴我得了'+watchScore+'分，整个人都闪耀了！来挑战吗？'
        }//end if
    }//end func
    
    function addEvent(){
    }//end func
    
});
</script>    