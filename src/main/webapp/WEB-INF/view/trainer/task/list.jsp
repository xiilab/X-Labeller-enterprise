<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>

<title>X-labeller</title>

<style>

/* 공통 */

#task_list {width: 100%; height: 100%;}
#task_list .ms_wrap {width: 100%; margin-top:23px; height: 100%;}
#task_list .title_wrap span {font-family: Open_Sans; font-size: 12px; font-weight: 400; display:inline-block; color: #343434; margin-bottom: 18px;}

#task_list .list_total {float: right; font-family: Open_Sans; font-size: 12px; font-weight: 400; color: #343434; margin-bottom: 21px;}

#task_list .margin {margin: 0 43px; height: calc(100% - 55px);}

#task_list .table_body {overflow-y: overlay; overflow-x:hidden; background-color: #fff;}

#task_list .main_wrap .table_body {max-height: calc(100% - 80px);}
#task_list .sub_wrap .table_body {max-height: calc(100% - 46px);}

#task_list .hover_box {border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
#task_list .hover_box div {font-family: NotoSansKR; font-size: 13px; color: #555555;}
#task_list .hover_div div {word-break: break-word; margin: 2px 5px; white-space: normal; font-weight: 300; font-family: Open_Sans;}
#task_list .hover_div {max-width: 264px; text-align: left; position: relative; }
#task_list .hover_box {max-width: 264px; text-align: left; }

#task_list .list_wrap {height: calc(100% - 105px); position:relative;}

#task_list .empty_wrap {text-align: center; margin-top: 170px; }
#task_list .empty_wrap .no_image {margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; }
#task_list .empty_wrap .eng_text {font-family: Open_Sans; margin-bottom: 3px; font-size: 16px; font-weight: 300; color: #777777;}
#task_list .empty_wrap .kor_text {font-family: Open_Sans; font-size: 12px; color: #777777; font-weight: 200;}
#task_list .no_image {height: 37px; background-image: url('./images/icon_nodata_list.png'); }

/* 메인 */

#task_list .main_wrap {width: 60% ; height: 100%; position: relative;}
#task_list .ms{height: calc(100% - 23px);}
#task_list .main_wrap .btn_wrap {bottom: 0; right: 30px; position: absolute; margin-bottom: 41px; }
#task_list .main_wrap .meta_btn {background-color: #4c84ff; color: #ffffff; border-radius:2px; text-align:center ; padding: 0px; width: 86px; height: 28px; font-family: Open_Sans; font-size: 12px; font-weight: 300;}
#task_list .main_wrap .meta_btn:hover {background-color: #3A71E9; }

#task_list .main_wrap table tbody tr td {cursor: default;}
#task_list .main_wrap .list_wrap table tbody tr .preview .img_preview {cursor: pointer; border: 1px solid #979797; position: relative; margin: auto;  border-radius: 2px; background-size: 14px; width: 28px ; height: 28px; background-color: rgba(0, 0, 0, 0.1); background-image: url('./images/icon_preview_normal.png'); background-repeat: no-repeat; background-position: center; position: relative;}
#task_list .main_wrap .list_wrap table tbody tr .preview .img_preview:hover { background-image: url('./images/icon_preview_hover.png'); border: 1px solid #4c84ff;}
#task_list .main_wrap .list_wrap table tbody tr .preview .show_img{ z-index: 1; display: none; align-items: center; justify-content: center; flex-direction: column;  border-radius: 1px ; border : 1px solid #dadada;  top: -30px; left: 130%;  width: 120px;height: 90px;box-shadow: 0 5px 9px -1px rgba(0, 0, 0, 0.16); background-color: #ffffff;}
#task_list .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap{ z-index: 99; display: none;   border-radius: 1px ; border : 1px solid #dadada;  top: -30px; left: 130%;  width: 294px;height: 248px; box-shadow: 0 5px 9px -1px rgba(0, 0, 0, 0.16); background-color: #ffffff}
#task_list .main_wrap .list_wrap table tbody tr .preview .img_preview.selected .normal_img_wrap{display: block;}
#task_list .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap .inner_title_wrap {height: 28px; }
#task_list .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap .inner_title_wrap .image{margin-left: 12px; background-image: url('./images/icon_preview_hover.png'); background-repeat: no-repeat; width: 12px; height: 12px; }
#task_list .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap .inner_title_wrap .title{overflow: hidden; white-space: nowrap; text-overflow: ellipsis;max-width: 254px; margin-right:12px; margin-left: 4px; font-weight: 400; font-family: NotoSansKR; font-size: 12px; color: #555555; }
#task_list .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap .frame_container {display:flex; height:219px; align-items: center; justify-content: center; flex-direction: column; border-top: 1px solid #dadada;}


/* 서브 */


#task_list .sub_wrap {width: 40% ; height: 100%; background-color: #f5f5f5; position:relative; }
#task_list .sub_wrap .btn_wrap {text-align:center; position:absolute; left: 25% ; right: 25% ; bottom: 0 ; margin-bottom: 37px;}
#task_list .sub_wrap .submit_btn {border-radius: 23px; width: 240px; height: 36px; box-shadow: 0 4px 8px 0 #b4d7ff; background-color: #4c84ff; font-family: Open_Sans; font-weight: 300; }
#task_list .sub_wrap .submit_btn:hover {background-color: #3A71E9; }

/* #task_list .sub_wrap .list_wrap {margin-top: 57px; } */


#task_list .table_body {position:relative;}
#task_list .td_wrap .radioBtn {margin: 0 20px;}
#task_list .td_wrap .file_name {width: calc(100% - 108px); overflow: hidden; white-space: nowrap; text-overflow: ellipsis;}

