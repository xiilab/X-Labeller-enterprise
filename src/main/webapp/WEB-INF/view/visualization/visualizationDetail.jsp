<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
	<style>
		#visualizationDetail { height: 100%; width: 100%;  position: relative;}
		#visualizationDetail .content {height: 100%;}
		#visualizationDetail .main_wrap { display: flex; flex-direction: column; height: 100% ; width: 100%; margin: auto; padding: 0 12px; background-color: #e8eaec; text-align: center; }
/* 		#visualizationDetail .main_wrap { display: flex; flex-wrap : wrap; align-items: stretch; width: 100%; height: 100% ; margin: auto; padding: 0 12px; background-color: #e8eaec; text-align: center; } */
		
		#visualizationDetail .main_wrap .head { display:flex; padding: 12px 12px 0; }
		#visualizationDetail .main_wrap .head label { margin-right : 10px; fontSize: 16px; }
		#visualizationDetail .main_wrap .head label span { font-weight: 600; }
		#visualizationDetail .main_wrap .body { display:flex; flex-wrap : wrap; width: 100%; height: 100% ; }
		
		#visualizationDetail section { display: flex; flex: 1 1 40%; padding : 12px; }
		#visualizationDetail section .chart_wrap { display: flex; flex-grow: 1; padding: 1rem; border: 1px solid #dddddd; background-color: #ffffff; }
		#visualizationDetail section .chart_wrap .chart { display: flex; position: relative; width: 100%; height: 100%; }
 		#visualizationDetail section .chart_wrap .chart > div { position: absolute !important; }
		
	</style>
</head>
<body>

	<div class="container" id="visualizationDetail">
		<div class="content flex">
			<div class="main_wrap">
				<div class="head">
					<label>Dataset id : <span id="datasetId">-</span></label>
					<label>Dataset name : <span id="datasetName">-</span></label>
				</div>
				<div class="body">
					<section id="dataCountByResolution">
						<div class="chart_wrap">
							<div class="chart"></div>
						</div>				
					</section>
					
					<section id="dataCountByClass">
						<div class="chart_wrap">
							<div class="chart"></div>
						</div>
					</section>
					
					<section id="objectCountByResolution">
						<div class="chart_wrap">
							<div class="chart"></div>
						</div>
					</section>				
				</div>
			</div>
		</div>
	</div>

