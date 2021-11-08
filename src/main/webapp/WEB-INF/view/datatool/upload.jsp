<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/header"  flush="false" />
<head>
	<title>ETRI 인공지능 데이터 허브 포털</title>
	
	<style>
		.bg-sub-share{ 	width: 100%; height: 200px; background-image: url('../images/bg-sub-share.png'); background-repeat: no-repeat; }
		.bg-sub-share>div { color: #ffffff; text-align: left; }
		.bg-sub-share .bg_title { font-size: 28px;	font-weight: 500px;}
		.bg-sub-share .bg_info { opacity: 0.9;	line-height: 1.81; }
		
		
		#upload {}
		#upload .contents {padding: 0 100px; margin-bottom: 90px; }
/* 		#upload #files { position:relative; width:auto; height:auto; } */
		
		#upload .upload_wrap { margin-top: 20px; background-color: #fff;  border: solid 1px #d9d9d9; border-top: solid 2px #333; padding: 80px 120px; }
		#upload .list_btn { cursor:pointer; width: 153px; line-height: 44px;     margin-top: 0;   font-size: 14px;  font-weight: 300;}
		#upload .list_btn a:hover {color:#fff; background-color: #008bed;}
		#upload .upload_wrap .border_box:before {  content: 'File Info'; background-image: url(../images/ic-sub-dataedit-image.png); }
		#upload .upload_wrap .input_wrap { margin-bottom: 30px; }
		
		#upload .upload_wrap .input_label { width: 140px; }
		#upload .upload_wrap input { width: 615px; }
		#upload .upload_wrap textarea { width: 615px; }
		
		#upload .upload_wrap .submit_btn { cursor: pointer; padding: 0; font-weight: 500; color: #fff; width: 240px; height: 41px; border-radius: 2px; box-shadow: 0px 3px 0 0 rgba(0, 0, 0, 0.1);  border: solid 1px #1e88f5; background-color: #1e88f5; }
			
			
		#upload .upload_wrap .file_text { padding: 0 20px; width: 356px; height: 36px; border-right: 0; }
		#upload .upload_wrap .file_btn { cursor:pointer;   padding: 0 10px; margin-left: -3px; width: 96px; height: 38px; border: 1px solid #1e88f5; border-radius: 2px; color: #1e88f5; background-color: #ffffff; z-index: 30; }
		#upload .upload_wrap .upload_label { margin-bottom: 18px; font-size: 12px; font-weight: 500; }
		#upload .upload_wrap  input[type='radio']{ width: 13px; margin-right: 10px; margin-left: 10px; }
	</style>
</head>
<body>
	
	<div class="container" id="upload">
		<div class="bg-sub-share flex">
			<div class="w1200">
				<div class="bg_title">AI 공유 플랫폼</div>
				<div class="bg_info">
					인공지능 응용서비스에 활용 가능한 데이터 자원과 학습데이터 구축에 필요한 툴을 사용자에게<br>
					제공하고, ETRI의 인공지능 기술을 소개하는 기능 등이 포함된 AI 공유 플랫폼 입니다.
				</div>
			</div>
		</div>
		
		
		<div class="w1200">
			<div class="contents">
				<div class="page_title">시각학습 데이터 가공</div>
				<div class="page_title_info">ETRI의 인공지는 SW를 사용해 최적의 데이터셋으로 가공하세요.</div>
				
				<div class="flex fs sb">
					<div class="wrap_title">파일 Upload</div>
					<div class="list_btn style_btn"><a href="<c:url value="/datatool/visualList" />" class="btn_link">시각 Data List</a></div>
				</div>
				
				<div class="upload_wrap">
					<div class="border_box">
						<form id="fileForm" enctype="multipart/form-data">
							<div class="input_wrap flex">
								<input class="" type="text" name="title" placeholder="Title">
							</div>
							
							<div class="input_wrap flex">
								<textarea class="" name="contents" placeholder="Description"></textarea>
							</div>
						
							<div class="upload_label">Mediaset file Ioc</div>
							<div class="input_wrap flex">
	<!-- 							<label class="input_label">FILES</label> -->
								<input class="file_text" type="text" name="file_text" placeholder="선택된 파일 없음" readonly="readonly">
								<input class="file_btn" type="button" value="파일선택">
							    <input type="file" id="files" name="files" class="file" multiple /><br/><br/>
							</div>
							
<!-- 							<div class="upload_label">Object Detection option</div> -->
<!-- 							<div class="input_wrap flex"> -->
<!-- 								<input class="" type="radio" name="detection" value="None" id="none" checked /><label for="none">None</label> -->
<!-- 								<input class="" type="radio" name="detection" value="YOLO" id="yolo" /><label for="yolo">YOLO</label> -->
<!-- 								<input class="" type="radio" name="detection" value="SSD" id="ssd" /><label for="ssd">SSD</label> -->
<!-- 								<input class="" type="radio" name="detection" value="TH_OD" id="th_od" /><label for="th_od">TH_OD</label> -->
<!-- 							</div> -->
					
							<div class="btn_wrap t_center">
							    <input class="submit_btn" type="button" value="저장하기" />
							</div>
					    </form>
						
					</div>
					
					
			
				</div>


				
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
			
			if(!loginCheck()){
				alert("로그인 후 이용 가능합니다.");
				location.href = baseUrl + "login";
			} 
			
			that.listener();
		},
		
		listener: function(){
			var that = this;
			that.pt.find(".submit_btn").off("click").on("click",function(){
				that.submit();
			});
			
			that.pt.find(".file_btn").off("click").on("click", function(){
				that.pt.find(".file").trigger("click");
			});
			
			that.pt.find(".file").off("change").on("change", function(){
				var file = that.pt.find(".file")[0].files[0];
				if( that.pt.find(".file").val() != "" ){
					var ext = that.pt.find(".file").val().split(".").pop().toLowerCase();
					if($.inArray(ext, ["gif","png","jpg","jpeg"]) == -1) {
						 alert("이미지(png, jpg, jpeg, gif) 파일만 업로드 할 수 있습니다.");
						 that.pt.find(".file").val("");
						 return;
					} else {
						that.pt.find(".file_text").val(file.name);			
					}

				}

					
			});
			
		},
		
		submit: function(){
			var that = this;
			var formData = new FormData();

			var fileCnt = $("input[name=files]")[0].files.length;
			for(var i = 0 ; i < fileCnt ; i++){
				formData.append("files",$("input[name=files]")[0].files[i]);	
			}
			formData.append("title",that.pt.find("input[name='title']").val());
			formData.append("contents",that.pt.find("textarea[name='contents']").val());
// 			formData.append("type","1");
			 

			
			$.ajax({
			   	url :  baseUrl + "data/insertDataset.json",
			   	data : formData,
			   	type : "POST",
			   	processData : false,
			   	contentType: false,
			   	success : function(res){
					console.log("=====upload=====", res);
					if(res.result.code == "200"){
						alert("등록이 완료되었습니다.");
						location.href = baseUrl + "datatool/visualList";
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