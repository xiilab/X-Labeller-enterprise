<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<style>
		#exports { width :100%; height: 100%; background-color: #f5f5f5; }
		#exports .border_box { display: flex; flex-direction: column; height: 100%; padding: 0px 30px;  }
		#exports .title_wrap { height: 5%; padding: 23px 0 14px 0; color: #5b666e; }
		#exports .title_wrap label { font-size: 13px; font-weight: 400; color: #343434; }
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
		
		#exports .btn_wrap { display: flex; display: -webkit-flex; margin-bottom: 10px; margin-left: 15px; }
		#exports .btn_wrap button { cursor: pointer; width: 100px; line-height: 28px; text-align: center; background-color: #f8f8f8; font-size: 12px; font-weight: 300; color: #343434; border: 1px solid #dedcde; }
		
		#exports .btn_wrap button { background-color: #4c84ff; color: #ffffff; }
		#exports .btn_wrap button:hover { background-color: #3A71E9; } 
		
		#exports .btn_wrap span { margin-right: 8px; line-height: 28px; display: inline-block; font-size: 16px; }
		#exports .btn_wrap input[type='radio'] { display: none; }
		#exports .btn_wrap input[type='radio']+label { line-height: 28px; padding-left:18px; margin-right: 18px; font-size: 16px; background: url('images/btn_radio_normal.png') left no-repeat; cursor: pointer; }
		#exports .btn_wrap input[type='radio']:checked+label { background: url('images/btn_radio_selected.png') left no-repeat; }
		
		#exports .btn_wrap.download .download_link { display: flex; align-items: center; margin-left: 10px; }
		
		#exports .label_type_wrap { margin-bottom: 10px; margin-left: 15px; font-weight: 300 !important; }
		#exports .label_type_wrap .wrap { display: flex; align-items: center; margin-bottom: 10px; }
		/* #exports .label_type_wrap .radioBtn { position: relative; top: 2px; } */
		#exports .label_type_wrap .radio_label { margin-left: 10px; }
		
		#exports .half_wrapper { display: flex; height: 85%; align-items: flex-start; }
		
		#exports .half_wrap { display: flex; width : 50%; height: 100%; flex-direction: column; }
		#exports .half_wrap .title_wrap { height : unset; padding-top: 0px; }
		#exports .half_wrap .table_body { height: 85%; max-height: 85%; overflow: auto; }
		#exports .half_wrap.left { padding-right: 20px; }
		#exports .half_wrap.right { padding-left: 20px; }
		
		#exports label.loading { display: flex; position: relative; margin-left: 10px; padding-right: 30px; align-items: center; color: #4c84ff; }
		#exports label.loading::before { content:''; position: absolute;  top: 50%; right: 0; transform: translateY(-50%); width: 20px; height: 20px; background-image: url('./images/loader.gif'); background-repeat: no-repeat; background-size: 100% 100%; }
		
	</style>
