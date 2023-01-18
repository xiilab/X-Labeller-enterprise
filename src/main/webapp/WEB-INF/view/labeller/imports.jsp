<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
	<style>
		#imports { width: 100%; height: 100%; background-color: #f5f5f5; }
		#imports .border_box { padding: 0px 30px }
		#imports .title_wrap { padding: 23px 0 14px 0; color: #5b666e; }
		#imports .title_wrap div { font-size: 13px; font-weight: 400; color: #343434; }
		#imports .input_wrap { margin-bottom: 10px; }
		#imports input[type='text'] { width: 100%; font-family: Open_Sans; font-size: 13px; font-weight: 300; color: #555555; border: 1px solid #dedcde; }
		#imports input[type='text']:focus {border: 1px solid #4c84ff;}
		#imports textarea { width: 100%; font-family: Open_Sans; font-size: 13px; font-weight: 300; color: #555555; border: 1px solid #dedcde; }
		#imports textarea:focus {border: 1px solid #4c84ff;}
		
		#imports .fileTab_wrap .tab { width: 75px; border: 1px solid #dedcde; border-right: 0; background: #ffffff; line-height: 30px; text-align: center; font-size: 11px; font-weight: 400; color: #555555; cursor: pointer; }
		#imports .fileTab_wrap .tab.active { border-bottom: 0; background: #f5f5f5; }
		#imports .fileTab_wrap .blank { width: calc(100% - 153px); height: 30px; border-bottom: 1px solid #dedcde; border-left: 1px solid #dedcde; }
		
		#imports .file_wrap { width: 100%;height: 231px; margin-bottom: 10px; border: 1px solid #dedcde; position: relative; }
		#imports .file_wrap .h_wrap:after{ content: ''; width: 100%; border-bottom: 1px solid #dedcde; position: absolute; top:30px; left: 0; }
		#imports .file_wrap .h_wrap div { line-height: 30px; font-size: 11px; font-weight: 400; color: #555555; }
		#imports .file_wrap .h_wrap div:nth-of-type(1) { display: inline-block; width: 50px; height: 30px; }
		#imports .file_wrap .h_wrap div:nth-of-type(2) { display: inline-block; width: 20px; }
		#imports .file_wrap .h_wrap div:nth-of-type(3) { display: inline-block; width: 100%; padding-left: 50px; }
		#imports .file_wrap .h_wrap div:nth-of-type(4) { display: inline-block; width: 150px; text-align: center; }
		
		#imports .file_wrap .c_wrap { height:200px; background-color: #ffffff; overflow-y: scroll;}
		#imports .file_wrap .c_wrap .file_drop_info { height:100%; }
		#imports .file_wrap .c_wrap .file_drop_info .info_wrap { margin: auto; font-weight: 200; color: #a0a5ae; }
		#imports .file_wrap .c_wrap .file_drop_info .img{ width: 28px; height: 30px; margin: 0 auto; margin-bottom: 10px; background: url("images/icon_add_image.png") no-repeat center; }
		#imports .file_wrap .c_wrap .file_list { border-bottom: 1px solid #dedcde; }
		#imports .file_wrap .c_wrap .file_list div { line-height: 30px; font-size: 11px; font-weight: 300; color: #555555; }
		#imports .file_wrap .c_wrap .file_list div:nth-of-type(1) { display: inline-block; width: 50px; height: 30px; }
		#imports .file_wrap .c_wrap .file_list div:nth-of-type(2) { display: inline-block; width: 20px; height: 30px; background: url("images/icon_add_file.png") no-repeat center; }
		#imports .file_wrap .c_wrap .file_list div:nth-of-type(3) { display: inline-block; width: 100%; padding-left: 15px; }
		#imports .file_wrap .c_wrap .file_list div:nth-of-type(4) { display: inline-block; width: 150px; text-align: center; }

		#imports .file_wrap .checkBox { background: url("images/btn_checkbox_normal.png") no-repeat center; }
		#imports .file_wrap .checkBox:hover { background-image: url("images/btn_checkbox_hover.png"); }
		#imports .file_wrap .checkBox.selected { background-image: url("images/btn_checkbox_selected.png"); }
		
		#imports .input_wrap .btn_wrap { display: flex; display: -webkit-flex; }
		#imports .input_wrap .btn_wrap div { cursor: pointer; width: 68px; line-height: 28px; text-align: center; background-color: #f8f8f8; font-size: 12px; font-weight: 300; color: #343434; border: 1px solid #dedcde; }
		#imports .input_wrap .btn_wrap.fl div { margin-right: 10px; }
		#imports .input_wrap .btn_wrap.fr div { background-color: #4c84ff; color: #ffffff; }
		#imports .input_wrap .btn_wrap.fr div:hover { background-color: #3A71E9; } 
		
		#imports .btn_wrap span { margin-right: 8px; line-height: 28px; display: inline-block; font-size: 16px; }
		#imports .btn_wrap input[type='radio'] { display: none; }
		#imports .btn_wrap input[type='radio']+label { line-height: 28px; padding-left:18px; margin-right: 18px; font-size: 16px; background: url('images/btn_radio_normal.png') left no-repeat; cursor: pointer; }
		#imports .btn_wrap input[type='radio']:checked+label { background: url('images/btn_radio_selected.png') left no-repeat; }
		
		#imports .label_type_wrap { margin-left: 15px; font-weight: 300 !important; }
		#imports .label_type_wrap .radioBtn { position: relative; top: 2px; }
		#imports .label_type_wrap .radio_label { margin-right: 10px; }		
	</style>
