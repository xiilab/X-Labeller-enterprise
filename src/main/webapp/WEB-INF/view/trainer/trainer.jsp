<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/header" flush="false" >
<jsp:param name= "cur_page" value="trainer"/>
</jsp:include>
<head>



<title>X-labeller</title>

<style>

.ztree .level0 span.button[id$=ico] { background: url("images/icon_tree_task_folder.png") !important; }
		.ztree a.curSelectedNode.level0  span.button[id$=ico] { background: url("images/icon_tree_task_folder_white.png") !important; }
		.ztree .level1 span.button[id$=ico] { background: url("images/icon_tree_task.png") !important; }
		.ztree a.curSelectedNode.level1  span.button[id$=ico] { background: url("images/icon_tree_task_white.png") !important; }


#trainer {min-height: calc(100% - 66px);}
#trainer .min_w1440 { position: absolute; height: 100%; }
#trainer .contents { height: 100%; }
#trainer .contents>div { height: 100%; }
#trainer .trainer_area{width: 100%;}
#trainer .trainer_area .section{ display: none; height: 100%; }
#trainer .trainer_area .section.selected{ display: block; }


.ztree .nodata-wrap { height: 100%; }
.ztree .nodata-wrap > div { margin: 0 auto; }
.ztree .nodata-wrap > div > div { color: #777777 !important; }
.ztree .nodata-wrap > div > div:first-of-type { margin-top: 10px; font-size: 16px !important; font-weight: 300;  font-family: Open_Sans;}
.ztree .nodata-wrap > div > div:last-of-type { font-weight: 200; font-family: Open_Sans;}

.dragOver #main .main_wrap .drop_image {background-image : url('./images/img_dragdrop_white.png'); box-shadow: 0 6px 19px -7px rgba(25, 140, 255, 0.6); background-color: #81a8ff; border-color: #81a8ff;}
.dragOver #main .main_wrap .main_txt { color: #4c84ff;}
</style>

</head>
<body>


	<div class="container" id="trainer">

		<div class="min_w1440 min_h640">
			<div class="contents flex">
				<div class="ws_wrap">
					<jsp:include page="/workspace" flush="false" />
				</div>
				<div class="section_wrap trainer_area">
					<div class="section trainer_main">
						<jsp:include page="/trainer/main" flush="false" />
					</div>
					<div class="section trainer_upload">
						<jsp:include page="/trainer/upload" flush="false" />
					</div>
					<div class="section trainer_detail">
						<jsp:include page="/trainer/detail" flush="false" />
					</div>
					<div class="section project_upload">
						<jsp:include page="/project/upload" flush="false" />
					</div>
					<div class="section project_list">
						<jsp:include page="/project/list" flush="false" />
					</div>
					<div class="section task_detail">
						<jsp:include page="/task/detail" flush="false" />
					</div>
					<div class="section task_run">
						<jsp:include page="/task/run" flush="false" />
					</div>
					<div class="section task_list">
						<jsp:include page="/task/list" flush="false" />
					</div>
					<div class="section task_inherit">
						<jsp:include page="/task/inherit" flush="false" />
					</div>				
					<!-- mAP 임시 -->
					<div class="section task_map">
						<jsp:include page="/task/map" flush="false" />
					</div>								
				</div>
			</div>
		</div>
	</div>
</body>


<script>
	$(document).on("sessionLoad", function() {
		var that = trainer;
		if(!loginCheck()){
			alert("로그인 후 이용 가능합니다");
			location.href = baseUrl + "login";
		} else {
			$("#loader").show();
			createObject();		
			workspace(that.data.initObj);
			trainer.init();
		}
	});
// 	var obj;						// jh.sa 210223 obj => that.data.initObj
// 	var hide_level;					// jh.sa 210223 hide_level => that.data.hide_level
// 	var hide_id;					// jh.sa 210223 hide_id => that.data.hide_id
// 	var quick_task_id;				// jh.sa 210223 quick_task_id => that.data.quick_task_id
// 	var quick_pId;					// jh.sa 210223 quick_pId => that.data.quick_pId
// 	var quick_task_data;			// jh.sa 210223 quick_task_data => that.data.quick_task_data
	
// 	let code;						// jh.sa 210223 code => that.data.code
// 	let message;					// jh.sa 210223 message => that.data.message

	var trainer = {
		pt : $("#trainer"),
		data : {
				initObj : null,
				hide_level : null,
				hide_id : null,
				quick_task_id : null,
				quick_pId : null,
				quick_task_data : null,
				code : null,
				message : null,
		},
		init : function() {
			var that = trainer;		
			
// 			that.getQuickTaskList();
			that.defaultListener();
			that.setView();		
// 			that.quickInferenceList();
		
		},
		
		nodata : function(){
			let that = this;	

			let html = "<div class='nodata-wrap flex'><div><img class='' src='<c:url value='/images/icon_nodata_dataset.png' />'><div>No Project</div><div>Please create new Project</div></div></div>"
			that.pt.find(".ztree").append(html);

		},
		
		quickInferenceList : function(data){
			let that = this;
			let node_name;
			let select_node_name;
			let trigger_node;
			
			console.log("데이터 : ", data);

			
			if(sessionStorage.length > 0){
				if(sessionStorage.selected_task_id != undefined || sessionStorage.selected_task_id != null) {
					that.data.quick_task_id = sessionStorage.selected_task_id;
					that.data.quick_pId = sessionStorage.selected_pId;
					console.log("quick_task_id: ", that.data.quick_task_id);
					console.log("quick_poject_id: ", that.data.quick_pId);

					
					that.list("1", sessionStorage);	
					
	 				let project_node = wsObj[that.data.initObj.key].dir.getNodeByParam("id",that.data.quick_pId);
	 				console.log("project_node :: ", project_node);
					that.refreshTask(project_node);
	 				wsObj[that.data.initObj.key].dir.selectNode(project_node);
// 	 				wsObj[that.data.initObj.key].dir.expandNode(project_node);
				
					sessionStorage.clear();						// 나중에 세션에 다른 값을 저장해야 할 경우 해당 값만 삭제해야 함
				} else if(sessionStorage.selected_task_id == undefined || sessionStorage.selected_task_id == null){
					return false;
				};					
			}	
		},
		
		defaultListener : function(){
			var that = trainer;
			
			$("input").off("input").on("input",function(e){
				//영문, 숫자, 특수문자
				if($(this).val().match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
					alert("영문과 특수문자 및 숫자만 입력 가능합니다");
				}					
				var str = $(this).val().replace(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/gi,"");				
// 				var str = $(this).val();
				if(str.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
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
				
				return;
			});
			
			$("textarea").off("input").on("input",function(e){
				//영문, 숫자, 특수문자
				var str = $(this).val().replace(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/gi,"");
// 				var str = $(this).val();
				if(str.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ \n]/)){
					alert("영문과 특수문자 및 숫자만 입력 가능합니다");
					$(this).val(str.slice(0, -1));
				} else {
					$(this).val(str);
				}
				
				if ($(this).data("length") == 200 && $(this).val().length > 200){
					var string = $(this).val();
					alert("입력 가능한 텍스트 개수를 초과하였습니다\n중간에 입력하신 경우 기존 텍스트의 마지막 글자를 삭제합니다");
					$(this).val(string.slice(0,200));
					return false;	
				}				
				
				return;
			});
		},

		setView : function() {
			var that = trainer;			
			that.main();
		},

		
		main : function(){
			var that = trainer;
			that.hideView();
			that.addView($(".trainer_main"));
		},

		upload : function(id) {
			var that = trainer;
			let pos = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].level;
			let node = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0];
			let nodes = wsObj[that.data.initObj.key].dir.getSelectedNodes();
			if(nodes.length != 1){
				alert("한 개의 Task만 선택해주세요");
				return false;
			}
			var that = trainer;
			if (pos == "0") {
				that.hideView();
				that.addView($(".project_upload"));
				project_upload.init(node);
			}
			
			that.data.hide_level = pos;
		},

		create : function() {
			var that = trainer;
			that.hideView();
			that.addView($(".trainer_upload"));
			trainer_upload.init();
			
			that.data.hide_level = "0";
		},
		
		inherit : function(id) {
			var that = trainer;
			
			let inherit_id;
			let pos
			let node = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0];
			let nodes = wsObj[that.data.initObj.key].dir.getSelectedNodes();
			if(nodes.length != 1){
				alert("한 개의 Task만 선택해주세요");
				return false;
			}
			if (id == null) {
				inherit_id = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].task_id;
				if(inherit_id == 1) {
					alert("Inheritance가 불가능한 Task입니다.");
					return false;	
				}
				pos = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].level;
			} else {
				inherit_id = id;
				if(inherit_id == 1) {
					alert("Inheritance가 불가능한 Task입니다.");
					return false;	
				}
				pos = 1;
			}
			if (pos == "1") {
				that.hideView();
				that.addView($(".task_inherit"))
				console.log("inherit_id : ",inherit_id);
				task_inherit.init(node, inherit_id);
			}
			
			that.data.hide_level = pos;
		},		

		run : function() {
			var that = trainer;
			let nodes = wsObj[that.data.initObj.key].dir.getSelectedNodes();
			if(nodes.length != 1){
				alert("한 개의 Task만 선택해주세요");
				return false;
			}
			that.hideView();
			that.addView($(".task_run"));
			task_run.init(wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].task_id);
			
			that.data.hide_level = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].level;
			
			//console.log("task_run.init(wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].id);;;", wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].task_id);
		},

		detail : function(id,isTaskList) {
			var that = trainer;
		
			let detail_id;
			let pos;
			let nodes = wsObj[that.data.initObj.key].dir.getSelectedNodes();
			if(nodes.length != 1){
				alert("한 개의 Task만 선택해주세요");
				return false;
			}
			if(isTaskList){
				detail_id = id;
				that.hideView();
				that.addView($(".task_detail"));
				task_detail.init(detail_id);
			} else {
				//console.log("wsObj[that.data.initObj.key].dir.getSelectedNodes()[0]:::::", wsObj[that.data.initObj.key].dir.getSelectedNodes()[0]);
				//console.log("algorithm_id :::::", algo_id);
				
				pos = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].level;
				if(pos == 0){
					detail_id = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].project_id;
				} else if(pos == 1){
					detail_id = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].task_id;
				}
				/* if (id == null) {
					detail_id = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].id;
					pos = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].level;
				} else {
					detail_id = id;
					pos = 1;
				} */
				if (pos == "0") {
					that.hideView();
					that.addView($(".trainer_detail"))
					trainer_detail.init(detail_id);
				} else if (pos == "1") {
					that.hideView();
					that.addView($(".task_detail"))
					task_detail.init(detail_id);
				}
				
				that.data.hide_level = pos;
			}

		},
		
		map : function() {
			var that = trainer;
			let nodes = wsObj[that.data.initObj.key].dir.getSelectedNodes();
			if(nodes.length != 1){
				alert("한 개의 Task만 선택해주세요");
				return false;
			}
			
			that.hideView();
			that.addView($(".task_map"));
			task_map.init(wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].task_id);
			
			that.data.hide_level = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].level;	
		},

		list : function(cur_pos, cur_id) {
			var that = trainer;
			let nodes = wsObj[that.data.initObj.key].dir.getSelectedNodes();
			if(nodes.length != 1){
				alert("한 개의 Task만 선택해주세요");
				return false;
			}
			that.hideView();
			let pos;
			let list_id;

			if(sessionStorage.selected_task_id != undefined || sessionStorage.selected_task_id != null) {

					if(cur_pos != null){
						pos = cur_pos;
						list_id = cur_id.selected_task_id;
					} else {
						pos = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].level;
						list_id = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].id;
					}
					if (pos == "0") {
						that.addView($(".project_list"));
						let node = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0];
						project_list.init(list_id,node);
					} else {
						that.addView($(".task_list"));
						task_list.init(list_id);
					}		
					
