<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>


	<title>X-labeller</title>

<style>


/* 공통  */

#task_map {width: 100%; height: 100%;}

#task_map .ms_wrap {width: 100%;height: 100%; margin-top:23px; }

#task_map .hover_box {border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
#task_map .hover_box div {font-family: Open_Sans; font-size: 13px; color: #555555;}
#task_map .hover_div div {word-break: break-word; margin: 2px 5px; white-space: normal; font-weight: 300; font-family: Open_Sans;}
#task_map .hover_div {max-width: 264px; text-align: left; position: relative; }
#task_map .hover_box {max-width: 264px; text-align: left; }

/* #task_map .empty_wrap {text-align: center; margin-top: 170px; } */
#task_map .empty_wrap {text-align: center; padding: 170px; }
#task_map .empty_wrap .no_image {margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; }
#task_map .empty_wrap .eng_text {font-family: Open_Sans; margin-bottom: 3px; font-size: 16px; font-weight: 300; color: #777777;}
#task_map .empty_wrap .kor_text {font-family: Open_Sans; font-size: 12px; color: #777777; font-weight: 200;}
#task_map .no_image {height: 37px; background-image: url('./images/icon_nodata_list.png'); }

/* 메인  */

#task_map .main_wrap {width: 60% ; height: 100%; position: relative;}
#task_map .title_wrap span {font-family: Open_Sans; font-size: 12px; font-weight: 400; display:inline-block; color: #343434; margin-bottom: 21px;}
#task_map .list_total {float: right; font-family: Open_Sans; font-size: 12px; font-weight: 400; color: #343434; margin-bottom: 21px;}

#task_map .main_wrap .list_container .table_body {height: calc(100% - 46px); overflow-y: overlay; overflow-x:hidden;  }
#task_map .main_wrap .ws_container .table_body {height: calc(100% - 46px);} 
#task_map .ms {height: calc(100% - 23px);}
#task_map .ws_header {width: 220px; line-height: 45px; border-right: 1px solid #e5e5e5;}
#task_map .ws_container .table_header .anno_table {table-layout : auto;}

#task_map .main_wrap .drop_wrap {align-items: normal; border: 1px solid #e5e5e5; height: calc(100% - 141px);}

#task_map .main_wrap .ws_container thead tr th{border-right: 1px solid #e5e5e5;}

#task_map .dragOver {width: 100%; height: 100%; border: 0;}

#task_map table tbody tr td {cursor: default;}
#task_map .main_wrap .btn_wrap {position:absolute; right: 30 ; bottom: 0 ; margin-bottom: 41px; }
#task_map .main_wrap .del_btn {padding: 0 ; width: 68px;height: 28px; background-color: #f8f8f8; font-family: Open_Sans; font-size: 12px; font-weight: 500; color: #343434;}
#task_map .main_wrap .list_container{ position:relative;}
#task_map .main_wrap .list_container table tbody tr .normal_img{ z-index: 99; display: none;   border-radius: 1px ; border : 1px solid #dadada; width: 230px;height: 230px; box-shadow: 0 5px 9px -1px rgba(0, 0, 0, 0.16); background-color: #ffffff}
#task_map .main_wrap .list_container table tbody tr .normal_img .frame_container {display:flex; height: 230px; align-items: center; justify-content: center; flex-direction: column; }
#task_map .main_wrap .list_container table tbody tr .preview .img_preview {cursor: pointer; border: 1px solid #979797; position: relative; margin: auto;  border-radius: 2px; background-size: 14px; width: 28px ; height: 28px; background-color: rgba(0, 0, 0, 0.1); background-image: url('./images/icon_preview_normal.png'); background-repeat: no-repeat; background-position: center; }
#task_map .main_wrap .list_container table tbody tr .preview .img_preview:hover { background-image: url('./images/icon_preview_hover.png'); border: 1px solid #4c84ff;}

/* 서브 */

#task_map .sub_wrap {width: 40% ; height: 100%; background-color: #f5f5f5; position:relative; overflow-y: overlay; overflow-x: hidden; }
/* #task_map .margin {margin: 0 43px; height: calc(100% - 23px); } */
#task_map .margin {margin: 0 43px; }

#task_map .sub_wrap .box_wrap { margin-bottom: 17px; padding: 15px; }
#task_map .sub_wrap .box_wrap.border { border: 1px solid #dedcde; }

#task_map .sub_wrap .box_wrap .input_wrap > label {margin-right: 27px; float: left; width: 180px; font-family: Open_Sans; font-size: 12px;  color: #343434; font-weight: 300; }
#task_map .sub_wrap .box_wrap .input_wrap > input {border-radius:2px; width: calc(100% - 172px); height: 32px; background-color: #ffffff; padding: 0 11px ; font-family: Open_Sans; font-weight: 300;}
#task_map .sub_wrap .box_wrap .input_wrap input:focus {border: 1px solid #4c84ff;}

#task_map .sub_wrap .list_wrap {height: calc(100% - 730px); position:relative;}

#task_map .sub_wrap .box_wrap .input_wrap {margin-bottom: 12px;}

/* #task_map .sub_wrap .box_wrap .input_wrap:first-child {margin-bottom: 12px;}
#task_map .sub_wrap .box_wrap .input_wrap:nth-child(2){margin-bottom: 28px;}
#task_map .sub_wrap .box_wrap .input_wrap:nth-child(3){margin-bottom: 36px;} */

#task_map .sub_wrap .check_box_wrap {width:calc(100% - 148px);}
#task_map .sub_wrap .check_box_wrap .check_box > label {font-family: Open_Sans; font-size: 13px;font-weight: 300; color: #616263; margin-left: 19px; }
/* #task_map .sub_wrap .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
#task_map .sub_wrap .table_body {max-height: 340px; overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; }

#task_map .sub_wrap .btn_wrap {text-align:center; position: relative; left: 0% ; right: 0% ; top: 2%; bottom: 0 ; margin-bottom: 37px;}
#task_map .sub_wrap .submit_btn {border-radius: 23px; width: 240px; height: 36px; box-shadow: 0 4px 8px 0 #b4d7ff; background-color: #4c84ff; font-family: Open_Sans; font-weight: 300; border: 0; }
#task_map .sub_wrap .submit_btn:hover  {background-color: #3A71E9; }

#task_map .td_wrap .radioBtn {margin: 0 20px;}
#task_map .td_wrap .csv_name {width: calc(100% - 108px); overflow: hidden; white-space: nowrap; text-overflow: ellipsis;}

/* 트리 */

#task_map .ztree .level0 span.button[id$=ico] { background: url("images/icon_tree_dataset_selected.png") !important; }
#task_map .ztree a.curSelectedNode.level0  span.button[id$=ico] { background: url("images/icon_tree_dataset_white.png") !important; }
#task_map .ztree .level1 span.button[id$=ico] { background: url("images/icon-tree-image.png") !important; }
#task_map .ztree a.curSelectedNode.level1  span.button[id$=ico] { background: url("images/icon-tree-image-white.png") !important; }

#task_map .ws_wrap2 ,#task_map .ws_wrap2 #workspace {height: 100%; background-color: #eff3f7; border: 0;}
#task_map .ws_wrap2 #workspace #dir_wrap .ztree li {background-color: #eff3f7;}
#task_map .ws_wrap2 #workspace #dir_wrap .ztree{height: 100% !important; }
#task_map .ws_wrap2 #workspace #dir_wrap .ztree li a { height: 48px; padding: 0;}

/* 스크롤 */

#task_map .main_wrap .ws_container .table_body::-webkit-scrollbar {background :#eff3f7;}
#task_map .main_wrap .ws_container .table_body{border-right: 1px solid #e5e5e5;}
#task_map input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button { -webkit-appearance: none; margin: 0; }



#task_map .model_download_btn { padding:5px;
    margin: 0 auto;
    border-radius: 5px;
    background-color: #4c84ff;
    font-size: 12px;
    color: #ffffff;
    cursor: pointer;  }
#task_map .model_download_btn:hover { background-color: #3A71E9; }


/* gpu node list */
#task_map .gpu_node_list_wrap { width: 100%; text-align: center;}
#task_map table.gpu_table th { border-top: 2px #3a3b3d solid; background-color: #fafafa; height: 44px; font-size: 11px; font-weight: 400; color: #333333; }
#task_map table.gpu_table th, table.gpu_table tr, table.gpu_table td { text-align: center; border-bottom: 1px solid #e5e5e5; border-collapse: collapse; border-spacing: 0; }
#task_map .table_body table.gpu_table { width: 100%; font-family: Open_Sans; font-size: 12px; color: #343434; font-weight: 300; border-collapse: collapse; }
#task_map .table_body table.gpu_table tr:hover { background-color: #f4fcfe; }
#task_map .table_body table.gpu_table td { padding-top: 3px; padding-bottom: 3px; }
#task_map .table_header table.gpu_table { width: 100%; border-collapse: collapse; }


