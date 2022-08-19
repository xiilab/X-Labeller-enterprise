<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

	<title>X-labeller</title>

<style>


/* 공통  */

#task_run {width: 100%; height: 100%;}

#task_run .ms_wrap {width: 100%;height: 100%; margin-top:23px; }

#task_run .hover_box {border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
#task_run .hover_box div {font-family: Open_Sans; font-size: 13px; color: #555555;}
#task_run .hover_div div {word-break: break-word; margin: 2px 5px; white-space: normal; font-weight: 300; font-family: Open_Sans;}
#task_run .hover_div {max-width: 264px; text-align: left; position: relative; }
#task_run .hover_box {max-width: 264px; text-align: left; }

/* #task_run .empty_wrap {text-align: center; margin-top: 170px; } */
#task_run .empty_wrap {text-align: center; padding: 170px; }
#task_run .empty_wrap .no_image {margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; }
#task_run .empty_wrap .eng_text {font-family: Open_Sans; margin-bottom: 3px; font-size: 16px; font-weight: 300; color: #777777;}
#task_run .empty_wrap .kor_text {font-family: Open_Sans; font-size: 12px; color: #777777; font-weight: 200;}
#task_run .no_image {height: 37px; background-image: url('./images/icon_nodata_list.png'); }

/* 메인  */

#task_run .main_wrap {width: 60% ; height: 100%; position: relative;}
#task_run .title_wrap span {font-family: Open_Sans; font-size: 12px; font-weight: 400; display:inline-block; color: #343434; margin-bottom: 21px;}
#task_run .list_total {float: right; font-family: Open_Sans; font-size: 12px; font-weight: 400; color: #343434; margin-bottom: 21px;}

#task_run .main_wrap .list_container .table_body {height: calc(100% - 46px); overflow-y: overlay; overflow-x:hidden;  }
#task_run .main_wrap .ws_container .table_body {height: calc(100% - 46px);} 
#task_run .ms {height: calc(100% - 23px);}
#task_run .ws_header {width: 220px; line-height: 45px; border-right: 1px solid #e5e5e5;}
#task_run .ws_container .table_header .anno_table {table-layout : auto;}

#task_run .main_wrap .drop_wrap {align-items: normal; border: 1px solid #e5e5e5; height: calc(100% - 141px);}

#task_run .main_wrap .ws_container thead tr th{border-right: 1px solid #e5e5e5;}

#task_run .dragOver {width: 100%; height: 100%; border: 0;}

#task_run table tbody tr td {cursor: default;}
#task_run .main_wrap .btn_wrap {position:absolute; right: 30 ; bottom: 0 ; margin-bottom: 41px; }
#task_run .main_wrap .del_btn {padding: 0 ; width: 68px;height: 28px; background-color: #f8f8f8; font-family: Open_Sans; font-size: 12px; font-weight: 500; color: #343434;}
#task_run .main_wrap .list_container{ position:relative;}
#task_run .main_wrap .list_container table tbody tr .normal_img{ z-index: 99; display: none;   border-radius: 1px ; border : 1px solid #dadada; width: 230px;height: 230px; box-shadow: 0 5px 9px -1px rgba(0, 0, 0, 0.16); background-color: #ffffff}
#task_run .main_wrap .list_container table tbody tr .normal_img .frame_container {display:flex; height: 230px; align-items: center; justify-content: center; flex-direction: column; }
#task_run .main_wrap .list_container table tbody tr .preview .img_preview {cursor: pointer; border: 1px solid #979797; position: relative; margin: auto;  border-radius: 2px; background-size: 14px; width: 28px ; height: 28px; background-color: rgba(0, 0, 0, 0.1); background-image: url('./images/icon_preview_normal.png'); background-repeat: no-repeat; background-position: center; }
#task_run .main_wrap .list_container table tbody tr .preview .img_preview:hover { background-image: url('./images/icon_preview_hover.png'); border: 1px solid #4c84ff;}

/* 서브 */

#task_run .sub_wrap {width: 40% ; height: 100%; background-color: #f5f5f5; position:relative; overflow-y: overlay; overflow-x: hidden; }
/* #task_run .margin {margin: 0 43px; height: calc(100% - 23px); } */
#task_run .margin {margin: 0 43px; }

#task_run .sub_wrap .box_wrap { margin-bottom: 17px; padding: 15px; }
#task_run .sub_wrap .box_wrap.border { border: 1px solid #dedcde; }

#task_run .sub_wrap .box_wrap .input_wrap > label {margin-right: 27px; float: left; width: 180px; font-family: Open_Sans; font-size: 12px;  color: #343434; font-weight: 300; }
#task_run .sub_wrap .box_wrap .input_wrap > input {border-radius:2px; width: calc(100% - 172px); height: 32px; background-color: #ffffff; padding: 0 11px ; font-family: Open_Sans; font-weight: 300; margin-bottom: -11px; }
#task_run .sub_wrap .box_wrap .input_wrap input:focus {border: 1px solid #4c84ff;}

#task_run .sub_wrap .list_wrap {height: calc(100% - 730px); position:relative;}

#task_run .sub_wrap .box_wrap .input_wrap {margin-bottom: 12px; padding-top: 5px; }

/* #task_run .sub_wrap .box_wrap .input_wrap:first-child {margin-bottom: 12px;}
#task_run .sub_wrap .box_wrap .input_wrap:nth-child(2){margin-bottom: 28px;}
#task_run .sub_wrap .box_wrap .input_wrap:nth-child(3){margin-bottom: 36px;} */

#task_run .sub_wrap .check_box_wrap {width:calc(100% - 148px); margin-bottom: -11px; }
#task_run .sub_wrap .check_box_wrap .check_box > label {font-family: Open_Sans; font-size: 13px;font-weight: 300; color: #616263; margin-left: 19px; }
/* #task_run .sub_wrap .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
#task_run .sub_wrap .table_body {max-height: 340px; overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; }

#task_run .sub_wrap .btn_wrap {text-align:center; position: relative; left: 0% ; right: 0% ; top: 2%; bottom: 0 ; margin-bottom: 37px;}
#task_run .sub_wrap .submit_btn {border-radius: 23px; width: 240px; height: 36px; box-shadow: 0 4px 8px 0 #b4d7ff; background-color: #4c84ff; font-family: Open_Sans; font-weight: 300; border: 0; }
#task_run .sub_wrap .submit_btn:hover  {background-color: #3A71E9; }

#task_run .td_wrap .radioBtn {margin: 0 20px;}
#task_run .td_wrap .csv_name {width: calc(100% - 108px); overflow: hidden; white-space: nowrap; text-overflow: ellipsis;}

/* 트리 */

#task_run .ztree .level0 span.button[id$=ico] { background: url("images/icon_tree_dataset_selected.png") !important; }
#task_run .ztree a.curSelectedNode.level0  span.button[id$=ico] { background: url("images/icon_tree_dataset_white.png") !important; }
#task_run .ztree .level1 span.button[id$=ico] { background: url("images/icon-tree-image.png") !important; }
#task_run .ztree a.curSelectedNode.level1  span.button[id$=ico] { background: url("images/icon-tree-image-white.png") !important; }

