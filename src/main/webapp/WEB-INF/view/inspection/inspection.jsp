<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/header" flush="false" >
	<jsp:param name= "cur_page" value="labeller"/>
</jsp:include>
<head>
	<title>X-labeller</title>
	
	<style>
		.ztree .level0 span.button[id$=ico] { background: url("images/icon_tree_dataset_selected.png") !important; }
		.ztree a.curSelectedNode.level0  span.button[id$=ico] { background: url("images/icon_tree_dataset_white.png") !important; }
		.ztree .level1 span.button[id$=ico] { background: url("images/icon-tree-image.png") !important; }
		.ztree a.curSelectedNode.level1  span.button[id$=ico] { background: url("images/icon-tree-image-white.png") !important; }
		.ztree .level2 span.button[id$=ico] { background: url("images/icon_tree_meta_normal.png") !important; }
		.ztree a.curSelectedNode.level2  span.button[id$=ico] { background: url("images/icon_tree_meta_white.png") !important; }
		.ztree .nodata-wrap { height: 100%; }
		.ztree .nodata-wrap > div { margin: 0 auto; }
		.ztree .nodata-wrap > div > div { color: #777777 !important; }
		.ztree .nodata-wrap > div > div:first-of-type { margin-top: 10px; font-size: 16px !important; font-weight: 300; }
		.ztree .nodata-wrap > div > div:last-of-type { font-weight: 200; }
		
	
		#inspection { min-height: calc(100% - 66px); }
		#inspection .min_w1440 { position: absolute; height: 100%; }
		#inspection .contents { height: 100%; }
		#inspection .contents>div { height: 100%; }
		#inspection .drop_area{width: 100%; }
		#inspection .drop_area .section{ display: none; height: 100%; }
		#inspection .drop_area .section.selected{ display: block; }
		
		#workspace #dir_wrap .btn_wrap > div { width: 190px; margin: 0 auto;  font-size: 12px; color: #ffffff; cursor: pointer; }
		#workspace #dir_wrap .btn_wrap .new_btn { width: 90px; margin-right: 10px; border-radius: 4px; background-color: #4c84ff; }
		#workspace #dir_wrap .btn_wrap .import_btn { width: 90px; line-height: 36px; border-radius: 5px; background-color: #4c84ff;  }
		#workspace #dir_wrap .btn_wrap > div > div:hover { background-color: #3A71E9; }
	</style>
</head>
<body>
	<div class="container" id="inspection">
		<div class="min_w1440">
			<div class="contents flex">
				<div class="">
					<jsp:include page="/workspace" flush="false" />
				</div>
				<div class="drop_area">
					<div class="section info selected">
						<jsp:include page="/inspection/main" flush="false" />
					</div>
<%-- 					<div class="section labelList">
						<jsp:include page="/inspection/labelList" flush="false" />
					</div> --%>
<!-- 					<div class="section enrichment"> -->
<%-- 						<jsp:include page="/inspection/enrichment" flush="false" /> --%>
<!-- 					</div> -->
					<div class="section imgBBox">
						<jsp:include page="/inspection/imgBBox" flush="false" />
					</div>
					<div class="section imgSeg">
						<jsp:include page="/inspection/imgSeg" flush="false" />
					</div>
					<div class="section videoBBox">
						<jsp:include page="/inspection/videoBBox" flush="false" />
					</div>											
				</div>
			</div>
		</div>
		
	</div>


</body>

<script>
	$(document).on("sessionLoad", function() {
		if(!loginCheck()){
			alert("로그인 후 이용 가능합니다");
			location.href = baseUrl + "login";
		} else {
			setting = {
				key : "inspection",
				create : inspection.event.upload,
				info : [
					{expandNode : inspection.getDatasetList, drop : { area : "drop_area", onDrop : inspection.event.labelling, }, 
// 						rMenu : { "Labelling TEST" : inspection.event.labelling, "DataList TEST" : inspection.event.list2, "LabelList TEST": inspection.event.labelList2, "Enrichment" : inspection.event.openNode,  "Data List": inspection.event.list, "Label List": inspection.event.labelList, "Modify" : inspection.event.modify, "Add File" : inspection.event.addImg, "Replicate︎" : {"Only Data" : inspection.event.replicate, "With Label" : inspection.event.replicateWith, }, "Delete︎" : {"Dataset": inspection.event.deleteNode, "Data": inspection.event.deleteDataList, "Label" : inspection.event.deleteMetaList}, }, },
						rMenu : { "Enrichment" : inspection.event.labelling, /* "Data List" : inspection.event.list2, "Label List": inspection.event.labelList2,*/ /* "Modify" : inspection.event.modify, */ /* "Add File" : inspection.event.addImg, */ "Replicate︎" : {"Only Data" : inspection.event.replicate, "With Label" : inspection.event.replicateWith, }, "Delete︎" : {"Dataset": inspection.event.deleteNode, "Data": inspection.event.deleteDataList, "Label" : inspection.event.deleteMetaList},}, },
				], 
			};
			workspace(setting);	//트리 그리기
			inspection.init();
			//inspection_imgBBox.init(1);
		}
		
	});
	//var setting
	var inspection = {
		pt : $("#inspection"),
		userLevel : "${userInfo.getLevel_cd()}",
		init : function() {
			var that = this;
			
			var html = "<div class='flex'><div class='new_btn filter_color'>New +</div><div class='import_btn filter_color'>Import</div></div>";
			$("#workspace .btn_wrap").empty();
			$("#workspace .btn_wrap").append(html);
			
/* 			$("#workspace .btn_wrap .new_btn").off("click").on("click", function(){
				that.event.upload();
			});
			$("#workspace .btn_wrap .import_btn").off("click").on("click", function(){
				that.event.imports();
			}); */
			that.bind.evtAll();
		},
		
		event : {
			/* imports : function() {
				var that = inspection;
				var data_modified = that.dataModifiedCheck();        // jh.sa 210129
				if(data_modified){
					that.pt.find("div.section").removeClass("selected");
					var node = ".section.imports";					
					that.pt.find(node).addClass("selected");
					imports.init();
				}				
			},
			
			upload : function(){
				var that = inspection;
				var data_modified = that.dataModifiedCheck();        // jh.sa 210129
				if(data_modified){
					that.pt.find("div.section").removeClass("selected");
					var node = ".section.upload";
					that.pt.find(node).addClass("selected");
					upload.init();					
				}
			},
			
			modify : function() {
				var that = inspection;
				var nodes = wsObj[setting.key].dir.getSelectedNodes();
				var selected_nodes = wsObj["inspection"].dir.getSelectedNodes();
				var data_modified = that.dataModifiedCheck();        // jh.sa 210129
				if(selected_nodes.length != 1){
					alert("한 개의 Dataset만 선택해주세요");
					return false;
				}	
				if(data_modified){
					that.pt.find("div.section").removeClass("selected");
					var node = ".section.modify";
					that.pt.find(node).addClass("selected");
					modify.init(nodes[0]);					
				}
			},
			
			addImg : function(){
				var that = inspection;
				var nodes = wsObj[setting.key].dir.getSelectedNodes();
				var selected_nodes = wsObj["inspection"].dir.getSelectedNodes();
				var data_modified = that.dataModifiedCheck();        // jh.sa 210129
				if(selected_nodes.length != 1){
					alert("한 개의 Dataset만 선택해주세요");
					return false;
				}				
				console.log("addImg nodes:", nodes);
				if(data_modified){
					that.pt.find("div.section").removeClass("selected");
					var node = ".section.addImg";
					that.pt.find(node).addClass("selected");
					
					addImg.init(nodes[0]);					
				}				
			}, */
			
/* 			list : function(){
				var that = inspection;
				var nodes = wsObj[setting.key].dir.getSelectedNodes();
				var selected_nodes = wsObj["inspection"].dir.getSelectedNodes();
				if(selected_nodes.length != 1){
					alert("한 개의 Dataset만 선택해주세요");
					return false;
				}
				
				var data_modified = that.dataModifiedCheck();        // jh.sa 210129
				if(data_modified){
					that.pt.find("div.section").removeClass("selected");
					var node = ".section.list";
					that.pt.find(node).addClass("selected");
					
					dataList.init(nodes[0]);
				}
			}, */
			
			list2 : function(){
				var that = inspection;
				var nodes = wsObj[setting.key].dir.getSelectedNodes();
				var selected_nodes = wsObj["inspection"].dir.getSelectedNodes();
				if(selected_nodes.length != 1){
					alert("한 개의 Dataset만 선택해주세요");
					return false;
				}
				
				var data_modified = that.dataModifiedCheck();        // jh.sa 210129
				if(data_modified){
					that.pt.find("div.section").removeClass("selected");
					var node = ".section.list2";
					that.pt.find(node).addClass("selected");
					
					dataList2.datasetInit(nodes[0].id);
				}
			},			
			
/* 			labelList : function(){
				var that = inspection;
				var nodes = wsObj[setting.key].dir.getSelectedNodes();
				var selected_nodes = wsObj["inspection"].dir.getSelectedNodes();
				if(selected_nodes.length != 1){
					alert("한 개의 Dataset만 선택해주세요");
					return false;
				}
				
				var data_modified = that.dataModifiedCheck();        // jh.sa 210129
				if(data_modified){
					that.pt.find("div.section").removeClass("selected");
					var node = ".section.labelList";
					that.pt.find(node).addClass("selected");
					
					labelList.init(nodes[0]);
					console.log("labelList", nodes);
				}
			}, */
			
			labelList2 : function(){
				var that = inspection;
				var nodes = wsObj[setting.key].dir.getSelectedNodes();
				var selected_nodes = wsObj["inspection"].dir.getSelectedNodes();
				if(selected_nodes.length != 1){
					alert("한 개의 Dataset만 선택해주세요");
					return false;
				}
				
				var data_modified = that.dataModifiedCheck();        // jh.sa 210129
				if(data_modified){
					console.log("selected_nodes:: ", selected_nodes);
					that.getDatasetById("labelList");
				}
			},			

			openNode : function(){
				var that = inspection;
				var nodes = wsObj[setting.key].dir.getSelectedNodes();
				var selected_nodes = wsObj["inspection"].dir.getSelectedNodes();
				if(selected_nodes.length != 1){
					alert("한 개의 Dataset만 선택해주세요");
					return false;
				}
				that.pt.find("div.section").removeClass("selected");
				var node = ".section.enrichment";
				that.pt.find(node).addClass("selected");
				
				enrichment.init(nodes);
			},
			
			labelling : function(){
				var that = inspection;
				var nodes = wsObj[setting.key].dir.getSelectedNodes();
				//console.log("")
				var selected_nodes = wsObj[setting.key].dir.getSelectedNodes();
				var userLevel = that.userLevel;
				if(selected_nodes.length != 1){
					alert("한 개의 Dataset만 선택해주세요");
					return false;
				}
				console.log("selected_nodes:: ", selected_nodes);
				
				var data_modified = that.dataModifiedCheck();        // jh.sa 210129
				if(data_modified){
					that.getDatasetById("labelling");
				}
			},			
			
			copyInfo : { 
				isCopy : false,
				id : "",
				dataset_id : "",
			},
			replicate : function(){
				var that = inspection;
				var nodes = wsObj[setting.key].dir.getSelectedNodes();
				var selected_nodes = wsObj["inspection"].dir.getSelectedNodes();
				if(selected_nodes.length != 1){
					alert("한 개의 Dataset만 선택해주세요");
					return false;
				}				
				that.pasteReplInfo(nodes[0]);
			},
			
			replicateWith : function(){
				var that = inspection;
				var nodes = wsObj[setting.key].dir.getSelectedNodes();
				var selected_nodes = wsObj["inspection"].dir.getSelectedNodes();
				if(selected_nodes.length != 1){
					alert("한 개의 Dataset만 선택해주세요");
					return false;
				}
				var ajaxData = {
						dataset_id : nodes[0].id,					// id => dataset_id(0921)
				}
				$("#loader").show();
				$.ajax({
					url : baseUrl + "data/insertReplicaDataWithMeta.json",
					data : ajaxData,
				   	type : "POST",
				   	success : function(res){
				   		$("#loader").hide();
						console.log("=====insertReplicaDataWithMeta=====", res);
						
						if(res.result.code == "200"){
							alert("데이터셋 복제가 완료되었습니다");
							//트리초기화
							$(".ztree").empty();
							inspection.getDatasetList();
						} else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}							

					},
				   	error : function(err){
				   		$("#loader").hide();
				   		 console.log("ERROR!!", err);
				   	}
				});		
			},
			
			// dataset 삭제
			deleteNode : function(){
				var that = inspection;
				var nodes = wsObj[setting.key].dir.getSelectedNodes();
				
				if (nodes && nodes.length>0) {
					var msg = "삭제하시겠습니까?";
					if (confirm(msg)==true){
						var temp = that.pt.find(".drop_area > .section.selected");
						//노드 삭제시 페이지 이동 ////////////////////////
// 						var worknodes = new Array(); 
// 						if(temp.hasClass("enrichment")){
// 							worknodes = enrichment.data.nodes;
// 						} else if(temp.hasClass("modify")){
// 							worknodes.push(modify.node);
// 						} else if(temp.hasClass("addImg")){
// 							worknodes.push(addImg.node);
// 						}
// 						for(var i=0; i<nodes.length; i++){
// 							for(var j=0; j<worknodes.length; j++){
// 								if(nodes[i] === worknodes[j]){
// 									inspection.pt.find("div.section").removeClass("selected");
// 									var node = ".section.info";
// 									inspection.pt.find(node).addClass("selected");
// 								}
// 							}
// 						}
						var temp = that.pt.find(".drop_area > .section.selected");
						if(temp.length > 0){
							inspection.pt.find(".drop_area > .section").removeClass("selected");
							var node = ".section.info";
							inspection.pt.find(node).addClass("selected");							
						};
						//////////////////////////
						
						// 삭제
						var deleteArr = [];
						for(var i=0; i<nodes.length; i++){
							var url, cData;
							if(nodes[i].level==0){
								url = "deleteDataset";
							}
							deleteArr.push(that.event.deleteAjax(url, nodes[i].id));
						}
						Promise.all(deleteArr).then(function(res){
							console.log("=====res=====", res);
							if(nodes[0].level==0){
								wsObj[setting.key].init();
							}else {
								wsObj[setting.key].dir.removeChildNodes(nodes[0].getParentNode());
								if(nodes[0].level==1){
									var url = "getDataList";
									var pNode = nodes[0].getParentNode()
									var ajaxData = { dataset_id : nodes[0].getParentNode().id };
								}else if(nodes[0].level==2){
									var url = "getMetaList";
									var pNode = nodes[0].getParentNode()
									var ajaxData = { data_id : nodes[0].getParentNode().id };
								}	
								that.getList(url, ajaxData, pNode);
							}
								
						});
					}
				};
			},
			
			// data 삭제
			deleteDataList: function() {
				var that = inspection;
				var nodes = wsObj[setting.key].dir.getSelectedNodes();
				console.log(nodes);
				
				if (nodes && nodes.length>0) {
					var msg = "삭제하시겠습니까?";
					if (confirm(msg)==true){
						var temp = that.pt.find(".drop_area > .section.selected");
						if(temp.length > 0){
							inspection.pt.find(".drop_area > .section").removeClass("selected");
							var node = ".section.info";
							inspection.pt.find(node).addClass("selected");							
						};							
// 						var worknodes = new Array();
// 						if(temp.hasClass("enrichment")){
// 							worknodes = enrichment.data.nodes;
// 						} 
// 						for(var i=0; i<nodes.length; i++){
// 							for(var j=0; j<worknodes.length; j++){
// 								if(nodes[i] === worknodes[j]){
// 									inspection.pt.find("div.section").removeClass("selected");
// 									var node = ".section.info";
// 									inspection.pt.find(node).addClass("selected");
// 								}
// 							}
// 						}
						
						
						var deleteArr = [];
						var url, ajaxData;
						url = "deleteDataInDatasetId";
						for(var i=0; i<nodes.length; i++){
							if(i==0){
								ajaxData = nodes[i].id;	
							} else {
								ajaxData += "," + nodes[i].id;	
							}
						}
						deleteArr.push(that.event.deleteAjax(url, ajaxData));
					}
					
					Promise.all(deleteArr).then(function(res){
						console.log("=====res=====", res);
						if(nodes[0].level==0){
							wsObj[setting.key].init();
						}
					});
				}
			},
			
			// meta 삭제
			deleteMetaList : function(){
				var that = inspection;
				var nodes = wsObj[setting.key].dir.getSelectedNodes();
				console.log("nodes:", nodes[0]);
				
				if (nodes && nodes.length>0) {
					var msg = "삭제하시겠습니까?";
					if (confirm(msg)==true){
						var temp = that.pt.find(".drop_area > .section.selected");
// 						var worknode = enrichment.data.nodes;
// 						console.log("worknode::", worknode);
						// enrichment 페이지에 접근하지 않으면(that.openNode 함수를 거치지 않으면) workspace 리스트 우클릭으로 라벨 삭제 시 오류 수정
						// 열려있는 해당 enrichment 페이지를 닫고 메인 빈 화면을 출력하는 과정 수정
						// jh.sa 201028 추가
						if(temp.length > 0){
							inspection.pt.find(".drop_area > .section").removeClass("selected");
							var node = ".section.info";
							inspection.pt.find(node).addClass("selected");							
						};						
// 						if( worknode != null || worknode != undefined) {		// jh.sa 추가
// 							if(nodes[0] === worknode[0]){
// 								inspection.pt.find("div.section").removeClass("selected");
// 								var node = ".section.info";
// 								inspection.pt.find(node).addClass("selected");
// 							} 							
// 						};

						$("#loader").show();
						$.ajax({
							url : baseUrl + "data/getDataList.json",
							data : {dataset_id : nodes[0].id},
							type : "POST",
							success : function(res){
								console.log("=====getDataList=====", res);
								if(res.result.code == "200"){
									var data = res.result.data;
									var url, ajaxData;
									url = "deleteMetaByDatasetId";
									for(var i=0; i<data.length; i++){
										if(i==0){
			 								ajaxData = data[i].data_id;	
			 							} else {
			 								ajaxData += "," + data[i].data_id;	
			 							}
									}
									var deleteArr = [];
									deleteArr.push(that.event.deleteAjax(url, ajaxData));
									Promise.all(deleteArr).then(function(res){
										console.log("=====res=====", res);
										$("#loader").hide();
										if(nodes[0].level==0){
											wsObj[setting.key].init();
										}
										inspection.init();
									});
								} else if (res.result.code == "2001"){
									alert(res.result.data);
									location.href = baseUrl + 'login';
								} else {
									alert(res.result.data);
									return;
								}
							},
							error : function(err){
								console.log("ERROR!!", err);
							}
						});
					}
				}
						
			},
			
			deleteAjax : function(url, id){
				var deffered;
				if(url == "deleteDataset" || url == "deleteDataInDatasetId"){
					deffered = $.ajax({
						url : baseUrl + "data/"+url+".json",
						data : {dataset_id : id},							// id => dataset_id(0921)
					   	type : "POST",
					   	success : function(res){
							console.log("=====data=====", res);
							if (res.result.code == "2001") {
								alert(res.result.data);
								location.href = baseUrl + 'login';
							} else {
								alert(res.result.data);
							}								
						},
					   	error : function(err){
					   		 console.log("ERROR!!", err);
					   		 alert("삭제 실패하였습니다");
					   	}
					});					
				} else if(url == "deleteMetaByDatasetId"){
					var nodes = wsObj[setting.key].dir.getSelectedNodes();
					/* console.log("nodes:", nodes[0]); */
					deffered = $.ajax({
						url : baseUrl + "data/"+url+".json",
						data : {dataset_id : nodes[0].id},								// id => data_id(0921)
					   	type : "POST",
					   	success : function(res){
							console.log("=====data=====", res);
							if (res.result.code == "2001") {
								alert(res.result.data);
								location.href = baseUrl + 'login';
							} else {
								alert(res.result.data);
							}								
						},
					   	error : function(err){
					   		 console.log("ERROR!!", err);
					   		 alert("삭제 실패하였습니다");
					   	}
					});					
				}
				
				return deffered;
			},
			
			/* moveNode : function(){
				var that = inspection;
				
				var nodes = wsObj[setting.key].dir.getSelectedNodes();
				var dataset_id = nodes[0].pId;
				var id = "";
				for(var i=0; i<nodes.length; i++){
					if(i == 0){
						id += nodes[i].id;
					} else {
						id += "," + nodes[i].id;
					}
				}
				var ajaxData = { 
					id : id,
					dataset_id : dataset_id,
				};
				$.ajax({
					url : baseUrl + "data/updateDataInId.json",
					data : ajaxData,
					success : function(res) {
						console.log("=====updateDataInId=====", res)
					},
					error : function(err) {
						console.log("ERROR!!", err);
					},
				});
				
			}, */ 
			
			//복사붙여넣기
			/* curSrcNode : new Object(),
			curType : new Object(),
			fontCss : function(treeNode) {
				var that = inspection;
				var aObj = $("#" + treeNode.tId + "_a");
				aObj.removeClass("copy").removeClass("cut");
				if (treeNode === that.event.curSrcNode) {
					if (that.event.curType == "copy") {
						aObj.addClass(that.event.curType);
					} else {
						aObj.addClass(that.event.curType);
					}			
				}
			},
			
			setCurSrcNode : function(treeNode, curType) {
				var that = inspection;
				
				if (that.event.curSrcNode) {
					delete that.event.curSrcNode.isCur;
					var tmpNode = that.event.curSrcNode;
					that.event.curSrcNode = null;
					that.event.fontCss(tmpNode);
				}
				that.event.curSrcNode = treeNode;
				if (!treeNode) return;

				that.event.curSrcNode.isCur = true;			
				navObj.cancelSelectedNode();
				that.event.fontCss(that.event.curSrcNode);
			}, */
			//end 복붙
		},
		
		drag : {
			dropPrev : function() {
				return true;				
			},
			dropInner : function() {
				return true;
			},
			dropNext : function() {
				return true;
			},

		},
		
		//replicate
		getReplInfo : function(node) {
			var that = this;
			/* $("#loader").show(); */
			console.log("node: ", node);
			if(node.level==0){
				$.ajax({
					url : baseUrl + "data/getDataList.json",
					data : {dataset_id : node.id},
					type : "POST",
					success : function(res){
						console.log("=====getDataList=====", res);
						if(res.result.code == "200"){
							var id = "";
							var data = res.result.data;
							for(var j=data.length-1; j>=0; j--){
								if(id == ""){
									id = data[j].data_id;
								} else {
									id += "," + data[j].data_id;
								}
							};
							
							that.event.copyInfo.id = id;
							
							that.insertReplInfo(node);
						} else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}							
						$("#loader").hide();

					},
					error : function(err){
						console.log("ERROR!!", err);
					}
				});
			} else {
				return;
			}
		},
		//replicate dataset 생성
		insertReplInfo : function(node) {
			var that = this;
			
			var formData = new FormData();
			formData.append("dataset_id", node.id);						// id => dataset_id(0921)
			formData.append("title", node.title+"_replica");
			formData.append("contents", node.contents);
			
			/* $("#loader").show(); */
			$.ajax({
			   	url :  baseUrl + "data/insertReplicaDataset.json",
			   	data : formData,
			   	type : "POST",
			   	processData : false,
			   	contentType: false,
			   	success : function(res){
			   		
					console.log("=====insertReplicaDataset=====", res);
					 /* $("#loader").hide(); */
					if(res.result.code == "200"){
						/* alert("데이터셋 복제가 완료되었습니다"); */	
						//트리초기화
						$(".ztree").empty();
						/* inspection.getDatasetList(); */
						
						
						that.pasteReplInfo(res.datasetVO.dataset_id);			// datasetVO.id => datasetVO.dataset_id(0921)						
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}						
			   	},
			   	error : function(err){
			   		/* $("#loader").hide(); */
			   		 console.log("ERROR!!", err);
			   	}
			});
		},
		//replicate dataset에 data 삽입
		pasteReplInfo : function(node) {
			var that = this;
			$("#loader").show();
			var ajaxData = {
					/* data_id : that.event.copyInfo.id,			// id => data_id(0921) */
					dataset_id : node.id
			};
			
			$.ajax({
				url : baseUrl + "data/insertReplicaData.json",
				data : ajaxData,
			   	type : "POST",
			   	success : function(res){
			   		$("#loader").hide();
					console.log("=====insertReplicaData=====", res);
					if(res.result.code == "200"){
						alert("데이터셋 복제가 완료되었습니다.");	
						$(".ztree").empty();
						inspection.getDatasetList();	
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}						
				},
			   	error : function(err){
			   		$("#loader").hide();
			   		 console.log("ERROR!!", err);
			   	}
			});		
		},
		//
		
		enrichmentLocation : function(media, label){
			var that = inspection;
			
			var userLevel = that.userLevel;
			console.log("userLevel : " + userLevel);
			var media_type = media;
			var label_type = label; 
			console.log("setting.key::" + setting.key);
			var nodes = wsObj[setting.key].dir.getSelectedNodes();
			console.log("nodes::",  nodes);
			
			console.log("Dataset Types: ",media_type,", ",label_type);
			
			that.pt.find("div.section").removeClass("selected");

			switch (label_type) {
				case "IMAGE_BBOX":
					console.log("IMAGE_BBOX");
					var node = ".section.imgBBox";
					that.pt.find(node).addClass("selected");
					imgBBox.datasetInit(nodes[0].id);
					break;
				case "IMAGE_SEGMENTATION":
					console.log("IMAGE_SEGMENTATION");
					var node = ".section.imgSeg";
					that.pt.find(node).addClass("selected");
					imgSeg.datasetInit(nodes[0].id);
					break;
				case "VIDEO_BBOX":
					console.log("VIDEO_BBOX");
					var node = ".section.videoBBox";
					console.log("that.pt.find(node)::", that.pt.find(node));
					that.pt.find(node).addClass("selected");
					videoBBox.datasetInit(nodes[0].id);
					break;
			}

			// 			if(media_type == "IMAGE"){
			// 				if(label_type == "IMAGE_BBOX"){
			// // 					that.pt.find("div.section").removeClass("selected");
			// 					var node = ".section.imgBBox";
			// 					that.pt.find(node).addClass("selected");

			// 					imgBBox.datasetInit(nodes[0].id);
			// // 					imgBBox.init(nodes);
			// 				} else {
			// // 					that.pt.find("div.section").removeClass("selected");
			// 					var node = ".section.imgSeg";
			// 					that.pt.find(node).addClass("selected");

			// 					imgSeg.datasetInit(nodes[0].id);
			// // 					imgSeg.init(nodes);
			// 				}
			// 			} else {
			// // 				that.pt.find("div.section").removeClass("selected");
			// 				var node = ".section.videoBBox";
			// 				that.pt.find(node).addClass("selected");

			// 				videoBBox.datasetInit(nodes[0].id);
			// // 				videoBBox.init(nodes);
			// 			}
		},

		labelListLocation : function(media, label) {
			var that = inspection;

			var media_type = media;
			var label_type = label;
			var nodes = wsObj[setting.key].dir.getSelectedNodes();

			console.log("Dataset Types: ", media_type, ", ", label_type);

			if (media_type == "IMAGE") {
				if (label_type == "IMAGE_BBOX") {
					that.pt.find("div.section").removeClass("selected");
					var node = ".section.imgBBoxList";
					that.pt.find(node).addClass("selected");

					imgBBoxList.datasetInit(nodes[0].id);
					// 					imgBBox.init(nodes);
				} else {
					that.pt.find("div.section").removeClass("selected");
					var node = ".section.imgSegList";
					that.pt.find(node).addClass("selected");

					imgSegList.datasetInit(nodes[0].id);
					// 					imgSeg.init(nodes);
				}
			} else if (media_type == "VIDEO") {
				that.pt.find("div.section").removeClass("selected");
				var node = ".section.videoBBoxList";
				that.pt.find(node).addClass("selected");

				videoBBoxList.datasetInit(nodes[0].id);
				// 				videoBBox.init(nodes);
			}

		},

		getDatasetById : function(where) {
			var that = inspection;

			var pNode = wsObj[setting.key].dir.getSelectedNodes()[0];
			var ajaxData = {
				dataset_id : pNode.id
			};
			var label_type, media_type, cur_page, isModified;
			var msg = "데이터셋을 이동할 경우 저장되지 않은 가공 데이터는 손실됩니다. 계속하시겠습니까?";
			$("#loader").show();
			$.ajax({
				url : baseUrl + "data/getDatasetById.json",
				data : ajaxData,
				success : function(res) {
					console.log("=====getDatasetById=====", res)
					$("#loader").hide();
					if (res.result.code == "200") {
						label_type = res.result.data.label_type;
						media_type = res.result.data.media_type;
						// 						cur_page = that.pt.find(".section.selected");
						// 					    if($(cur_page).hasClass("imgBBox")){
						// 					    	isModified = imgBBox.data.canvasObj['isModified'];
						// 					    } else if($(cur_page).hasClass("imgSeg")){
						// 					    	isModified = imgSeg.data.canvasObj['isModified'];
						// 					    } else if($(cur_page).hasClass("videoBBox")){
						// 					    	isModified = videoBBox.data.videoObj['isModified'];
						// 					    } else if($(cur_page).hasClass("imgBBoxList")){
						// 					    	isModified = imgBBoxList.data.canvasObj['isModified'];
						// 					    } else if($(cur_page).hasClass("imgSegList")){
						// 					    	isModified = imgSegList.data.canvasObj['isModified'];
						// 					    } else if($(cur_page).hasClass("videoBBoxList")){
						// 					    	isModified = videoBBoxList.data.videoObj['isModified'];
						// 					    }							    
						// 					    if(isModified == 1){
						// 					        if(!confirm(msg)){
						// 					            return false;
						// 					        }
						// 					    };							
						if (where == "labelling") {
							that.enrichmentLocation(media_type, label_type);
						} else if (where == "labelList") {
							that.labelListLocation(media_type, label_type);
						}
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}

					//로딩처리 끝
					// 					console.log("parentNode", parentNode);
					// 					if(parentNode != null){
					// 						console.log("1233");
					// 						parentNode.icon = "";
					// 						wsObj[setting.key].dir.updateNode(parentNode);
					// 					}
				},
				error : function(err) {
					$("#loader").hide();
					console.log("ERROR!!", err);
				},
			});

			return label_type, media_type;
		},

		//
		getDatasetList : function() {
			var that = inspection;

			var url = "getDatasetList";
			var ajaxData = {};
			var pNode = wsObj[setting.key].dir.getSelectedNodes()[0];
			//console.log("pNode::", pNode);
			$("#loader").show();
			that.getList(url, ajaxData, pNode);
		},
		getDataList : function() {
			var that = inspection;

			var url = "getDataList";
			var pNode = wsObj[setting.key].dir.getSelectedNodes()[0];
			var ajaxData = {
				dataset_id : pNode.id
			};

			that.getList(url, ajaxData, pNode);
		},
		getMetaList : function() {
			var that = inspection;

			var url = "getMetaList";
			var pNode = wsObj[setting.key].dir.getSelectedNodes()[0];
			var ajaxData = {
				data_id : pNode.id
			};

			that.getList(url, ajaxData, pNode);
		},

		//////////////////////
		getList : function(url, ajaxData, parentNode) {
			var that = this;

			//console.log("parentNode::", parentNode);
			//로딩처리 시작
			if (parentNode != null) {
				parentNode.icon = baseUrl + "css/img/loading.gif";
				wsObj[setting.key].dir.updateNode(parentNode);
			}

			console.log("url : " + url);

			$.ajax({
				url : baseUrl + "data/" + url + ".json",
				data : ajaxData,
				success : function(res) {

					console.log("=====getDataList=====", res)
					console.log("==========res=========");
					if (res.result.code == "200") {
						if (res.datasetVO != undefined) {
							that.setDataSetJson(res);
						} else if (res.dataVO != undefined) {
							that.setDataJson(res, parentNode);
						} else if (res.metaVO != undefined) {
							that.setMetaJson(res, parentNode);
						}
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}

					$("#loader").hide();
					//로딩처리 끝
					console.log("parentNode", parentNode);
					if (parentNode != null) {
						console.log("1233");
						parentNode.icon = "";
						wsObj[setting.key].dir.updateNode(parentNode);
					}
				},
				error : function(err) {
					console.log("ERROR!!", err);
				},
			});
		},

		setDataSetJson : function(res) {
			var that = this;
			console.log("res : ", res);
			// 			res.result.data.length = 0;
			if (res.result.data.length > 0) {
				var config = new Array();
				$.each(res.result.data, function(index, value) {
					let node_name = value.title;
					if (value.title.length > 18) {
						node_name = node_name.substring(0, 18) + "...";
					}
					var obj = new Object();
					obj.id = value.dataset_id;
					obj.pId = null;
					obj.name = node_name;
					obj.title = value.title;
					obj.contents = value.contents;
					obj.created_date = value.created_data;
					obj.status = value.status;

					//자식노드 있을시 isParent = true
					obj.isParent = true;
					obj.nodeMove = false;

					config.push(obj);
				});
				wsObj[setting.key].addNode(null, config);
			} else {
				that.nodata();
			}

		},

		// dataset이 없을때
		nodata : function() {
			var that = this;

			var html = "<div class='nodata-wrap flex'><div><img class='' src='<c:url value='/images/icon_nodata_dataset.png' />'><div>No Dataset</div><div>Please add dataset.</div></div></div>"
			that.pt.find(".ztree").append(html);
		},

		setDataJson : function(res, parentNode) {
			var that = this;

			var config = new Array();
			$.each(res.result.data, function(index, value) {
				var obj = new Object();
				obj.id = value.data_id;
				obj.pId = parentNode.id + "." + value.id;
				obj.name = value.id;
				obj.path = value.path;
				obj.dataset_id = value.dataset_id;

				//자식노드 있을시 isParent = true
				obj.isParent = true;
				obj.nodeMove = true;

				config.push(obj);

			});
			wsObj[setting.key].addNode(parentNode, config);
		},

		setMetaJson : function(res, parentNode) {
			var that = this;

			var config = new Array();
			$.each(res.result.data, function(index, value) {
				var obj = new Object();
				obj.id = value.id;
				obj.pId = parentNode.id + "." + value.id;
				obj.name = value.label;
				obj.crop_img = value.crop_img;
				obj.data_id = value.data_id;
				obj.info = value.info;
				obj.label = value.label;
				obj.path = value.path;

				//자식노드 없을시 isParent = false
				obj.isParent = false;
				obj.nodeMove = false;

				config.push(obj);
			});
			wsObj[setting.key].addNode(parentNode, config);
		},

		dataModifiedCheck : function() {
			var that = inspection;
			var cur_page, isModified;
			var cur_page = that.pt.find(".section.selected");
			var msg = "페이지를 이동할 경우 저장되지 않은 가공 데이터는 손실됩니다. 계속하시겠습니까?";
			// 페이지 이동 시 저작도구 수정된 데이터 손실 알림창 추가
			if (!cur_page.hasClass("info")) {
				if ($(cur_page).hasClass("imgBBox")) {
					isModified = imgBBox.data.canvasObj['isModified'];
				} else if ($(cur_page).hasClass("imgSeg")) {
					isModified = imgSeg.data.canvasObj['isModified'];
				} else if ($(cur_page).hasClass("videoBBox")) {
					isModified = videoBBox.data.videoObj['isModified'];
				} else if ($(cur_page).hasClass("imgBBoxList")) {
					isModified = imgBBoxList.data.canvasObj['isModified'];
				} else if ($(cur_page).hasClass("imgSegList")) {
					isModified = imgSegList.data.canvasObj['isModified'];
				} else if ($(cur_page).hasClass("videoBBoxList")) {
					isModified = videoBBoxList.data.videoObj['isModified'];
				}
				if (isModified == 1) {
					if (!confirm(msg)) {
						return false;
					}
				}
				;
				return true;
			} else {
				return true;
			}
		},

		bind : {
			evtAll : function() {
				var that = this;

				// 				$(document).off("keyup").on("keyup", function(evt){
				// //	 				if (evt.keyCode == "17") isCtrl = false;
				// 			 		if(evt.keyCode == "83" && evt.ctrlKey == true){
				// 			 			if($(".section.imgBBox").hasClass("selected")){
				// 			 				imgBBox.computed.insertMetaData();
				// 			 			} else if($(".section.imgSeg").hasClass("selected")){
				// 			 				imgSeg.computed.insertMetaData();
				// 			 			} else if($(".section.videoBBox").hasClass("selected")){
				// 			 				videoBBox.computed.insertMetaData();
				// 			 			} else if($(".section.imgBBoxList").hasClass("selected")){
				// 			 				var uuid = $("#imgBBoxList .category_wrap .cate_wp.selected").attr("id");
				// 			 				imgBBoxList.computed.submitMeta(uuid);
				// 			 			} else if($(".section.imgSegList").hasClass("selected")){
				// 			 				var uuid = $("#imgSegList .category_wrap .cate_wp.selected").attr("id");
				// 			 				imgSegList.computed.submitMeta(uuid);
				// 			 			} else if($(".section.videoBBoxList").hasClass("selected")){
				// 			 				videoBBoxList.computed.insertMetaData();
				// 			 			} 
				// 			 		}
				// 			 	});				

				// 				$(document).off("keydown").on("keydown",function(evt){
				// 					if(evt.keyCode == "46"|| evt.keyCode == "68" && evt.ctrlKey == true){
				// 			 			if($(".section.imgBBox").hasClass("selected")){
				// 			 				imgBBox.bind.keydownEvt2(evt);
				// 			 			} else if($(".section.imgSeg").hasClass("selected")){
				// 			 				imgSeg.bind.keydownEvt2(evt);
				// 			 			} else if($(".section.videoBBox").hasClass("selected")){
				// 			 				videoBBox.bind.keydownEvt2(evt);
				// 			 			} else if($(".section.imgBBoxList").hasClass("selected")){
				// 			 				imgBBoxList.bind.keydownEvt2(evt);
				// 			 			} else if($(".section.imgSegList").hasClass("selected")){
				// 			 				imgSegList.bind.keydownEvt2(evt);
				// 			 			} else if($(".section.videoBBoxList").hasClass("selected")){
				// 			 				videoBBoxList.bind.keydownEvt2(evt);
				// 			 			}
				// 					}
				// 					if(evt.keyCode == "32" || evt.shiftKey == false && evt.keyCode == "39" || evt.shiftKey == false && evt.keyCode == "37" || evt.shiftKey == true && evt.keyCode == "39" || evt.shiftKey == true && evt.keyCode == "37"){
				// 						if($(".section.videoBBox").hasClass("selected")){
				// 			 				videoBBox.bind.keydownEvt2(evt);
				// 			 			} else if($(".section.videoBBoxList").hasClass("selected")){
				// 			 				videoBBoxList.bind.keydownEvt2(evt);
				// 			 			}
				// 					};
				// 				});

			},
		},

	};
</script>