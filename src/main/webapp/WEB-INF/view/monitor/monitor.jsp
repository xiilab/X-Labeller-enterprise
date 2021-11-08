<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/header" flush="false" >
	<jsp:param name= "cur_page" value="monitor"/>
</jsp:include>
<head>
	<title>X-labeller</title>
		
	<style>
		#monitor {width: 100%; height: calc(100% - 64px); position: relative;}
		#monitor .contents {height: calc(100% - 23px); width: 100%; padding-top: 23px;}
		#monitor .contents .list_title {margin: 0 0 24px; font-size: 14px; font-weight: 400; color: #343434; display: inline-block;}
		
		#monitor .empty_wrap {text-align: center; margin-top: 170px; }
		#monitor .empty_wrap .no_image {margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; }
		#monitor .empty_wrap .eng_text {font-family: Open_Sans; margin-bottom: 3px; font-size: 16px; font-weight: 300; color: #777777;}
		#monitor .empty_wrap .kor_text {font-family: Open_Sans; font-size: 12px; color: #777777;  font-weight: 200;}
		#monitor .no_image {height: 37px; background-image: url('./images/icon_nodata_list.png'); }
		
		#monitor .table_body tbody tr button {width: 44px; height: 28px; border-radius: 2px; border: solid 1px #cbcbcb; background-color: #f8f8f8;}
		
		#monitor .list_wrap {height: 100%;}
		#monitor .table_body {max-height: calc(100% - 211px); overflow-y: overlay; overflow-x: hidden; }
		
	</style>
</head>
<body>
	<div class="container" id="monitor">
		<div class="min_w1440 min_h640">
			<div class="contents">
				
				<div class="list_wrap ms">
					<span class="list_title">GPU monitor</span>
					<div class="table_header">
						<table class="anno_table">
							<colgroup>
<%-- 								<col style="width: 100px;"></col> --%>
<%-- 								<col style="width: 100px;"></col> --%>
								<col style="width: 450px;"></col>
								<col style="width: 450px;"></col>
								<col style="width: 150px;"></col>
								<col style=""></col>
								<col style="width: 150px;"></col>
							</colgroup>
							<thead>
								<tr>
<!-- 									<th>PROJECT</th> -->
<!-- 									<th>TASK</th> -->
									<th>PROJECT TITLE</th>
									<th>TASK TITLE</th>
									<th>TYPE</th>
									<th>STATUS</th>
									<th>KILL</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table_body">
						<table class="anno_table">
							<colgroup>
<%-- 								<col style="width: 100px;"></col> --%>
<%-- 								<col style="width: 100px;"></col> --%>
								<col style="width: 450px;"></col>
								<col style="width: 450px;"></col>
								<col style="width: 150px;"></col>
								<col style=""></col>
								<col style="width: 150px;"></col>
							</colgroup>
							<tbody></tbody>
						</table>
					</div>
				</div>
				
			</div>
		</div>
	</div>

</body>
<script>

