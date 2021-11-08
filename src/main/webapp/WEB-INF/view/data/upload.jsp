<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/header"  flush="false" />
<head>
	<title>ETRI 인공지능 데이터 허브 포털</title>
	
	<style>
		#upload {}
		#upload #files { position:relative;width:auto;height:auto; }
		
		
		#login .submit_btn {}
		
	</style>
</head>
<body>
	
	<div class="container" id="upload">
		<div class="w600">
			<div class="contents">
				<div class="page_title">업로드</div>
				
				<form id="fileForm" enctype="multipart/form-data">
			        <input  type="file" id="files" name="files" multiple  /><br/><br/>
			        <input class='submit_btn' type="button" value="전송하기" />
			    </form>



				
			</div>
		</div>
	</div>
	
	<jsp:include page="/footer"  flush="false" />		
	
</body>
<script>
	$(document).on("sessionLoad", function() {
		upload.init();
	});

	var upload = {
		pt: $("#upload"),
		init: function(){
			var that = this;

			
			that.listener();
		},
		
		listener: function(){
			var that = this;
			that.pt.find(".submit_btn").off("click").on("click",function(){
				that.submit();
				
			});
// 			that.pt.find(".submit_btn").off("click").on("click",function(){
// 				var inputValue = {
// 						account: that.pt.find("input[name='account']").val(),
// 						password: that.pt.find("input[name='password']").val(),
// 				};
				
// 				if(inputValue.account == ""){
// 					alert("아이디를 입력해주세요."); return;
// 				}
				
// 				if(inputValue.password == ""){
// 					alert("비밀번호를 입력해주세요."); return;
// 				}
		
// 				that.loginUser(inputValue);
// 			});
			
			
// 			that.pt.find("input[name='password']").keydown(function (key) {
// 		        if(key.keyCode == 13){
// 		        	that.pt.find(".submit_btn").trigger("click");
// 		        }
// 		    });
			
		},
		
		submit: function(){
			var that = this;
			var formData = new FormData();

			var fileCnt = $("input[name=files]")[0].files.length;
			for(var i = 0 ; i < fileCnt ; i++){
				formData.append("files",$("input[name=files]")[0].files[i]);	
			}
			formData.append("title","title");
			formData.append("contents","contents");
			 

			
			$.ajax({
			   	url :  baseUrl + "data/insertDataset.json",
			   	data : formData,
			   	type : "POST",
			   	processData : false,
			   	contentType: false,
			   	success : function(res){
					console.log("=====upload=====", res);
					if(res.result.code == "200"){
						
					} else {
						alert("다시 시도해주세요.");
					}
			   	},
			   	error : function(err){
			   		 console.log("ERROR!!", err);
			   	}
			});
		},
		
	};


</script>