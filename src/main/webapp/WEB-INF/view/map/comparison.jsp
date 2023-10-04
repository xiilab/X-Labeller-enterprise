<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/header" flush="false" >
	<jsp:param name= "cur_page" value="map"/>
</jsp:include>

<link rel="stylesheet" href="<c:url value="/css/goldenlayout-base.css" />">
<link rel="stylesheet" href="<c:url value="/css/goldenlayout-light-theme.css" />">
<script src="<c:url value="/js/goldenlayout.js" />"></script>
<script src="<c:url value= "/js/echarts-all-3.js"/>"></script>
<script src="<c:url value= "/js/echarts4.min.js"/>"></script>

<head>
	<title>밀리터리 이미지넷 객체 라벨기</title>
	
	<style>
		/* 해당 페이지에서 헤더 이미지를 못 가져온 부분 */
	    #header .logo_wrap { width: 221px; height: 64px; text-align: center; background: url('../images/img-logo-x-labeller.png') no-repeat center; cursor: pointer; }	
	   	#header .account_wrap > ul > li > a .help_btn { width: 17px; height: 17px; margin-right: 6px; margin-bottom: -2px; display: inline-block; background: url('../images/btn_help_nor.png') no-repeat left;  }
	   	#header .account_wrap > ul > li > a:hover .help_btn { background: url('../images/btn_help_selected.png') no-repeat left; }		    
	   		
 		#workspace #dir_wrap .ztree { height: 100% !important; } 
		.ztree .level0 span.button[id$=ico] { background: url("../images/icon_tree_task_folder.png") !important; }
		.ztree a.curSelectedNode.level0  span.button[id$=ico] { background: url("../images/icon_tree_task_folder_white.png") !important; }
		.ztree .level1 span.button[id$=ico] { background: url("../images/icon_tree_task.png") !important; }
		.ztree a.curSelectedNode.level1  span.button[id$=ico] { background: url("../images/icon_tree_task_white.png") !important; }

		.dragOver #main .main_wrap .drop_image {background-image : url('../images/img_dragdrop_white.png'); box-shadow: 0 6px 19px -7px rgba(25, 140, 255, 0.6); background-color: #81a8ff; border-color: #81a8ff;}
		.dragOver #main .main_wrap .main_txt { color: #4c84ff;}

		#comparison { min-height: calc(100% - 66px); }
		#comparison .min_w1440 { position: absolute; height: 100%; }
		#comparison .contents { height: 100%; }
		#comparison .contents>div { height: 100%; }
		#comparison .section_wrap{width: 100%; height: 100%; }
		#comparison .trainer_area .lm_goldenlayout { background: #ffffff; }
		#comparison .trainer_area .lm_content {overflow: overlay; background: #ffffff;} 
		
		#comparison section.graph_area { width: 100%; display: none; }
		
		#graph_title { width: 800px; margin: 20px auto; text-align: center; font-size: 28px; font-weight: 300; line-height: 40px; }
		#graph { width: 100%; height: 730px; margin: 0 auto; }
		
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
					<section class="graph_area">
						<div id="graph_title"></div>
						<div id="graph"></div>					
					</section>					
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
			comparison.init();
			setting = {
				key : "comparison",
// 				create : comparison.graph,
				info : [
					{expandNode : comparison.getProjectList, drop : { area : "drop_area", onDrop : comparison.graph, }, },
					{expandNode : comparison.getTaskList, drop : { area : "drop_area", onDrop : comparison.graph, }, }
				], 
			};
			workspace(setting);
		}
		
	});
	var setting;
	var objArr = new Object();
	var comparison = {
		pt : $("#comparison"),
		layout : {},
		init : function() {
			var that = this;
// 			var html = "<div class='new_btn'>Chart +</div>";
// 			$("#workspace .btn_wrap").empty();
// 			$("#workspace .btn_wrap").append(html);
			
// 			$("#workspace .btn_wrap .new_btn").off("click").on("click", function(){
// 				that.graph();
// 			});
			
// 			var config = { settings: {showPopoutIcon: false, showMaximiseIcon: false, showCloseIcon: false}, content: [] };
// 			that.layout = new window.GoldenLayout( config, $('.trainer_area') );
// 			that.layout.on('stateChanged', function(e){
// 				if(that.pt.find("#main").length>0){
// 					that.pt.find(".main").hide();
// 				}

// 				//그래프 resize
// 				var stackList = that.layout.container.find(".lm_stack");
// 				$.each(stackList, function(index, value){
// 					var uuid = $(value).find(".container").attr("id");
					
// 					var w = $(value).find("#taskGraph").width();
					
// 					if(w>700){
// 						w=700;
// 					}
// 					var h = w*(2/3);
// 					if($(value).find(".graph").children().length>0){
						
// 						objArr[uuid].resize(w,h);
// 					} else {
// 						objArr[uuid].init(w,h);
// 					}
// 				});
// 			});
			
// 			var cnt = 0;
// 			that.layout.registerComponent( 'comparison', function( container, state ){
// 				container.getElement().load("comparison/graph?id="+state.taskId+"&uuid=comparison_"+(++cnt));
				
// 			});
				
// 			that.layout.init();
			
// 			//브라우저 크기조절 이벤트
// 			$(window).resize(function(e){
// 				var width = that.pt.find(".section_wrap").width()-220;
// 				console.log(width);
// 				that.layout.updateSize(width);
// 			});
			
			that.main();

		},
		
		event : {

		},
		
		main : function(){
			var that = comparison;
			that.pt.find(".trainer_area").show();
			that.pt.find(".trainer_area").html("");
			/* that.pt.find(".graph_area").html(""); */
			that.pt.find(".graph_area").hide();
			that.pt.find(".trainer_area").append("<div class='main'></div>");
			$(".main").load("comparison/main");	
		},
		
		/* // 4개 데이터 사용할 경우 주석 처리 // */		
		graph: function(){
			var that = comparison; 

			var selected_node = $(".curSelectedNode");
			if(selected_node.hasClass("level0")){
				alert("비교 그래프 생성을 위해 Annotation 하위 Task를 2개 선택해주세요");
				return false;
			} else {
				/* if(selected_node.length != 2){
					alert("비교 그래프 생성을 위해 Annotation 하위 Task를 2개 선택해주세요");
					return false;
				} */
				that.pt.find(".trainer_area").html("");
				that.pt.find(".trainer_area").hide();
				that.getAnnotationMapList();
			}
		},		
		/* // 4개 데이터 사용할 경우 주석 처리 // */
		
		
		getAnnotationMapList : function(){
			var that = comparison;
			
			var selected_task = $(".curSelectedNode.level1"); // 선택한 task 목
			var annotation_title = $(".curSelectedNode.level1").parents("li.level0").children("a.level0")[0].title; // annotation 이			
			var selected_list = [];
			
			for(var i = 0; i < selected_task.length; i++){
				selected_list.push(annotation_title + "/" + selected_task[i].title);
			} // selected_list : annotation_title/task_title 
			console.log("selected_list: ", selected_list);
			console.log("annotation_title: ", annotation_title);
			
			/* var ajaxData = selected_list; */
			// 수정필
			/* let ajaxData = {
				mapPath1 : selected_list[0],
				mapPath2 : selected_list[1],
			}; */
			
			let ajaxData = {
					mapPath : selected_list
			}
			
			console.log("ajaxData : ", ajaxData);
			
			$('#loader').show();
/*  			$.ajax({
				url : baseUrl + "task/getAnnotationMapList",
				data : ajaxData,
				success : function(res) {
					console.log("=====getAnnotationMapList======", res);
					$("#loader").hide();
					$(".curSelectedNode").removeClass("curSelectedNode");
		 			that.drawGraph();			// test 
					
				},
				error : function(err) {
					$("#loader").hide();
					console.log("ERROR!!", err);
				},
			});	  */	
			
			$.ajax({
			url : baseUrl + "task/getScoreMapCSV.json",
			data : ajaxData,
			success : function(res) {
				console.log("=====getScoreMap======", res);
				if(res.result.code == "200"){
					$("#loader").hide();
					$(".curSelectedNode").removeClass("curSelectedNode");
		 			that.modifyGraphData(res.result.data);	
				} else {
					alert(res.result.data);
					$("#loader").hide();
					that.main();					
				}
			},
			error : function(err) {
				$("#loader").hide();
				alert("데이터를 불러오는데 실패하였습니다");
				console.log("ERROR!!", err);
				$(".curSelectedNode").removeClass("curSelectedNode");
				that.main();
			},
			});	 		
		},
		
		modifyGraphData : function(data) {
			var that = this;
			
			var graph_data = data;
			console.log("graph_data: ", graph_data);
			
			var draw_dataArr = [];
			var isCorrect = true;
			
			var label_data = [] // csv값을 dict로 저장
			var label_name = []
			var label_val = []
			var var_arr = []
			
			var label_name1, label_name2;
			var label_val1, label_val2;
			var val1_arr = [];
			var val2_arr = [];

			var legend_arr = [];
			
			for(var i = 0; i < Object.keys(graph_data).length; i++){
				legend_arr.push(Object.keys(graph_data[i])[0]); // annotation/task목록
			};
			draw_dataArr["legend"] = legend_arr;
			
			// 서버에서 무작위 순서로 넘어온 데이터를 키값을 기준으로 A-Z순 정렬
			for(var i=0; i < Object.keys(graph_data).length; i++){
				label_data[i] = sortObject(graph_data[i][legend_arr[i]]);
			}
			/* var label_data1 = sortObject(graph_data[0][legend_arr[0]]);
			var label_data2 = sortObject(graph_data[1][legend_arr[1]]); */
			
			// 정렬된 데이터에서 키, 값 추출
			for(var i=0; i<label_data.length; i++){
				label_name[i] = Object.keys(label_data[i])
			}
			
			/* label_name1 = Object.keys(label_data1);
			label_name2 = Object.keys(label_data2); */
			
			
			for(var i=0; i<label_data.length; i++){
				label_val[i] = Object.values(label_data[i])
			}
			/* label_val1 = Object.values(label_data1);
			label_val2 = Object.values(label_data2); */
			
			/* label 길이 비교 */
			let state = true;
			for(let i=0; i < label_name.length; i++){
				// 길이 비교
				if(label_name[0].length != label_name[i].length){
					state = false;
					break;
				}
				
				// 값 비교
				for(let j=0; j < label_name[0].length; j++){
					if(!label_name[0].includes(label_name[i][j])){
						console.log(label_name[i][j])
						state = false;
						break;
					}
				}
			}
			
			if(!state){
				alert("task들의 label이 일치하지 않습니다.");
				that.main();
				return false;
			}else{
				draw_dataArr["xAxis_data"] = label_name[0];
			}
			
			//값을 숫자로 변환
			for(let i=0; i<label_val.length; i++){
				label_val[i] = label_val[i].map(function(x){ return x*1 });
			}
			
			draw_dataArr["value"] = label_val
			
			/* // 4개 데이터 사용할 경우 주석 처리 // */
			// label 순서를 정렬했음에도 길이가 서로 다르면 리턴
			/* if(label_name1.length == label_name2.length){
			    for(var i = 0; i < label_name1.length; i++){
			        if(label_name1[i].includes(label_name2[i])){
			        } else {
			            isCorrect = false;
			            break;
			        }
			    }
				if(!isCorrect){
					alert("두 task의 label이 일치하지 않습니다");
					that.main();
					return false;
				} else {
					draw_dataArr["xAxis_data"] = label_name1;
				}	
				
				for(var i = 0; i < label_val1.length; i++){
				    val1_arr.push(label_val1[i] * 1);
				}				
				for(var i = 0; i < label_val2.length; i++){
				    val2_arr.push(label_val2[i] * 1);
				}
				draw_dataArr["value1"] = val1_arr;
				draw_dataArr["value2"] = val2_arr;
			} else {
				alert("두 task의 label이 일치하지 않습니다");
				that.main();
				return false;
			} */
			/* // 4개 데이터 사용할 경우 주석 처리 // */
			
			
			console.log("draw_dataArr : ", draw_dataArr);
			that.pt.find("section.graph_area").show();	
			that.drawGraph(draw_dataArr);
		},
		
		getSeries : function(data){
			/* console.log("123454545"); */
			let result = [];
 			console.log("data", data);
			//console.log("length : ", data.value.length); 
			let bar = {};
			for(let i=0; i<data.value.length; i++){
				/* console.log("i : " + i); */
/* 				if(i == 0) {
					bar = {
				            type : 'bar',
			     
				            barGap : 0, 
//				             name : 'task1',
				            name : data["legend"][i],
				            itemStyle: {
				                emphasis: {
				                    barBorderRadius: [5, 5]
			                	},
			                	normal: {
			                    	barBorderRadius: [5, 5, 0, 0]
			                	}
			            	},            
			            	 //data : [0.65, 0.74, 0.56, 0.86]
			        	data : data["value"][i]
			     	   }
				}*/
/* 				else {  */
					bar = {
						type : 'bar',
						name : data["legend"][i],
						itemStyle : {
							emphasis : {
								barBorderRadius : [ 5, 5 ]
							},
							normal : {
								barBorderRadius : [ 5, 5, 0, 0 ]
							}
						},
						//					            	 data : [0.65, 0.74, 0.56, 0.86]
						data : data["value"][i]
					}
					/* console.log("bar2 : "+ bar["data"]); */	
				/* } */
/* 				console.log("data : ", bar);
				console.log("result : ", result); */
				result.push(bar);
				console.log("result", result);
			}
			return result;
		},
		
		drawGraph : function(dataArr){
			var that = this;
			
			var draw_data = dataArr;
			console.log("draw_data :", draw_data);
			var barChart = echarts.init(document.getElementById("graph"));
				$("#graph_title").html("F1 Score");
		
			let option = "";
			option = {
				color : [ '#006699', '#e5323e', '#00974D', '#FFF000', '#800080', '#006dff', '#d100db', '#70eaae'],
				legend : {
					// 						data : ['task1', 'task2']
					data : draw_data["legend"]
				},
				tooltip : {
					trigger : 'axis',
					show : true,
					axisPointer : {
						type : 'shadow'
					}
				},
				// 				    toolbox: {
				// 				        show: true,
				// 				        orient: 'vertical',
				// 				        left: 'right',
				// 				        top: 'center',
				// 				        feature: {
				// 				            mark: {show: true},
				// 				            magicType: {
				// 				            	show: true, 
				// 				            	type: ['line', 'bar', 'stack', 'tiled'], 
				// 				            	title: {
				// 				            		line : "Line",
				// 				            		bar : "Bar",
				// 				            		stack : "Stack",
				// 				            		tiled : "Tiled"
				// 				            	}
				// 				            },
				// 				            restore: {show: true, title: "Reset"},
				// 				            saveAsImage: {show: true, title: " "}
				// 				        }
				// 				    },					
				dataZoom : {
					show : true,
					realtime : true,
					start : 0,
					end : 100
				},
				grid : {
					bottom : 100
				},
				xAxis : {
					type : 'category',
					name : 'Label\n(' + draw_data["xAxis_data"].length + ')',
					axisLabel : {
						interval : 0,
						rotate : 30
					},
					// 				        nameLocation : 'middle',
					// 				        nameGap : 50,
					// 				        data : ['Label1', 'Label2', 'Label3', 'Label4'],
					data : draw_data["xAxis_data"]
				},
				yAxis : {
					type : 'value',
					name : 'F1 Score\n(0 ~ 1)',
					min : 0,
					max : 1,
				},
				series : that.getSeries(draw_data),

			/* series : [
			    {
			        type : 'bar',
			        barGap : 0,
			// 				            name : 'task1',
			        name : draw_data["legend"][0],
			        itemStyle: {
			            emphasis: {
			                barBorderRadius: [5, 5]
			            },
			            normal: {
			                barBorderRadius: [5, 5, 0, 0]
			            }
			        },				            
			// 				            data : [0.65, 0.74, 0.56, 0.86]
			    	data : draw_data["value1"]
			    },
			    {
			        type : 'bar',
			        name : draw_data["legend"][1],
			        itemStyle: {
			            emphasis: {
			                barBorderRadius: [5, 5]
			            },
			            normal: {
			                barBorderRadius: [5, 5, 0, 0]
			            }
			        },				            
			        data : draw_data["value2"]
			    }, */


			}

			// echarts 오브젝트에 대한 데이터로드 
			barChart.setOption(option, true);
			//				that.resize(that.w, that.h);				
		},

		getTaskList : function() {

			var that = comparison;
			let url = "task/getAnnotationMapList.json";
			/* let url = "task/getTaskList.json"; */

			var parentNode;
			var ajaxData;

			parentNode = wsObj[setting.key].dir.getSelectedNodes()[0];
			console.log("parentNode.name : ", parentNode.name);
			ajaxData = {
				path : parentNode.name
			};
			console.log("ajaxData::", ajaxData);

			that.getDataList(url, ajaxData, parentNode);
		},

		getProjectList : function() {
			var that = comparison;
			/* var url = "project/getProjectList.json" */
			let url = "task/getAnnotationMapList.json";
			that.getDataList(url);
		},

		getDataList : function(url, ajaxData, parentNode) {
			var that = comparison;

			//로딩처리 시작
			if (parentNode != null) {
				parentNode.icon = baseUrl + "css/img/loading.gif";
				wsObj[setting.key].dir.updateNode(parentNode);
			}

			$.ajax({
				url : baseUrl + url,
				data : ajaxData,
				success : function(res) {
					console.log("=====getDataList======", res);
					/* if (res.projectVO != undefined) {
						that.setProjectResult(res.result.data);
					} else if (res.taskVO != undefined) {
						that.setTaskResult(res.result.data, parentNode);
					} else {
						alert(res.result.data);
					} */
					if (res.taskVO.path == undefined) {
						that.setProjectResult(res.result);
					} else {
						that.setTaskResult(res.result, parentNode);
					}

					//로딩처리 시작
					if (parentNode != null) {
						parentNode.icon = "";
						wsObj[setting.key].dir.updateNode(parentNode);
					}

				},
				error : function(err) {
					that.setProgressbarGone(parentNode);
					console.log("ERROR!!", err);
				},
			});

		},

		setProjectResult : function(data) {
			var config = new Array();
			$.each(data, function(index, value) {
				console.log("1");
				var obj = new Object();
				/* obj.id = value.id; */
				obj.id = index;
				obj.pId = null;
				obj.name = value;
				/* obj.name = value.title; */

				obj.type = "project";
				obj.isParent = true;
				config.push(obj);
			});

			wsObj[setting.key].addNode(null, config);
		},

		setTaskResult : function(data, parentNode) {
			console.log("2");
			var config = new Array();
			$.each(data, function(index, value) {
				var obj = new Object();
				/* obj.id = value.id; */
				obj.id = index;
				/*  				obj.id = value.title; */// jh.sa : value.id 에서 vlaue.title 로 변경, 그래프 상단 title탭에 task id로 나오던 문제 수정
				obj.pId = parentNode.id + "." + value.id;
				obj.project_id = value.project_id;
				/* obj.name = value.title; */
				obj.name = value;
				obj.type = "task";

				obj.isParent = false;
				config.push(obj);
			});
			wsObj[setting.key].addNode(parentNode, config);

			var nodeArr = wsObj["comparison"].dir.getNodesByParam("pId",
					parentNode.id);
			$.each(nodeArr, function(index, value) {
				var element = wsObj["comparison"].pt.find("#" + value.tId)[0];
				var newItemConfig = {
					title : value.name,
					type : 'component',
					componentName : 'comparison',
					componentState : {
						taskId : value.id
					}
				};

				// 				comparison.layout.createDragSource(element, newItemConfig);				// layout 안쓰기 때문에 막음 
			});
		},

		guid : function() {
			function s4() {
				return ((1 + Math.random()) * 0x10000 | 0).toString(16)
						.substring(1);
			}
			return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-'
					+ s4() + s4() + s4();
		},

	};
</script>