#task_map .contents > div { height: 100%; }
#task_map .sub_wrap .file_name_wrap { margin-bottom: 17px; padding: 15px; }
#task_map .sub_wrap .file_name_wrap.border { border: 1px solid #dedcde; }
#task_map .sub_wrap .file_name_wrap .input_wrap > label { margin-right: 27px; float: left; width: 180px; font-family: Open_Sans; font-size: 12px;  color: #343434; font-weight: 300;  }
#task_map .sub_wrap .file_name_wrap .input_wrap > input {border-radius:2px; width: calc(100% - 67px); height: 32px; background-color: #ffffff; padding: 0 11px ; font: 400 11px system-ui; }

#task_map .checkBtn { display:inline-block; width: 16px; height: 16px; background: url("${pageContext.request.contextPath}/resources/images/icon_gpu_check.png") no-repeat center; }

#task_map .gpu_reset { width: 45px; height: 15px; border-radius: 5px; cursor: pointer; font-size: 12px; display: inline-block; text-align: center; margin: 0 auto; padding:5px; background-color: #4c84ff; color: #fff; line-height: 15px; margin-left: 15px; }

#task_map .tooltip_wrap { width: 17px; height: 17px; display: inline-block; cursor: pointer; margin: 0 5px; position: relative; top: 4px; background: url("${pageContext.request.contextPath}/resources/images/btn_help_nor.png") no-repeat; }
#task_map .tooltip { width: 352px; padding: 10px 12px 10px 12px; color: #fff; background-color: rgba(0, 0, 0, 0.6); -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; font: 400 12px system-ui; position: absolute; z-index: 9999; left: 36.5%; padding-left: 12px; visibility: hidden; opacity: 0; transition: visibility 0s, opacity 0.3s ease; }
#task_map .tooltip.on { width: 352px; padding: 10px 12px 10px 12px; color: #fff; background-color: rgba(0, 0, 0, 0.6); -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; font: 400 12px system-ui; position: absolute; z-index: 9999; left: 36.5%; padding-left: 12px; visibility: visible; opacity: 1; transition: visibility 0s, opacity 0.3s ease; }

#task_map .algorithm_name { font: 400 11px system-ui !important; color: #777 !important; }

#task_map .main_wrap .anno_table_body { max-height: calc(100% - 194px); overflow-y: overlay; overflow-x: hidden; }
</style>

</head>
<body>
	<div class="container" id="task_map">
		<div class="contents flex">
			<div class="main_wrap">
				<div class="ms">
					<div class="ms_wrap">
						<div class="title_wrap">
							<span>Compute Score</span>
							<span class="list_total">Total 0</span>
						</div>
						<div class="table_header">
							<table class="anno_table">
								<colgroup>
									<col style="width: 61px;"></col>
									<col style="width: 61px;"></col>
									<col style="width: 61px;"></col>
									<col style="width: 130px;"></col>
									<col style=""></col>
									<col style="width: 130px;"></col>
									<col style="width: 130px;"></col>
								</colgroup>
								<thead>
									<tr>
										<th></th>
										<th>No.</th>
										<th>USER_ID</th>
										<th>TITLE</th>
										<th>CONTENTS</th>
										<th>LABEL_TYPE</th>
										<th>CREATED_DATE</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="anno_table_body">
							<table class="anno_table">
								<colgroup>
									<col style="width: 61px;"></col>
									<col style="width: 61px;"></col>
									<col style="width: 61px;"></col>
									<col style="width: 130px;"></col>
									<col style=""></col>
									<col style="width: 130px;"></col>
									<col style="width: 130px;"></col>
								</colgroup>
								<tbody></tbody>
							</table>
						</div>
<!-- 						<div class="drop_wrap flex"> -->
<!-- 							<div class="ws_container"> -->
<!-- 								<div class="table_header"> -->
<!-- 									<table class="anno_table"> -->
<%-- 										<colgroup> --%>
<%-- 											<col style="width: 220px;"></col> --%>
<%-- 										</colgroup> --%>
<!-- 										<thead> -->
<!-- 											<tr> -->
<!-- 												<th>DATASET LIST</th> -->
<!-- 											</tr> -->
<!-- 										</thead> -->
<!-- 									</table> -->
<!-- 								</div> -->
<!-- 								<div class="table_body"> -->
<!-- 									<div class="ws_wrap2"> -->
<%-- 										<jsp:include page="/workspace" flush="false" /> --%>
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 							<div class="list_container"> -->
<!-- 								<div class="table_header"> -->
<!-- 									<table class="anno_table"> -->
<%-- 										<colgroup> --%>
<%-- 											<col style="width: 80px;"></col> --%>
<%-- 											<col style=""></col> --%>
<%-- 										</colgroup> --%>
<!-- 										<thead> -->
<!-- 											<tr> -->
<!-- 												<th>PREVIEW</th> -->
<!-- 												<th class="th_path">PATH</th> -->
<!-- 											</tr> -->
<!-- 										</thead> -->
<!-- 									</table> -->
<!-- 								</div> -->
<!-- 								<div class="table_body run_area"> -->
<!-- 									<table class="anno_table"> -->
<%-- 										<colgroup> --%>
<%-- 											<col style="width: 80px;"></col> --%>
<%-- 											<col style=""></col> --%>
<%-- 										</colgroup> --%>
<!-- 										<tbody></tbody> -->
<!-- 									</table> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
				</div>
			</div>
			<div class="sub_wrap">
				<div class="margin">
					<div class="ms_wrap">
						<div class="title_wrap">
							<span>Config</span>
							<span class="algorithm_name"></span>
						</div>

						<div class="box_wrap border">
<!-- 							<div class="input_wrap flex">
								<label>score</label><input type="number" name="score" value="0" step="0.01">
							</div>
							<div class="input_wrap flex">
								<label>output file name</label><input type="text" name="file"
									placeholder="Please Enter the Filename">
							</div>
							<div class="input_wrap flex">
								<label></label>
								<div class="check_box_wrap">
									<div class="check_box flex">
										<div class="checkBox first"></div>
										<label>use convert model</label>
									</div>
								</div>
							</div> -->
						</div>
<!-- 						<div class="title_wrap"> -->
<!-- 							<span>CSV File Name</span> -->
<!-- 						</div> -->
<!-- 						<div class="file_name_wrap border"> -->
<!-- 							<div class="input_wrap flex"> -->
<!-- 								<label>output file name</label><input id="file_name" type="text" name="file" placeholder="Please Enter the Filename" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/> -->
<!-- 							</div> -->
<!-- 						</div> -->
						<div class="title_wrap">
                        	<span>Select GPU Node</span>	
              				<div class="gpu_reset">Refresh</div>					
						</div>

                 <!--        <span class="list_total">Total 0</span> -->
                        <div class="list_wrap">
                            <div class="table_header">
                                <table class="gpu_table">
                                    <colgroup>
                                        <col style="width:200px;"></col>
                                        <col style="width:200px;"></col>
                                        <col style="width:200px;"></col>
                                        <col style="width:45px;"></col>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>GPU NODE</th>
                                            <th>DRIVER</th>
                                            <th>STATUS</th>
                                            <th><div class="checkBtn"></div></th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                            <div class="table_body">
                                <table class="gpu_table">
                                    <colgroup>
                                        <col style="width:200px;"></col>
                                        <col style="width:200px;"></col>
                                        <col style="width:200px;"></col>
                                        <col style="width:45px;"></col>
                                    </colgroup>
                                    <tbody>
<!--                                     <tr><td colspan='4' align='center'>Loading GPU list...</td></tr> -->
                                    </tbody>
                                </table>
                            </div>
                        </div>							
						<span class="model_download_btn">Download Model</span>
						<span class="list_total">Total 0</span>
						<div class="list_wrap">
							<div class="table_header">
								<table class="anno_table">
									<colgroup>
										<col style=""></col>
									</colgroup>
									<thead>
										<tr>
											<th>MODEL</th>
										</tr>
									</thead>
								</table>
							</div>
							<div class="table_body">
								<table class="anno_table">
									<colgroup>
										<col style=""></col>
									</colgroup>
									<tbody></tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="btn_wrap">
					<button class="submit_btn">Compute Score</button>
				</div>
			</div>
		</div>
	</div>
</body>