</head>
<body>

	<div class="container" id="imports">
		<div class="border_box">
			<form id="fileForm" enctype="multipart/form-data">
				<div class="title_wrap flex">
					<div>Import</div>
				</div>
				<div class="input_wrap flex">
					<input class="" type="text" name="title" data-length="100" placeholder="Please enter the title" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/>
				</div>
							
				<div class="input_wrap flex">
					<textarea class="" name="contents" data-length="200" placeholder="Please enter the description"></textarea>
				</div>
				
 				<div class="title_wrap flex">
					<div>Label Type :</div>
					<div class="label_type_wrap">
						<span class="radioBtn selected" data-value="box"></span>
						<span class="radio_label">Bounding Box</span>
<%--						<span class="radioBtn" data-value="polygon"></span>--%>
<!-- 						<span class="radio_label">Segmentation</span> -->
					</div>
				</div>					 
					
				<div class="title_wrap flex">
					<div>Add File</div>
				</div>
				<div class="file_wrap">
					<div class="h_wrap flex">
						<div class="checkBox all"></div>
						<div></div>
						<div>File</div>
						<div>Size</div>
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
					<input type="file" id="files" name="files" class="file" accept="image/jpg, image/jpeg, image/png, video/*" multiple />
					<input type="file" id="bigFiles" name="files" class="file" accept="application/zip" />
					<div class="btn_wrap fl">
<!-- 						<span>Duplicate file existence : </span> -->
<!-- 						<input class="" type="radio" name="is_new" id="true" value="0" checked="checked"> -->
<!-- 						<label for="true" class="">Create File</label> -->
<!-- 						<input class="" type="radio" name="is_new" id="false" value="1" > -->
<!-- 						<label for="false" class="">Copy Link</label> -->
						<div class="append">Attach</div>
					</div>
					<div class="btn_wrap fr">
						<div class="save">Save</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
