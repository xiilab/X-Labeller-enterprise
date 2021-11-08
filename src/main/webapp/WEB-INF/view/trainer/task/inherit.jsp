<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>

<title>X-labeller</title>

<style>

/* 공통 */
#task_inherit {height: 100%; width: 100%;}
#task_inherit .ms_wrap {width: 100%; margin-top: 23px;}
#task_inherit  .table_body{max-height: calc(100% - 194px); overflow-y: overlay; overflow-x:hidden;}

#task_inherit .hover_box {border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
#task_inherit .hover_box div {font-family: Open_Sans; font-size: 13px; color: #555555;}
#task_inherit .hover_div div {word-break: break-word; margin: 2px 5px; white-space: normal; font-weight: 300; font-family: Open_Sans;}
#task_inherit .hover_div {max-width: 264px; text-align: left; position: relative; }
#task_inherit .hover_box {max-width: 264px; text-align: left; }

/* 메인 */

#task_inherit .main_wrap {width: 60%; height: 100%; position:relative;}
#task_inherit .main_title {display: block; font-family: Open_Sans; font-size: 12px;font-weight: 400; color: #343434;}
#task_inherit .detail_title {margin-top : 20px; display: block; font-family: Open_Sans; font-size: 20px; color: #343434;}
#task_inherit .detail_contents {margin-top : 8px; display: block; font-family: Open_Sans; font-size: 12px; color: #797a7c; width: 720px;}
#task_inherit .anno_wrap > input { width: 900px; border-width: 0; padding: 0; font-weight: 300;}

#task_inherit .main_wrap .horizontal_line {width: 100%; height: 1px; background-color: #e7e7e7; margin: 10px 0 0 0; display:block;}
#task_inherit .main_wrap .horizontal_line.top {width: 100%; height: 1px; background-color: #e7e7e7; margin: 24px 0 0 -30px; display:block; position: absolute; }

#task_inherit .main_wrap .list_wrap {height: calc(100% - 157px); position: relative;}

#task_inherit .main_wrap .list_wrap span {margin: 22px 0 24px; float: left; font-family: Open_Sans;font-size: 14px;font-weight: 400; color: #343434;}
#task_inherit .main_wrap .list_wrap .list_total {float: right; }

#task_inherit select { height: 36px; width: 304px; border: 0; border-bottom: 1px solid #dedcde; font: 400 11px system-ui; background: url("${pageContext.request.contextPath}/resources/images/select_arrow.png") #fff no-repeat 97% 50% / 10px; }
#task_inherit select:focus { outline: none; }
#task_inherit .select_project_wrap { position: relative; left: -1.5%; top: 13px; }
/* 서브 */


#task_inherit .sub_wrap {width: 40%; height: 100%; background-color: #f5f5f5; overflow: overlay; position:relative;}
#task_inherit .sub_title { display: inline-block; font-family: Open_Sans; font-size: 12px;color: #343434; font-weight:400;}

#task_inherit .sub_wrap .margin {margin: 0 43px;}

#task_inherit .sub_wrap .box_wrap {margin-top: 17px; margin-bottom: 17px; padding: 15px; }
#task_inherit .sub_wrap .box_wrap.border { border: 1px solid #dedcde; }
#task_inherit .sub_wrap .box_wrap .input_wrap {margin-bottom: 12px;}
/* #task_inherit .sub_wrap .box_wrap .input_wrap:nth-child(6) {margin-bottom : 17px;}
#task_inherit .sub_wrap .box_wrap .input_wrap:nth-child(7) {margin-bottom : 29px;} */
#task_inherit .sub_wrap .box_wrap .input_wrap > label {margin-right: 27px; float: left; width: 180px; font-family: Open_Sans; font-size: 12px;  color: #343434; font-weight: 300;}
#task_inherit .sub_wrap .box_wrap .input_wrap > input {border-radius:2px; width: calc(100% - 172px); height: 32px; background-color: #ffffff; padding: 0 11px ; font-family: Open_Sans;  font-weight: 300; border: 1px solid #dedcde;}
#task_inherit .sub_wrap .box_wrap .input_wrap.backbone input {background-color: #f9f9f9; color: #999999;}
#task_inherit .sub_wrap .box_wrap .input_wrap.gpu input {background-color: #f9f9f9; color: #999999;}
#task_inherit .sub_wrap .check_box_wrap {width:calc(100% - 148px);}
#task_inherit .sub_wrap .check_box_wrap .check_box > label {font-family: Open_Sans;font-size: 13px;font-weight: 300; color: #616263; margin-left: 19px; }
#task_inherit .sub_wrap .check_box_wrap .check_box:last-child { margin-bottom: 0; }
#task_inherit .sub_wrap .check_box_wrap .check_box {margin-bottom: 15px;}