<script>
	$(document).on("sessionLoad", function() {

	});

	var imgList = [];
	var img_path = new Array();
	var obj_run;
	
	var canvas;
	var colorHash = new ColorHash();
	var scale;
	
	
	
	//오른쪽 스크롤에 사용
	var csv_arr = [];
	var radio_obj = {};

	var scrollObj = {
			scroll_start:0,
			scroll_end:0,
			isScroll_top:0,
			isScroll_end:0,
			isScroll : false,
			default_size : 40,
			half_size : (40 / 2)
		
	}
	
	//스크롤에 사용할것 (왼쪽 어노테이션)
	
	var annotation_arr = [];
	var radio_obj2 = {};
	var label_type = "";
	var algorithm_type = "";
	var scrollObj2 = {
			scroll_start:0,
			scroll_end:0,
			isScroll_top:0,
			isScroll_end:0,
			isScroll : false,
			default_size : 40,
			half_size : (40 / 2)
	}	
	
	//왼쪽 스크롤에 사용
	var image_default_size = 40;
	var image_arr = [];
	var image_obj = {};
	var image_half_size = (image_default_size / 2);
	var removed_size = 0;
	var linked_list = null; 
	var last_node;
	var start_node;
	var image_remain_size;
	var isImageScroll_top = false;
	var isImageScroll_end = false;
	var isImageScroll = false;
	var isInit = false;
	var image_box_obj = {};
	
	var dataset_id = "";

	var map_id;
	
	var label_type;
	var task_map = {
		pt : $("#task_map"),
		init : function(id) {
// 			createObject_run();
// 			workspace(obj_run);
			let that = task_map;
			map_id = id;
			that.resetView();
			that.setDefaultListener();
			that.pt.find(".submit_btn").hide();
			that.addEmptyData(that.pt.find(".list_container .table_body.run_area "), "No Data", "you have not added any data yet");
			console.log("map_id:::::", map_id);
		},
		
		addEmptyData : function(elem, data1, data2){
			let that = task_map;
			elem.append("<div class='empty_wrap'><div class='no_image'></div><div class='eng_text'>"+data1+"</div><div class='kor_text'>"+data2+"</div></div>")
		},
		
		removeEmptyData : function(elem){
			let that = task_map;
			elem.find(".empty_wrap").remove();
		},

		setDefaultListener : function() {
			let that = task_map;
			let check_box = that.pt.find(".check_box_wrap .checkBox");
			let msg = "";

			check_box.off("click").on("click", function() {
				$(this).toggleClass("selected");
			});

			$("#task_map").find(".submit_btn").off("click").on("click", function() {
				
// 				that.getResultList();
				that.setAjaxData();	
			});
			
			let cancel_img = that.pt.find(".list_container tbody tr");
			let close_all = that.pt.find(".list_container table thead tr th .checkBox");
			let del_btn = that.pt.find(".main_wrap .btn_wrap .del_btn");
			
			$(".model_download_btn").off("click").on("click", function() {
				that.downloadModel();
			});
			
			let gpu_select_btn = $("#task_map").find(".gpu_table tbody").find(".radioBtn");
			// GPU Node Select 
/* 			gpu_select_btn.off("click").on("click",function(){
				$(this).toggleClass("selected");
				if($(this).hasClass("selected")) {
					gpu_select_btn.not(this).removeClass("selected");
				}
			}); */
			//////
// 			let gpu_row_click = $("#task_map").find(".sub_wrap .list_wrap .gpu_table tbody tr")
// 			gpu_row_click.off("click").on("click",function() {
// 				let gpu_tr = $(this);
// 				//let gpu_btn = gpu_tr.children().children().children(".radioBtn");
// 				let gpu_btn = gpu_tr.children(".gpu_select").children(".radioBtn");
// 				//let gpu_id = gpu_tr.data("id");
// 				gpu_btn.toggleClass("selected");
// 				if(gpu_btn.hasClass("selected")){
// 					//radio_obj = {};
// 					$("#task_map").find(".sub_wrap .table_body .gpu_table tbody tr .radioBtn").removeClass("selected");
// 					gpu_btn.addClass("selected");
// 					//radio_obj[id] = id;
// 				} else {
// 					//radio_obj = {};
// 				}				
// 			});
		},
		

		resetView : function() {
			let that = task_map;
			that.reset();
			that.getModelList();
			that.getTaskById();
			that.pt.find(".sub_wrap .box_wrap").html("");
			$("#task_map").find(".table_body .gpu_table tbody").html("");
			$("#task_map").find(".table_body .gpu_table tbody").append("<tr><td colspan='4' align='center'>Loading GPU list...</td></tr>");
// 			that.drawGpuNodeList();
			that.getSelectableGpuNode();				// 임시로 막아둠
			
			let gpu_reset = $("#task_map").find(".gpu_reset");
			gpu_reset.off("click").on("click", function() {
				that.getSelectableGpuNode();
			});
			
			that.selectboxListener();
		},
		
////////////////////////////////임시 compte mAP /////////////////////////////////////		
		getAnnotationList : function() {
			let that = this;
			$("#loader").show(); 
			
			let ajaxData = {"label_type" : label_type};
			$.ajax({
				url : baseUrl + "annotation/getAnnotationList.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					$("#loader").hide();
					console.log("=====getAnnotationList=====", res);
					if (res.result.code == "200") {
						that.modifyAnnotationListData(res.result.data);
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}
					hideLoading("#project_upload .list_wrap");
				},
				error : function(err) {
					$("#loader").hide();
					console.log("ERROR!!", err);
				}
			});
		},
		
		resetAnnotationListData : function(){
			let scroll_info = scrollObj2;	
			scroll_info.isScroll_top = false;
			scroll_info.isScroll_end = false;
			scroll_info.isScroll = false;
			annotation_arr = [];
			radio_obj = {};
		},
		
		modifyAnnotationListData : function(data){
			let that = this;
			that.resetAnnotationListData();
			
			//test 
// 			for(let y=0; y<400; y++){
// 				for(let i=0, len = data.length; i<len; i++){
// 					annotation_arr.push(data[i]);
// 				} 
// 			}

			if(data.length == 0){
				that.pt.find(".submit_btn").hide();
				that.addEmptyData(that.pt.find(".main_wrap .list_wrap"), "No Annotation", "please add an annotation");
			} else {
				that.pt.find(".submit_btn").hide();
			}	
			
			for(let i=0, len = data.length; i<len; i++){
				annotation_arr.push(data[i]);
			} 
			
			that.pt.find(".main_wrap .list_total").text("Total " + annotation_arr.length);
			that.initAnnotationList();
		},
		
		initAnnotationList : function(){
			let that = this;
			that.pt.find(".main_wrap .anno_table_body table tbody").html("");
			let scroll_info = scrollObj2;
			
			scroll_info.scroll_start = 0;
			scroll_info.scroll_end = (scroll_info.default_size < annotation_arr.length ) ? scroll_info.default_size : annotation_arr.length;
			that.drawAnnotationList("init",scroll_info.scroll_start,scroll_info.scroll_end);
			if(annotation_arr.length > scroll_info.default_size) {
				scroll_info.isScroll_top = true;
				that.setAnnotationScrollListener();
			}
		},
		
		drawAnnotationList : function(type,start,end){
			let that = this;
			let target = that.pt.find(".main_wrap .anno_table_body table tbody");
			let scroll_info = scrollObj2;
			let html = "";
			let i = 0;
			for (i = start ; i < end ; i++) {
				let data = annotation_arr[i];
				let type = data["label_type"];
				html += " <tr data-id='"+data["id"]+"'> ";
				if(radio_obj[data.id] != undefined){
					html += "   <td><div class='radioBtn selected'></div></td>";	
				} else {
					html += "   <td><div class='radioBtn'></div></td>";
				}
				if(type == "polygon") {
					type = "Segmentation";
				} else if(type == "box"){
					type = "Bounding Box";
				}
				
				html += " 	<td>" + (i + 1) + "</td> ";
				html += " 	<td>" + data["user_id"] + "</td> ";
				html += " 	<td class='title'>" + data["title"] + "</td> ";
				html += " 	<td>" + data["contents"] + "</td> ";
				html += "	<td>" + type + "</td> ";				// jh.sa 추가 
				html += " 	<td>" + moment(data["created_date"]).format("YYYY-MM-DD")+ "</td> ";
				html += " </tr> ";
			}
			scroll_info.isScroll = false;
			
			if(type == "down" || type == "init"){
				target.append(html);	
			} else {
				target.prepend(html);
			}

			that.annotationListener();	
		},
		
		setAnnotationScrollListener : function(){
			let that = this;	
			
			that.pt.find(".main_wrap .anno_table_body").off("scroll").on("scroll",function(){
				let scroll_info = scrollObj2;
				let target = $(this);
				
				let st = target.scrollTop();
				let box_size = that.pt.find(".main_wrap .anno_table_body tbody tr").length;

				if(st + target.innerHeight() >= target[0].scrollHeight && !scroll_info.isScroll && !scroll_info.isScroll_end){
					scroll_info.isScroll = true;
					
					var diff = 0;
					if(scroll_info.scroll_end + scroll_info.half_size >= annotation_arr.length){
						diff = annotation_arr.length - scroll_info.scroll_end;
						scroll_info.scroll_end = annotation_arr.length;
						scroll_info.scroll_start = scroll_info.scroll_start + diff;
						scroll_info.isScroll_end = true;
						
					}else{
						diff = scroll_info.half_size;
						scroll_info.scroll_end = scroll_info.scroll_end + diff;
						scroll_info.scroll_start = scroll_info.scroll_start + diff;
					}
					var end = scroll_info.scroll_end;
					var start = end - diff;
					
					that.drawAnnotationList("down",start,end);
					that.removeBox2(diff,"down");	
					scroll_info.isScroll_top = false;
					
			
				}else if(st == 0 && !scroll_info.isScroll && !scroll_info.isScroll_top){
					scroll_info.isScroll = true;					
					
					var diff = 0;
					if(scroll_info.scroll_start - scroll_info.half_size <= 0){						
						diff = scroll_info.scroll_start;
						scroll_info.scroll_start = 0;
						scroll_info.scroll_end = scroll_info.scroll_end - diff;
						scroll_info.isScroll_top = true;
						
					}else{
						diff = scroll_info.half_size;
						scroll_info.scroll_end = scroll_info.scroll_end - diff;
						scroll_info.scroll_start = scroll_info.scroll_start - diff;
					}
					var start = scroll_info.scroll_start;
					var end = start + diff;
					
					
					that.drawAnnotationList("up",start,end);
					that.removeBox2(diff,"up");	
					scroll_info.isScroll_end = false;
							
				}
			});
		},
		
		removeBox2 : function(size,type){
			let that = this;

			if(size == 0){ return; }
			
			if(type == "down"){
				that.pt.find(".main_wrap tbody tr").slice(0,size).remove();					
			} else {		
				that.pt.find(".main_wrap tbody tr").slice(-size).remove();
			}
			that.pt.find(".main_wrap .anno_table_body").scrollTop((that.pt.find(".main_wrap .anno_table_body")[0].scrollHeight - that.pt.find(".main_wrap .anno_table_body").height()) / 2);
		},

		annotationListener : function() {
			let that = this;

			let row_click = that.pt.find(".anno_table_body table tbody tr");

			row_click.off("click").on("click",function() {
				let tr = $(this);
// 				radio_obj = {};
				let btn = tr.children().children(".radioBtn");
// 				let id = tr.data("id");
// 				radio_obj2[id] = id;
				let td = tr.children();
// 				algorithm_type = td.eq(5).text();
// 				if(algorithm_type == "null") {
// 					algorithm_type = "";
// 				} else if(algorithm_type == "Segmentation"){
// 					algorithm_type = "polygon";
// 				} else if(algorithm_type == "Bounding Box") {
// 					algorithm_type = "box";
// 				}
				btn.toggleClass("selected");
				if(btn.hasClass("selected")){
					that.pt.find(".anno_table_body table tbody tr .radioBtn").removeClass("selected");
					btn.addClass("selected");
// 					radio_obj2[id] = id;
					that.selectboxListener();
				} else {
// 					radio_obj2 = {};
// 					that.pt.find(".description_wrap").removeClass("border").html("");
// 					that.pt.find(".box_wrap").removeClass("border").html("");
// 					that.pt.find(".submit_btn").hide();
// 					that.pt.find(".algorithm_list").html("<option value=''>Please select algorithm</option>");
				}
			});
			
			that.pt.find(".anno_table_body table tbody td").off("mouseenter").on("mouseenter",function(){
				let text = $(this)[0].innerText;
				if(text == "") {return;}	
				$(this).empty();
				$(this).append(text);
				that.addHoverBox($(this), text);
			});
			
			that.pt.find(".anno_table_body table tbody td").off("mouseleave").on("mouseleave",function(){
				that.removeHoverBox($(this));
			});
		},
		
		selectboxListener : function(){
			let that = this;
			let algorithm_select = that.pt.find("select[name='algorithm_list']");
			
			
			that.pt.find("select[name='label_type']").change(function() {
			    var valueSelected = this.value;
			    console.log("value : " + valueSelected);
			    label_type = valueSelected;
/* 			    if(valueSelected == "Segmentation") {
			    	label_type = "polygon";
			    } else if(valueSelected == "Bounding box"){
			    	label_type = "box";
			    }
			     */
				that.getAnnotationList();
			});
			
			if($("#project_upload .radioBtn.selected").length == 0){
				
				algorithm_select.attr("disabled", "disabled");
			} else if ($("#project_upload .radioBtn.selected").length == 1) {
				algorithm_select.removeAttr("disabled");
				// .radioBtn.selected 의 label_type에 따라서 getAlgorithmList 파라미터 조건 분기해서 넘겨야함.
				// 만약 다른 radioBtn을 눌렀는데 같은 label_type이면 굳이 새로 안불러와도됨.
				// 다른 label_type이면 우측 화면에 혹시나 config가 떠있는지 확인하고 초기화시켜줘야됨.
				that.pt.find(".sub_wrap .box_wrap").html("");
				that.pt.find(".sub_wrap .box_wrap").removeClass("border");
				that.pt.find(".sub_wrap .description_wrap").html("");
				that.pt.find(".sub_wrap .description_wrap").removeClass("border");	
				that.pt.find(".submit_btn").hide();
				that.getAlgorithmList();
			};
			
		},			
		
		addHoverBox : function(elem,text){
			let that = this;

			if (elem[0].scrollWidth >  elem.innerWidth()) {
				let btn_width = elem.outerWidth();
				let btn_height = elem.outerHeight();
				let top = elem.offset().top;
				let left = elem.offset().left;
				let right = ($(window).width() - (elem.offset().left + elem.outerWidth())); 
				let bottom = ($(window).height() - (elem.offset().top + elem.outerHeight()));

			   	elem.append("<div class='hover_box'><div class='hover_div'><div>"+text+"</div</div></div>");
			   	let hover_box = elem.children(".hover_box");
			   	let text_div = hover_box.find(".hover_div div");
				hover_box.css({"display" : "block"});
			   	let text_width = text_div.outerWidth();
			   	let text_height = text_div.outerHeight();
			   	hover_box.css({"display" : "none"});
	   	
			   	let x;
			   	let y;
			   	
			   	if(right - text_width < 0){
			   		x = left - text_width;
			   		
			   	} else {
			   		x = left + btn_width / 2;
			   	}
			   	
			   	if(bottom - text_height < 0){
		   			y = top - text_height;
		   		} else {
		   			y = top + btn_height / 2;
		   		}

			   	hover_box.css({"top":y+"px", "left":x+"px","position": "fixed","display" : "block"});
			}
		},
		
		removeHoverBox : function(elem){
			let that = this;
			elem.find(".hover_box").remove();
		},		

		
