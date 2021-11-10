<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<style>
/* .container { width: 100%; height: 100%; } */
.ib {
	display: inline-block;
}

/* .section { max-width: 500px; min-width: 300px; width: 100%; } */
.section {
	min-width: 376px;
	width: 100%;
}

/* #taskInfo { max-width: 600px; min-width: 300px; width: 100%; } */
/* #taskGraph { max-width: 600px; min-width: 300px; width: 100%; } */

/* #taskGraph > div { max-width: 1200px; min-width: 376px; width: 100%; height: 800px } */
/* #taskGraph .graph { max-width: 1200px; min-width: 376px; width: 100%; height: 800px } */
/* #taskGraph .graph div:first-of-type{ max-width: 1200px; min-width: 376px; width: 100% !important;} */
#taskGraph .graph {
	margin-bottom: 50px;
}

#taskGraph canvas {
	max-width: 700px;
	min-width: 376px;
	width: 100% !important;
}

#taskGraph .graph_title {
	font-size: 20px;
	font-weight: 300;
	line-height: 40px;
	text-align: center;
}

#taskGraph #show_detail_graph {
	display: none;
}

#taskGraph #show_detail_graph_title {
	display: none;
}

/* taskInfo */
#taskInfo {
	margin: 30px;
}

#taskInfo .title_wrap {
	margin-bottom: 24px;
}

#taskInfo .title_wrap .title {
	font-size: 20px;
	color: #343434;
}

#taskInfo .title_wrap .context {
	font-size: 12px;
	color: #797a7c;
}

#taskInfo .info_wrap {
	margin-left: -12px;
	margin-bottom: 20px;
}

#taskInfo .info_wrap .ib {
	margin: 0 12px;
	font-size: 12px;
	color: #343434;
}

#taskInfo .info_wrap .ib>div {
	display: flex;
}

#taskInfo .info_wrap .ib .line {
	width: 1px;
	height: 10px;
	background-color: #cbcbcb;
	margin-top: 6px;
	position: relative;
	left: 12px;
}

#taskInfo .checkBox_wrap .ib {
	margin: 0 11px 11px 0;
	padding: 4px;
	border: 1px solid #cbcbcb;
	border-radius: 15px;
}

#taskInfo .checkBox_wrap .ib>div {
	display: flex;
	margin: 0 11px;
	font-size: 13px;
	font-weight: 300;
	color: #333333;
}

#taskInfo .checkBox_wrap .ib .check {
	margin-right: 7px;
	width: 10px;
	height: 10px;
}

#taskInfo .checkBox_wrap .ib .check.on {
	background: url("images/icon_comparison_check.png");
}
#taskInfo .isVisible_wrap { font: 400 12px system-ui; }
</style>
</head>
<c:set var="id" value="${param.id}" />
<c:set var="uuid" value="${param.uuid}" />
<body>
	<div class="container" id="${uuid}">
		<div class="contents">
			<div class="section" id="taskInfo">
				<div class="title_wrap">
					<div class="title"></div>
					<div class="contents"></div>
				</div>

				<div class="info_wrap">
					<!-- 					<div class="ib"> -->
					<!-- 						<div> -->
					<!-- 							<label>Steps : </label> -->
					<!-- 							<div class="steps"></div> -->
					<!-- 							<div class="line"></div> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
					<!-- 					<div class="ib"> -->
					<!-- 						<div> -->
					<!-- 							<label>Epochs : </label> -->
					<!-- 							<div class="epochs"></div> -->
					<!-- 							<div class="line"></div> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
					<!-- 					<div class="ib"> -->
					<!-- 						<div> -->
					<!-- 							<label>Image-min-side : </label> -->
					<!-- 							<div class="minside"></div> -->
					<!-- 							<div class="line"></div> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
					<!-- 					<div class="ib"> -->
					<!-- 						<div> -->
					<!-- 							<label>Image-max-side : </label> -->
					<!-- 							<div class="maxside"></div> -->
					<!-- 							<div class="line"></div> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
					<!-- 					<div class="ib"> -->
					<!-- 						<div> -->
					<!-- 							<label>Backbone : </label> -->
					<!-- 							<div class="backbone"></div> -->
					<!-- 							<div class="line"></div> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
					<!-- 					<div class="ib"> -->
					<!-- 						<div> -->
					<!-- 							<label>GPU : </label> -->
					<!-- 							<div class="gpu"></div> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
				</div>

				<div class="checkBox_wrap">
					<!-- 					<div class="ib"> -->
					<!-- 						<div class="flex"> -->
					<!-- 							<div class="check"></div><span>random-transform</span> -->
					<!-- 						</div> -->
					<!-- 					</div> -->

					<!-- 					<div class="ib"> -->
					<!-- 						<div class="flex"> -->
					<!-- 							<div class="check"></div><span>freeze-backbone</span> -->
					<!-- 						</div> -->
					<!-- 					</div> -->

					<!-- 					<div class="ib"> -->
					<!-- 						<div class="flex"> -->
					<!-- 							<div class="check on"></div><span>retina net</span> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
				</div>
				
				<!-- 그래프 보이기 제어 -->
