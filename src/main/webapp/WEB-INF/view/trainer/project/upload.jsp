<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>

<title>X-labeller</title>

<style>

/* 공통 */
#project_upload {height: 100%; width: 100%;}
#project_upload .ms_wrap {width: 100%; margin-top: 23px;}
#project_upload  .table_body{max-height: calc(100% - 194px); overflow-y: overlay; overflow-x:hidden;}

#project_upload .hover_box {border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
#project_upload .hover_box div {font-family: Open_Sans; font-size: 13px; color: #555555;}
#project_upload .hover_div div {word-break: break-word; margin: 2px 5px; white-space: normal; font-weight: 300; font-family: Open_Sans;}
#project_upload .hover_div {max-width: 264px; text-align: left; position: relative; }
#project_upload .hover_box {max-width: 264px; text-align: left; }

/* 메인 */

#project_upload .main_wrap {width: 60%; height: 100%; position:relative;}
#project_upload .main_title {display: block; font-family: Open_Sans; font-size: 12px;font-weight: 400; color: #343434;}
#project_upload .detail_title {margin-top : 20px; display: block; font-family: Open_Sans; font-size: 20px; color: #343434;}
#project_upload .detail_contents {margin-top : 8px; display: block; font-family: Open_Sans; font-size: 12px; color: #797a7c; width: 304px;}
#project_upload .anno_wrap > input { width: 900px; border-width: 0; padding: 0; font-weight: 300;}

#project_upload .main_wrap .horizontal_line {width: 100%; height: 1px; background-color: #e7e7e7; margin: 24px 0 0 0; display:block;}
#project_upload .main_wrap .list_wrap {height: calc(100% - 157px); position: relative; font-family: Open_Sans; font-size: 14px; font-weight: 400; }

#project_upload .main_wrap .list_wrap .list_header { margin: 22px 0px -15px 0px; }
#project_upload .main_wrap .list_wrap .label_type_wrap { margin: 5px 0px 24px 103px; float: left; font-family: Open_Sans; font-size: 14px; font-weight: 400; color: #343434; }
#project_upload .main_wrap .list_wrap .list_total { float: right; }

/* 서브 */


#project_upload .sub_wrap {width: 40%; height: 100%; background-color: #f5f5f5; overflow: overlay; position:relative;}
#project_upload .sub_title { display: block; font-family: Open_Sans; font-size: 12px;color: #343434; font-weight:400;}

#project_upload .sub_wrap .margin {margin: 0 43px;}

#project_upload .sub_wrap .box_wrap {margin-top: 17px; margin-bottom: 17px; padding: 15px; }
#project_upload .sub_wrap .box_wrap.border { border: 1px solid #dedcde; }
#project_upload .sub_wrap .box_wrap .input_wrap { margin-bottom: 12px; padding-top: 5px; }
/* #project_upload .sub_wrap .box_wrap .input_wrap:nth-child(6) {margin-bottom : 17px;}
#project_upload .sub_wrap .box_wrap .input_wrap:nth-child(7) {margin-bottom : 29px;} */
#project_upload .sub_wrap .box_wrap .input_wrap > label { margin-right: 27px; float: left; width: 180px; font-family: Open_Sans; font-size: 12px;  color: #343434; font-weight: 300;}
#project_upload .sub_wrap .box_wrap .input_wrap > input { border-radius:2px; width: calc(100% - 172px); height: 32px; background-color: #ffffff; padding: 0 11px ; font-family: Open_Sans;  font-weight: 300; border: 1px solid #dedcde; margin-bottom: -11px; }
#project_upload .sub_wrap .box_wrap .input_wrap.backbone input {background-color: #f9f9f9; color: #999999;}
#project_upload .sub_wrap .box_wrap .input_wrap.gpu input {background-color: #f9f9f9; color: #999999;}
#project_upload .sub_wrap .check_box_wrap { width:calc(100% - 148px); margin-bottom: -11px; }
#project_upload .sub_wrap .check_box_wrap .check_box > label {font-family: Open_Sans;font-size: 13px;font-weight: 300; color: #616263; margin-left: 19px; }
#project_upload .sub_wrap .check_box_wrap .check_box:last-child { margin-bottom: 0; }
#project_upload .sub_wrap .check_box_wrap .check_box {margin-bottom: 15px;}

#project_upload .sub_wrap .description_wrap { margin: 17px 0; padding: 15px; }
#project_upload .sub_wrap .description_wrap.border { border: 1px solid #dedcde; }
#project_upload .sub_wrap .description_wrap .description { font: 400 12px system-ui; }


