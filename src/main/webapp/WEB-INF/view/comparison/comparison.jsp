<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/header" flush="false" >
	<jsp:param name= "cur_page" value="comparison"/>
</jsp:include>

<link rel="stylesheet" href="<c:url value="/css/goldenlayout-base.css" />">
<link rel="stylesheet" href="<c:url value="/css/goldenlayout-light-theme.css" />">
<script src="<c:url value="/js/goldenlayout.js" />"></script>
<script src="<c:url value= "/js/echarts-all-3.js"/>"></script>

<head>
	<title>밀리터리 이미지넷 객체 라벨기</title>
	
	<style>
		#workspace #dir_wrap .ztree { height: 100% !important; }
		.ztree .level0 span.button[id$=ico] { background: url("images/icon_tree_task_folder.png") !important; }
		.ztree a.curSelectedNode.level0  span.button[id$=ico] { background: url("images/icon_tree_task_folder_white.png") !important; }
		.ztree .level1 span.button[id$=ico] { background: url("images/icon_tree_task.png") !important; }
		.ztree a.curSelectedNode.level1  span.button[id$=ico] { background: url("images/icon_tree_task_white.png") !important; }

		.dragOver #main .main_wrap .drop_image {background-image : url('images/img_dragdrop_white.png'); box-shadow: 0 6px 19px -7px rgba(25, 140, 255, 0.6); background-color: #81a8ff; border-color: #81a8ff;}
		.dragOver #main .main_wrap .main_txt { color: #4c84ff;}

		#comparison { min-height: calc(100% - 66px); }
		#comparison .min_w1440 { position: absolute; height: 100%; }
		#comparison .contents { height: 100%; }
		#comparison .contents>div { height: 100%; }
		#comparison .section_wrap{width: 100%; height: 100%; }
		#comparison .trainer_area .lm_goldenlayout { background: #ffffff; }
		#comparison .trainer_area .lm_content {overflow: overlay; background: #ffffff;} 
		#comparison .drop_area { width: 100%; }
	</style>
</head>
<body>
	<div class="container" id="comparison">
		<div class="min_w1440">
			<div class="contents flex">
				<div class="">
					<jsp:include page="/workspace" flush="false" />
				</div>
				<div class="drop_area">
					<div class="section_wrap trainer_area">
					</div>				
				</div>
			</div>
		</div>
		
	</div>


</body>
<script>
	$(document).on("sessionLoad", function() {
		
		if(!loginCheck()){
			alert("로그인 후 이용 가능합니다.");
			location.href = baseUrl + "login";
		} else {
// 			comparison.init();
			
			var setting = {
				key : "comparison",
				info : [
					{expandNode : comparison.getProjectList, drop : { area : "drop_area", onDrop : comparison.openNode, }, },
					{expandNode : comparison.getTaskList, drop : { area : "drop_area", onDrop : comparison.openNode, }, },
				], 
			};
			workspace(setting);
			comparison.init(setting);
		}
		
	});
