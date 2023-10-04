<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
	<title>밀리터리 이미지넷 객체 라벨기</title>
	
	<style>
		#algorithmDetail { width: 100%; height: 100%; background-color:#f5f5f5; overflow: overlay; }
		#algorithmDetail input { font: 400 11px system-ui; }
/* 		#reg .title_d_wrap .c_wrap { width: 50%; height: 14px; margin-left:44px;   } */
		#algorithmDetail .reg_contents_wrap{width: 814px; padding: 0px 30px; }
		#algorithmDetail .reg_contents_wrap input{width:793px;padding:10px; background-color: #fff; }
		#algorithmDetail .type_select_wrap{width:300px}
		#algorithmDetail .input_wrap { margin-bottom: 20px; margin-top: 20px; }
		
		#algorithmDetail .type_select_wrap .radio_button{margin-right:10px}
		
		#algorithmDetail .dlt_btn{width:50px;height:20px;border:1px solid grey;margin-top:5px;margin-bottom:5px}
		#algorithmDetail .add_btn{width:50px;height:20px;border:1px solid grey;margin-top:10px;margin-bottom:10px}
		#algorithmDetail .input_wrap .btn_wrap { display: flex; display: -webkit-flex; }
		#algorithmDetail .input_wrap .btn_wrap div { border-radius: 2px; cursor: pointer; width: 68px; line-height: 28px; text-align: center; font-family: Open_Sans; background-color: #f8f8f8; font-size: 12px; font-weight: 300; color: #343434; border: 1px solid #dedcde; }
		#algorithmDetail .input_wrap .btn_wrap.fl div { margin-right: 10px; }
		#algorithmDetail .input_wrap .btn_wrap.fr div { background-color: #4c84ff; color: #ffffff; }
		#algorithmDetail .input_wrap .btn_wrap.fr div:hover { background-color: #3A71E9; } 		
		
		#algorithmDetail .label{ margin-bottom:10px; margin-top:23px; font-family:Open_Sans; font-size: 13px; font-weight: 400; color: #343434; cursor: default; }
		#algorithmDetail input[type='file'] { width: 68px; line-height: 28px; text-align: center; font-size:12px; font-weight: 300; border: 1px solid #dedcde; }
		#algorithmDetail .file_input_wrap label  { display: inline-block; width: 9px; color: #fff; background-color: #4c84ff; padding:2px 2px 2px 2px; border: 1px solid #edeced; border-radius:7px; font-size: 10px; cursor: pointer; }
		
		#algorithmDetail .title_d_wrap { color: #5b666e; }
		#algorithmDetail .title_d_wrap div {margin-top:23px; font-family: Open_Sans; font-size: 13px; font-weight: 400; color: #343434; margin-bottom:16px; padding: 0; }		
		
		#algorithmDetail .docker_img_d_wrap span { margin-left: 36px; }
		#algorithmDetail .docker_img_d_wrap label { font-size: 11px; color: #707070; }
		#algorithmDetail .docker_img_d_wrap select { margin-bottom: 5px; font: 400 11px system-ui; color: #666; height: 36px; border: 1px solid #d9d9d9; width: 815px; }	
		#algorithmDetail select:focus { outline: none; }
		
		
		#algorithmDetail .docker_cmd_d_wrap, .train_param_d_wrap, .inference_param_d_wrap {  position:relative; }
		#algorithmDetail .docker_cmd_d_list_wrap, .train_param_d_list_wrap, .inference_param_d_list_wrap { display: inline-block; }		
		#algorithmDetail .docker_cmd_d_wrap .add_docker_cmd_d { margin-left: 36px; padding: 0px 6px; background-color: #fff; border: 1px solid #d9d9d9; color: #9f9f9f; font-size: 15px; cursor: pointer; position: absolute; display: block; top: 2px; left: 140px; }
		#algorithmDetail .train_param_d_wrap .add_train_param_d { margin-left: 36px; padding: 0px 6px; background-color: #fff; border: 1px solid #d9d9d9; color: #9f9f9f; font-size: 15px; cursor: pointer; position: relative; display: block; top: -20px; left: 216px; width: 9px; margin-bottom: -20px; }
		#algorithmDetail .inference_param_d_wrap .add_inf_param_d { margin-left: 28px; padding: 0px 6px; background-color: #fff; border: 1px solid #d9d9d9; color: #9f9f9f; font-size: 15px; cursor: pointer; position: relative; display: block; top: -20px; left: 225px; width: 9px; margin-bottom: -20px; }		
		#algorithmDetail .docker_cmd_d_wrap .del_docker_cmd_d, .train_param_d_wrap .del_train_param_d, .inference_param_d_wrap .del_inf_param_d {margin: 6px 0 8px 30px; position: relative; padding: 0px 6px; background-color: #fff; border: 1px solid #d9d9d9; color: #9f9f9f; font-size: 15px; cursor: pointer; display: inline-block; }	
		#algorithmDetail .docker_cmd_d_list_wrap select { width: 320px; float: left; font: 400 11px system-ui; color: #666; height: 36px; border: 1px solid #d9d9d9; z-index:2; }
		#algorithmDetail .train_param_d_list_wrap select, .inference_param_d_list_wrap select { width: 140px; float: left; font: 400 11px system-ui; color: #666; height: 36px; border: 1px solid #d9d9d9; z-index:2; }
		
		#algorithmDetail .docker_cmd_d_list_wrap input{ width: 452px; float: left; margin-right: 20px; z-index: 2; }	
		#algorithmDetail .train_param_d, .train_param_d_help, .inference_param_d, .inf_param_d_help { width: 220px!important; float: left; margin-right: 10px; z-index: 2; }
	
		#algorithmDetail .item { width: 110%; }
	
		#algorithmDetail .mt-38 { margin-top: 38px; }
		#algorithmDetail .param { border:0; }
		#algorithmDetail .cancel { background-color: #f8f8f8!important; border: 1px solid #dedcde!important; color: #343434!important; }
		#algorithmDetail .deploy {}
	
		#algorithmDetail .user_docker_image_d { position: relative; }
		/* #algorithmDetail .delete_d { background-color: #f8f8f8 !important; color: #343434 !important; border: 1px solid #dedcde !important; } */
	
		#algorithmDetail .deploy_error { width: 600px; height: 800px; padding: 10px; position: absolute; z-index: 999999; border: 1px solid #dedede; top: 3%; right: 5%; background-color: #e2e2e2; display: none; box-shadow: 2px 2px #c4c4c4; }
		#algorithmDetail .deploy_error.active { display: block; }
		#algorithmDetail .error_log { width: 96%; height: 91%; padding: 10px; background-color: #fff; }
		#algorithmDetail .log_close { font-size: 18px; font-weight: 400; color: #343434; float: right; cursor: pointer; }
		
		#algorithmDetail [data-tooltip-text]:hover { position: relative; }
		#algorithmDetail [data-tooltip-text]:after { 	
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
/* 			min-width: 400px; */
/* 			max-width: 1000px; */
			word-wrap: break-word;
		
			z-index: 99999999;
		
			opacity: 0;
			left: -9999px;
		  	top: 90%;
			
			content: attr(data-tooltip-text); }
		#algorithmDetail [data-tooltip-text]:hover:after { top: 165%; left: 0; opacity: 1; }
 		#algorithmDetail .tooltip_span:hover { min-width: 800px; display: inline-block; z-index: 99999; }
 		#algorithmDetail .tooltip_span { min-width: 800px; display: inline-block; z-index: 99999; }
		#algorithmDetail .title_span { margin-left: 0 !important; }
		#algorithmDetail .btn_span { display: block; position: absolute; top:253px; left: 160px; }
		#algorithmDetail .file_span { display: block !important; position: relative; top:-18px; left: 250px; margin-bottom: -20px; }
		#algorithmDetail input[type=checkbox] { cursor: pointer; }
		#algorithmDetail .error_log { font-family: Open_Sans; font-weight: 300; font-size: 12px; }
		#algorithmDetail .log_wrap { width: 100%; min-height: 100px; height: calc(100% - 87px); position: absolute; }
		#algorithmDetail .log_wrap pre { margin: 0; background-color: #fff; height: 100%; width: 97%; }
		#algorithmDetail .log_wrap .log_area { border-radius: 2px; width: 100%; height: 100%; display: block; background-color: #fff; font-size: 12px; color: #555; font-family: Open_Sans; overflow-wrap: break-word; white-space: pre-wrap; overflow: scroll; }
	
		#algorithmDetail .emphasis { color: red; margin: 3px 0 -18px 0; padding-bottom: 6px; }
		#algorithmDetail .failed_node { font-weight: 500; margin-bottom: -20px; }
		
		#algorithmDetail .default_train_d_num, .default_train_d_str, .default_inf_d_num, .default_inf_d_str { width: 143px !important; margin-left: 5px; padding-top: 11px !important; }
		#algorithmDetail .default_train_d_bool, .default_inf_d_bool { width: 165px !important; margin-left: 5px; }
		#algorithmDetail input[type='number']::-webkit-outer-spin-button,
		#algorithmDetail input[type='number']::-webkit-inner-spin-button { -webkit-appearance: none; appearance: none; margin: 0; margin-bottom: -1px; }
		#algorithmDetail input[type='number'] { height: 13px; }		
		
		#algorithmDetail .label .tooltip { left: 30px; }
	</style>
</head>
<body>
	<div class="container" id="algorithmDetail">
		<div class="min_w1440">
			<div class="contents">
				<form id="fileForm" enctype="multipart/form-data" method="POST">
					<div class="reg_wrap">
						<div class="reg_contents_wrap">
							<div class="title_d_wrap flex">
								<div>Detail Algorithm</div>
							</div>			
									
							<div class="title_d_input_wrap">
								<div class="label">
<!-- 									<span class="tooltip_span" data-tooltip-text="알고리즘의 제목을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.">Title</span> -->
									Title
									<span class="tooltip_wrap" data-tooltip-text="알고리즘의 제목을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다."></span>
<!-- 									<span class="tooltip_wrap"></span> -->
<!-- 									<span class="tooltip">알고리즘의 제목을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.</span> -->
								</div>
								<input class="title_d" name="title_d" type="text" data-length="100" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>
							</div>
							
							<div class="description_d_input_wrap">
								<div class="label">
<!-- 									<span class="tooltip_span"  data-tooltip-text="알고리즘의 설명을 입력해주세요. 한글과 영문 및 숫자, 특수기호 모두 입력 가능합니다.">Description</span> -->
									Description
									<span class="tooltip_wrap"  data-tooltip-text="알고리즘의 설명을 입력해주세요. 한글과 영문 및 숫자, 특수기호 모두 입력 가능합니다."></span>
<!-- 									<span class="tooltip_wrap"></span> -->
<!-- 									<span class="tooltip">알고리즘의 설명을 입력해주세요. 한글과 영문 및 숫자, 특수기호 모두 입력 가능합니다.</span> -->
								</div>
								<input class="description_d" name="description_d" type="text" data-length="200"/>
							</div>
							
							<div class="docker_img_d_wrap">
								<div class="label">
<!-- 									<span class="title_span tooltip_span" data-tooltip-text="알고리즘의 docker base image를 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.">Docker base image</span> -->
 <!-- 									<span class="btn_span"><label><input type="checkbox" name="isUserDef_d">user defined</label></span> --> 
									Docker base image
									<span class="title_span tooltip_wrap" data-tooltip-text="알고리즘의 docker base image를 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다."></span>
									
