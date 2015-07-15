/**
 * Created by zhenfeng on 14-10-7.
 */
var Img = {}; 
$.fn.upload = function(c){
	config = {
		apiURL : "site/handler/action/upload",
		inputID : "fileInput",
		callback : function(data){console.log(data)}
	}
	c = $.extend(config, c || {});
	return this.each(function(){
		var _ = $(this);
		
		var upload = function(){
			$("#loadBox").show();
			$.ajaxFileUpload
            (
                {
                    url: c.apiURL, //用于文件上传的服务器端请求地址
                    secureuri: false, //是否需要安全协议，一般设置为false
                    fileElementId: c.inputID, //文件上传域的ID
                    dataType: 'json', //返回值类型 一般设置为json
                    success: function (data, status)  //服务器成功响应处理函数
                    {
						$("#loadBox").hide();
						if(data.code == 11) $('#popAlert').popOn({text:'请上传图片~'});
						if(data.code == 12) $('#popAlert').popOn({text:'保存文件失败，请重新上传~'});
						if(data.code == 14) $('#popAlert').popOn({text:'服务器错误，数据存储失败~'});
						if(data.code == 200){
							Img = data;
							c.callback(data);
						}
                    },
                    error: function (data, status, e)//服务器响应失败处理函数
                    {
						$("#loadBox").hide();
                        alert(e);
                    }
                }
            )
		};
		
		_.on("change",upload);
	});
}