// 	var gpuArr = [];
// 	var gpuObj = {};

	$(document).on("sessionLoad", function() {
		if(!loginCheck()){
			alert("로그인 후 이용 가능합니다");
			location.href = baseUrl + "login";
		} else {
			monitor.init();
		}
// 		monitor.init();
	});

	var monitor = {
		pt : $("#monitor"),
		data : {
			gpuArr : [],
			gpuObj : {},
		},
		init : function() {
			let that = this;
			that.resetView();
		},
		
		addEmptyData : function(elem, data1, data2){
			let that = this;
			elem.append("<div class='empty_wrap'><div class='no_image'></div><div class='eng_text'>"+data1+"</div><div class='kor_text'>"+data2+"</div></div>")
		},
		
		removeEmptyData : function(elem){
			let that = this;
			elem.find(".empty_wrap").remove();
		},
		
		resetView : function(){
			let that = this;
// 			gpuArr = [];
// 			gpuObj = {};
			that.data.gpuArr = [];
			that.data.gpuObj = {};
			that.pt.find(".table_body tbody").html("");
			that.pt.find(".table_body").scrollTop(0);
// 			that.test();
			
			that.getServiceList();
		},
		
// 		test : function(){
// 			let that = this ;
// 			//test
// 			for(let i = 0; i<100;i++){
// 				that.data.gpuArr.push({id: i, project_title: "title", task_title: "task", type:"t", project_id : "85", status : "running" })
// // 				that.data.gpuArr.push({status : "running" })
// 			}
// 			that.data.gpuArr.push({status:"running"});
// 			that.modifyServiceListData(that.data.gpuArr);
// 			//끝
// 		},
		
		getServiceList : function(){
			let that = this;

			$("#loader").show();
				$.ajax({
					url : baseUrl + "gpuNode/getServiceList.json",
					type : "POST",
					success : function(res) {
						$("#loader").hide();
						console.log("=====getServiceList=====", res);
						
						if (res.result.code == "200") {
							if(res.result.data.length == 0){
								that.addEmptyData(that.pt.find(".list_wrap"), "No Work","No work currently in progress");
							} else {
								that.modifyServiceListData(res.result.data);	
							}
							
						} else if(res.result.code == "2001"){
							alert(res.result.data);
							location.href = baseUrl + 'login';
						}  else {
							alert(res.result.data);
						}
						
					},
					error : function(err) {
						$("#loader").hide();
						console.log("ERROR!!", err);
					}
				});
		},
		
		modifyServiceListData : function(data){
			let that = this;	
			
			
			that.drawServiceList(data);
		},
		
		drawServiceList : function(data) {
			let that = this;
			
			let body = that.pt.find(".list_wrap .table_body table tbody");
			let html = "";
			
			for(let i=0, len = data.length;i<len;i++){
				let curObj = data[i];
				html += " <tr data-id='"+curObj.id+"' data-type='"+curObj.type+"'  > ";
// 				html += " 	<td>"+curObj.project_id+"</td> ";
// 				html += " 	<td>"+curObj.id+"</td> ";
				if(curObj.address == null) {
					html += " 	<td class='address' style = 'display : none;'></td> ";
				} else {
					html += " 	<td class='address' style = 'display : none;'>"+curObj.address+"</td> ";
				}
				if(curObj.project_title == null){
					html += " 	<td>Deleted data</td> ";
				} else {
					html += " 	<td>"+curObj.project_title+"</td> ";
				}
				if(curObj.task_title == null){
					html += " 	<td>Deleted data</td> ";					
				} else {
					html += " 	<td>"+curObj.task_title+"</td> ";
				}
				if(curObj.type == "t"){
					html += " 	<td>training</td> ";
				}else if(curObj.type == "i"){
					html += " 	<td>inference</td> ";
				}else{
					html += " 	<td>-</td> ";
				}
				html += " 	<td>"+curObj.status+"</td> ";
				html += " 	<td><button>kill</button></td> ";
				html += " </tr> ";
			}
			
			
			// test용 
// 			for(let i=0, len = data.length;i<len;i++){
// 				let curObj = data[i];
// 				html += " <tr data-id='"+curObj.id+"' data-type='"+curObj.type+"'  > ";
// // 				html += " 	<td>"+curObj.project_id+"</td> ";
// // 				html += " 	<td>"+curObj.id+"</td> ";
// 				html += " 	<td>coco</td> ";
// 				html += " 	<td>coco</td> ";
// 				html += " 	<td>training</td> ";
// 				html += " 	<td>"+curObj.status+"</td> ";
// 				html += " 	<td><button>kill</button></td> ";
// 				html += " </tr> ";
// 			}
			body.append(html);
			
			that.serviceListener();
		},
		
		serviceListener : function(){
			let that = this;
			
			that.pt.find("tbody td button").off("click").on("click",function(){
				let btn = $(this); 
				let btnId = btn.parent().parent().data("id");
				console.log("btnId::" + btnId);
				let type = btn.parent().parent().data("type");
				if(type == "inference") {
					type = "i";
				} else if (type == "training") {
					type = "t";
				}
				let address = btn.parent().parent().find(".address").text();
				console.log("address : " + address);
				let msg = "사용중인 GPU의 작업을 중단하시겠습니까?";
				console.log(btnId);
				if(confirm(msg)){
					that.killTrain(btnId,type, address);
				};
			});
		},
		
		killTrain : function(btnId,type,address){
			let that = this;
			
			ajaxData = {
					task_id : btnId 
					,type : type
					,address : address
				};

			$("#loader").show();
				$.ajax({
					url : baseUrl + "task/killContainer.json",
					data : ajaxData,
					type : "POST",
					success : function(res) {
						$("#loader").hide();
						console.log("=====killTrain=====", res);
						
						if (res.result.code == "200") {
							that.resetView();
						} else if(res.result.code == "2001"){
							alert(res.result.data);
							location.href = baseUrl + 'login';
						}  else {
							alert(res.result.data);
						}
						
					},
					error : function(err) {
						$("#loader").hide();
						that.resetView();
						console.log("ERROR!!", err);
					}
				});
		},
	};
</script>