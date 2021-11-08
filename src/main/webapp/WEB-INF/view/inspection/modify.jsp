<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
	<style>
		#modify { width: 100%; height: 100%; background-color: #f5f5f5; }
		#modify .border_box { padding: 0px 30px }
		#modify .title_wrap { padding: 23px 0 14px 0; color: #5b666e; }
		#modify .title_wrap div { font-size: 13px; font-weight: 400; color: #343434; }
		#modify .input_wrap { margin-bottom: 10px; }
		#modify input[type='text'] { width: 100%; font-family: Open_Sans; font-size: 13px; font-weight: 300; color: #555555; border: 1px solid #dedcde; }
		#modify input[type='text']:focus {border: 1px solid #4c84ff;}
		#modify textarea { width: 100%; font-family: Open_Sans; font-size: 13px; font-weight: 300; color: #555555; border: 1px solid #dedcde; }
		#modify textarea:focus {border: 1px solid #4c84ff;}	
			
		#modify .input_wrap .btn_wrap div { cursor: pointer; width: 68px; line-height: 28px; text-align: center; background-color: #f8f8f8; font-size: 12px; font-weight: 300; color: #343434; border: 1px solid #dedcde; }
		#modify .input_wrap .btn_wrap.fr div { background-color: #4c84ff; color: #ffffff; }
		#modify .input_wrap .btn_wrap.fr div:hover { background-color: #3A71E9; } 
		
		#modify .label_type_wrap { margin-left: 15px; font-weight: 300 !important; }
		#modify .label_type_wrap .radioBtn { position: relative; top: 2px; }
		#modify .label_type_wrap .radio_label { margin-right: 10px; }		
		
	</style>
</head>
<body>

	<div class="container" id="modify">
		<div class="border_box">
			<form id="fileForm" enctype="multipart/form-data">
				<div class="title_wrap flex">
					<div>Modify</div>
				</div>
				<div class="input_wrap flex">
					<input class="" type="text" name="title" data-length="100" placeholder="Please enter the title" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
				</div>
							
				<div class="input_wrap flex">
					<textarea class="" name="contents" data-length="200" placeholder="Please enter the description"></textarea>
				</div>							
				<div class="input_wrap">
					<div class="btn_wrap fr">
						<div class="save filter_color">Save</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
<script>
	var modify = {
		pt : $("#modify"),
		node : null,
		init : function(node) {
			var that = this;
			
			that.node = node;
			that.reset();
			
			that.listener();
		},
		reset : function() {
			var that = this;
			
			that.pt.find("input[name='title']").val(that.node.title);
			that.pt.find("textarea[name='contents']").val(that.node.contents);
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
			
			that.pt.find("input[name='title']").off("keydown").on("keydown", function(e){
				if(e.keyCode == 13){
					e.preventDefault();
					that.pt.find("textarea[name='contents']").focus();
				}
			});
			
			//새로만들기 - 저장하기
			that.pt.find(".save").off("click").on("click", function(){
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
				
				// jh.sa : box, polygon 선택
				let label_type;
				let selected_type = that.pt.find(".label_type_wrap .radioBtn.selected");
				if(selected_type.data("value") == "box"){
					label_type = "box";
				} else if (selected_type.data("value") == "polygon"){
					label_type = "polygon";
				}
				console.log("이 데이터셋의 유형은 [", label_type, "] 입니다.");				
				
				var formData = new FormData();
				formData.append("dataset_id", that.node.id);			// id => dataset_id(0921)
				formData.append("title",that.pt.find("input[name='title']").val());
				formData.append("contents",that.pt.find("textarea[name='contents']").val());
// 				formData.append("label_type", label_type);										// jh.sa : box, polygon 선택				
				
				$("#loader").show();
				$.ajax({
				   	url :  baseUrl + "data/updateDataset.json",
				   	data : formData,
				   	type : "POST",
				   	processData : false,
				   	contentType: false,
				   	success : function(res){
				   		$("#loader").hide();
				   		
						console.log("=====modify=====", res);

						if(res.result.code == "200"){
							alert(res.result.data)
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
			
		},
		
	};
</script>