//////////////////////////////// 임시 compte mAP /////////////////////////////////////		
		
// 		insertImg : function() {
// 			let that = task_map;
// 			that.putImg();
// 		},
		
		setDataSetResult : function(data) {
			var config = new Array();
			$.each(data, function(index, value) {
				var obj = new Object();
				obj.id = value.id;
				obj.pId = null;
				obj.name = value.title;
				obj.title = value.title;
				obj.contents = value.contents;
				obj.created_date = value.created_data;

				obj.drag = true;
				obj.isParent = true;
				obj.dropPrev = false;
				obj.dropNext = false;
				obj.nodeMove = false;

				config.push(obj);
			});

			wsObj[obj_run.key].addNode(null, config);
		},

		setDataResult : function(data, parentNode) {
			var that = task_map;

			var config = new Array();
			$.each(data, function(index, value) {
				var obj = new Object();
				obj.id = value.id;
				obj.pId = parentNode.id + "." + value.id;
				obj.name = value.id;
				obj.path = value.path;
				obj.dataset_id = value.dataset_id;

				obj.drag = true;
				obj.isParent = false;
				obj.dropInner = false;
				obj.nodeMove = false;

				config.push(obj);
			});

			wsObj[obj_run.key].addNode(parentNode, config);
		},

		setProgressbarGone : function(node) {
			if (node != null) {
				node.icon = "";
				wsObj[obj_run.key].dir.updateNode(node);
			}
		},

		setProgressbarVisible : function(node) {
			if (node != null) {
				node.icon = baseUrl + "css/img/loading.gif";
				wsObj[obj_run.key].dir.updateNode(node);
			}
		},

		getModelList : function() {
			let that = task_map;
			let url = "task/getCheckPointList.json";
			let ajaxData = {
				task_id : map_id
			}
			
			//test								//수정 
//   			let arr = [];
//  			//for(let i= 0; i<328; i++){
// 			for(let i= 0; i<5; i++){ 				
//  				arr.push("resnet"+i+"_csv_01.h5");
//  			}
//  			that.modifyModelListData(arr); 
			//test End
			
			
			that.getList(url, ajaxData);
			$("#loader").show();
		},

		getDatasetList : function() {
			let that = task_map;
			let url = "data/getDatasetList.json";
			let ajaData = {};
			let pNode = wsObj[obj_run.key].dir.getSelectedNodes()[0];
			that.getList(url, ajaData, pNode);
		},

		getList : function(url, ajaxData, parentNode) {
			let that = task_map;
			that.setProgressbarVisible(parentNode);

			$.ajax({
				url : baseUrl + url,
				data : ajaxData,
				success : function(res) {
					$("#loader").hide();
					console.log("=====getDataList with taskVO======", res);

					if (res.result.code == "200") {
						if (res.datasetVO != undefined) {
							that.setDataSetResult(res.result.data);
						}  else if (res.taskVO != undefined) {
							that.modifyModelListData(res.result.data);					// 막아둠
						} else {
						}

					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
						
					}
					
					that.setProgressbarGone(parentNode);
				},
				error : function(err) {
					$("#loader").hide();
					that.setProgressbarGone(parentNode);
					console.log("ERROR!!", err);
				},
			});
		},
		
		resetModelListData : function(){
			let that = task_map;
			let scroll_info = scrollObj;	
			scroll_info.isScroll_top = false;
			scroll_info.isScroll_end = false;
			scroll_info.isScroll = false;
			csv_arr = [];
			radio_obj = {};
		},

		modifyModelListData : function(data){
			let that = task_map;
			that.resetModelListData();
			
			if(data.length == 0){
				that.addEmptyData(that.pt.find(".sub_wrap .list_wrap .table_body .anno_table "), "No Model", "please train your task first");
			}
			
			for(let i = 0, len = data.length; i<len; i++){
				csv_arr.push(data[i]);
			}
			
			that.pt.find(".sub_wrap .list_total").text("Total " + csv_arr.length);
			
			that.initModelList();
		},
		
		initModelList : function(){
			let that = task_map;
			that.pt.find(".sub_wrap .table_body .anno_table tbody").html("");
			let scroll_info = scrollObj;
			
			scroll_info.scroll_start = 0;
			scroll_info.scroll_end = (scroll_info.default_size < csv_arr.length ) ? scroll_info.default_size : csv_arr.length;
			that.drawModelList("init",scroll_info.scroll_start,scroll_info.scroll_end);
			if(csv_arr.length > scroll_info.default_size) {
				scroll_info.isScroll_top = true;
				that.modelScrollListener();
			}
		},
		
		
		drawModelList : function(type, start, end) {
			
			let that = task_map;
			let target = that.pt.find(".sub_wrap .table_body .anno_table tbody");
			let scroll_info = scrollObj;
			let html = "";
			let i = 0;
			csv_arr.reverse();
			for (i = start ; i < end ; i++) {
				let data = csv_arr[i];
				console.log("csv_arr["+i+"] : ", data);
				if(data != ".DS_Store"){
					html += " <tr data-id='"+data+"'> ";
					if(radio_obj[data] != undefined){
						html += " 	<td><div class='td_wrap flex'><div class='radioBtn selected'></div><div class='csv_name'>"+data+"</div></div></td> ";
					} else {
						html += " 	<td><div class='td_wrap flex'><div class='radioBtn'></div><div class='csv_name'>"+data+"</div></div></td> ";
					}
					html += " </tr> ";					
				}
			}
			scroll_info.isScroll = false;

			if(type == "down" || type == "init"){
				target.append(html);	
			} else {
				target.prepend(html);
			}

			that.modelListener();
		},
	
		
		modelScrollListener : function(){
			let that = task_map;
			
			that.pt.find(".sub_wrap .anno_table .table_body").off("scroll").on("scroll",function(){
				let scroll_info = scrollObj;
				let target = $(this);
				
				let st = target.scrollTop();
				let box_size = that.pt.find(".sub_wrap .anno_table tbody tr").length;

				if(st + target.innerHeight() >= target[0].scrollHeight && !scroll_info.isScroll && !scroll_info.isScroll_end){
					scroll_info.isScroll = true;
					
					var diff = 0;
					if(scroll_info.scroll_end + scroll_info.half_size >= csv_arr.length){
						diff = csv_arr.length - scroll_info.scroll_end;
						scroll_info.scroll_end = csv_arr.length;
						scroll_info.scroll_start = scroll_info.scroll_start + diff;
						scroll_info.isScroll_end = true;
						
					}else{
						diff = scroll_info.half_size;
						scroll_info.scroll_end = scroll_info.scroll_end + diff;
						scroll_info.scroll_start = scroll_info.scroll_start + diff;
					}
					var end = scroll_info.scroll_end;
					var start = end - diff;
					
					that.drawModelList("down",start,end);
					that.removeBox(diff,"down");	
					scroll_info.isScroll_top = false;
					
			
				}else if(st == 0 && !scroll_info.isScroll && !scroll_info.isScroll_top){
					scroll_info.isScroll = true;					
					
					var diff = 0;
					if(scroll_info.scroll_start - scroll_info.half_size <= 0){						
						diff = scroll_info.scroll_start;
						scroll_info.scroll_start = 0;
						scroll_info.scroll_end = scroll_info.scroll_end - diff;
						scroll_info.isScroll_top = true;
						
					}else{
						diff = scroll_info.half_size;
						scroll_info.scroll_end = scroll_info.scroll_end - diff;
						scroll_info.scroll_start = scroll_info.scroll_start - diff;
					}
					var start = scroll_info.scroll_start;
					var end = start + diff;
					
					
					that.drawModelList("up",start,end);
					that.removeBox(diff,"up");	
					scroll_info.isScroll_end = false;
							
				}
			});
		},

		removeBox : function(size,type){
			let that = task_map;
			
			if(size == 0){ return; }

			if(type == "down"){
				that.pt.find(".sub_wrap .anno_table tbody tr").slice(0,size).remove();					
			} else {		
				that.pt.find(".sub_wrap .anno_table tbody tr").slice(-size).remove();
			}
			that.pt.find(".sub_wrap .table_body").scrollTop((that.pt.find(".sub_wrap .table_body")[0].scrollHeight - that.pt.find(".sub_wrap .table_body").height()) / 2);
		},

		modelListener : function() {
			let that = task_map;
			let row_click = that.pt.find(".sub_wrap .list_wrap .anno_table tbody tr")
			row_click.off("click").on("click",function() {
				let tr = $(this);
				let btn = tr.children().children().children(".radioBtn");
				let id = tr.data("id");
				btn.toggleClass("selected");
				if(btn.hasClass("selected")){
					radio_obj = {};
					that.pt.find(".sub_wrap .list_wrap .anno_table tbody tr .radioBtn").removeClass("selected");
					btn.addClass("selected");
					radio_obj[id] = id;
				} else {
					radio_obj = {};
				}
				
				if(csv_arr.length > 0){
					that.pt.find(".submit_btn").show();
				}
				
				if(row_click.find(".radioBtn.selected").length == 0){
					that.pt.find(".submit_btn").hide();
				}
			});
			
			that.pt.find(".sub_wrap .anno_table tbody td .csv_name").off("mouseenter").on("mouseenter",function(){
				if(this.children.length) { return; }
				let td = $(this);
				let text = td[0].innerText;
				td.empty();
				td.append(text);
				
				if (td[0].scrollWidth >  td.innerWidth()) {
					let btn_width = td.outerWidth();
					let btn_height = td.outerHeight();
					let top = td.offset().top;
					let left = td.offset().left;
					let right = ($(window).width() - (td.offset().left + td.outerWidth())); 
					let bottom = ($(window).height() - (td.offset().top + td.outerHeight()));

				   	td.append("<div class='hover_box'><div class='hover_div'><div>"+text+"</div</div></div>");
				   	let hover_box = td.children(".hover_box");
				   	let text_div = hover_box.find(".hover_div div");
					hover_box.css({"display" : "block"});
				   	let text_width = text_div.outerWidth();
				   	let text_height = text_div.outerHeight();
				   	hover_box.css({"display" : "none"});

				   	
				   	let x;
				   	let y;
				   	
				   	if(right - text_width < 0){
				   		x = left - text_width;
				   		
				   	} else {
				   		x = left + btn_width / 2;
				   	}
				   	
				   	if(bottom - text_height < 0){
			   			y = top - text_height;
			   		} else {
			   			y = top + btn_height / 2;
			   		}

				   	hover_box.css({"top":y+"px", "left":x+"px","position": "fixed","display" : "block"});
				}
			});
			
			that.pt.find(".sub_wrap .anno_table tbody td .csv_name").off("mouseleave").on("mouseleave",function(){
				let td = $(this);
				td.find(".hover_box").remove();
			});
			
		},
		
		reset : function() {
			let that = task_map;
			imgList = [];
			img_path = [];
			linked_list = null;
			that.pt.find(':input').val("");
// 			that.pt.find("input[name='score']").val(0);
			hideLoading("#task_map .list_container");
			that.pt.find(".list_container .table_body").off("scroll");
			that.pt.find(".sub_wrap .table_body").off("scroll");
			that.pt.find(".table_body").scrollTop(0);
 			let target = that.pt.find(".list_container .anno_table tbody");
 			target.empty();
 			$(target).html("");
			that.pt.find(".empty_wrap").remove();
			that.pt.find(".list_total").text("Total 0");
			that.pt.find(".checkBox").off("click");	
			that.pt.find(".checkBox").addClass("selected");

		},
		
		//레벨 0 에 대해 폴더 안에있는 모든 데이터 이미지가져옴 [원본]
