<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
	<style>
		#addImg { width: 100%; height: 100%; background-color: #f5f5f5; }
		#addImg .border_box { padding: 0px 30px }
		#addImg .title_wrap { padding: 23px 0 14px 0; color: #5b666e; }
		#addImg .title_wrap div { font-size: 13px; font-weight: 400; color: #343434; }
		#addImg .input_wrap { margin-bottom: 10px; }
		
		#addImg .fileTab_wrap .tab { width: 75px; border: 1px solid #dedcde; border-right: 0; background: #ffffff; line-height: 30px; text-align: center; font-size: 11px; font-weight: 400; color: #555555; cursor: pointer; }
		#addImg .fileTab_wrap .tab.active { border-bottom: 1px solid #f5f5f5; background: #f5f5f5; }
/* 		#addImg .fileTab_wrap .blank { width: calc(100% - 153px); height: 30px; border-bottom: 1px solid #dedcde; border-left: 1px solid #dedcde; } */
		#addImg .fileTab_wrap .blank { width: 100%; height: 30px; border-bottom: 1px solid #dedcde; border-left: 1px solid #dedcde; }
		
		#addImg .file_wrap { width: 100%;height: 381px; margin-bottom: 10px; border: 1px solid #dedcde; border-top: 0; position: relative; }
		#addImg .file_wrap .h_wrap { width: initial; padding: 0 12.2px; justify-content: space-between; }
		#addImg .file_wrap .h_wrap:after{ content: ''; width: 100%; border-bottom: 1px solid #dedcde; position: absolute; top:30px; left: 0; }
		#addImg .file_wrap .h_wrap div { display: flex; gap: 6px; width: fit-content; line-height: 30px; font-size: 11px; font-weight: 400; color: #555555; }
		/* 		#addImg .file_wrap .h_wrap div:nth-of-type(1) { display: inline-block; width: 50px; height: 30px; } */
		/* 		#addImg .file_wrap .h_wrap div:nth-of-type(2) { display: inline-block; width: 20px; } */
		#addImg .file_wrap .h_wrap div:nth-of-type(3) { display: inline-block; width: 90%; padding-left: 20px; }
		#addImg .file_wrap .h_wrap div:nth-of-type(4) { display: inline-block; width: 150px; text-align: center; }
		
		#addImg .file_wrap .c_wrap { height:320px; background-color: #ffffff; overflow-y: scroll;}
		#addImg .file_wrap .c_wrap .file_drop_info { height:100%; }
		#addImg .file_wrap .c_wrap .file_drop_info .info_wrap { margin: auto; font-weight: 200; color: #a0a5ae; }
		#addImg .file_wrap .c_wrap .file_drop_info .img{ width: 28px; height: 30px; margin: 0 auto; margin-bottom: 10px; background: url("images/icon_add_image.png") no-repeat center; }
		#addImg .file_wrap .c_wrap .file_list { border-bottom: 1px solid #dedcde; }
		#addImg .file_wrap .c_wrap .file_list div { line-height: 30px; font-size: 11px; font-weight: 300; color: #555555; }
		#addImg .file_wrap .c_wrap .file_list div:nth-of-type(1) { display: inline-block; width: 50px; height: 30px; }
		#addImg .file_wrap .c_wrap .file_list div:nth-of-type(2) { display: inline-block; width: 20px; height: 30px; background: url("images/icon_add_file.png") no-repeat center; }
		#addImg .file_wrap .c_wrap .file_list div:nth-of-type(3) { display: inline-block; width: 100%; padding-left: 15px; }
		#addImg .file_wrap .c_wrap .file_list div:nth-of-type(4) { display: inline-block; width: 150px; text-align: center; }

		#addImg .file_wrap .checkBox { background: url("images/btn_checkbox_normal.png") no-repeat center; }
		#addImg .file_wrap .checkBox:hover { background-image: url("images/btn_checkbox_hover.png"); }
		#addImg .file_wrap .checkBox.selected { background-image: url("images/btn_checkbox_selected.png"); }
		
		#addImg .input_wrap .btn_wrap { display: flex; display: -webkit-flex; }
		#addImg .input_wrap .btn_wrap div { cursor: pointer; width: 68px; line-height: 28px; text-align: center; background-color: #f8f8f8; font-size: 12px; font-weight: 300; color: #343434; border: 1px solid #dedcde; }
		#addImg .input_wrap .btn_wrap.fl div { margin-right: 10px; }
		#addImg .input_wrap .btn_wrap.fr div { background-color: #4c84ff; color: #ffffff; }
		#addImg .input_wrap .btn_wrap.fr div:hover { background-color: #3A71E9; } 
		
		#addImg .file_wrap .c_wrap .file_drop_info .info_wrap span { padding-top: 3px; font-size: 10px; text-align: center; display: block; }
		
		#addImg .fps_wrap { width: 160px; display: none; font-family: 'Open-Sans', sans-serif; font-size: 13px; font-weight: 600; color: #343434; position: absolute; left: 110px; }
		#addImg .fps_wrap .fps { width: 70px; height: 28px; padding: 0 5px; }
		
		#addImg input[type='number']::-webkit-outer-spin-button,
		#addImg input[type='number']::-webkit-inner-spin-button {
			-webkit-appearance: none;
			margin: 0;
		}		
	</style>
