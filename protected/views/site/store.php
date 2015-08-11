<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta name="description" content="h&m" />
	<meta name="author" content="cartier" />
	<title><?php echo $storeMsg['name']?></title>
	<link href="/css/spring/map.css" type="text/css" rel="stylesheet" />
	<style type="text/css">
		html, body {background: #f7f7f7;}
	</style>
</head>
<body>
	<br/>
	<div class="com-wrap">
		<div class="com-pic detail-pic">
			<img src="<?php echo $storeMsg['picUrl']?>" alt="">
		</div>
		<div class="com-pic">
			<div class="com-text1 detail-text1">
				<div class="t1">
					<?php echo $storeMsg['name']?> 位于
				</div>
				<div class="t1">
					<?php echo $storeMsg['address']?><br>
				</div>
				<div class="t1">
					联系电话：<a style="color:#ffffff;" href="tel:<?php echo $storeMsg['telphone']?>"><?php echo $storeMsg['telphone']?></a><br>
				</div>
			</div>
			<a href="<?php echo $storeMsg['open']?>">
				<img src="<?php echo $storeMsg['mapUrl']?>" class="mapimg" />
			</a>
		</div>
	</div>
</body>
</html>