#project_upload .sub_wrap .box_wrap .input_wrap.light input:focus {border: 1px solid #4c84ff;}

#project_upload .sub_wrap .btn_wrap {text-align: center; margin-bottom: 103px;}
#project_upload .sub_wrap .btn_wrap .submit_btn {width: 280px; height: 40px; font-weight: 300; border: 0; }

#project_upload .sub_wrap .defaultBtn {display:inline-block; width: 14px; height: 14px; background-color: #f5f5f5;}
#project_upload .sub_wrap .defaultBtn.selected {background: url("./images/icon_comparison_check.png") no-repeat center;}

#project_upload .empty_wrap {text-align: center; margin-top: 170px; }
#project_upload .empty_wrap .no_image {margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; }
#project_upload .empty_wrap .eng_text {font-family: Open_Sans; margin-bottom: 3px; font-size: 16px; font-weight: 300; color: #777777;}
#project_upload .empty_wrap .kor_text {font-family: Open_Sans; font-size: 12px; color: #777777; font-weight: 200;}
#project_upload .no_image {height: 37px; background-image: url('./images/icon_nodata_list.png'); }

#project_upload input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button { -webkit-appearance: none; margin: 0; }

#project_upload .algorithm_list { width: 100%; height: 34px; margin-top: 10px; background-color: #f8f8f8; border-radius: 4px; border: 1px solid #d9d9d9; outline: none; color: #797a7c; }

#project_upload [data-tooltip-text]:hover { position: relative; cursor: pointer; }
#project_upload [data-tooltip-text]:after { 	
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
#project_upload [data-tooltip-text]:hover:after { top: -41.3%; left: 165px; opacity: 1; }
#project_upload .tooltip_span:hover { min-width: 800px; display: inline; z-index: 999; }
#project_upload .tooltip_span { width: 17px; height: 17px; }
#project_upload .tooltip_wrap { width: 17px; height: 17px; display: inline-block; cursor: pointer; margin: 0 5px; position: relative; top: 4px; background: url("${pageContext.request.contextPath}/resources/images/btn_help_nor.png") no-repeat; }
#project_upload .tooltip { width: 354px; padding: 10px 12px 10px 12px; color: #fff; background-color: rgba(0, 0, 0, 0.6); -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; font: 400 12px system-ui; position: absolute; z-index: 9999; left: 36.5%; padding-left: 12px; visibility: hidden; opacity: 0; transition: visibility 0s, opacity 0.3s ease; margin-bottom: -11px; }
#project_upload .tooltip.on { width: 354px; padding: 10px 12px 10px 12px; color: #fff; background-color: rgba(0, 0, 0, 0.6); -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; font: 400 12px system-ui; position: absolute; z-index: 9999; left: 36.5%; padding-left: 12px; visibility: visible; opacity: 1; transition: visibility 0s, opacity 0.3s ease; }

#project_upload .label_type_wrap select { height: 36px; width: 165px; border: 0; border-bottom: 1px solid #dedcde; font: 400 11px system-ui; background: url("${pageContext.request.contextPath}/resources/images/select_arrow.png") #fff no-repeat 97% 50% / 10px; outline: none; }
#project_upload .label_type_wrap { position: relative; left: 72%; top: 20px; }

#project_upload .tui-pagination { margin: 30px auto; }
</style>

</head>
<body>

	<div class="container" id="project_upload">

		<div class="contents flex">
			<div class="main_wrap filter_color">
				<div class="title_wrap ms">
					<div class="ms_wrap">
						<span class="main_title">Create Task</span>
						<div class="flex">
							<div class="anno_wrap">
								<input class="detail_title" data-length="100" placeholder="Please enter the title" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"> 
								<input class="detail_contents" data-length="200" placeholder="Please enter the description">
							</div>

						</div>
					</div>
				</div>

				<div class="horizontal_line"></div>

				<div class="list_wrap ms">
					<div class="list_header flex sb">
						<div class="list_title">Annotation List</div>
						<div class="list_total">Total <span></span></div>
					</div>
					
					<span class="label_type_wrap">
						<select id="label_type" class="label_type" name="label_type">
							<option value="">ALL</option>
							<option value="IMAGE_BBOX">Image Bounding Box</option>
							<option value="IMAGE_SEGMENTATION">Image Segmentation</option>
							<option value="VIDEO_BBOX">Video Bounding Box</option>
							<!-- <option value="">ALL</option> -->
							<!-- <option value="box">Bounding Box</option>
							<option value="polygon">Segmentation</option> -->
						</select>	
					</span> 
					
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
					<div class="table_body">
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
					<div class="f_wrap flex">
						<div id="pagination" class="tui-pagination filter_color"></div>
					</div>							
				</div>
			</div>

			<div class="sub_wrap">
				<div class="margin">
					<div class="ms_wrap filter_color">
						<span class="sub_title">Config</span>
						<select id="algorithm_list" class="algorithm_list" name="algorithm_list">
							<option value=''>Please select algorithm</option>
						</select>
						<div class="description_wrap">
						
						</div>						
						<div class="box_wrap">

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

