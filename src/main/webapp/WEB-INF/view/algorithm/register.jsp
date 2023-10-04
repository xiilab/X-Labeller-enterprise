<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
	<title>밀리터리 이미지넷 객체 라벨기</title>
	
	<style>
		#algorithmRegister { width: 100%; height: 100%; background-color:#f5f5f5; overflow: overlay; }
		#algorithmRegister input { font: 400 11px system-ui; }
/* 		#reg .title_wrap .c_wrap { width: 50%; height: 14px; margin-left:44px;   } */
		#algorithmRegister .reg_contents_wrap{width: 814px; padding: 0px 30px; }
		#algorithmRegister .reg_contents_wrap input{width:793px; padding:11px; background-color: #fff; }
		#algorithmRegister .type_select_wrap{width:300px}
		#algorithmRegister .input_wrap { margin-bottom: 20px; margin-top: 20px; }
		
		#algorithmRegister .type_select_wrap .radio_button{margin-right:10px}
		
		#algorithmRegister .dlt_btn{width:50px;height:20px;border:1px solid grey;margin-top:5px;margin-bottom:5px}
		#algorithmRegister .add_btn{width:50px;height:20px;border:1px solid grey;margin-top:10px;margin-bottom:10px}
		#algorithmRegister .input_wrap .btn_wrap { display: flex; display: -webkit-flex; }
		#algorithmRegister .input_wrap .btn_wrap div { border-radius: 2px; cursor: pointer; width: 68px; line-height: 28px; text-align: center; font-family: Open_Sans; background-color: #f8f8f8; font-size: 12px; font-weight: 300; color: #343434; border: 1px solid #dedcde; }
		#algorithmRegister .input_wrap .btn_wrap.fl div { margin-right: 10px; }
		#algorithmRegister .input_wrap .btn_wrap.fr div { background-color: #4c84ff; color: #ffffff; }
		#algorithmRegister .input_wrap .btn_wrap.fr div:hover { background-color: #3A71E9; } 		
		
		#algorithmRegister .label{ margin-bottom:10px; margin-top:23px; font-family:Open_Sans; font-size: 13px; font-weight: 400; color: #343434; cursor: default; }
		#algorithmRegister input[type='file'] { width: 68px; line-height: 28px; text-align: center; font-size:12px; font-weight: 300; border: 1px solid #dedcde; }
		#algorithmRegister .file_input_wrap label  { display: inline-block; color: #fff; background-color: #4c84ff; padding:2px 2px 2px 2px; border: 1px solid #edeced; border-radius:7px; font-size: 10px; cursor: pointer; }
		
		#algorithmRegister .title_wrap { color: #5b666e; }
		#algorithmRegister .title_wrap div {margin-top:23px; font-family: Open_Sans; font-size: 13px; font-weight: 400; color: #343434; margin-bottom:16px; padding: 0; }		
		
		#algorithmRegister .docker_img_wrap span { margin-left: 36px; }
		#algorithmRegister .docker_img_wrap label { font-size: 11px; color: #707070; }
		#algorithmRegister .docker_img_wrap select { margin-bottom: 5px; font: 400 11px system-ui; color: #666; height: 36px; border: 1px solid #d9d9d9; width: 815px; }	
		#algorithmRegister select:focus { outline: none; }
		
		
		#algorithmRegister .docker_cmd_wrap, .train_param_wrap, .inference_param_wrap {  position:relative; }
		#algorithmRegister .docker_cmd_list_wrap, .train_param_list_wrap, .inference_param_list_wrap { display: inline-block; }		
		#algorithmRegister .docker_cmd_wrap .add_docker_cmd { margin-left: 36px; padding: 0px 6px; background-color: #fff; border: 1px solid #d9d9d9; color: #9f9f9f; font-size: 15px; cursor: pointer; position: absolute; display: block; top: 0; left: 140px; }
		#algorithmRegister .train_param_wrap .add_train_param { margin-left: 36px; padding: 0px 6px; background-color: #fff; border: 1px solid #d9d9d9; color: #9f9f9f; font-size: 15px; cursor: pointer; position: relative; display: block; top: -20px; left: 218px; width: 9px; margin-bottom: -20px; }
		#algorithmRegister .inference_param_wrap .add_inf_param { margin-left: 28px; padding: 0px 6px; background-color: #fff; border: 1px solid #d9d9d9; color: #9f9f9f; font-size: 15px; cursor: pointer;  position: relative; display: block; top: -20px; left: 226px; width: 9px; margin-bottom: -20px; }		
		#algorithmRegister .docker_cmd_wrap .del_docker_cmd, .train_param_wrap .del_train_param, .inference_param_wrap .del_inf_param {margin: 6px 0 8px 30px; position: relative; padding: 0px 6px; background-color: #fff; border: 1px solid #d9d9d9; color: #9f9f9f; font-size: 15px; cursor: pointer; display: inline-block; }	
		#algorithmRegister .docker_cmd_list_wrap select, .file_list_wrap select { width: 320px !important; float: left; font: 400 11px system-ui; color: #666; height: 36px; border: 1px solid #d9d9d9; z-index:2; }
		#algorithmRegister .train_param_list_wrap select, .inference_param_list_wrap select { width: 140px; float: left; font: 400 11px system-ui; color: #666; height: 37px; border: 1px solid #d9d9d9; z-index:2; }
		#algorithmRegister .docker_cmd_list_wrap input, .file_list_wrap input { width: 452px !important; float: left; margin-right: 20px; z-index: 2; }
		#algorithmRegister .train_param, .train_param_help, .inference_param, .inf_param_help { width: 220px!important; float: left; margin-right: 10px; z-index: 2; }
		
		#algorithmRegister .item { width: 110%; }
	
		#algorithmRegister .mt-38 { margin-top: 38px; }
		#algorithmRegister .param { border:0; }
		#algorithmRegister .cancel { background-color: #f8f8f8!important; border: 1px solid #dedcde!important; color: #343434!important; }
	
		#algorithmRegister .user_docker_image { position: relative; }
		
		#algorithmRegister [data-tooltip-text]:hover { position: relative; }
		#algorithmRegister [data-tooltip-text]:after { 	
			-webkit-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
			-moz-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
			transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
		
			background-color: rgba(0, 0, 0, 0.6);
		
		  	-webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
			-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
			box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
			
		 	-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			
		  	color: #FFFFFF;
			font-size: 12px;
			margin-bottom: 10px;
			padding: 7px 12px;
			position: absolute;
			width: max-content;