#task_list .status_off { width: 13px; height: 13px; border-radius: 10px; background-color: #FF3636; border: 1px solid #9a9a9a; display: inline-block; margin-left: 12px; margin-bottom: -3px; }
#task_list .status_on { width: 13px; height: 13px; border-radius: 10px; background-color: #35c19a; border: 1px solid #9a9a9a; display: inline-block; margin-left: 12px; margin-bottom: -3px; }
#task_list .status_normal { width: 13px; height: 13px; border-radius: 10px; background-color: #b3b3b3; border: 1px solid #9a9a9a; display: inline-block; margin-left: 12px; margin-bottom: -3px; }

#task_list .list_reset { width: 45px; height: 15px; border-radius: 5px; cursor: pointer; font-size: 12px; display: inline-block; text-align: center; margin: 0 auto; padding:5px; background-color: #4c84ff; color: #fff; line-height: 15px; margin-left: 15px; }
#task_list .list_reset:hover { background-color: #3A71E9; }
#task_list .task_name { font: 400 11px system-ui !important; color: #777 !important; }


</style>

</head>
<body>

	<div class="container" id="task_list">
		<div class="contents flex">
			<div class="main_wrap">
				<div class="ms">
					<div class="ms_wrap">
						<div class="title_wrap">
							<span>Inference List</span>
							<span class="task_name"></span>
							<span class="list_total">Total 0</span>
						</div>
						<div class="list_wrap">

							<div class="table_header">
								<table class="anno_table">
									<colgroup>
<%-- 										<col style="width: 46px;"></col> --%>
										<col style="width: 67px;"></col>
										<col style=""></col>
										<col style="width: 61px;"></col>
										<col style="width: 61px;"></col>
										<col style="width: 61px;"></col>
										<col style="width: 61px;"></col>
										<col style="width: 85px;"></col>
									</colgroup>
									<thead>
										<tr>
<!-- 											<th><div class="checkBox"></div></th> -->
											<th class="pre">PREVIEW</th>
											<th>PATH</th>
											<th>X_1</th>
											<th>Y_1</th>
											<th>X_2</th>
											<th>Y_2</th>
											<th>LABEL</th>
										</tr>
									</thead>
								</table>
							</div>
							<div class="table_body">
								<table class="anno_table">

									<colgroup>
<%-- 										<col style="width: 46px;"></col> --%>
										<col style="width: 67px;"></col>
										<col style=""></col>
										<col style="width: 61px;"></col>
										<col style="width: 61px;"></col>
										<col style="width: 61px;"></col>
										<col style="width: 61px;"></col>
										<col style="width: 85px;"></col>
									</colgroup>

									<tbody>

									</tbody>

								</table>
							</div>
						</div>
					</div>
					<div class="btn_wrap">
						<button class="meta_btn filter_color">Add</button>
					</div>
				</div>
			</div>
			<div class="sub_wrap">
				<div class="margin">
					<div class="ms_wrap">
					<div class="title_wrap">
							<span class="sub_title">Status</span>
							<div class="status_normal" id="status"></div>
							<div class="list_reset filter_color">Refresh</div>
							<span class="list_total">Total 0</span>
						</div>
						<div class="list_wrap filter_color">
							<div class="table_header">
								<table class="anno_table">
									<colgroup>
										<col style=""></col>
									</colgroup>
									<thead>
										<tr>
											<th>CSV</th>
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
					<button class="submit_btn filter_color">Open</button>
				</div>
			</div>
		</div>
	</div>
</body>


<script>
	$(document).on("sessionLoad", function() {
	});
	// 현재 task 아이디..
// 	var cur_id;							// jh.sa 210208 cur_id => that.data.taskId

	// 칸바스에사용할것..
// 	var canvas;							// jh.sa 210208 canvas => that.data.canvas
// 	var canvas_hover;					// jh.sa 210208 canvas_hover => that.data.canvasHover
// 	var colorHash = new ColorHash();	// jh.sa 210208 colorHash => that.data.colorHash
// 	var scale;							// 사용 안함

	// inference status interval
// 	var status_interval;				// jh.sa 210208 status_interval => that.data.statusInterval

// 	var file_data = "";					// jh.sa 210208 file_data => that.data.fileData
// 	var dataset_id = "";				// jh.sa 210208 dataset_id => that.data.datasetId
// 	var status_id;						// jh.sa 210208 status_id (삭제) => that.data.taskId 
	
	//오른쪽 스크롤에 사용
// 	var search_arr = [];				// jh.sa 210208 search_arr => that.data.searchObj.search_arr 
// 	var search_obj = {};				// jh.sa 210208 search_obj => that.data.searchObj.search_obj
// 	var segmentation;					// 사용 안함 
	
// 	var csvScrollObj = {				// jh.sa 210208 csvScrollObj => that.data.csvScrollObj 
// 			scroll_start:0,
// 			scroll_end:0,
// 			isScroll_top:0,
// 			isScroll_end:0,
// 			isScroll : false,
// 			default_size : 40,
// 			half_size : (40 / 2)
// 	}
	
	//왼쪽 스크롤에 사용
// 	var image_arr = [];					// jh.sa 210208 image_arr => that.data.imgObj.image_arr 
// 	var image_obj = {};					// jh.sa 210208 image_obj => that.data.imgObj.image_obj 
// 	var selected_obj = {};				// jh.sa 210208 selected_obj => that.data.imgObj.selected_obj 
	