#task_inherit .sub_wrap .description_wrap { margin: 17px 0; padding: 15px; }
#task_inherit .sub_wrap .description_wrap.border { border: 1px solid #dedcde; }
#task_inherit .sub_wrap .description_wrap .description { font: 400 12px system-ui; }


#task_inherit .sub_wrap .box_wrap .input_wrap.light input:focus {border: 1px solid #4c84ff;}

#task_inherit .sub_wrap .btn_wrap {text-align: center; margin-bottom: 103px;}
#task_inherit .sub_wrap .btn_wrap .submit_btn {width: 280px; height: 40px; font-weight: 300; border: 0; }

#task_inherit .sub_wrap .defaultBtn {display:inline-block; width: 14px; height: 14px; background-color: #f5f5f5;}
#task_inherit .sub_wrap .defaultBtn.selected {background: url("./images/icon_comparison_check.png") no-repeat center;}

#task_inherit .empty_wrap {text-align: center; margin-top: 170px; }
#task_inherit .empty_wrap .no_image {margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; }
#task_inherit .empty_wrap .eng_text {font-family: Open_Sans; margin-bottom: 3px; font-size: 16px; font-weight: 300; color: #777777;}
#task_inherit .empty_wrap .kor_text {font-family: Open_Sans; font-size: 12px; color: #777777; font-weight: 200; margin-bottom: 120px; }
#task_inherit .no_image {height: 37px; background-image: url('./images/icon_nodata_list.png'); }

#task_inherit input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button { -webkit-appearance: none; margin: 0; }

#task_inherit .algorithm_list { width: 100%; height: 34px; margin-top: 10px; background-color: #f8f8f8; border-radius: 4px; border: 1px solid #d9d9d9; outline: none; color: #797a7c; }

#task_inherit [data-tooltip-text]:hover { position: relative; cursor: pointer; }
#task_inherit [data-tooltip-text]:after { 	
	-webkit-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	-moz-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	transition: bottom .3s ease-in-out, opacity .3s ease-in-out;

	background-color: rgba(0, 0, 0, 0.6);

  	-webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	
 	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	
  	color: #FFFFFF;
	font-size: 12px;
	margin-bottom: 10px;
	padding: 7px 12px;
	position: absolute;
	width: auto;
	min-width: 373px;
	max-width: 1000px;
	word-wrap: break-word;

	z-index: 9999;

	opacity: 0;
	left: -9999px;
  	top: 90%;
	
	content: attr(data-tooltip-text); }
#task_inherit [data-tooltip-text]:hover:after { top: -41.3%; left: 165px; opacity: 1; }
#task_inherit .tooltip_span:hover { min-width: 800px; display: inline; z-index: 999; }
#task_inherit .tooltip_span { width: 17px; height: 17px; }
#task_inherit .tooltip_wrap { width: 17px; height: 17px; display: inline-block; cursor: pointer; margin: 0 5px; position: relative; top: 4px; background: url("${pageContext.request.contextPath}/resources/images/btn_help_nor.png") no-repeat; }
#task_inherit .tooltip { width: 354px; padding: 10px 12px 10px 12px; color: #fff; background-color: rgba(0, 0, 0, 0.6); -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; font: 400 12px system-ui; position: absolute; z-index: 9999; left: 36.5%; padding-left: 12px; visibility: hidden; opacity: 0; transition: visibility 0s, opacity 0.3s ease; }
#task_inherit .tooltip.on { width: 354px; padding: 10px 12px 10px 12px; color: #fff; background-color: rgba(0, 0, 0, 0.6); -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; font: 400 12px system-ui; position: absolute; z-index: 9999; left: 36.5%; padding-left: 12px; visibility: visible; opacity: 1; transition: visibility 0s, opacity 0.3s ease; }

#task_inherit .algorithm_name { font: 400 11px system-ui !important; color: #777 !important; }