/* 			min-width: 100px; */
/* 			max-width: 1000px; */
			word-wrap: break-word;
		
			z-index: 9999;
		
			opacity: 0;
			left: -9999px;
		  	top: 90%;
			
			content: attr(data-tooltip-text); }
		#algorithmRegister [data-tooltip-text]:hover:after { top: 165%; left: 0; opacity: 1; }
 		#algorithmRegister .tooltip_span:hover { min-width: 800px; display: inline-block; z-index: 999; }
		#algorithmRegister .title_span { margin-left: 0 !important; }
		#algorithmRegister .btn_span { display: block; position: absolute; top:253px; left: 160px; }
		#algorithmRegister .file_span { display: block !important; position: relative; top:-18px; left: 250px; margin-bottom: -20px; }
		#algorithmRegister input[type=checkbox] { cursor: pointer; }		
		#algorithmRegister .default_train_num, .default_train_str, .default_inf_num, .default_inf_str { width: 143px !important; margin-left: 5px; padding-top: 11px !important; }
		#algorithmRegister .default_train_bool, .default_inf_bool { width: 167px !important; margin-left: 5px; }
		#algorithmRegister input[type='number']::-webkit-outer-spin-button,
		#algorithmRegister input[type='number']::-webkit-inner-spin-button { -webkit-appearance: none; appearance: none; margin: 0; margin-bottom: -1px; }
		#algorithmRegister input[type='number'] { height: 13px; }
		
		
	</style>
</head>
<body>
	<div class="container" id="algorithmRegister">
		<div class="min_w1440">
			<div class="contents">
				<form id="fileForm" enctype="multipart/form-data" method="POST">
					<div class="reg_wrap">
						<div class="reg_contents_wrap">
							<div class="title_wrap flex">
								<div>Register Algorithm</div>
							</div>			
							<!-- 알고리즘 이름 -->		
							<div class="title_input_wrap">
								<div class="label">
									Title
									<span class="tooltip_wrap" data-tooltip-text="알고리즘의 제목을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다."></span>
<!-- 									<span class="tooltip_span" data-tooltip-text="알고리즘의 제목을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.">Title</span> -->
								</div>
								<input class="title" name="title" type="text" data-length="100" placeholder="제목을 입력해주세요." onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>
							</div>
							<!-- 알고리즘에 대한 설명 -->
							<div class="description_input_wrap">
								<div class="label">
									Description
									<span class="tooltip_wrap"  data-tooltip-text="알고리즘의 설명을 입력해주세요. 한글과 영문 및 숫자, 특수기호 모두 입력 가능합니다."></span>
<!-- 									<span class="tooltip_span"  data-tooltip-text="알고리즘의 설명을 입력해주세요. 한글과 영문 및 숫자, 특수기호 모두 입력 가능합니다.">Description</span> -->
								</div>
								<input class="description" name="description" type="text" data-length="200" placeholder="설명을 입력해주세요."/>
							</div>
							<!-- docker image 기본 옵션 또는 사용자 정의 옵션 -->
							<div class="docker_img_wrap">
								<div class="label">
									Docker base image
									<span class="title_span tooltip_wrap" data-tooltip-text="알고리즘의 docker base image를 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다."></span>
<!-- 									<span class="title_span tooltip_span" data-tooltip-text="알고리즘의 docker base image를 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.">Docker base image</span> -->
<!-- 									<span class="btn_span"><label><input type="checkbox" name="isUserDef">user defined</label></span> -->
								</div>								
<!-- 								<select name="docker_image"> -->
<!-- 									<option value="">Select Docker base image</option> -->
<!-- 									<option value="option1">option1</option> -->
<!-- 									<option value="option2">option2</option> -->
<!-- 									<option value="option3">option3</option> -->
<!-- 								</select> -->
								<input class="user_docker_image" name="user_docker_image" type="text" data-length="200" placeholder="Docker Base Image를 등록해주세요." onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>
							</div>
							
							<div class="docker_cmd_wrap">
								<div class="label">
									Docker File Command
									<span class="tooltip_wrap" data-tooltip-text="알고리즘의 docker file command를 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다."></span>