// 	var setting;
// 	var objArr = new Object();
	var comparison = {
		pt : $("#comparison"),
		layout : {},
		data : {
			setting : {},
		},
		init : function(setting) {
			var that = this;
			var config = { settings: {showPopoutIcon: false, showMaximiseIcon: false, showCloseIcon: false}, content: [] };
			/* console.log("config::", config); */
			that.data.setting = setting;
			that.layout = new window.GoldenLayout( config, $('.trainer_area') );
			that.layout.on('stateChanged', function(e){
				if(that.pt.find("#main").length>0){
					that.pt.find(".main").hide();
				}
				if($(".lm_stack").length == 0){
					that.pt.find(".main").show();
				}
				
				//그래프 resize
				var stackList = that.layout.container.find(".lm_stack");
				console.log("stackList::", stackList);
				/*$.each(stackList, function(index, value){
 					console.log("index::", index);
					console.log("value::", value);
					var uuid = $(value).find(".container").attr("id");
					console.log("uuid:" + uuid);
					if(uuid == undefined || null) {
						alert("데이터를 불러오는데 실패했습니다.\n다시 한번 시도해주시길 바랍니다.");
						return true;
					}
					var w = $(value).find("#taskGraph").width();
					console.log("w:" + w);
					if(w == undefined || null) {
						alert("데이터를 불러오는데 실패했습니다.\n다시 한번 시도해주시길 바랍니다.");
						return true;
					}
					
					flag = false;
					if(w>700){
						w=700;
					}
					var h = w*(2/3);
					
 					if($(value).find(".graph").children().length>0){
						objArr[uuid].resize(w,h);
						console.log("objArr[uuid]::", objArr[uuid]);
						console.log("resize!!");
					} else {
						objArr[uuid].init(w,h);
						console.log("objArr[uuid]::", objArr[uuid]);
						console.log("init!!");
					} 
				});*/
			});
			
			var cnt = 0;
			that.layout.registerComponent( 'comparison', function( container, state ){
				container.getElement().load("comparison/graph?id="+state.task_id+"&uuid=comparison_"+(++cnt));
				
			});
				
			that.layout.init();
			
			//브라우저 크기조절 이벤트
			$(window).resize(function(e){
				var width = that.pt.find(".section_wrap").width()-220;
				console.log(width);
				that.layout.updateSize(width);
			});
			
			that.pt.find(".lm_root").append("<div class='main'></div>");
			$(".main").load("comparison/main");
			
// 			that.getTestData();
// 			that.getTestData2();
		},
		
		event : function(){
			var that = comparison;
		},
		
		openNode: function(){
			var that = comparison;
			var selected_node = $(".curSelectedNode");
			if(selected_node.hasClass("level0")){
				alert("그래프 생성을 위해 Project의 하위 Task를 선택해주세요");
				return false;
			} 				
		},		
		
		getTaskList : function() {
			
			var that = comparison;
			var url = "task/getTaskList.json"
			
			var parentNode;
			var ajaxData;
			
			parentNode = wsObj[that.data.setting.key].dir.getSelectedNodes()[0];
			ajaxData = {
				project_id : parentNode.project_id
			}
			
			that.getDataList(url, ajaxData, parentNode);
		},

		getProjectList : function() {
			var that = comparison;
			var url = "project/getProjectList.json"
			that.getDataList(url);
		},

		getDataList : function(url, ajaxData, parentNode) {
			var that = comparison;
			
			//로딩처리 시작
			if(parentNode != null){
				parentNode.icon = baseUrl + "css/img/loading.gif";
				wsObj[that.data.setting.key].dir.updateNode(parentNode);
			}

			$.ajax({
				url : baseUrl + url,
				data : ajaxData,
				success : function(res) {
					console.log("=====getDataList======", res);
					if(res.result.code == "3301"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} 
					if(res.result.code == "200"){
						if (res.projectVO != undefined) {
							that.setProjectResult(res.result.data);
						} else if (res.taskVO != undefined) {
							that.setTaskResult(res.result.data, parentNode);
						} else {
							alert(res.result.data);
						}
						
						//로딩처리 시작
						if(parentNode != null){
							parentNode.icon = "";
							wsObj[that.data.setting.key].dir.updateNode(parentNode);
						}						
					} else {
						alret(res.result.data);
					}
				},
				error : function(err) {
					that.setProgressbarGone(parentNode);
					console.log("ERROR!!", err);
				},
			});

		},
		
		setProjectResult : function(data) {
			var that = comparison;
			var config = new Array();
			$.each(data, function(index, value) {
				var obj = new Object();
				obj.project_id = value.project_id;
				obj.pId = null;
				obj.name = value.title;

				obj.type = "project";
				obj.isParent = true;
				config.push(obj);
			});

			wsObj[that.data.setting.key].addNode(null, config);
		},

		setTaskResult : function(data, parentNode) {
			var that = comparison;
			var config = new Array();
			$.each(data, function(index, value) {
				var obj = new Object();
 				obj.task_id = value.task_id; 
/*  				obj.id = value.title; */					// jh.sa : value.id 에서 vlaue.title 로 변경, 그래프 상단 title탭에 task id로 나오던 문제 수정
				obj.pId = parentNode.project_id + "." + value.task_id;
				obj.project_id = value.project_id;
				obj.name = value.title;
				obj.type = "task";

				obj.isParent = false;
				console.log("obj::",obj);
				config.push(obj);
			});
			wsObj[that.data.setting.key].addNode(parentNode, config);
// 			var nodeArr = wsObj["comparison"].dir.getNodesByParam("pId", parentNode.project_id);
			// jh.sa node Arr, each 하위 코드 수정
			var nodeArr = wsObj["comparison"].dir.getNodesByParam("project_id", parentNode.project_id);
			$.each(nodeArr, function(index, value) {
				var element = wsObj["comparison"].pt.find("#"+value.tId)[0];
				console.log("element::",element);
				if(element.className == "level1"){		// jh.sa
					var newItemConfig = {
							title: value.name,
							type: 'component',
							componentName: 'comparison',
							componentState: { task_id: value.task_id }
						};
					comparison.layout.createDragSource(element, newItemConfig);
				} 
			});
		},
		
		guid : function() {
			var that = comparison;
			function s4() {
  				return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
  			}
  			return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
  		},

	}
</script>