// 		getEnrichmentDetail : function(datasetId) {
// 			var that = task_map;
// 			ajaxData = {
// 				dataset_id : datasetId
// 			};

// 			$.ajax({
// 				url : baseUrl + "data/getDataList.json",
// 				data : ajaxData,
// 				type : "POST",
// 				success : function(res) {
// 					console.log("===getEnrichmentDetail===", res);
// 					if (res.result.code == "200") {
// 						if(res.result.data != null){
// 							that.pt.find(".list_container table thead tr th .checkBox").removeClass("selected");
// 							that.drawEnrichmentDetail(res.result.data);	
// 						} 
// 					} else {
// 						alert(res.result.data);
// 					}
// 					hideLoading("#task_map .main_wrap .list_container");
// 				}, error : function(err) {
// 					hideLoading("#task_map .main_wrap .list_container");
// 					console.log("ERROR!!", err);
// 				}
// 			});
// 		},

// 		drawEnrichmentDetail : function(data) {
// 			var that = task_map;

// 			if(data.length != 0){
// 				for (var i = 0; i < data.length; i++) {
// 					let img_path = data[i].path;
// 					that.modifyImageData(img_path);
// 				}
// 				that.pt.find(".main_wrap .list_total").text("Total " + linked_list.length);
// 				that.appendNewPath(i);	
// 			} else {
// 				alert("사용 가능한 데이터가 없습니다.");
// 				that.addEmptyData(that.pt.find(".list_container .table_body.run_area "), "No Data", "you have not added any data yet");
// 				return false
// 			}

