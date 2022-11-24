<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
	<style>
		#upload { width: 100%; height: 100%; background-color: #f5f5f5; }
		#upload .border_box { padding: 0px 30px }
		#upload .title_wrap { padding: 23px 0 14px 0; color: #5b666e; }
		#upload .title_wrap div { font-size: 13px; font-weight: 400; color: #343434; }
		#upload .title_wrap label { font-size: 12px; font-weight: bold; margin-left: 10px; color: #777; }
		#upload .title_wrap label span{ color: red; }
		
		#upload .input_wrap { margin-bottom: 10px; }
		#upload input[type='text'] { width: 100%; font-family: Open_Sans; font-size: 13px; font-weight: 300; color: #555555; border: 1px solid #dedcde; }
		#upload input[type='text']:focus {border: 1px solid #4c84ff;}
		#upload textarea { width: 100%; font-family: Open_Sans; font-size: 13px; font-weight: 300; color: #555555; border: 1px solid #dedcde; }
		#upload textarea:focus {border: 1px solid #4c84ff;}	
		
		#upload .fileTab_wrap .tab { width: 75px; border: 1px solid #dedcde; border-right: 0; background: #ffffff; line-height: 30px; text-align: center; font-size: 11px; font-weight: 400; color: #555555; cursor: pointer; }
		#upload .fileTab_wrap .tab.active { border-bottom: 1px solid #f5f5f5; background: #f5f5f5; }
/* 		#upload .fileTab_wrap .blank { width: calc(100% - 153px); height: 30px; border-bottom: 1px solid #dedcde; border-left: 1px solid #dedcde; } */
		#upload .fileTab_wrap .blank { width: 100%; height: 30px; border-bottom: 1px solid #dedcde; border-left: 1px solid #dedcde; }
		
		#upload .file_wrap { width: 100%; height: 260px; display: flex; flex-direction: column; margin-bottom: 10px; border: 1px solid #dedcde; border-top: 0; position: relative; }
		#upload .file_wrap .h_wrap { justify-content: space-between; }
		#upload .file_wrap .h_wrap:after{ content: ''; width: 100%; border-bottom: 1px solid #dedcde; position: absolute; top:30px; left: 0; }
		#upload .file_wrap .h_wrap div { width: fit-content; margin: 0 2px; line-height: 30px; font-size: 11px; font-weight: 400; color: #555555; }
/* 		#upload .file_wrap .h_wrap div:nth-of-type(1) { display: inline-block; width: 50px; height: 30px; } */
/* 		#upload .file_wrap .h_wrap div:nth-of-type(2) { display: inline-block; width: 20px; } */
		#upload .file_wrap .h_wrap div:nth-of-type(3) { display: inline-block; width: 90%; padding-left: 20px; }
		#upload .file_wrap .h_wrap div:nth-of-type(4) { display: inline-block; width: 150px; text-align: center; }
		
		#upload .file_wrap .c_wrap { height: inherit; background-color: #ffffff; overflow-y: scroll;}
		#upload .file_wrap .c_wrap .file_drop_info { height:100%; }
		#upload .file_wrap .c_wrap .file_drop_info .info_wrap { margin: auto; font-weight: 200; color: #a0a5ae; }
		#upload .file_wrap .c_wrap .file_drop_info .img{ width: 28px; height: 30px; margin: 0 auto; margin-bottom: 10px; background: url("images/icon_add_image.png") no-repeat center; }
		#upload .file_wrap .c_wrap .file_list { border-bottom: 1px solid #dedcde; }
		#upload .file_wrap .c_wrap .file_list div { line-height: 30px; font-size: 11px; font-weight: 300; color: #555555; }
		#upload .file_wrap .c_wrap .file_list div:nth-of-type(1) { display: inline-block; width: 50px; height: 30px; }
		#upload .file_wrap .c_wrap .file_list div:nth-of-type(2) { display: inline-block; width: 20px; height: 30px; background: url("images/icon_add_file.png") no-repeat center; }
		#upload .file_wrap .c_wrap .file_list div:nth-of-type(3) { display: inline-block; width: 100%; padding-left: 15px; }
		#upload .file_wrap .c_wrap .file_list div:nth-of-type(4) { display: inline-block; width: 150px; text-align: center; }

		#upload .file_wrap .checkBox { background: url("images/btn_checkbox_normal.png") no-repeat center; }
		#upload .file_wrap .checkBox:hover { background-image: url("images/btn_checkbox_hover.png"); }
		#upload .file_wrap .checkBox.selected { background-image: url("images/btn_checkbox_selected.png"); }
		
		#upload .input_wrap .btn_wrap { display: flex; display: -webkit-flex; }
		#upload .input_wrap .btn_wrap div { cursor: pointer; width: 68px; line-height: 28px; text-align: center; background-color: #f8f8f8; font-size: 12px; font-weight: 300; color: #343434; border: 1px solid #dedcde; }
		#upload .input_wrap .btn_wrap.fl div { margin-right: 10px; }
		#upload .input_wrap .btn_wrap.fr div { background-color: #4c84ff; color: #ffffff; }
		#upload .input_wrap .btn_wrap.fr div:hover { background-color: #3A71E9; } 
		
		#upload .label_type_wrap, .media_type_wrap { margin-left: 15px; font-weight: 300 !important; }
		#upload .label_type_wrap .radioBtn, .media_type_wrap .radioBtn { position: relative; top: 2px; }
		#upload .label_type_wrap .radio_label, .media_type_wrap .radio_label { margin-right: 10px; }
		
		#upload .file_wrap .c_wrap .file_drop_info .info_wrap span { padding-top: 3px; font-size: 10px; text-align: center; display: block; }
		
		#upload .fps_wrap { width: 160px; display: none; font-family: 'Open-Sans', sans-serif; font-size: 13px; font-weight: 600; color: #343434; position: absolute; left: 110px; }
		#upload .fps_wrap .fps { width: 70px; height: 28px; padding: 0 5px; }
		
		#upload input[type='number']::-webkit-outer-spin-button,
		#upload input[type='number']::-webkit-inner-spin-button {
			-webkit-appearance: none;
			margin: 0;
		}
	</style>
