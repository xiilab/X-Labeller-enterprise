<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/header" flush="false" />
<head>
<title>ETRI 인공지능 데이터 허브 포털</title>
<style>
#main_graph {
	height: 600px
}

#show_detail_graph {
	height: 600px;
	display: none
}

#show_detail_graph_title {
	height: 50px;
	display: none;
	text-align: center;
}

#show_all_graph {
	height: 600px;
}
</style>
</head>
<body>
	<div class="container" id="graph_draw">
		<div class="w980">
			<div class="contents">
				<div id="main_graph"></div>
				<div id="show_detail_graph_title"></div>
				<div id="show_detail_graph"></div>
				<div id ="show_all_graph"></div>
			</div>	
		</div>
	</div>
</body>
<script src="<c:url value= "/js/echarts-all-3.js"/>"></script>
<script src="<c:url value="/js/log.js" />"></script>
<!-- 	데이터의 위치는 webapp/resources/js 폴더임. -->

<script>
	$(document).on("sessionLoad", function() {
		graph_draw.init();
	});
	var graph_draw= {
			pt: $("#graph_draw"),
			init: function(){
				var that = this;

				
				that.listener();
			},
			col_title: String,
			col_data: [],
			col_data_name: [],
			chart_title: [],
			chart_data: [],
			json_data: [],
			
			listener: function(){
				var that = this;
				
				var main_Chart = echarts.init(that.pt.find("#main_graph")[0]);
				main_Chart.on('click',function(params){
					that.drawDetailGraph(params);
				})
				that.drawMainGraph();
				that.drawAllGraph();
			},
			
			setCriteria : function(){
				var that =this;
				
				that.col_title = "";
				that.col_data = [];
				that.col_data_name = [];
				that.chart_title = [];
				that.chart_data = [];
				var col = 0;
				for (var key in that.json_data[0]) {
					if (col == 0)
						that.col_title = key;else {
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
							start : 50,
							end : 100
						},
						legend : {
							data : that.col_data_name
						},
						xAxis : [
							{
								type : 'category',
								data : that.chart_title
							}
						],
						yAxis : [
							{
								type : 'value'
							}
						],
						series : that.chart_data
					};
				 return option;
			},
			
			drawMainGraph: function(){
				var that = this;
				var main_Chart = echarts.init(that.pt.find("#main_graph")[0]);
				//main에 들어갈 데이터
				for (var i = 0; i < logArr.length; i++) {
					that.json_data[i] = {
						"title" : logArr[i].step,
						"loss" : logArr[i].data[logArr[i].data.length - 1].loss,
						"c_loss" : logArr[i].data[logArr[i].data.length - 1].c_loss,
						"r_loss" : logArr[i].data[logArr[i].data.length - 1].r_loss,
					};
				}
				main_Chart.setOption(that.setCriteria());
			},
			
			drawAllGraph: function(){
				//show_all의 데이터
				var that = this;
				that.json_data=[];
				var show_all_Chart = echarts.init(that.pt.find('#show_all_graph')[0]);
				var data_size = logArr[0].data.length;
				for (var i = 0; i < logArr.length * data_size; i++) {
					that.json_data[i] = {
						"title" : logArr[parseInt(i / data_size)].step + "_" + i % data_size,
						"loss" : logArr[parseInt(i / data_size)].data[i % data_size].loss,
						"c_loss" : logArr[parseInt(i / data_size)].data[i % data_size].c_loss,
						"r_loss" : logArr[parseInt(i / data_size)].data[i % data_size].r_loss,
					};
				}
				show_all_Chart.setOption(that.setCriteria());
			},
			
			drawDetailGraph: function(params){
				var that = this;
				that.json_data=[];

				that.pt.find('#show_detail_graph').show();
				that.pt.find('#show_detail_graph_title').show();
				that.pt.find('#show_detail_graph_title').html("<h1>Detail for epoch " + (params.dataIndex + 1) + "/50</h1>");
				
				//detail_chart의 데이터
				var show_detail_Chart = echarts.init(that.pt.find('#show_detail_graph')[0]);
				for (var i = 0; i < logArr[params.dataIndex].data.length; i++) {
					that.json_data[i] = {
						"title" : i,
						"loss" : logArr[params.dataIndex].data[i].loss,
						"c_loss" : logArr[params.dataIndex].data[i].c_loss,
						"r_loss" : logArr[params.dataIndex].data[i].r_loss,
					};
				}
				console.log(that.json_data);
				show_detail_Chart.setOption(that.setCriteria());
				console.log(that.pt.find('#show_detail_graph_title'));
				var scrollPosition = that.pt.find('#show_detail_graph_title').offset().top;
				$("body").animate({
					scrollTop : scrollPosition
				}, 300);
			}
	}
</script>
