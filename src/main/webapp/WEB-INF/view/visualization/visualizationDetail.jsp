<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
	<script src="<c:url value="/js/graphInfo.js"/>"></script>
    <style>
        #visualizationDetail {
            height: 100%;
            width: 100%;
            position: relative;
        }

        #visualizationDetail .content {
            height: 100%;
        }

        #visualizationDetail .main_wrap {
            display: flex;
            flex-direction: column;
            height: 100%;
            width: 100%;
            margin: auto;
            padding: 0 12px;
            background-color: #e8eaec;
            text-align: center;
        }

        /* 		#visualizationDetail .main_wrap { display: flex; flex-wrap : wrap; align-items: stretch; width: 100%; height: 100% ; margin: auto; padding: 0 12px; background-color: #e8eaec; text-align: center; } */
        #visualizationDetail .main_wrap .head {
            display: flex;
            padding: 12px;
            height: 5%;
            justify-content: space-between;
        }
        
        #visualizationDetail .main_wrap .head .wrap {
        	display : flex;
        	align-items: center;
        }	
        
        #visualizationDetail .main_wrap .head .wrap select {
        	height: 35px;
		    min-width: 200px;
		    padding-right: 30px;
        }
        
        #visualizationDetail .main_wrap .head .wrap select:disabled { background-color : #d2d2d2; }

        #visualizationDetail .main_wrap .head label {
            margin-right: 10px;
            fontSize: 16px;
        }

        #visualizationDetail .main_wrap .head label span {
            font-weight: 600;
        }

        #visualizationDetail .main_wrap .body {
            display: flex;
            flex-wrap: wrap;
            width: 100%;
            height: 95%;
            min-height:%;
            overflow: auto;
        }

        #visualizationDetail section {
            display: flex;
            flex: 1 1 30%;
            min-height: 400px;
        }

        #visualizationDetail section .chart_wrap {
            position: relative;
            display: flex;
            flex-grow: 1;
            padding: 1rem;
            margin: 1rem;
            border: 1px solid #dddddd;
            background-color: #ffffff;
        }

        #visualizationDetail section .chart_wrap .chart {
            display: flex;
            position: relative;
            width: 100%;
            height: 100%;
        }

        #visualizationDetail section .chart_wrap .chart > div {
            position: absolute !important;
        }

        #visualizationDetail section .chart_wrap .no_result {
            visibility: hidden;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        #visualizationDetail section .chart_wrap .loading {
            position: absolute;
		    width: 100%;
		    height: 100%;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    background-image: url('./images/loader.gif');
		    background-repeat: no-repeat;
		    background-position: center;
		    background-size: 50px 50px;
		    background-color : #4c84ff4a;
        }
        
    </style>
</head>
<body>

<div class="container" id="visualizationDetail">
    <div class="content flex">
        <div class="main_wrap">
            <div class="head">
            	<div class="wrap">
	                <label>데이터셋 ID : <span id="datasetId">-</span></label>
	                <label>데이터셋명 : <span id="datasetName">-</span></label>
            	</div>
            	<div class="wrap">            	
	                <label style="width: 2rem;">라벨</label>
	            	<select id="label_id">
	            		<option selected>전체</option>
	            	</select>
            	</div>
            </div>
            <div class="body">
                <!-- 해상도별 데이터 수량  -->
                <section id="dataQuantityPerResolution">
                    <div class="chart_wrap">
                        <div class="chart"></div>
                        <div class='no_result'>조회된 결과가 없습니다.</div>
                    </div>
                </section>
                <!-- 클래스별 데이터 수량 TOP 10 -->
                <section id="dataQuantityPerClass">
                    <div class="chart_wrap">
                        <div class="chart"></div>
                        <div class='no_result'>조회된 결과가 없습니다.</div>
                    </div>
                </section>
                <!-- 해상도별 객체 수량 -->
                <section id="classQuantityPerResolution">
                    <div class="chart_wrap">
                        <div class="chart"></div>
                        <div class='no_result'>조회된 결과가 없습니다.</div>
                    </div>
                </section>
                <!-- ========================================================= -->

                <!-- Object 크기별 분포 -->
                <section id="distributionByObjectSize">
                    <div class="chart_wrap">
                        <div class="chart"></div>
                        <div class='no_result'>조회된 결과가 없습니다.</div>
                    </div>
                </section>

                <!-- width 별 분포-->
                <section id="labelCountByWidth">
                    <div class="chart_wrap">
                        <div class="chart"></div>
                        <div class='no_result'>조회된 결과가 없습니다.</div>
                    </div>
                </section>

                <!-- heigh별 분포 -->
                <section id="labelCountByHeight">
                    <div class="chart_wrap">
                        <div class="chart"></div>
                        <div class='no_result'>조회된 결과가 없습니다.</div>
                    </div>
                </section>

                <!-- ========================================================= -->

                <!-- 경계범위(bounding box)중심분포 -->
                <section id="boundaryRangeCentroidDistribution">
                    <div class="chart_wrap">
                        <div class="chart"></div>
                        <div class='no_result'>조회된 결과가 없습니다.</div>
                    </div>
                </section>
                <!-- center x별 분포 -->
                <section id="labelCountByCenterX">
                    <div class="chart_wrap">
                        <div class="chart"></div>
                        <div class='no_result'>조회된 결과가 없습니다.</div>
                    </div>
                </section>
                <!-- center y별 분포 -->
                <section id="labelCountByCenterY">
                    <div class="chart_wrap">
                        <div class="chart"></div>
                        <div class='no_result'>조회된 결과가 없습니다.</div>
                    </div>
                </section>

            </div>
        </div>
    </div>