<!-- 									<span class="tooltip_span" data-tooltip-text="알고리즘의 docker file command를 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.">Docker File Command</span> -->
									<span class="add_docker_cmd">+</span>
								</div>								
								<div class="clear"></div>
								<div class="docker_cmd_list_wrap">

								</div>														
							</div>	
							<!-- 알고리즘 소스코드 업로드 -->
							<div class="file_input_wrap">
								<div class="label">
									Algorithm Source code upload (ZIP)
									<span class="tooltip_wrap" data-tooltip-text="알고리즘의 소스코드 파일을 첨부한 후, 해당 알고리즘의 객체 탐지 유형을 선택해주세요."></span>
<!-- 									<span class="tooltip_span" data-tooltip-text="알고리즘의 소스코드 파일을 첨부한 후, 해당 알고리즘의 객체 탐지 유형을 선택해주세요.">Algorithm Source code upload (ZIP)</span> -->
									<span class="file_span filter_color"><label for="upload_file">...</label></span>
								</div>
	
									<input id="upload_file" class="upload_file" accept="application/zip" type="file" name="upload_file" multiple/>
								<!-- <div class="add_btn fr"></div> -->
								<div class="clear"></div>
								<div class="file_list_wrap">
									<!-- 업로드한 소스코드 파일명을 보여주기 위한 텍스트박스 -->
									<div class="list">
										<div class="item">
											<input class="fl file_name" type="text" name="file_name" placeholder="소스코드를 등록해주세요." disabled/>
											<select name="label_type">
												<option value="">유형을 선택해주세요.</option>
												<option value="IMAGE_BBOX">바운딩 박스</option>
												<option value="IMAGE_SEGMENTATION">세그멘테이션</option>
												<%--									<option value="VIDEO_BBOX">Video Bounding Box</option>									--%>
<!-- 												<option value="box">Bounding Box</option> -->
<!-- 												<option value="polygon">Segmentation</option> -->
											</select>
											<!-- <div class="dlt_btn fl"></div> -->
											<div class="clear"></div>
										</div>
									</div>
								</div>
							</div>	
							<!-- training function -->
							<div class="train_fn_input_wrap">
								<div class="label">
									Train function name
									<span class="tooltip_wrap" data-tooltip-text="알고리즘의 train function을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다."></span>
<!-- 									<span class="tooltip_span" data-tooltip-text="알고리즘의 train function을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.">Train function name</span> -->
								</div>
								<!-- <div class="add_btn fr"></div> -->
								<div class="clear"></div>
								<div class="train_fn_list_wrap">
									
									<div class="list">
										<div class="item">
											<input class="train_fn" name="train_fn" class="fl" type="text" data-length="200" placeholder="Please enter the train function name" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>
											<!-- <div class="dlt_btn fl"></div> -->
											<div class="clear"></div>
										</div>
									</div>
								</div>
							</div>	
							<!-- inference initialize fuction -->										
							<div class="inf_init_fn_input_wrap">
								<div class="label">
									Inference Initialize function name
									<span class="tooltip_wrap" data-tooltip-text="알고리즘의 inference initialize function을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다."></span>
<!-- 									<span class="tooltip_span" data-tooltip-text="알고리즘의 inference initialize function을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.">Inference Initialize function name</span> -->
								</div>
								<!-- <div class="add_btn fr"></div> -->
								<div class="clear"></div>
								<div class="inf_init_fn_list_wrap">
									
									<div class="list">
										<div class="item">
											<input class="inf_init_fn" name="inf_init_fn" class="fl" type="text" data-length="200" placeholder="Please enter the inference initialize function name" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>
											<!-- <div class="dlt_btn fl"></div> -->
											<div class="clear"></div>
										</div>
									</div>
								</div>
							</div>																
							<!-- inference function -->
							<div class="inf_fn_input_wrap">
								<div class="label">
									Inference function name
									<span class="tooltip_wrap" data-tooltip-text="알고리즘의 inference function을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다."></span>
<!-- 									<span class="tooltip_span" data-tooltip-text="알고리즘의 inference function을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.">Inference function name</span> -->
								</div>
								<!-- <div class="add_btn fr"></div> -->
								<div class="clear"></div>
								<div class="inf_fn_list_wrap">
									
									<div class="list">
										<div class="item">
											<input class="inf_fn" name="inf_fn" class="fl" type="text" data-length="200" placeholder="Please enter the inference function name" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>
											<!-- <div class="dlt_btn fl"></div> -->
											<div class="clear"></div>
										</div>
									</div>
								</div>
							</div>
							<!-- training hyperparameters -->
							<div class="train_param_wrap">
								<div class="label">
									Define Training Hyperparameters
									<span class="tooltip_wrap" data-tooltip-text="알고리즘의 train hyperparameter의 이름과 설명, 타입과 기본값을 입력해주세요. 설명을 제외하고 영문과 숫자, 특수기호만 입력 가능합니다."></span>
<!-- 									<span class="tooltip_span" data-tooltip-text="알고리즘의 train hyperparameter의 이름과 설명, 타입과 기본값을 입력해주세요. 설명을 제외하고 영문과 숫자, 특수기호만 입력 가능합니다.">Define Training Hyperparameters</span> -->
									<span class="add_train_param">+</span>
								</div>								
								<div class="clear"></div>
								<div class="train_param_list_wrap">
									
								</div>														
							</div>
							<!-- inference hyperparameters -->
							<div class="inference_param_wrap">
								<div class="label">
									Define Inference Parameters
									<span class="tooltip_wrap" data-tooltip-text="알고리즘의 inferenece parameter의 이름과 설명, 타입과 기본값을 입력해주세요. 설명을 제외하고 영문과 숫자, 특수기호만 입력 가능합니다."></span>
