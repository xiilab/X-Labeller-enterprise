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
		#addImg .fileTab_wrap .blank { width: calc(100% - 153px); height: 30px; border-bottom: 1px solid #dedcde; border-left: 1px solid #dedcde; }
		
		#addImg .file_wrap { width: 100%;height: 381px; margin-bottom: 10px; border: 1px solid #dedcde; border-top: 0; position: relative; }
		#addImg .file_wrap .h_wrap:after{ content: ''; width: 100%; border-bottom: 1px solid #dedcde; position: absolute; top:30px; left: 0; }
		#addImg .file_wrap .h_wrap div { line-height: 30px; font-size: 11px; font-weight: 400; color: #555555; }
		#addImg .file_wrap .h_wrap div:nth-of-type(1) { display: inline-block; width: 50px; height: 30px; }
		#addImg .file_wrap .h_wrap div:nth-of-type(2) { display: inline-block; width: 20px; }
		#addImg .file_wrap .h_wrap div:nth-of-type(3) { display: inline-block; width: 100%; padding-left: 50px; }
		#addImg .file_wrap .h_wrap div:nth-of-type(4) { display: inline-block; width: 150px; text-align: center; }
		
		#addImg .file_wrap .c_wrap { height:350px; background-color: #ffffff; overflow-y: scroll;}
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
		
	</style>
</head>
<body>

	<div class="container" id="inference">
		<div class="border_box">
			<form id="fileForm" enctype="multipart/form-data">
				<div class="title_wrap flex">
					<div>데이터 추가</div>
				</div>
				<div class="fileTab_wrap flex">
					<div class="img_file tab active">이미지</div>
					<div class="video_file tab">VideoFile</div>
					<div class="zip_file tab">ZIPFile</div>
					<div class="blank"></div>
				</div>
				<div class="file_wrap">
					<div class="h_wrap flex">
						<div class="checkBox all"></div>
						<div></div>
						<div>파일</div>
						<div>크기</div>
					</div>
					<ul class="c_wrap">
						<li class="file_drop_info flex">
							<div class="info_wrap">
								<div class="img"></div><div>등록할 파일을 이 영역으로 옮겨주세요.</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="input_wrap">
					<input type="file" id="files" name="files" class="file" accept="image/*, video/*" multiple />
					<input type="file" id="bigFiles" name="files" class="file" accept="application/zip" />
					<div class="btn_wrap fl">
						<div class="delete">삭제</div>
						<div class="append">Attatch</div>
					</div>
					<div class="btn_wrap fr">
						<div class="save">저장하기</div>
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
		init : function(node) {
			var that = this;
			
			that.node = node;
			
			that.reset();
			
			that.listener();
		},
		reset : function() {
			var that = this;
			
			that.pt.find(".c_wrap").empty();
			that.pt.find(".checkBox").removeClass("selected");
			that.pt.find(".fileTab_wrap .tab").removeClass("active")
				.first().addClass("active");
			
			var html = "<li class='file_drop_info flex'>"
				+ "<div class='info_wrap'>"
				+ "<div class='img'></div><div>파일을 이 영역으로 옮겨주세요.</div>"
				+ "</div>"
				+ "</li>";
			
			that.pt.find(".c_wrap").append(html);
			that.fileList.length = 0;
		},

		listener : function() {
			var that = this;
			
			//저장하기
			that.pt.find(".save").off("click").on("click", function(){
				if(that.fileList.length <= 0) {
					alert("추가 할 파일이 없습니다 \n 다시 확인해주세요");
				}
				
				var formData = new FormData();

				for(var i = 0 ; i < that.fileList.length ; i++){
					formData.append("files",that.fileList[i]);	
				}
				formData.append("id",that.node.id);
				
				$("#loader").show();
				$.ajax({
					url :  baseUrl + "data/insertData.json",
				   	data : formData,
				   	type : "POST",
				   	processData : false,
				   	contentType: false,
				   	success : function(res){
				   		$("#loader").hide();
				   		
				   		console.log("=====addImg=====", res);
						//트리초기화
						alert(res.result.data);
						if(res.result.code == "200"){
							//트리초기화
							$(".ztree").empty();
							labeller.getDatasetList();
							
							that.reset();
							
							labeller.pt.find("div.section").removeClass("selected");
							var node = ".section.info";
							labeller.pt.find(node).addClass("selected");
						} 
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
			that.pt.find(".fileTab_wrap .tab").off("click").on("click", function(){
				that.pt.find(".fileTab_wrap .tab").removeClass("active");
				$(this).addClass("active");
				
				that.fileList.length = 0;
				that.pt.find(".c_wrap").empty();
				var html = "<li class='file_drop_info flex'>"
					+ "<div class='info_wrap'>"
					+ "<div class='img'></div><div>파일을 이 영역으로 옮겨주세요.</div>"
					+ "</div>"
					+ "</li>";
				
				that.pt.find(".c_wrap").append(html);
				
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
			that.pt.find("#files").off("change").on("change", function(e){
				try{
					var files = this.files;
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
			that.pt.find(".c_wrap").off("drop").on("drop", function(e){
				e.preventDefault();
				e.stopPropagation();
				if(e.originalEvent.dataTransfer && e.originalEvent.dataTransfer.files.length) {
					var files = e.originalEvent.dataTransfer.files;
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
					if(files.length>1){
						alert("단일 VideoFile 만 사용 가능합니다");
						return false;
					} else {
						return "video";
					}
				} else if(files[i].type.match("image")){
					continue;
				} else {
					alert("ImageFile 또는 VideoFile 또는 ZIPFile 만 사용 가능합니다 \n 다시 시도해주세요");
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
			if(chk == "image"){		//imageFile tab active
				if(!that.pt.find(".tab.active").hasClass("img_file")){
					fileList.length = 0;
					that.pt.find(".c_wrap li").remove();
				}
				that.pt.find(".tab").removeClass("active");
				that.pt.find(".img_file").addClass("active");
				
				
			} else if(chk == "video"){	//videoFile tab active
				if(fileList.length>0){
					fileList.length = 0;
					that.pt.find(".c_wrap li").remove();
				}
				that.pt.find(".tab").removeClass("active");
				that.pt.find(".video_file").addClass("active");
				
				
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
				that.addFileList(files[i]);
			}
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