</div>

</body>
<script>
    $(function () {
        /* visualizationDetail.init(); */
    });

    var visualizationDetail = {
        pt: $("#visualizationDetail"),
        node: null,
        data: {
            title: null,
            datasetId: null,
        },
        init: function (datasetName, datasetId) {

            var that = visualizationDetail;

            that.data.datasetId = datasetId;
            that.data.datasetName = datasetName;

            // 데이터셋 이름, ID setting
            that.pt.find("#datasetId").text(datasetId);
            that.pt.find("#datasetName").text(datasetName);
            
            // 데이터셋에 해당하는 라벨 목록 가져오기
            that.computed.getLabelList(datasetId);

            // 차트 데이터 호출
			that.callDeferred(null);
            /* that.computed.getDataQuantityPerResolution();
            that.computed.getDataQuantityPerClass();
            that.computed.getClassQuantityPerResolution();
            that.computed.getBoundaryRangeCentroidDistribution();
            that.computed.getDistributionByObjectSize();
            that.computed.getLabelCountByWidth();
           	that.computed.getLabelCountByHeight();
			that.computed.getLabelCountByCenterY();
			that.computed.getLabelCountByCenterX(); */

            that.bind.listener();

        },

        bind: {

            listener: function () {

                var that = visualizationDetail;

                $(window).on('resize', function () {

                    Object.values(visualizationDetail.vis.chartInfo).map((chart) => {
                        chart.resize();
                    });
                })

				that.pt.find("select#label_id").off("change").on("change", function(e){
					
					var targetValue = e.target.value;
					if( targetValue == "ALL" ) {
						that.callDeferred(null);
					} else {
						that.callDeferred(targetValue);
					}
				});
            },

        },
        
        callDeferred : function(param) {
        
        	var that = visualizationDetail;
        	
        	
        	console.log("===== START !! : ", param)
        	that.pt.find("select#label_id").attr("disabled", true);
        	visualization.pt.find("#workspace").append("<div class='loading'></div>")
        	
        	$.when(
       			that.computed.getDataQuantityPerResolution(param),
                that.computed.getDataQuantityPerClass(param),
                that.computed.getClassQuantityPerResolution(param),
       			that.computed.getBoundaryRangeCentroidDistribution(param),
                that.computed.getLabelCountByWidth(param),
                that.computed.getLabelCountByHeight(param),
				that.computed.getDistributionByObjectSize(param),
       			that.computed.getLabelCountByCenterY(param),
       			that.computed.getLabelCountByCenterX(param),
        	).done(function(){
        		console.log("===== END !! ")
        		visualization.pt.find("#workspace .loading").remove();
		      	that.pt.find("select#label_id").attr("disabled", false);
        	});
        },

        computed: {
        	
            /* === 0. 라벨 목록 가져오기   */
            getLabelList : function(datasetId) {
            	
            	var that = visualizationDetail;
            	
            	var ajaxData = {
                    dataset_id: datasetId,
                };

                $.ajax({
                    url: baseUrl + "visualization/getLabelList.json",
                    data: ajaxData,
                    type: "GET",
                    traditional: true,
                    /* beforeSend: function() {
                    	that.render.drawLoadingArea("dataQuantityPerResolution");
                    },
                    complete : function() {
                    	that.render.removeLoadingArea("dataQuantityPerResolution")
                    }, */
                    success: function (res) {
                    	console.log("### 0. getLabelList : ", res.result.data);
                        if (res.result.code == "200") {
                            const data = res.result.data;
                            that.render.renderLabelOption(data);
                        } else {
                            alert(res.result.data);
                        }
                    },
                    error: function (err) {
                        console.log(err)
                    },
                });
                    
            },

            /* === 1. DATA Size 분포 : 해상도 별 데이터  */
            /*
                - 해상도에 따른 DATA 수 분포
                - x축 : hd이하,hd,fhd,QHD,4k이상
                - y축 : count
            */
            getDataQuantityPerResolution: function (param) {

                var that = visualizationDetail;
                
               	var deferred = $.Deferred();
                
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };
                
                if(param) ajaxData['label'] = param;

                $.ajax({
                    url: baseUrl + "visualization/getDataQuantityPerResolution.json",
                    data: ajaxData,
                    type: "GET",
                    traditional: true,
                    beforeSend: function() {
                    	that.render.drawLoadingArea("dataQuantityPerResolution");
                    },
                    complete : function() {
                    	that.render.removeLoadingArea("dataQuantityPerResolution")
                    },
                    success: function (res) {
                    	console.log("### 1. getDataQuantityPerResolution : ", res.result.data);
                        if (res.result.code == "200") {
                            const data = res.result.data;
                            /* sample data */
                            // var typeArr = ['HD이하', 'FHD', 'QHD', '4K이상']
                            // var result = typeArr.map((item, index) => {
                            // 	return { type: item, count: Math.floor(Math.random() * 1000) }
                            // });
                            const result = [
                                {type: 'HD이하\n(1280x720)', count: Math.floor(data.hd_data_cnt)},
                                {type: 'FHD\n(1920x1080)', count: Math.floor(data.fhd_data_cnt)},
                                {type: 'QHD\n(2560x1440)', count: Math.floor(data.qhd_data_cnt)},
                                {type: '4K이상\n(3840x2160)', count: Math.floor(data.fk_data_cnt)}
                            ]

                            // that.computed.initDataQuantityPerResolution(result);
                            that.computed.initDataQuantityPerResolution(result);
                            
                            deferred.resolve(res.result);
                            
                        } else {
                            alert(res.result.data);
                        }
                    },
                    error: function (err) {
                        console.log()
                    },
                });
                
                return deferred;

            },

            initDataQuantityPerResolution: function (result) {

                var that = visualizationDetail;
                var chartInfo = that.vis.chartInfo;

                var resolutionType = [];
                var dataCount = []

                for (var i = 0; i < result.length; i++) {
                    var resultData = result[i];
                    resolutionType[i] = resultData['type'];
                    dataCount[i] = resultData['count'];
                }

                if (chartInfo['dataQuantityPerResolution'] == undefined) {

                    that.vis.drawChart(procDataCountByResolution(resolutionType, dataCount)); // graphInfo.js
                    
                } else { // 차트가 생성되어 있을떄 - 차트에서 값만 update 함.

                    that.vis.update('dataQuantityPerResolution', resolutionType, dataCount)

                }

                // 조회된 결과가 없을 경우
                if (result.length > 0) {
                    that.pt.find("section#dataQuantityPerResolution .chart_wrap .no_result").css("visibility", "hidden");
                } else {
                    that.pt.find("section#dataQuantityPerResolution .chart_wrap .no_result").css("visibility", "visible");
                }

            },

            /* === 2. Class별 수량 분포 */
            /*
                - 클래스별 수량 top 10만 표출
            */
            getDataQuantityPerClass: function (param) {

                var that = visualizationDetail;
                
                var deferred = $.Deferred();
                
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };
                
                if(param) ajaxData['label'] = param;

                $.ajax({
                    url: baseUrl + "visualization/getDataQuantityPerClass.json",
                    data: ajaxData,
                    type: "GET",
                    traditional: true,
                    beforeSend: function() {
                    	that.render.drawLoadingArea("dataQuantityPerClass");
                    },
                    complete : function() {
                    	that.render.removeLoadingArea("dataQuantityPerClass")
                    },
                    success: function (res) {
                    	console.log("### 2. getDataQuantityPerClass : ", res.result.data)
                        if (res.result.code == "200") {
                            const data = res.result.data;
                            const result = data.map((data) => {
                                return {type: data.label, count: Math.floor(data.class_cnt)}
                            })
                            /* sample data */
                            // var typeArr = ['승용차', 'SUV', '트럭', '경차', '보행자', '도로', '신호등', '자전거', '어린이']
                            // var result = typeArr.map((item, index) => {
                            //
                            // 	return { type: item, count: Math.floor(Math.random() * 1000) }
                            // });

                            that.computed.initDataQuantityPerClass(result);

// 							that.computed.initDataCountByResolution(res.result.data)

                            deferred.resolve(res.result);

                        } else {
                            alert(res.result.data);
                        }
                    },
                    error: function (err) {
                        console.log()
                    },
                })
                
                return deferred;

            },

            initDataQuantityPerClass: function (result) {

                var that = visualizationDetail;
                var chartInfo = that.vis.chartInfo;

                var classType = [];
                var dataCount = []

                for (var i = 0; i < result.length; i++) {
                    var resultData = result[i];
                    classType[i] = resultData['type'];
                    dataCount[i] = resultData['count'];
                }


                // 차트가 생성되어있지 않을때 - 차트 생성
                if (chartInfo['dataQuantityPerClass'] == undefined) {

                    // that.vis.procDataCountByClass(classType, dataCount);
                    that.vis.drawChart(procDataCountByClass(classType, dataCount)); // graphInfo.js

                } else { // 차트가 생성되어 있을떄 - 차트에서 값만 update 함.

                    that.vis.update('dataQuantityPerClass', classType, dataCount)

                }



                // 조회된 결과가 없을 경우
                if (result.length > 0) {
                    that.pt.find("section#dataQuantityPerClass .chart_wrap .no_result").css("visibility", "hidden");

                } else {
                    that.pt.find("section#dataQuantityPerClass .chart_wrap .no_result").css("visibility", "visible");
                }

            },

            /* === 3. Object 크기별 분포 -> 해상도별 객체 개수 */
            /*
                - x 축 : 해상도(width*height)
                - y 축 : count(width*height)
                - x 축 범주 : 4k기준을 최대치로 설정, hd이하,hd,fhd,QHD,4k이상
             */

            getClassQuantityPerResolution: function (param) {

                var that = visualizationDetail;
                
                var deferred = $.Deferred();
                
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };
                
                if(param) ajaxData['label'] = param;

                $.ajax({
                    url: baseUrl + "visualization/getClassQuantityPerResolution.json",
                    data: ajaxData,
                    type: "GET",
                    traditional: true,
                    beforeSend: function() {
                    	that.render.drawLoadingArea("classQuantityPerResolution");
                    },
                    complete : function() {
                    	that.render.removeLoadingArea("classQuantityPerResolution")
                    },
                    success: function (res) {
                    	console.log("### 3. getClassQuantityPerResolution : ", res.result)
                        if (res.result.code == "200") {
                            const data = res.result.data;
                            /* sample data */
                            // var typeArr = ['HD이하', 'FHD', 'QHD', '4K이상']
                            // var result = typeArr.map((item, index) => {
                            //
                            // 	return { type: item, count: Math.floor(Math.random() * 1000) }
                            // });
                            const result = [
                                {type: 'HD이하\n(1280x720)', count: Math.floor(data.hd_meta_cnt)}, 
                                {type: 'FHD\n(1920x1080)', count: Math.floor(data.fhd_meta_cnt)},
                                {type: 'QHD\n(2560x1440)', count: Math.floor(data.qhd_meta_cnt)},
                                {type: '4K이상\n(3840x2160)', count: Math.floor(data.fk_meta_cnt)}
                            ]

                            that.computed.initClassQuantityPerResolution(result);
//	 							that.computed.initClassQuantityPerResolution(res.result.data)

                            deferred.resolve(res.result);
                            
                        } else {
                            alert(res.result.data);
                        }
                    },
                    error: function (err) {
                        console.log()
                    },
                });
                
                return deferred;
            },

            initClassQuantityPerResolution: function (result) {

                var that = visualizationDetail;
                var chartInfo = that.vis.chartInfo;

                var resolutionType = [];
                var objectCount = []

                for (var i = 0; i < result.length; i++) {
                    var resultData = result[i];
                    resolutionType[i] = resultData['type'];
                    objectCount[i] = resultData['count'];
                }

                // 차트가 생성되어있지 않을때 - 차트 생성
                if (chartInfo['classQuantityPerResolution'] == undefined) {

                    // that.vis.procObjectCountByResolution(resolutionType, objectCount);
                    that.vis.drawChart(procObjectCountByResolution(resolutionType, objectCount)); // graphInfo.js

                } else { // 차트가 생성되어 있을떄 - 차트에서 값만 update 함.

                    that.vis.update('classQuantityPerResolution', resolutionType, objectCount)

                }

                // 조회된 결과가 없을 경우
                if (result.length > 0) {
                    that.pt.find("section#classQuantityPerResolution .chart_wrap .no_result").css("visibility", "hidden");
                } else {
                    that.pt.find("section#classQuantityPerResolution .chart_wrap .no_result").css("visibility", "visible");
                }


            },

            /* === 4. Object 크기별 분포 */
            /*
                - 이미지 해상도를 고려하여 x,y 값은 0~1 로 표
                - x축 : width
                - y축 : height
            */
            getDistributionByObjectSize: function (param) {

                var that = visualizationDetail;
                
                var deferred = $.Deferred();
                
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };
                
                if(param) ajaxData['label'] = param;

                $.ajax({
                    url: baseUrl + "visualization/getDistributionByObjectSize.json",
                    data: ajaxData,
                    type: "GET",
                    traditional: true,
                    beforeSend: function() {
                    	that.render.drawLoadingArea("distributionByObjectSize");
                    },
                    complete : function() {
                    	that.render.removeLoadingArea("distributionByObjectSize")
                    },
                    success: function (res) {
                    	console.log("### 4. getDistributionByObjectSize : ", res.result.data)
                        if (res.result.code == "200") {
                        	
                            result = res.result.data;
                            that.computed.initObjectDistributionBySize(result);
                            deferred.resolve(res.result);
                            
                        } else {
                            alert(res.result.data);
                        }
                    },
                    error: function (err) {
                        console.log()
                    },
                });

                return deferred;
                // that.computed.initObjectDistributionBySize(result);
            },

            initObjectDistributionBySize: function (result) {

                var that = visualizationDetail;
                var chartInfo = that.vis.chartInfo;

                // 차트가 생성되어있지 않을때 - 차트 생성
                if (chartInfo['distributionByObjectSize'] == undefined) {
                	
                    // that.vis.procObjectDistributionBySize(result);
                    that.vis.drawScatterChart(procObjectDistributionBySize(result)); // graphInfo.js

                } else { // 차트가 생성되어 있을떄 - 차트에서 값만 update 함.
                    that.vis.update('distributionByObjectSize', null, result)

                }

                // 조회된 결과가 없을 경우
                if (result.length > 0) {
                    that.pt.find("section#distributionByObjectSize .chart_wrap .no_result").css("visibility", "hidden");
                } else {
                    that.pt.find("section#distributionByObjectSize .chart_wrap .no_result").css("visibility", "visible");
                }
            },

            /* === 5. 경계범위 중심분포 */
           	getBoundaryRangeCentroidDistribution : function(param) {
           		
           		var that = visualizationDetail;
           		var deferred = $.Deferred();
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };
                
                if(param) ajaxData['label'] = param;
                
                $.ajax({
                    url: baseUrl + "visualization/getBoundaryRangeCentroidDistribution.json",
                    data: ajaxData,
                    type: "GET",
                    traditional: true,
                    beforeSend: function() {
                    	that.render.drawLoadingArea("boundaryRangeCentroidDistribution");
                    },
                    complete : function() {
                    	that.render.removeLoadingArea("boundaryRangeCentroidDistribution")
                    },
                    success: function (res) {
                    	
                    	console.log("### 5. getBoundaryRangeCentroidDistribution : ", res.result.data)
                        if (res.result.code == "200") {
                        	
                            result = res.result.data;
                            that.computed.initBoundaryRangeCentroidDistribution(result);
                            
			          		deferred.resolve(res.result);

                        } else {
                            alert(res.result.data);
                        }
                    },
                    error: function (err) {
                        console.log()
                    },
                });
                
           		return deferred;
                
           	},
           	
           	initBoundaryRangeCentroidDistribution : function() {
           	
           		var that = visualizationDetail;
                var chartInfo = that.vis.chartInfo;

                // 차트가 생성되어있지 않을때 - 차트 생성
                if (chartInfo['boundaryRangeCentroidDistribution'] == undefined) {
                    // that.vis.procBoundaryRangeCentroidDistribution(result);
                    that.vis.drawScatterChart(procBoundaryRangeCentroidDistribution(result)); // graphInfo.js

                } else { // 차트가 생성되어 있을떄 - 차트에서 값만 update 함.
                    that.vis.update('boundaryRangeCentroidDistribution', null, result)

                }

                // 조회된 결과가 없을 경우
                if (result.length > 0) {
                    that.pt.find("section#boundaryRangeCentroidDistribution .chart_wrap .no_result").css("visibility", "hidden");
                } else {
                    that.pt.find("section#boundaryRangeCentroidDistribution .chart_wrap .no_result").css("visibility", "visible");
                }
                
           	},

            /* === 6. width별 분포 (누적 그래프) */
            /*
                - x축 : width
                - y축 : 수량
            */
            getLabelCountByWidth: function (param) {

                var that = visualizationDetail;
                
                var deferred = $.Deferred();
                
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };
                
                if(param) ajaxData['label'] = param;

                $.ajax({
                    url: baseUrl + "visualization/getLabelCountByWidth.json",
                    data: ajaxData,
                    type: "GET",
                    traditional: true,
                    beforeSend: function() {
                    	that.render.drawLoadingArea("labelCountByWidth");
                    },
                    complete : function() {
                    	that.render.removeLoadingArea("labelCountByWidth")
                    },
                    success: function (res) {
                    	
                    	console.log("### 6. getLabelCountByWidth : ", res.result.data);
                        if (res.result.code == "200") {
                            data = res.result.data;
                            
                            let result = [];
                            let i = 0;
                            $.each(data, function(index, value) {
                                result[i] = {
                                    type: index,
                                    count: value
                                }
                                i += 1;
                            })
                            
                            that.computed.initLabelCountByWidth(result);
                            deferred.resolve(res.result);
                            

                        } else {
                            alert(res.result.data);
                        }
                    },
                    error: function (err) {
                        console.log()
                    },
                });
                
                return deferred;

            },

            initLabelCountByWidth: function (result) {

                var that = visualizationDetail;
                var chartInfo = that.vis.chartInfo;

                var type = [];
                var count = []

                for (var i = 0; i < result.length; i++) {
                    var resultData = result[i];
                    type[i] = resultData['type'];
                    count[i] = resultData['count'];
                }

                // 차트가 생성되어있지 않을때 - 차트 생성
                if (chartInfo['labelCountByWidth'] == undefined) {

                    // that.vis.procDataCountByWidth(type, count);
                    that.vis.drawChart(procDataCountByWidth(type, count)); // graphInfo.js

                } else { // 차트가 생성되어 있을떄 - 차트에서 값만 update 함.

                    that.vis.update('labelCountByWidth', type, count)

                }

                // 조회된 결과가 없을 경우
                if (result.length > 0) {
                    that.pt.find("section#labelCountByWidth .chart_wrap .no_result").css("visibility", "hidden");
                } else {
                    that.pt.find("section#labelCountByWidth .chart_wrap .no_result").css("visibility", "visible");
                }
                
            },
            
		   /* === 7. height별 분포 (누적 그래프) */
            getLabelCountByHeight : function(param) {
            	
            	var that = visualizationDetail;
            	var deferred = $.Deferred();
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };
                
                if(param) ajaxData['label'] = param;

                $.ajax({
                    url: baseUrl + "visualization/getLabelCountByHeight.json",
                    data: ajaxData,
                    type: "GET",
                    traditional: true,
                    beforeSend: function() {
                    	that.render.drawLoadingArea("labelCountByHeight");
                    },
                    complete : function() {
                    	that.render.removeLoadingArea("labelCountByHeight")
                    },
                    success: function (res) {
                    	
                    	console.log("### 7. getLabelCountByHeight : ", res.result.data);
                        if (res.result.code == "200") {
                            data = res.result.data;
                            
                            let result = [];
                            let i = 0;
                            $.each(data, function(index, value) {
                                result[i] = {
                                    type: index,
                                    count: value
                                }
                                i += 1;
                            })
                            
                            that.computed.initLabelCountByHeight(result);
			            	deferred.resolve(res.result);

                        } else {
                            alert(res.result.data);
                        }
                    },
                    error: function (err) {
                        console.log()
                    },
                });
                
	           	return deferred;
	           	
            },
            
            initLabelCountByHeight : function(result) {
            	
            	var that = visualizationDetail;
                var chartInfo = that.vis.chartInfo;

                var type = [];
                var count = []

                for (var i = 0; i < result.length; i++) {
                    var resultData = result[i];
                    type[i] = resultData['type'];
                    count[i] = resultData['count'];
                }

                // 차트가 생성되어있지 않을때 - 차트 생성
                if (chartInfo['labelCountByHeight'] == undefined) {

                    that.vis.drawChart(procLabelCountByHeight(type, count)); // graphInfo.js

                } else { // 차트가 생성되어 있을떄 - 차트에서 값만 update 함.

                    that.vis.update('labelCountByHeight', type, count)

                }

                // 조회된 결과가 없을 경우
                if (result.length > 0) {
                    that.pt.find("section#labelCountByHeight .chart_wrap .no_result").css("visibility", "hidden");
                } else {
                    that.pt.find("section#labelCountByHeight .chart_wrap .no_result").css("visibility", "visible");
                }
            },
            
            /* === 8. centerY별 분포 */
           	getLabelCountByCenterY : function(param) {
           		
           		var that = visualizationDetail;
           		var deferred = $.Deferred();
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };
                
                if(param) ajaxData['label'] = param;
                
                $.ajax({
                    url: baseUrl + "visualization/getLabelCountByCenterY.json",
                    data: ajaxData,
                    type: "GET",
                    traditional: true,
                    beforeSend: function() {
                    	that.render.drawLoadingArea("labelCountByCenterY");
                    },
                    complete : function() {
                    	that.render.removeLoadingArea("labelCountByCenterY")
                    },
                    success: function (res) {
                    	console.log("### 8. getLabelCountByCenterY : ", res.result.data);
                        if (res.result.code == "200") {
                            
                            data = res.result.data;
                            
                            let result = [];
                            let i = 0;
                            $.each(data, function(index, value) {
                                result[i] = {
                                    type: index,
                                    count: value
                                }
                                i += 1;
                            })
                            that.computed.initLabelCountByCenterY(result);

                       		deferred.resolve(res.result);
                       		

                        } else {
                            alert(res.result.data);
                        }
                    },
                    error: function (err) {
                        console.log()
                    },
                });
                
                return deferred;
           	},
           	
           	initLabelCountByCenterY : function(result) {
           	
           		var that = visualizationDetail;
                var chartInfo = that.vis.chartInfo;
                
                var type = [];
                var count = []

                for (var i = 0; i < result.length; i++) {
                    var resultData = result[i];
                    type[i] = resultData['type'];
                    count[i] = resultData['count'];
                }

                // 차트가 생성되어있지 않을때 - 차트 생성
                if (chartInfo['labelCountByCenterY'] == undefined) {
                    
                    that.vis.drawChart(procLabelCountByCenterY(type, count)); // graphInfo.js

                } else { // 차트가 생성되어 있을떄 - 차트에서 값만 update 함.
                    that.vis.update('labelCountByCenterY', type, count)

                }

                // 조회된 결과가 없을 경우
                if (result.length > 0) {
                    that.pt.find("section#labelCountByCenterY .chart_wrap .no_result").css("visibility", "hidden");
                } else {
                    that.pt.find("section#labelCountByCenterY .chart_wrap .no_result").css("visibility", "visible");
                }
                
           	},
           	
           	/* === 9. centerX별 분포 */
           	getLabelCountByCenterX : function(param) {
           		
           		var that = visualizationDetail;
           		var deferred = $.Deferred();
           		
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };
                
                if(param) ajaxData['label'] = param;
                
                $.ajax({
                    url: baseUrl + "visualization/getLabelCountByCenterX.json",
                    data: ajaxData,
                    type: "GET",
                    traditional: true,
                    beforeSend: function() {
                    	that.render.drawLoadingArea("labelCountByCenterX");
                    },
                    complete : function() {
                    	that.render.removeLoadingArea("labelCountByCenterX")
                    },
                    success: function (res) {
                    	console.log("### 9. getLabelCountByCenterX : ", res.result.data);
                        if (res.result.code == "200") {
                            
                            data = res.result.data;
                            
                            let result = [];
                            let i = 0;
                            $.each(data, function(index, value) {
                                result[i] = {
                                    type: index,
                                    count: value
                                }
                                i += 1;
                            })
                            that.computed.initLabelCountByCenterX(result);
                            deferred.resolve(res.result);
                       		

                        } else {
                            alert(res.result.data);
                        }
                    },
                    error: function (err) {
                        console.log()
                    },
                });
                
                return deferred;
                
           	}, 
           	
           	initLabelCountByCenterX : function(result) {
           		
           		var that = visualizationDetail;
                var chartInfo = that.vis.chartInfo;
                
                var type = [];
                var count = []

                for (var i = 0; i < result.length; i++) {
                    var resultData = result[i];
                    type[i] = resultData['type'];
                    count[i] = resultData['count'];
                }

                // 차트가 생성되어있지 않을때 - 차트 생성
                if (chartInfo['labelCountByCenterX'] == undefined) {
                    
                    that.vis.drawChart(procLabelCountByCenterX(type, count)); // graphInfo.js

                } else { // 차트가 생성되어 있을떄 - 차트에서 값만 update 함.
                    that.vis.update('labelCountByCenterX', type, count)

                }

                // 조회된 결과가 없을 경우
                if (result.length > 0) {
                    that.pt.find("section#labelCountByCenterX .chart_wrap .no_result").css("visibility", "hidden");
                } else {
                    that.pt.find("section#labelCountByCenterX .chart_wrap .no_result").css("visibility", "visible");
                }
                
           	},
           	

        }, // computed end
        
        
       	render : {
       		
       		drawLoadingArea : function(graphId) {
       			
       			
       			var that = visualizationDetail;
       			
       			var area = that.pt.find("section#" + graphId + " .chart_wrap")
       			var loadingContent = '<div class="loading"></div>';
       			
       			area.append(loadingContent);       			
       		},
       		
       		removeLoadingArea : function(graphId) {
       			
       			var that = visualizationDetail;
       			that.pt.find("section#" + graphId + " .chart_wrap .loading").remove();
       			
       		},
       		
       		renderLabelOption : function(resultData) {
       			
       			var that = visualizationDetail;
       			var target = that.pt.find("select#label_id");
       			var html = "<option value='ALL'>전체</optioin>";
       			
       			that.pt.find("select#label_id").empty();       			
       			
       			if(resultData.length > 0) {
       				for(var i=0; i<resultData.length; i++) {
       					html += "<option value='" + resultData[i]['label'] + "'>";
       					html += resultData[i]['label'];
       					html += "</option>"
       				}
       			} 
       			
       			target.append(html);
       			that.bind.listener();
       		},
       		
       	},

        vis: {

            chartInfo: {},
            init: function () { },

            /* ### 일반 막대그래프 */
            drawChart: function (optionObj) {

                var that = visualizationDetail;

                var chartOption = {
                    title: {
                        text: optionObj['chartTitle'],
                        left: 'center',
                    },
                    grid: {
                        /* left : '0px',
                        right : '0px',
                        top : '0px',
                        bottom : '0px',
                        containLabel : true, */
                    },
                    legend: {
                        show: optionObj['legend'], // false
                        orient: 'vertical',
                    },
                    dataZoom: [],
                    xAxis: [
                        {
                            name: optionObj['xAxisName'],
                            nameTextStyle: {color: "#999", verticalAlign: "top", lineHeight: 50,},
                            type: 'category',
                            data: optionObj['xAxisData'],
                            axisTick: {show: false},
                            axisLabel: {
//	 								fontFamily : '',
                                fontSize: 13,
                                color: '#999',
                                LineHeight: 30,
//	 								formatter : function(value) {
//	 									return "";
//	 								}			
                                interval : 'auto',
                            },
                            axisLine: {onZero: false, lineStyle: {color: "#e4e4e4"}},
                        },
                        {
                            type: 'category',
                            axisTick: {show: false},
                            axisLine: {onZero: false, lineStyle: {color: "#e4e4e4"}},
                            // 여기!! 
                            /// axisLabel : { interval : 0 },

                        }
                    ],
                    yAxis: [
                        {
                            name: optionObj['yAxisName'],
                            nameTextStyle: {color: "#999"},
                            position: 'left',
// 								splitNumber: 3,
                            axisLabel: {
// 									fontFamily : '',
                                fontSize: 13,
                                color: '#999',
                            },
                            axisTick: {show: false},
                            axisLine: {show: true, lineStyle: {color: "#e4e4e4"}},
                            boundaryGap: [0, '10%'],

                        },
                        {
                            position: 'right',
                            axisTick: {show: false},
                            axisLine: {show: true, lineStyle: {color: "#e4e4e4"}},

                        }

                    ],
                    tooltip: {},
                    series: optionObj['series'],

                };


                if (optionObj['zoomOption']) {
                	if(optionObj['zoomOption'] == "inside") {
                		console.log("INSIDE ZOOM!!!!!")
                		chartOption['dataZoom'] = [
	                        { type: 'inside' },
	                    ];
                	} else {
                		
                		chartOption['dataZoom'] = [
	                        { type: 'inside' },
	                        { type: 'slider', showDataShadow: false, /* handleIcon: , */ handleSize: '80%', height: 20, },
	                        { type: 'inside', orient: 'vertical' },
	                        { type: 'slider', orient: 'vertical', showDataShadow: false, handleSize: '80%', width: 20, }
	                    ];
                	}

                }

                if (optionObj['stacked']) {
	
                }
                
               	if (typeof optionObj['xAxisInterval'] != 'undefined') {
               		chartOption['xAxis'][0]['axisLabel']['interval'] = optionObj['xAxisInterval'];
               	}

               	
                that.vis.set(optionObj['target'] + " .chart", chartOption, optionObj['chartName']);

            },

            /* ### 누적 막대 그래프 */

            /* ### 분포도 점 그래프  */
            drawScatterChart: function (optionObj) {
                var that = visualizationDetail;

                var chartOption = {
                    title: {
                        text: optionObj['chartTitle'],
                        left: 'center',
                    },
                    grid: {},
                    legend: {
                        show: optionObj['legend'], // false
                        orient: 'vertical',
                    },
                    dataZoom: [
                        {
                            type: 'inside'
                        },
                        {
                            type: 'slider',
                            showDataShadow: false,
                            // handleIcon: ,
                            handleSize: '80%',
                            height: 20,
                        },
                        {
                            type: 'inside',
                            orient: 'vertical'
                        },
                        {
                            type: 'slider',
                            orient: 'vertical',
                            showDataShadow: false,
                            handleSize: '80%',
                            width: 20,

                        }
                    ],
                    xAxis: [
                        {
                            name: optionObj['xAxisName'],
                            nameTextStyle: {color: "#999", verticalAlign: "top", lineHeight: 50,},
                            type: 'value',
                            scale: true,
                            /* splitLine : {
                                show: false,
                            }, */
                            axisTick: {show: false},
                            axisLabel: {
//	 								fontFamily : '',
                                fontSize: 13,
                                color: '#999',
                                LineHeight: 30,
//	 								formatter : function(value) {
//	 									return "";
//	 								}						
                            },
                            axisLine: {onZero: false, lineStyle: {color: "#e4e4e4"}},
                            min : 0,
                            max : 1,
                        }
                    ],
                    yAxis: [
                        {
                            name: optionObj['yAxisName'],
                            nameTextStyle: {color: "#999",},
                            type: 'value',
                            scale: true,
                            /* splitLine : {
                                show: false,
                            }, */
                            axisTick: {show: false},
                            axisLabel: {
//	 								fontFamily : '',
                                fontSize: 13,
                                color: '#999',
                                LineHeight: 30,
//	 								formatter : function(value) {
//	 									return "";
//	 								}						
                            },
                            axisLine: {onZero: false, lineStyle: {color: "#e4e4e4"}},
                            min : 0,
                            max : 1,
                        }
                    ],

                    tooltip: {
                        formatter: function (params) {
                            // console.log("value", params.value)
                            var text =
                                optionObj['xAxisName'] + ' : ' + params.value[0] + '<br/>' +
                                optionObj['yAxisName'] + ' : ' + params.value[1];

                            return text;


                        },
                    },
                    series: optionObj['series'],
                }

                that.vis.set(optionObj['target'] + " .chart", chartOption, optionObj['chartName']);
            },

            set: function (target, chartOption, chartName) {

                // console.log("### charcOption : ", chartOption.title)

                var that = visualizationDetail;
                var chart = echarts.init($(target)[0]);
                chart.setOption(chartOption);

                var chartInfo = that.vis.chartInfo;
                chartInfo[chartName] = chart;


                that.bind.listener();
// 				that.bind.chartResizeEvt(chart);
            },

            update: function (chartName, xAsisData, seriesData) {

                var that = visualizationDetail;
                var chartInfo = that.vis.chartInfo;

                var chart = chartInfo[chartName];
                var option = chart.getOption();
				
                if(xAsisData != null) option.xAxis[0].data = xAsisData;
                option.series[0].data = seriesData;

                chart.setOption(option);


            },
            
            


        }

    }
</script>