</head>
<body>

	<div class="container" id="addImg">
		<div class="border_box">
			<form id="fileForm" enctype="multipart/form-data">
				<div class="title_wrap flex">
					<div>Add File</div>
				</div>
				<div class="fileTab_wrap flex">
					<div class="img_file tab active">ImageFile</div>
					<div class="video_file tab">VideoFile</div>
					<div class="zip_file tab">ZIPFile</div>
					<div class="blank"></div>
				</div>
				<div class="file_wrap">
					<div class="h_wrap flex">
						<div>
							<div>Total file count:</div>
							<div class="total_file_count"></div>
						</div>
						<div>
							<div>Total file size: </div>
							<div class="total_file_size"></div>
						</div>
						<!-- <div class="checkBox all"></div> -->
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
					<input type="file" id="files" name="files" class="file" accept="image/jpg, image/jpeg, image/png" multiple />
					<input type="file" id="bigFiles" name="files" class="file" accept="application/zip" />
					<div class="btn_wrap fl">
						<div class="delete hide">Delete</div>
						<div class="append">Attach</div>
					</div>
					<div class="fps_wrap">
						<label for="fps">FPS : </label>
						<input id="fps" class="fps" type="number" onKeyPress="return checkNum2(event);"/>
					</div>					
					<div class="btn_wrap fr">
						<div class="save filter_color">Save</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