// 	var project_id;						// jh.sa 210224 project_id => that.data.project_id
// 	var current_node					// jh.sa 210224 current_node => that.data.cur_node
	
	//스크롤에 사용할것
	
// 	var annotation_arr = [];			// jh.sa 210224 annotation_arr => that.data.scrollObj.annotation_arr
// 	var radio_obj = {};					// jh.sa 210224 radio_obj => that.data.scrollObj.radio_obj
// 	var label_type = "";				// jh.sa 210224 label_type => that.data.label_type
// 	var algorithm_type = "";			// jh.sa 210224 algorithm_type => that.data.algorithm_type 사용 안함
// 	var scrollObj = {					// jh.sa 210224 scrollObj => that.data.scrollObj
// 			scroll_start:0,
// 			scroll_end:0,
// 			isScroll_top:0,
// 			isScroll_end:0,
// 			isScroll : false,
// 			default_size : 40,
// 			half_size : (40 / 2)
// 	}
	
	var project_upload = {
		pt : $("#project_upload"),
		data : {
			project_id : null,	
			cur_node : null,
			label_type : null,
// 			algorithm_type : null,
			scrollObj : {
				scroll_start:0,
				scroll_end:0,
				isScroll_top:0,
				isScroll_end:0,
				isScroll : false,
				default_size : 40,
				half_size : (40 / 2),
				annotation_arr : [],
				radio_obj : {},
			},
		},
		init : function(node) {
			let that = this;
			that.data.project_id = node.project_id;
			that.data.cur_node = node;
			that.resetView();
			var page_num = 0;
			that.getAnnotationList(that.data.label_type, page_num);
// 			that.getAlgorithmList();
			that.selectboxListener();			
// 			that.defaultListener();
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
			that.pt.find(".list_total span").text("0");
			that.pt.find(".table_body").scrollTop(0);
// 			label_type = "";
		},
		
		defaultListener : function(){
			
			let that = project_upload;
			
			let check_first = that.pt.find(".checkBox");
// 			console.log("check_first:", check_first);
			let check_second = that.pt.find(".checkBox.second");

			check_first.off("click").on("click", function() {
				$(this).toggleClass("selected");
			});

			check_second.off("click").on("click", function() {
				$(this).toggleClass("selected");
			});
			
			// paging evt
			$("#project_upload #pagination .first").off("click").on("click",function(){
				var page_num = 0;
				that.getAnnotationList(that.data.label_type, page_num);
			});
			$("#project_upload #pagination .prev").off("click").on("click",function(){
				var page_size = 10;
				var page_num = $("#project_upload #pagination .page-item.active .page-link").html()*1-2;
				if(page_num<0){
					alert("첫 페이지 입니다.");
					return false;
				}
				that.getAnnotationList(that.data.label_type, page_num);
			});
			$("#project_upload #pagination .page-link").off("click").on("click",function(){
				if(isNaN($(this).html()) == false){
					var page_num = $(this).html()*1-1;
					that.getAnnotationList(that.data.label_type, page_num);
				}
			});
			$("#project_upload #pagination .next").off("click").on("click",function(){
				var page_size = 10;
				var page_num = $("#project_upload #pagination .page-item.active .page-link").html()*1;
				var lastPage = Math.floor($("#project_upload .list_total span").html()*1/page_size);
				if(page_num>lastPage){
					alert("마지막 페이지 입니다.");
					return false;
				}
				var page = $("#project_upload .list_total span").html()*1/page_size;
				if(page == page_num){
					alert("마지막 페이지 입니다.");
					return false;
				} else {
					that.getAnnotationList(that.data.label_type, page_num);
				}				
// 				that.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
			});
			$("#project_upload #pagination .last").off("click").on("click",function(){
				var page_size = 10;
				var page_num = Math.floor($("#project_upload .list_title span").html()*1/page_size);
				var page = $("#project_upload .list_total span").html()*1/page_size;
				if(page == page_num){
					that.getAnnotationList(that.data.label_type, page_num);
				} else {
					that.getAnnotationList(that.data.label_type, page_num);
				}
				
				
			});				

		},

		getAnnotationList : function(label_type, page) {
			let that = this;
			$("#loader").show(); 
			
			let ajaxData = {
					label_type : label_type,
					page_num : page
					
			};
			$.ajax({
				url : baseUrl + "annotation/getAnnotationList.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					$("#loader").hide();
					console.log("=====getAnnotationList=====", res);
					if (res.result.code == "200") {
// 						var startPage = Math.floor(res.annotationVO.page_num*1/res.annotationVO.page_size*1)+1;
// 						var total_size = res.annotationVO.total_size;
// 						var page_size = res.annotationVO.page_size;
// 						var temp = res.result.data;
// 						that.pt.find(".list_total span").text(total_size);
// 						that.updateListPage(temp,startPage,page_size,total_size);
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
		
		updateListPage : function(temp,startPage,page_size,total_size){
			let that = this;
			var totalPage = Math.ceil(total_size * 1 / page_size);
			
			if($("#project_upload #pagination").data("twbs-pagination")){
				$("#project_upload #pagination").twbsPagination('destroy');
			}
			$("#project_upload #pagination").twbsPagination({
				  totalPages: totalPage,
				  visiblePages: 5,
				  first:"<<",
				  prev:"<",
				  next:">",
				  last:">>",
				  startPage: startPage,
//					  onPageClick: function (event, total_size) {
//						  that.render.drawDataList(temp,total_size, page_num, page_size);
//					  }
			});
			that.modifyAnnotationListData(temp);
		},		
		
		resetAnnotationListData : function(){
			var that = this;
			that.data.scrollObj.isScroll_top = false;
			that.data.scrollObj.isScroll_end = false;
			that.data.scrollObj.isScroll = false;
			that.data.scrollObj.annotation_arr = [];
			that.data.scrollObj.radio_obj = {};
		},
		
		modifyAnnotationListData : function(data){
			let that = this;
			that.resetAnnotationListData();
			that.removeEmptyData(that.pt.find(".list_wrap"));
			//test 
// 			for(let y=0; y<400; y++){
// 				for(let i=0, len = data.length; i<len; i++){
// 					that.data.scrollObj.annotation_arr.push(data[i]);
// 				} 
// 			}

			if(data.length == 0){
				that.pt.find(".submit_btn").hide();
				that.addEmptyData(that.pt.find(".list_wrap"), "No Annotation", "please add annotation");
			} else {
				that.pt.find(".submit_btn").hide();
			}	
			
			for(let i=0, len = data.length; i<len; i++){
				that.data.scrollObj.annotation_arr.push(data[i]);
			} 
			
			that.pt.find(".list_total span").text(that.data.scrollObj.annotation_arr.length);
			that.initAnnotationList();
		},
		
		initAnnotationList : function(){
			var that = this;
			var scroll_info = that.data.scrollObj;
			var annotation_arr = that.data.scrollObj.annotation_arr;
			that.pt.find(".main_wrap .table_body table tbody").html("");
			that.data.scrollObj.scroll_start = 0;
			that.data.scrollObj.scroll_end = (scroll_info.default_size < annotation_arr.length ) ? scroll_info.default_size : annotation_arr.length;
			that.drawAnnotationList("init",that.data.scrollObj.scroll_start,that.data.scrollObj.scroll_end);
			if(annotation_arr.length > scroll_info.default_size) {
				that.data.scrollObj.isScroll_top = true;
				that.setAnnotationScrollListener();
			}
		},
		
		drawAnnotationList : function(type,start,end){
			var that = this;
			var target = that.pt.find(".main_wrap .table_body table tbody");
			var scroll_info = that.data.scrollObj;
			var annotation_arr = that.data.scrollObj.annotation_arr;
			var radio_obj = that.data.scrollObj.radio_obj;
			var html = "";
			var i = 0;
			var cur_p = $("#project_upload #pagination .page-item.active .page-link").text();
			for (i = start ; i < end ; i++) {
				let data = annotation_arr[i];
				let l_type = data["label_type"];
				html += " <tr data-id='"+data["annotation_id"]+"'> ";
				if(radio_obj[data.id] != undefined){
					html += "   <td><div class='radioBtn selected'></div></td>";	
				} else {
					html += "   <td><div class='radioBtn'></div></td>";
				}
/* 				if(l_type == "polygon") {
					l_type = "Segmentation";
				} else if(l_type == "box"){
					l_type = "Bounding Box";
				} */
				
// 				if(cur_p == 1){
// 					html += " 	<td>" + (i + 1) + "</td> ";
// 				} else {
// 					html += " 	<td>" + (String(cur_p-1) + (i+1)) + "</td> ";
// 				}
				html += " 	<td>" + (i + 1) + "</td> ";
				html += " 	<td>" + data["user_id"] + "</td> ";
				html += " 	<td class='title'>" + data["title"] + "</td> ";
				html += " 	<td>" + data["contents"] + "</td> ";
				html += "	<td>" + data["label_type"] + "</td> ";				// jh.sa 추가 
				html += " 	<td>" + moment(data["created_date"]).format("YYYY-MM-DD")+ "</td> ";
				html += " </tr> ";
			}
			that.data.scrollObj.isScroll = false;
			
			if(type == "down" || type == "init"){
				target.append(html);	
			} else {
				target.prepend(html);
			}

			that.annotationListener();	
			that.defaultListener();
		},
		
		setAnnotationScrollListener : function(){
			let that = this;	
			
			that.pt.find(".main_wrap .table_body").off("scroll").on("scroll",function(){
				var scroll_info = that.data.scrollObj;
				var annotation_arr = that.data.scrollObj.annotation_arr;
				var target = $(this);
				
				var st = target.scrollTop();
				var box_size = that.pt.find(".main_wrap tbody tr").length;

				if(st + target.innerHeight() >= target[0].scrollHeight && !scroll_info.isScroll && !scroll_info.isScroll_end){
					that.data.scrollObj.isScroll = true;
					
					var diff = 0;
					if(scroll_info.scroll_end + scroll_info.half_size >= annotation_arr.length){
						diff = annotation_arr.length - scroll_info.scroll_end;
						that.data.scrollObj.scroll_end = annotation_arr.length;
						that.data.scrollObj.scroll_start = scroll_info.scroll_start + diff;
						that.data.scrollObj.isScroll_end = true;
						
					}else{
						diff = scroll_info.half_size;
						that.data.scrollObj.scroll_end = scroll_info.scroll_end + diff;
						that.data.scrollObj.scroll_start = scroll_info.scroll_start + diff;
					}
					var end = scroll_info.scroll_end;
					var start = end - diff;
					
					that.drawAnnotationList("down",start,end);
					that.removeBox(diff,"down");	
					that.data.scrollObj.isScroll_top = false;
					
			
				}else if(st == 0 && !scroll_info.isScroll && !scroll_info.isScroll_top){
					that.data.scrollObj.isScroll = true;					
					
					var diff = 0;
					if(scroll_info.scroll_start - scroll_info.half_size <= 0){						
						diff = scroll_info.scroll_start;
						that.data.scrollObj.scroll_start = 0;
						that.data.scrollObj.scroll_end = scroll_info.scroll_end - diff;
						that.data.scrollObj.isScroll_top = true;
						
					}else{
						diff = scroll_info.half_size;
						that.data.scrollObj.scroll_end = scroll_info.scroll_end - diff;
						that.data.scrollObj.scroll_start = scroll_info.scroll_start - diff;
					}
					var start = scroll_info.scroll_start;
					var end = start + diff;
					
					
					that.drawAnnotationList("up",start,end);
					that.removeBox(diff,"up");	
					that.data.scrollObj.isScroll_end = false;
							
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

			let row_click = that.pt.find("table tbody tr")

			row_click.off("click").on("click",function() {
				var tr = $(this);
				var btn = tr.children().children(".radioBtn");
				var id = tr.data("id");
				var td = tr.children();
				var label_type = td.eq(5).text();
				
				that.data.scrollObj.radio_obj = {};
				that.data.scrollObj.radio_obj[id] = id;

				console.log("algorithm_type1212 : " + label_type);
/* 				if(algorithm_type == "null") {
					algorithm_type = "";
				} else if(algorithm_type == "IMAGE_SEGMENTATION"){
					algorithm_type = "IMAGE_SEGMENTATION";
				} else if(algorithm_type == "IMAGE_BBOX") {
					algorithm_type = "IMAGE_BBOX";
				} else if(algorithm_type == "VIDEO_BBOX") {
					algorithm_type = "VIDEO_BBOX";
				} */
				btn.toggleClass("selected");
				if(btn.hasClass("selected")){
					that.pt.find("table tbody tr .radioBtn").removeClass("selected");
					btn.addClass("selected");
					that.data.scrollObj.radio_obj[id] = id;
					that.selectboxListener();
				} else {
					that.data.scrollObj.radio_obj = {};
					that.selectboxListener();
					that.pt.find(".description_wrap").removeClass("border").html("");
					that.pt.find(".box_wrap").removeClass("border").html("");
					that.pt.find(".submit_btn").hide();
					that.pt.find(".algorithm_list").html("<option value=''>Please select algorithm</option>");
				}
				
				let ajaxData = {label_type : label_type};
				that.getAlgorithmList(ajaxData);
			});
			
			that.pt.find("table tbody td").off("mouseenter").on("mouseenter",function(){
				let text = $(this)[0].innerText;
				if(text == "") {return;}	
				$(this).empty();
				$(this).append(text);
				that.addHoverBox($(this), text);
			});
			
			that.pt.find("table tbody td").off("mouseleave").on("mouseleave",function(){
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
			var that = this;
			var radio_obj = that.data.scrollObj.radio_obj;
			var keys = Object.keys(radio_obj);
			var algo = data.algorithm_id;
			var data_id = radio_obj[keys[0]];
			
			console.log("algo::", algo);
			
			if (data_id == null || data_id == "") {
				alert("선택된 데이터가 없습니다");
				return;
			}
			if($("#algorithm_list").val() == ""){
				alert("선택된 알고리즘이 없습니다.");
				return;
			}
			//var res = that.pt.find(".sub_wrap .box_wrap").children();
			var res_string = that.pt.find(".sub_wrap .box_wrap").children(".light").children("input[type='text']");
			var res_number = that.pt.find(".sub_wrap .box_wrap").children(".light").children("input[type='number']");
			var chk = that.pt.find(".sub_wrap .box_wrap").children(".check").children(".check_box_wrap").children(".check_box").children(".first");
			var arr = {};
			var result = [];
			
			console.log("chk::", chk);
			console.log("res_string::", res_string);
			console.log("res_number::", res_number);			
			
			// 해당 알고리즘 입력, config에 삽입하는 데이터
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

			result_string = JSON.stringify(arr);
			
			let title = that.pt.find(".detail_title").val()
			let contents = that.pt.find(".detail_contents").val()
			
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
			
			console.log("arr:::",arr);
			
			let ajaxData = {
					project_id : that.data.project_id,
					annotation_id : data_id,
					algorithm_id : algo,
					config : result_string,
					title : title,
					contents : contents,
					label_type : that.pt.find("tbody tr").find(".selected").parent().parent().children('td').eq(5).text()
				}
			console.log("insertTask Label_type : ", ajaxData['label_type']);
			$("#loader").show();
			that.ajaxCall(ajaxData);
			
		},
		
/* 		createJson : function() {
			let that = this;
			
			let keys = Object.keys(radio_obj);

			let data_id = radio_obj[keys[0]];

			if (data_id == null || data_id == "") {
				alert("선택된 데이터가 없습니다");
				return;
			}
			
			var algo = that.pt.find(".check_box.third label").text();
			var res = that.pt.find(".sub_wrap .box_wrap").children();

			let arr = {};
			let result = [];
			
			
			if(that.pt.find("input[name='first']").val() != ""){
				arr["--steps"] = that.pt.find("input[name='first']").val();	
			} else {
				alert("Steps 값을 입력해주세요");
				that.pt.find("input[name='first']").focus();
				return;
			}
			
			if(that.pt.find("input[name='second']").val() != ""){
				arr["--epochs"] = that.pt.find("input[name='second']").val();
			} else {
				alert("Epochs 값을 입력해주세요");
				that.pt.find("input[name='second']").focus();
				return;
			}
			if(that.pt.find("input[name='third']").val() != ""){
				arr["--image-min-side"] = that.pt.find("input[name='third']").val();
			} else {
				alert("최소값을 입력해주세요");
				that.pt.find("input[name='third']").focus();
				return;
			}
			if(that.pt.find("input[name='fourth']").val() != ""){
				arr["--image-max-side"] = that.pt.find("input[name='fourth']").val();
			} else {
				alert("최대값을 입력해주세요");
				that.pt.find("input[name='fourth']").focus();
				return;
			}
			
			arr["--backbone"] = that.pt.find("input[name='fifth']").val();
			arr["--gpu"] = that.pt.find("input[name='sixth']").val();

			
			console.log(arr);

			if (that.pt.find(".checkBox.first").hasClass("selected")) {
				arr["--random-transform"] = "true"
			} else {
				arr["--random-transform"] = "false"
			}

			if (that.pt.find(".checkBox.second").hasClass("selected")) {
				arr["--freeze-backbone"] = "true"
			} else {
				arr["--freeze-backbone"] = "false"
			}

			result_string = JSON.stringify(arr);

			let title = that.pt.find(".detail_title").val()
			let contents = that.pt.find(".detail_contents").val()
			
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

			let ajaxData = {
					project_id : that.data.project_id,
					annotation_id : data_id,
					algorithm : algo,
					config : result_string,
					title : title,
					contents : contents
				}

			$("#loader").show();
			that.ajaxCall(ajaxData);	
			
		}, */

		ajaxCall : function(ajaxData) {
			let that = this;

			console.log(ajaxData);
			alert("데이터의 크기에 따라 작업시간이 오래 소요될 수 있습니다.\n잠시만 기다려주세요.");
			$.ajax({
				url : baseUrl + "task/insertTask.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
// 					label_type = "";
// 					algorithm_type = "";
					that.data.label_type = "";
// 					that.data.algorithm_type = "";
					console.log("======insertTask======", res);
					if (res.result.code == "200") {
						var isTaskList = true;
						that.resetView();
						trainer.refreshTask(that.data.cur_node);
						trainer.detail(res.taskVO.task_id, isTaskList);
 						//console.log("res.taskVO.algorithm_id::::", res.taskVO.algorithm_id);
						//console.log("res.taskVO.config:::::", res.taskVO.config); 
					}  else if (res.result.code == "2001") {
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
		
		// Config select에 들어갈 알고리즘 목록 불러오기
 		getAlgorithmList : function(ajaxData) {
			let that = this;
			/* let ajaxData = {"label_type" : algorithm_type}; */
			/* console.log("algorithm_type : " + algorithm_type); */
			console.log("ajaxData::",ajaxData);

			$("#loader").show();
			$.ajax({
				url : baseUrl + "algorithm/getAlgorithmList.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					$("#loader").hide();
					console.log("=====getAlgorithmList=====", res);
					if (res.result.code == "200") {
					 	that.setAlgorithmList(res.result.data);
					} else if (res.result.code == "2001") {
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
		
		// Config select에 알고리즘 목록 뿌려주기 
		setAlgorithmList : function(data) {
			let that = this;
			let algorithm_data = data;
			let selectTarget = that.pt.find(".algorithm_list");
			$(selectTarget).html("");
			

			
			let html = "<option value=''>Please select algorithm</option>";
			for(let i=0, len = data.length; i<len; i++){
				html += "<option data-id='"+data[i]["algorithm_id"]+"' value='"+data[i]["title"]+"'>";
				html += data[i]["title"];
				html += "</option>";

			}
			$(selectTarget).append(html);
			that.selectAlgorithm(algorithm_data);
		},
		
		selectAlgorithm : function(data) {
			let that = this;
			$("#algorithm_list").on("change",function(){
				let selected_algorithm = $(this).val();
				
				if(selected_algorithm === ""){
					let target = that.pt.find(".box_wrap");
					$(target).html("");
					that.pt.find(".sub_wrap .description_wrap").html("");
					that.pt.find(".sub_wrap .box_wrap").removeClass("border");	
					that.pt.find(".sub_wrap .description_wrap").removeClass("border");
				} else {
					for(let i=0; i < data.length; i++){
						if(selected_algorithm == data[i]["title"]){
							console.log("Got it!!");
							that.getAlgorithmById(data[i]["algorithm_id"]);
							break;
						};
					};
					that.pt.find(".sub_wrap .box_wrap").addClass("border");
					that.pt.find(".sub_wrap .description_wrap").addClass("border");
					that.pt.find(".submit_btn").show();
				}
			});
		},
		
		// id에 해당하는 algorithm 정보 가져오기
		getAlgorithmById : function(id) {
			let that = this; 
			
			let ajaxData = {
				algorithm_id : id
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
						that.drawTrainParameters(res.result.data);
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
		
 		drawTrainParameters : function(data) {
			let that = this;
			let train_param_data = JSON.parse(data.train_param);
			let target = that.pt.find(".box_wrap");
			let description_target = that.pt.find(".description_wrap");
			$(target).html("");
			$(description_target).html("");
			
			let description = "<div class='description'>"+data.description+"</div>";
			$(description_target).append(description);
			
			for(let i=0; i < train_param_data.length; i++){
					console.log(train_param_data[i]);
					let html = "";
					if(train_param_data[i].type == "string") {
						html += '<div class="input_wrap flex light">';
						html += '<label>'+train_param_data[i].param+'<span class="tooltip_wrap"></span></label>';
						html += '<span class="tooltip">'+train_param_data[i].helper+'</span>';
						html += '<input type="text" name="'+train_param_data[i].param+'" value="'+train_param_data[i].defaultvalue+'" validationParam/>';
						html += '</div>';
						$(target).append(html);
					} else if(train_param_data[i].type == "number"){
						html += '<div class="input_wrap flex light">';
						html += '<label>'+train_param_data[i].param+'<span class="tooltip_wrap"></span></label>';
						html += '<span class="tooltip">'+train_param_data[i].helper+'</span>';
						html += '<input type="number" name="'+train_param_data[i].param+'" value="'+train_param_data[i].defaultvalue+'" onKeyPress="return checkNum(event);" validationParam/>';
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
					that.pt.find(".submit_btn").show();
					that.pt.find(".submit_btn").off("click").on("click", function() {
						that.createJson(data);
					});						
			};
			
			
			// 유효성 검사 이벤트를 위해 호출 
			that.trainParameterListener();
		},
		
		/* 학습 파라미터 입력 이벤트 : input foucusout 시 입력값 유효성 검사 */ 
		trainParameterListener: function() {
			
			var that = this;
			var validationParam = that.pt.find(".box_wrap input[validationParam]");
			// var epochsInput = that.pt.find(".box_wrap input[name='epochs']");
			
			validationParam.off("focusout").on("focusout", function(e){
				
				var targetValue = e.target.value;
				var targetName = e.target.name;
				var targetObj = that.pt.find('input[name=' + targetName + ']');
				
				var checkResultObj = checkParamValue(targetName, targetValue); // checkParamValue ( xValidate.js )
				
				console.log("## trainParameterListener : ", targetName, targetValue, targetObj, checkResultObj);
				
				if(!checkResultObj.result && targetObj ) {
					alert(checkResultObj.validationMsg); // 안내메세지 출력 
					targetObj.attr("value", checkResultObj.defaultValue); // value 값 혹시 모르니 바꿔줌 
					targetObj.val(checkResultObj.defaultValue);  // input text 변경 
				} 
				
			});
		},
		
		selectboxListener : function(){
			let that = this;
			let algorithm_select = that.pt.find("select[name='algorithm_list']");
			
			
			that.pt.find("select[name='label_type']").change(function() {
			    var valueSelected = this.value;
			    var radio_obj = that.data.scrollObj.radio_obj;
			    console.log("value : " + valueSelected);
			    that.data.label_type = valueSelected;
/* 			    if(valueSelected == "Segmentation") {
			    	label_type = "polygon";
			    } else if(valueSelected == "Bounding box"){
			    	label_type = "box";
			    }
			     */
			     var page_num = 0;
				that.getAnnotationList(that.data.label_type, page_num);
			    if(Object.keys(radio_obj).length == 1){
					that.pt.find(".sub_wrap .box_wrap").html("");
					that.pt.find(".sub_wrap .box_wrap").removeClass("border");
					that.pt.find(".sub_wrap .description_wrap").html("");
					that.pt.find(".sub_wrap .description_wrap").removeClass("border");	
					that.pt.find(".submit_btn").hide();				
					/* that.getAlgorithmList(); */
					algorithm_select.attr("disabled", "disabled");			    	
			    } 
			});
			
			if($("#project_upload .radioBtn.selected").length == 0){
				that.pt.find(".sub_wrap .box_wrap").html("");
				that.pt.find(".sub_wrap .box_wrap").removeClass("border");
				that.pt.find(".sub_wrap .description_wrap").html("");
				that.pt.find(".sub_wrap .description_wrap").removeClass("border");	
				that.pt.find(".submit_btn").hide();				
				
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
				/* that.getAlgorithmList(); */
			};
			
		},		
		

	}
</script>