<!-- 				<div class="isVisible_wrap"> -->
<!-- 					<span class="isVisible_loss">Loss Graph<input id="isVisible_loss" type="checkbox" checked/></span> -->
<!-- 					<span class="isVisible_map">mAP Graph<input id="isVisible_map" type="checkbox" checked/></span> -->
					
<!-- 				</div> -->
				
				
			</div>
			<!-- end taskInfo -->

			<div class="section" id="taskGraph">
				<div class="fl">
					<div class="graph_title" id="main_graph_title"></div>
					<div class="graph" id="main_graph"></div>
				</div>
<!-- 				<div class="fl"> -->
<!-- 					<div class="graph_title" id="show_detail_graph_title"></div> -->
<!-- 					<div class="graph" id="show_detail_graph"></div> -->
<!-- 				</div> -->
				<div class="fl">
					<div class="graph_title" id="sub_graph_title"></div>
					<div class="graph" id="sub_graph"></div>
				</div>
<!-- 				<div class="fl"> -->
<!-- 					<div class="graph_title" id="show_sub_detail_graph_title"></div> -->
<!-- 					<div class="graph" id="show_sub_detail_graph"></div> -->
<!-- 				</div> -->
				<!-- 				<div id ="show_all_graph"></div> -->
			</div>
			<!-- end taskGraph -->
		</div>
	</div>
</body>