<!-- 									<span class="tooltip_wrap"></span> -->
<!-- 									<span class="tooltip">알고리즘의 docker base image를 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.</span> -->
								</div>
<!-- 								<select name="docker_image_d"> -->
<!-- 									<option value="">Select Docker base image</option> -->
<!-- 									<option value="option1">option1</option> -->
<!-- 									<option value="option2">option2</option> -->
<!-- 									<option value="option3">option3</option> -->
<!-- 								</select> -->
								<input class="user_docker_image_d" name="user_docker_image_d" type="text" data-length="200" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>
							</div>
							
							<div class="docker_cmd_d_wrap">
								<div class="label">
<!-- 									<span class="tooltip_span" data-tooltip-text="알고리즘의 docker file command를 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.">Docker File Command</span> -->
									Docker File Command
									<span class="tooltip_wrap" data-tooltip-text="알고리즘의 docker file command를 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다."></span>
									
<!-- 									<span class="tooltip_wrap"></span> -->
<!-- 									<span class="tooltip">알고리즘의 docker file command를 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.</span>									 -->
									<span class="add_docker_cmd_d">+</span>
								</div>
								<div class="clear"></div>
								<div class="docker_cmd_d_list_wrap">

								</div>														
							</div>			
							
							<div class="file_input_wrap">
								<div class="label">
<!-- 									<span class="tooltip_span" data-tooltip-text="알고리즘의 소스코드 파일을 첨부한 후, 해당 알고리즘의 객체 탐지 유형을 선택해주세요.">Algorithm Source code upload (ZIP)</span> -->
									Algorithm Source code upload (ZIP)			
									<span class="tooltip_wrap" data-tooltip-text="알고리즘의 소스코드 파일을 첨부한 후, 해당 알고리즘의 객체 탐지 유형을 선택해주세요."></span>
<!-- 					                <span class="tooltip_wrap"></span> -->
<!-- 					                <span class="tooltip">알고리즘의 소스코드 파일을 첨부한 후, 해당 알고리즘의 객체 탐지 유형을 선택해주세요.</span>									 -->
									<span class="file_span filter_color"><label for="upload_file_d">...</label></span>
								</div>
	
									<input id="upload_file_d" class="upload_file_d filter_color" accept="application/zip" type="file" name="upload_file_d" multiple/>
								<!-- <div class="add_btn fr"></div> -->
								<div class="clear"></div>
								<div class="file_list_wrap">
									
									<div class="list">
										<div class="item">
											<input class="fl file_name_d" type="text" name="file_name_d" disabled/>
											<div class="label_type_wrap">
<!-- 												<select name="label_type_d"> -->
<!-- 													<option value="">유형을 선택해주세요.</option> -->
<!-- 													<option value="0">Bounding Box</option> -->
<!-- 													<option value="1">Segmentation</option> -->
<!-- 												</select>												 -->
											</div>
											<!-- <div class="dlt_btn fl"></div> -->
											<div class="clear"></div>
										</div>
									</div>
								</div>
							</div>	
						
							<div class="train_fn_d_input_wrap">
								<div class="label">
									Train function name
<!-- 									<span class="tooltip_span" data-tooltip-text="알고리즘의 train function을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.">Train function name</span> -->
									<span class="tooltip_wrap" data-tooltip-text="알고리즘의 train function을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다."></span>
									
<!-- 									<span class="tooltip_wrap"></span> -->
<!-- 									<span class="tooltip">알고리즘의 train function을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.</span> -->
								</div>
								<!-- <div class="add_btn fr"></div> -->
								<div class="clear"></div>
								<div class="train_fn_d_list_wrap">
									
									<div class="list">
										<div class="item">
											<input class="train_fn_d" name="train_fn_d" class="fl" type="text" data-length="200" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>
											<!-- <div class="dlt_btn fl"></div> -->
											<div class="clear"></div>
										</div>
									</div>
								</div>
							</div>	
																	
							<div class="inf_init_fn_d_input_wrap">
								<div class="label">
<!-- 									<span class="tooltip_span" data-tooltip-text="알고리즘의 inference initialize function을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.">Inference Initialize function name</span> -->
									Inference Initialize function name
									<span class="tooltip_wrap" data-tooltip-text="알고리즘의 inference initialize function을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다."></span>

<!-- 									<span class="tooltip_wrap"></span> -->
<!-- 									<span class="tooltip">알고리즘의 inference initialize function을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.</span>								 -->
								</div>
								<!-- <div class="add_btn fr"></div> -->
								<div class="clear"></div>
								<div class="inf_init_fn_d_list_wrap">
									
									<div class="list">
										<div class="item">
											<input class="inf_init_fn_d" name="inf_init_fn_d" class="fl" type="text" data-length="200" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>
											<!-- <div class="dlt_btn fl"></div> -->
											<div class="clear"></div>
										</div>
									</div>
								</div>
							</div>																
							
							<div class="inf_fn_d_input_wrap">
								<div class="label">
<!-- 									<span class="tooltip_span" data-tooltip-text="알고리즘의 inference function을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.">Inference function name</span> -->
									Inference function name
									<span class="tooltip_wrap" data-tooltip-text="알고리즘의 inference function을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다."></span>

<!-- 									<span class="tooltip_wrap"></span> -->
<!-- 									<span class="tooltip">알고리즘의 inference function을 입력해주세요. 영문과 숫자, 특수기호만 입력 가능합니다.</span> -->
								</div>
								<!-- <div class="add_btn fr"></div> -->
								<div class="clear"></div>
								<div class="inf_fn_d_list_wrap">
									
									<div class="list">
										<div class="item">
											<input class="inf_fn_d" name="inf_fn_d" class="fl" type="text" data-length="200" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>
											<!-- <div class="dlt_btn fl"></div> -->
											<div class="clear"></div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="train_param_d_wrap">
								<div class="label">
<!-- 									<span class="tooltip_span" data-tooltip-text="알고리즘의 train hyperparameter의 이름과 설명, 타입과 기본값을 입력해주세요. 설명을 제외하고 영문과 숫자, 특수기호만 입력 가능합니다.">Define Training Hyperparameters</span> -->
									Define Training Hyperparameters
									<span class="tooltip_wrap" data-tooltip-text="알고리즘의 train hyperparameter의 이름과 설명, 타입과 기본값을 입력해주세요. 설명을 제외하고 영문과 숫자, 특수기호만 입력 가능합니다."></span>
<!-- 									<span class="tooltip_wrap"></span> -->
<!-- 									<span class="tooltip">알고리즘의 train hyperparameter의 이름과 설명, 타입과 기본값을 입력해주세요. 설명을 제외하고 영문과 숫자, 특수기호만 입력 가능합니다.</span> -->
									<span class="add_train_param_d">+</span>
								</div>
								<div class="clear"></div>
								<div class="train_param_d_list_wrap">
									
								</div>														
							</div>
							
							<div class="inference_param_d_wrap">
								<div class="label">
<!-- 									<span class="tooltip_span" data-tooltip-text="알고리즘의 inferenece hyperparameter의 이름과 설명, 타입과 기본값을 입력해주세요. 설명을 제외하고 영문과 숫자, 특수기호만 입력 가능합니다.">Define Inference Hyperparameters</span> -->
									Define Inference Parameters
									<span class="tooltip_wrap" data-tooltip-text="알고리즘의 inferenece parameter의 이름과 설명, 타입과 기본값을 입력해주세요. 설명을 제외하고 영문과 숫자, 특수기호만 입력 가능합니다."></span>
<!-- 									<span class="tooltip_wrap"></span> -->
<!-- 									<span class="tooltip">알고리즘의 inferenece hyperparameter의 이름과 설명, 타입과 기본값을 입력해주세요. 설명을 제외하고 영문과 숫자, 특수기호만 입력 가능합니다.</span> -->
									<span class="add_inf_param_d">+</span>
								</div>
								<div class="inference_param_d_list_wrap">
									
								</div>								
							</div>
												
						
							<div class="input_wrap">
								<div class="btn_wrap fr mt-38">
									<div class="delete_d filter_color">Delete</div>
									<div class="save_d filter_color">Save</div>
									<div class="deploy filter_color">Deploy</div>
								</div>
							</div>					
						
							<div class="deploy_error">
								<span class="log_close">&times;</span>
								<div class="label">Deploy Error Detail</div>

<!-- 								<textarea class="error_log" readonly></textarea> -->
								<div class="log_wrap">
									<pre>
										<div class="log_area"></div>
									</pre>
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
// 			alert("Please login to proceed");
// 			location.href = baseUrl + "login";
// 		} else {
			//algorithmDetail.init();