<script>
	var addImg = {
		pt : $("#addImg"),
		node : {},
		data : {
			media_type : null,	
		},
		init : function(node, datasetId) {
			var that = this;
			if(typeof(node) == "undefined"){
				that.node = wsObj["labeller"].dir.getSelectedNodes();
			} else {
				that.node = node;
			}
			that.reset();
			if(!datasetId || datasetId == undefined){
				that.getDatasetById(node.id);
				that.getDataList(node.id);				
			} else {
				that.datasetId = datasetId;
				that.getDatasetById(datasetId);
				that.getDataList(datasetId);				
			}
			

			that.listener();
		},
		reset : function() {
			var that = this;
			
			// 파일첨부 후 save 하지 않고 페이지를 떠났다가 동일 파일을 다시 add 하려하면 fileList에 뜨지 않던 문제 수정
			that.pt.find("#files").val("");			// jh.sa 추가
			that.pt.find("#bigFiles").val("");		// jh.sa 추가 
			
			that.pt.find(".c_wrap").empty();
			that.pt.find(".checkBox").removeClass("selected");
			that.pt.find(".fileTab_wrap .tab").removeClass("active")
				.first().addClass("active");
			
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

		listener : function() {
			var that = this;
			
			//저장하기
			that.pt.find(".save").off("click").on("click", function(){
				if(that.fileList.length <= 0) {
					alert("파일을 업로드해주세요");
					return false;
				}
				
				var formData = new FormData();

				for(var i = 0 ; i < that.fileList.length ; i++){
					formData.append("files",that.fileList[i]);	
				}
				if(that.node){
					if(typeof(that.node.id) == "undefined"){
						formData.append("dataset_id",that.node[0].id);
					} else {
						formData.append("dataset_id",that.node.id);										
					}					
				} else {
						formData.append("dataset_id",that.datasetId);					
				}


				alert("데이터의 크기에 따라 작업시간이 오래 소요될 수 있습니다.\n잠시만 기다려주시길 바랍니다.");
// 				$("#loader").show();
				$.ajax({
					url :  baseUrl + "data/insertData.json",
				   	data : formData,
				   	type : "POST",
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
// 					 complete:function(){
// 					         $("#progressBar").addClass("hide");
// 					 },					    
				   	success : function(res){
// 				   		$("#loader").hide();
				   		
				   		console.log("=====addImg=====", res);
						//트리초기화
// 						alert(res.result.data);
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
							} else if(res.result.code == "2001"){
								 $("#progressBar").addClass("hide");
								alert(res.result.data);
								location.href = baseUrl + 'login';
							} else if(res.result.code == "4051") {
								$("#progressBar").addClass("hide");
								alert(res.result.data);
								location.href = baseUrl + 'labeller';
							} else {
								$("#progressBar").addClass("hide");
								alert(res.result.data);
								return;								
							}							
						},1000);
				   	},
				   	error : function(err){
// 				   		$("#loader").hide();
 						$("#progressBar").addClass("hide");
				   		console.log("ERROR!!", err);
				   	}
				});
				
// 				Promise.resolve(deferred).then(function(res){
// 			   		console.log("=====addImg=====", res);
// 					//트리초기화
// //						alert(res.result.data);
// 					if(res.result.code == "200"){
// 						setTimeout(function(){
// 							alert(res.result.data);
// 							//트리초기화
// 							$(".ztree").empty();
// 							labeller.getDatasetList();
// 							that.reset();
							
// 							labeller.pt.find("div.section").removeClass("selected");
// 							var node = ".section.info";
// 							labeller.pt.find(node).addClass("selected");							
// 						},300)

						
// 					} else if(res.result.code == "2001"){
// 						alert(res.result.data);
// 						location.href = baseUrl + 'login';
// 					} 
// 				});			
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
					var seletedList = that.pt.find(".c_wrap .checkBox.selected").parent();
					var size = that.pt.find(".c_wrap .checkBox").length;
					var index = seletedList.index();
					
					if(seletedList.length <= 0){
						break;
					}
					that.pt.find(".file_list").eq(index).remove();
					that.deleteFileList( size-(index+1) );
					
				}
				
				if(that.pt.find(".file_list").length <= 0){
					that.pt.find(".file_drop_info").show();
				}
				
				that.pt.find(".checkBox.all").removeClass("selected");
			});
			
			//탭
			$("#addImg .fileTab_wrap .tab").off("click").on("click", function(){
				that.pt.find(".fileTab_wrap .tab").removeClass("active");
				$(this).addClass("active");
				
				// video file인 경우 fps 입력 영역 활성화
// 				if($(this).hasClass("video_file")){
// 					that.pt.find(".fps_wrap").show();
// 				} else if($(this).hasClass("img_file") || $(this).hasClass("zip_file")){
// 					that.pt.find(".fps_wrap").hide();
// 				}				
				
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
			$("#addImg #files").off("change").on("change", function(e){
				try{
					var files = this.files;
					var media_video = that.data.media_type;
					if(media_video == "VIDEO"){
						var type = files[0].type;
						if(type.split("/")[0] != "video"){
							alert("Video 형태의 파일만 업로드 가능합니다");
							that.pt.find(".total_file_count").html("");
							that.pt.find(".total_file_size").html("");	
							
							return false;
						} 
					}					
					
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
			$("#addImg .c_wrap").off("drop").on("drop", function(e){
				e.preventDefault();
				e.stopPropagation();
				if(e.originalEvent.dataTransfer && e.originalEvent.dataTransfer.files.length) {
					var files = e.originalEvent.dataTransfer.files;
					var media_video = that.data.media_type;
					if(media_video == "VIDEO"){
						var type = files[0].type;
						if(type.split("/")[0] != "video"){
							alert("Video 형태의 파일만 업로드 가능합니다");
							that.pt.find(".total_file_count").html("");
							that.pt.find(".total_file_size").html("");	
							
							return false;
						} 
					}						
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

		},
		
		getDatasetById : function(id){
			var that = this;
			
			$("#loader").show();
			$.ajax({
				url :  baseUrl + "data/getDatasetById.json",
			   	data : { dataset_id : id },
			   	type : "POST",
			   	success : function(res){
			   		$("#loader").hide();
			   		
			   		console.log("=====getDatasetById=====", res);
					if(res.result.code == "200"){
						that.data.media_type = res.result.data.media_type;
						// 해당 데이터셋의 media_type에 따라 업로드 탭 영역 구분
						if(that.data.media_type == "VIDEO"){
							$(".fileTab_wrap .img_file").hide();
							$(".fileTab_wrap .zip_file").hide();
							$(".fileTab_wrap .video_file").show();
							$(".fileTab_wrap .video_file.tab").trigger("click");				
						} else {
							$(".fileTab_wrap .img_file").show();
							$(".fileTab_wrap .zip_file").hide();
							$(".fileTab_wrap .video_file").hide();
							$(".fileTab_wrap .img_file.tab").trigger("click");								
						}						
					} else if(res.result.code == "2001"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}
			   	},
			   	error : function(err){
			   		$("#loader").hide();
			   		 console.log("ERROR!!", err);
			   	}
			});				
		},
		
		getDataList : function(id){
			var that = this;
			
			$("#loader").show();
			$.ajax({
				url :  baseUrl + "data/getDataList.json",
			   	data : { dataset_id : id },
			   	type : "POST",
			   	success : function(res){
			   		$("#loader").hide();
			   		
			   		console.log("=====getDataList=====", res);
					if(res.result.code == "200"){
						that.existNum = res.result.data.length;
						console.log("기존에 등록되어있는 데이터 개수: ", that.existNum);
					} else if(res.result.code == "2001"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}
			   	},
			   	error : function(err){
			   		$("#loader").hide();
			   		 console.log("ERROR!!", err);
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
// 					if(files.length>1){
// 						alert("단일 VideoFile 만 사용 가능합니다");
// 						return false;
// 					} else {
// 						return "video";
// 					}
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
			var existFile = that.existNum;
			
			if(chk == "image"){		//imageFile tab active
				if(!that.pt.find(".tab.active").hasClass("img_file")){
					fileList.length = 0;
					that.pt.find(".c_wrap li").remove();
				}
				that.pt.find(".tab").removeClass("active");
				that.pt.find(".img_file").addClass("active");
				
				
				// 기존 파일 개수 + 신규 업로드 파일 개수가 2000개 미만일 때 등록
// 				if (existFile > 0){
// 					// 2000개 제한 
// 		            if (files.length + existFile > 2000) {
// 		                alert("이미지 파일은 2000개 까지 등록 가능합니다\n선택한 파일 : " + len + "개" + "\n기존에 업로드된 파일 : " + existFile + "개" + "\n현재 " + (2000-existFile) + "개의 파일을 추가로 업로드 할 수 있습니다" ); // 100개는 테스트용, 실제 2000개 제한 
// 		                document.getElementById("files").value = "";
// 		                return false;
// 		            }						
// 				} else if (existFile == 0){
// 					// 2000개 제한 
// 		            if (files.length > 2000) {
// 		                alert("이미지 파일은 2000개 까지 등록 가능합니다\n선택한 파일 : " + len + "개"); // 100개는 테스트용, 실제 2000개 제한 
// 		                document.getElementById("files").value = "";
// 		                return false;
// 		            }	
// 				}

				
			} else if(chk == "video"){	//videoFile tab active
// 				if(existFile == 1){
// 					alert("기존에 등록되어있는 VidieoFile이 존재합니다.\nVideoFile은 한 개만 사용 가능합니다.");
// 					return false;					
// 				}
				if(fileList.length>0){
					fileList.length = 0;
					that.pt.find(".c_wrap li").remove();
				}
				that.pt.find(".tab").removeClass("active");
				that.pt.find(".video_file").addClass("active");
				
				// 200MB 제한
// 				if(files && files[0].size > (200 * 1024 * 1024)) {			// 50mb는 테스트용, 실제 200mb 제한 
// 					alert("비디오 파일은 200MB 이하 등록 가능합니다\n선택한 파일 : "+ size);
// 					document.getElementById("files"),value = "";
// 					return false;
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
// 				that.addFileList(files[i]);
			}
			
			//개수반영
			var file_total_size = 0;
			for(var i = 0 ; i < fileList.length;i++){
				file_total_size += fileList[i].size; 
			}
			$("#addImg .total_file_count").html(fileList.length);
			$("#addImg .total_file_size").html(file_total_size);			
		},
		
		addFileList : function(files){
			var that = this;
			
			if(that.pt.find(".file_drop_info")){
				that.pt.find(".file_drop_info").hide();
			}
			
			var size= that.formatBytes(files.size);
			
			
			var html = "<li class='file_list flex'><div class='checkBox'></div><div></div><div>"+files.name+"</div><div>"+size+"</div></li>";
			
			that.pt.find(".file_wrap .c_wrap").prepend(html);
			
			//체크박스
			that.pt.find(".c_wrap .checkBox").off("click").on("click", function(){
				if($(this).hasClass("selected")){
					$(this).removeClass("selected");
				} else {
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
// 			delete that.fileList[index];
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