</body>
<script>
	$(function() {
		/* visualizationDetail.init(); */
	});

	var visualizationDetail = {
		pt: $("#visualizationDetail"),
		node: null,
		data : {
			title : null,
			datasetId : null
		},
		init: function(datasetName, datasetId){
			
			var that = visualizationDetail;
			
			that.data.datasetId = datasetId;
			that.data.datasetName = datasetName;
			
			// 데이터셋 이름, ID setting
			that.pt.find("#datasetId").text(datasetId);
			that.pt.find("#datasetName").text(datasetName);
			
			// 차트 데이터 호출
			that.computed.getDataCountByResolution();
			that.computed.getDataCountByClass();
			that.computed.getObjectCountByResolution();			
						
			that.bind.listener();
			
		},
		
		bind : {
			
			listener : function () {
				
				var that = visualizationDetail;
				
				$(window).on('resize', function(){
					
					Object.values(visualizationDetail.vis.chartInfo).map((chart) => {
						chart.resize();
					});
				})
				
				
			},
			
		},
		
		computed: {
			
			/* === 1. DATA Size 분포 : 해상도 별 데이터  */
			/*
				- 해상도에 따른 DATA 수 분포
				- x축 : hd이하,hd,fhd,QHD,4k이상
				- y축 : count
			*/
			getDataCountByResolution : function() {
				
				var that = visualizationDetail;
				var ajaxData = {
					dataset_id : that.data.datasetId,
				};
				
				$.ajax({
					url : baseUrl + "visualization/getDataQuantityPerResolution.json",
					data: ajaxData,
					type: "GET",
					traditional : true,
// 					beforeSend: function() {},
// 					complete: function () {},
					success : function (res) {
						if(res.result.code == "200") {
							const data = res.result.data;
							/* sample data */
							// var typeArr = ['HD이하', 'FHD', 'QHD', '4K이상']
							// var result = typeArr.map((item, index) => {
							// 	return { type: item, count: Math.floor(Math.random() * 1000) }
							// });
							const result = [
								{type : 'HD이하', count: Math.floor(data.hd_data_cnt)},
								{type : 'FHD', count: Math.floor(data.fhd_data_cnt)},
								{type : 'QHD', count: Math.floor(data.qhd_data_cnt)},
								{type : '4K이상', count: Math.floor(data.fk_data_cnt)}
							]

							// that.computed.initDataCountByResolution(result);
							that.computed.initDataCountByResolution(result)
						} else {
							alert(res.result.data);
						}
					},
					error : function (err) {
						console.log()
					},
				})

			},		
			
			initDataCountByResolution : function(result) {
				
				var that = visualizationDetail;
				var chartInfo = that.vis.chartInfo;
				
				var resolutionType = [];
				var dataCount = []
				
				for(var i=0; i<result.length; i++ ) {
					var resultData = result[i];
					resolutionType[i] = resultData['type'];
					dataCount[i] = resultData['count'];		
				}
				
				if(result.length > 0) {
					
					// 차트가 생성되어있지 않을때 - 차트 생성
					if(chartInfo['dataCountByResolution'] == undefined){
						
						that.vis.procDataCountByResolution(resolutionType, dataCount);
						
					} else { // 차트가 생성되어 있을떄 - 차트에서 값만 update 함. 
						
						that.vis.update('dataCountByResolution', resolutionType, dataCount)
						
					}				
										
				}
				
			},
			
			/* === 2. Class별 수량 분포 */
			/* 
				- 클래스별 수량 top 10만 표출
			*/
			getDataCountByClass : function () {
				
				var that = visualizationDetail;
				var ajaxData = {
					dataset_id : that.data.datasetId,
				};
				
				$.ajax({
					url : baseUrl + "visualization/getDataQuantityPerClass.json",
					data: ajaxData,
					type: "GET",
					traditional : true,
// 					beforeSend: function() {},
// 					complete: function () {},
					success : function (res) {
						if(res.result.code == "200") {
							console.log("res.result.data::", res.result.data);
							const data = res.result.data;
							const result = data.map((data) => {
								return {type : data.label, count : Math.floor(data.class_cnt)}
							})
							/* sample data */		
							// var typeArr = ['승용차', 'SUV', '트럭', '경차', '보행자', '도로', '신호등', '자전거', '어린이']
							// var result = typeArr.map((item, index) => {
							//
							// 	return { type: item, count: Math.floor(Math.random() * 1000) }
							// });
							
							that.computed.initDataCountByClass(result);
						
// 							that.computed.initDataCountByResolution(res.result.data)

						} else {
							alert(res.result.data);
						}
					},
					error : function (err) {
						console.log()
					},
				})
			
			},
			
			initDataCountByClass : function(result) {
				
				var that = visualizationDetail;
				var chartInfo = that.vis.chartInfo;
				
				var classType = [];
				var dataCount = []
				
				for(var i=0; i<result.length; i++ ) {
					var resultData = result[i];
					classType[i] = resultData['type'];
					dataCount[i] = resultData['count'];		
				}
				
				
				if(result.length > 0) {
					
					// 차트가 생성되어있지 않을때 - 차트 생성
					if(chartInfo['dataCountByClass'] == undefined){
						
						that.vis.procDataCountByClass(classType, dataCount);
						
					} else { // 차트가 생성되어 있을떄 - 차트에서 값만 update 함. 
						
						that.vis.update('dataCountByClass', classType, dataCount)
						
					}				
										
				}
				
			},
			 
			/* === 3. Object 크기별 분포 -> 해상도별 객체 개수 */
			/* 
				- x 축 : 해상도(width*height)
				- y 축 : count(width*height)
				- x 축 범주 : 4k기준을 최대치로 설정, hd이하,hd,fhd,QHD,4k이상
			 */
			
			 getObjectCountByResolution : function() {
				 
				 var that = visualizationDetail;
					var ajaxData = {
						dataset_id : that.data.datasetId,
					};
					
	 				$.ajax({
	 					url : baseUrl + "visualization/getClassQuantityPerResolution.json",
	 					data: ajaxData,
	 					type: "GET",
	 					traditional : true,
	// 					beforeSend: function() {},
	// 					complete: function () {},
	 					success : function (res) {
	 						if(res.result.code == "200") {
								const data = res.result.data;
								/* sample data */		
								// var typeArr = ['HD이하', 'FHD', 'QHD', '4K이상']
								// var result = typeArr.map((item, index) => {
								//
								// 	return { type: item, count: Math.floor(Math.random() * 1000) }
								// });
								const result = [
									{type : 'HD이하', count : Math.floor(data.hd_meta_cnt)}
									, {type : 'FHD', count : Math.floor(data.fhd_meta_cnt)}
									, {type : 'QHD', count : Math.floor(data.qhd_meta_cnt)}
									, {type : '4K이상', count : Math.floor(data.fk_meta_cnt)}
								]
								
								that.computed.initObjectCountByResolution(result);
//	 							that.computed.initObjectCountByResolution(res.result.data)
	 						} else {
	 							alert(res.result.data);
	 						}
	 					},
	 					error : function (err) {
	 						console.log()
	 					},
	 				})
			 },			 
			 
			 initObjectCountByResolution : function(result) {
				 
				 var that = visualizationDetail;				 
				 var chartInfo = that.vis.chartInfo;
				 
				 var resolutionType = [];
				 var objectCount = []
				 
				 for(var i=0; i<result.length; i++ ) {
					 var resultData = result[i];
					 resolutionType[i] = resultData['type'];
					 objectCount[i] = resultData['count'];
				 }
				
				 if(result.length > 0) {
					
					// 차트가 생성되어있지 않을때 - 차트 생성
					if(chartInfo['objectCountByResolution'] == undefined){
						
						that.vis.procObjectCountByResolution(resolutionType, objectCount);
						
					} else { // 차트가 생성되어 있을떄 - 차트에서 값만 update 함. 
						
						that.vis.update('objectCountByResolution', resolutionType, objectCount)
						
					}				
										
				}
					
			 }
			 
			/* === 4. BBox 경계범위 분포 */
			/* 
				- 경계분포 의미가 모호함에 따라 가능하면 제거 요망
			*/
			
			
			/* === 5. 이미지별 객체수(데이터 셋별) */
			/* 
				- x축 : 데이터 셋의 객체수
				- y축 : 데이터 셋의 이미지 수
			*/					
			 
			 
			
		},
		
		vis : {
			
			chartInfo : {},
			init : function() {},
			
			procDataCountByResolution : function(resolutionType, dataCount) {
				var that = visualizationDetail;
				
				var optionObj = {
					chartTitle : "",
					chartName : "",
					target : "",
					xAxisName : "",
					xAxisData : [],
					yAxisName : "",
					legendData : null,
					series : []
				};
				
				
				optionObj['chartTitle'] = "해상도별 데이터 수량";
				optionObj['chartName'] = "dataCountByResolution";
				optionObj['target'] = "section#dataCountByResolution .chart_wrap";
				optionObj['xAxisName'] = "해상도";
				optionObj['xAxisData'] = resolutionType;
				optionObj['yAxisName'] = "데이터 수량";
				optionObj['series'] = [
					{
						name : '해상도별 데이터 수량',
						type : 'bar',
						barWidth: '8%',
						data : dataCount,
						itemStyle : {
							emphasis : { colo: "#fcaf17", barBorderRadius: [10, 10, 0, 0] },
							normal : { color : "#fcaf17", barBorderRadius: [10, 10, 0, 0] },
						}
					}	
				];
				
				that.vis.drawChart(optionObj);				
				
			},
			
			procDataCountByClass : function(classType, dataCount) {
				
				var that = visualizationDetail;
				
				var optionObj = {
					chartTitle : "",
					chartName : "",
					target : "",
					xAxisName : "",
					xAxisData : [],
					yAxisName : "",
					legend : false,
					series : []
				};
				
				optionObj['chartTitle'] = "클래스별 데이터 수량 TOP 10"
 				optionObj['chartName'] = "dataCountByClass";
				optionObj['target'] = "section#dataCountByClass .chart_wrap";
				optionObj['xAxisName'] = "클래스";
				optionObj['xAxisData'] = classType;
				optionObj['yAxisName'] = "데이터 수량";
				optionObj['series'] = [
					{
						name : '클래스별 수량',
						type : 'bar',
						barWidth: '8%',
						data : dataCount,
						itemStyle : {
							emphasis : { colo: "#517be5", barBorderRadius: [10, 10, 0, 0] },
							normal : { color : "#517be5", barBorderRadius: [10, 10, 0, 0] },
						}
					}	
				];
				
				that.vis.drawChart(optionObj);				
				
			},
						
			procObjectCountByResolution : function(classType, objectCount) {
				
				var that = visualizationDetail;
				
				var optionObj = {
					chartTitle : "",
					chartName : "",
					target : "",
					xAxisName : "",
					xAxisData : [],
					yAxisName : "",
					legend : false,
					series : []
				};
				
				optionObj['chartTitle'] = "해상도별 객체 수량"
 				optionObj['chartName'] = "objectCountByResolution";
				optionObj['target'] = "section#objectCountByResolution .chart_wrap";				
				optionObj['xAxisName'] = "해상도";
				optionObj['xAxisData'] = classType;
				optionObj['yAxisName'] = "객체 수량";
				optionObj['series'] = [
					{
						name : '해상도별 객체 수량',
						type : 'bar',
						barWidth: '8%',
						data : objectCount,
						itemStyle : {
							emphasis : { colo: "#f35353", barBorderRadius: [10, 10, 0, 0] },
							normal : { color : "#f35353", barBorderRadius: [10, 10, 0, 0] },
						}
					}	
				];
				
				that.vis.drawChart(optionObj);				
				
			},
			
			drawChart : function(optionObj) {
				
				var that = visualizationDetail;
				
				var chartOption = {
						title: {
							text : optionObj['chartTitle'],
							left : 'center',
						},
						grid : {
							/* left : '0px',
							right : '0px',
							top : '0px',
							bottom : '0px',
							containLabel : true, */
						},
						legend : {
							show : optionObj['legend'], // false
							orient : 'vertical',					
						},
						dataZoom : [],
						xAxis : [
							{
								name : optionObj['xAxisName'],
								nameTextStyle : { color: "#999" },
								type : 'category',
								data : optionObj['xAxisData'],
								axisTick : { show : false },
								axisLabel : {
//	 								fontFamily : '',
									fontSize : 13,
									color : '#999',
									LineHeight: 30,
//	 								formatter : function(value) {
//	 									return "";
//	 								}						
								},
								axisLine : { onZero : false, lineStyle: { color: "#e4e4e4" } },	
							},
							{
								type : 'category',
								axisTick : { show: false },
								axisLine : { onZero : false, lineStyle: { color: "#e4e4e4" } },
								
							}
						],
						yAxis : [
							{
								name : optionObj['yAxisName'],
								nameTextStyle : { color: "#999" },
								position : 'left',
// 								splitNumber: 3,
								axisLabel : {
// 									fontFamily : '',
									fontSize: 13,
									color : '#999',
								},
								axisTick : { show: false },
								axisLine : { show : true, lineStyle: { color: "#e4e4e4" } },
								boundaryGap : [0, '10%'],
								
							},
							{
								position : 'right',
								axisTick : { show : false },
								axisLine : { show : true, lineStyle : { color :"#e4e4e4" }},
								
							}
							
						],
						tooltip : { },
						series : optionObj['series'],					
						
				};
				
				that.vis.set(optionObj['target'] + " .chart", chartOption, optionObj['chartName']);				
				
			},
			
			set : function(target, chartOption, chartName) {
				
				var that = visualizationDetail;
				var chart = echarts.init($(target)[0]);
				chart.setOption(chartOption);
				
				var chartInfo = that.vis.chartInfo;
				chartInfo[chartName] = chart;			
								
				
				that.bind.listener();
// 				that.bind.chartResizeEvt(chart);
			},
			
			update : function(chartName, xAsisData, seriesData) {
			
				var that = visualizationDetail;
				var chartInfo = that.vis.chartInfo;
				
				var chart = chartInfo[chartName];
				var option = chart.getOption();
				
				option.xAxis[0].data = xAsisData;
				option.series[0].data = seriesData;
			
				chart.setOption(option);
				
				
			},
			
			
			
		}
		
	}
</script>