// 					let project_node = wsObj[that.data.initObj.key].dir.getNodeByParam("id",cur_id.selected_pId);
// 					console.log("project_node :: ", project_node);
// 					wsObj[that.data.initObj.key].dir.selectNode(wsObj[that.data.initObj.key].dir.getNodeByParam("id",cur_id.selected_pId));
// 					console.log(wsObj[that.data.initObj.key].dir.selectNode(wsObj[that.data.initObj.key].dir.getNodeByParam("id",cur_id.selected_pId)));
// 					that.refreshProject(wsObj[that.data.initObj.key].dir.getNodeByParam("id",cur_id.selected_pId));
					
			} else if(sessionStorage.selected_task_id == undefined || sessionStorage.selected_task_id == null){
					if(cur_pos != null){
						pos = cur_pos;
						list_id = cur_id;
					} else {
						pos = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].level;
						if(pos == 0){
							list_id = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].project_id;
						} else if(pos == 1){
							list_id = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].task_id;
						}
					}
					if (pos == "0") {
						that.addView($(".project_list"));
						let node = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0];
						project_list.init(list_id,node);
					} else {
						that.addView($(".task_list"));
						task_list.init(list_id);
					}
			};		
			that.data.hide_level = pos;
		},

		del : function(){
			var that = trainer;
			let pos = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].level;
			
			let nodes = wsObj[that.data.initObj.key].dir.getSelectedNodes();
			console.log("nodes:: ", nodes);
			that.data.hide_id = "";
			var hide_id = that.data.hide_id;
			var hide_level = that.data.hide_level;
			let deArr = [];
			
			var msg = "삭제하시겠습니까?";
			
			if(confirm(msg) == true){
				if(pos =="0"){
					if(nodes[0].project_id == "1" || nodes[0].project_id == "2" || nodes[0].project_id == "3" || nodes[0].project_id == "4"){
						alert("기본으로 제공되는 프로젝트는 삭제하실 수 없습니다.");
						return false;
					} else {
						//project Delete
						for(var i=0; i<nodes.length;i++){
							deArr.push(that.deleteTrainer(nodes[i], "project/deleteProject.json"));
						}
						
						Promise.all(deArr).then(function(value){
							trainer.refreshProject();
							var code = that.data.code;
							var message = that.data.message;
							
							console.log(hide_level, hide_id);
							if(hide_level == "0"){
								let arr = hide_id.split(",");
								for(let i=0;i<arr.length; i++){
									if(arr[i] == cur_id){
										that.hideView();
										that.main();
										break;
									}
								}
							}
							
							if(code == "200") {
								alert(message);
								return false;
							}
							else if(code == "5098") {
								alert(message);
								that.data.message = "";
								return false;
							}
							else if(code == "4505") {
								alert(message);
								return false;
							}
						},function (err){
							alert("다시 시도해주세요");
							console.log("Sync Error", err);
							return ;
						});						
					}
				} else if(pos == "1"){
					if(nodes[0].task_id == "1" || nodes[0].task_id == "2" || nodes[0].task_id == "3" || nodes[0].task_id == "4"){
						alert("기본으로 제공되는 프로젝트의 task는 삭제하실 수 없습니다.");
						return false;
					} else {
						//Task Delete
						for(var i=0; i<nodes.length;i++){
							deArr.push(that.deleteTrainer(nodes[i], "task/deleteTask.json"));
						}
						
						Promise.all(deArr).then(function(value){
							var code = that.data.code;
							var message = that.data.message;
							
							trainer.refreshTask();
							if(hide_level == "1"){
								let arr = hide_id.split(",");
								for(let i=0;i<arr.length; i++){
									if(arr[i] == task_id){
										that.hideView();
										that.main();
										break;
									}
								}
							}
							if(code == "200") {
								alert(message);
								return ;
							}
							else if(code == "4505") {
								alert(message);
								message = "";
								return false;
							}
							else if(code == "5098") {
								alert(message);
								message = "";
								return false;
							}
							
						},function (err){
							alert("다시 시도해주세요");
							console.log("Sync Error", err);
							return ;
						});						
					}					
					
				}
			}
	
		},
		
		deleteTrainer: function(current_node, url){
			var that = trainer;
			var current_id;
			var ajaxData = {};
			var hide_id = that.data.hide_id;
			
			if(url == "project/deleteProject.json"){
				current_id = current_node.project_id;
				ajaxData = {
						project_id : current_id	
				}
			} else if(url == "task/deleteTask.json"){
				current_id = current_node.task_id;
				ajaxData = {
						task_id : current_id	
				}
			}
			
			if(hide_id == "" || hide_id == null){
				if(current_node.level == 0){
					that.data.hide_id += ""+current_node.project_id;	
				} else if(current_node.level == 1){
					that.data.hide_id += ""+current_node.task_id;	
				}
			} else {
				if(current_node.level == 0){
					that.data.hide_id += ","+current_node.project_id;
				} else if(current_node.level == 1){
					that.data.hide_id += ","+current_node.task_id;
				}
			}
			$("#loader").show();
			let deffered = $.ajax({
				url : baseUrl + url,
				data : ajaxData,
				type : "POST",
				success : function(res){
					console.log("=====deleteTrainer======", res);
					$("#loader").hide();
					var code = that.data.code;
					var message = that.data.message;
					that.data.code = res.result.code;
					if(code == "4505") {
						that.data.message = res.result.data;
					}
					else if(code == "5098") {
						that.data.message = res.result.data;
					} else if(code == "200") {
						that.data.message = res.result.data;
					} else if(code == "2001") {
						that.data.message = res.result.data;
					}
				},
				error : function(err){
					$("#loader").hide();
				}
			});
			return deffered;
		},
		
		refreshProject : function(){
			var that = trainer;
			wsObj[that.data.initObj.key].init();
		},
		
		refreshTask : function(current_node){
			var that = trainer;
			
			let parent_node;
			if(current_node != null){
				parent_node = current_node;
				wsObj[that.data.initObj.key].dir.removeChildNodes(parent_node);
			} else {
				parent_node = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0].getParentNode();
				wsObj[that.data.initObj.key].dir.removeChildNodes(parent_node);
			}
			
			that.getTaskList(parent_node, "true");
		},

		addView : function(view) {
			view.addClass("selected");
		},

		hideView : function() {
			$("#trainer .section_wrap .section").each(function() {
				let view = $(this)
				view.removeClass("selected");
			});
		},
		
		getQuickTaskList : function(){
			var that = trainer;
			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/getTaskList.json",
				data : { project_id : null },
				type : "POST",
				success : function(res) {
					console.log("=====getQuickTaskList======", res);
					$("#loader").hide();
					that.data.quick_task_data = res;
					console.log("quick_task_data:::: ", that.data.quick_task_data);
				},
				error : function(err) {
					$("#loader").hide();
					console.log("ERROR!!", err);
				},
			})
		},
		
		getTaskList : function(current_node, data) {
			var that = trainer;
			let url = "task/getTaskList.json"
			
			
			let parentNode;
			let ajaxData;
			
			if(data != null){
				if(current_node != null){
					parentNode = current_node;
					ajaxData = {
						project_id : parentNode.project_id
					}
				} else {
					parentNode = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0];
					ajaxData = {
						project_id : parentNode.pId
					}
				}
			} else {
				parentNode = wsObj[that.data.initObj.key].dir.getSelectedNodes()[0];
				ajaxData = {
					project_id : parentNode.project_id
				}
			}
			
			that.getDataList(url, ajaxData, parentNode);
		},

		getProjectList : function() {
			var that = trainer;
			let url = "project/getProjectList.json"
			that.getDataList(url);
		},

		getDataList : function(url, ajaxData, parentNode) {
			var that = trainer;
			that.setProgressbarVisible(parentNode);
			$("#loader").show();
			$.ajax({
				url : baseUrl + url,
				data : ajaxData,
				success : function(res) {
					console.log("=====getDataList======", res);
					$("#loader").hide();
					if(res.result.code == "200"){
						if (res.projectVO != undefined) {
							that.setProjectResult(res.result.data);
							that.quickInferenceList(res.result.data);
						} else if (res.taskVO != undefined) {
							that.setTaskResult(res.result.data, parentNode);
						} else {
							alert(res.result.data);
						}

						that.setProgressbarGone(parentNode);						
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}	
					

				},
				error : function(err) {
					$("#loader").hide();
					that.setProgressbarGone(parentNode);
					console.log("ERROR!!", err);
				},
			});

		},

		setProgressbarGone : function(node) {
			var that = trainer;
			if (node != null) {
				node.icon = "";
				wsObj[that.data.initObj.key].dir.updateNode(node);
			}
		},

		setProgressbarVisible : function(node) {
			var that = trainer;
			if (node != null) {
				node.icon = baseUrl + "css/img/loading.gif";
				wsObj[that.data.initObj.key].dir.updateNode(node);
			}
		},

		setProjectResult : function(data) {
			var that = trainer;
			var config = new Array();
			if(data.length == 0){
				that.nodata();
			}
			$.each(data, function(index, value) {
				var obj = new Object();
				obj.project_id = value.project_id;
				obj.pId = null;
				obj.name = value.title;

				obj.type = "project";
				obj.isParent = true;
				obj.drag = true;
				obj.dropPrev = false;
				obj.dropNext = false;
				obj.nodeMove = false;
				
				config.push(obj);
			});

			wsObj[that.data.initObj.key].addNode(null, config);
			$("#loader").hide();
		},

		setTaskResult : function(data, parentNode) {
			var that = trainer;
			var config = new Array();
			$.each(data, function(index, value) {
				var obj = new Object();
				obj.task_id = value.task_id;
				obj.pId = parentNode.project_id + "." + value.task_id;
				obj.project_id = value.project_id;
				obj.name = value.title;
				obj.type = "task";

				obj.isParent = false;
				obj.drag = true;
				obj.dropPrev = false;
				obj.dropNext = false;
				obj.nodeMove = false;
				
				config.push(obj);
			});
			wsObj[that.data.initObj.key].addNode(parentNode, config);
		},

	}

	var createObject = function() {

		var that = trainer;

		let arr = {};
		let arr2 = {};
		let result = [];

		arr["expandNode"] = that.getProjectList			

		arr["drop"] = {
			"area" : "trainer_area",
			"onDrop" : that.detail
		}
		
		arr["rMenu"] = {
			"Create Task" : that.upload,
			"Modify" : that.detail,
			"View List" : that.list,
			"Delete" : that.del
		}

		arr2["expandNode"] = that.getTaskList			

		arr2["drop"] = {
			"area" : "trainer_area",
			"onDrop" : that.detail
		}
		
		arr2["rMenu"] = {
			"Training" : that.detail,
			"Start Inference" : that.run,
			"Inference List" : that.list,
			"Delete" : that.del,
			"Inheritance" : that.inherit,
 			"Compute Score" : that.map
		}

		result.push(arr);
		result.push(arr2);

		that.data.initObj = {
			key : "trainer",
			pointer : "ws_wrap",
			info : result,
			create : that.create
		}
	}
	
	
	LinkedList.prototype.push = function(value, id) {
		 
		 const newNode = new Node(value, null, this.tail);
		 if (this.tail) this.tail.next = newNode;
		 else this.head = newNode;
		 this.tail = newNode;
		 this.length += 1;
		

		 this.obj[id] = newNode;
		 
	};
	
	LinkedList.prototype.removeNode = function(removeNode) {
		let node = removeNode;
		this.length = this.length -1;
		prev = node.prev;
		next = node.next;

		if(prev != null){
			if(next != null){
				next.prev = prev;
			}
		} else{
			next.prev = null;
			if(next != null){
				this.head = next;	
			} else {
				this.head = null;
			}
			
		}
		
		if(next != null){
			if(prev != null){
				prev.next = next;
			}
		} else {
			prev.next = null;
			if(prev != null){
				this.tail = prev;	
			} else {
				this.tail = null;
			}
			
		}
	};
	
	function LinkedList(){
		this.head = null;
		this.tail = null;
		this.length = 0;
		this.obj = [];
	};
	
	function Node(value, next, prev){
		this.value = value;
		this.next = next;
		this.prev = prev;
	};
</script>
