<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<style>
		#exports { width :100%; height: 100%; background-color: #f5f5f5; }
		#exports .border_box { padding: 0px 30px }
		#exports .title_wrap { padding: 23px 0 14px 0; color: #5b666e; }
		#exports .title_wrap div { font-size: 13px; font-weight: 400; color: #343434; }
		#exports .input_wrap { margin-bottom: 10px; }
		#exports input[type='text'] { width: 100%; font-family: Open_Sans; font-size: 13px; font-weight: 300; color: #555555; border: 1px solid #dedcde; }
		#exports input[type='text']:focus {border: 1px solid #4c84ff;}
		#exports textarea { width: 100%; font-family: Open_Sans; font-size: 13px; font-weight: 300; color: #555555; border: 1px solid #dedcde; }
		#exports textarea:focus {border: 1px solid #4c84ff;}
		
		#exports .fileTab_wrap .tab { width: 75px; border: 1px solid #dedcde; border-right: 0; background: #ffffff; line-height: 30px; text-align: center; font-size: 11px; font-weight: 400; color: #555555; cursor: pointer; }
		#exports .fileTab_wrap .tab.active { border-bottom: 0; background: #f5f5f5; }
		#exports .fileTab_wrap .blank { width: calc(100% - 153px); height: 30px; border-bottom: 1px solid #dedcde; border-left: 1px solid #dedcde; }
		
		#exports .file_wrap { width: 100%;height: 231px; margin-bottom: 10px; border: 1px solid #dedcde; position: relative; }
		#exports .file_wrap .h_wrap:after{ content: ''; width: 100%; border-bottom: 1px solid #dedcde; position: absolute; top:30px; left: 0; }
		#exports .file_wrap .h_wrap div { line-height: 30px; font-size: 11px; font-weight: 400; color: #555555; }
		#exports .file_wrap .h_wrap div:nth-of-type(1) { display: inline-block; width: 50px; height: 30px; }
		#exports .file_wrap .h_wrap div:nth-of-type(2) { display: inline-block; width: 20px; }
		#exports .file_wrap .h_wrap div:nth-of-type(3) { display: inline-block; width: 100%; padding-left: 50px; }
		#exports .file_wrap .h_wrap div:nth-of-type(4) { display: inline-block; width: 150px; text-align: center; }
		
		#exports .file_wrap .c_wrap { height:200px; background-color: #ffffff; overflow-y: scroll;}
		#exports .file_wrap .c_wrap .file_drop_info { height:100%; }
		#exports .file_wrap .c_wrap .file_drop_info .info_wrap { margin: auto; font-weight: 200; color: #a0a5ae; }
		#exports .file_wrap .c_wrap .file_drop_info .img{ width: 28px; height: 30px; margin: 0 auto; margin-bottom: 10px; background: url("images/icon_add_image.png") no-repeat center; }
		#exports .file_wrap .c_wrap .file_list { border-bottom: 1px solid #dedcde; }
		#exports .file_wrap .c_wrap .file_list div { line-height: 30px; font-size: 11px; font-weight: 300; color: #555555; }
		#exports .file_wrap .c_wrap .file_list div:nth-of-type(1) { display: inline-block; width: 50px; height: 30px; }
		#exports .file_wrap .c_wrap .file_list div:nth-of-type(2) { display: inline-block; width: 20px; height: 30px; background: url("images/icon_add_file.png") no-repeat center; }
		#exports .file_wrap .c_wrap .file_list div:nth-of-type(3) { display: inline-block; width: 100%; padding-left: 15px; }
		#exports .file_wrap .c_wrap .file_list div:nth-of-type(4) { display: inline-block; width: 150px; text-align: center; }

		#exports .file_wrap .checkBox { background: url("images/btn_checkbox_normal.png") no-repeat center; }
		#exports .file_wrap .checkBox:hover { background-image: url("images/btn_checkbox_hover.png"); }
		#exports .file_wrap .checkBox.selected { background-image: url("images/btn_checkbox_selected.png"); }
		
		#exports .input_wrap .btn_wrap { display: flex; display: -webkit-flex; }
		#exports .input_wrap .btn_wrap div { cursor: pointer; width: 68px; line-height: 28px; text-align: center; background-color: #f8f8f8; font-size: 12px; font-weight: 300; color: #343434; border: 1px solid #dedcde; }
		#exports .input_wrap .btn_wrap.fl div { margin-right: 10px; }
		#exports .input_wrap .btn_wrap.fr div { background-color: #4c84ff; color: #ffffff; }
		#exports .input_wrap .btn_wrap.fr div:hover { background-color: #3A71E9; } 
		
		#exports .btn_wrap span { margin-right: 8px; line-height: 28px; display: inline-block; font-size: 16px; }
		#exports .btn_wrap input[type='radio'] { display: none; }
		#exports .btn_wrap input[type='radio']+label { line-height: 28px; padding-left:18px; margin-right: 18px; font-size: 16px; background: url('images/btn_radio_normal.png') left no-repeat; cursor: pointer; }
		#exports .btn_wrap input[type='radio']:checked+label { background: url('images/btn_radio_selected.png') left no-repeat; }
		
		#exports .label_type_wrap { margin-left: 15px; font-weight: 300 !important; }
		#exports .label_type_wrap .radioBtn { position: relative; top: 2px; }
		#exports .label_type_wrap .radio_label { margin-right: 10px; }	
	</style>
</head>
<body>
	<div class="container" id="exports">
		<div class="border_box">
			<form id="fileForm" enctype="multipart/form-data">
				<div class="title_wrap flex">
					<div>Export</div>
				</div>
				<div class="table_header">
					<table class="anno_table">
						<colgroup>
							<col style="width: 10%;"/>
						</colgroup>
						<thead>
							<tr>
								<th></th>
								<th>Dataset Name</th>
								<th>Description</th>
								<th>Media type</th>
								<th>Label Type</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table_body">
					<table class="anno_table">
						<colgroup>
							<col style="width: 10%;"/>
						</colgroup>
						<thead>
							<tr>
								<td>
									<input name="dataset" type="radio" value="">
									<div class="checkBox"></div>
								</td>
								<td></td>
							</tr>
						</thead>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
<script>
	var exports = {
			
			pt : $("#exports"),
			init : function() {
				var that = this;
				that.reset();
				
				that.listener();
				
				that.comoputed.getDatasetList();
			},
			reset : function() {
				
			},
			computed : {
				
				getDatasetList : function() {
					
					console.log("## getDatasetList CALL ")
					var that = exports;
					
					$.ajax({
						url : baseUrl + "data/getDatasetList.json",
						type : "GET",
						traditional : true,
						success : function (res) {
							console.log("## getDatasetList success : ", res)
						},
						error : function (err) {
							console.log("## getDatasetList err : ", err)
							
						}
						
					})
					
				},
				
				
				
			}
			
			
	}
</script>