// 	var inferenceScrollObj = {			// jh.sa 210208 inferenceScrollObj => that.data.inferenceScrollObj 
// 			scroll_start:0,
// 			scroll_end:0,
// 			isScroll_top:0,
// 			isScroll_end:0,
// 			isScroll : false,
// 			default_size : 40,
// 			half_size : (40 / 2)
// 	}
	
	var task_list = {
		pt : $("#task_list"),
		data : {
			taskId : null,
			datasetId : null,
			labelType : null,
			canvas : null,
			canvasHover : null,
			colorHash : null,
			statusInterval : null,
			fileData : null,
			// 오른쪽 스크롤에 사용 
			searchObj : {
				search_arr : [],
				search_obj : {},
			},
			csvScrollObj : {
					scroll_start:0,
					scroll_end:0,
					isScroll_top:0,
					isScroll_end:0,
					isScroll : false,
					default_size : 40,
					half_size : (40 / 2)
			},			
			//
			// 왼쪽 스크롤에 사용 
			inferenceScrollObj : {
					scroll_start:0,
					scroll_end:0,
					isScroll_top:0,
					isScroll_end:0,
					isScroll : false,
					default_size : 40,
					half_size : (40 / 2)
			},		
			imgObj : {
				image_arr : [],
				image_obj : {},
				selected_obj : {},
			},

		},
		init : function(id) {
// 			cur_id = id;
// 			status_id = id;	
			//console.log("task_id::", id);
			let that = task_list;
			that.data.taskId = id;
			
			that.resetView();
			that.data.colorHash = new ColorHash();
// 			that.getTaskById();
			that.getTaskById(that.data.taskId);
			that.getInferenceResultList(that.data.taskId);
			that.setDefaultListener();
			console.log("현재 페이지의 task id : ", that.data.taskId);
			
			//test 
// 			let arr = [];
// 			for(let i=0;i<360;i++){
// 				arr.push("test#0"+i + ".csv");
// 			}
// 			that.modifyInferenceResultListData(arr);
// 			that.setDefaultListener();
// 			//test끝
			
// 			//오른쪽
// 			that.modifyInferenceResultData();
		},
		
		addEmptyData : function(elem, data1, data2){
			let that = task_list;
			elem.append("<div class='empty_wrap'><div class='no_image'></div><div class='eng_text'>"+data1+"</div><div class='kor_text'>"+data2+"</div></div>")
		},
		
		removeEmptyData : function(elem){
			let that = task_list;
			elem.find(".empty_wrap").remove();
		},
		
		resetView : function(){
			let that = task_list;			
			
			var status_interval = that.data.statusInterval;
			that.pt.find(".empty_wrap").remove();
			that.pt.find(".sub_wrap .table_body").off("scroll")
			that.pt.find(".main_wrap .table_body").off("scroll")
			that.pt.find(".table_body").scrollTop(0);
			that.pt.find(".checkBox").removeClass("selected");			

 			let target = that.pt.find(".list_wrap .table_body .anno_table tbody");
 			//console.log("target::", target);
 			target.empty();
 			$(target).html("");
 			that.pt.find(".list_total").text("Total 0");		// total reset
			that.pt.find(".meta_btn").hide();
			that.addEmptyData(that.pt.find(".main_wrap .list_wrap"), "No Data","please open your inference result");
			if(status_interval != null){
				clearInterval(status_interval);
			}
			that.pt.find(".title_wrap .sub_title span").removeClass("status_on");
			that.pt.find(".title_wrap .sub_title span").removeClass("status_off");
			that.getInferenceStatus();		// inference status 갱신
			status_interval = setInterval(that.getInferenceStatus, 3000);
		},
	
		setDefaultListener : function(){
			let that = task_list;
			
			$("#task_list").find(".submit_btn").off("click").on("click",function(){
				var search_obj = that.data.searchObj.search_obj;
				console.log("search_obj::", search_obj);
				
				let selected_model_name = $("#trainer").find(".table_body .anno_table tbody tr").find(".td_wrap .selected").next(".file_name").text();
		        console.log("selected_model_name::" ,selected_model_name);
		        //let selected_gpu_index = $("#task_run").find(".table_body .gpu_table tbody tr").find("td .selected").parents("tr").find(".gpu_index").attr("data-index");
			    if(selected_model_name == undefined || selected_model_name == null || selected_model_name == '' ){
			        alert("선택된 데이터가 없습니다.\n데이터를 선택해주세요.");			// gpu 사용가능한것이 없어도 run 버튼이 눌리던 문제 대안 
			        return false;
			    }
			    
			    var search_obj = that.data.searchObj.search_obj;
/* 				if(Object.keys(search_obj).length > 0){
					let keys = Object.keys(search_obj);
					
					that.pt.find(".empty_wrap").remove();
					that.pt.find(".main_wrap .table_body").off("scroll");
					that.pt.find(".main_wrap thead .checkBox").off("click");
					that.pt.find(".checkBox").removeClass("selected");			
					let target = that.pt.find(".main_wrap table tbody");
					target.empty();
					$(target).html("");

					that.getInferenceResult(search_obj[keys[0]]);
					
				} else {
					alert("선택된 데이터가 없습니다");
				}	 */	
			    if(selected_model_name){
					//let keys = Object.keys(search_obj);
					
					that.pt.find(".empty_wrap").remove();
					that.pt.find(".main_wrap .table_body").off("scroll");
					that.pt.find(".main_wrap thead .checkBox").off("click");
					that.pt.find(".checkBox").removeClass("selected");			
					let target = that.pt.find(".main_wrap table tbody");
					target.empty();
					$(target).html("");

					that.getInferenceResult(selected_model_name);
					
				} else {
					alert("선택된 데이터가 없습니다");
				}
			});
			
			that.pt.find(".meta_btn").off("click").on("click",function(){
				var image_arr = that.data.imgObj.image_arr;
				var selected_obj = that.data.imgObj.selected_obj;
				
				////201103
				for(let i = 0, len = image_arr.length; i<len; i++){
					let data = image_arr[i];
					let id = data.img_path +","+ data.x +","+ data.y +","+ data.w +","+ data.h +","+ data.label + ","+ data.segmentation;
//						console.log("data.segmentation : " + data.segmentation);
					if(selected_obj[id] == undefined){
						selected_obj[id] = id;	
					}
				}				
				that.getIfData();
			});
			
			that.pt.find(".list_reset").off("click").on("click", function(){
				var task_id = that.data.taskId;
				that.resetView();
				that.getInferenceResultList(task_id);
			});
		},
		
		getInferenceResultList: function(id){
			let that = task_list;
			
			let ajaxData = {
					id : id
				}
			$("#loader").show();
				$.ajax({
					url : baseUrl + "task/getInferenceResultList.json",
					data : ajaxData,
					type : "POST",
					success : function(res) {
						$("#loader").hide();
						console.log("=====getInferenceResultList=====", res);
						if (res.result.code == "200") {
							that.modifyInferenceResultListData(res.result.data);
						}  else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}
						
						
					},
					error : function(err) {
						$("#loader").hide();
						console.log("ERROR!!", err);
					}
				});
		},
		
		resetInferenceResultListData : function(){
			var that = task_list;
			var scroll_info = that.data.csvScrollObj;	
			//var search_arr = that.data.searchObj.search_arr;
			
			that.data.searchObj.search_arr = [];
			
			scroll_info.isScroll_top = false;
			scroll_info.isScroll_end = false;
			scroll_info.isScroll = false;
			search_obj = {};
			search_arr = [];
		},
		
		modifyInferenceResultListData : function(data){
			let that = task_list;
			var search_arr = that.data.searchObj.search_arr;
			
			that.resetInferenceResultListData();
			
			if(data.length == 0){
				that.pt.find(".submit_btn").hide();
				that.addEmptyData(that.pt.find(".sub_wrap .list_wrap"), "No Result","you have not added any result yet");
			} else {
				that.pt.find(".submit_btn").show();
			}
			
			for(let i = 0, len = data.length; i<len; i++){
				that.data.searchObj.search_arr.push(data[i]);
			}
			
			
			
			that.pt.find(".sub_wrap .list_total").text("Total " + that.data.searchObj.search_arr.length);
			that.initDrawInferenceResultList();
		},
		
		initDrawInferenceResultList : function(){
			let that = task_list;
			var search_arr = that.data.searchObj.search_arr;
			var scroll_info = that.data.csvScrollObj;
			that.pt.find(".sub_wrap .table_body table tbody").html("");
			scroll_info.scroll_start = 0;
			scroll_info.scroll_end = (scroll_info.default_size < search_arr.length ) ? scroll_info.default_size : search_arr.length;
			that.drawInferenceResultList("init",scroll_info.scroll_start,scroll_info.scroll_end);
			if(search_arr.length > scroll_info.default_size) {
				scroll_info.isScroll_top = true;
				that.ListScrollListener();
			}
		},
		
		drawInferenceResultList: function(type,start,end){
			let that = task_list;
			let target = that.pt.find(".sub_wrap .table_body table tbody");
			let html = "";
			let scroll_info = that.data.csvScrollObj;
			var search_arr = that.data.searchObj.search_arr;
			var search_obj = that.data.searchObj.search_obj;
			
			let i = 0;
			for (i = start ; i < end ; i++) {
				let data = search_arr[i];
				html += " <tr data-id='"+data+"'>";
				if(search_obj[data] != undefined){
					html += " 	<td><div class='td_wrap flex'><div class='radioBtn selected'></div><div class='file_name'>"+data+"</div></div></td>";
				} else {
					html += " 	<td><div class='td_wrap flex'><div class='radioBtn'></div><div class='file_name'>"+data+"</div></div></td>";
				}
				html += " </tr> ";
			}
			scroll_info.isScroll = false;

			if(type == "down" || type == "init"){
				target.append(html);	
			} else {
				target.prepend(html);
			}
			that.listListener();
		},
		
		ListScrollListener : function(){
			let that = task_list;	
			
			that.pt.find(".sub_wrap .table_body").off("scroll").on("scroll",function(){
				let scroll_info = that.data.csvScrollObj;
				var search_arr = that.data.searchObj.search_arr;
				var target = $(this);
				
				var st = target.scrollTop();
				var box_size = that.pt.find(".sub_wrap tbody tr").length;

				if(st + target.innerHeight() >= target[0].scrollHeight && !scroll_info.isScroll && !scroll_info.isScroll_end){
					scroll_info.isScroll = true;
					
					var diff = 0;
					if(scroll_info.scroll_end + scroll_info.half_size >= search_arr.length){
						diff = search_arr.length - scroll_info.scroll_end;
						scroll_info.scroll_end = search_arr.length;
						scroll_info.scroll_start = scroll_info.scroll_start + diff;
						scroll_info.isScroll_end = true;
						
					}else{
						diff = scroll_info.half_size;
						scroll_info.scroll_end = scroll_info.scroll_end + diff;
						scroll_info.scroll_start = scroll_info.scroll_start + diff;
					}
					var end = scroll_info.scroll_end;
					var start = end - diff;
					
					that.drawInferenceResultList("down",start,end);
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
					
					
					that.drawInferenceResultList("up",start,end);
					that.removeBox(diff,"up");	
					scroll_info.isScroll_end = false;
							
				}
			});
		},
		
		removeBox : function(size,type){
			let that = task_list;

			if(size == 0){ return; }
			
			if(type == "down"){
				that.pt.find(".sub_wrap tbody tr").slice(0,size).remove();					
			} else {		
				that.pt.find(".sub_wrap tbody tr").slice(-size).remove();
			}
			that.pt.find(".sub_wrap .table_body").scrollTop((that.pt.find(".sub_wrap .table_body")[0].scrollHeight - that.pt.find(".sub_wrap .table_body").height()) / 2);
		},
		
		listListener : function(){
			let that = task_list;
			let row_click = that.pt.find(".sub_wrap table tbody tr")
			row_click.off("click").on("click", function(){
				let tr = $(this);
				var search_obj = that.data.searchObj.search_obj;
				var box = tr.children().children().children(".radioBtn");		
				
				search_obj = {};
				box.toggleClass("selected");
				if(box.hasClass("selected")){
					let id = $(this).data("id")
					search_obj[id] = id;
					that.pt.find(".sub_wrap tbody tr .radioBtn").removeClass("selected");
					box.addClass("selected");
				} 
			});
			
			that.pt.find(".sub_wrap table tbody td .file_name").off("mouseenter").on("mouseenter",function(){
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
			
			that.pt.find(".sub_wrap table tbody td .file_name").off("mouseleave").on("mouseleave",function(){
				let td = $(this);
				td.find(".hover_box").remove();
			});
				
		},
		
		
		getInferenceResult : function(cur_filename) {
			let that = task_list;
			var task_id = that.data.taskId;
			console.log("that.data.taskId::", that.data.taskId);
			that.removeEmptyData(that.pt.find(".main_wrap .list_wrap"));
			that.data.fileData = cur_filename.replace(/\.csv/g,"");
			that.data.datasetId = that.data.fileData.split("#")[that.data.fileData.split("#").length -1];		// jh.sa 210208
// 			file_data = cur_filename.replace(/\.csv/g,"");
// 			dataset_id = file_data.split("#")[file_data.split("#").length -1];
			
			let ajaxData = {
				task_id : task_id,
				filename : cur_filename
			}
			//test
// 			that.modifyInferenceResultData();
			
			console.log(ajaxData);
			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/getInferenceResult.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("=====getInferenceResult=====", res);
					$("#loader").hide();
					if (res.result.code == "200") {
						if(res.result.data == null) {
							that.pt.find(".meta_btn").hide();
							alert("사용 가능한 데이터가 없습니다");
							that.addEmptyData(that.pt.find(".main_wrap .list_wrap"), "No Data","please open your inference result");
						}
						 if(res.result.data.length == 0){
							that.pt.find(".meta_btn").hide();
							alert("사용 가능한 데이터가 없습니다");
							that.addEmptyData(that.pt.find(".main_wrap .list_wrap"), "No Data","please open your inference result");
						} else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							that.pt.find(".meta_btn").show();
							that.modifyInferenceResultData(res.result.data);
							
						}
					} else {
						alert(res.result.data);
					}
					
					
					hideLoading(".task_list .result_wrap");
				},
				error : function(err) {
					$("#loader").hide();
					hideLoading(".task_list .result_wrap");
					console.log("ERROR!!", err);
				}
			});
		},
		
		resetImageScroll : function(){
			var that = task_list;
			var scroll_info = that.data.inferenceScrollObj;
			var image_arr = that.data.imgObj.image_arr;
			var image_obj = that.data.imgObj.image_obj;
			var selected_obj = that.data.imgObj.selected_obj;
			
			scroll_info.isScroll_top = false;
			scroll_info.isScroll_end = false;
			scroll_info.isScroll = false;
			image_arr = [];
			image_obj = {};
			selected_obj = {};

			
		},
		
		getTaskById : function(id){
			let that = task_list;
			
			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/getTaskById.json",
				data : { task_id : id },
				type : "POST",
				success : function(res) {
					$("#loader").hide();
					console.log("=====getTaskById=====", res);
					if (res.result.code == "200") {	
						that.drawTaskName(res.result.data);			
						that.data.labelType = res.result.data.label_type;
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}
					
				},
				error : function(err) {
					$("#loader").hide();
					console.log("getTaskById ERROR!!", err);
				}
			});
		},
		
		drawTaskName : function(data){
			let that = task_list;
			
			let taskName_data = data;
			let target_title = $("#task_list").find(".task_name");
			let select_task_name = "( Selected Task : " + taskName_data.title + " )";
			$(target_title).html(select_task_name);
			console.log("taskName_data : ", taskName_data);

		},
		
		modifyInferenceResultData : function(arr){
			let that = task_list;
			that.resetImageScroll();
			var image_arr = that.data.imgObj.image_arr;
			var image_obj = that.data.imgObj.image_obj;
			
			//test
// 			var arr = []
// 			for(i=0; i<200; i++){
// 				arr.push({img_path: "dataset/sabana3_0_1550109604558.jpg", x: i, y: i, w:i, h :i, label : i})
// 			}
			//test
			
			if(arr.length > 0){
				that.pt.find(".meta_btn").show();
			}
			
			for(let i = 0, len = arr.length; i<len; i++){
				let id = arr[i].img_path +","+ arr[i].x +","+ arr[i].y +","+ arr[i].w +","+ arr[i].h +","+ arr[i].label;
				if(image_obj[id] == undefined){
					image_arr.push(arr[i]);	
					image_obj[id] = arr[i];
				}
			}

			that.pt.find(".main_wrap .list_total").text("Total " + image_arr.length);
			that.initInferenceResult();
		},
		

		initInferenceResult : function(){
			let that = task_list;
			var image_arr = that.data.imgObj.image_arr;
			
			that.pt.find(".main_wrap .table_body table tbody").html("");		
			let scroll_info = that.data.inferenceScrollObj;
			
			scroll_info.scroll_start = 0;
			scroll_info.scroll_end = (scroll_info.default_size < image_arr.length ) ? scroll_info.default_size : image_arr.length;
			that.drawResultList("init",scroll_info.scroll_start,scroll_info.scroll_end);
			if(image_arr.length > scroll_info.default_size) {
				scroll_info.isScroll_top = true;
				that.resultScrollListener();
			}
		},
		
		drawResultList : function(type,start,end){
			let that = task_list;
			var scroll_info = that.data.inferenceScrollObj;
			var label_type = that.data.labelType;			// jh.sa 201028 
			var image_arr = that.data.imgObj.image_arr;
			var selected_obj = that.data.imgObj.selected_obj;
			var target = that.pt.find(".main_wrap .table_body table tbody");
			var html = "";
			var i = 0;
			var id = "";
			/* for (i = start ; i < end ; i++) { */
			for (i = 0 ; i < image_arr.length ; i++) {
				let data = image_arr[i];
				if(data.segmentation != null) {
					data.segmentation = data.segmentation.replace(/x/gi, '"x"');
					data.segmentation = data.segmentation.replace(/y/gi, '"y"');
				}

				id = data.img_path +","+ data.x +","+ data.y +","+ data.w +","+ data.h +","+ data.label+","+data.segmentation;
			
				html += " <tr data-id='"+id+"'> ";
// 				if(selected_obj[id] != undefined){
// 					html += "   <td><div class='checkBox selected'></div></td>";	
// 				} else {
// 					html += "   <td><div class='checkBox'></div></td>";
// 				}
				
				html += "   <td class='preview'>";
				if(label_type == "IMAGE_BBOX" || label_type == "IMAGE_SEGMENTATION"){
					html += "   	<div class='img_preview'>";
					html += "       	<div class='show_img'></div>";
					html += "       	<div class='normal_img_wrap'>";
					html += "   			<div class='inner_title_wrap flex'>";
					html += "   				<div class='image'></div>";
					html += "   				<span class='title'></span>";
					html += "   			</div>";
					html += "   			<div class='frame_container'>";
					html += "   			</div>";
					html += "   		</div>";
					html += "   	</div>";				
					that.pt.find("th.pre").html("PREVIEW");
				} else if(label_type == "VIDEO_BBOX"){
					that.pt.find("th.pre").html("");
				}
				html += "   </td>";
				html += " 	<td>" + data["img_path"] + "</td> ";
				if(data.h != "-") { 
					html += " 	<td>" + data["x"] + "</td> ";
				} else if(data.h == "-") {
					html += " 	<td>" + "-" + "</td> ";
				}
				html += " 	<td>" + data["y"] + "</td> ";
				html += " 	<td>" + data["w"] + "</td> ";
				html += " 	<td>" + data["h"] + "</td> ";
				html += " 	<td>" + data["label"] + "</td>";
				html += " </tr>";
				
			}
			scroll_info.isScroll = false;

			if(type == "down" || type == "init"){
				target.append(html);	
			} else {
				target.prepend(html);
			}
			that.resultListener();

		},
		
		resultScrollListener : function(){
			let that = task_list;	
			
			that.pt.find(".main_wrap .table_body").off("scroll").on("scroll",function(){
				var scroll_info = that.data.inferenceScrollObj;
				var image_arr = that.data.imgObj.image_arr;
				var target = $(this);
				
				var st = target.scrollTop();
				var box_size = that.pt.find(".main_wrap tbody tr").length;

				if(st + target.innerHeight() >= target[0].scrollHeight && !scroll_info.isScroll && !scroll_info.isScroll_end){
					scroll_info.isScroll = true;
					
					var diff = 0;
					if(scroll_info.scroll_end + scroll_info.half_size >= image_arr.length){
						diff = image_arr.length - scroll_info.scroll_end;
						scroll_info.scroll_end = image_arr.length;
						scroll_info.scroll_start = scroll_info.scroll_start + diff;
						scroll_info.isScroll_end = true;
						
					}else{
						diff = scroll_info.half_size;
						scroll_info.scroll_end = scroll_info.scroll_end + diff;
						scroll_info.scroll_start = scroll_info.scroll_start + diff;
					}
					var end = scroll_info.scroll_end;
					var start = end - diff;
					
					that.drawResultList("down",start,end);
					that.removeImageBox(diff,"down");	
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
					
					
					that.drawResultList("up",start,end);
					that.removeImageBox(diff,"up");	
					scroll_info.isScroll_end = false;
							
				}
			});
		},
		
		removeImageBox : function(size,type){
			let that = task_list;
			
			if(size == 0){ return; }

			if(type == "down"){
				that.pt.find(".main_wrap tbody tr").slice(0,size).remove();					
			} else {		
				that.pt.find(".main_wrap tbody tr").slice(-size).remove();
			}
			that.pt.find(".main_wrap .table_body").scrollTop((that.pt.find(".main_wrap .table_body")[0].scrollHeight - that.pt.find(".main_wrap .table_body").height()) / 2);
		},
		
		
		resultListener : function() {
			let that = task_list;
			
			that.pt.find(".main_wrap thead tr .checkBox").off("click").on("click",function(){
				var image_arr = that.data.imgObj.image_arr;
				var selected_obj = that.data.imgObj.selected_obj;
				$(this).toggleClass("selected");
				if($(this).hasClass("selected")){
					for(let i = 0, len = image_arr.length; i<len; i++){
						let data = image_arr[i];
						let id = data.img_path +","+ data.x +","+ data.y +","+ data.w +","+ data.h +","+ data.label + ","+ data.segmentation;
// 						console.log("data.segmentation : " + data.segmentation);
						if(selected_obj[id] == undefined){
							selected_obj[id] = id;	
						}
					}
					that.pt.find(".main_wrap tbody tr .checkBox").addClass("selected");
				} else {
					selected_obj = {};
					that.pt.find(".main_wrap tbody tr .checkBox").removeClass("selected");
					
				}
			});
			
			that.pt.find(".main_wrap tbody tr .checkBox").off("click").on("click",function(){
				var image_arr = that.data.imgObj.image_arr;
				var selected_obj = that.data.imgObj.selected_obj;
				let id = $(this).parent().parent().data("id");		
				
				$(this).toggleClass("selected");
				if($(this).hasClass("selected")){
					if(selected_obj[id] == undefined){
						selected_obj[id] = id;
					}
					if(Object.keys(selected_obj).length == image_arr.length){
						that.pt.find(".main_wrap thead tr .checkBox").addClass("selected");
					}
				} else {
					delete selected_obj[id];
					that.pt.find(".main_wrap thead tr .checkBox").removeClass("selected");
				}
			});
			
			that.pt.find(".main_wrap table tbody td ").off("mouseenter").on("mouseenter",function(){
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
			
			that.pt.find(".main_wrap table tbody td ").off("mouseleave").on("mouseleave",function(){
				let td = $(this);
				td.find(".hover_box").remove();
			});

			that.pt.find(".anno_table tbody tr .img_preview").off("mouseenter").on("mouseenter",function(){
				var canvas_hover = that.data.canvasHover;
				let show_img = $(this).children(".show_img");
				
				let x = $(this).offset().left + $(this).outerWidth() + 10;
		        let y = $(this).offset().top + $(this).outerHeight() - 59;
				
		        
				show_img.css({"top":y+"px", "left":x+"px","position": "fixed","display": "flex"});
				let tr = $(this).parent().parent().children();
				showLoading(".show_img");
				
				let imgObj = new Image();
				
				//console.log("tr[1].innerHTML::", tr[1].innerHTML);
				imgObj.src = "/uploadFile/xlabeller/" + tr[1].innerHTML; 
	 			
 				imgObj.onload = function(){
 					that.data.canvasHover = document.createElement('canvas');
					show_img.html(that.data.canvasHover);
					that.crop(imgObj, tr[2].innerHTML, tr[3].innerHTML, tr[4].innerHTML, tr[5].innerHTML);	
				} 
				
				imgObj.onerror = function(){
					hideLoading(".show_img");
				}
			});
			
			that.pt.find(".anno_table tbody tr .img_preview").off("mouseleave").on("mouseleave",function(){
				let show_img = $(this).children(".show_img");
				let normal_img = $(this).children(".normal_img_wrap");
				show_img.css("display","none");
				$(this).removeClass("selected");
			});
			
			that.pt.find(".anno_table tbody tr .img_preview").off("click").on("click",function(){
				let normal_img = $(this).children(".normal_img_wrap");
				var canvas = that.data.canvas;			// jh.sa 210208
				
				if(normal_img.parent().hasClass("selected")){
					normal_img.parent().toggleClass("selected");	
				} else {
					that.pt.find("tbody tr .img_preview").removeClass("selected");
					normal_img.parent().toggleClass("selected");
				}

				let x = $(this).offset().left + $(this).outerWidth() + 10;
		        let y = $(this).offset().top + $(this).outerHeight() - 141;
	        
		        normal_img.css({"top":y+"px", "left":x+"px","position": "fixed"});
				let tr = $(this).parent().parent().children();
				console.log("tr::", tr);
				let cur_index = $(this).parent().parent().index();
				tr.find(".inner_title_wrap .title").empty();
				tr.find(".inner_title_wrap .title").text(tr[6].innerHTML);
				

				let cur_id = ""+tr[1].innerHTML + tr[2].innerHTML +tr[3].innerHTML + tr[4].innerHTML + tr[5].innerHTML + tr[6].innerHTML;
				canvas = null;
				$(this).children().children(".frame_container").empty();
				$(this).children().children(".frame_container").append("<canvas id="+"'"+cur_index+"c' width='270px' height='182px'>");
				that.data.canvas = new fabric.Canvas(cur_index+"c");
				that.data.canvas.selection = false;
				
				let imgObj = new Image();
				imgObj.src = "/uploadFile/xlabeller/" + tr[1].innerHTML; 
				showLoading(tr.children().children(".normal_img_wrap"));
				
				imgObj.onload = function(){					
					that.rescale(this);
					
					that.data.canvas.setBackgroundImage(imgObj.src, that.data.canvas.renderAll.bind(that.data.canvas), {
// 				          backgroundImageOpacity: 0.5,
// 				          backgroundImageStretch: true,
// 				          width: canvas.width,
// 				          height: canvas.height	
						  scaleX : scaleFactor,
						  scaleY : scaleFactor
				    });
					
					that.clearCanvas();
					that.setSingleMeta(cur_id, tr[6].innerHTML, tr[2].innerHTML, tr[3].innerHTML, tr[4].innerHTML, tr[5].innerHTML);
					that.updateRedraw();
					hideLoading(tr.children().children(".normal_img_wrap"));
				}
				
				imgObj.onerror = function(){
					hideLoading(tr.children().children(".normal_img_wrap"));
				}
				
				
			});

		},
		
		rescale : function(img){
			var that = task_list;
			let canvas = that.data.canvas;
			console.log("canvas::", canvas);
        	var canvas_max_width = 270;
            var canvas_max_height = 182;
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
    	
    	updateRedraw : function(){
    		var that = task_list;
			let canvas = that.data.canvas;
			var rect = new fabric.Rect(labelMap);	
			canvas.add(rect);
			
        },
        
        clearCanvas : function(){
        	var that = task_list;
			let canvas = that.data.canvas;
        	$("#label-container").empty();
        	//캔버스에 존재하는 오브젝트 모두 삭제
        	var canvObjLen = canvas.getObjects().length;
        	for(var i = 0 ; i < canvObjLen; i++){
        		canvas.remove(canvas.getObjects()[0]);
        	}
        },
        
        setSingleMeta : function(id,label,x,y,w,h){
        	let that = task_list;
        	var colorHash = that.data.colorHash;		// jh.sa 210208
			let fillColor = colorHash.rgb(label);
			
			let xx = w - x;
			let yy = h - y;

			labelMap = {
					id: id,
					label: label,
					left: x*1*scaleFactor,
					top: y*1*scaleFactor,
					width: xx*1*scaleFactor,
					height: yy*1*scaleFactor,
					lockMovementX : true,
					lockMovementY : true,
					lockScalingX : true,
					lockScalingY : true,
					lockRotation : true,
					angle: 0,
					fill: "rgba("+fillColor[0]+","+fillColor[1]+","+fillColor[2]+",0.5)"
			}
        },
		
		crop : function(imgObj, xx, yy, xxx, yyy){
			let that = task_list;
			console.log("that.data.canvasHover::", that.data.canvasHover);
			var canvas_hover = that.data.canvasHover;		// jh.sa 210208
			var ctx = canvas_hover.getContext("2d");

			hideLoading(".show_img");
				

			var ww = xxx - xx;
			var hh = yyy - yy;
			
			var w = ww;
	    	var h = hh;
	    		
	    	var dw = 0;
	    	var dh = 0;
	    		
	    	var g_w = 105;
	    	var g_h = 80;
	    	
	    	var fw = w/g_w;
	    	var fh = h/g_h;
	    	
	    	if(fw >= fh){
	    		dw = w / fw;
	    		dh = h / fw;
	    	}else{
	    		dw = w / fh;
	    		dh = h / fh;
	    	}
	    	canvas_hover.width = dw;
	    	canvas_hover.height = dh;

			ctx.clearRect(0, 0, canvas_hover.width, canvas_hover.height);
			ctx.drawImage(imgObj, xx, yy, ww, hh,0,0, dw,dh);
        },
		
		getIfData : function(){
			let that = task_list;
			var json_arr = [];
			var selected_obj = that.data.imgObj.selected_obj;
			var search_obj = that.data.searchObj.search_obj;
			var dataset_id = that.data.datasetId;		// jh.sa 210208
			var keys = Object.keys(selected_obj);
			for(let i = 0, len = keys.length; i<len; i++){
				json_arr.push(selected_obj[keys[i]]);
			}
			
 			let file_keys = Object.keys(search_obj);
			/* that.getInferenceResult(search_obj[keys[0]]);  */
			/* console.log("file_name::" + search_obj[file_keys[0]]); */
			
			
			if(json_arr.length <= 0){
				alert("선택된 데이터가 없습니다");
				return;
			}
			
			if(dataset_id == ""){
				alert("사용 가능한 데이터가 없습니다");
				return;
			}
			
			let selected_inference_result_name = $("#trainer").find(".table_body .anno_table tbody tr").find(".td_wrap .selected").next(".file_name").text();
			/* $("#loader").show(); */
			that.ajaxCall(JSON.stringify(json_arr), selected_inference_result_name);	
		},
		
		ajaxCall : function(data, file_name){
			let that = task_list;
			var dataset_id = that.data.datasetId;		// jh.sa 210208
			console.log("fileName::", file_name);
			console.log("data::", data);
			console.log("file_name::", file_name);
			ajaxData = {
				info : data,
				dataset_id : dataset_id,
				task_id : that.data.taskId,
				path : file_name
			};
			alert("데이터의 크기에 따라 작업시간이 오래 소요될 수 있습니다.\n잠시만 기다려주세요.");
			$("#loader").show();
			$.ajax({
				url : baseUrl + "/data/insertMetaByInference.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("===insertMetaByInference===", res);
					if (res.result.code == "200") {
						alert(res.result.data);
						that.resetView();
						trainer.hideView();
						trainer.main(); 
						$("#loader").hide();
					}  else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
						$("#loader").hide();
					} else {
						alert(res.result.data);
						$("#loader").hide();
					}
					/* $("#loader").hide(); */
				},

				error : function(err) {
					$("#loader").hide();
					console.log("ERROR!!", err);
				}
			});
		},
		
		getInferenceStatus : function(){
			let that = task_list;
			var task_id = that.data.taskId;				// jh.sa 210208
			var status_interval = that.data.statusInterval;		// jh.sa 210208
			var list_class = trainer.pt.find(".section_wrap .task_list");
			
			if(!list_class.hasClass("selected")){
				clearInterval(status_interval);
				return;
			}
			
			let ajaxData = {
				task_id : task_id
			};
			
			$.ajax({
				url : baseUrl + "task/getInferenceStatus.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("===getInferenceStatus===", res);
					if (res.result.code == "200") {
						that.drawInferenceStatus(res.result.data);			// 1초마다 반복되게 설정
					}  else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					}
					
					//alert(res.result.data);
					/* $("#loader").hide(); */
				},

				error : function(err) {
					//$("#loader").hide();
					console.log("getInferenceStatus ERROR!!", err);
				}
			})
		},
		
		drawInferenceStatus : function(data) {
			let that = task_list;
			let status_data = data;
			let status_btn = $("#task_list").find("#status");		
			
			if(status_data == true) {
				status_btn.removeClass();
				status_btn.addClass("status_on");
			} else if(status_data == false) {
				status_btn.removeClass();
				status_btn.addClass("status_off");
			} else {
				status_btn.removeClass();
				status_btn.addClass("status_normal");
			};
			
		}

	
	}
	

</script>