#task_run .ws_wrap2 ,#task_run .ws_wrap2 #workspace {height: 100%; background-color: #eff3f7; border: 0;}
#task_run .ws_wrap2 #workspace #dir_wrap .ztree li {background-color: #eff3f7;}
#task_run .ws_wrap2 #workspace #dir_wrap .ztree{height: 100% !important; }
#task_run .ws_wrap2 #workspace #dir_wrap .ztree li a { height: 48px; padding: 0;}

/* 스크롤 */

#task_run .main_wrap .ws_container .table_body::-webkit-scrollbar {background :#eff3f7;}
#task_run .main_wrap .ws_container .table_body{border-right: 1px solid #e5e5e5;}
#task_run input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button { -webkit-appearance: none; margin: 0; }



#task_run .model_download_btn { padding:5px;
    margin: 0 auto;
    border-radius: 5px;
    background-color: #4c84ff;
    font-size: 12px;
    color: #ffffff;
    cursor: pointer;  }
#task_run .model_download_btn:hover { background-color: #3A71E9; }


/* gpu node list */
#task_run .gpu_node_list_wrap { width: 100%; text-align: center;}
#task_run table.gpu_table th { border-top: 2px #3a3b3d solid; background-color: #fafafa; height: 44px; font-size: 11px; font-weight: 400; color: #333333; }
#task_run table.gpu_table th, table.gpu_table tr, table.gpu_table td { text-align: center; border-bottom: 1px solid #e5e5e5; border-collapse: collapse; border-spacing: 0; }
#task_run .table_body table.gpu_table { width: 100%; font-family: Open_Sans; font-size: 12px; color: #343434; font-weight: 300; border-collapse: collapse; }
#task_run .table_body table.gpu_table tr:hover { background-color: #f4fcfe; }
#task_run .table_body table.gpu_table td { padding-top: 3px; padding-bottom: 3px; }
#task_run .table_header table.gpu_table { width: 100%; border-collapse: collapse; }


#task_run .contents > div { height: 100%; }
#task_run .sub_wrap .file_name_wrap { margin-bottom: 17px; padding: 15px; }
#task_run .sub_wrap .file_name_wrap.border { border: 1px solid #dedcde; }
#task_run .sub_wrap .file_name_wrap .input_wrap > label { margin-right: 27px; float: left; width: 180px; font-family: Open_Sans; font-size: 12px;  color: #343434; font-weight: 300;  }
#task_run .sub_wrap .file_name_wrap .input_wrap > input {border-radius:2px; width: calc(100% - 67px); height: 32px; background-color: #ffffff; padding: 0 11px ; font: 400 11px system-ui; }

#task_run .checkBtn { display:inline-block; width: 16px; height: 16px; background: url("${pageContext.request.contextPath}/resources/images/icon_gpu_check.png") no-repeat center; }

#task_run .gpu_reset { width: 45px; height: 15px; border-radius: 5px; cursor: pointer; font-size: 12px; display: inline-block; text-align: center; margin: 0 auto; padding:5px; background-color: #4c84ff; color: #fff; line-height: 15px; margin-left: 15px; }

#task_run .tooltip_wrap { width: 17px; height: 17px; display: inline-block; cursor: pointer; margin: 0 5px; position: relative; top: 4px; background: url("${pageContext.request.contextPath}/resources/images/btn_help_nor.png") no-repeat; }
#task_run .tooltip { width: 352px; padding: 10px 12px 10px 12px; color: #fff; background-color: rgba(0, 0, 0, 0.6); -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; font: 400 12px system-ui; position: absolute; z-index: 9999; left: 36.5%; padding-left: 12px; visibility: hidden; opacity: 0; transition: visibility 0s, opacity 0.3s ease; margin-bottom: -11px; }
#task_run .tooltip.on { width: 352px; padding: 10px 12px 10px 12px; color: #fff; background-color: rgba(0, 0, 0, 0.6); -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; font: 400 12px system-ui; position: absolute; z-index: 9999; left: 36.5%; padding-left: 12px; visibility: visible; opacity: 1; transition: visibility 0s, opacity 0.3s ease; }

#task_run .algorithm_name { font: 400 11px system-ui !important; color: #777 !important; }
#task_run .task_name { font: 400 11px system-ui !important; color: #777 !important; }
</style>

</head>
<body>
	<div class="container" id="task_run">
		<div class="contents flex">
			<div class="main_wrap">
				<div class="ms">
					<div class="ms_wrap ">
						<div class="title_wrap">
							<span>Inference</span>
							<span class="task_name"></span>
							<span class="list_total">Total 0</span>
						</div>

						<div class="drop_wrap flex">
							<div class="ws_container">
								<div class="table_header">
									<table class="anno_table">
										<colgroup>
											<col style="width: 220px;"></col>
										</colgroup>
										<thead>
											<tr>
												<th>DATASET LIST</th>
											</tr>
										</thead>
									</table>
								</div>
								<div class="table_body">
									<div class="ws_wrap2">
										<jsp:include page="/workspace" flush="false" />
									</div>
								</div>
							</div>

							<div class="list_container">
								<div class="table_header">
									<table class="anno_table">
										<colgroup>
											<col style="width: 80px;"></col>
											<col style=""></col>
										</colgroup>
										<thead>
											<tr>
												<th class="pre">PREVIEW</th>
												<th class="th_path">PATH</th>
											</tr>
										</thead>
									</table>
								</div>
								<div class="table_body run_area">
									<table class="anno_table">
										<colgroup>
											<col style="width: 80px;"></col>
											<col style=""></col>
										</colgroup>
										<tbody></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="sub_wrap">
				<div class="margin">
					<div class="ms_wrap filter_color">
						<div class="title_wrap">
							<span>Inference Parameter</span>
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
						<div class="title_wrap">
							<span>CSV File Name</span>
						</div>
						<div class="file_name_wrap border">
							<div class="input_wrap flex">
								<label>output file name</label><input id="file_name" type="text" name="file" placeholder="Please Enter the Filename" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>
							</div>
						</div>
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
					<button class="submit_btn">Start Inference</button>
				</div>
			</div>
		</div>
	</div>
</body>


<script>
	$(document).on("sessionLoad", function() {

	});

// 	var imgList = [];						// 사용안함
// 	var img_path = new Array();				// 사용안함 
// 	var obj_run;							// jh.sa 210208 obj_run => that.data.pageObj
	
// 	var canvas;								// jh.sa 210208 canvas => that.data.canvas
// 	var colorHash = new ColorHash();		// jh.sa 210208 colorHash => that.data.colorHash
// 	var scale;								// 사용안함
	
// 	var dataset_id = "";				// jh.sa 210208 dataset_id => that.data.datasetId

// 	var run_id; 						// jh.sa 210208 run_id => that.data.taskId
	
	//오른쪽 스크롤에 사용