<!-- 									<span class="tooltip_span" data-tooltip-text="알고리즘의 inferenece hyperparameter의 이름과 설명, 타입과 기본값을 입력해주세요. 설명을 제외하고 영문과 숫자, 특수기호만 입력 가능합니다.">Define Inference Hyperparameters</span> -->
									<span class="add_inf_param">+</span>
								</div>								
								<div class="inference_param_list_wrap">
									
								</div>								
							</div>
												
						
							<div class="input_wrap">
								<div class="btn_wrap fr mt-38">
									<div class="cancel">Cancel</div>
									<div class="submit filter_color">Submit</div>
								</div>
							</div>					
						
						</div>
					</div>
				</form>
				
			</div>
		</div>
	</div>

</body>
<script>
	$(document).on("sessionLoad", function() {
// 		if(!loginCheck()){
// 			alert("로그인 후 이용 가능합니다");
// 			location.href = baseUrl + "login";
// 		} else {
			algorithmRegister.init();
// 		}
	});

	var algorithmRegister = {
		pt : $("#algorithmRegister"),
		init : function(node) {
			let that = algorithmRegister;
 			$("#loader").show();
 			that.resetView();
			that.addDefault();
		},
		
		//맨처음 화면 리셋하는 함수
		resetView  : function(){
			let that = algorithmRegister;
			that.pt.find("input:checkbox").attr("checked", false);
			that.pt.find(':input').val("");
			that.resetList();
			that.bind();
			that.listener();

			$("#loader").hide();
		},
		
		resetList : function() {
			let that = algorithmRegister;
			let docker_str = '<div class="list"><div class="item"><input class="docker_cmd" name="docker_cmd" type="text" placeholder="Please enter the docker command line"/><select name="type_docker_cmd"><option value="">Type</option><option value="RUN">RUN</option><option value="ENV">ENV</option><option value="WORKDIR">WORKDIR</option></select><span class="del_docker_cmd">-</span></div></div>';
			let train_str = '<div class="list"><div class="item"><input class="train_param" name="train_param" type="text" placeholder="Parameter name" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/><input class="train_param_help" name="train_param_help" type="text" placeholder="Description of parameter"/><select class="type_train_param" name="type_train_param"><option value="">Type</option><option value="number">Number</option><option value="boolean">Boolean</option><option value="string">String</option></select><span class="del_train_param">-</span></div></div>';
			let inference_str = '<div class="list"><div class="item"><input class="inference_param" name="inference_param" type="text" placeholder="Parameter name" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/><input class="inf_param_help" name="inf_param_help" type="text" placeholder="Description of parameter"/><select class="type_inference_param" name="type_inference_param"><option value="">Type</option><option value="number">Number</option><option value="boolean">Boolean</option><option value="string">String</option></select><span class="del_inf_param">-</span></div></div>';
			that.pt.find(".docker_cmd_list_wrap").append(docker_str);
			that.pt.find(".train_param_list_wrap").append(train_str);
			that.pt.find(".inference_param_list_wrap").append(inference_str);
			// 삭제 
			let dockerTarget = that.pt.find(".del_docker_cmd");
			for (let i = 0; i < dockerTarget.length; i++){
				dockerTarget[i].addEventListener("click", function(){
					let parent = that.pt.find(".docker_cmd_list_wrap");
					$(this).parent().parent().remove();
				});
			};
			let trainTarget = that.pt.find(".del_train_param");
			for (let i = 0; i < trainTarget.length; i++){
				trainTarget[i].addEventListener("click", function(){
					let parent = that.pt.find(".train_param_list_wrap");
					$(this).parent().parent().remove();
				});
			};
			let infTarget = that.pt.find(".del_inf_param");
			for (let i = 0; i < infTarget.length; i++){
				infTarget[i].addEventListener("click", function(){
					let parent = that.pt.find(".inference_param_list_wrap");
					$(this).parent().parent().remove();
				});
			};			
		},
		
		listener : function(){
			let that = algorithmRegister;
			
			that.pt.find(".cancel").off("click").on("click", function(){
				algorithmList.main();
			});
			
			$("input").off("input").on("input",function(e){
				//영문, 숫자, 특수문자
				if($(this).hasClass("description") || $(this).hasClass("train_param_help") || $(this).hasClass("inf_param_help")) {
					 if ($(this).data("length") == 200 && $(this).val().length > 200){
							var string = $(this).val();
							alert("입력 가능한 텍스트 개수를 초과하였습니다\n중간에 입력하신 경우 기존 텍스트의 마지막 글자를 삭제합니다");
							$(this).val(string.slice(0,200));
							return false;							
					 }
				} else {
					if($(this).val().match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
						alert("영문과 특수문자 및 숫자만 입력 가능합니다");
					}					
					var str = $(this).val().replace(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/gi,"");					
// 					let str = $(this).val();
					if(str.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
						alert("영문과 특수문자 및 숫자만 입력 가능합니다");
						if($(this).attr("type") == "file"){
							
						} else {
							$(this).val(str.slice(0, -1));						
						}

					} else {
						if($(this).attr("type") == "file"){
							
						} else {
							$(this).val(str);						
						}
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
					
					return;						
				}

			});			
			
			// Docker base image 체크박스 선택 시 select 비활성화 및 사용자 정의 입력창 보이기
// 			$("#algorithmRegister").find("input:checkbox[name='isUserDef']").click(function(){
// 				let chk = $("#algorithmRegister").find("input:checkbox[name='isUserDef']").is(':checked');
// 				if(chk) {
// 					$("#algorithmRegister").find("select[name='docker_image']").css({ "display" : "none" })
// 					$("#algorithmRegister").find(".user_docker_image").css({ "display": "block" });
// 				} else {
// 					$("#algorithmRegister").find("select[name='docker_image']").css({ "display" : "block" });
// 					$("#algorithmRegister").find(".user_docker_image").css({"display": "none"});
// 				}
// 			});		

			
			// 저장
			$("#algorithmRegister").find(".submit").off("click").on("click", function(){
				event.preventDefault();
				let chk = $("input:checkbox[name='isUserDef']").is(":checked");
				//console.log("that:",that);

				let title = that.pt.find("input[name='title']").val();
				let description = that.pt.find("input[name='description']").val();
				let base_image = "";
					base_image = that.pt.find("input[name='user_docker_image']").val(); 
// 				if(chk) base_image = that.pt.find("input[name='user_docker_image']").val(); 
// 				else base_image = that.pt.find("select[name='docker_image']").val(); 											
				let docker_cmd = that.pt.find("input[name='docker_cmd']").val();
				let type_docker_cmd = that.pt.find("select[name='type_docker_cmd']").val();
				let upload_file = that.pt.find("input[name='upload_file']").val();
				let label_type = that.pt.find("select[name='label_type']").val();				// jh.sa 객체 탐지 유형 추가
				let train_func_name = that.pt.find("input[name='train_fn']").val();
				let load_func_name = that.pt.find("input[name='inf_init_fn']").val();
				let inference_func_name = that.pt.find("input[name='inf_fn']").val();
				let train_param = that.pt.find("input[name='train_param']").val();
				let type_train_param = that.pt.find("select[name='type_train_param']").val();
				let inference_param = that.pt.find("input[name='inference_param']").val();
				let type_inference_param = that.pt.find("select[name='type_inference_param']").val();
				
				// environment JSON array
				let docker_cmd_array = new Array();
				let docker_cmd_obj_length = $(".docker_cmd_list_wrap > .list").length;
				
				for(let i=0; i < docker_cmd_obj_length; i++){
					let name_val = that.pt.find("input[name='docker_cmd']")[i].value;
					let type_val = that.pt.find("select[name='type_docker_cmd']")[i].value
					if(name_val == "" || type_val == ""){
						alert("Docker File Command의 항목을 모두 채워주세요");
						return false;
					} else {
						let docker_cmd_obj = { "name" : name_val, "type" : type_val };
						docker_cmd_array.push(docker_cmd_obj);						
					}
				};				
				
				console.log("docker_cmd_array : ", docker_cmd_array);
				let s_docker_cmd = JSON.stringify(docker_cmd_array);
				
				// train_param JSON array
				let train_param_array = new Array();
				let train_param_obj_length = $(".train_param_list_wrap > .list").length;
				
 				for(let i=0; i < train_param_obj_length; i++){
 					let type = that.pt.find("select[name='type_train_param']")[i].value; 
 					let default_value = that.pt.find("select[name='type_train_param']")[i].nextElementSibling.value;
					let helper = that.pt.find("input[name='train_param_help']")[i].value;
					let param = that.pt.find("input[name='train_param']")[i].value;					
 					let default_val_res;
					if(type == "" || default_value == "" || param == "" || helper == ""){
						alert("Define Training Hyperparameters의 항목을 모두 채워주세요");
						return false;
					} else {
	 					if(type == "string") {
							default_val_res = that.pt.find("select[name='type_train_param']")[i].nextElementSibling.value 
						} else if (type == "number") {
							default_val_res = that.pt.find("select[name='type_train_param']")[i].nextElementSibling.value  * 1
						} else if (type == "boolean") {
							if(default_value == "true") {
								default_val_res = true;
							} else {
								default_val_res = false;
							}
						};
	 					
	 					let train_param_obj = { 
								"param" : param, 
								"type" : type, 
								"helper" : helper, 
								"defaultvalue" : default_val_res
								};
						train_param_array.push(train_param_obj);						
					} 					
 					
 				};
				
				console.log("train_param_array : ", train_param_array);
				let s_train_param = JSON.stringify(train_param_array); 
				
				// inference_param JSON array
				let inference_param_array = new Array();
				let inference_param_obj_length = $(".inference_param_list_wrap > .list").length;
				
				for(let i=0; i < inference_param_obj_length; i++){
 					let type = that.pt.find("select[name='type_inference_param']")[i].value;
 					let default_value = that.pt.find("select[name='type_inference_param']")[i].nextElementSibling.value;
					let helper = that.pt.find("input[name='inf_param_help']")[i].value;
					let param = that.pt.find("input[name='inference_param']")[i].value;					
 					let default_val_res;	
					if(type == "" || default_value == "" || param == "" || helper == ""){
						alert("Define Inference Hyperparameters의 항목을 모두 채워주세요");
						return false;
					} else {
	 					if(type == "string") {
							default_val_res = that.pt.find("select[name='type_inference_param']")[i].nextElementSibling.value 
						} else if (type == "number") {
							default_val_res = that.pt.find("select[name='type_inference_param']")[i].nextElementSibling.value  * 1
						} else if (type == "boolean") {
							if(default_value == "true") {
								default_val_res = true;
							} else {
								default_val_res = false;
							}
						};					
						let inference_param_obj = {
								"param" : param, 
								"type" : type, 
								"helper" : helper, 
								"defaultvalue" : default_val_res
								};
						inference_param_array.push(inference_param_obj);						
					} 					
 					

				};
				
				console.log("inference_param_array : ", inference_param_array);
				let s_inference_param = JSON.stringify(inference_param_array);
				
				// 빈 값 검사
				if(title == ""){
				 	alert("제목을 입력해주세요");
				 	that.pt.find("input[name='title']").focus();
				 	return;
				}
				
				if(description == ""){
				 	alert("설명을 입력해주세요");
				 	that.pt.find("input[name='description']").focus();
				 	return;
				} 
				
// 				if(base_image == ""){
// 					if(chk) {
// 						alert("사용자 정의 된 docker base 이미지를 입력해주세요");
// 						that.pt.find("input[name='user_docker_image']").focus();
// 						return;						
// 					} else {
// 						alert("Docker base 이미지를 선택해주세요");
// 						that.pt.find("select[name='docker_image']").focus();
// 						return;						
// 					}
// 				}

				if(base_image == ""){
					alert("Docker base 이미지를 입력해주세요");
					that.pt.find("input[name='user_docker_image']").focus();
					return;						
				}

				if(docker_cmd == "" || docker_cmd == undefined){
					alert("Command line 을 입력해주세요");
					that.pt.find("input[name='docker_cmd']").focus();
					return;
				} 
				
				if(type_docker_cmd == ""){
					alert("Command type 을 입력해주세요");
					that.pt.find("select[name='type_docker_cmd']").focus();
					return;
				}

				if(upload_file == ""){
					alert("ZIPFile 을 업로드해주세요");
					that.pt.find("input[name='file_name']").focus();
					return;
				}
				
				if(label_type == ""){							// jh.sa 객체 탐지 유형 추가
					alert("객체 탐지 유형을 선택해주세요");
					that.pt.find("select[name='label_type']").focus();
					return;
				} 
				
				if(train_func_name == ""){
					alert("Train function name 을 입력해주세요");
					that.pt.find("input[name='train_fn']").focus();
					return;
				}
				
				if(load_func_name == ""){
					alert("Inference initialize function name 을 입력해주세요");
					that.pt.find("input[name='inf_init_fn']").focus();
					return;
				}
				
				if(inference_func_name == ""){
					alert("Inference function name 을 입력해주세요");
					that.pt.find("input[name='inf_fn']").focus();
					return;
				}	
				
				if(train_param == "" || train_param == undefined){
					alert("Training hyperparameter 를 정의해주세요");
					that.pt.find("input[name='train_param']").focus();
					return;
				}	

				if(type_train_param == ""){
					alert("Training hyperparameter 의 type을 선택해주세요");
					that.pt.find("select[name='type_train_param']").focus();
					return;
				}			
				
				if(inference_param == "" || inference_param == undefined){
					alert("Inference hyperparameter 를 정의해주세요");
					that.pt.find("input[name='inference_param']").focus();
					return;
				}				
				
				if(type_inference_param == ""){
					alert("Inference hyperparameter 의 type을 선택해주세요");
					that.pt.find("select[name='type_inference_param']").focus();
					return;
				}			
				
				let formData = new FormData();

				formData.append("upload_file", that.pt.find("input[name='upload_file']")[0].files[0]);
				formData.append("title", that.pt.find("input[name='title']").val());
				formData.append("description", that.pt.find("input[name='description']").val());
				formData.append("docker_cmd", s_docker_cmd);
				formData.append("train_param", s_train_param);
				formData.append("inference_param", s_inference_param);
				formData.append("base_image", base_image);
				formData.append("train_func_name", that.pt.find("input[name='train_fn']").val());
				formData.append("load_func_name", that.pt.find("input[name='inf_init_fn']").val());
				formData.append("inference_func_name", that.pt.find("input[name='inf_fn']").val());
				formData.append("label_type", label_type);							// jh.sa 객체 탐지 유형 추가
				
				for(var pair of formData.entries()){
					console.log(pair[0] + ',' + pair[1]);
				};
				
				$("#loader").show();
				$.ajax({
					url : baseUrl + "algorithm/insertAlgorithm.json",
					data : formData,
					type : "POST",
					//enctype: "multipart/form-data",
					processData : false,
					contentType: false,
					success : function(res) {
						$("#loader").hide();
						
						console.log("=====insertAlgorithm=====", res);
						if(res.result.code == "3301"){
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} 
						if (res.result.code == "200") {
							
/* 							let agent = navigator.userAgent.toLowerCase();
							let attachFile = $("input[type='file']");
							
							if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
							    // ie 일때 input[type=file] init.
							    $(attachFile).replaceWith( $(attachFile).clone(true) );
							    $(".file_name").val("");
							} else {
							    //other browser 일때 input[type=file] init.
							    $(attachFile).val("");
							    $(".file_name").val("");
							}; */
							
							alert("알고리즘 등록이 완료되었습니다");
							algorithmList.init();
							algorithmList.hideView();
							algorithmList.main();
							algorithmList.detail(res.algorithmVO.algorithm_id);
						} else {
							alert(res.result.data);
						}
					},
					error : function(err) {
						$("#loader").hide();
						console.log("ERROR!!", err);
						alert("ERROR!! error code : " + err.status);
					}
				});
			});
			

		},
		
		bind : function() {			
			let that = algorithmRegister;
			//console.log("that:", that);
			
			// 라디오 버튼 체크 
			let radio_btn = that.pt.find(".radio_button");
			
			radio_btn.off("click").on("click",function(){
				let btn = $(this);
				btn.toggleClass("selected");
				
				if(btn.hasClass("selected")) {
					that.pt.find(".radio_button").not(btn).removeClass("selected");
				}
			})
			
			// 첨부파일명 텍스트 삽입 
			
			$("#algorithmRegister").find(".upload_file").on("change", function(e){
				let file = e.target.files[0];
				console.log("reg this:::", $(this));
				if(typeof file === "undefined"){
					$(this).parent().find(".file_name").val("");
					return;
				}
				let name = file.name;
				//console.log("name ::", name);
				console.log("$(this).parent().find('.file_name')  :: ", $(this).parent().find(".file_name"));
				
				// 파일명에 한글 사용 불가 및 한글 사용 시 파일 데이터 받지 않음
				if(name.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
					document.getElementById("upload_file").value="";
				} else {
					$(this).parent().find(".file_name").attr("disabled","disabled").val(name);					
				}

			});
			
			// 환경설정 추가 (env, pip_instsall, apt_install 통합)
			let add_docker_cmd = that.pt.find(".add_docker_cmd");
			let dockerCmdTarget = that.pt.find(".docker_cmd_list_wrap");
// 			$(dockerCmdTarget).html("");
			
			add_docker_cmd.off("click").on("click", function() {
				let html = "";
				html += '<div class="list">';
				html += '<div class="item">';
				html += '<input class="docker_cmd" name="docker_cmd" type="text" placeholder="Please enter the docker command line"/> ';
				html += '<select name="type_docker_cmd">';
				html += '<option value="">Type</option>';
				html += '<option value="RUN">RUN</option>';
				html += '<option value="ENV">ENV</option>';
				html += '<option value="WORKDIR">WORKDIR</option>';
				html += '</select>';
				html += '<span class="del_docker_cmd">-</span>';
				html += '</div>';
				html += '</div>';
				
				$(dockerCmdTarget).append(html);
				
				// 삭제 
				let eventTarget = that.pt.find(".del_docker_cmd");
				for (let i = 0; i < eventTarget.length; i++){
					eventTarget[i].addEventListener("click", function(){
						let parent = that.pt.find(".docker_cmd_list_wrap");
						$(this).parent().parent().remove();
					});
				};
				
				$("input").off("input").on("input",function(e){
					//영문, 숫자, 특수문자
					if($(this).hasClass("description") || $(this).hasClass("train_param_help") || $(this).hasClass("inf_param_help")) {
					
					} else {
						let str = $(this).val();
						if(str.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
							alert("영문과 특수문자 및 숫자만 입력 가능합니다");
							if($(this).attr("type") == "file"){
								
							} else {
								$(this).val(str.slice(0, -1));						
							}

						} else {
							if($(this).attr("type") == "file"){
								
							} else {
								$(this).val(str);						
							}
						}
						return;						
					}

				});	
				that.listener();
			});				

			// 학습 하이퍼파라미터 추가
			let add_train_param = that.pt.find(".add_train_param");
			let trainParamTarget = that.pt.find(".train_param_list_wrap");
// 			$(trainParamTarget).html("");
			
			add_train_param.off("click").on("click", function() {
				let html = "";
				html += '<div class="list">';
				html += '<div class="item">';
				html += '<input class="train_param" name="train_param" type="text" placeholder="Parameter name" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/> ';
				html += '<input class="train_param_help" name="train_param_help" type="text" placeholder="Description of parameter"/>';
				html += '<select class="type_train_param" name="type_train_param">';
				html += '<option value="">Type</option>';
				html += '<option value="number">Number</option>';
				html += '<option value="boolean">Boolean</option>';
				html += '<option value="string">String</option>';
				html += '</select>';
				html += '<span class="del_train_param">-</span>';
				html += '</div>';
				html += '</div>';
				
				$(trainParamTarget).append(html);
				that.addDefault();

				// 삭제 
				let eventTarget = that.pt.find(".del_train_param");
				for (let i = 0; i < eventTarget.length; i++){
					eventTarget[i].addEventListener("click", function(){
						let parent = that.pt.find(".train_param_list_wrap");
						$(this).parent().parent().remove();
					});
				}	
							
				
				$("input").off("input").on("input",function(e){
					//영문, 숫자, 특수문자
					if($(this).hasClass("description") || $(this).hasClass("train_param_help") || $(this).hasClass("inf_param_help")) {
					
					} else {
						let str = $(this).val();
						if(str.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
							alert("영문과 특수문자 및 숫자만 입력 가능합니다");
							if($(this).attr("type") == "file"){
								
							} else {
								$(this).val(str.slice(0, -1));						
							}

						} else {
							if($(this).attr("type") == "file"){
								
							} else {
								$(this).val(str);						
							}
						}
						return;						
					}

				});	
				that.listener();
			});
			
			
			// 참조 하이퍼파라미터 추가
			let add_inf_param = that.pt.find(".add_inf_param");
			let infParamTarget = that.pt.find(".inference_param_list_wrap");
// 			$(infParamTarget).html("");
			
			add_inf_param.off("click").on("click", function() {
				let html = "";
				html += '<div class="list">';
				html += '<div class="item">';
				html += '<input class="inference_param" name="inference_param" type="text" placeholder="Parameter name" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/> ';
				html += '<input class="inf_param_help" name="inf_param_help" type="text" placeholder="Description of parameter"/>';				
				html += '<select class="type_inference_param" name="type_inference_param">';
				html += '<option value="">Type</option>';
				html += '<option value="number">Number</option>';
				html += '<option value="boolean">Boolean</option>';
				html += '<option value="string">String</option>';
				html += '</select>';
				html += '<span class="del_inf_param">-</span>';
				html += '</div>';
				html += '</div>';
				
				$(infParamTarget).append(html);
				that.addDefault();
				
				// 삭제
				let eventTarget = that.pt.find(".del_inf_param");
				for (let i = 0; i < eventTarget.length; i++){
					eventTarget[i].addEventListener("click", function(){
						let parent = that.pt.find(".inference_param_list_wrap");
						$(this).parent().parent().remove();
					});
				}
				
				$("input").off("input").on("input",function(e){
					//영문, 숫자, 특수문자
					if($(this).hasClass("description") || $(this).hasClass("train_param_help") || $(this).hasClass("inf_param_help")) {
					
					} else {
						let str = $(this).val();
						if(str.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
							alert("영문과 특수문자 및 숫자만 입력 가능합니다");
							if($(this).attr("type") == "file"){
								
							} else {
								$(this).val(str.slice(0, -1));						
							}

						} else {
							if($(this).attr("type") == "file"){
								
							} else {
								$(this).val(str);						
							}
						}
						return;						
					}

				});	
				that.listener();
			});
		},
		
		addDefault : function() {
			let that = algorithmRegister; 
			let select_train = $("#algorithmRegister").find("select[name='type_train_param']");
			let select_inf = $("#algorithmRegister").find("select[name='type_inference_param']");
			// train parameter, inference parameter type 선택 시 default 입력필드 호출
			select_train.change(function() {
				console.log("this1:", $(this).val());
				let selected_train_option = $(this).val();
				$(this).next("input").remove();
				$(this).next("select").remove( );
// 				console.log("selected_option: ", selected_option);
				if(selected_train_option == "string") {
					$(this).after("<input type='text' class='default_train_str' placeholder='Default string value' onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>");
				} else if (selected_train_option == "number") {
					$(this).after("<input type='number' class='default_train_num' placeholder='Default number value' onKeyPress='return checkNum(event);'/>");
				} else if (selected_train_option == "boolean") {
					$(this).after("<select class='default_train_bool'><option value=''>Default boolean value</option><option value='true'>True</option><option value='false'>False</option></select>");
				}				
				$("input").off("input").on("input",function(e){
					//영문, 숫자, 특수문자
					if($(this).hasClass("description") || $(this).hasClass("train_param_help") || $(this).hasClass("inf_param_help")) {
					
					} else {
						let str = $(this).val();
						if(str.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
							alert("영문과 특수문자 및 숫자만 입력 가능합니다");
							if($(this).attr("type") == "file"){
								
							} else {
								$(this).val(str.slice(0, -1));						
							}

						} else {
							if($(this).attr("type") == "file"){
								
							} else {
								$(this).val(str);						
							}
						}
						return;						
					}

				});					
			});
			
			select_inf.change(function() {
				console.log("this2:", $(this).val());
				let selected_inf_option = $(this).val();
				$(this).next("input").remove();
				$(this).next("select").remove();
// 				console.log("selected_option: ", selected_option);
				if(selected_inf_option == "string") {
					$(this).after("<input type='text' class='default_inf_str' placeholder='Default string value' onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>");
				} else if (selected_inf_option == "number") {
					$(this).after("<input type='number' class='default_inf_num' placeholder='Default number value' onKeyPress='return checkNum(event);'/>");
				} else if (selected_inf_option == "boolean") {
					$(this).after("<select class='default_inf_bool'><option value='''>Default boolean value</option><option value='true'>True</option><option value='false'>False</option></select>");
				}	
				$("input").off("input").on("input",function(e){
					//영문, 숫자, 특수문자
					if($(this).hasClass("description") || $(this).hasClass("train_param_help") || $(this).hasClass("inf_param_help")) {
					
					} else {
						let str = $(this).val();
						if(str.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
							alert("영문과 특수문자 및 숫자만 입력 가능합니다");
							if($(this).attr("type") == "file"){
								
							} else {
								$(this).val(str.slice(0, -1));						
							}

						} else {
							if($(this).attr("type") == "file"){
								
							} else {
								$(this).val(str);						
							}
						}
						return;						
					}

				});					
			});	
			
			
		}
		
		


	};
</script>