// 		}

	});

	var algorithmDetail = {
		pt : $("#algorithmDetail"),
		data : {
			algorithm_id : null,
		},
		init : function(id) {
			let that = algorithmDetail;
			that.data.algorithm_id = id;
			$("#loader").show();
 			that.resetView();
			that.getAlgorithmById(that.data.algorithm_id);
			that.addDefault(); 			
//  			that.deployAlgorithm(that.data.algorithm_id);
		},
		
		//맨처음 화면 리셋하는 함수
		resetView  : function(){
			let that = algorithmDetail;
			that.pt.find(':input').val("");
			that.bind();
			//that.listener();	
			$("#loader").hide();
			$(".deploy_error").removeClass("active");
// 			$(".deploy_error").draggable();				// jh.sa 수정 200617
		},
		
		// id에 해당하는 algorithm 정보 가져오기
		getAlgorithmById : function(id) {
			let that = algorithmDetail;		
			let ajaxData = {
				algorithm_id : id,
			}
			
			$("#loader").show()
			$.ajax({
				url : baseUrl + "algorithm/getAlgorithmById.json",
				data : ajaxData,
				type : "POST",
				success : function(res){
					console.log("=====getAlgorithmById=====", res);
					$("#loader").hide();
					if(res.result.code == "3301"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					}
					if(res.result.code == "200"){
						that.drawAlgorithmData(res.result.data);
					} else {
						alert(res.result.data);
					}
				},
				error : function(err){
					$("#loader").hide();
					console.log("ERROR!", err);
				}
			});
		},
		
		// algorithm 정보 그리기
 		drawAlgorithmData : function(data) {
			let that = algorithmDetail;
	
			//// title
			that.pt.find(".title_d").val(data.title).attr("title", data.title);
			// description_d
			that.pt.find(".description_d").val(data.description);
			//// docker base image 기본 옵션인 경우 select, 사용자 정의 옵션인 경우 text
			that.pt.find(".user_docker_image_d").val(data.base_image);	
// 			if(data.base_image == "option1" || data.base_image == "option2" || data.base_image == "option3") {
// 				that.pt.find("input[name='isUserDef_d']").attr("checked", false);
// 				that.pt.find(".user_docker_image_d").css({"display":"none"}).val("");
// 				that.pt.find("select[name='docker_image_d']").css({"display":"block"}).val(data.base_image);
// 			} else {
// 				that.pt.find("input[name='isUserDef_d']").attr("checked", true);
// 				that.pt.find("select[name='docker_image_d']").css({"display":"none"}).val("");
// 				that.pt.find(".user_docker_image_d").css({"display":"block"}).val(data.base_image);				
// 			}
			//// source code file
			that.pt.find(".file_name_d").val(data.upload_file);
			//// training, inference initialinze, inference function
			that.pt.find(".train_fn_d").val(data.train_func_name);
			that.pt.find(".inf_init_fn_d").val(data.load_func_name);
			that.pt.find(".inf_fn_d").val(data.inference_func_name);
			
			////docker file command line 
			let docker_cmd_d_j = JSON.parse(data.docker_cmd);
			let dockerCmdDataTarget = that.pt.find(".docker_cmd_d_list_wrap");

			
			console.log("docker_cmd_d json parse : ", docker_cmd_d_j);
			//console.log("docker_cmd_d_j length : ", docker_cmd_d_j.length);

			$(dockerCmdDataTarget).html("");
			
			for(let i=0; i < docker_cmd_d_j.length; i++){
				let html = "";
				
				html += '<div class="list">';
				html += '<div class="item">';
				html += '<input class="docker_cmd_d" name="docker_cmd_d" type="text" value="'+docker_cmd_d_j[i].name+'"/>';
				html += '<select name="type_docker_cmd_d" id="docker_cmd_d'+i+'">';
				html += '<option value="">Type</option>';
				html += '<option value="RUN">RUN</option>';
				html += '<option value="ENV">ENV</option>';
				html += '<option value="WORKDIR">WORKDIR</option>';
				html += '</select>';
				html += '<span class="del_docker_cmd_d" id="del_docker_btn'+i+'">-</span>';
				html += '</div>';
				html += '</div>';
				
				$(dockerCmdDataTarget).append(html);
				
				// 삭제 버튼
				let eventTarget = that.pt.find(".del_docker_cmd_d");
				for (let i = 0; i < eventTarget.length; i++){
					eventTarget[i].addEventListener("click", function(){
						let parent = that.pt.find("docker_cmd_d_list_wrap");
						$(this).parent().parent().remove();
					});
				}				
				
				// 불러온 옵션값과 값은 값을 가진 옵션일 경우 selected 처리 
				let docker_type = docker_cmd_d_j[i].type;
				let opt = that.pt.find("#docker_cmd_d"+i).children("option");
				//console.log("docker_type:::", docker_type);
				//console.log("opt:::", opt);
				
				for(let j=0; j < opt.length; j++){
					if(opt[j].value == docker_type) {
						//console.log("opt[j].value:::",opt[j].value);
						opt[j].selected = true;
						break;
					}
				}
				that.listener();	
			};
			
			//// jh.sa 객체 탐지 유형 추가
			let label_type_d = data.label_type;
			let label_type_target = that.pt.find(".file_list_wrap .label_type_wrap");
			
			$(label_type_target).html("");
				let html = "";
				
				html += "<select name='label_type_d'>";
				html += "<option value='' data-value=''>유형을 선택해 주세요.</option>";
				html += "<option value='IMAGE_BBOX' data-value='IMAGE_BBOX'>Image Bounding Box</option>";
				html += "<option value='IMAGE_SEGMENTATION' data-value='IMAGE_SEGMENTATION'>세그멘테이션</option>";
				html += "<option value='VIDEO_BBOX' data-value='VIDEO_BBOX'>Video Bounding Box</option>";	
// 				html += "<option value='box'>Bounding Box</option>";
// 				html += "<option value='polygon'>Segmentation</option>";
				html += "</select>";
				
				$(label_type_target).append(html);
				
				let selected_label_type = label_type_d;
				let opt = that.pt.find("select[name='label_type_d']").children("option");
				
				for(let j = 0; j < opt.length; j++){
					if(opt[j].value == selected_label_type) {
						opt[j].selected = true;
						break;
					}
				};
			
			////train hyperparameters
			let train_param_d_j = JSON.parse(data.train_param);
			let trainParamDataTarget = that.pt.find(".train_param_d_list_wrap");
			console.log("train_param_d json parse : ", train_param_d_j);
			$(trainParamDataTarget).html("");
			
			for(let i=0; i < train_param_d_j.length; i++){
				let train_value = train_param_d_j[Object.keys(train_param_d_j)[i]];
				let html = "";
				
				html += '<div class="list">';
				html += '<div class="item">';
				html += '<input class="train_param_d" name="train_param_d" type="text" value="'+train_param_d_j[i].param+'" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/>';
				html += '<input class="train_param_d_help" name="train_param_d_help" type="text" value="'+train_param_d_j[i].helper+'"/>';				
				html += '<select name="type_train_param_d" id="train_param_d'+i+'">';
				html += '<option value="">Type</option>';
				html += '<option value="number">Number</option>';
				html += '<option value="boolean">Boolean</option>';
				html += '<option value="string">String</option>';
				html += '</select>';
				if(train_param_d_j[i].type == "string") {
					html += '<input type="text" class="default_train_d_str" value="'+train_param_d_j[i].defaultvalue+'" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/>';
				} else if (train_param_d_j[i].type == "number") {
					html += '<input type="number" class="default_train_d_num" value="'+train_param_d_j[i].defaultvalue+'" onKeyPress="return checkNum(event);"/>';
				} else if (train_param_d_j[i].type == "boolean") {
					html += '<select id="default_train_d_bool'+i+'" class="default_train_d_bool"><option value="">Default boolean value</option><option value="true">True</option><option value="false">False</option></select>';
				}	
				html += '<span class="del_train_param_d" id="del_train_btn'+i+'">-</span>';
				html += '</div>';
				html += '</div>';
				
				$(trainParamDataTarget).append(html);
				that.addDefault();
				
				// 삭제 버튼
				let eventTarget = that.pt.find(".del_train_param_d");
				for (let i = 0; i < eventTarget.length; i++){
					eventTarget[i].addEventListener("click", function(){
						let parent = that.pt.find(".train_param_d_list_wrap");
						$(this).parent().parent().remove();
					});
				}	
				// 불러온 옵션값과 값은 값을 가진 옵션일 경우 selected 처리 
				let train_type = train_param_d_j[i].type;
				let opt = that.pt.find("#train_param_d"+i).children("option");
				
				for(let j=0; j < opt.length; j++){
					if(opt[j].value == train_type){
						opt[j].selected = true;
						break;
					}
				}
				
				let train_value_bool = train_param_d_j[i].defaultvalue;
				let opt_bool = that.pt.find("#default_train_d_bool"+i).children("option");
				
				for(let j=0; j < opt_bool.length; j++) {
					if(train_value_bool === true){
						opt_bool[1].selected = true;
						break;
					} else {
						opt_bool[2].selected = true;
						break;
					}
				}
			};
			
			
			////inference hyperparameters
			let inference_param_d_j = JSON.parse(data.inference_param);
			let infParamDataTarget = that.pt.find(".inference_param_d_list_wrap");
			console.log("inference_param_d json parse : ", inference_param_d_j);
			$(infParamDataTarget).html("");
			
			for(let i=0; i < inference_param_d_j.length; i++){
				let html = "";
				
				html += '<div class="list">';
				html += '<div class="item">';
				html += '<input class="inference_param_d" name="inference_param_d" type="text" value="'+inference_param_d_j[i].param+'" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/>';
				html += '<input class="inf_param_d_help" name="inf_param_d_help" type="text" value="'+inference_param_d_j[i].helper+'"/>';				
				html += '<select name="type_inference_param_d" id="inference_param_d'+i+'">';
				html += '<option value="">Type</option>';
				html += '<option value="number">Number</option>';
				html += '<option value="boolean">Boolean</option>';
				html += '<option value="string">String</option>';
				html += '</select>';
				if(inference_param_d_j[i].type == "string") {
					html += '<input type="text" class="default_inf_d_str" value="'+inference_param_d_j[i].defaultvalue+'"/>';
				} else if (inference_param_d_j[i].type == "number") {
					html += '<input type="number" class="default_inf_d_num" value="'+inference_param_d_j[i].defaultvalue+'" onKeyPress="return checkNum(event);"/>';
				} else if (inference_param_d_j[i].type == "boolean") {
					html += '<select id="default_inf_d_bool'+i+'" class="default_inf_d_bool"><option value="">Default boolean value</option><option value="true">True</option><option value="false">False</option></select>';
				}				
				html += '<span class="del_inf_param_d" id="del_inf_btn'+i+'">-</span>';				
				html += '</div>';
				html += '</div>';
				
				$(infParamDataTarget).append(html);
				that.addDefault();
				
				// 삭제 버튼
				let eventTarget = that.pt.find(".del_inf_param_d");
				for (let i = 0; i < eventTarget.length; i++){
					eventTarget[i].addEventListener("click", function(){
						let parent = that.pt.find(".inference_param_d_list_wrap");
						$(this).parent().parent().remove();
					});
				}				
				
				// 불러온 옵션값과 값은 값을 가진 옵션일 경우 selected 처리 
				let inference_type = inference_param_d_j[i].type;
				let opt = that.pt.find("#inference_param_d"+i).children("option");
				
				for(let j=0; j < opt.length; j++){
					if(opt[j].value == inference_type) {
						opt[j].selected = true;
						break;
					}
				}
				let inf_value_bool = inference_param_d_j[i].defaultvalue;
				let opt_bool = that.pt.find("#default_inf_d_bool"+i).children("option");
				
				for(let j=0; j < opt_bool.length; j++) {
					if(inf_value_bool === true){
						opt_bool[1].selected = true;
						break;
					} else {
						opt_bool[2].selected = true;
						break;
					}
				}				
			};
			
		},
		
		//input 데이터 체크 
		listener : function(){
			let that = algorithmDetail;

			$("input").off("input").on("input",function(e){
				//영문, 숫자, 특수문자
				if($(this).hasClass("description_d") || $(this).hasClass("train_param_d_help") || $(this).hasClass("inf_param_d_help")) {
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
// 			let chk_d = $("#algorithmDetail").find("input:checkbox[name='isUserDef_d']");
// 			chk_d.off("change").on("change",function(e){
// 				if(chk_d.is(":checked")) {
// 					$("#algorithmDetail").find("select[name='docker_image_d']").css({ "display" : "none" })
// 					$("#algorithmDetail").find(".user_docker_image_d").css({ "display": "block" });
// 				} else {
// 					$("#algorithmDetail").find("select[name='docker_image_d']").css({ "display" : "block" });
// 					$("#algorithmDetail").find(".user_docker_image_d").css({"display": "none"});
// 				}				
// 			});

			
			// Docker base image 체크박스 선택 시 select 비활성화 및 사용자 정의 입력창 보이기
/* 			$("input:checkbox[name='isUserDef_d']").click(function(){
				let chk = $("input:checkbox[name='isUserDef_d']").is(':checked');
				if(chk) {
					$("select[name='docker_image_d']").css({ "display" : "none" })
					$(".user_docker_image_d").css({ "display": "block" });
				} else {
					$("select[name='docker_image_d']").css({ "display" : "block" });
					$(".user_docker_image_d").css({"display": "none"});
				}
			}); */
			
			// 저장
 			$("#algorithmDetail").find(".save_d").off("click").on("click", function(){
 				//that.bind();
				event.preventDefault();
// 				let chk = $("#algorithmDetail").find("input:checkbox[name='isUserDef_d']").is(":checked");
				//console.log("that:",that);

				let title = $("#algorithmDetail").find("input[name='title_d']").val();
				let description_d = $("#algorithmDetail").find("input[name='description_d']").val();
				let base_image = "";
// 				if(chk) base_image = $("#algorithmDetail").find("input[name='user_docker_image_d']").val(); 
// 				else base_image = $("#algorithmDetail").find("select[name='docker_image_d']").val(); 
					base_image = $("#algorithmDetail").find("input[name='user_docker_image_d']").val(); 
				let docker_cmd_d = $("#algorithmDetail").find("input[name='docker_cmd_d']").val();
				let type_docker_cmd_d = $("#algorithmDetail").find("select[name='type_docker_cmd_d']").val();
				let upload_file = $("#algorithmDetail").find("input[name='upload_file_d']").val();
				let label_type_d = that.pt.find("select[name='label_type_d']").val();				// jh.sa 객체 탐지 유형 추가
				let train_func_name = $("#algorithmDetail").find("input[name='train_fn_d']").val();
				let load_func_name = $("#algorithmDetail").find("input[name='inf_init_fn_d']").val();
				let inference_func_name = $("#algorithmDetail").find("input[name='inf_fn_d']").val();
				let train_param_d = $("#algorithmDetail").find("input[name='train_param_d']").val();
				let type_train_param_d = $("#algorithmDetail").find("select[name='type_train_param_d']").val();
				let inference_param_d = $("#algorithmDetail").find("input[name='inference_param_d']").val();
				let type_inference_param_d = $("#algorithmDetail").find("select[name='type_inference_param_d']").val();
				
				// environment JSON array
				let docker_cmd_d_array = new Array();
				let docker_cmd_d_obj_length = $(".docker_cmd_d_list_wrap > .list").length;
				
				for(let i=0; i < docker_cmd_d_obj_length; i++){
					let name_val = that.pt.find("input[name='docker_cmd_d']")[i].value;
					let type_val = that.pt.find("select[name='type_docker_cmd_d']")[i].value
					if(name_val == "" || type_val == ""){
						alert("Docker File Command의 항목을 모두 채워주세요");
						return false;
					} else {
						let docker_cmd_d_obj = { "name" : name_val, "type" : type_val };
						docker_cmd_d_array.push(docker_cmd_d_obj);						
					}
				};
				
				console.log("docker_cmd_d_array : ", docker_cmd_d_array);
				let s_docker_cmd_d = JSON.stringify(docker_cmd_d_array);
				
				// train_param_d JSON array
				let train_param_d_array = new Array();
				let train_param_d_obj_length = $(".train_param_d_list_wrap > .list").length;
				
 				for(let i=0; i < train_param_d_obj_length; i++){
 					let type = that.pt.find("select[name='type_train_param_d']")[i].value;
 					let default_value = that.pt.find("select[name='type_train_param_d']")[i].nextElementSibling.value;
					let helper = that.pt.find("input[name='train_param_d_help']")[i].value;
					let param = that.pt.find("input[name='train_param_d']")[i].value;
 					let default_val_res;
					if(type == "" || default_value == "" || param == "" || helper == ""){
						alert("Define Training Hyperparameters의 항목을 모두 채워주세요");
						return false;
					} else {
	 					if(type == "string") {
							default_val_res = that.pt.find("select[name='type_train_param_d']")[i].nextElementSibling.value 
						} else if (type == "number") {
							default_val_res = that.pt.find("select[name='type_train_param_d']")[i].nextElementSibling.value  * 1
						} else if (type == "boolean") {
							if(default_value == "true") {
								default_val_res = true;
							} else {
								default_val_res = false;
							}
						};
						
	 					let train_param_d_obj = { 
								"param" : param, 
								"type" : type, 
								"helper" : helper, 
								"defaultvalue" : default_val_res
								};
						train_param_d_array.push(train_param_d_obj);						
					}

 				};
				
				console.log("train_param_d_array : ", train_param_d_array);
				let s_train_param_d = JSON.stringify(train_param_d_array); 
				
				// inference_param_d JSON array
				let inference_param_d_array = new Array();
				let inference_param_d_obj_length = $(".inference_param_d_list_wrap > .list").length;
				
				for(let i=0; i < inference_param_d_obj_length; i++){
 					let type = that.pt.find("select[name='type_inference_param_d']")[i].value 
 					let default_value = that.pt.find("select[name='type_inference_param_d']")[i].nextElementSibling.value;
					let helper = that.pt.find("input[name='inf_param_d_help']")[i].value;
					let param = that.pt.find("input[name='inference_param_d']")[i].value;
 					let default_val_res;
					if(type == "" || default_value == "" || param == "" || helper == ""){
						alert("Define Inference Hyperparameters의 항목을 모두 채워주세요");
						return false;
					} else {
	 					if(type == "string") {
							default_val_res = that.pt.find("select[name='type_inference_param_d']")[i].nextElementSibling.value 
						} else if (type == "number") {
							default_val_res = that.pt.find("select[name='type_inference_param_d']")[i].nextElementSibling.value  * 1
						} else if (type == "boolean") {
							if(default_value == "true") {
								default_val_res = true;
							} else {
								default_val_res = false;
							}
						};					
						let inference_param_d_obj = {
								"param" : param, 
								"type" : type, 
								"helper" : helper, 
								"defaultvalue" : default_val_res
								};
						inference_param_d_array.push(inference_param_d_obj);						
					}

				};
				
				console.log("inference_param_d_array : ", inference_param_d_array);
				let s_inference_param_d = JSON.stringify(inference_param_d_array);
				
				// 빈 값 검사
				if(title == ""){
				 	alert("Title을 입력해주세요.");
				 	that.pt.find("input[name='title_d']").focus();
				 	return;
				}
				
				if(description_d == ""){
				 	alert("Descripton을 입력해주세요.");
				 	that.pt.find("input[name='description_d']").focus();
				 	return;
				} 
				
// 				if(base_image == ""){
// 					if(chk) {
// 						alert("Docker base image를 등록해주세요.");
// 						that.pt.find("input[name='user_docker_image_d']").focus();
// 						return;						
// 					} else {
// 						alert("Docker base image를 선택해주세요.");
// 						that.pt.find("select[name='docker_image_d']").focus();
// 						return;						
// 					}
// 				}
				
				if(base_image == ""){
					alert("Docker base image를 등록해주세요.");
					that.pt.find("input[name='user_docker_image_d']").focus();
					return;						
				}				

				if(docker_cmd_d == "" || docker_cmd_d == undefined){
					alert("Docker File Command를 등록해주세요.");
					that.pt.find("input[name='docker_cmd_d']").focus();
					return;
				} 
				
				if(type_docker_cmd_d == ""){
					alert("Docker File Command의 Type을 선택해주세요.");
					that.pt.find("select[name='type_docker_cmd_d']").focus();
					return;
				}

 				if(upload_file == ""){
 					alert("Algorithm Source code를 ZIP파일 형식으로 첨부해주세요.");
					that.pt.find("input[name='file_name_d']").focus();
					return;
				} 
				
				if(label_type_d == ""){							// jh.sa 객체 탐지 유형 추가
					alert("객체 탐지 유형을 선택해주세요");
					that.pt.find("select[name='label_type_d']").focus();
					return;
				}  				
 				
				if(train_func_name == ""){
					alert("Train function name 을 입력해주세요");
					that.pt.find("input[name='train_fn_d']").focus();
					return;
				}
				
				if(load_func_name == ""){
					alert("Inference initialize function name을 입력해주세요");
					that.pt.find("input[name='inf_init_fn_d']").focus();
					return;
				}
				
				if(inference_func_name == ""){
					alert("Inference function name을 입력해주세요.");
					that.pt.find("input[name='inf_fn_d']").focus();
					return;
				}	
				
				if(train_param_d == "" || train_param_d == undefined){
					alert("Define Training Hyperparameters를 등록해주세요.");
					that.pt.find("input[name='train_param_d']").focus();
					return;
				}	

				if(type_train_param_d == ""){
					alert("Define Training Hyperparameters의 Type을 선택해주세요.");
					that.pt.find("select[name='type_train_param_d']").focus();
					return;
				}			
				
				if(inference_param_d == "" || inference_param_d == undefined){
					alert("Define Inference Hyperparameters를 등록해주세요.");
					that.pt.find("input[name='inference_param_d']").focus();
					return;
				}				
				
				if(type_inference_param_d == ""){
					alert("Define Inference Hyperparameters의 Type을 선택해주세요.");
					that.pt.find("select[name='type_inference_param_d']").focus();
					return;
				}			
				
				let formData = new FormData();
				
// 				console.log("upload_file that????? : ", that);
// 				console.log("upload_file y/n", that.pt.find("input[name='upload_file_d']")[0].files[0]);
// 				console.log("upload_file y/n2222", that.pt.find("input[name='upload_file_d']").val());
				
				formData.append("algorithm_id", that.data.algorithm_id);
				formData.append("upload_file", that.pt.find("input[name='upload_file_d']")[0].files[0]);
				formData.append("title", that.pt.find("input[name='title_d']").val());
				formData.append("description", that.pt.find("input[name='description_d']").val());
				formData.append("docker_cmd", s_docker_cmd_d);
				formData.append("train_param", s_train_param_d);
				formData.append("inference_param", s_inference_param_d);
				formData.append("base_image", base_image);
				formData.append("train_func_name", that.pt.find("input[name='train_fn_d']").val());
				formData.append("load_func_name", that.pt.find("input[name='inf_init_fn_d']").val());
				formData.append("inference_func_name", that.pt.find("input[name='inf_fn_d']").val());
// 				formData.append("label_type", label_type_d);					 		// jh.sa 객체 탐지 유형 추가

				
				for(var pair of formData.entries()){
					console.log(pair[0] + ',' + pair[1]);
				};
				
				$("#loader").show();
				$.ajax({
					url : baseUrl + "algorithm/updateAlgorithm.json",
					data : formData,
					type : "POST",
					processData : false,
					contentType: false,
					success : function(res) {
						$("#loader").hide();
						
						console.log("=====updateAlgorithm=====", res);
						if(res.result.code == "3301"){
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} 
						
						if (res.result.code == "200") {

/* 							let agent = navigator.userAgent.toLowerCase();
							let attachFile = $("input[name='upload_file_d']");
							
							if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
							    // ie 일때 input[type=file] init.
							    $(attachFile).replaceWith( $(attachFile).clone(true) );
							    $(".file_name_d").val("");
							} else {
							    //other browser 일때 input[type=file] init.
							    $(attachFile).val("");
							    $(".file_name_d").val("");
							}; */
							
							alert("알고리즘 수정이 완료되었습니다.");
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
// 						alert("ERROR!! error code : " + err.status);
					}
				});
			}); 
			
			that.pt.find(".delete_d").off("click").on("click", function(e) {
				let msg = "해당 알고리즘의 설정 값과 해당 알고리즘으로 생성된 모든 task 데이터가 \n삭제됩니다. 계속하시겠습니까?";
				if(confirm(msg)==true){
					let id = that.data.algorithm_id;
					console.log("algorithm_id : ", id);
					if(id == "1" || id == "2" || id == "3"){
						alert("기본으로 제공되는 알고리즘은 삭제하실 수 없습니다.");
						return false;						
					} else {
						that.deleteAlgorithm(id);
					}
				} else {
					return false;
				};
			});
			
			that.pt.find(".deploy").off("click").on("click", function() {
				let id = that.data.algorithm_id;
				that.deployAlgorithm(id);
			});
			
			that.pt.find(".tooltip_wrap").off("mouseover").on("mouseover", function() {
                let tooltip = $(this).next(".tooltip");
                let target_top = $(this).offset().top;
                tooltip.css("top",target_top-39);
                tooltip.toggleClass("on");
                
            });
			
			that.pt.find(".tooltip_wrap").off("mouseout").on("mouseout", function() {
                let tooltip = $(this).next(".tooltip");
                tooltip.removeClass("on");						
            });		
			
		},
		
		deployAlgorithm: function(id) {
			let that = algorithmDetail;
		
// 			that.pt.find(".deploy").off("click").on("click", function() {
				
				let deploy_confirm = confirm("알고리즘 배포가 시작됩니다. 시간이 오래 걸릴 수 있습니다. 계속하시겠습니까?");
				if(deploy_confirm) {
					
					let ajaxData = {
							algorithm_id : id
						};
					
					console.log("ajaxData:", ajaxData);
					$("#loader").show();
					$.ajax({
						url : baseUrl + "algorithm/deployAlgorithm.json",
						data : ajaxData,
						type : "POST",
						success : function(res) {
							console.log("=====deployAlgorithm=====", res);
							$("#loader").hide();
							if(res.result.code == "3301"){
								alert(res.result.data);
								location.href = baseUrl + 'login';
							} 
							if(res.result.code == "200") {
								alert("알고리즘 배포가 완료되었습니다.");
								algorithmList.init();
								algorithmList.hideView();
								algorithmList.main();
							} else {
								alert(res.result.data);
								$(".deploy_error").addClass("active");
								that.drawDeployResult(res.result.data);
								that.pt.animate({scrollTop:0},500);
							}
						},
						error : function(err) {
							$("#loader").hide();
							console.log("ERROR!!", err);
							alert("관리자에게 문의 부탁드립니다.");
// 							$(".deploy_error").addClass("active");
//    						that.drawDeployResult(err.responseText);
// 							that.drawDeployResult();
							that.pt.animate({scrollTop:0},500);							
						}
						
					});
					
				} else {
					alert("작업이 취소되었습니다.");
				};
				

				
// 			});
		},
		
		deleteAlgorithm : function(id) {
			let that = this;
			if (id === null) {
				alert("알고리즘이 존재하지 않습니다.");
				return;
			}
				
				let ajaxData = {
						algorithm_id : id
					};
				$("#loader").show();
					$.ajax({
						url : baseUrl + "algorithm/deleteAlgorithm.json",
						data : ajaxData,
						success : function(res) {
							console.log("=====deleteAlgorithm=====", res);
							$("#loader").hide();
							if(res.result.code == "3301"){
								alert(res.result.data);
								location.href = baseUrl + 'login';
							} 							
							if(res.result.code == "200"){
								alert(res.result.data);
								algorithmList.init();
								algorithmList.hideView();
								algorithmList.main();
							} else {
								alert(res.result.data);
								console.log("Algorithm Delete Failed.");
							}
						},
						error : function(err){
							$("#loader").hide();
							console.log("deleteAlgorithm ERROR!!", err);
						}
						
					});		
		},
		
		
/* 		updateAlgorithm: function(t, c) {
			let that = this;

			let ajaxData = {
				id : that.data.algorithm_id,
				title : t,
				contents : c
			}

			$.ajax({
				url : baseUrl + "project/updateProject.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("=====updateProject=====", res);
					if (res.result.code == "200") {
						//algorithm.refreshProject();
						algorithm.hideView();
						algorithm.main();
					}
					
					alert(res.result.data);
					$("#loader").hide();
				},
				error : function(err) {
					$("#loader").hide();
					console.log("ERROR!!", err);
				}
			});
		}, */
		
		bind : function() {			
			let that = algorithmDetail;
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
			
			$("#algorithmDetail").find(".upload_file_d").on("change", function(e){
				let file = e.target.files[0];
				//console.log("mod this:::", $(this));
				//alert("The file is uploaded");
				if(typeof file === "undefined"){
					$(this).parent().find(".file_name_d").val("");
					return;
				}
				let name = file.name;
				//console.log("name ::", name);
				//console.log("$(this).parent().find('.file_name_d')  :: ", $(this).parent().find(".file_name_d"));
				
				// 파일명에 한글 사용 불가 및 한글 사용 시 파일 데이터 받지 않음
				if(name.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
					document.getElementById("upload_file_d").value="";
				} else {
					$(this).parent().find(".file_name_d").attr("disabled","disabled").val(name);
				}
			});
			
			// 환경설정 추가 (env, pip_instsall, apt_install 통합)
			let add_docker_cmd_d = that.pt.find(".add_docker_cmd_d");
			let dockerCmdTarget = that.pt.find(".docker_cmd_d_list_wrap");
			$(dockerCmdTarget).html("");
			
			add_docker_cmd_d.off("click").on("click", function() {
				let html = "";
				html += '<div class="list">';
				html += '<div class="item">';
				html += '<input class="docker_cmd_d" name="docker_cmd_d" type="text" placeholder="Please enter the docker command line"/> ';
				html += '<select name="type_docker_cmd_d">';
				html += '<option value="">Type</option>';
				html += '<option value="RUN">RUN</option>';
				html += '<option value="ENV">ENV</option>';
				html += '<option value="WORKDIR">WORKDIR</option>';
				html += '</select>';
				html += '<span class="del_docker_cmd_d">-</span>';
				html += '</div>';
				html += '</div>';
				
				$(dockerCmdTarget).append(html);
				
				// 삭제 버튼
				let eventTarget = that.pt.find(".del_docker_cmd_d");
				for (let i = 0; i < eventTarget.length; i++){
					eventTarget[i].addEventListener("click", function(){
						let parent = that.pt.find("docker_cmd_d_list_wrap");
						$(this).parent().parent().remove();
					});
				}		
				
				$("input").off("input").on("input",function(e){
					//영문, 숫자, 특수문자
					if($(this).hasClass("description_d") || $(this).hasClass("train_param_d_help") || $(this).hasClass("inf_param_d_help")) {
					
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

			// 학습 하이퍼파라미터 추가
			let add_train_param_d = that.pt.find(".add_train_param_d");
			let trainParamTarget = that.pt.find(".train_param_d_list_wrap");
			$(trainParamTarget).html("");
			
			add_train_param_d.off("click").on("click", function() {
				let html = "";
				html += '<div class="list">';
				html += '<div class="item">';
				html += '<input class="train_param_d" name="train_param_d" type="text" placeholder="Parameter name" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/> ';
				html += '<input class="train_param_d_help" name="train_param_d_help" type="text" placeholder="Description of parameter"/>';				
				html += '<select name="type_train_param_d">';
				html += '<option value="">Type</option>';
				html += '<option value="number">Number</option>';
				html += '<option value="boolean">Boolean</option>';
				html += '<option value="string">String</option>';
				html += '</select>';
				html += '<span class="del_train_param_d">-</span>';
				html += '</div>';
				html += '</div>';
				
				$(trainParamTarget).append(html);
				that.addDefault();
						
				// 삭제 버튼
				let eventTarget = that.pt.find(".del_train_param_d");
				for (let i = 0; i < eventTarget.length; i++){
					eventTarget[i].addEventListener("click", function(){
						let parent = that.pt.find("train_param_d_list_wrap");
						$(this).parent().parent().remove();
					});
				}		
				
				$("input").off("input").on("input",function(e){
					//영문, 숫자, 특수문자
					if($(this).hasClass("description_d") || $(this).hasClass("train_param_d_help") || $(this).hasClass("inf_param_d_help")) {
					
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
			
			
			// 참조 하이퍼파라미터 추가
			let add_inf_param_d = that.pt.find(".add_inf_param_d");
			let infParamTarget = that.pt.find(".inference_param_d_list_wrap");
			$(infParamTarget).html("");
			
			add_inf_param_d.off("click").on("click", function() {
				let html = "";
				html += '<div class="list">';
				html += '<div class="item">';
				html += '<input class="inference_param_d" name="inference_param_d" type="text" placeholder="Parameter name" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/> ';
				html += '<input class="inf_param_d_help" name="inf_param_d_help" type="text" placeholder="Description of parameter"/>';								
				html += '<select name="type_inference_param_d">';
				html += '<option value="">Type</option>';
				html += '<option value="number">Number</option>';
				html += '<option value="boolean">Boolean</option>';
				html += '<option value="string">String</option>';
				html += '</select>';
				html += '<span class="del_inf_param_d">-</span>';
				html += '</div>';
				html += '</div>';
				
				$(infParamTarget).append(html);
				that.addDefault();
				
				// 삭제 버튼
				let eventTarget = that.pt.find(".del_inf_param_d");
				for (let i = 0; i < eventTarget.length; i++){
					eventTarget[i].addEventListener("click", function(){
						let parent = that.pt.find("inference_param_d_list_wrap");
						$(this).parent().parent().remove();
					});
				}		
				
				$("input").off("input").on("input",function(e){
					//영문, 숫자, 특수문자
					if($(this).hasClass("description_d") || $(this).hasClass("train_param_d_help") || $(this).hasClass("inf_param_d_help")) {
					
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
			
		},
		
		drawDeployResult : function(data) {
			let that = algorithmDetail;
			let log_target = that.pt.find(".log_wrap .log_area");
// 			let log_target = that.pt.find(".error_log");
			log_target.html("");
 			log_target[0].value = "";
 			let text = "";
  			let deploy_res = data;
// 			let deploy_res = {"192.168.1.63":"This node failed to docker image build. ERR Message:Process exited with status 127 Contents:##Sending build context to Docker daemon  216.7MB\r\r\nStep 1/10 : FROM tensorflow/tensorflow:1.15.2-gpu-py3\n ---\u003e 182b13b4a8e6\nStep 2/10 : ENV DEBIAN_FRONTEND noninteractive\n ---\u003e Running in eae04f0271d3\nRemoving intermediate container eae04f0271d3\n ---\u003e 6fe6140d7d12\nStep 3/10 : ADD ./src/. /workspace/model\n ---\u003e a2f25b31c4f6\nStep 4/10 : ADD ./server/. /workspace/server\n ---\u003e a20f3bedfdac\nStep 5/10 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH\n ---\u003e Running in 2a1907066382\nRemoving intermediate container 2a1907066382\n ---\u003e 5a211fce19be\nStep 6/10 : RUN apt-get update\n ---\u003e Running in 681553bf8839\nIgn:1 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  InRelease\nHit:2 http://archive.ubuntu.com/ubuntu bionic InRelease\nIgn:3 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  InRelease\nGet:4 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Release [564 B]\nGet:5 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]\nGet:6 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]\nGet:7 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Release [564 B]\nGet:8 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Release.gpg [819 B]\nGet:9 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Release.gpg [833 B]\nGet:10 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages [141 kB]\nGet:11 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64","192.168.1.65":"This node failed to docker image build. ERR Message:Process exited with status 127 Contents:##Sending build context to Docker daemon  216.7MB\r\r\nStep 1/10 : FROM tensorflow/tensorflow:1.15.2-gpu-py3\n ---\u003e 182b13b4a8e6\nStep 2/10 : ENV DEBIAN_FRONTEND noninteractive\n ---\u003e Running in eae04f0271d3\nRemoving intermediate container eae04f0271d3\n ---\u003e 6fe6140d7d12\nStep 3/10 : ADD ./src/. /workspace/model\n ---\u003e a2f25b31c4f6\nStep 4/10 : ADD ./server/. /workspace/server\n ---\u003e a20f3bedfdac\nStep 5/10 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH\n ---\u003e Running in 2a1907066382\nRemoving intermediate container 2a1907066382\n ---\u003e 5a211fce19be\nStep 6/10 : RUN apt-get update\n ---\u003e Running in 681553bf8839\nIgn:1 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  InRelease\nHit:2 http://archive.ubuntu.com/ubuntu bionic InRelease\nIgn:3 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  InRelease\nGet:4 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Release [564 B]\nGet:5 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]\nGet:6 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]\nGet:7 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Release [564 B]\nGet:8 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Release.gpg [819 B]\nGet:9 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Release.gpg [833 B]\nGet:10 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages [141 kB]\nGet:11 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64"};  
//  			let deploy_res = '{"192.168.1.63":"This node failed to docker image build. ERR Message:Process exited with status 127 Contents:##Sending build context to Docker daemon  216.7MB\\r\\nStep 1/10 : FROM tensorflow/tensorflow:1.15.2-gpu-py3\\n ---\u003e 182b13b4a8e6\nStep 2/10 : ENV DEBIAN_FRONTEND noninteractive\n ---\u003e Running in eae04f0271d3\nRemoving intermediate container eae04f0271d3\n ---\u003e 6fe6140d7d12\nStep 3/10 : ADD ./src/. /workspace/model\n ---\u003e a2f25b31c4f6\nStep 4/10 : ADD ./server/. /workspace/server\n ---\u003e a20f3bedfdac\nStep 5/10 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH\n ---\u003e Running in 2a1907066382\nRemoving intermediate container 2a1907066382\n ---\u003e 5a211fce19be\nStep 6/10 : RUN apt-get update\n ---\u003e Running in 681553bf8839\nIgn:1 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  InRelease\nHit:2 http://archive.ubuntu.com/ubuntu bionic InRelease\nIgn:3 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  InRelease\nGet:4 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Release [564 B]\nGet:5 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]\nGet:6 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]\nGet:7 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Release [564 B]\nGet:8 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Release.gpg [819 B]\nGet:9 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Release.gpg [833 B]\nGet:10 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages [141 kB]\nGet:11 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64","192.168.1.65":"This node failed to docker image build. ERR Message:Process exited with status 127 Contents:##Sending build context to Docker daemon  216.7MB\r\r\nStep 1/10 : FROM tensorflow/tensorflow:1.15.2-gpu-py3\n ---\u003e 182b13b4a8e6\nStep 2/10 : ENV DEBIAN_FRONTEND noninteractive\n ---\u003e Running in eae04f0271d3\nRemoving intermediate container eae04f0271d3\n ---\u003e 6fe6140d7d12\nStep 3/10 : ADD ./src/. /workspace/model\n ---\u003e a2f25b31c4f6\nStep 4/10 : ADD ./server/. /workspace/server\n ---\u003e a20f3bedfdac\nStep 5/10 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH\n ---\u003e Running in 2a1907066382\nRemoving intermediate container 2a1907066382\n ---\u003e 5a211fce19be\nStep 6/10 : RUN apt-get update\n ---\u003e Running in 681553bf8839\nIgn:1 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  InRelease\nHit:2 http://archive.ubuntu.com/ubuntu bionic InRelease\nIgn:3 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  InRelease\nGet:4 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Release [564 B]\nGet:5 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]\nGet:6 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]\nGet:7 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Release [564 B]\nGet:8 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Release.gpg [819 B]\nGet:9 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Release.gpg [833 B]\nGet:10 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages [141 kB]\nGet:11 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64"}';  
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 			let deploy_res = {"192.168.1.63":"This node failed to docker image build. ERR Message:Process exited with status 1 Contents:##Sending build context to Docker daemon  216.7MB\r\r\\r\\nStep 1/10 : FROM tensorflow/tensorflow:1.15.2-gpu-py3\\r\\n ---\u003e 182b13b4a8e6\\r\\nStep 2/10 : ENV DEBIAN_FRONTEND noninteractive\\r\\n ---\u003e Running in 1bc60619829c\\r\\nRemoving intermediate container 1bc60619829c\\r\\n ---\u003e 6f2f2e36dfe9\\r\\nStep 3/10 : ADD ./src/. /workspace/model\\r\\n ---\u003e 9eab5fb13866\\r\\nStep 4/10 : ADD ./server/. /workspace/server\\r\\n ---\u003e be29ad6a83ea\\r\\nStep 5/10 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH\\r\\n ---\u003e Running in f79ebe4e8693\\r\\nRemoving intermediate container f79ebe4e8693\\r\\n ---\u003e ffcfcbe9df70\\r\\nStep 6/10 : RUN apt-get update\\r\\n ---\u003e Running in 9b8ab336b3d0\\r\\nGet:1 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]\\r\\nIgn:2 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  InRelease\\r\\nHit:3 http://archive.ubuntu.com/ubuntu bionic InRelease\\r\\nIgn:4 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  InRelease\\r\\nGet:5 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Release [564 B]\\r\\nGet:6 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]\\r\\nGet:7 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Release [564 B]\\r\\nGet:8 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Release.gpg [819 B]\\r\\nGet:9 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Release.gpg [833 B]\\r\\nGet:10 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages [141 kB]\\r\\nGet:11 http://security.ubuntu.com/ubuntu bionic-security/restricted amd64 Packages [44.6 kB]\\r\\nGet:12 http://security.ubuntu.com/ubuntu bionic-security/multiverse amd64 Packages [8213 B]\\r\\nGet:13 http://security.ubuntu.com/ubuntu bionic-security/main amd64 Packages [889 kB]\\r\\nGet:14 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Packages [31.7 kB]\\r\\nGet:15 http://archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]\\r\\nGet:16 http://archive.ubuntu.com/ubuntu bionic-updates/multiverse amd64 Packages [12.6 kB]\\r\\nGet:17 http://archive.ubuntu.com/ubuntu bionic-updates/universe amd64 Packages [1372 kB]\\r\\nGet:18 http://security.ubuntu.com/ubuntu bionic-security/universe amd64 Packages [839 kB]\\r\\nGet:19 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages [1183 kB]\\r\\nGet:20 http://archive.ubuntu.com/ubuntu bionic-updates/restricted amd64 Packages [59.0 kB]\\r\\nGet:21 http://archive.ubuntu.com/ubuntu bionic-backports/universe amd64 Packages [7674 B]\\r\\nGet:22 http://archive.ubuntu.com/ubuntu bionic-backports/main amd64 Packages [8286 B]\\r\\nFetched 4851 kB in 3s (1420 kB/s)\\r\\nReading package lists...\\r\\nRemoving intermediate container 9b8ab336b3d0\\r\\n ---\u003e c78b11f6e992\\r\\nStep 7/10 : RUN test\\r\\n ---\u003e Running in 14f5a1d443eb\\r\\nRemoving intermediate container 14f5a1d443eb\\r\\nThe command /bin/bash -c test returned a non-zero code: 1\\r\\n"};
// 			let deploy_res = '{"192.168.1.63":"This node failed to docker image build. ERR Message:Process exited with status 1 Contents:##Sending build context to Docker daemon  216.7MB\\r\\nStep 1/10 : FROM tensorflow/tensorflow:1.15.2-gpu-py3\\r\\n ---\u003e 182b13b4a8e6\\r\\nStep 2/10 : ENV DEBIAN_FRONTEND noninteractive\\r\\n ---\u003e Running in 1bc60619829c\\r\\nRemoving intermediate container 1bc60619829c\\r\\n ---\u003e 6f2f2e36dfe9\\r\\nStep 3/10 : ADD ./src/. /workspace/model\\r\\n ---\u003e 9eab5fb13866\\r\\nStep 4/10 : ADD ./server/. /workspace/server\\r\\n ---\u003e be29ad6a83ea\\r\\nStep 5/10 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH\\r\\n ---\u003e Running in f79ebe4e8693\\r\\nRemoving intermediate container f79ebe4e8693\\r\\n ---\u003e ffcfcbe9df70\\r\\nStep 6/10 : RUN apt-get update\\r\\n ---\u003e Running in 9b8ab336b3d0\\r\\nGet:1 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]\\r\\nIgn:2 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  InRelease\\r\\nHit:3 http://archive.ubuntu.com/ubuntu bionic InRelease\\r\\nIgn:4 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  InRelease\\r\\nGet:5 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Release [564 B]\\r\\nGet:6 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]\\r\\nGet:7 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Release [564 B]\\r\\nGet:8 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Release.gpg [819 B]\\r\\nGet:9 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Release.gpg [833 B]\\r\\nGet:10 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages [141 kB]\\r\\nGet:11 http://security.ubuntu.com/ubuntu bionic-security/restricted amd64 Packages [44.6 kB]\\r\\nGet:12 http://security.ubuntu.com/ubuntu bionic-security/multiverse amd64 Packages [8213 B]\\r\\nGet:13 http://security.ubuntu.com/ubuntu bionic-security/main amd64 Packages [889 kB]\\r\\nGet:14 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Packages [31.7 kB]\\r\\nGet:15 http://archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]\\r\\nGet:16 http://archive.ubuntu.com/ubuntu bionic-updates/multiverse amd64 Packages [12.6 kB]\\r\\nGet:17 http://archive.ubuntu.com/ubuntu bionic-updates/universe amd64 Packages [1372 kB]\\r\\nGet:18 http://security.ubuntu.com/ubuntu bionic-security/universe amd64 Packages [839 kB]\\r\\nGet:19 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages [1183 kB]\\r\\nGet:20 http://archive.ubuntu.com/ubuntu bionic-updates/restricted amd64 Packages [59.0 kB]\\r\\nGet:21 http://archive.ubuntu.com/ubuntu bionic-backports/universe amd64 Packages [7674 B]\\r\\nGet:22 http://archive.ubuntu.com/ubuntu bionic-backports/main amd64 Packages [8286 B]\\r\\nFetched 4851 kB in 3s (1420 kB/s)\\r\\nReading package lists...\\r\\nRemoving intermediate container 9b8ab336b3d0\\r\\n ---\u003e c78b11f6e992\\r\\nStep 7/10 : RUN test\\r\\n ---\u003e Running in 14f5a1d443eb\\r\\nRemoving intermediate container 14f5a1d443eb\\r\\nThe command /bin/bash -c test returned a non-zero code: 1\\r\\n"}';		// 잘나옴 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 			let deploy_res = '{"key1":"val1", "key2":"val2"}';
//  			let deploy_res = {"key1":"val1", "key2":"val2"};
// 			let deploy_res = {"192.168.1.63":"This node failed to docker image build. ERR Message:Process exited with status 100 Contents:##Sending build context to Docker daemon  82.14MB\\r\\nStep 1/9 : FROM ubuntu:latest\\r\\n ---\u003e 72300a873c2c\\r\\nStep 2/9 : ENV DEBIAN_FRONTEND noninteractive\\r\\n ---\u003e Running in 37dfcb93850f\\r\\nRemoving intermediate container 37dfcb93850f\\r\\n ---\u003e bb04c65290c1\\r\\nStep 3/9 : ADD ./src/. /workspace/model\\r\\n ---\u003e eed6ed806c07\\r\\nStep 4/9 : ADD ./server/. /workspace/server\\r\\n ---\u003e 0b12262e36e2\\r\\nStep 5/9 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH\\r\\n ---\u003e Running in badf0e2b1583\\r\\nRemoving intermediate container badf0e2b1583\\r\\n ---\u003e 12d0251f4830\\r\\nStep 6/9 : RUN apt-get sadsfadfdaf\\r\\n ---\u003e Running in f769b05201a2\\r\\n\u001b[91mE: Invalid operation sadsfadfdaf\\r\\n\u001b[0mRemoving intermediate container f769b05201a2\\r\\nThe command /bin/sh -c apt-get sadsfadfdaf returned a non-zero code: 100\\r\\n"};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 			let deploy_res = {"192.168.1.63":"This node failed to docker image build. ERR Message:Process exited with status 100 Contents:##Sending build context to Docker daemon  82.14MB\r\nStep 1/9 : FROM ubuntu:latest\r\n ---\u003e 72300a873c2c\r\nStep 2/9 : ENV DEBIAN_FRONTEND noninteractive\r\n ---\u003e Running in 37dfcb93850f\r\nRemoving intermediate container 37dfcb93850f\r\n ---\u003e bb04c65290c1\r\nStep 3/9 : ADD ./src/. /workspace/model\r\n ---\u003e eed6ed806c07\r\nStep 4/9 : ADD ./server/. /workspace/server\r\n ---\u003e 0b12262e36e2\r\nStep 5/9 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH\r\n ---\u003e Running in badf0e2b1583\r\nRemoving intermediate container badf0e2b1583\r\n ---\u003e 12d0251f4830\r\nStep 6/9 : RUN apt-get sadsfadfdaf\r\n ---\u003e Running in f769b05201a2\r\n\u001b[91mE: Invalid operation sadsfadfdaf\r\n\u001b[0mRemoving intermediate container f769b05201a2\r\nThe command /bin/sh -c apt-get sadsfadfdaf returned a non-zero code: 100\r\n"};			// 잘나옴 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 		let deploy_res = '{"192.168.1.63":"This node failed to docker image build. ERR Message:Process exited with status 100 Contents:##Sending build context to Docker daemon  [82.14MB]\\r\\nStep 1/9 : FROM ubuntu:latest\\r\\n ---\u003e 72300a873c2c\\r\\nStep 2/9 : ENV DEBIAN_FRONTEND noninteractive\\r\\n ---\u003e Running in 37dfcb93850f\\r\\nRemoving intermediate container 37dfcb93850f\\r\\n ---\u003e bb04c65290c1\\r\\nStep 3/9 : ADD ./src/. /workspace/model\\r\\n ---\u003e eed6ed806c07\\r\\nStep 4/9 : ADD ./server/. /workspace/server\\r\\n ---\u003e 0b12262e36e2\\r\\nStep 5/9 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH\\r\\n ---\u003e Running in badf0e2b1583\\r\\nRemoving intermediate container badf0e2b1583\\r\\n ---\u003e 12d0251f4830\\r\\nStep 6/9 : RUN apt-get aaa\\r\\n ---\u003e Running in f769b05201a2\\r\\n u001b[91mE: Invalid operation aaa]\\r\\n u001b[0mRemoving intermediate container f769b05201a2]\\r\\nThe command /bin/sh -c apt-get sadsfadfdaf returned a non-zero code: 100\\r\\n"}';

// 			let deploy_res = '{"192.168.1.63":"This node failed to docker image build. ERR Message:Process exited with status 100 Contents:Sending build context to Docker daemon  82.14MB\\r\\n Step 1/9 : FROM ubuntu:latest\\r\\n  ---\u003e 72300a873c2c\\r\\n Step 2/9 : ENV DEBIAN_FRONTEND noninteractive\\r\\n  ---\u003e Running in 7f2d3df13de9\\r\\n Removing intermediate container 7f2d3df13de9\\r\\n  ---\u003e 8664a96240d8\\r\\n Step 3/9 : ADD ./src/. /workspace/model\\r\\n  ---\u003e ef2f1d0edb06\\r\\n Step 4/9 : ADD ./server/. /workspace/server\\r\\n  ---\u003e b991387af9b5\\r\\n Step 5/9 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH\\r\\n  ---\u003e Running in 4b785a8e3cab\\r\\n Removing intermediate container 4b785a8e3cab\\r\\n  ---\u003e 33ec474305c8\\r\\n Step 6/9 : RUN apt-get sadsfadfdaf\\r\\n  ---\u003e Running in 6d5666a04ae7\\r\\n \u001b[91mE: Invalid operation sadsfadfdaf\\r\\n \u001b[0mThe command /bin/sh -c apt-get sadsfadfdaf returned a non-zero code: 100\\r\\n Removing intermediate container 6d5666a04ae7\\r\\n "}';
// 			let deploy_res = '{"192.168.1.63":"This node failed to docker image build. ERR Message:Process exited with status 100 Contents:Sending build context to Docker daemon  82.14MB \\r\\n Step 1/9 : FROM ubuntu:latest \\r\\n  ---\\u003e 72300a873c2c \\r\\n Step 2/9 : ENV DEBIAN_FRONTEND noninteractive \\r\\n  ---\u003e Running in 7f2d3df13de9 \\r\\n Removing intermediate container 7f2d3df13de9 \\r\\n  ---\\u003e 8664a96240d8 \\r\\n Step 3/9 : ADD ./src/. /workspace/model \\r\\n  ---\u003e ef2f1d0edb06 \\r\\n Step 4/9 : ADD ./server/. /workspace/server \\r\\n  ---\u003e b991387af9b5 \\r\\n Step 5/9 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH \\r\\n  ---\u003e Running in 4b785a8e3cab \\r\\n Removing intermediate container 4b785a8e3cab \\r\\n  ---\u003e 33ec474305c8 \\r\\n Step 6/9 : RUN apt-get sadsfadfdaf \\r\\n  ---\u003e Running in 6d5666a04ae7 \\r\\n \\u001b[91mE: Invalid operation sadsfadfdaf \\r\\n \\u001b[0mThe command /bin/sh -c apt-get sadsfadfdaf returned a non-zero code: 100 \\r\\n Removing intermediate container 6d5666a04ae7 \\r\\n "}';
// 			let deploy_res = 'real string result \r \n ---\u003e';

// let deploy_res = {"192.168.1.194":"This node failed to docker image build. ERR Message:Process exited with status 1 Contents:Sending build context to Docker daemon  104.8MB##Step 1/9 : FROM tensorflow/tensorflow:1.12.0-gpu## ---\u003e 58a8e83b7dbf##Step 2/9 : ENV DEBIAN_FRONTEND noninteractive## ---\u003e Running in 4b6a468f7aef##Removing intermediate container 4b6a468f7aef## ---\u003e d0ed4ec59fee##Step 3/9 : ADD ./src/. /workspace/model## ---\u003e 4205379ef73b##Step 4/9 : ADD ./server/. /workspace/server## ---\u003e c4106acbea0a##Step 5/9 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH## ---\u003e Running in 7a52baa4df5e##Removing intermediate container 7a52baa4df5e## ---\u003e 9652bc5b86b9##Step 6/9 : RUN adfs## ---\u003e Running in 97acba5dd28b##Removing intermediate container 97acba5dd28b##OCI runtime create failed: container_linux.go:346: starting container process caused \"process_linux.go:449: container init caused \\\"process_linux.go:432: running prestart hook 1 caused \\\\\\\"error running hook: exit status 1, stdout: , stderr: nvidia-container-cli: initialization error: driver error: failed to process request\\\\\\\\n\\\\\\\"\\\"\": unknown##","192.168.1.63":"This node failed to docker image build. ERR Message:Process exited with status 127 Contents:Sending build context to Docker daemon  104.8MB##Step 1/9 : FROM tensorflow/tensorflow:1.12.0-gpu## ---\u003e 58a8e83b7dbf##Step 2/9 : ENV DEBIAN_FRONTEND noninteractive## ---\u003e Running in f8c8b43751fe##Removing intermediate container f8c8b43751fe## ---\u003e 5fd5df75576d##Step 3/9 : ADD ./src/. /workspace/model## ---\u003e 9bb5089a575a##Step 4/9 : ADD ./server/. /workspace/server## ---\u003e 91819c3f29a3##Step 5/9 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH## ---\u003e Running in 89110b9c3a1b##Removing intermediate container 89110b9c3a1b## ---\u003e 32a44c41c2eb##Step 6/9 : RUN adfs## ---\u003e Running in 7a8d1034c81b##\u001b[91m/bin/sh: 1: adfs: not found##\u001b[0mRemoving intermediate container 7a8d1034c81b##^^The command /bin/sh -c adfs returned a non-zero code: 127^^##"};
// let deploy_res = '{"192.168.1.194":"This node failed to docker image build. ERR Message:Process exited with status 1 Contents:Sending build context to Docker daemon  104.8MB##Step 1/9 : FROM tensorflow/tensorflow:1.12.0-gpu## ---\u003e 58a8e83b7dbf##Step 2/9 : ENV DEBIAN_FRONTEND noninteractive## ---\u003e Running in 4b6a468f7aef##Removing intermediate container 4b6a468f7aef## ---\u003e d0ed4ec59fee##Step 3/9 : ADD ./src/. /workspace/model## ---\u003e 4205379ef73b##Step 4/9 : ADD ./server/. /workspace/server## ---\u003e c4106acbea0a##Step 5/9 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH## ---\u003e Running in 7a52baa4df5e##Removing intermediate container 7a52baa4df5e## ---\u003e 9652bc5b86b9##Step 6/9 : RUN adfs## ---\u003e Running in 97acba5dd28b##Removing intermediate container 97acba5dd28b##OCI runtime create failed: container_linux.go:346: starting container process caused process_linux.go:449: container init caused process_linux.go:432: running prestart hook 1 caused error running hook: exit status 1, stdout: , stderr: nvidia-container-cli: initialization error: driver error: failed to process request: unknown##","192.168.1.63":"This node failed to docker image build. ERR Message:Process exited with status 127 Contents:Sending build context to Docker daemon  104.8MB##Step 1/9 : FROM tensorflow/tensorflow:1.12.0-gpu## ---\u003e 58a8e83b7dbf##Step 2/9 : ENV DEBIAN_FRONTEND noninteractive## ---\u003e Running in f8c8b43751fe##Removing intermediate container f8c8b43751fe## ---\u003e 5fd5df75576d##Step 3/9 : ADD ./src/. /workspace/model## ---\u003e 9bb5089a575a##Step 4/9 : ADD ./server/. /workspace/server## ---\u003e 91819c3f29a3##Step 5/9 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH## ---\u003e Running in 89110b9c3a1b##Removing intermediate container 89110b9c3a1b## ---\u003e 32a44c41c2eb##Step 6/9 : RUN adfs## ---\u003e Running in 7a8d1034c81b##\u001b[91m/bin/sh: 1: adfs: not found##\u001b[0mRemoving intermediate container 7a8d1034c81b##The command /bin/sh -c adfs returned a non-zero code: 127##"}';

// let deploy_res = {"192.168.1.194":"This node failed to docker image build. ERR Message:Process exited with status 1 Contents:Sending build context to Docker daemon  104.8MB##Step 1/9 : FROM tensorflow/tensorflow:1.12.0-gpu## ---\u003e 58a8e83b7dbf##Step 2/9 : ENV DEBIAN_FRONTEND noninteractive## ---\u003e Running in 4b6a468f7aef##Removing intermediate container 4b6a468f7aef## ---\u003e d0ed4ec59fee##Step 3/9 : ADD ./src/. /workspace/model## ---\u003e 4205379ef73b##Step 4/9 : ADD ./server/. /workspace/server## ---\u003e c4106acbea0a##Step 5/9 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH## ---\u003e Running in 7a52baa4df5e##Removing intermediate container 7a52baa4df5e## ---\u003e 9652bc5b86b9##Step 6/9 : RUN adfs## ---\u003e Running in 97acba5dd28b##Removing intermediate container 97acba5dd28b##OCI runtime create failed: container_linux.go:346: starting container process caused \"process_linux.go:449: container init caused \\\"process_linux.go:432: running prestart hook 1 caused \\\\\\\"error running hook: exit status 1, stdout: , stderr: nvidia-container-cli: initialization error: driver error: failed to process request\\\\\\\\n\\\\\\\"\\\"\": unknown##","192.168.1.63":"This node failed to docker image build. ERR Message:Process exited with status 127 Contents:Sending build context to Docker daemon  104.8MB##Step 1/9 : FROM tensorflow/tensorflow:1.12.0-gpu## ---\u003e 58a8e83b7dbf##Step 2/9 : ENV DEBIAN_FRONTEND noninteractive## ---\u003e Running in f8c8b43751fe##Removing intermediate container f8c8b43751fe## ---\u003e 5fd5df75576d##Step 3/9 : ADD ./src/. /workspace/model## ---\u003e 9bb5089a575a##Step 4/9 : ADD ./server/. /workspace/server## ---\u003e 91819c3f29a3##Step 5/9 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH## ---\u003e Running in 89110b9c3a1b##Removing intermediate container 89110b9c3a1b## ---\u003e 32a44c41c2eb##Step 6/9 : RUN adfs## ---\u003e Running in 7a8d1034c81b##^^\u001b[91m/bin/sh: 1: adfs: not found^^##^^\u001b[0mRemoving intermediate container 7a8d1034c81b^^##The command /bin/sh -c adfs returned a non-zero code: 127##"};
// let deploy_res = {"192.168.1.194":"This node failed to docker image build. ERR Message:Process exited with status 1 Contents:Sending build context to Docker daemon  104.8MB##Step 1/9 : FROM tensorflow/tensorflow:1.12.0-gpu## ---\u003e 58a8e83b7dbf##Step 2/9 : ENV DEBIAN_FRONTEND noninteractive## ---\u003e Running in 4b6a468f7aef##Removing intermediate container 4b6a468f7aef## ---\u003e d0ed4ec59fee##Step 3/9 : ADD ./src/. /workspace/model## ---\u003e 4205379ef73b##Step 4/9 : ADD ./server/. /workspace/server## ---\u003e c4106acbea0a##Step 5/9 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH## ---\u003e Running in 7a52baa4df5e##Removing intermediate container 7a52baa4df5e## ---\u003e 9652bc5b86b9##Step 6/9 : RUN adfs## ---\u003e Running in 97acba5dd28b##Removing intermediate container 97acba5dd28b##OCI runtime create failed: container_linux.go:346: starting container process caused \"process_linux.go:449: container init caused \\\"process_linux.go:432: running prestart hook 1 caused \\\\\\\"error running hook: exit status 1, stdout: , stderr: nvidia-container-cli: initialization error: driver error: failed to process request\\\\\\\\n\\\\\\\"\\\"\": unknown##","192.168.1.63":"This node failed to docker image build. ERR Message:Process exited with status 127 Contents:Sending build context to Docker daemon  104.8MB##Step 1/9 : FROM tensorflow/tensorflow:1.12.0-gpu## ---\u003e 58a8e83b7dbf##Step 2/9 : ENV DEBIAN_FRONTEND noninteractive## ---\u003e Running in f8c8b43751fe##Removing intermediate container f8c8b43751fe## ---\u003e 5fd5df75576d##Step 3/9 : ADD ./src/. /workspace/model## ---\u003e 9bb5089a575a##Step 4/9 : ADD ./server/. /workspace/server## ---\u003e 91819c3f29a3##Step 5/9 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH## ---\u003e Running in 89110b9c3a1b##Removing intermediate container 89110b9c3a1b## ---\u003e 32a44c41c2eb##Step 6/9 : RUN adfs## ---\u003e Running in 7a8d1034c81b##^^\u001b[91m/bin/sh: 1: adfs: not found^^##^^\u001b[0mRemoving intermediate container 7a8d1034c81b^^##The command /bin/sh -c adfs returned a non-zero code: 127##","192.168.1.189":"^^This node failed to docker image build. ERR Message:Process exited with status 127 Contents:Sending build context to Docker daemon  104.8MB^^##Step 1/9 : FROM tensorflow/tensorflow:1.12.0-gpu## ---\u003e 58a8e83b7dbf##Step 2/9 : ENV DEBIAN_FRONTEND noninteractive## ---\u003e Running in f8c8b43751fe##Removing intermediate container f8c8b43751fe## ---\u003e 5fd5df75576d##Step 3/9 : ADD ./src/. /workspace/model## ---\u003e 9bb5089a575a##Step 4/9 : ADD ./server/. /workspace/server## ---\u003e 91819c3f29a3##Step 5/9 : ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH## ---\u003e Running in 89110b9c3a1b##Removing intermediate container 89110b9c3a1b## ---\u003e 32a44c41c2eb##Step 6/9 : RUN adfs## ---\u003e Running in 7a8d1034c81b##\u001b[91m/bin/sh: 1: adfs: not found##\u001b[0mRemoving intermediate container 7a8d1034c81b##The command /bin/sh -c adfs returned a non-zero code: 127##"};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			console.log("deploy_res::", deploy_res);
			console.log("typeof deploy_res::", typeof(deploy_res));
			if(typeof(deploy_res) == "string") {
				if(deploy_res.charAt(0) == "{") {
// 					deploy_res.replace(/\n/g,'\\n');
//  					deploy_res = deploy_res.replace(/##/g, "\n");
//  					deploy_res.replace(/"/g, '');
					console.log("dedededededetype:", typeof(deploy_res));
 					console.log("dedede\r\r\rddd::", deploy_res);
 		 			deploy_res = JSON.parse(deploy_res);	
 		 			console.log("dddeededpl:", typeof(deploy_res));
 		 			console.log("dddeededpldasdasdasd:", deploy_res);
				} else {
					// JSON.parse 가 불가능한 string일 경우 결과를 그대로 출력
				}
			} 
// 			console.log("deploy_res string::", deploy_res);
			let deploy_key = Object.keys(deploy_res);
			let deploy_val = {};
 			if(typeof(deploy_res) == "object"){
 				for(let i = 0; i < deploy_key.length; i++){
 					deploy_val[i] = deploy_res[Object.keys(deploy_res)[i]];
					
 					// ^^중요 내용^^ 강조표시 
 					if (deploy_val[i].includes("^^")) {
 						var split_by_char = deploy_val[i].split("^^");
 						var emp_str1 = "<div class='emphasis'>";
 						var emp_str2 = "</div>";
 						
 						for(j=0; j < split_by_char.length; j++){
 							if(split_by_char[j].includes("##")) {
 								
 							} else {
 								split_by_char[j] = emp_str1 + split_by_char[j] + emp_str2;
 							}
 						}
 						
 						deploy_val[i] = split_by_char.toString();
 						
 						deploy_val[i] = deploy_val[i].replace(/,/g, "").replace(/##/g, "\n");
 						
 					} else {
 	 					deploy_val[i] = deploy_val[i].replace(/##/g, "\n"); 						
 					}					

 					console.log("typeof deploy_val[i]::", typeof(deploy_val[i]));
 					console.log("dasdad deploy_val[i]::", deploy_val[i]);
 				} 		
 				for(let i = 0; i < deploy_key.length; i++){
//  					deploy_key[i].replace(/\"/g, '');
//  					deploy_val[i].replace(/\"/g, '');	
//  					deploy_val[i].replace(/\r/g, '');
//  					text += "\n";
//  					text += "---------------------------------------------------------------------------------------------------------------\n";				
 					text += "\n";
 					text += "<div class='failed_node'>실패한 work 노드 : " + deploy_key[i] + "</div>";
 					text += "\n";
 					text += "\n";
 					text += deploy_val[i];
 					text += "\n";
 					if(i+1 != deploy_key.length){
 	 					text += "---------------------------------------------------------------------------------------------------------------\n";
 					}
 				} 				
 			} else if (deploy_res == "" || deploy_res == undefined || deploy_res == null) {
 				console.log("typeof deploy_result ::", typeof(deploy_res)); 				
 				text += "No data exist";
 			} else {	
//  				console.log("typeof deploy_result ::", typeof(deploy_res));
//  				console.log(deploy_res);
//  				deploy_res.replace(/^\{/g, '');
//  				deploy_res.replace(/$\}/g, '');
//  				text += "관리자에게 문의 부탁드립니다.";
//  				text += "\n";
//  				text += "ERROR Message:";
//  				text += "\n";
//  				text += deploy_res;
 			};	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			log_target.append(text);
// 			log_target[0].value = text;

// 			console.log("parse_res::", parse_res);
// 			console.log("deploy_res :: ", deploy_res);
// 			console.log("rm_parse_res::", rm_parse_res);

 			let log_close = that.pt.find(".log_close");
 			log_close.off("click").on("click", function(){
 				that.pt.find(".deploy_error").removeClass("active");
 			});
		},
		
		addDefault : function() {
			let that = algorithmDetail; 
			let select_train_d = $("#algorithmDetail").find("select[name='type_train_param_d']");
			let select_inf_d = $("#algorithmDetail").find("select[name='type_inference_param_d']");
			// train parameter, inference parameter type 선택 시 default 입력필드 호출
			select_train_d.change(function() {
				console.log("this1:", $(this).val());
				let selected_train_d_option = $(this).val();
				$(this).next("input").remove();
				$(this).next("select").remove( );
// 				console.log("selected_option: ", selected_option);
				if(selected_train_d_option == "string") {
					$(this).after("<input type='text' class='default_train_d_str' placeholder='Default string value' onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>");
				} else if (selected_train_d_option == "number") {
					$(this).after("<input type='number' class='default_train_d_num' placeholder='Default number value' onKeyPress='return checkNum(event);'/>");
				} else if (selected_train_d_option == "boolean") {
					$(this).after("<select class='default_train_d_bool'><option value=''>Default boolean value</option><option value='true'>True</option><option value='false'>False</option></select>");
				}				
				$("input").off("input").on("input",function(e){
					//영문, 숫자, 특수문자
					if($(this).hasClass("description_d") || $(this).hasClass("train_param_d_help") || $(this).hasClass("inf_param_d_help")) {
					
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
			
			select_inf_d.change(function() {
				console.log("this2:", $(this).val());
				let selected_inf_d_option = $(this).val();
				$(this).next("input").remove();
				$(this).next("select").remove();
// 				console.log("selected_option: ", selected_option);
				if(selected_inf_d_option == "string") {
					$(this).after("<input type='text' class='default_inf_d_str' placeholder='Default string value' onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>");
				} else if (selected_inf_d_option == "number") {
					$(this).after("<input type='number' class='default_inf_d_num' placeholder='Default number value' onKeyPress='return checkNum(event);'/>");
				} else if (selected_inf_d_option == "boolean") {
					$(this).after("<select class='default_inf_d_bool'><option value='''>Default boolean value</option><option value='true'>True</option><option value='false'>False</option></select>");
				}	
				$("input").off("input").on("input",function(e){
					//영문, 숫자, 특수문자
					if($(this).hasClass("description_d") || $(this).hasClass("train_param_d_help") || $(this).hasClass("inf_param_d_help")) {
					
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