</head>
<body>

	<div class="container" id="upload">
		<div class="border_box">
			<form id="fileForm" enctype="multipart/form-data">
				<div class="title_wrap flex">
					<div>New</div>
				</div>
				<div class="input_wrap flex">
					<input class="" type="text" name="title" data-length="100" placeholder="Please enter the title" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
				</div>
							
				<div class="input_wrap flex">
					<textarea class="" name="contents" data-length="200" placeholder="Please enter the description"></textarea>
				</div>
				<div class="title_wrap flex">
					<div>Media Type :</div>
					<div class="media_type_wrap filter_color">
						<span class="radioBtn selected" data-value="image"></span>
						<span class="radio_label">Image</span>
 						<span class="radioBtn" data-value="video"></span>
						<span class="radio_label">Video</span>
					</div>
				</div>				
				<div class="title_wrap flex">
					<div>Label Type :</div>
					<div class="label_type_wrap filter_color">
						<span class="radioBtn selected" data-value="box"></span>
						<span class="radio_label">Bounding Box</span>
						
						<!-- <span class="radioBtn" data-value="polygon"></span>
						<span class="radio_label">Segmentation</span>
						
						<span class="radioBtn" data-value="polyLine"></span>
						<span class="radio_label">Poly Line</span> -->
					</div>
				</div>					
				<div class="title_wrap flex">
					<div>Add File</div>
					<label class="comment">
						 <span>JPG JPEG PNG</span> 형식의 이미지 파일만 업로드 가능합니다.
					</label>
				</div>
				<div class="fileTab_wrap flex">
					<div class="img_file tab active">ImageFile</div>
 					<div class="video_file tab">VideoFile</div> 
					<!-- <div class="zip_file tab">ZIPFile</div> -->
					<div class="blank"></div>
				</div>
				<div class="file_wrap">
					<div class="h_wrap flex">
						<div class="flex">
							<div>Total file count: </div>
							<div class="total_file_count"></div>
						</div>
						<div class="flex">
							<div>Total file size: </div>
							<div class="total_file_size"></div>
						</div>
					</div>
					
					<ul class="c_wrap">
						<li class="file_drop_info flex">
							<div class="info_wrap">
								<div class="img"></div><div>Please drag&drop the file.</div>
							</div>
						</li>
					</ul>
				
				</div>
				<div class="input_wrap">
					<input type="file" id="files" name="files" class="file" accept="image/jpg, image/jpeg, image/png"  multiple />
					<input type="file" id="bigFiles" name="files" class="file" accept="application/zip" />
					<div class="btn_wrap fl">
						<div class="delete">Delete</div>
						<div class="append">Attach</div>
					</div>