// 		},

// 		putImg : function() {
// 			let that = task_map;
// 			that.resetImageData();
// 			that.pt.find(".list_container .table_body").off("scroll");
// 			that.pt.find(".list_container .anno_table tbody").html("");
// 			let nodes = wsObj[obj_run.key].dir.getSelectedNodes();
// 			let level = nodes[0].level;
// 			dataset_id = nodes[0].id;
			
// 			if(linked_list == null){
// 				isInit = true;
// 			}
// 			that.removeEmptyData(that.pt.find(".list_container .table_body"));
// 			showLoading("#task_map .main_wrap .list_container");
// 			that.getEnrichmentDetail(dataset_id);
// 		},
		
// 		setStartAndLastNode : function(){
// 			let that = task_map;
// 			if(linked_list != null){
// 				last_node = linked_list.obj[that.pt.find(".list_container tbody tr").last().data("id")];
//   				start_node = linked_list.obj[that.pt.find(".list_container tbody tr").first().data("id")];
// 			}
// 		},
		
// 		resetImageData : function(){
// 			let that = task_map;
// 			linked_list = null;
// 			image_remain_size = 0;
//     		isImageScroll_top = false;
//     		isImageScroll_end = false;
//     		isImageScroll = false;
// 		},
		
// 		modifyImageData : function(data){
// 			let that = task_map;
// 			if(linked_list == null){
// 				that.resetImageData();
// 				linked_list = new LinkedList();
// 			} 
			
// 			if(linked_list.obj[data] == undefined){
// 				linked_list.push(data,data);			
// 			}