// 	var csv_arr = [];					// jh.sa 210208 csv_arr => that.data.csvArr
// 	var radio_obj = {};					// jh.sa 210208 radio_obj => that.data.radioObj

// 	var scrollObj = {					// jh.sa 210208 scrollObj => that.data.scrollObj
// 			scroll_start:0,
// 			scroll_end:0,
// 			isScroll_top:0,
// 			isScroll_end:0,
// 			isScroll : false,
// 			default_size : 40,
// 			half_size : (40 / 2)
		
// 	}
	
	//왼쪽 스크롤에 사용
// 	var image_default_size = 40;		// jh.sa 210208 image_default_size => that.data.imgScrollObj.image_default_size
// 	var image_arr = [];					// 사용 안함
// 	var image_obj = {};					// 사용 안함
// 	var image_half_size = (image_default_size / 2);		// jh.sa 210208 image_half_size => that.data.imgScrollObj.image_half_size
// 	var removed_size = 0;				// 사용 안함
// 	var linked_list = null; 			// jh.sa 210208 linked_list => that.data.imgScrollObj.linkedList
// 	var last_node;						// jh.sa 210216 last_node => that.data.imgScrollObj.last_node
// 	var start_node;						// jh.sa 210216 start_node => that.data.imgScrollObj.start_node
// 	var image_remain_size;				// jh.sa 210216 image_remain_size => that.data.imgScrollObj.image_remain_size
// 	var isImageScroll_top = false;		// jh.sa 210216 isImageScroll_top => that.data.imgScrollObj.isImageScroll_top
// 	var isImageScroll_end = false;		// jh.sa 210216 isImageScroll_end => that.data.imgScrollObj.isImageScroll_end
// 	var isImageScroll = false;			// jh.sa 210216 isImageScroll => that.data.imgScrollObj.isImageScroll
// 	var isInit = false;					// jh.sa 210216 isInit => that.data.imgScrollObj.isInit
// 	var image_box_obj = {};				// 사용 안함
	
	var task_run = {
		pt : $("#task_run"),
		data : {
			taskId : null,
			labelType : null,
			algorithm_title : null,
			pageObj : {},
			canvas : null,
			colorHash: null,
			// 오른쪽 스크롤에 사용 
			csvArr : [],
			radioObj : {},
			scrollObj : {
					scroll_start:0,
					scroll_end:0,
					isScroll_top:0,
					isScroll_end:0,
					isScroll : false,
					default_size : 40,
					half_size : (40 / 2)				
			},
			// 왼쪽 스크롤에 사용 
			imgScrollObj : {
					image_default_size : 40,
					image_half_size : (40 / 2),
					image_remain_size : null,
					linked_list : null,
					last_node : null,
					start_node : null,
					isImageScroll_top : false,
					isImageScroll_end : false,
					isImageScroll : false,
					isInit : false,	
			},
		},
		init : function(id) {
			let that = task_run;
			
			that.data.taskId = id;
			that.getTaskById(that.data.taskId);
			createObject_run();
			workspace(that.data.pageObj);
// 			run_id = id;
			that.resetView();
			that.data.colorHash = new ColorHash();
			that.setDefaultListener();
			that.pt.find(".submit_btn").hide();
			that.addEmptyData(that.pt.find(".list_container .table_body.run_area "), "No Data", "you have not added any data yet");
			console.log("현재 inference 대상 task ID:::::", that.data.taskId);
		},
		
		addEmptyData : function(elem, data1, data2){
			let that = task_run;
			elem.append("<div class='empty_wrap'><div class='no_image'></div><div class='eng_text'>"+data1+"</div><div class='kor_text'>"+data2+"</div></div>")
		},
		
		removeEmptyData : function(elem){
			let that = task_run;
			elem.find(".empty_wrap").remove();
		},

		setDefaultListener : function() {
			let that = task_run;
			let check_box = that.pt.find(".check_box_wrap .checkBox");
			let msg = "";

			check_box.off("click").on("click", function() {
				$(this).toggleClass("selected");
			});

			$("#task_run").find(".submit_btn").off("click").on("click", function() {
				
				that.getResultList();
			});
			
			let cancel_img = that.pt.find(".list_container tbody tr");
			let close_all = that.pt.find(".list_container table thead tr th .checkBox");
			let del_btn = that.pt.find(".main_wrap .btn_wrap .del_btn");
			
			$(".model_download_btn").off("click").on("click", function() {
				that.downloadModel();
			});
			
			let gpu_select_btn = $("#task_run").find(".gpu_table tbody").find(".radioBtn");
			// GPU Node Select 
/* 			gpu_select_btn.off("click").on("click",function(){
				$(this).toggleClass("selected");
				if($(this).hasClass("selected")) {
					gpu_select_btn.not(this).removeClass("selected");
				}
			}); */
			//////
// 			let gpu_row_click = $("#task_run").find(".sub_wrap .list_wrap .gpu_table tbody tr")
// 			gpu_row_click.off("click").on("click",function() {
// 				let gpu_tr = $(this);
// 				//let gpu_btn = gpu_tr.children().children().children(".radioBtn");
// 				let gpu_btn = gpu_tr.children(".gpu_select").children(".radioBtn");
// 				//let gpu_id = gpu_tr.data("id");
// 				gpu_btn.toggleClass("selected");
// 				if(gpu_btn.hasClass("selected")){
// 					//radio_obj = {};
// 					$("#task_run").find(".sub_wrap .table_body .gpu_table tbody tr .radioBtn").removeClass("selected");
// 					gpu_btn.addClass("selected");
// 					//radio_obj[id] = id;
// 				} else {
// 					//radio_obj = {};
// 				}				
// 			});
		},
		

		resetView : function() {
			let that = task_run;
			that.reset();
// 			that.getModelList();
// 			that.getTaskById();
			that.pt.find(".sub_wrap .box_wrap").html("");
			$("#task_run").find(".table_body .gpu_table tbody").html("");
			$("#task_run").find(".table_body .gpu_table tbody").append("<tr><td colspan='4' align='center'>Loading GPU list...</td></tr>");
// 			that.drawGpuNodeList();
			that.getSelectableGpuNode();
			
			let gpu_reset = $("#task_run").find(".gpu_reset");
			gpu_reset.off("click").on("click", function() {
				that.getSelectableGpuNode();
			});
			
			that.getModelList();
		},

		insertImg : function() {
			let that = task_run;
			that.putImg();
		},
		
		setDataSetResult : function(data) {
			let that = task_run;			
			var label_type = that.data.labelType; 
			var config = new Array();
			$.each(data, function(index, value) {
				var obj = new Object();
				obj.id = value.dataset_id;
				obj.pId = null;
				obj.name = value.title;
				obj.title = value.title;
				obj.label_type = value.label_type;
				obj.contents = value.contents;
				obj.created_date = value.created_data;

				obj.drag = true;
				obj.isParent = true;
				obj.dropPrev = false;
				obj.dropNext = false;
				obj.nodeMove = false;
				// jh.sa 201027 수정 
				console.log("config that.data.algorithm_title::" + that.data.algorithm_title);
				if(value.label_type == label_type){
					config.push(obj);
				} else if(that.data.algorithm_title == "YOLO") {
					console.log("YOLO push!");
					config.push(obj); 
				}
			});

			wsObj[that.data.pageObj.key].addNode(null, config);
		},

		setDataResult : function(data, parentNode) {
			var that = task_run;

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

			wsObj[that.data.pageObj.key].addNode(parentNode, config);
		},

		setProgressbarGone : function(node) {
			var that = task_run; 
			
			if (node != null) {
				node.icon = "";
				wsObj[that.data.pageObj.key].dir.updateNode(node);
			}
		},

		setProgressbarVisible : function(node) {
			var that = task_run; 
			
			if (node != null) {
				node.icon = baseUrl + "css/img/loading.gif";
				wsObj[that.data.pageObj.key].dir.updateNode(node);
			}
		},

		getModelList : function() {
			let that = task_run;
			let url = "task/getCheckPointList.json";
			var task_id = that.data.taskId;
			let ajaxData = {
				task_id : task_id
			}
			
			//test								//수정 
//   			let arr = [];
//  			//for(let i= 0; i<328; i++){
// 			for(let i= 0; i<123; i++){ 				
//  				arr.push("resnet"+i+"_csv_01.h5");
//  			}
//  			that.modifyModelListData(arr); 
			//test End
			
			
			that.getList(url, ajaxData);
		},

		getDatasetList : function() {
			let that = task_run;
			let url = "data/getDatasetList.json";
			let ajaData = {};
// 			let pNode = wsObj[that.data.pageObj.key].dir.getSelectedNodes()[0];
// 			that.getList(url, ajaData, pNode);
			that.getList(url, ajaData);
		},

		getList : function(url, ajaxData, parentNode) {
			let that = task_run;
			that.setProgressbarVisible(parentNode);

			$.ajax({
				url : baseUrl + url,
				data : ajaxData,
				//async : false,
				success : function(res) {
					$("#loader").hide();
					console.log("=====getDataList with taskVO======", res);

					if (res.result.code == "200") {
						if (res.datasetVO != undefined) {
							that.setDataSetResult(res.result.data);
						}  else if (res.taskVO != undefined) {
							console.log("res.taskVO != undefined");
							console.log("res.result.data::", res.result.data);
							that.modifyModelListData(res.result.data);					// 막아둠
						} else {
						}

					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else if(res.result.code == "4001"){
						alert(res.result.data);
						that.emptyModelListData();
						// that.removeEmptyData(that.pt.find(".sub_wrap .list_wrap .table_body .anno_table"));
						// that.addEmptyData(that.pt.find(".sub_wrap .list_wrap .table_body .anno_table "), "No Model", "please train your task first");
					} else {
						alert(res.result.data);
						that.emptyModelListData();
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
			//console.log("reset!");
			let that = task_run;
			let scroll_info = that.data.scrollObj;	
			//var csv_arr = that.data.csvArr;
			var radio_obj = that.data.radioObj;
			scroll_info.isScroll_top = false;
			scroll_info.isScroll_end = false;
			scroll_info.isScroll = false;
			that.data.csvArr = [];
			radio_obj = {};
		},

		modifyModelListData : function(data){
			let that = task_run;
			that.resetModelListData();
			//console.log("modifyModelListData data::", data);
			//console.log("data::", data);
			
			if(!data || data.length == 0){
				that.addEmptyData(that.pt.find(".sub_wrap .list_wrap .table_body .anno_table "), "No Model", "please train your task first");
			}
			
			for(let i = 0, len = data.length; i<len; i++){
				//console.log("data[i]::", data[i]);
				console.log("that.data.csv_arr::", that.data.csvArr);
				that.data.csvArr.push(data[i]);
			}
			// ㅌㅍ
			//console.log("that.data.csv_arr.length::", that.data.csv_arr.length);
			that.pt.find(".sub_wrap .list_total").text("Total " + that.data.csvArr.length);
			
			that.initModelList();
		},
		emptyModelListData : function(){
			let that = task_run;
			that.resetModelListData();
			//console.log("modifyModelListData data::", data);
			//console.log("data::", data);
			
			//if(!data || data.length == 0){
				that.addEmptyData(that.pt.find(".sub_wrap .list_wrap .table_body .anno_table "), "No Model", "please train your task first");
			//}
			
			/*for(let i = 0, len = data.length; i<len; i++){
				//console.log("data[i]::", data[i]);
				console.log("that.data.csv_arr::", that.data.csvArr);
				that.data.csvArr.push(data[i]);
			} */
			// ㅌㅍ
			//console.log("that.data.csv_arr.length::", that.data.csv_arr.length);
			that.pt.find(".sub_wrap .list_total").text("Total " + that.data.csvArr.length);
			
			that.initModelList();
		},
		
		initModelList : function(){
			let that = task_run;
			that.pt.find(".sub_wrap .table_body .anno_table tbody").html("");
			let scroll_info = that.data.scrollObj;
			var csv_arr = that.data.csvArr;
			
			scroll_info.scroll_start = 0;
			scroll_info.scroll_end = (scroll_info.default_size < csv_arr.length ) ? scroll_info.default_size : csv_arr.length;
			that.drawModelList("init",scroll_info.scroll_start,scroll_info.scroll_end);
			if(csv_arr.length > scroll_info.default_size) {
				scroll_info.isScroll_top = true;
				that.modelScrollListener();
			}
		},
		
		
		drawModelList : function(type, start, end) {
			
			let that = task_run;
			let target = that.pt.find(".sub_wrap .table_body .anno_table tbody");
			let scroll_info = that.data.scrollObj;
			let html = "";
			let i = 0;
			var csv_arr = that.data.csvArr;
			var radio_obj = that.data.radioObj;
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
			let that = task_run;
			
			that.pt.find(".sub_wrap .anno_table .table_body").off("scroll").on("scroll",function(){
				let scroll_info = that.data.scrollObj;
				let target = $(this);
				var csv_arr = that.data.csvArr;
				
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
			let that = task_run;
			
			if(size == 0){ return; }

			if(type == "down"){
				that.pt.find(".sub_wrap .anno_table tbody tr").slice(0,size).remove();					
			} else {		
				that.pt.find(".sub_wrap .anno_table tbody tr").slice(-size).remove();
			}
			that.pt.find(".sub_wrap .table_body").scrollTop((that.pt.find(".sub_wrap .table_body")[0].scrollHeight - that.pt.find(".sub_wrap .table_body").height()) / 2);
		},

		modelListener : function() {
			let that = task_run;
			let row_click = that.pt.find(".sub_wrap .list_wrap .anno_table tbody tr")
			row_click.off("click").on("click",function() {
				let tr = $(this);
				let btn = tr.children().children().children(".radioBtn");
// 				let id = tr.data("id");
				let id = tr.attr("data-id");
				btn.toggleClass("selected");
				if(btn.hasClass("selected")){
					that.data.radio_obj = {};
					that.pt.find(".sub_wrap .list_wrap .anno_table tbody tr .radioBtn").removeClass("selected");
					btn.addClass("selected");
// 					that.data.radio_obj["id"] = id;
					that.data.radioObj["id"] = id;
				} else {
					that.data.radio_obj = {};
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
			let that = task_run;
// 			imgList = [];
// 			img_path = [];
			that.data.imgScrollObj.linked_list = null;
			that.pt.find(':input').val("");
// 			that.pt.find("input[name='score']").val(0);
			hideLoading("#task_run .list_container");
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
		getEnrichmentDetail : function(datasetId) {
			var that = task_run;
			ajaxData = {
				dataset_id : datasetId
			};

			$.ajax({
				url : baseUrl + "data/getPageNoLimitDataList.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("===getEnrichmentDetail===", res);
					if (res.result.code == "200") {
						if(res.result.data != null){
							$("#task_run .list_container table thead tr th .checkBox").removeClass("selected");
							that.drawEnrichmentDetail(res.result.data);	
						} 
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}
					hideLoading("#task_run .main_wrap .list_container");
				}, error : function(err) {
					hideLoading("#task_run .main_wrap .list_container");
					console.log("ERROR!!", err);
				}
			});
		},

		drawEnrichmentDetail : function(data) {
			var that = task_run;
			
			
			if(data.length != 0){
				for (var i = 0; i < data.length; i++) {
					let img_path = data[i].path;
					that.modifyImageData(img_path);
				}
				var linked_list = that.data.imgScrollObj.linked_list;
				$("#task_run .main_wrap .list_total").text("Total " + linked_list.length);
				that.appendNewPath(i);	
			} else {
				alert("사용 가능한 데이터가 없습니다.");
				that.addEmptyData($("#task_run .table_body.run_area "), "No Data", "you have not added any data yet");
				return false
			}

		},

		putImg : function() {
			let that = task_run;
			var dataset_id = that.data.datasetId;
			that.resetImageData();
			var linked_list = that.data.imgScrollObj.linked_list;
			that.pt.find(".list_container .table_body").off("scroll");
			that.pt.find(".list_container .anno_table tbody").html("");
			let nodes = wsObj[that.data.pageObj.key].dir.getSelectedNodes();
			let level = nodes[0].level;
			that.data.dataset_id = nodes[0].id;
			dataset_id = nodes[0].id;
			that.data.label_type = nodes[0].label_type;
			//console.log("putImg::", nodes[0]);
			
			if(linked_list == null){
				that.data.imgScrollObj.isInit = true;
			}
			that.removeEmptyData(that.pt.find(".list_container .table_body"));
			showLoading("#task_run .main_wrap .list_container");
			that.getEnrichmentDetail(dataset_id);
		},
		
		setStartAndLastNode : function(){
			let that = task_run;
			var linked_list = that.data.imgScrollObj.linked_list;
			
			if(linked_list != null){
				that.data.imgScrollObj.last_node = linked_list.obj[that.pt.find(".list_container tbody tr").last().data("id")];
				that.data.imgScrollObj.start_node = linked_list.obj[that.pt.find(".list_container tbody tr").first().data("id")];
			}
		},
		
		resetImageData : function(){
			let that = task_run;
			that.data.imgScrollObj.linked_list = null;
			that.data.imgScrollObj.image_remain_size = 0;
			that.data.imgScrollObj.isImageScroll_top = false;
			that.data.imgScrollObj.isImageScroll_end = false;
			that.data.imgScrollObj.isImageScroll = false;
		},
		
		modifyImageData : function(data){
			let that = task_run;
// 			var linked_list = that.data.imgScrollObj.linked_list;
			
			if(that.data.imgScrollObj.linked_list == null){
				that.resetImageData();
				that.data.imgScrollObj.linked_list = new LinkedList();
			} 
			
			if(that.data.imgScrollObj.linked_list.obj[data] == undefined){
				that.data.imgScrollObj.linked_list.push(data,data);			
			}

		},
		
		appendNewPath : function(i){
			let that = task_run;
			
			var isImageScroll_end = that.data.isImageScrollEnd;
			var image_half_size = that.data.imgScrollObj.image_half_size;
			var image_remain_size = that.data.imgScrollObj.image_remain_size;
			var last_node = that.data.imgScrollObj.last_node;
			var isInit = that.data.imgScrollObj.isInit;
			
			var append_size = i;
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
    					that.data.imgScrollObj.isImageScroll_end = false;
    					that.setImageScrollListener();
    					
					}
				} else {
					let size = image_half_size - (box_size - image_default_size);
					if(size >= append_size){
// 						console.log("33");
						let temp_size = image_remain_size + append_size;

    					that.drawImageList(append_size, last_node.next, "down", false);
    					that.pathListener();
    					that.data.imgScrollObj.image_remain_size = temp_size;

    				} else {
//     					console.log("44");
    					
    					that.drawImageList(size, last_node.next, "down", true);
    					
    					that.pt.find(".list_container tbody tr").slice(0,image_half_size).remove();
    					that.pathListener();
    					that.data.imgScrollObj.isImageScroll_end = false;
    				}
					that.setImageScrollListener();
				}

			} else {
				if(isInit){
					that.initImageList();
					that.data.imgScrollObj.isInit = false;
				}
				
			} 

		},

		initImageList : function(){
			let that = task_run;
			var csv_arr = that.data.csvArr;
			var linked_list = that.data.imgScrollObj.linked_list;
			var image_default_size = that.data.imgScrollObj.image_default_size;
			
			if(linked_list == null){
				alert("사용 가능한 데이터가 없습니다");
				that.pt.fnd(".submit_btn").hide();
				that.addEmptyData(that.pt.find(".list_container .table_body.run_area"), "No Data", "you have not added any data yet");
				hideLoading("#task_run .main_wrap .list_container"); 
				return;
			}
			if(csv_arr.length > 0){
				that.pt.find(".submit_btn").show();
			}
			let node = linked_list.head;
			that.data.imgScrollObj.start_node = node;
			
			that.drawImageList(image_default_size, node, "down",true);
			
			if(linked_list.length > image_default_size) {
				that.data.imgScrollObj.isImageScroll_top = true;
				that.setImageScrollListener();
			} else {
				that.data.imgScrollObj.isImageScroll_end = true;
			}
			that.pathListener();
		},
		
		addImageList : function(node,type){
			let that = task_run;
			var image_half_size = that.data.imgScrollObj.image_half_size;
			
			that.drawImageList(image_half_size, node, type, false);
			that.data.imgScrollObj.isImageScroll = false;
			that.pathListener();
		},
	
		drawImageList : function(size,node,type,isInit){
			
			var that = task_run;
			var temp_node = node;
			var label_type = that.data.labelType;
			
			var target = that.pt.find(".list_container table tbody");	
			var i = 0;
			
			while(node){
				if(i>=size){break;}				
				let html = ""
				i++;		
				let cur_id = node.value
				html += " <tr data-id='"+cur_id+"'> ";
				if(label_type == "IMAGE_BBOX" || label_type == "IMAGE_SEGMENTATION"){
					html += "   <td class='preview'><div class='img_preview'><div class='normal_img'><div class='frame_container'></div></div></div></td>";
					that.pt.find("th.pre").html("PREVIEW");
				} else if(label_type == "VIDEO_BBOX"){
					html += "   <td class='preview'></td>";
					that.pt.find("th.pre").html("");
				}
				html += "   <td class='image_path'>"+cur_id + "</td>";
				html += " </tr>";
				that.data.imgScrollObj.start_node = node;
				that.data.imgScrollObj.last_node = node;
				
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
			
			hideLoading("#task_run .main_wrap .list_container");
		},
		
		setNodeData : function(i,type){
			let that = task_run;
			var linked_list = that.data.imgScrollObj.linked_list;
			var image_default_size = that.data.imgScrollObj.image_default_size;
			var image_half_size = that.data.imgScrollObj.image_half_size;
			var start_node = that.data.imgScrollObj.start_node;
			var last_node = that.data.imgScrollObj.last_node;
			
			let tr_size = that.pt.find(".list_container tbody tr").length;
			if(type == "down"){
				
				if(i>=image_half_size && last_node.next != null){
// 					console.log(i, tr_size , "down normal");
		
					that.data.imgScrollObj.isImageScroll_top = false;
					if(tr_size != image_half_size){
						that.removeTableBox((tr_size - image_default_size), type);
					} else {
						that.removeTableBox((tr_size - image_half_size), type);
					}
					that.data.imgScrollObj.image_remain_size = 0;
					that.setStartAndLastNode();	
				} else {
					
					that.data.imgScrollObj.image_remain_size = i;
					that.data.imgScrollObj.isImageScroll_end =  true;
// 					console.log(i, tr_size, "down end");
				}

			} else {
				
				if(i>=image_half_size && start_node.prev != null){
					that.data.imgScrollObj.isImageScroll_end = false;
					that.removeTableBox((image_half_size + image_remain_size), type);
					that.setStartAndLastNode();	
					that.data.imgScrollObj.image_remain_size = 0;
// 					console.log(i, tr_size, "up normal");
				} else {
					if(tr_size != image_half_size){
						that.removeTableBox((i + image_remain_size), type);
						that.data.imgScrollObj.image_remain_size = 0;
					}
					that.data.imgScrollObj.isImageScroll_top =  true;
					
					that.data.imgScrollObj.last_node = linked_list.obj[that.pt.find(".list_container tbody tr").last().data("id")];
// 					console.log(i, tr_size, "up end");
				}
			}
		},
		
		setImageScrollListener : function(){
			
			var that = task_run;
			var start_node = that.data.imgScrollObj.start_node;
			var last_node = that.data.imgScrollObj.last_node;
			var isImageScroll_top = that.data.imgScrollObj.isImageScroll_top;
			var isImageScroll_end = that.data.imgScrollObj.isImageScroll_end;
			var isImageScroll = that.data.imgScrollObj.isImageScroll;
			
			that.pt.find(".list_container .table_body").off("scroll").on("scroll",function(){
    			
				let target = $(this);
				let st = target.scrollTop();
				
				let box_size = that.pt.find(".list_container tbody tr").length;
				
				if (st + target.innerHeight() >= target[0].scrollHeight && !isImageScroll){
					// 제일 아래,.
					if(!isImageScroll_end){
						if(last_node.next != null) {
							that.data.imgScrollObj.isImageScroll = true;
							that.data.imgScrollObj.isImageScroll_top = false;
							that.addImageList(last_node.next,"down");	
						} 
					}
				} else if (st == 0 && !isImageScroll){
					if(!isImageScroll_top){
						if(start_node.prev != null){
							that.data.imgScrollObj.isImageScroll = true;
							that.data.imgScrollObj.isImageScroll_end = false;
							that.addImageList(start_node.prev,"up");
						}
					}
				}
			});	
		},
		
		removeTableBox : function(size,type){
			let that = task_run;

			if(type == "down"){
				that.pt.find(".list_container tbody tr").slice(0,size).remove();					
			} else {		
				that.pt.find(".list_container tbody tr").slice(-size).remove();
			}
			that.pt.find(".list_container .table_body").scrollTop((that.pt.find(".list_container .table_body")[0].scrollHeight - that.pt.find(".list_container .table_body").height()) / 2);

		},

		pathListener : function() {
			let that = task_run;
			
			
			//이미지 호버 로우 안에 td  td.image_path 안에 normal_img , normal_img 안에 frame_container;
			
			let img_preview = that.pt.find("tbody .preview .img_preview")
			
			img_preview.off("click").on("click",function(){
// 				var canvas = that.data.canvas;
				$(this).toggleClass("selected");
				if($(this).hasClass("selected")){

					that.data.canvas = null;
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
			        that.data.canvas = new fabric.Canvas(cur_index+"c");
			        that.data.canvas.selection = false;
					
					let path = tr.parent().siblings(".image_path");
					
					console.log(path[0].innerText, cur_index);

					imgObj.src = "/uploadFile/xlabeller/" + path[0].innerText;
					showLoading(tr.children(".normal_img"));
					
					imgObj.onload = function(){					
						that.rescale(this);		
						that.data.canvas.setBackgroundImage(imgObj.src, that.data.canvas.renderAll.bind(that.data.canvas), {
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
        	var that = task_run;
			var canvas = that.data.canvas;
			var canvas_max_width = 208;
            var canvas_max_height = 140;
            if((canvas_max_height / canvas_max_width) >= (img.naturalHeight / img.naturalWidth)){
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
			let that = task_run;

			let check_box = $("#task_run").find(".check_box_wrap .checkBox");

			let file_name = that.pt.find("#file_name").val();

			let box = that.pt.find(".sub_wrap .list_wrap table tbody tr .checkBox.selected")
			var radio_obj = that.data.radioObj;
			console.log("radio_obj::", radio_obj);
			var linked_list = that.data.imgScrollObj.linked_list;
			
			let keys = Object.keys(radio_obj)
			//let name = radio_obj[keys[0]];
			//console.log("name::", name);
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
					alert("파라미터 값을 입력해주세요");
					inf_string[i].focus();
					return false;
				}
			};
			
			for(let i=0; i < inf_number.length; i++){
				if(inf_number[i].value != ""){
					config_arr[inf_number[i].name] = inf_number[i].value * 1;
					console.log("inf_number[i].value * 1:::", inf_number[i].value * 1);
					console.log("typeof inf_number[i].value * 1 :::", typeof(inf_number[i].value * 1));
				} else {
					alert("파라미터 값을 입력해주세요");
					inf_number[i].focus();
					return false;
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
            let selected_gpu_node_id = $("#task_run").find(".table_body .gpu_table tbody tr").find("td .selected").parents("tr").attr("data-id");
            let selected_gpu_index = $("#task_run").find(".table_body .gpu_table tbody tr").find("td .selected").parents("tr").find(".gpu_index").attr("data-index");
	         if(selected_gpu_node_id == undefined || selected_gpu_node_id == null || selected_gpu_node_id == "" || selected_gpu_index == undefined || selected_gpu_index == null || selected_gpu_index == ""){
	        	alert("선택된 GPU가 없습니다.\nGPU를 선택해주세요.");			// gpu 사용가능한것이 없어도 run 버튼이 눌리던 문제 대안 
	        	return false;
	        }
	         
	        let selected_model_name = $("#task_run").find(".table_body .anno_table tbody tr").find(".td_wrap .selected").next(".csv_name").text();
	        console.log("selected_model_name::" ,selected_model_name);
	        //let selected_gpu_index = $("#task_run").find(".table_body .gpu_table tbody tr").find("td .selected").parents("tr").find(".gpu_index").attr("data-index");
		    if(selected_model_name == undefined || selected_model_name == null || selected_model_name == '' ){
		        alert("선택된 모델이 없습니다.\n모델을 선택해주세요.");			// gpu 사용가능한것이 없어도 run 버튼이 눌리던 문제 대안 
		        return false;
		    }
            
            /////
/* 			if (check_box.hasClass("selected")) {
				ischecked = "true";
			} else {
				ischecked = "false";
			} */

			if(linked_list == null){
				alert("사용 가능한 데이터가 없습니다");
				return false;
			}
			let img_string = "";
			let node = linked_list.head;
			var dataset_id = that.data.dataset_id;
			console.log("dataset_id::", dataset_id);
			while(node){
				if(node == null) {break;}
				let sp = node.value;
				if(img_string == ""){
					img_string += "/xlabeller/" + sp;
				} else {
					img_string += ","+ "/xlabeller/" + sp;
				}
				node = node.next
			}

			if (img_string == "") {
				alert("추가 할 파일이 없습니다");
				return false;
			}
			
			if (file_name == "") {
				alert("파일명을 입력해주세요");
				that.pt.find("input[name='file']").focus();
				return false;
			}
			 
			/* if(name == null || name == ""){
				alert("선택된 모델 데이터가 없습니다");
				return false;
			}  */
			
			
			if(dataset_id == ""){
				alert("사용 가능한 데이터가 없습니다");
				return false;
			}
			
			file_name = file_name + "#" + dataset_id;
			console.log("file_name::" + file_name);
			var task_id = that.data.taskId;
			let ajaxData = {
				task_id : task_id,					// task id인지 확인 > ok 
				config : config_string,  			// 수정 json으로 넘기기 값 확인 > ok
				img_path : img_string,
				model_name : selected_model_name,
				csv_save_name : file_name,				// config 와 별개로 반드시 받아야하는 값  => ok
				gpu_node_id : selected_gpu_node_id,
				gpu_index : selected_gpu_index
			}
			
			// qr
			//console.log("setAjaxData ajaxData:::::", ajaxData);
			//console.log("that.data.label_type::", that.data.label_type);
			//console.log("dataset_id::", dataset_id);
			console.log("that.data.algorithm_title::", that.data.algorithm_title);
			if(that.data.algorithm_title == "YOLO" && that.data.label_type == 'VIDEO_BBOX') {
				//ajaxData['dataset_id'] = dataset_id;
				console.log("runInferenceYoloVideo");
				that.runInferenceYoloVideo(ajaxData);
			} else {
				console.log("runInference");
				that.runInference(ajaxData);
			}
		},
		
/* 		setAjaxData : function() {						/// 수정
			let that = task_run;

			let check_box = that.pt.find(".check_box_wrap .checkBox");
			let arr = that.pt.find(".list_wrap table tbody tr");

			let ischecked;
			let file_name = that.pt.find("input[name='file']").val();
			let score_value = that.pt.find("input[name='score']").val();
			

			let box = that.pt.find(".sub_wrap .list_wrap table tbody tr .checkBox.selected")
			
			let keys = Object.keys(radio_obj)
			let name = radio_obj[keys[0]];
			
			if (check_box.hasClass("selected")) {
				ischecked = "true";
			} else {
				ischecked = "false";
			}

			if(linked_list == null){
				alert("사용 가능한 데이터가 없습니다");
				return;
			}
			let img_string = "";
			let node = linked_list.head;
			while(node){
				if(node == null) {break;}
				let sp = node.value;
				if(img_string == ""){
					img_string += sp;
				} else {
					img_string += ","+sp;
				}
				node = node.next
			}

			if (img_string == "") {
				alert("추가 할 파일이 없습니다");
				return;
			}
			
			if (score_value == "") {
				alert("Score 값을 입력해주세요");
				that.pt.find("input[name='score']").focus();
				return;
			}
			
			if(score_value > 1 || score_value < 0){
				alert("0에서 1 사이의 Score 값을 입력해주세요");
				that.pt.find("input[name='score']").focus();
				return;
			}
			
			if (file_name == "") {
				alert("파일명을 입력해주세요");
				that.pt.find("input[name='file']").focus();
				return;
			}
			
			if(name == null || name == ""){
				alert("선택된 데이터가 없습니다");
				return;
			}
			
			if(dataset_id == ""){
				alert("사용 가능한 데이터가 없습니다");
				return;
			}
			
			file_name = file_name + "#" + dataset_id;

			let ajaxData = {
				id : run_id,
				score : score_value,
				img_path : img_string,
				model_name : name,
				is_convert_model : ischecked,
				csv_save_name : file_name
			}

			$("#loader").show();
			that.runInference(ajaxData);
		}, */

		runInference : function(ajaxData) {
			let that = task_run;
			var task_id = that.data.taskId; 
			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/runInference.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("======runInference======", res);
					if (res.result.code == "200") {
						trainer.list("1",task_id);
						that.resetView();
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
		
		runInferenceYoloVideo : function(ajaxData) {
			let that = task_run;
			var task_id = that.data.taskId; 
			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/runInferenceYoloVideo.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("======runInference======", res);
					if (res.result.code == "200") {
						trainer.list("1",task_id);
						that.resetView();
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
		
		downloadModel : function(){
			var that = task_run;
			var radio_obj = that.data.radioObj;
			
			let keys = Object.keys(radio_obj)
			let modelFile = radio_obj[keys[0]];
			var task_id = that.data.taskId;
			if(modelFile == null){
				alert("모델을 선택해주세요");
				return;
			}
			$.ajax({
				url : baseUrl + "task/getTaskById.json",
				data : {"task_id": task_id, "type" : 1},
				type : "POST",
				//async : false,
				success : function(res) {
					console.log("======getTaskById======", res);
					if (res.result.code == "200") {
						if(res.result.data != null){
							var taskId;
							var pId = res.result.data.project_id;
							that.data.taskId = res.result.data.task_id;
							var dUrl = "/uploadFile/xlabeller/workspace/"+pId+"/"+that.data.taskId+"/model/"+modelFile;
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
		getTaskById : function(id) {
			let that = task_run;
			ajaxData = {
				task_id : id
			}

			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/getTaskById.json",
				data : ajaxData,
				async : false,
				type : "POST",
				success : function(res) {
					$("#loader").hide();
					console.log("=====getTaskById run=====", res);
					if (res.result.code == "200") {	
						that.data.labelType = res.result.data.label_type;						
						that.getAlgorithmById(res.result.data);
						that.drawTaskName(res.result.data);	
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
		
		drawTaskName : function(data){
			let that = task_run;
			
			let taskName_data = data;
			let target_title = $("#task_run").find(".task_name");
			let select_task_name = "( Selected Task : " + taskName_data.title + " )";
			$(target_title).html(select_task_name);
			console.log("taskName_data : ", taskName_data);

		},		
		
		// id에 해당하는 algorithm 정보 가져오기
		getAlgorithmById : function(data) {
			let that = task_run;
			
			let taskData = data;
			let ajaxData = {
				algorithm_id : data.algorithm_id
			}
			
			
			$("#loader").show();
			$.ajax({
				url : baseUrl + "algorithm/getAlgorithmById.json",
				data : ajaxData,
				//async : false,
				type : "POST",
				success : function(res){
					console.log("=====getAlgorithmById=====", res);
					if(res.result.code == "200"){
						that.data.algorithm_title = res.result.data.title;
						that.setInferenceParam(res.result.data);
						$("#loader").hide();
						//that.drawTaskResult(taskData, res.result.data);
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
						$("#loader").hide();
					} else {
						alert(res.result.data);
						$("#loader").hide();
					}
				},
				error : function(err){
					console.log("getAlgorithmById ERROR!", err);
				}
			});
		},  	
		
		// algorithm_id의 정보로 div 그리기 
 		setInferenceParam : function(data) {
			let that = task_run;
			let inference_param_data = JSON.parse(data.inference_param);
			let target = $("#task_run").find(".box_wrap");
			let target_title = $("#task_run").find(".sub_wrap .title_wrap .algorithm_name");
			let algorithm_name = "( Selected algorithm : " + data.title + " )";
			//console.log("that.data.algorithm_title::", that.data.algorithm_title);
			$(target).html("");
			$(target_title).html(algorithm_name);
			
			for(let i=0; i < inference_param_data.length; i++){
					//console.log(inference_param_data[i]);
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
			//console.log("tooltip_wrap:: ", tooltip_wrap);
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
			let that = task_run;
			let gpuTarget = $("#task_run").find(".table_body .gpu_table tbody");
            
            $(gpuTarget).html("");

//              let gpu_data = [{"node_ip":"192.168.1.12","unavailable_gpu_index":"4","gpu_node_id":"1"},
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},             
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},   
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},   
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},   
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},   
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},   
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},                
//              ];  
			
			// 테스트용 주석해야
            //let gpu_data = [{"node_ip":"192.168.1.12","available_gpu_index":"4","gpu_node_id":"1"}];             
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
							// jh.sa 210126 xx번 서버에 GPU가 n개일 때 n개 모두 사용중일 경우 node_ip + No GPU available 표시
							html += "<tr>";
							html += "<td class='gpu_node_ip'>"+ node_ip +"</td>";
							html += "<td colspan='3' align='center'>No GPU available</td>";    
							html += "</tr>";
// 							html += "<tr><td colspan='4' align='center'>No GPU available</td></tr>";
        				}
        /*                 let ugiArr = tempObj["unavailable_gpu_index"].split(",");
                        for(let i = 0 ; i < ugiArr.length ; i++){
                       	let status = "unavailable";
                       	let resultObj = {"node_ip":node_ip,"gpu_index":ugiArr[i],"status":status,"gpu_node_id":gpu_node_id};
                        renderArr.push(resultObj);

                        } */
                        //console.log("renderArr::", renderArr);
                    }            		
            	} else if (gpu_data.length == 0){
            		html += "<tr><td colspan='4' align='center'>No GPU available</td></tr>";            		
            	}
            } else {
        		html += "<tr><td colspan='4' align='center'>No GPU available</td></tr>";
            }


            for(let i = 0 ; i < renderArr.length;i++){
           	let renderObj = renderArr[i];
           	//console.log("renderObj:::", renderObj[i]);
           	let template = "";
            
                template = "<tr data-id='"+renderObj["gpu_node_id"]+"'>"+"<td class='gpu_node_ip'>"+renderObj["node_ip"]+"</td>"+"<td class='gpu_index' data-index='"+renderObj["gpu_index"]+"'>"+renderObj["gpu_index"]+"</td>"+"<td class='gpu_status'>"+renderObj["status"]+"</td>"+"<td class='gpu_select'>"+"<div class='radioBtn'>"+"</div>"+"</td>"+"</tr>"; 

            html+= template;
            }

            $(gpuTarget).append(html);  
            

			let gpu_row_click = $("#task_run").find(".sub_wrap .list_wrap .gpu_table tbody tr")
			gpu_row_click.off("click").on("click",function() {
				let gpu_tr = $(this);
				//let gpu_btn = gpu_tr.children().children().children(".radioBtn");
				let gpu_btn = gpu_tr.children(".gpu_select").children(".radioBtn");
				//let gpu_id = gpu_tr.data("id");
				gpu_btn.toggleClass("selected");
				if(gpu_btn.hasClass("selected")){
					//radio_obj = {};
					$("#task_run").find(".sub_wrap .table_body .gpu_table tbody tr .radioBtn").removeClass("selected");
					gpu_btn.addClass("selected");
					//radio_obj[id] = id;
				} else {
					//radio_obj = {};
				}				
			});
			
		},
		
		// 사용가능한 GPU Node List 가져오기 
		getSelectableGpuNode : function() {
			let run_class = trainer.pt.find(".section_wrap .task_run");
		
			let that = task_run;
			var task_id = that.data.taskId; 
			ajaxData = {
				task_id : task_id
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
						// 주석해야함 
						//that.drawGpuNodeList(res.result.data);
						//
						alert(res.result.data);
					}
					
					hideLoading("#task_run .list_wrap");
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
			var task_id = that.data.taskId; 
			
		
			ajaxData = {
				task_id : task_id,
				csv_save_name : csv_save_name
			};

			$.ajax({
				url : baseUrl + "task/getResultList.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
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

	var createObject_run = function() {

		let that = task_run;

		let arr1 = {};
		let arr2 = {};

		let result = [];

		arr1["expandNode"] = that.getDatasetList
		arr1["drop"] = {
			"area" : "run_area",
			"onDrop" : that.insertImg
		}

		result.push(arr1)

		that.data.pageObj = {
			key : "trainer_run",
			pointer : "ws_wrap2",
			info : result
		};
	}
</script>