#task_inherit .sub_wrap .checkBtn { display:inline-block; width: 16px; height: 16px; background: url("${pageContext.request.contextPath}/resources/images/icon_gpu_check.png") no-repeat center; }
#task_inherit .sub_wrap .list_wrap {height: calc(100% - 149px); position: relative; width: 100%; }
#task_inherit .sub_wrap table.checkpoint_table th { border-top: 2px #3a3b3d solid; background-color: #fafafa; height: 44px; font-size: 11px; font-weight: 400; color: #333333; }
#task_inherit .sub_wrap table.checkpoint_table th, table.checkpoint_table tr, table.checkpoint_table td { text-align: center; border-bottom: 1px solid #e5e5e5; border-collapse: collapse; border-spacing: 0; }
#task_inherit .sub_wrap .table_body table.checkpoint_table { font-family: Open_Sans; font-size: 12px; color: #343434; font-weight: 300; border-collapse: collapse; width: 100%; }
#task_inherit .sub_wrap .table_body table.checkpoint_table tr:hover { background-color: #f4fcfe; }
#task_inherit .sub_wrap .table_body table.checkpoint_table td { padding-top: 3px; padding-bottom: 3px; }
#task_inherit .sub_wrap .table_header table.checkpoint_table { margin-top: 15px; border-collapse: collapse; width: 100%; }
/* #task_inherit .sub_wrap .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
#task_inherit .sub_wrap .table_body {max-height: 340px; overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; }
#task_inherit .sub_wrap table td { height: 48px; }
#task_inherit .sub_wrap .radioBtn { margin-left: 5px; }
</style>

</head>
<body>

	<div class="container" id="task_inherit">

		<div class="contents flex">
			<div class="main_wrap">
				<div class="title_wrap ms">
					<div class="ms_wrap">
						<span class="main_title">Create Inherited Task</span>

<!-- 						<div class="horizontal_line top"></div>						 -->
						<div class="flex">						
							<div class="anno_wrap">
								<span class="select_project_wrap">
									<select id="project_result" class="project_result" name="project_result">
	
									</select>	
								</span> 
								<input class="detail_title" data-length="100" placeholder="Please enter the title" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">

								<input class="detail_contents" data-length="200" placeholder="Please enter the description">
							</div>

						</div>
					</div>
				</div>

				<div class="horizontal_line"></div>

				<div class="list_wrap ms filter_color">
					<span class="list_title">Annotation List</span>
					<span class="list_total">Total 0</span>
					<div class="table_header">
						<table class="anno_table">
							<colgroup>
								<col style="width: 61px;"></col>
								<col style="width: 61px;"></col>
								<col style="width: 61px;"></col>
								<col style="width: 130px;"></col>
								<col style=""></col>
								<col style="width: 130px;"></col>
							</colgroup>
							<thead>
								<tr>
									<th></th>
									<th>No.</th>
									<th>USER_ID</th>
									<th>TITLE</th>
									<th>CONTENTS</th>
									<th>CREATED_DATE</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table_body">
						<table class="anno_table">
							<colgroup>
								<col style="width: 61px;"></col>
								<col style="width: 61px;"></col>
								<col style="width: 61px;"></col>
								<col style="width: 130px;"></col>
								<col style=""></col>
								<col style="width: 130px;"></col>
							</colgroup>
							<tbody></tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="sub_wrap">
				<div class="margin">
					<div class="ms_wrap filter_color">
						<span class="sub_title">Training Config</span>
						<span class="algorithm_name"></span>
						<div class="description_wrap">
						
						</div>						
						<div class="box_wrap">

						</div>
                        <div class="list_wrap">
                            <div class="table_header">
                                <table class="checkpoint_table">
                                    <colgroup>
                                        <col style="width:15px;"></col>                                    
                                        <col style="width:200px;"></col>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th><div class="checkBtn"></div></th>                                        
                                            <th>MODEL</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                            <div class="table_body">
                                <table class="checkpoint_table">
                                    <colgroup>
                                        <col style="width:15px;"></col>                                    
                                        <col style="width:200px;"></col>
                                    </colgroup>
                                    <tbody>
<!--                                     <tr><td colspan='4' align='center'>Loading GPU list...</td></tr> -->
                                    </tbody>
                                </table>
                            </div>
                        </div>							
						<div class="btn_wrap">
							<button class="submit_btn">Save</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>



<script>
	$(document).on("sessionLoad", function() {

	});

// 	var parent_id;						// jh.sa 210208 parent_id (삭제) => that.data.inheritId
// 	var inherit_id;						// jh.sa 210208 inherit_id => that.data.inheritId
// 	var current_node;					// jh.sa 210208 current_node => that.data.currentNode
	
	//스크롤에 사용할것
	
// 	var annotation_arr = [];			// jh.sa 210208 annotation_arr => that.data.annotationArr
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
	
	var task_inherit = {
		pt : $("#task_inherit"),
		data : {
			inheritId : null,
			currentNode : null,
			annotationArr : [],
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
		},
		init : function(node, id) {
			let that = this;
// 			parent_id = node.id;
// 			inherit_id = id;
// 			current_node = node;
			that.data.inheritId = id;
			that.data.currentNode = node;
			console.log("current_node: :::", that.data.currentNode);
			that.resetView();
			that.getProjectList();
			that.getTaskById();
			that.getCheckPointList();
			//that.defaultListener();
		},
		
		addEmptyData : function(elem, data1, data2){
			let that = this;
			elem.append("<div class='empty_wrap'><div class='no_image'></div><div class='eng_text'>"+data1+"</div><div class='kor_text'>"+data2+"</div></div>")
		},
		
		removeEmptyData : function(elem){
			let that = this;
			elem.find(".empty_wrap").remove();
		},

		resetView : function() {
			let that = this;
			that.pt.find(".empty_wrap").remove();
			that.pt.find(':input').val("");
/* 			that.pt.find("input[name=first]").val("1000")
			that.pt.find("input[name=second]").val("20")
			that.pt.find("input[name=third]").val("800")
			that.pt.find("input[name=fourth]").val("1333")
			that.pt.find("input[name=fifth]").val("resnet50")
			that.pt.find("input[name=sixth]").val("0")
			that.pt.find(".checkBox.first").addClass("selected");
			that.pt.find(".checkBox.second").addClass("selected"); */
			that.pt.find(".sub_wrap .box_wrap").html("");
			that.pt.find(".sub_wrap .box_wrap").removeClass("border");
			that.pt.find(".sub_wrap .description_wrap").html("");
			that.pt.find(".sub_wrap .description_wrap").removeClass("border");
			that.pt.find(".check_box_wrap").html("");
			that.pt.find(".table_body tbody").html("");
			that.pt.find(".list_total").text("Total 0");
			that.pt.find(".table_body").scrollTop(0);
			that.addEmptyData(that.pt.find(".sub_wrap .list_wrap"), "No Model", "please train your task first");
			/* that.getAnnotationList(); */