// 		},
		
		appendNewPath : function(i){
			let that = task_map;
			
			let append_size = i;
			if(isImageScroll_end){
				let box_size = that.pt.find(".list_container tbody tr").length;
				// 맨 처음 부분 스크롤이 있을때와 
				if(box_size < image_default_size){
					// 스크롤이 존재하지않을때 
					
					if((image_default_size - box_size) > append_size){
// 						console.log("11");
    					that.drawImageList(append_size, last_node.next, "down", true);
    					
    					that.pathListener();
					} else {
// 						console.log("22");
						let size = image_default_size - box_size;
						that.drawImageList(size, last_node.next, "down", true);
    					that.pathListener();
    					isImageScroll_end = false;
    					that.setImageScrollListener();
    					
					}
				} else {
					let size = image_half_size - (box_size - image_default_size);
					if(size >= append_size){
// 						console.log("33");
						let temp_size = image_remain_size + append_size;

    					that.drawImageList(append_size, last_node.next, "down", false);
    					that.pathListener();
    					image_remain_size = temp_size;

    				} else {
//     					console.log("44");
    					
    					that.drawImageList(size, last_node.next, "down", true);
    					
    					that.pt.find(".list_container tbody tr").slice(0,image_half_size).remove();
    					that.pathListener();
    					isImageScroll_end = false;
    				}
					that.setImageScrollListener();
				}

			} else {
				if(isInit){
					that.initImageList();
					isInit = false;
				}
				
			} 

		},

		initImageList : function(){
			let that = task_map;
			if(linked_list == null){
				alert("사용 가능한 데이터가 없습니다");
				that.pt.find(".submit_btn").hide();
				that.addEmptyData(that.pt.find(".list_container .table_body.run_area"), "No Data", "you have not added any data yet");
				hideLoading("#task_map .main_wrap .list_container"); 
				return;
			}
			if(csv_arr.length > 0){
				that.pt.find(".submit_btn").show();
			}
			let node = linked_list.head;
			start_node = node;
			
			that.drawImageList(image_default_size, node, "down",true);
			
			if(linked_list.length > image_default_size){
				isImageScroll_top = true;
				that.setImageScrollListener();
			} else {
				isImageScroll_end = true;
			}
			that.pathListener();
		},
		
		addImageList : function(node,type){
			let that = task_map;
			
			that.drawImageList(image_half_size, node, type, false);
			isImageScroll = false;
			that.pathListener();
		},
	
		drawImageList : function(size,node,type,isInit){
			
			let that = task_map;
			let temp_node = node;
			
			let target = that.pt.find(".list_container table tbody");	
			let i = 0;
			
			while(node){
				if(i>=size){break;}				
				let html = ""
				i++;		
				let cur_id = node.value
				html += " <tr data-id='"+cur_id+"'> ";
				html += "   <td class='preview'><div class='img_preview'><div class='normal_img'><div class='frame_container'></div></div></div></td>";
				html += "   <td class='image_path'>"+cur_id + "</td>";
				html += " </tr>";
				start_node = node;
				last_node = node;
				
				if(type == "down"){
					target.append(html);
					node = node.next;
				} else {
					target.prepend(html);
					node = node.prev;	
				}	
			}

			that.setStartAndLastNode();	
			if(!isInit){
				that.setNodeData(i,type);	
			}
			
			hideLoading("#task_map .main_wrap .list_container");
		},
		
		setNodeData : function(i,type){
			let that = task_map;
			
			let tr_size = that.pt.find(".list_container tbody tr").length;
			if(type == "down"){
				
				if(i>=image_half_size && last_node.next != null){
// 					console.log(i, tr_size , "down normal");
		
					isImageScroll_top = false;
					if(tr_size != image_half_size){
						that.removeTableBox((tr_size - image_default_size), type);
					} else {
						that.removeTableBox((tr_size - image_half_size), type);
					}
					image_remain_size = 0;
					that.setStartAndLastNode();	
				} else {
					
					image_remain_size = i;
					isImageScroll_end =  true;
// 					console.log(i, tr_size, "down end");
				}

			} else {
				
				if(i>=image_half_size && start_node.prev != null){
					isImageScroll_end = false;
					that.removeTableBox((image_half_size + image_remain_size), type);
					that.setStartAndLastNode();	
					image_remain_size = 0;
// 					console.log(i, tr_size, "up normal");
				} else {
					if(tr_size != image_half_size){
						that.removeTableBox((i + image_remain_size), type);
						image_remain_size = 0;
					}
					isImageScroll_top =  true;
					
					last_node = linked_list.obj[that.pt.find(".list_container tbody tr").last().data("id")];
// 					console.log(i, tr_size, "up end");
				}
			}
		},
		
		setImageScrollListener : function(){
			
			let that = task_map;
			
			that.pt.find(".list_container .table_body").off("scroll").on("scroll",function(){
    			
				let target = $(this);
				let st = target.scrollTop();
				
				let box_size = that.pt.find(".list_container tbody tr").length;
				
				if (st + target.innerHeight() >= target[0].scrollHeight && !isImageScroll){
					// 제일 아래,.
					if(!isImageScroll_end){
						if(last_node.next != null) {
							isImageScroll = true;
							isImageScroll_top = false;
							that.addImageList(last_node.next,"down");	
						} 
					}
				} else if (st == 0 && !isImageScroll){
					if(!isImageScroll_top){
						if(start_node.prev != null){
							isImageScroll = true;
							isImageScroll_end = false;
							that.addImageList(start_node.prev,"up");
						}
					}
				}
			});	
		},
		
		removeTableBox : function(size,type){
			let that = task_map;

			if(type == "down"){
				that.pt.find(".list_container tbody tr").slice(0,size).remove();					
			} else {		
				that.pt.find(".list_container tbody tr").slice(-size).remove();
			}
			that.pt.find(".list_container .table_body").scrollTop((that.pt.find(".list_container .table_body")[0].scrollHeight - that.pt.find(".list_container .table_body").height()) / 2);

		},

		pathListener : function() {
			let that = task_map;
			
			
			//이미지 호버 로우 안에 td  td.image_path 안에 normal_img , normal_img 안에 frame_container;
			
			let img_preview = that.pt.find("tbody .preview .img_preview")
			
			img_preview.off("click").on("click",function(){

				$(this).toggleClass("selected");
				if($(this).hasClass("selected")){

					canvas = null;
			        let tr = $(this);
			        let normal_img = tr.children(".normal_img");
			        let x = tr.offset().left + tr.outerWidth() + 10;
			        let y = tr.offset().top + tr.outerHeight() - 140;
			        let children = tr.children();
					let cur_index = tr.parent().parent().index();

					
					let imgObj = new Image();
					let frame_container = normal_img.children(".frame_container");
					
			        normal_img.css({"top":y+"px", "left":x+"px","position": "fixed", "display" : "block"});
			        
			        frame_container.empty();
			        frame_container.append("<canvas id="+"'"+cur_index+"c' width='204px' height='140px'>");
					canvas = new fabric.Canvas(cur_index+"c");
					canvas.selection = false;
					
					let path = tr.parent().siblings(".image_path");
					
					console.log(path[0].innerText, cur_index);

					imgObj.src = "/uploadFile/xlabeller/" + path[0].innerText;
					showLoading(tr.children(".normal_img"));
					
					imgObj.onload = function(){					
						that.rescale(this);		
						canvas.setBackgroundImage(imgObj.src, canvas.renderAll.bind(canvas), {
// 					          backgroundImageOpacity: 0.5,
// 					          backgroundImageStretch: true,
// 					          width: canvas.width,
// 					          height: canvas.height	
							  scaleX : scaleFactor,
							  scaleY : scaleFactor
					    });
						
						hideLoading(tr.children(".normal_img"));
					}
					
					imgObj.onerror = function(){
						hideLoading(tr.children(".normal_img"));
					}
				
				} else {
					let normal_img = $(this).children(".normal_img");
					normal_img.css("display","none");
				}
			});
			img_preview.off("mouseleave").on("mouseleave",function(){
				let normal_img = $(this).children(".normal_img");
				normal_img.css("display","none");
				$(this).removeClass("selected");
			});
			
			that.pt.find(".list_container table tbody td").off("mouseenter").on("mouseenter",function(){
				if(this.children.length) { return; }
				let td = $(this);
				let text = td[0].innerText;
				td.empty();
				td.append(text);
				
				if (td[0].scrollWidth >  td.innerWidth()) {
					let btn_width = td.outerWidth();
					let btn_height = td.outerHeight();
					let top = td.offset().top;
					let left = td.offset().left;
					let right = ($(window).width() - (td.offset().left + td.outerWidth())); 
					let bottom = ($(window).height() - (td.offset().top + td.outerHeight()));

				   	td.append("<div class='hover_box'><div class='hover_div'><div>"+text+"</div</div></div>");
				   	let hover_box = td.children(".hover_box");
				   	let text_div = hover_box.find(".hover_div div");
					hover_box.css({"display" : "block"});
				   	let text_width = text_div.outerWidth();
				   	let text_height = text_div.outerHeight();
				   	hover_box.css({"display" : "none"});

				   	
				   	let x;
				   	let y;
				   	
				   	if(right - text_width < 0){
				   		x = left - text_width;
				   		
				   	} else {
				   		x = left + btn_width / 2;
				   	}
				   	
				   	if(bottom - text_height < 0){
			   			y = top - text_height;
			   		} else {
			   			y = top + btn_height / 2;
			   		}

				   	hover_box.css({"top":y+"px", "left":x+"px","position": "fixed","display" : "block"});
				}
			});
			
			that.pt.find(".list_container table tbody td").off("mouseleave").on("mouseleave",function(){
				let td = $(this);
				td.find(".hover_box").remove();
			});

		},
		
		rescale : function(img){
        	var canvas_max_width = 208;
            var canvas_max_height = 140;
            if(canvas_max_height/canvas_max_width >= img.naturalHeight/img.naturalWidth){
            	scaleFactor=canvas_max_width/img.naturalWidth;
            } else{
            	scaleFactor=canvas_max_height/img.naturalHeight;
            }
            
            canvas.setWidth(img.naturalWidth*scaleFactor);
         	canvas.setHeight(img.naturalHeight*scaleFactor);
    		canvas.calcOffset();
    		canvas.renderAll();      
    	},

		setAjaxData : function() {						/// 수정
			let that = task_map;

			let check_box = $("#task_map").find(".check_box_wrap .checkBox");

			let file_name = that.pt.find("#file_name").val();
			let annotation_id = String(that.pt.find(".anno_table_body .radioBtn.selected").parents("tr").data("id"));
			let box = that.pt.find(".sub_wrap .list_wrap table tbody tr .checkBox.selected")
			
			let keys = Object.keys(radio_obj)
			let name = radio_obj[keys[0]];
			/////
			// algorithm_id => inference_param input data 
			let inf_string = that.pt.find(".sub_wrap .box_wrap").children(".light").children("input[type='text']");
			let inf_number = that.pt.find(".sub_wrap .box_wrap").children(".light").children("input[type='number']");
			let inf_chk = that.pt.find(".sub_wrap .box_wrap").children(".check").children(".check_box_wrap").children(".check_box").children(".first");
				console.log("inf_chk::", inf_chk);
				console.log("inf_string::", inf_string);
				console.log("inf_number::", inf_number);
			let config_arr = {};
			let result = [];
			
			// 해당 inference parameters 입력
			for(let i=0; i < inf_string.length; i++){
				if(inf_string[i].value != ""){
					config_arr[inf_string[i].name] = inf_string[i].value;
				} else {
					alert("값을 입력해주세요");
					inf_string[i].focus();
					return;
				}
			};
			
			for(let i=0; i < inf_number.length; i++){
				if(inf_number[i].value != ""){
					config_arr[inf_number[i].name] = inf_number[i].value * 1;
					console.log("inf_number[i].value * 1:::", inf_number[i].value * 1);
					console.log("typeof inf_number[i].value * 1 :::", typeof(inf_number[i].value * 1));
				} else {
					alert("값을 입력해주세요");
					inf_number[i].focus();
					return;
				}
			};			
			
			for(let j=0; j < inf_chk.length; j++){
			    if(inf_chk[j].classList.contains("selected") == true){
			    	config_arr[inf_chk[j].attributes.name.value] = true;
			    } else {
			    	config_arr[inf_chk[j].attributes.name.value] = false;
			    }
			};

			
			let config_string = JSON.stringify(config_arr);		
			console.log("config_string;::::", config_string);
			
			
			// gpu node list select 
            let selected_gpu_node_id = $("#task_map").find(".table_body .gpu_table tbody tr").find("td .selected").parents("tr").attr("data-id");
            let selected_gpu_index = $("#task_map").find(".table_body .gpu_table tbody tr").find("td .selected").parents("tr").find(".gpu_index").attr("data-index");
	        if(selected_gpu_node_id == undefined || selected_gpu_node_id == null || selected_gpu_node_id == "" || selected_gpu_index == undefined || selected_gpu_index == null || selected_gpu_index == ""){
	        	alert("사용 가능한 GPU가 없습니다");			// gpu 사용가능한것이 없어도 run 버튼이 눌리던 문제 대안 
	        	return;
	        }  
            
            /////
			
			if(name == null || name == ""){
				alert("선택된 모델 데이터가 없습니다");
				return;
			}
			
			if(annotation_id == ""){
				alert("annotation ID가 없습니다");
				return;
			}
			
			let ajaxData = {
				task_id : map_id,			
				annotation_id : annotation_id,
				config : config_string,  			
				model_name : name,
				gpu_node_id : selected_gpu_node_id,
				gpu_index : selected_gpu_index
			}
			
			console.log("setAjaxData ajaxData:::::", ajaxData);
			that.createMap(ajaxData);
		},
		
		createMap : function(ajaxData){
			let that = task_map;
			
			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/createMap.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("======createMap======", res);
					if (res.result.code == "200") {
/* 						trainer.list("1",map_id); */
						that.resetView();
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						/* trainer.list("1",map_id); */
						that.resetView(); 
					}
					alert(res.result.data);
					$("#loader").hide();

				},
				error : function(err) {
					$("#loader").hide();
					console.log("ERROR!!", err);
				}
			});
			
		},
		
		downloadModel : function(){
			let keys = Object.keys(radio_obj)
			let modelFile = radio_obj[keys[0]];
			if(modelFile == null){
				alert("모델을 선택해주세요");
				return;
			}
			$.ajax({
				url : baseUrl + "task/getTaskById.json",
				data : {"id":map_id},
				type : "POST",
				success : function(res) {
					console.log("======getTaskById======", res);
					if (res.result.code == "200") {
						if(res.result.data != null){
							
							var pId = res.result.data.project_id;
							var taskId = res.result.data.id;
							var dUrl = "/uploadFile/xlabeller/workspace/"+pId+"/"+taskId+"/model/"+modelFile;
							window.open(dUrl);
						}else{
							alert("다운로드 요청이 유효하지 않습니다");
						}
						
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else{
						alert("다운로드 요청이 유효하지 않습니다");
					}
					
					
					
					$("#loader").hide();

				},
				error : function(err) {
					$("#loader").hide();
					console.log("ERROR!!", err);
				}
			});
			
			
		},
		
		/////////////////////////////////
		getTaskById : function() {
			let that = task_map;
			ajaxData = {
				task_id : map_id
			}

			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/getTaskById.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					$("#loader").hide();
					console.log("=====getTaskById run=====", res);
					if (res.result.code == "200") {	
						label_type = res.result.data.label_type;
						that.getAlgorithmById(res.result.data);
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}
					
					//hideLoading("#task_detail .list_wrap");
				},
				error : function(err) {
					$("#loader").hide();
					console.log("getTaskById ERROR!!", err);
				}
			});

		},
		
		// id에 해당하는 algorithm 정보 가져오기
		getAlgorithmById : function(data) {
			let that = task_map;
			
			let taskData = data;
			let ajaxData = {
				algorithm_id : data.algorithm_id
			}
			
			$("#loader").show()
			$.ajax({
				url : baseUrl + "algorithm/getAlgorithmById.json",
				data : ajaxData,
				type : "POST",
				success : function(res){
					console.log("=====getAlgorithmById=====", res);
					$("#loader").hide();
					if(res.result.code == "200"){
						that.setInferenceParam(res.result.data);
						//that.drawTaskResult(taskData, res.result.data);
						label_type = res.result.data.label_type;
						that.getAnnotationList();
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					}
				},
				error : function(err){
					console.log("getAlgorithmById ERROR!", err);
				}
			});
		},  	
		
		// algorithm_id의 정보로 div 그리기 
 		setInferenceParam : function(data) {
			let that = task_map;
			let inference_param_data = JSON.parse(data.inference_param);
			let target = $("#task_map").find(".box_wrap");
			let target_title = $("#task_map").find(".sub_wrap .title_wrap .algorithm_name");
			let algorithm_name = "( Selected algorithm : " + data.title + " )";
			$(target).html("");
			$(target_title).html(algorithm_name);
			
			for(let i=0; i < inference_param_data.length; i++){
					console.log(inference_param_data[i]);
					let html = "";
					if(inference_param_data[i].type == "string") {
						html += '<div class="input_wrap flex light">';
						html += '<label>'+inference_param_data[i].param+'<span class="tooltip_wrap"></span></label>';
						html += '<span class="tooltip">'+inference_param_data[i].helper+'</span>';
						html += '<input type="text" name="'+inference_param_data[i].param+'" value="'+inference_param_data[i].defaultvalue+'"/>';
						html += '</div>';
						$(target).append(html);
						continue;
					} else if(inference_param_data[i].type == "number"){
						html += '<div class="input_wrap flex light">';
						html += '<label>'+inference_param_data[i].param+'<span class="tooltip_wrap"></span></label>';
						html += '<span class="tooltip">'+inference_param_data[i].helper+'</span>';
						html += '<input type="number" name="'+inference_param_data[i].param+'" value="'+inference_param_data[i].defaultvalue+'" onKeyPress="return checkNum(event);"/>';
						html += '</div>';	
						$(target).append(html);
						continue;
					} else if (inference_param_data[i].type = "boolean"){
						if(inference_param_data[i].defaultvalue === true) {
							html += '<div class="input_wrap flex check">';
							html += '<label>'+inference_param_data[i].param+'<span class="tooltip_wrap"></span></label>';
							html += '<span class="tooltip">'+inference_param_data[i].helper+'</span>';
							html += '<div class="check_box_wrap">';
							html += '<div class="check_box">';					
							html += '<div class="checkBox first selected" name="'+inference_param_data[i].param+'"></div>';
							html += '</div>';
							html += '</div>';
							html += '</div>';							
						} else {
							html += '<div class="input_wrap flex check">';
							html += '<label>'+inference_param_data[i].param+'<span class="tooltip_wrap"></span></label>';
							html += '<span class="tooltip">'+inference_param_data[i].helper+'</span>';
							html += '<div class="check_box_wrap">';
							html += '<div class="check_box">';					
							html += '<div class="checkBox first" name="'+inference_param_data[i].param+'"></div>';
							html += '</div>';
							html += '</div>';
							html += '</div>';									
						}

						
						$(target).append(html);
						continue;
					};
					

// 					that.setDefaultListener();
		
			};
			// helper 툴팁
			let tooltip_wrap = that.pt.find(".tooltip_wrap");
			console.log("tooltip_wrap:: ", tooltip_wrap);
			tooltip_wrap.off("mouseover").on("mouseover", function() {
				let tooltip = $(this).parent("label").next(".tooltip");
				tooltip.toggleClass("on");
			});
			tooltip_wrap.off("mouseout").on("mouseout", function() {
				let tooltip = $(this).parent("label").next(".tooltip");
				tooltip.removeClass("on");						
			})
			
			that.setDefaultListener();
		},
		
		// 사용가능한 GPU Node select list 
		drawGpuNodeList : function(data) {
			let that = task_map;
			let gpuTarget = $("#task_map").find(".table_body .gpu_table tbody");
            
            $(gpuTarget).html("");

//              let gpu_data = [{"node_ip":"192.168.1.12","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"1"},
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},             
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},   
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},   
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},   
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},   
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},   
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},                
//              ];  
			