<script>
	$(function() {
		/* objArr["${uuid}"] = graph_draw; */
		/* objArr["${uuid}"] = graph_draw; */
		var objArr = new Object();
		objArr["${uuid}"] = graph_draw;
		task_detail.init();
// 		graph_draw.init();
	});
	var task_detail = {
		pt : {},
		id : "${id}",
		uuid : "${uuid}",

		init : function() {
			var that = this;
			if (that.uuid) {
				that.pt = $("#" + that.uuid + " #taskInfo");
			} else {
				alert("ERROR!!\n\nID를 찾을 수 없습니다");
			}
			that.getTaskById();
			var objArr = new Object();
			objArr["${uuid}"] = graph_draw;			
			graph_draw.init();
			graph_draw.resize(700, 477);
/* 			$.each(stackList, function(index, value){
				var stackList = that.layout.container.find(".lm_stack");
				var uuid = $(value).find(".container").attr("id");
				var w = $(value).find("#taskGraph").width();
				if(w>700){
					w=700;
				}
				var h = w*(2/3);
				objArr[uuid].resize(w,h);
			});  */
		},

		getTaskById : function() {
			let that = this;
			ajaxData = {
				task_id : that.id
			}
			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/getTaskById.json",
				data : ajaxData,
				async: false,
				type : "POST",
				success : function(res) {
					console.log("=====getTaskById=====", res);
					$("#loader").hide();
					if(res.result.code == "3301"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} 
					if (res.result.code == "200") {
						that.drawTaskResult(res.result.data);
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
		

		// 		drawTaskResult : function(data) {
		// 			let that = this;

		// 			console.log(data);

		// 			let annotation_list = data.annotation_list;
		// 			let algorithm_id = data.algorithm;
		// 			let config = JSON.parse(data.config);

		// 			that.pt.find(".title").text(data.title);
		// 			that.pt.find(".contents").text(data.contents);

		// 			that.pt.find(".steps").text(config["--steps"]);
		// 			that.pt.find(".epochs").text(config["--epochs"]);
		// 			that.pt.find(".minside").text(config["--image-min-side"]);
		// 			that.pt.find(".maxside").text(config["--image-max-side"]);
		// 			that.pt.find(".backbone").text(config["--backbone"]);
		// 			that.pt.find(".gpu").text(config["--gpu"]);

		// 			let check_first = that.pt.find(".input_wrap .first");
		// 			let check_second = that.pt.find(".input_wrap .second");

		// 			let first = config["--random-transform"];
		// 			let second = config["--freeze-backbone"];

		// 			if (first == "true") {
		// 				that.pt.find(".checkBox_wrap .check").eq(0).addClass("on");
		// 			}

		// 			if (second = "true") {
		// 				that.pt.find(".checkBox_wrap .check").eq(1).addClass("on");
		// 			}

		// 		},

		drawTaskResult : function(data) {
			let that = this;
			/* console.log("objArr['${uuid}']::", objArr["${uuid}"]); */
			console.log("taskresult data:: ", data);

			let annotation_list = data.annotation_list;
			let algorithm_id = data.algorithm;
			let config = JSON.parse(data.config);
			let config_val_arr = Object.values(config);
			console.log("cf arr :: ", config_val_arr);
			console.log("object.keys(config): : ", Object.keys(config));
			let exception_key = Object.keys(config).includes("pretrained_model");
			let config_legth;
			let strnum;
			if(Object.keys(config).includes("pretrained_model") && !Object.values(config).includes(null)){
				config_length = Object.keys(config).length -1;
				strnum = config_val_arr.filter(function(type) {
					return typeof (type) == "string" || typeof (type) == "number";
				});
				strnum.splice(strnum.indexOf("xlabeller"), 1);
			} else {
				config_length = Object.keys(config).length;
				strnum = config_val_arr.filter(function(type) {
					return typeof (type) == "string" || typeof (type) == "number";
				});				
			}
// 			let config_length = Object.keys(config).length;
// 			let strnum = config_val_arr.filter(function(type) {
// 				return typeof (type) == "string" || typeof (type) == "number";
// 			});
			console.log("strnum::", strnum);
			
			that.pt.find(".title").text(data.title);
			that.pt.find(".contents").text(data.contents);

			let infoTarget = that.pt.find(".info_wrap");
			let checkTarget = that.pt.find(".checkBox_wrap");
			$(infoTarget).html("");
			$(checkTarget).html("");

			for (let i = 0; i < config_length; i++) {
				let config_key;
				let config_value;
				if(typeof(Object.values(config)[i]) == "string" && Object.values(config)[i].includes("/xlabeller")){	

				} else {
					config_value = Object.values(config)[i];
					config_key = Object.keys(config)[i];
				}
// 				let config_value = config[Object.keys(config)[i]];
				let type_config_value = typeof (config[Object.keys(config)[i]]);
				let html = "";

				if (type_config_value === "string" || type_config_value === "number") {
// 					if(type_config_value === "string" && config_value.includes("/xlabeller")){
						
// 					} 
// 					else {
						if (strnum.length == 1) {
							html += '<div class="ib">';
							html += '<div>';
							html += '<label>' + config_key + ' : ' + config_value
									+ '</label>';
							html += '<div class="'+config_key+'"></div>';
							html += '</div>';
							html += '</div>';
						} else {
							html += '<div class="ib">';
							html += '<div>';
							html += '<label>' + config_key + ' : ' + config_value
									+ '</label>';
							html += '<div class="'+config_key+'"></div>';
							html += '<div class="line"></div>';
							html += '</div>';
							html += '</div>';
						}								
// 					}
// 					console.log("config_value :: ", config_value);
				
					$(infoTarget).append(html);
					strnum.pop();
					continue;
				} else if (type_config_value === "boolean"){
					continue;
				}
// 				else if (type_config_value === "boolean") {
// 					if (config_value === true) {
// 						html += '<div class="ib">';
// 						html += '<div class="flex">';
// 						html += '<div class="check on"></div><span>'
// 								+ config_key + '</span>';
// 						html += '</div>';
// 						html += '</div>';

// 						$(checkTarget).append(html);
// 					} else if (config_value === false) {
// 						html += '<div class="ib">';
// 						html += '<div class="flex">';
// 						html += '<div class="check"></div><span>' + config_key
// 								+ '</span>';
// 						html += '</div>';
// 						html += '</div>';

// 						$(checkTarget).append(html);
// 					}
// 					continue;
// 				}
			}

		},

	};

	var graph_draw = {
		pt : {},
		id : "${id}",
		uuid : "${uuid}",
		chartArr : [],
		isClicked : false,
		w : null,
		h : null,
		
		valChk : {loss: "0", mAP: "0"},						// jh.sa 추가 

		init : function(w, h) {
			var that = this;
			that.uuid = task_detail.uuid;
			that.id = task_detail.id;
			that.w = w;
			that.h = h;
			
			console.log("that.uuid::" + that.uuid);
			console.log("that.id::" + that.id);
			if (that.uuid) {
				that.pt = $("#" + that.uuid + " #taskGraph");
			} else {
				alert("ERROR!!\n\nID를 찾을 수 없습니다");
			}

			// 			that.getLogData();
			
			that.getLossData();
			that.getMapData();
			
			that.listener();
		},

		col_title : String,
		col_data : [],
		col_data_name : [],
		chart_title : [],
		chart_data : [],
		json_data : [],

		listener : function() {
			var that = this;
			that.resize(that.w, that.h);
			
			// 그래프 보이기 여부
			var lm_stack = $(".lm_stack");
			var isVisible_loss = lm_stack.find("input:checkbox[id='isVisible_loss']");
			var isVisible_map = lm_stack.find("input:checkbox[id='isVisible_map']");
			var loss_graph = lm_stack.find("#main_graph").parent(".fl");
			var map_graph = lm_stack.find("#sub_graph").parent(".fl");
			
			console.log("isVisible_loss / isVisible_map : ", isVisible_loss, isVisible_map);
			
			isVisible_loss.change(function() {
				if(isVisible_loss.is(":checked")){
					loss_graph.css({"display" : "block"});
				} else {
					loss_graph.css({"display" : "none"});
				}
			});
			isVisible_map.change(function() {
				if(isVisible_map.is(":checked")){
					map_graph.css({"display" : "block"});
				} else {
					map_graph.css({"display" : "none"});
				}
			});

		},

		resize : function(w, h) {
			var that = this;
			var graph = that.pt.find("div[id$=graph]");

			$.each(that.chartArr, function(index, value) {
// 				console.log("that.chartArr : ", that.chartArr);
// 				console.log("index: ", index, " value: ", value);
				value.resize({
					"width" : w,
					"height" : h
				});
			});

			for (var i = 0; i < graph.length; i++) {
				// 				$(graph[i]).height(h+"px");
				// 				$(graph[i]).parent().height(h+"px");
			}

			that.w = w;
			that.h = h;
		},

		setCriteria : function() {
			var that = this;
			that.col_title = "";
			that.col_data = [];
			that.col_data_name = [];
			that.chart_title = [];
			that.chart_data = [];
			var col = 0;
			for ( var key in that.json_data[0]) {
				if (col == 0) {
					that.col_title = key;
				} else {
					that.col_data.push(key);
					that.col_data_name.push(key);
				}
				col++;
			}
			for (var i = 0; i < that.col_data.length; i++) {
				that.chart_data[i] = {
					"name" : that.col_data_name[i],
					"type" : "line",
					"data" : []
				};
			}
			for (var i = 0; i < that.json_data.length; i++) {
				that.chart_title.push(that.json_data[i]["title"]);
				for (var j = 0; j < that.col_data.length; j++) {
					var col_name = that.col_data[j];
					that.chart_data[j].data.push(that.json_data[i][col_name]);
				}
			}
			var option = {
				tooltip : {
					show : true,
					feature : {
						dataZoom : {
							show : true
						},
						dataView : {
							show : true,
							readOnly : false
						},
					}
				},
				dataZoom : {
					show : true,
					realtime : true,
					start : 0,
					end : 100
				},
				legend : {
					data : that.col_data_name
				},
				xAxis : [ {
					type : 'category',
					data : that.chart_title
				} ],
				yAxis : [ {
					type : 'value'
				} ],
				series : that.chart_data
			};
			return option;
		},

		drawMainGraph : function(logArr) {
			var that = this;

			var main_Chart = echarts.init(that.pt.find("#main_graph")[0],
					"light");
			that.chartArr.push(main_Chart);
			that.pt.find('#main_graph_title').html("Loss Graph");

			//main에 들어갈 데이터
			for (var i = 0; i < logArr.length; i++) {
				that.json_data[i] = {
					"title" : logArr[i].epoch,
					"loss" : logArr[i].data[logArr[i].data.length - 1].loss,
					"c_loss" : logArr[i].data[logArr[i].data.length - 1].c_loss,
					"r_loss" : logArr[i].data[logArr[i].data.length - 1].r_loss,
				};
				console.log("json_data[" + i + "]: ", json_data[i]);
			}
			main_Chart.setOption(that.setCriteria());

			that.resize(that.w, that.h);

			// 그래프 보이기 제어 
// 			var isVisible_wrap = $(".isVisible_wrap");
// 			if($("#main_graph").html() == "" && $("#sub_graph").html() == "") {
// 				isVisible_wrap.css({"display" : "none"});
// 			} else if($("#main_graph").html() != "" && $("#sub_graph").html() != ""){ 
// 				isVisible_wrap.css({"display" : "block"});
// 			}
			
			// 			$("#loader").hide();
			main_Chart.on('click', function(params) {
				that.drawDetailGraph(logArr, params);
				that.isClicked = true;

				that.resize(that.w, that.h);
			})
		},
		
		drawLossGraph : function(logLossArr, headerData) {
			var that = this;

			var lossChart_data = logLossArr;
			var loss_header = headerData;
			console.log("lossChart_data:::: ", lossChart_data);
			console.log("header:::::", loss_header);
			
			if(that.valChk.loss == "0"){
				alert("Loss 데이터가 존재하지 않아 빈 그래프가 출력될 수 있습니다.\nTask 학습 후 다시 확인해주세요.");
			};
			
			let flag = true;
			/* console.log("sjo : " + (lossChart_data != undefined)); */
			/* console.log((loss_header != undefined || loss_header.length <= 0)); */
 			if(lossChart_data == undefined || loss_header == undefined) {
				flag = false;
			} 
			//sub에 들어갈 데이터
			var col_title = ""; //제목의 열 이름으로 첫 번째 열에 고정
			var col_data = []; // 두 번째 열부터 값 필드 
			var col_data_name = []; // 두 번째 열부터 데이터 이름 필드 

			var chart_title = new Array(); //차트 제목 
			var chart_data = new Array(); //값 배열

			//열 제목, 열 필드 이름 값 
			var col = 0;
			console.log("flag : " + flag);
			if(flag == true) {
			for (var key in lossChart_data[0]) {
				if (col == 0)
					col_title = key;
				else {
					col_data.push(key);
					col_data_name.push(key);
				}
				col++;
			}
			//값 필드 할당 
			for (var i = 0; i < loss_header.length; i++) {
				chart_data[i] = {
// 					"name" : col_data_name[i],
					"name" : loss_header[i],
// 					"name" : "Epoch",
					"type" : "line",
					"data" : []
				};
			}

			//제목 및 각 값의 데이터 작성 
			for (var i = 0; i < lossChart_data.length; i++) {
				chart_title.push(lossChart_data[i]["epoch"]);
				for (var j = 0; j < loss_header.length; j++) {
					var col_name = col_data[j];
// 					console.log("col_data:? ", col_data);
// 					for(var k = 0; k < lossChart_data[i]["loss"].length; k++) {
						
// 					}
					chart_data[j].data.push(lossChart_data[i]["loss"][j+1]);
// 					chart_data[j].data.push(lossChart_data[i]["r_loss"]);
// 					console.log("#####chart_data["+j+"].data::: ", chart_data[j].data );
					//chart_data[1].data.push(json_data[i]["value1"]);
				};
			};
			
			console.log("loss차트 데이터 : ", chart_data);
			}
			// 사용
			// 준비된 dom을 기준으로 echarts 차트를 초기화 
			var lossChart = echarts.init(that.pt.find("#main_graph")[0], "light");
			that.pt.find("#main_graph_title").html("Loss Graph");
			that.chartArr.push(lossChart);

			var option = {
				tooltip : {
					show : true
				},
				legend : {
					data : loss_header
				},
				dataZoom : {
					show : true,
					realtime : true,
					start : 0,
					end : 100
				},
				xAxis : [ {
					type : 'category',
					name : 'epoch',
					data : chart_title
				} ],
				yAxis : [ {
					type : 'value',
					name : 'value'
				} ],
				series : chart_data
			};
			// echarts 오브젝트에 대한 데이터로드 
			lossChart.setOption(option);
			that.resize(that.w, that.h);

			// 그래프 보이기 제어 
// 			var isVisible_wrap = $(".isVisible_wrap");
// 			if($("#main_graph").html() == "" && $("#sub_graph").html() == "") {
// 				isVisible_wrap.css({"display" : "none"});
// 			} else if($("#main_graph").html() != "" && $("#sub_graph").html() != ""){ 
// 				isVisible_wrap.css({"display" : "block"});
// 			}
			
			
			console.log("lossChart setOption complete");
			
// 			lossChart.on('click', function(params) {
// 				console.log("params:: ", params);
// 				that.drawDetailGraph(lossData, params);
// 				that.isClicked = true;

// 				that.resize(that.w, that.h);
// 			})
		},		
		
		drawDetailGraph : function(lossChart_data, params) {
			var that = this;
			var d_col_title = "";
			var d_col_data = [];
			var d_col_data_name = [];
			var d_chart_title = [];
			var d_chart_data = [];
			var col = 0;
			for ( var key in lossChart_data[0]) {
				if (col == 0) {
					d_col_title = key;
				} else {
					d_col_data.push(key);
					d_col_data_name.push(key);
				}
				col++;
			}
			for (var i = 0; i < d_col_data.length; i++) {
				d_chart_data[i] = {
					"name" : d_col_data_name[i],
					"type" : "line",
					"data" : []
				};
			}
			for (var i = 0; i < lossChart_data.length; i++) {
				d_chart_title.push(lossChart_data[i]["title"]);
				for (var j = 0; j < d_col_data.length; j++) {
					var col_name = d_col_data[j];
					d_chart_data[j].data.push(lossChart_data[i][col_name]);
				}
			}			
// 			that.json_data = [];
			that.pt.find('#show_detail_graph').show();
			that.pt.find('#show_detail_graph_title').show();
			that.pt.find('#show_detail_graph_title').html(
					"Detail Information of Loss Graph");

			//detail_chart의 데이터
			var show_detail_Chart = echarts.init(that.pt
					.find('#show_detail_graph')[0]);
			that.chartArr.push(show_detail_Chart);

			for (var i = 0; i < lossChart_data.length; i++) {
				for(var j = 0; j < lossChart_data[i].length; j++){
				that.json_data[i] = {
						"Batch" : j,
						"Loss" : lossChart_data[i][j].Loss,
						"r_loss" : lossChart_data[i][j].r_loss,						
					};
				};
			}
		
			var option = {
					tooltip : {
						show : true
					},
					legend : {
						data : d_col_data_name
					},
					dataZoom : {
						show : true,
						realtime : true,
						start : 0,
						end : 100
					},
					xAxis : [ {
						type : 'category',
						name : 'epoch',
						data : d_chart_title
					} ],
					yAxis : [ {
						type : 'value',
						name : 'value'
					} ],
					series : d_chart_data
				};
			show_detail_Chart.setOption(option);
			console.log("!@#$%^&", d_col_data_name, d_chart_title, d_chart_data);
// 			show_detail_Chart.setOption(that.setCriteria());
			var scrollPosition = that.pt.find('#show_detail_graph_title')
					.offset().top;
			$("body").animate({
				scrollTop : scrollPosition
			}, 300);
		},
		
		drawMapGraph : function(logMapArr) {
			var that = this;

			var mAPchart_data = logMapArr;
			console.log("mAPchart_data:::: ", mAPchart_data);
			//sub에 들어갈 데이터
			
			if(that.valChk.mAP == "0"){
				alert("mAP 데이터가 존재하지 않아 빈 그래프가 출력될 수 있습니다.\nTask 학습 후 다시 확인해주세요.");
			};
			
			var col_title = ""; //제목의 열 이름으로 첫 번째 열에 고정
			var col_data = []; // 두 번째 열부터 값 필드 
			var col_data_name = []; // 두 번째 열부터 데이터 이름 필드 

			var chart_title = new Array(); //차트 제목 
			var chart_data = new Array(); //값 배열

			//열 제목, 열 필드 이름 값 
			var col = 0;
			for ( var key in mAPchart_data[0]) {
				if (col == 0)
					col_title = key;
				else {
					col_data.push(key);
					col_data_name.push(key);
				}
				col++;
			}

			//값 필드 할당 
			for (var i = 0; i < col_data.length; i++) {
				chart_data[i] = {
					"name" : col_data_name[i],
// 					"name" : "mAP",
					"type" : "line",
					"data" : [],
				//[5, 20, 40, 10, 10, 20]
				};
			}

			//제목 및 각 값의 데이터 작성 
			for (var i = 0; i < mAPchart_data.length; i++) {
				chart_title.push(mAPchart_data[i]["epoch"]);
				for (var j = 0; j < col_data.length; j++) {
					var col_name = col_data[j];
					chart_data[j].data.push(mAPchart_data[i][col_name]);
					//chart_data[1].data.push(json_data[i]["value1"]);
				};
			};
			console.log("mAP차트데이터: ", chart_data);
			// 사용
			// 준비된 dom을 기준으로 echarts 차트를 초기화 
			var subChart = echarts.init(that.pt.find("#sub_graph")[0], "light");
			that.pt.find("#sub_graph_title").html("평가지표(mAP) Graph");
			that.chartArr.push(subChart);

			var option = {
				tooltip : {
					show : true
				},
				legend : {
					data : col_data_name
				},
				dataZoom : {
					show : true,
					realtime : true,
					start : 0,
					end : 100
				},
				xAxis : [ {
					type : 'category',
					name : 'epoch',
					data : chart_title
				} ],
				yAxis : [ {
					type : 'value',
					name : 'value'
				} ],
				series : chart_data
			};

			// echarts 오브젝트에 대한 데이터로드 
			subChart.setOption(option);
			that.resize(that.w, that.h);
			
			// 그래프 보이기 제어 
// 			var isVisible_wrap = $(".isVisible_wrap");
// 			if($("#main_graph").html() == "" && $("#sub_graph").html() == "") {
// 				isVisible_wrap.css({"display" : "none"});
// 			} else if($("#main_graph").html() != "" && $("#sub_graph").html() != ""){ 
// 				isVisible_wrap.css({"display" : "block"});
// 			}			
			
			console.log("mAP Chart setOption complete");
// 			that.validation();
		},
		

		// 		drawSubDetailGraph: function(subLogArr, params){
		// 			var that = this;

		// 			that.json_data=[];
		// 			that.pt.find('#show_detail_graph').show();
		// 			that.pt.find('#show_detail_graph_title').show();
		// 			that.pt.find('#show_detail_graph_title').html("Detail Information of Loss Graph");

		// 			//detail_chart의 데이터
		// 			var show_sub_detail_Chart = echarts.init(that.pt.find('#show_sub_detail_graph')[0]);
		// 			that.chartArr.push(show_sub_detail_Chart);

		// 			for (var i = 0; i < logArr[params.dataIndex].data.length; i++) {
		// 				that.json_data[i] = {
		// 					"title" : i,
		// 					"mAP" : logArr[params.dataIndex].data[i].loss,
		// 				};
		// 			}
		// 			show_detail_Chart.setOption(that.setCriteria());
		// 			var scrollPosition = that.pt.find('#show_sub_detail_graph_title').offset().top;
		// 			$("body").animate({
		// 				scrollTop : scrollPosition
		// 			}, 300);
		// 		},		

		// 		drawAllGraph: function(logArr){
		// 			//show_all의 데이터
		// 			var that = this;
		// 			that.json_data=[];
		// 			var show_all_Chart = echarts.init(that.pt.find('#show_all_graph')[0]);
		// 			that.chartArr.push(show_all_Chart);

		// 			var data_size = logArr[0].data.length;
		// 			for (var i = 0; i < logArr.length * data_size; i++) {
		// 				that.json_data[i] = {
		// 					"title" : logArr[parseInt(i / data_size)].epoch + "_" + i % data_size,
		// 					"loss" : logArr[parseInt(i / data_size)].data[i % data_size].loss,
		// 					"c_loss" : logArr[parseInt(i / data_size)].data[i % data_size].c_loss,
		// 					"r_loss" : logArr[parseInt(i / data_size)].data[i % data_size].r_loss,
		// 				};
		// 			}
		// 			show_all_Chart.setOption(that.setCriteria());
		// 		},

// 		drawDetailGraph : function(logArr, params) {
// 			var that = this;

// 			that.json_data = [];
// 			that.pt.find('#show_detail_graph').show();
// 			that.pt.find('#show_detail_graph_title').show();
// 			that.pt.find('#show_detail_graph_title').html(
// 					"Detail Information of Loss Graph");

// 			//detail_chart의 데이터
// 			var show_detail_Chart = echarts.init(that.pt
// 					.find('#show_detail_graph')[0]);
// 			that.chartArr.push(show_detail_Chart);

// 			for (var i = 0; i < logArr[params.dataIndex].data.length; i++) {
// 				that.json_data[i] = {
// 					"title" : i,
// 					"loss" : logArr[params.dataIndex].data[i].loss,
// 					"c_loss" : logArr[params.dataIndex].data[i].c_loss,
// 					"r_loss" : logArr[params.dataIndex].data[i].r_loss,
// 				};
// 			}
// 			show_detail_Chart.setOption(that.setCriteria());
// 			var scrollPosition = that.pt.find('#show_detail_graph_title')
// 					.offset().top;
// 			$("body").animate({
// 				scrollTop : scrollPosition
// 			}, 300);
// 		},
	
		// getLogData, parseLogData 사용중단 
		getLogData : function() {
			var that = this;

			var ajaxData = {
				task_id : that.id,
				start : 0,
				size : 99999999
			};
			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/getTrainLog.json",
				data : ajaxData,
				async : false,
				type : "POST",
				success : function(res) {
					var logArr = that.parseLogData(res.result.data.log);
					$("#loader").hide();
					that.drawMainGraph(logArr);
					// 					that.drawAllGraph(logArr);
				},
				error : function(err) {
					$("#loader").hide();
					if (type == "scroll") {
						isPrepend = false;
					}
					console.log("ERROR!!", err);
				}
			});
		},
		parseLogData : function(log) {
			var that = this;

			epochLog = log.split("Epoch ");
			console.log("epochLog: ", typeof (epochLog), epochLog);
			var logArr = [];

			for (var i = 0; i < epochLog.length; i++) {
				if (epochLog[i].indexOf("saving model to") != -1) {
					var number = epochLog[i].split(": saving model to")[0];
					var epochArr = epochLog[i - 1].split("\n");
					var epoch = epochArr[0];
					var data = [];
					for (var j = 0; j < epochArr.length; j++) {
						if (epochArr[j].indexOf("loss") == -1) {
							continue;
						}
						var lossArr = epochArr[j].split(" - ");
						var loss = lossArr[2].replace("loss: ", "");
						var r_loss = lossArr[3]
								.replace("regression_loss: ", "");
						var c_loss = lossArr[4].replace(
								"classification_loss: ", "");
						var dataObj = {
							'loss' : loss,
							"r_loss" : r_loss,
							"c_loss" : c_loss
						};
						data.push(dataObj);
					}
					logArr.push({
						'epoch' : epoch,
						'data' : data
					});
				}

			}

			return logArr;
		},

		// get and parse loss, mAP data 

		getMapData : function() {

			var that = this;

			var ajaxData = {
				id : that.id
			};

			$("#loader").show();

			$.ajax({

				url : baseUrl + "task/getMapCSV.json",

				data : ajaxData,
				async : false,
				success : function(res) {

					console.log("===========getMapCSV===========", res);
					if(res.result.code == "3301"){
						alert(res.result.data);
						location.href = baseUrl + 'login';						
					}
					if(res.result.code == "200"){
						var logMapArr = that.parseMapData(res.result.data);
						// 					that.parseMapData(res.result.data);
						// 					$("#loader").hide();
						console.log("logMapArr:: ", logMapArr);
						that.drawMapGraph(logMapArr);						
					}
					$("#loader").hide();

				},

				error : function(err) {
					$("#loader").hide();
					console.log("ERROR!!", err);

				}

			});

		},

		parseMapData : function(logMap) {
			var that = this;
			var logMap_data = logMap;
			if(logMap_data != null){													// jh.sa 수정
				logMap_data.shift();
				console.log("after shift logMap_data:: ", logMap_data);

				var logMapArray = [];
				var mAParr = [];
				var epochArr = [];
				for (var i = 0; i < logMap_data.length; i++) {
					var epoch = logMap_data[i].epoch * 1;
					var mAP = logMap_data[i].map * 1;
					logMapArray.push({
						'epoch' : epoch + '/'+logMap_data[logMap_data.length-1].epoch,	//	jh.sa 수정 
						'mAP' : mAP
					});
					epochArr.push(epoch)
					mAParr.push(mAP);
				}
			 	that.valChk.mAP = "1";
			 	console.log("that.valChk.mAP : ", that.valChk);
				return logMapArray;			
				
			} else { 																	// jh.sa 수정
				var logMapArray = [];
				that.valChk.mAP = "0";
				
				return logMapArray;
			}

		},

		getLossData : function() {

			var that = this;
			console.log("getLossData");
			var ajaxData = {
				id : that.id
			};
			$("#loader").show();
			$.ajax({

				url : baseUrl + "task/getLossCSV.json",

				data : ajaxData,
				async : false,
				success : function(res) {

					console.log("===========getLossCSV===========", res);
					if (res.result.code == "3301"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					}
					if(res.result.code == "200"){
						let logLossArr;
						let lossHeader;
						if(res.result.data != null || undefined || ''){
							logLossArr = that.parseLossData(res.result.data);
							lossHeader = that.parseLossHeaderData(res.result.data.header);
							console.log("losLossArr = ", logLossArr);
							console.log("lossHeader = ", lossHeader);
						}
//	 					var detailLossArr = that.parseDetailLossData(res.result.data);
//	 					that.parseDetailLossData(res.result.data);
						// 					that.parseMapData(res.result.data);
						// 					$("#loader").hide();
						that.drawLossGraph(logLossArr, lossHeader);						
					}
					$("#loader").hide();

				},

				error : function(err) {

					console.log("ERROR!!", err);

				}

			});

		},
		
		parseLossData : function(logLoss) {
			var that = this;
			if(logLoss != null){							// jh.sa 수정
				var logLoss_data = logLoss;
				var logLoss_body = logLoss_data.body;
				var logLoss_header = logLoss_data.header;
				console.log("logLoss_data:: ", logLoss_data);
//	 			console.log("logLoss_body::::::", logLoss_body);
				
				var logLossArray = [];
				var epochArr = [];
				var dataArr = [];
				var lossArr = [];
				var epoch;
				// data
				for (var i = 0; i < logLoss_body.length; i++) {
					var data_row = logLoss_body[i][logLoss_body[i].length-1];
					dataArr.push(data_row);
				}
				
//	 			console.log("dataArr 확인: ", dataArr); 	
//	 			console.log("header 확인 : ", logLoss_header);
				
				// epoch, loss
				for (var i = 0; i < logLoss_body.length; i++){
					lossArr.push({});
				}
				for(var i = 0; i < logLoss_body.length; i++){
					for(var j = 0; j < logLoss_header.length; j++){
						lossArr[i][j] = logLoss_body[i][0][logLoss_header[j]];
					}
				}
				for(var i = 0; i < logLoss_body.length; i++){
					epochArr[i] = lossArr[i][0];
					delete lossArr[i][0];
				}
//	 			console.log(epochArr);
				for(var i = 0; i< logLoss_body.length; i++){
					logLossArray.push({
						'epoch' : epochArr[i] +'/'+ logLoss_body[logLoss_body.length-1][0].Epoch,		// 수정 
						'loss' : lossArr[i]
					});
				}

				that.valChk.loss = "1";

				console.log('logLossArray:: ', logLossArray);
				return logLossArray;				
			} else {
				var logLossArray = [];
				that.valChk.loss = "0";
				return logLossArray;
			}

		},
		
		parseLossHeaderData : function(lossHeader){					// jh.sa 수정
			var that = this;
			if(lossHeader != null) {
				var header_data = lossHeader;
				var headerArr = [];
//	 			console.log("실행 : ", header_data);
				for(var i=0; i<header_data.length; i++) {
					if(i > 0) {
						headerArr.push(header_data[i]);
					};
				}
//	 			console.log("헤더 : ", headerArr);
				return headerArr;				
			} else {
				var headerArr = [];
				return headerArr;	
			}
		},
		
		parseDetailLossData : function(detailLoss){
			var that = this;
			var detailLoss_data = detailLoss;
			console.log("datailLoss_data : ", detailLoss_data);
			
			var logLossArray = [];
			var lossArr = [];
			var epochArr = [];
			var batchArr = [];
			var testArr = [];
		},
		
		validation : function() {
			var that = this;
			
			// jh.sa 추가 : Loss && mAP data == null 일 때 alert
			console.log("valChk :: ", that.valChk);
			if(that.valChk.loss != "1" && that.valChk.mAP != "1"){
				alert("Loss, mAP 데이터가 없습니다.\nTask 학습 후 다시 확인해주세요.");
// 				$(".lm_stack").remove();
// 				$(".main").load("comparison/main");
// 				$(".main").show();
// 				comparison.init();
				return false;
			}
		},
		
		
		
	}
</script>