</head>
<body>
	<div class="container" id="exports">
		<div class="border_box">
			<div class="title_wrap">
				<label>데이터 추출</label>
			</div>
			
			<div class="half_wrapper">
				<div class="half_wrap left">
					<div class="title_wrap">
						<label>STEP 1. 데이터셋 선택</label>
					</div>
					<div class="table_header">
						<table class="anno_table">
							<colgroup>
								<col style="width: 5%;"/>
								<col style="width: 10%;"/>
							</colgroup>
							<thead>
								<tr>
									<th><input class="checkAll" type="checkbox" value=""/></th>
									<th>ID</th>
									<th>데이터셋명</th>
									<th>설명</th>
									<th>미디어 타입</th>
									<th>라벨 타입</th>
									<th>생성 시간</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table_body">
						<table class="anno_table">
							<colgroup>
								<col style="width: 5%;"/>
								<col style="width: 10%;"/>
							</colgroup>
							<tbody>
								<!-- 데이터셋 목록 출력 -->
							</tbody>
						</table>
					</div>
				</div>
				<div class="half_wrap right">
				
					<div class="title_wrap">
						<label>STEP2. 추출형식 선택</label>
					</div>
					<div class="label_type_wrap">
						<!-- <div class="wrap">
							<input id="dataset-virtual" class="radioBtn" name="dataset-type" type="radio" value="" disabled/>
							<label for="dataset-virtual" class="radio_label">virtual</label>
						</div> -->
						<div class="wrap">
							<input id="dataset-coco" class="radioBtn" name="dataset-type" type="radio" value="coco" checked/>
							<label for="dataset-coco" class="radio_label">coco</label>
						</div>
						<div class="wrap">
							<input id="dataset-voc" class="radioBtn" name="dataset-type" type="radio" value="voc"/>
							<label for="dataset-voc" class="radio_label">voc</label>
						</div>
					</div>
					
					<div class="title_wrap">
						<label>STEP3. 추출 시작 & 파일 다운로드</label>
					</div>
					
					<div class="download btn_wrap">
						<button class="save">추출 시작</button>
						<label class="loading hide">Generate export file...</label>
						<!-- <a class="download_link hide">export.zip</a> -->
					</div>
				</div>
			</div>
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
				that.computed.getDatasetList();
			},
			reset : function() {
				
				var that = exports;
				that.pt.find('.table_body table.anno_table tbody').empty();
				that.pt.find("a.download_link").addClass("hide");
				that.pt.find("label.loading").addClass("hide");
				
				that.pt.find("a.download_link").removeAttr("href");
				that.pt.find("a.download_link").removeAttr("download");
			},
			
			listener : function() {
				
				var that = exports;
				
				// ### 1. 체크박스 선택했을 때
				that.pt.find(".check").off("change").on("change", function(e){
					
					var totalCount = that.pt.find(".check").length;
					var checkedCount = that.pt.find(".check:checked").length;
					
					if(totalCount == checkedCount) {
						that.pt.find(".checkAll").prop("checked", true);
					} else {
						that.pt.find(".checkAll").prop("checked", false);
					}
					
					
				});
			
					
				// ### 2. 전체 체크박스 선택했을때
				that.pt.find(".checkAll").off("change").on("change", function(e){
					
					var checked = e.target.checked;
					
					if(checked) {
						that.pt.find(".check").prop("checked", true);
					} else {
						that.pt.find(".check").prop("checked", false);
					}
					
				});
				
				// ### 3. table row click 했을떄 체크박스 클릭 되도록 trigger
				that.pt.find(".table_body .anno_table td").off("click").on("click", function(e){
					
					var checkBox = that.pt.find(e.target).parent("tr").find(".check");
					
					if(checkBox) checkBox.trigger("click");
					
				});
				
				
				// ### 4. save 버튼 클릭 했을
				that.pt.find("button.save").off("click").on("click", function(e){
					
					if(that.computed.getValidationResult()) {
						
						var typeValue = that.pt.find(".radioBtn:checked").attr("value");
						var checkedDatasetId = $.makeArray(that.pt.find(".check:checked").map(function(){
							return $(this).attr("value");
						})).toString();
						
						switch(typeValue) {
								
							case "voc" :
								that.computed.callExportApiVoc(checkedDatasetId);
								break;
						
							case "coco" :
								that.computed.callExportApiCoco(checkedDatasetId);
								break;
								
							case "voc" :
								
								break;
								
							default :
								
								break;
						}						
						
					
					}
				});
				
				
				
				
			},
			
			computed : {
				
				// 유효서 검사
				getValidationResult : function() {
					
					var that = exports;
					
					if( ! that.pt.find(".check:checked").length > 0 ) {
						alert("데이터셋을 하나이상 선택해 주세요.");
						return false;
					}
					
					if( ! that.pt.find(".radioBtn:checked").length > 0 ) {
						alert("타입을 선택해주세요.");
						return false;
					}
					
					return true;
					
				},
				
				
				// 데이터셋 목록 호출 
				getDatasetList : function() {
					
					var that = exports;
					console.log("## getDatasetList CALL ")
					
					$.ajax({
						url : baseUrl + "data/getDatasetList.json",
						type : "GET",
						traditional : true,
						success : function (res) {
							console.log("## getDatasetList success : ", res);
							if(res.result.code == "200") {
								that.render.renderDatasetList(res.result.data);
							}
						},
						error : function (err) {
							console.log("## getDatasetList err : ", err)
							
						}
						
					});
								
				},
				
				// 코코데이터셋 export 
				callExportApiCoco : function(checkedDatasetId) {
					
					var that = exports;
					
					var xhr = new XMLHttpRequest();
					
					xhr.open(
						"GET",
						baseUrl + "imExport/export/coco?dataset_ids=" + checkedDatasetId,
						true
					);
					xhr.responseType = "blob";
					xhr.onreadystatechange = function () {
						
						// console.log("## onreadystatechange : " , this.readyState, this.status );
						if(this.readyState == 4 && this.status == 200 ) {
							
							that.pt.find("label.loading").addClass("hide")
							
							alert("파일 생성이 완료되었습니다.")
							
							var fileName = "";
							var disposition = xhr.getResponseHeader('Content-Disposition');
							
							if(disposition && disposition.indexOf('attachment') !== -1) {
								
								 /* var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/; */
								 var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/i;
					             var matches = filenameRegex.exec(disposition);
					             if (matches != null && matches[1]) fileName = matches[1].replace(/['"]/g, '');
					             
							}
							
							// console.log("## fileName : ", fileName);
							
							/* var a = that.pt.find("a.download_link");
 							a.attr("href", URL.createObjectURL(this.response));
 							a.attr("download", fileName);
 							a.removeClass("hide"); */
							
							var a = document.createElement('a');
							var url = URL.createObjectURL(this.response);
							a.href = url;
							a.download = fileName;
							document.body.appendChild(a);
							a.click();
							window.URL.revokeObjectURL(url);
							
						} else if(this.readyState == 4 && this.status != 200 ) {
							
							alert("다운로드 중 오류가 발생했습니다.")
							that.pt.find("a.download_link").addClass("hide");
							that.pt.find("label.loading").addClass("hide");
							
						}
					}
					
					that.pt.find("a.download_link").addClass("hide");
					that.pt.find("label.loading").removeClass("hide");
					xhr.send();
					
				},
				
				callExportApiVoc : function (checkedDatasetId) {
					
					var that = exports;
					
					var xhr = new XMLHttpRequest();
					
					xhr.open(
						"GET",
						baseUrl + "imExport/export/voc?dataset_ids=" + checkedDatasetId,
						true
					);
					xhr.responseType = "blob";
					xhr.onreadystatechange = function () {
						
						console.log("## onreadystatechange : " , this.readyState, this.status );
						if(this.readyState == 4 && this.status == 200 ) {
							
							that.pt.find("label.loading").addClass("hide")
							
							alert("파일 생성이 완료되었습니다.")
							
							var fileName = "";
							var disposition = xhr.getResponseHeader('Content-Disposition');
							
							if(disposition && disposition.indexOf('attachment') !== -1) {
								 var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/i;
					             var matches = filenameRegex.exec(disposition);
					             if (matches != null && matches[1]) fileName = matches[1].replace(/['"]/g, '');
					             
							}
							
							/* var a = that.pt.find("a.download_link");
 							a.attr("href", URL.createObjectURL(this.response));
 							a.attr("download", fileName);
 							a.removeClass("hide"); */
 							
 							var a = document.createElement('a');
							var url = URL.createObjectURL(this.response);
							a.href = url;
							a.download = fileName;
							document.body.appendChild(a);
							a.click();
							window.URL.revokeObjectURL(url);
							
						} else if(this.readyState == 4 && this.status != 200 ) {
							
							alert("다운로드 중 오류가 발생했습니다.")
							that.pt.find("a.download_link").addClass("hide");
							that.pt.find("label.loading").addClass("hide");
							
						}
					}
					
					that.pt.find("a.download_link").addClass("hide");
					that.pt.find("label.loading").removeClass("hide");
					xhr.send();
				},
			},
			
			render : {
				
				// 데이터셋 목록 render
				renderDatasetList : function(data) {
					
					var that = exports;
					var result = '';
					
					if(data.length > 0) {
						
						for ( var i = 0; i < data.length; i++ ) {
							result += '<tr>'
									+ '	<td><input class="check" type="checkbox" value="' + data[i].dataset_id + '"/></td>'
									+ '	<td>' + data[i].dataset_id + '</td>'
									+ '	<td>' + data[i].title + '</td>'
									+ '	<td>' + data[i].contents + '</td>'
									+ '	<td>' + data[i].media_type + '</td>'
									+ '	<td>' + data[i].label_type + '</td>'
									+ '	<td>' + data[i].created_date + '</td>'
									+ '</tr>';
						}
						
						
					} else {
						
						retult += '<tr>'
						        + '	<td colspan="5">조회된 결과가 없습니다.</td>'
						        + '</tr>';
						
					}
					
					that.pt.find('.table_body table.anno_table tbody').append(result);
					that.listener();

				},
			}
			
			
	}
</script>