//             let gpu_data = [{"node_ip":"192.168.1.12","unavailable_gpu_index":"4","gpu_node_id":"1"}];             
            //let gpu_data;
            let gpu_data = data; 
            let renderArr = []; 
            let html = "";

            
            if(gpu_data != undefined || gpu_data != null || typeof(gpu_data) == "object" ) {
            	if(gpu_data.length > 0) {
                    for(let j = 0 ; j < gpu_data.length ; j++){

                    	let tempObj = gpu_data[j];
                    	let node_ip = tempObj["node_ip"];
                    	let gpu_node_id = tempObj["gpu_node_id"];
        				if(tempObj["available_gpu_index"]){
                           	let agiArr = tempObj["available_gpu_index"].split(",");
                            for(let i = 0 ; i < agiArr.length ; i++){
                           	let status = "available";
                           	let resultObj = {"node_ip":node_ip,"gpu_index":agiArr[i],"status":status,"gpu_node_id":gpu_node_id};
                            renderArr.push(resultObj);

                            }          					
        				} else {
        					html += "<tr><td colspan='4' align='center'>No GPU available</td></tr>";
        				}
        /*                 let ugiArr = tempObj["unavailable_gpu_index"].split(",");
                        for(let i = 0 ; i < ugiArr.length ; i++){
                       	let status = "unavailable";
                       	let resultObj = {"node_ip":node_ip,"gpu_index":ugiArr[i],"status":status,"gpu_node_id":gpu_node_id};
                        renderArr.push(resultObj);

                        } */
                        console.log("renderArr::", renderArr);
                    }            		
            	} else if (gpu_data.length == 0){
            		html += "<tr><td colspan='4' align='center'>No GPU available</td></tr>";            		
            	}
            } else {
        		html += "<tr><td colspan='4' align='center'>No GPU available</td></tr>";
            }


            for(let i = 0 ; i < renderArr.length;i++){
           	let renderObj = renderArr[i];
           	console.log("renderObj:::", renderObj[i]);
           	let template = "";
            
                template = "<tr data-id='"+renderObj["gpu_node_id"]+"'>"+"<td class='gpu_node_ip'>"+renderObj["node_ip"]+"</td>"+"<td class='gpu_index' data-index='"+renderObj["gpu_index"]+"'>"+renderObj["gpu_index"]+"</td>"+"<td class='gpu_status'>"+renderObj["status"]+"</td>"+"<td class='gpu_select'>"+"<div class='radioBtn'>"+"</div>"+"</td>"+"</tr>"; 

            html+= template;
            }

            $(gpuTarget).append(html);  
            

			let gpu_row_click = $("#task_map").find(".sub_wrap .list_wrap .gpu_table tbody tr")
			gpu_row_click.off("click").on("click",function() {
				let gpu_tr = $(this);
				//let gpu_btn = gpu_tr.children().children().children(".radioBtn");
				let gpu_btn = gpu_tr.children(".gpu_select").children(".radioBtn");
				//let gpu_id = gpu_tr.data("id");
				gpu_btn.toggleClass("selected");
				if(gpu_btn.hasClass("selected")){
					//radio_obj = {};
					$("#task_map").find(".sub_wrap .table_body .gpu_table tbody tr .radioBtn").removeClass("selected");
					gpu_btn.addClass("selected");
					//radio_obj[id] = id;
				} else {
					//radio_obj = {};
				}				
			});
			
		},
		
		// 사용가능한 GPU Node List 가져오기 
		getSelectableGpuNode : function() {
			let run_class = trainer.pt.find(".section_wrap .task_map");
		
			let that = task_map;
			ajaxData = {
				id : map_id
			}

			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/getSelectableGpuNode.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					$("#loader").hide();
					console.log("=====getSelectableGpuNode=====", res);
					if (res.result.code == "200") {	
						that.drawGpuNodeList(res.result.data);
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}
					
					hideLoading("#task_map .list_wrap");
				},
				error : function(err) {
					$("#loader").hide();
					console.log("getSelectableGpuNode ERROR!!", err);
				}
			});

		},
		
		// CSV Name 중복검사
		getResultList : function() {
			var that = this;		
			let csv_save_name = that.pt.find("#file_name").val() + "#" + dataset_id;
		
			
		
			ajaxData = {
				id : map_id,
				csv_save_name : csv_save_name
			};

			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/getResultList.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					$("#loader").hide();
					console.log("=====getResultList=====", res);
					if (res.result.code == "200") {
						msg = "Inference를 시작하시겠습니까?";
						if(confirm(msg) == true){
							that.setAjaxData();					
						}
					} else if(res.result.code == "3404") {
						msg = "이미 중복된 이름의 파일이 존재합니다.\n" + "파일을 덮어쓰고 Inference를 시작하시겠습니까?";
						if(confirm(msg) == true){
							that.setAjaxData();					
						} else {
							alert("output file name을 다시 입력해주세요.");
							that.pt.find("input[name='file']").focus();
						}
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}
				},
				error : function(err) {
					$("#loader").hide();
					console.log("getResultList ERROR!!", err);
				}
			});

		},	
		
		/////////////////////////////////		
		
	}

// 	var createObject_run = function() {

// 		let that = task_map;

// 		let arr1 = {};
// 		let arr2 = {};

// 		let result = [];

// 		arr1["expandNode"] = that.getDatasetList
// 		arr1["drop"] = {
// 			"area" : "run_area",
// 			"onDrop" : that.insertImg
// 		}

// 		result.push(arr1)

// 		obj_run = {
// 			key : "trainer_run",
// 			pointer : "ws_wrap2",
// 			info : result
// 		};
// 	}
</script>
