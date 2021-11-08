<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
	<title>X-labeller</title>
	
	<style>
		#trainer_upload { width: 100%; height: 100%;  background-color: #f5f5f5; overflow: overlay;}
		#trainer_upload .border_box { padding: 0px 30px; }
		#trainer_upload .title_wrap { color: #5b666e; }
		#trainer_upload .title_wrap div {margin-top:23px; font-family: Open_Sans; font-size: 13px; font-weight: 400; color: #343434; margin-bottom:16px; }
		#trainer_upload .input_wrap { margin-bottom: 20px; }
		#trainer_upload .contents_area { height: 150px; }	
		
		#trainer_upload input { width: 100%; font-size: 13px; color: #555555; border: 1px solid #dedcde; border-radius: 2px; font-family: Open_Sans; font-weight: 300;}
		#trainer_upload input:focus {border: 1px solid #4c84ff;}
		#trainer_upload textarea { width: 100%; font-size: 13px; color: #555555; border: 1px solid #dedcde; border-radius: 2px; font-family: Open_Sans; font-weight: 300;}
		#trainer_upload textarea:focus {border: 1px solid #4c84ff;}
		#trainer_upload .input_wrap .btn_wrap { display: flex; display: -webkit-flex; }
		#trainer_upload .input_wrap .btn_wrap div { border-radius: 2px; cursor: pointer; width: 68px; line-height: 28px; text-align: center; font-family: Open_Sans; background-color: #f8f8f8; font-size: 12px; font-weight: 300; color: #343434; border: 1px solid #dedcde; }
		#trainer_upload .input_wrap .btn_wrap.fl div { margin-right: 10px; }
		#trainer_upload .input_wrap .btn_wrap.fr div { background-color: #4c84ff; color: #ffffff; }
		#trainer_upload .input_wrap .btn_wrap.fr div:hover { background-color: #3A71E9; } 
	
		
	</style>
</head>
<body>

	<div class="container" id="trainer_upload">
		<div class="border_box">
				<div class="title_wrap flex">
					<div>Create Project</div>
				</div>
				<div class="input_wrap flex ">
					<input class="title_area" type="text" name="title" data-length="100" placeholder="Please enter the title" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
				</div>
							
				<div class="input_wrap flex ">
					<textarea class="contents_area" name="contents" data-length="200" placeholder="Please enter the description"></textarea>
				</div>

				<div class="input_wrap">
					<div class="btn_wrap fr ">
						<div class="save filter_color">Save</div>
					</div>
				</div>
		</div>
	</div>

</body>
<script>
	
	$(document).on("sessionLoad", function() {
		
	});

	//trainer_upload 시작
	var trainer_upload = {
		pt : $("#trainer_upload"),
		init : function() {
			let that = this;
			
			that.resetView();
		},
		
		
		//초기화하는 함
		resetView : function(){
			let that = this;
			that.pt.find(':input').val("");
			that.listener();
		},
		
		
		//저장 밎 input, textarea 에 대한 이벤트 함수
		listener : function(){
			let that = this;
		
			let submit_btn = that.pt.find(".save");
			
			submit_btn.off("click").on("click",function(){
				that.getData();
			});
			
			that.pt.find("input[name='title']").off("keydown").on("keydown", function(e){
				if(e.keyCode == 13){
					e.preventDefault();
					that.pt.find("textarea[name='contents']").focus();
				}
			});
		},

		
		//저장 버튼 누를때 데이터 가공
		getData : function() {
			let that = this;

			let title = that.pt.find("input[name='title']").val();
			let contents = that.pt.find("textarea[name='contents']").val();
			
			if(title == ""){
			 	alert("제목을 입력해주세요");
			 	that.pt.find("input[name='title']").focus();
			 	return;
			}
			
			if(contents == ""){
			 	alert("설명을 입력해주세요");
			 	that.pt.find("textarea[name='contents']").focus();
			 	return;
			} 
			



			$("#loader").show();
			that.insertProject(title, contents);

		},

		//프로젝트 생성하는 api 호출
		insertProject : function(t, c) {
			let that = this;

			let ajaxData = {
				title : t,
				contents : c
			}

			$.ajax({
				url : baseUrl + "project/insertProject.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("=====insertProject=====", res);
					
					if(res.result.code == "200"){
						that.resetView();
						trainer.refreshProject();
						trainer.hideView();
						trainer.main();	
						alert(res.result.data);
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}						
					
					$("#loader").hide();
				},
				error : function(err) {
					$("#loader").hide();
					console.log("ERROR!!", err);
				}
			});
		},

	};
</script>