<!-- 					<div class="fps_wrap"> -->
<!-- 						<label for="fps">FPS : </label> -->
<!-- 						<input id="fps" class="fps" type="number" onKeyPress="return checkNum2(event);"/> -->
<!-- 					</div> -->
					<div class="btn_wrap fr">
						<div class="save filter_color">Save</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
<script>
	var upload = {
		pt : $("#upload"),
		init : function() {
			var that = this;
			that.reset();
			that.listener();
		},
		reset : function() {
			var that = this;
			var type_box = that.pt.find(".radioBtn[data-value='box']");
			var type_poly = that.pt.find(".radioBtn[data-value='polygon']");
			var type_image = that.pt.find(".radioBtn[data-value='image']");
			var type_video = that.pt.find(".radioBtn[data-value='video']");
			
			that.pt.find("input[name='title']").val("");
			that.pt.find("textarea[name='contents']").val("");
			that.pt.find(".c_wrap").empty();
			that.pt.find(".checkBox").removeClass("selected");
			that.pt.find(".fileTab_wrap .tab").removeClass("active").first().addClass("active");
			
			// media_type, label_type reset
			if(type_image.hasClass("selected")) {
				$(".fileTab_wrap .video_file").hide();
			}
			if(type_poly.hasClass("selected")){
				type_poly.removeClass("selected");		
				type_box.addClass("selected");
			};
			if(type_video.hasClass("selected")){
				type_video.removeClass("selected");
				type_image.addClass("selected");
				type_poly.show();
				type_poly.next().show();
			}

			var html = "<li class='file_drop_info flex'>"
				+ "<div class='info_wrap'>"
// 				+ "<div class='img'></div><div>Please drag&drop the file.</div><span>Maximum Number of files : 2000</span>"
				+ "<div class='img'></div><div>Please drag&drop the file.</div>"
				+ "</div>"
				+ "</li>";
			
			that.pt.find(".c_wrap").append(html);
			that.fileList.length = 0;
			that.pt.find(".total_file_count").html("");
			that.pt.find(".total_file_size").html("");
		},
		//
		listener : function() {
			var that = this;

			that.pt.find("input[name='title'], textarea[name='contents']").off("input").on("input", function(e){
				var str = $(this).val();	
				$(this).val(str);
				
				if($(this).data("length") == 100 && $(this).val().length > 100){
					var string = $(this).val();
					alert("입력 가능한 텍스트 개수를 초과하였습니다\n중간에 입력하신 경우 기존 텍스트의 마지막 글자를 삭제합니다");
					$(this).val(string.slice(0,100));
					return false;
				} else if ($(this).data("length") == 200 && $(this).val().length > 200){
					var string = $(this).val();
					alert("입력 가능한 텍스트 개수를 초과하였습니다\n중간에 입력하신 경우 기존 텍스트의 마지막 글자를 삭제합니다");
					$(this).val(string.slice(0,200));
					return false;	
				}				
			});
		

			that.pt.find("input[name='title']").off("keydown").on("keydown", function(e){
				if(e.keyCode == 13){
					e.preventDefault();
					that.pt.find("textarea[name='contents']").focus();
				}
			}); 
			
			//저장하기
			that.pt.find(".save").off("click").on("click", function(){
				
				// jh.sa : media type 선택(IMAGE of VIDEO)
				let media_type;
				let selected_media_type = that.pt.find(".media_type_wrap .radioBtn.selected");
				if(selected_media_type.data("value") == "image"){
					media_type = "IMAGE";
				} else if(selected_media_type.data("value") == "video"){
					media_type = "VIDEO";
// 					media_type = "IMAGE";
				}
				
				// jh.sa : label type 선택 (IMAGE_BBOX, IMAGE_SEGMENTATION, VIDEO_BBOX)
				let label_type;
				let selected_type = that.pt.find(".label_type_wrap .radioBtn.selected");
				if(selected_media_type.data("value") == "image" && selected_type.data("value") == "box"){
					label_type = "IMAGE_BBOX";
				} else if (selected_media_type.data("value") == "image" && selected_type.data("value") == "polygon"){
					label_type = "IMAGE_SEGMENTATION";
				} else if (selected_media_type.data("value") == "image" && selected_type.data("value") == "polyLine"){
					label_type = "IMAGE_LINE";
				} else if (selected_media_type.data("value") == "video" && selected_type.data("value") == "box"){
					label_type = "VIDEO_BBOX";
// 					label_type = "IMAGE_BBOX";
				}
				
				if(that.pt.find("input[name='title']").val()==""){
					alert("제목을 입력해주세요");
					that.pt.find("input[name='title']").focus();
					return false;
				}
				if(that.pt.find("textarea[name='contents']").val()==""){
					alert("설명을 입력해주세요");
					that.pt.find("textarea[name='contents']").focus();
					return false;
				}
				
				// jh.sa 추가
				if(that.fileList.length == 0){
					alert("파일을 업로드해주세요");
					return false;
				}
				var formData = new FormData();

				for(var i = 0 ; i < that.fileList.length ; i++){
					formData.append("files",that.fileList[i]);	
				}
				formData.append("title",that.pt.find("input[name='title']").val());
				formData.append("contents",that.pt.find("textarea[name='contents']").val());
				formData.append("media_type",media_type);
				formData.append("label_type",label_type);
// 				formData.append("label_type", label_type);										// jh.sa : box, polygon 선택
// 				$("#loader").show();
				alert("데이터의 크기에 따라 작업시간이 오래 소요될 수 있습니다.\n잠시만 기다려주시길 바랍니다.");
				$.ajax({
				   	url :  baseUrl + "data/insertDataset.json",
				   	data : formData,
// 				   	type : "POST",
				   	processData : false,
				   	contentType: false,
				   	cache: false,
				   	enctype: "multipart/form-data",
			        xhr: function(){
			            
			                 xhr = $.ajaxSettings.xhr() ;
			             xhr.upload.onprogress = function(event){
			                     
			                  var perc = Math.round((event.loaded / event.total) * 100);
			                  $("#progressBar .progress_value").text(perc + "%");
			                  $("#progressBar .progress_value").css("width",perc + "%");
			                  if(perc == 100) $("#progressBar .progress_value").text("업로드 진행중입니다. 잠시만 기다려주세요.");
			             };
			             return xhr ;
			        },
			        beforeSend: function( xhr ) {
			                var top = $("body").scrollTop();
			                $("#progressBar").css("top",top + "px");
			                $("#progressBar").removeClass("hide");
			                $("#progressBar .progress_value").text("");
			                $("#progressBar .progress_value").css("width","0%");
			        },
// 			        complete:function(){
// 			                $("#progressBar").addClass("hide");
// 			        },				   	
				   	success : function(res){
// 				   		$("#loader").hide();
				   		
						console.log("=====upload=====", res);
// 						$("#progressBar").addClass("hide");
						setTimeout(function(){
							if(res.result.code == "200"){
								alert(res.result.data);
								 $("#progressBar").addClass("hide");
								//트리초기화
								$(".ztree").empty();
								labeller.getDatasetList();
								
								that.reset();
								
								labeller.pt.find("div.section").removeClass("selected");
								var node = ".section.info";
								labeller.pt.find(node).addClass("selected");							
							} else if (res.result.code == "2001") {
								 $("#progressBar").addClass("hide");
								alert(res.result.data);
								location.href = baseUrl + 'login';
							} else {
								 $("#progressBar").addClass("hide");
								alert(res.result.data);
							}							
						},1000);
							
				   	},
				   	error : function(err){
				   		$("#loader").hide();
				   		 console.log("ERROR!!", err);
				   	}
				});
			});
			
			//체크박스 전부선택
			that.pt.find(".checkBox.all").off("click").on("click", function(){
				if($(this).hasClass("selected")){
					that.pt.find(".checkBox").removeClass("selected");
				} else {
					that.pt.find(".checkBox").addClass("selected");
				}
			});
			
			//선택삭제
			that.pt.find(".delete").off("click").on("click", function(e){	
				while(true){
					var selectedList = that.pt.find(".c_wrap .checkBox.selected").parent();
					var size = that.pt.find(".c_wrap .checkBox").length;
					var index = selectedList.index();
					
					if(selectedList.length <= 0){
						break;
					}
					that.pt.find(".file_list").eq(index).remove();
					that.deleteFileList( size-(index+1) );	
				}

				if(that.pt.find(".file_list").length <= 0){
					that.pt.find(".file_drop_info").show();
				}

				// 삭재 후 개수, 사이즈 반영
				var file_total_size = that.fileList.reduce((acc, file) => acc + file.size, 0);
				$("#upload .total_file_count").html(that.fileList.length);
				$("#upload .total_file_size").html(that.formatBytes(file_total_size));	

				that.pt.find(".checkBox.all").removeClass("selected");
			});
			
			//탭
			that.pt.find(".fileTab_wrap .tab").off("click").on("click", function(){
				that.pt.find(".fileTab_wrap .tab").removeClass("active");
				$(this).addClass("active");
				
				// video file인 경우 fps 입력 영역 활성화
// 				if($(this).hasClass("video_file")){
// 					that.pt.find(".fps_wrap").show();
// 				} 
// 				else if($(this).hasClass("img_file") || $(this).hasClass("zip_file")){
// 					that.pt.find(".fps_wrap").hide();
// 				}
				
				//리스트 비우기
				that.fileList.length = 0;
				that.pt.find(".c_wrap").empty();
				var html = ""; 
					html += "<li class='file_drop_info flex'>"
					html += "<div class='info_wrap'>"
					html += "<div class='img'></div><div>Please drag&drop the file.</div>"
// 					if($(this).hasClass("img_file")){
// 						html += "<span>Maximum Number of files : 2000</span>"
// 					} else if($(this).hasClass("video_file")){
// 						html += "<span>Maximum Size : 200MB</span>"
// 					}
					html += "</div>"
					html += "</li>";
				
				that.pt.find(".c_wrap").append(html);
				// jh.sa 추가 201029
				that.pt.find(".total_file_count").html("");
				that.pt.find(".total_file_size").html("");	
				
				
				that.pt.find(".checkBox.all").removeClass("selected");
			});
			
			//파일첨부
			that.pt.find(".append").off("click").on("click", function(){
				if(that.pt.find(".fileTab_wrap .tab.active").hasClass("img_file")){
					that.pt.find("#files").trigger("click");
				} else if(that.pt.find(".fileTab_wrap .tab.active").hasClass("video_file")){
					that.pt.find("#files").trigger("click");
				} else if(that.pt.find(".fileTab_wrap .tab.active").hasClass("zip_file")){
					that.pt.find("#bigFiles").trigger("click");
				}
			});
			
// 			// 파일명에 한글 사용 불가 및 한글 사용 시 파일 데이터 받지 않음
// 			var upload_file = that.pt.find("input[type='file']");
// 			upload_file.off("input").on("input", function(e){
// 				var file = e.target.files[0];
// 				console.log("e.target : ", e.target);
// 				// 파일 표시 XX 
				
// 				var upload_file_name = file.name;
// 				if(upload_file_name.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
// 					alert("영문과 특수문자 및 숫자만 입력 가능합니다");
// 					console.log("fileList 삭제 전 : ", that.fileList);
// 					e.target.value = "";
// 					that.fileList.length = 0;
// 					console.log("fileList: ", that.fileList);
// 					console.log("e.target.value : ", e.target.value);
// 					console.log("file?: ", file);
// 				} else {
// 					try{
// 						var files = this.files;
// 						that.selectFile(files);
						
// 						console.log("fileList : ", that.fileList);
						
// 						that.pt.find(".checkBox.all").removeClass("selected");
// 					}catch(exception){
// 						console.log(exception);
// 					}
// 				}					
// 			})
			
			$("#upload #files").off("change").on("change", function(e){
				try{
					var files = this.files;
					var media_type = $("#upload .media_type_wrap .radioBtn.selected").data("value");
					media_type = (
						$(".fileTab_wrap .tab.active").hasClass('zip_file') ? 
							'zip' :
							media_type === 'video' ? 
							'video/mp4' : 
							media_type // image
					);

					if([...files].filter( o => !o.type.includes(media_type)).length > 0) {
						alert('유효하지 않은 타입의 파일이 포함되어 있습니다. 유효하지 않은 파일은 무시됩니다.');
					}
					files = [...files].filter( o => o.type.includes(media_type));
					that.selectFile(files);	
					that.pt.find(".checkBox.all").removeClass("selected");
				}catch(exception){
					console.log(exception);
				}
			});
			
			that.pt.find("#bigFiles").off("change").on("change", function(e){
				try{
					var files = this.files;
					that.selectFile(files);
					
					that.pt.find(".checkBox.all").removeClass("selected");
				}catch(exception){
					console.log(exception);
				}
			});
			$(document).on("dragover", function(e){
				e.preventDefault();
				e.stopPropagation();
			});
			$("#upload .c_wrap").off("drop").on("drop", function(e){
				e.preventDefault();
				e.stopPropagation();
				if(e.originalEvent.dataTransfer && e.originalEvent.dataTransfer.files.length) {
					var files = e.originalEvent.dataTransfer.files;
					var media_type = $("#upload .media_type_wrap .radioBtn.selected").data("value");
					media_type = (
						$(".fileTab_wrap .tab.active").hasClass('zip_file') ? 
							'zip' :
							media_type === 'video' ? 
							'video/mp4' : 
							media_type // image
					);
					console.log('media_type', media_type)
					if([...files].filter( o => !o.type.includes(media_type)).length > 0) {
						alert('유효하지 않은 타입의 파일이 포함되어 있습니다. 유효하지 않은 파일은 무시됩니다.');
					}
					files = [...files].filter( o => o.type.includes(media_type));			
					that.selectFile(files);
		        }
				
				that.pt.find(".checkBox.all").removeClass("selected");
			});
			
			that.pt.find(".c_wrap").off("mousemove").on("mousemove", function(e){
				e.preventDefault();
				e.stopPropagation();
			});
			$("body").not(".file_area").off("drop").on("drop", function(e){
				e.preventDefault();
				e.stopPropagation();
				that.pt.find(".file_area").text("add Image");
			});
			
			// media type 선택 
			let media_radio_btn = that.pt.find(".media_type_wrap .radioBtn")
			media_radio_btn.off("click").on("click",function() {
				let btn = $(this)
				const files = document.getElementById('files');
				
				btn.addClass("selected");
				if(btn.hasClass("selected")){
					that.pt.find(".media_type_wrap .radioBtn").removeClass("selected");
					btn.addClass("selected");
				}
				
				if(btn.data("value") == "video"){
					$(".fileTab_wrap .video_file.tab").trigger("click");
					$(".fileTab_wrap .video_file").show();
					$(".fileTab_wrap .img_file").hide();
					$(".fileTab_wrap .zip_file").hide();
					$('.fileTab_wrap .video_file .tab').addClass('active');
					$('.fileTab_wrap .img_file .tab').removeClass('active');
					$('.fileTab_wrap .zip_file .tab').removeClass('active');
					files.setAttribute('accept','video/mp4');

					$(".label_type_wrap .radioBtn[data-value='polygon']").hide();
					$(".label_type_wrap .radioBtn[data-value='polygon']").next().hide();
					$(".label_type_wrap .radioBtn[data-value='polyLine']").hide();
					$(".label_type_wrap .radioBtn[data-value='polyLine']").next().hide();
				} else {
					$(".fileTab_wrap .img_file.tab").show().trigger("click");
					$(".fileTab_wrap .img_file").show();
					$(".fileTab_wrap .zip_file").show();
					$(".fileTab_wrap .video_file").hide();
					$('.fileTab_wrap .img_file .tab').addClass('active');
					$('.fileTab_wrap .zip_file .tab').removeClass('active');
					$('.fileTab_wrap .video_file .tab').removeClass('active');
					files.setAttribute('accept','image/jpg, image/jpeg, image/png');
					
					$(".label_type_wrap .radioBtn[data-value='polygon']").show();
					$(".label_type_wrap .radioBtn[data-value='polygon']").next().show();
					$(".label_type_wrap .radioBtn[data-value='polyLine']").show();
					$(".label_type_wrap .radioBtn[data-value='polyLine']").next().show();
				}
			});
			
			// label type 선택 
			let radio_btn = that.pt.find(".label_type_wrap .radioBtn")
			radio_btn.off("click").on("click",function() {
				let radio_obj = {};
				let btn = $(this)
				
				btn.addClass("selected");
				if(btn.hasClass("selected")){
					that.pt.find(".label_type_wrap .radioBtn").removeClass("selected");
					btn.addClass("selected");
				}
			});
			
			
		},
		
		//파일 형태 체크
		checkFiles : function(files){
			for(var i=0; i<files.length; i++){
				if(files[i].type.match("zip")){
					if(files.length>1){
						alert("단일 ZIPFile 만 사용 가능합니다");
						return false;
					} else {
						return "zip";
					}
				} else if(files[i].type.match("video")){
					return "video";
				} else if(files[i].type.match("image")){
					if(files[i].type.match("jpg") || files[i].type.match("jpeg") || files[i].type.match("png")){
						continue;						
					} else {
						alert("ImageFile은 JPG, JPEG, PNG 형식의 파일만 사용 가능합니다.");
						return false;
					}

				} else {
					alert("ImageFile 또는 VideoFile 또는 ZIPFile 만 사용 가능합니다\n다시 시도해주세요");
					return false;
				}
			}
			
			return "image";
		},
		
		fileList : new Array(),
		selectFile : function(files){
			var that = this;
			var fileList = that.fileList;
			var chk = that.checkFiles(files);
			var len = String(files.length);
			var size = String(bytesToSize(files[0].size));			
			if(chk == "image"){		//imageFile tab active
				if(!that.pt.find(".tab.active").hasClass("img_file")){
					fileList.length = 0;
					that.pt.find(".c_wrap li").remove();
				}
				that.pt.find(".tab").removeClass("active");
				that.pt.find(".img_file").addClass("active");
				// 2000개 제한 
// 	            if (files.length > 2000) {
// 	                alert("이미지 파일은 2000개 까지 등록 가능합니다\n선택한 파일 : " + len + "개"); // 100개는 테스트용, 실제 2000개 제한 
// 	                document.getElementById("files").value = "";
// 	                return;
// 	            }					
				
				
			} else if(chk == "video"){	//videoFile tab active
				that.pt.find(".tab").removeClass("active");
				that.pt.find(".video_file").addClass("active");
						
				// 200MB 제한
// 				if(files && files[0].size > (200 * 1024 * 1024)) {			// 50mb는 테스트용, 실제 200mb 제한 
// 					alert("비디오 파일은 200MB 이하 등록 가능합니다\n선택한 파일 : "+ size);
// 					document.getElementById("files"),value = "";
// 					return;
// 				}				
				
			} else if(chk == "zip"){	//zipFile tab active
				that.pt.find(".tab").removeClass("active");
				that.pt.find(".zip_file").addClass("active");
				
				if(fileList.length>0){
					fileList.length = 0;
					that.pt.find(".c_wrap li").remove();
				}
				
			} else if(!chk){
				return false;
			}
			
			for(var i = 0; i < files.length; i++){
				// 파일 배열에 넣기
				fileList.push(files[i]);
				
				// 업로드 파일 목록 생성
				that.addFileList(files[i], i);
				
			}
			
			//개수반영
			var file_total_size = 0;
			for(var i = 0 ; i < fileList.length;i++){
				file_total_size += fileList[i].size; 
			}
			$("#upload .total_file_count").html(fileList.length);
			$("#upload .total_file_size").html(that.formatBytes(file_total_size));
			
			
			
		},

		
		addFileList : function(file, index){
			var that = this;
			
			if(that.pt.find(".file_drop_info")){
				that.pt.find(".file_drop_info").hide();
			}
			
			var size= that.formatBytes(file.size);
			
			
			var html = "<li class='file_list flex'><div class='checkBox' checkbox-index='"+index+"'></div><div></div><div>"+file.name+"</div><div>"+size+"</div></li>";
			
			that.pt.find(".file_wrap .c_wrap").prepend(html);
			
			//체크박스
			that.pt.find(".c_wrap .checkBox").off("click").on("click", function(){
				let index = $(".c_wrap .checkBox").index(this);
				
				if($(this).hasClass("selected")){ // 선택 해제
					$(this).removeClass("selected");
				} else { // 선택
					$(this).addClass("selected");
				}

				//모두선택
				if(that.pt.find(".c_wrap .checkBox").length == that.pt.find(".c_wrap .checkBox.selected").length){
					that.pt.find(".checkBox.all").addClass("selected")
				} else {
					that.pt.find(".checkBox.all").removeClass("selected")
				}
			});
		},
		deleteFileList : function(index){
			var that = this;
			that.fileList.splice(index,1);
		},

		formatBytes : function(bytes) {
		    if(bytes < 1024) return bytes + " Bytes";
		    else if(bytes < 1048576) return(bytes / 1024).toFixed(3) + " KB";
		    else if(bytes < 1073741824) return(bytes / 1048576).toFixed(3) + " MB";
		    else return(bytes / 1073741824).toFixed(3) + " GB";
		},
		
	};
</script>