<script>
	var imports = {
		pt : $("#imports"),
		init : function() {
			var that = this;
			that.reset();
			
			that.listener();
		},
		reset : function() {
			var that = this;
			
			that.pt.find("input[name='title']").val("");
			that.pt.find("textarea[name='contents']").val("");
			that.pt.find(".c_wrap").empty();
			that.pt.find(".checkBox").removeClass("selected");
			
			var html = "<li class='file_drop_info flex'>"
				+ "<div class='info_wrap'>"
				+ "<div class='img'></div><div>Please drag&drop the file.</div>"
				+ "</div>"
				+ "</li>";
			
			that.pt.find(".c_wrap").append(html);
			that.fileList.length = 0;
		},
		//
		listener : function() {
			var that = this;
			
			that.pt.find("input[name='title'], textarea[name='contents']").off("input").on("input", function(e){
				if($(this).val().match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
					alert("영문과 특수문자 및 숫자만 입력 가능합니다");
				}					
				var str = $(this).val().replace(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/gi,"");				
// 				var str = $(this).val();
				//한글 사용 불가
				if(str.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ \n]/)){
					alert("영문과 특수문자 및 숫자만 입력 가능합니다");
					$(this).val(str.slice(0, -1));
				} else {
					$(this).val(str);
				}
				
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
				let label_type;
				let selected_type = that.pt.find(".label_type_wrap .radioBtn.selected");
				if(selected_type.data("value") == "box"){
					label_type = "#IMAGE_BBOX";
				} else if (selected_type.data("value") == "polygon"){
					label_type = "#IMAGE_SEGMENTATION";
				}
							
				if(that.pt.find("input[name='title']").val()==""){
					alert("제목을 입력해주세요");
					that.pt.find("input[name='title']").focus();
					return;
				}
				if(that.pt.find("textarea[name='contents']").val()==""){
					alert("설명을 입력해주세요");
					that.pt.find("textarea[name='contents']").focus();
					return;
				}
				
				var formData = new FormData();

				for(var i = 0 ; i < that.fileList.length ; i++){
					formData.append("files",that.fileList[i]);	
				}
				var is_new = true;
// 				if(that.pt.find("input[name='is_new']:checked").val() == 0){
// 					is_new = true;
// 				} else {
// 					is_new = false;
// 				}
// 				console.log(is_new);
				
				formData.append("title",that.pt.find("input[name='title']").val());
				formData.append("contents",that.pt.find("textarea[name='contents']").val());
				formData.append("is_new",is_new);
				formData.append("label_type", label_type);
				
				$("#loader").show();
				$.ajax({
				   	url :  baseUrl + "data/importDataset.json",
				   	data : formData,
				   	type : "POST",
				   	processData : false,
				   	contentType: false,
				   	success : function(res){
				   		$("#loader").hide();
				   		
						console.log("=====upload=====", res);
						alert(res.result.data);
						
						if(res.result.code == "200"){
							//트리초기화
							$(".ztree").empty();
							labeller.getDatasetList();
							
							that.reset();
							
							labeller.pt.find("div.section").removeClass("selected");
							var node = ".section.info";
							labeller.pt.find(node).addClass("selected");							
						} else if (res.result.code == "2001") {
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
			});
			
			//체크박스 전부선택
			that.pt.find(".checkBox.all").off("click").on("click", function(){
				if($(this).hasClass("selected")){
					that.pt.find(".checkBox").removeClass("selected");
				} else {
					that.pt.find(".checkBox").addClass("selected");
				}
			});
			
			//파일첨부
			that.pt.find(".append").off("click").on("click", function(){
				that.pt.find("#bigFiles").trigger("click");
			});
			that.pt.find("#bigFiles").off("change").on("change", function(e){
				try{
					var files = this.files;
					
					that.selectFile(files);
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
						alert("단일 ZIPFile만 사용 가능합니다");
						return false;
					} else {
						return "zip";
					}
				} else if(files[i].type.match("image")){
					/* continue; */
					if(files[i].type.match("jpg") || files[i].type.match("jpeg") || files[i].type.match("png")){
						alert("Import는 ZIP 형식의 파일만 사용 가능합니다.");	
						return false;
					} else {
						alert("Import는 ZIP 형식의 파일만 사용 가능합니다.");
						return false;
					}
					
				} else {
					/* alert("ImageFile 또는 ZIPFile 만 사용 가능합니다\n다시 시도해주세요"); */
					alert("ZIPFile 만 사용 가능합니다.\n다시 시도해주세요");
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
			if(chk == "zip"){
				
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