// 			that.getAlgorithmList();
		},
		
		defaultListener : function(){
			
			let that = this;
			
			let check_first = that.pt.find(".checkBox");
// 			console.log("check_first:", check_first);
			let check_second = that.pt.find(".checkBox.second");

			check_first.off("click").on("click", function() {
				$(this).toggleClass("selected");
			});

			check_second.off("click").on("click", function() {
				$(this).toggleClass("selected");
			});

			let select_box = $("#task_inherit").find(".project_result")
			
			select_box.change(function(){
				var selected_project_id = $(select_box).find("option:selected").data("id");
				console.log("Selected project_id : ", selected_project_id);				
			})			
		},
		
		getTaskById : function() {
			let that = this;
			var inherit_id = that.data.inheritId;
			var ajaxData = {
				task_id : inherit_id
			}

			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/getTaskById.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					$("#loader").hide();
					console.log("=====getTaskById=====", res);
					if (res.result.code == "200") {	
// 						that.drawTaskResult(res.result.data);			
						that.getAlgorithmById(res.result.data);
						that.getAnnotationList(res.result.data);
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}
					
// 					hideLoading("#task_detail .list_wrap");
				},
				error : function(err) {
					$("#loader").hide();
					console.log("getTaskById ERROR!!", err);
				}
			});

		},
		getAnnotationList : function(data) {
			let that = this;
			let ajaxData = {
					label_type : data["label_type"]
			};
			$("#loader").show();
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
					hideLoading("#task_inherit .list_wrap");
				},
				error : function(err) {
					$("#loader").hide();
					console.log("ERROR!!", err);
				}
			});
		},
		
		resetAnnotationListData : function(){
			var that = task_inherit;
			var scroll_info = that.data.scrollObj;	
			var annotation_arr = that.data.annotationArr;
			var radio_obj = that.data.radioObj;
			scroll_info.isScroll_top = false;
			scroll_info.isScroll_end = false;
			scroll_info.isScroll = false;
			annotation_arr = [];
			radio_obj = {};
		},
		
		modifyAnnotationListData : function(data){
			var that = task_inherit;
			var annotation_arr = that.data.annotationArr;
			
			that.resetAnnotationListData();
			
			//test 
// 			for(let y=0; y<400; y++){
// 				for(let i=0, len = data.length; i<len; i++){
// 					annotation_arr.push(data[i]);
// 				} 
// 			}

			if(data.length == 0){
				that.pt.find(".submit_btn").hide();
				that.addEmptyData(that.pt.find(".main_wrap .list_wrap"), "No Annotation", "please add annotation");
			} else {
				that.pt.find(".submit_btn").show();
			}	
			
			for(let i=0, len = data.length; i<len; i++){
				annotation_arr.push(data[i]);
			} 
			
			that.pt.find(".list_total").text("Total " + annotation_arr.length);
			that.initAnnotationList();
		},
		
		initAnnotationList : function(){
			let that = this;
			that.pt.find(".main_wrap .table_body table tbody").html("");
			var annotation_arr = that.data.annotationArr;
			var scroll_info = that.data.scrollObj;
			
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
			let target = that.pt.find(".main_wrap .table_body table tbody");
			var scroll_info = that.data.scrollObj;
			var annotation_arr = that.data.annotationArr;
			var radio_obj = that.data.radioObj;
			let html = "";
			let i = 0;
			for (i = start ; i < end ; i++) {
				let data = annotation_arr[i];
				html += " <tr data-id='"+data["id"]+"'> ";
				if(radio_obj[data.id] != undefined){
					html += "   <td><div class='radioBtn selected'></div></td>";	
				} else {
					html += "   <td><div class='radioBtn'></div></td>";
				}
				html += " 	<td>" + (i + 1) + "</td> ";
				html += " 	<td>" + data["user_id"] + "</td> ";
				html += " 	<td class='title'>" + data["title"] + "</td> ";
				html += " 	<td>" + data["contents"] + "</td> ";
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
			
			that.pt.find(".main_wrap .table_body").off("scroll").on("scroll",function(){
				var scroll_info = that.data.scrollObj;
				var annotation_arr = that.data.annotationArr;
				var target = $(this);
				
				let st = target.scrollTop();
				let box_size = that.pt.find(".main_wrap tbody tr").length;

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
					
					
					that.drawAnnotationList("up",start,end);
					that.removeBox(diff,"up");	
					scroll_info.isScroll_end = false;
							
				}
			});
		},
		
		removeBox : function(size,type){
			let that = this;

			if(size == 0){ return; }
			
			if(type == "down"){
				that.pt.find(".main_wrap tbody tr").slice(0,size).remove();					
			} else {		
				that.pt.find(".main_wrap tbody tr").slice(-size).remove();
			}
			that.pt.find(".main_wrap .table_body").scrollTop((that.pt.find(".main_wrap .table_body")[0].scrollHeight - that.pt.find(".main_wrap .table_body").height()) / 2);
		},

		annotationListener : function() {
			let that = this;

			let row_click = that.pt.find(".main_wrap table tbody tr")

			row_click.off("click").on("click",function() {
				let tr = $(this);
// 				var radio_obj = that.data.radioObj;
				that.data.radioObj = {};
				let btn = tr.children().children(".radioBtn");
				let id = tr.data("id");
				that.data.radioObj[id] = id;
				btn.toggleClass("selected");
				if(btn.hasClass("selected")){
					that.pt.find(".main_wrap table tbody tr .radioBtn").removeClass("selected");
					btn.addClass("selected");
					that.data.radioObj[id] = id;
				} else {
					that.data.radioObj = {};
				}
			});
			
			that.pt.find(".main_wrap table tbody td").off("mouseenter").on("mouseenter",function(){
				let text = $(this)[0].innerText;
				if(text == "") {return;}	
				$(this).empty();
				$(this).append(text);
				that.addHoverBox($(this), text);
			});
			
			that.pt.find(".main_wrap table tbody td").off("mouseleave").on("mouseleave",function(){
				that.removeHoverBox($(this));
			});
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
		
		createJson : function(data) {
			let that = this;
			
			let project = that.pt.find("select#project_result option:selected").val();
			let title = that.pt.find(".detail_title").val()
			let contents = that.pt.find(".detail_contents").val()
			
			if(project == ""){
				alert("Task를 생성할 Project폴더를 선택해주세요");
				return;
			}
			
			if(title == ""){
				alert("제목을 입력해주세요");
				that.pt.find(".detail_title").focus();
				return;
			}
			
			if(contents == ""){
				alert("설명을 입력해주세요");
				that.pt.find(".detail_contents").focus();
				return;
			}				
			var radio_obj = that.data.radioObj;
			let keys = Object.keys(radio_obj);
			
			let algo = data.algorithm_id;
// 			console.log("algo::", algo);

			let data_id = radio_obj[keys[0]];
			
			if (data_id == null || data_id == "") {
				alert("Annotation 데이터를 선택해주세요");
				return;
			}
			let select_box = $("#task_inherit").find(".project_result")
			
			var selected_project_id = $(select_box).find("option:selected").data("id");
			var checkpoint_list = that.pt.find(".sub_wrap .radioBtn");
			var checkpoint_name
		
			if(checkpoint_list.hasClass("selected") != false){
				checkpoint_name = that.pt.find(".sub_wrap .radioBtn.selected").parent().parent("tr").find(".checkPoint_name")[0].textContent;
			} else {
				checkpoint_name = "";
			}
			console.log("checkpoint_name : " + checkpoint_name); 
			//var res = that.pt.find(".sub_wrap .box_wrap").children();
			var res_string = that.pt.find(".sub_wrap .box_wrap").children(".light").children("input[type='text']");
			var res_number = that.pt.find(".sub_wrap .box_wrap").children(".light").children("input[type='number']");
			var chk = that.pt.find(".sub_wrap .box_wrap").children(".check").children(".check_box_wrap").children(".check_box").children(".first");
				console.log("chk::", chk);
				console.log("res_string::", res_string);
				console.log("res_number::", res_number);
			let arr = {};
			let result = [];
			
			// 해당 알고리즘 입력
			for(var i=0; i < res_string.length; i++){
				if(res_string[i].value != ""){
					arr[res_string[i].name] = res_string[i].value;
				} else {
					alert("값을 입력해주세요");
					res_string[i].focus();
					return;
				}
			};
			
			for(var i=0; i < res_number.length; i++){
				if(res_number[i].value != ""){
					arr[res_number[i].name] = res_number[i].value * 1;
					console.log("res_number[i].value * 1:::", res_number[i].value * 1);
					console.log("typeof res_number[i].value * 1 :::", typeof(res_number[i].value * 1));
				} else {
					alert("값을 입력해주세요");
					res_number[i].focus();
					return;
				}
			};			
			
			for(var j=0; j < chk.length; j++){
			    if(chk[j].classList.contains("selected") == true){
			        arr[chk[j].attributes.name.value] = true;
			    } else {
			        arr[chk[j].attributes.name.value] = false;
			    }
			};
			
			if(checkpoint_name == ""){
				alert("Checkpoint를 선택해주세요");
				return;
			} /* else {
				arr["pretrained_model"] = checkpoint_name;
			} */
			
			result_string = JSON.stringify(arr);
			
			console.log("arr:::",arr);
			var inherit_id = that.data.inheritId;				// jh.sa 210208
			let ajaxData = {
					base_task_id : inherit_id,
					project_id : selected_project_id,				// 사용자가 선택한 project id 
					annotation_id : data_id,
					config : result_string,				// checkpoint 포함 
					title : title,
					check_point_name : checkpoint_name,
					contents : contents
				}
			/* console.log("base_task_id : " + ajaxData["base_task_id"] + " project_id : " + ajaxData["project_id"] + " annotation_id : " + ajaxData["annotation_id"] + " algorithm_id : " + ajaxData["alogirithm_id"]); */
			//
			/*let ajaxData = {
					id : task_id,
					title : title,
					project_id : project_id,
					check_point_name : selected_chkPt
					};*/
			//

			$("#loader").show();
			that.ajaxCall(ajaxData);
			
		},


		ajaxCall : function(ajaxData) {
			let that = this;

			console.log(ajaxData);

			$.ajax({
				url : baseUrl + "task/insertTask.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("======insertTask======", res);
					if (res.result.code == "200") {
						that.resetView();
// 						trainer.refreshTask(current_node);

						// 기존 프로젝트 닫기 추가
						var current_node = that.data.currentNode;
						let current_project_node = current_node.getParentNode();
						wsObj[obj.key].dir.removeChildNodes(current_project_node);
						$("#"+current_project_node.tId).children("a").children("#"+current_project_node.tId+"_switch").removeClass("noline_open").addClass("noline_close");						
						let transfer_project_node = wsObj[obj.key].dir.getNodeByParam("id",res.taskVO.project_id);
						trainer.refreshTask(transfer_project_node);
						wsObj[obj.key].dir.selectNode(transfer_project_node);
						trainer.detail(res.taskVO.task_id);
						$("#trainer.ztree").animate({scrollTop:0},500);
						console.log("current_node : ", current_node);
						console.log("transfer_project_node : ", transfer_project_node);
 						//console.log("res.taskVO.algorithm_id::::", res.taskVO.algorithm_id);
						//console.log("res.taskVO.config:::::", res.taskVO.config); 
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					}
					
					$("#loader").hide();
					alert(res.result.data);
				},
				error : function(err) {
					$("#loader").hide();
					console.log("ERROR!!", err);
				}
			});

		},
		
		// id에 해당하는 algorithm 정보 가져오기
		getAlgorithmById : function(data) {
			let that = this; 
			
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
						that.drawTrainParameters(taskData, res.result.data);
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					}
				},
				error : function(err){
					console.log("ERROR!", err);
				}
			});
		},
		
 		drawTrainParameters : function(taskData, algorithmData) {
			let that = this;
			let train_param_data = JSON.parse(algorithmData.train_param);
			let target = that.pt.find(".box_wrap");
			let target_title = $("#task_inherit").find(".sub_wrap .ms_wrap .algorithm_name");
			let description_target = that.pt.find(".description_wrap");
			let algorithm_name = "( Selected algorithm : " + algorithmData.title + " )";
			console.log("algorithmData.title: ", algorithmData);
			console.log("taskData: ", taskData);
			$(target_title).html(algorithm_name);
			$(target).html("");
			$(description_target).html("");
			
			let description = "<div class='description'>"+algorithmData.description+"</div>";
			$(description_target).append(description);
			that.pt.find(".sub_wrap .box_wrap").addClass("border");
			that.pt.find(".sub_wrap .description_wrap").addClass("border");
			
			let task_config = JSON.parse(taskData.config);
			console.log("task_config: ", task_config); 
			console.log("train_param_data : ", train_param_data);
			for(let i=0; i < train_param_data.length; i++){
					console.log(train_param_data[i]);
					let html = "";
					if(train_param_data[i].type == "string") {
						html += '<div class="input_wrap flex light">';
						html += '<label>'+train_param_data[i].param+'<span class="tooltip_wrap"></span></label>';
						html += '<span class="tooltip">'+train_param_data[i].helper+'</span>';
						html += '<input type="text" name="'+train_param_data[i].param+'" value="'+task_config[train_param_data[i].param]+'"/>';
						html += '</div>';
						$(target).append(html);
					} else if(train_param_data[i].type == "number"){
						html += '<div class="input_wrap flex light">';
						html += '<label>'+train_param_data[i].param+'<span class="tooltip_wrap"></span></label>';
						html += '<span class="tooltip">'+train_param_data[i].helper+'</span>';
						html += '<input type="number" name="'+train_param_data[i].param+'" value="'+task_config[train_param_data[i].param]+'" onKeyPress="return checkNum(event);"/>';
						html += '</div>';	
						$(target).append(html);
					} else if (train_param_data[i].type = "boolean"){
						if(train_param_data[i].defaultvalue === true) {
							html += '<div class="input_wrap flex check">';
							html += '<label>'+train_param_data[i].param+'<span class="tooltip_wrap"></span></label>';
							html += '<span class="tooltip">'+train_param_data[i].helper+'</span>';
							html += '<div class="check_box_wrap">';
							html += '<div class="check_box">';					
							html += '<div class="checkBox first selected" name="'+train_param_data[i].param+'"></div>';
							html += '</div>';
							html += '</div>';
							html += '</div>';							
						} else {
							html += '<div class="input_wrap flex check">';
							html += '<label>'+train_param_data[i].param+'<span class="tooltip_wrap"></span></label>';
							html += '<span class="tooltip">'+train_param_data[i].helper+'</span>';
							html += '<div class="check_box_wrap">';
							html += '<div class="check_box">';					
							html += '<div class="checkBox first" name="'+train_param_data[i].param+'"></div>';
							html += '</div>';
							html += '</div>';
							html += '</div>';
						}

						
						$(target).append(html);
					};
					
					// helper 툴팁
					let tooltip_wrap = that.pt.find(".tooltip_wrap");
// 					console.log("tooltip_wrap:: ", tooltip_wrap);
					tooltip_wrap.off("mouseover").on("mouseover", function() {
						let tooltip = $(this).parent("label").next(".tooltip");
						tooltip.toggleClass("on");
					});
					tooltip_wrap.off("mouseout").on("mouseout", function() {
						let tooltip = $(this).parent("label").next(".tooltip");
						tooltip.removeClass("on");						
					})
					
					//$(target).append(html);
					that.defaultListener();
					that.pt.find(".submit_btn").off("click").on("click", function() {
						that.createJson(algorithmData);
					});						
			};
		},
		
		getProjectList : function() {
			let that = this;
			let url = "project/getProjectList.json"
			that.getDataList(url);
		},
	
		getDataList : function(url, ajaxData, parentNode) {
			let that = this;
	// 		that.setProgressbarVisible(parentNode);
	
			$.ajax({
				url : baseUrl + url,
				data : ajaxData,
				success : function(res) {
					console.log("=====getDataList======", res);
					if(res.result.code == "200"){
						if (res.projectVO != undefined) {
		// 					that.setProjectResult(res.result.data);
						} else if (res.taskVO != undefined) {
		// 					that.setTaskResult(res.result.data, parentNode);
						}						
						// 				that.setProgressbarGone(parentNode);
						that.setProjectList(res.result.data);
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}						
					
	

				},
				error : function(err) {
	// 				that.setProgressbarGone(parentNode);
					console.log("ERROR!!", err);
				},
			});
	
		},
		
		setProjectList : function(data) {
			let that = this;
			let project_data = data;
			let selectTarget = that.pt.find(".project_result");
			$(selectTarget).html("");
			
	
			
			let html = "<option value=''>Please select the project</option>"; 
			for(let i=0, len = project_data.length; i<len; i++){
				html += "<option data-id='"+data[i]["id"]+"' value='"+data[i]["title"]+"'>";
				html += data[i]["title"];
				html += "</option>";
	
			}
			$(selectTarget).append(html);
	// 		that.selectAlgorithm(algorithm_data);
		},		

		getCheckPointList : function(){
			let that = this;
			var inherit_id = that.data.inheritId;
			var ajaxData = {
					task_id : inherit_id
			};
			console.log("id : " + ajaxData["id"]);
			$.ajax({
				url :  baseUrl + "task/getCheckPointList.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("=============getCheckPointList=============", res);
					if (res.result.code == "200") {
						console.log("load success!!");
						that.drawCheckPointList(res.result.data);
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
		
		drawCheckPointList : function(data){
			let that = this;
			
			let checkPoints = data;
			let target = that.pt.find(".checkpoint_table tbody");
			let html = "";
			checkPoints.reverse();
			console.log("checkPoints : ", checkPoints);
			console.log("target html : ", target);
			if(checkPoints.length > 0){
				for(let i = 0; i < checkPoints.length; i++){
					if(checkPoints[i] != ".DS_Store"){
						html += "<tr>";
						html += "<td class='checkPoint_check'>";
						html += "<div class='radioBtn'></div>";
						html += "</td>";
						html += "<td class='checkPoint_name'>"+checkPoints[i]+"</td>";
						html += "</tr>";					
					}
				}			
				
				$(target).append(html);
				that.removeEmptyData(that.pt.find(".list_wrap"));
				that.checkPointListener();				
			} else {
				that.addEmptyData(that.pt.find(".list_wrap"), "No Model", "please train your task first");
			}

			
			

		},
		
		checkPointListener : function() {
			let that = this;
			 
			let chk_radio_obj;
			let row_click = that.pt.find(".list_wrap .checkpoint_table tbody tr")
			row_click.off("click").on("click",function() {
				let tr = $(this);
				let btn = tr.children().children(".radioBtn");
				let chkpoint_name = tr.children(".checkPoint_name").val();
				btn.toggleClass("selected");
				if(btn.hasClass("selected")){
					chk_radio_obj = {};
					that.pt.find(".list_wrap .checkpoint_table tbody tr .radioBtn").removeClass("selected");
					btn.addClass("selected");
					chk_radio_obj[chkpoint_name] = chkpoint_name;
				} else {
					chk_radio_obj = {};
				}
				
			});	
		},

	}
</script>
