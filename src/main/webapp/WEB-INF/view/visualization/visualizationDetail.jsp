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
	                <label>Dataset id : <span id="datasetId">-</span></label>
	                <label>Dataset name : <span id="datasetName">-</span></label>
            	</div>
            	<div class="wrap">            	
	                <label>Label</label>
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
                <!-- 경계범위(bounding box)중심분포 -->
                <section id="boundaryRangeCentroidDistribution">
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
                <!-- ========================================================= -->

                <!-- heigh별 분포 -->
                <section id="labelCountByHeight">
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
                <!-- center x별 분포 -->
                <section id="labelCountByCenterX">
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
            // j.seo (오브젝트 크기별 분포)
            testData: [
                [161.2, 51.6], [167.5, 59.0], [159.5, 49.2], [157.0, 63.0], [155.8, 53.6],
                [170.0, 59.0], [159.1, 47.6], [166.0, 69.8], [176.2, 66.8], [160.2, 75.2],
                [172.5, 55.2], [170.9, 54.2], [172.9, 62.5], [153.4, 42.0], [160.0, 50.0],
                [147.2, 49.8], [168.2, 49.2], [175.0, 73.2], [157.0, 47.8], [167.6, 68.8],
                [159.5, 50.6], [175.0, 82.5], [166.8, 57.2], [176.5, 87.8], [170.2, 72.8],
                [174.0, 54.5], [173.0, 59.8], [179.9, 67.3], [170.5, 67.8], [160.0, 47.0],
                [154.4, 46.2], [162.0, 55.0], [176.5, 83.0], [160.0, 54.4], [152.0, 45.8],
                [162.1, 53.6], [170.0, 73.2], [160.2, 52.1], [161.3, 67.9], [166.4, 56.6],
                [168.9, 62.3], [163.8, 58.5], [167.6, 54.5], [160.0, 50.2], [161.3, 60.3],
                [167.6, 58.3], [165.1, 56.2], [160.0, 50.2], [170.0, 72.9], [157.5, 59.8],
                [167.6, 61.0], [160.7, 69.1], [163.2, 55.9], [152.4, 46.5], [157.5, 54.3],
                [168.3, 54.8], [180.3, 60.7], [165.5, 60.0], [165.0, 62.0], [164.5, 60.3],
                [156.0, 52.7], [160.0, 74.3], [163.0, 62.0], [165.7, 73.1], [161.0, 80.0],
                [162.0, 54.7], [166.0, 53.2], [174.0, 75.7], [172.7, 61.1], [167.6, 55.7],
                [151.1, 48.7], [164.5, 52.3], [163.5, 50.0], [152.0, 59.3], [169.0, 62.5],
                [164.0, 55.7], [161.2, 54.8], [155.0, 45.9], [170.0, 70.6], [176.2, 67.2],
                [170.0, 69.4], [162.5, 58.2], [170.3, 64.8], [164.1, 71.6], [169.5, 52.8],
                [163.2, 59.8], [154.5, 49.0], [159.8, 50.0], [173.2, 69.2], [170.0, 55.9],
                [161.4, 63.4], [169.0, 58.2], [166.2, 58.6], [159.4, 45.7], [162.5, 52.2],
                [159.0, 48.6], [162.8, 57.8], [159.0, 55.6], [179.8, 66.8], [162.9, 59.4],
                [161.0, 53.6], [151.1, 73.2], [168.2, 53.4], [168.9, 69.0], [173.2, 58.4],
                [171.8, 56.2], [178.0, 70.6], [164.3, 59.8], [163.0, 72.0], [168.5, 65.2],
                [166.8, 56.6], [172.7, 105.2], [163.5, 51.8], [169.4, 63.4], [167.8, 59.0],
                [159.5, 47.6], [167.6, 63.0], [161.2, 55.2], [160.0, 45.0], [163.2, 54.0],
                [162.2, 50.2], [161.3, 60.2], [149.5, 44.8], [157.5, 58.8], [163.2, 56.4],
                [172.7, 62.0], [155.0, 49.2], [156.5, 67.2], [164.0, 53.8], [160.9, 54.4],
                [162.8, 58.0], [167.0, 59.8], [160.0, 54.8], [160.0, 43.2], [168.9, 60.5],
                [158.2, 46.4], [156.0, 64.4], [160.0, 48.8], [167.1, 62.2], [158.0, 55.5],
                [167.6, 57.8], [156.0, 54.6], [162.1, 59.2], [173.4, 52.7], [159.8, 53.2],
                [170.5, 64.5], [159.2, 51.8], [157.5, 56.0], [161.3, 63.6], [162.6, 63.2],
                [160.0, 59.5], [168.9, 56.8], [165.1, 64.1], [162.6, 50.0], [165.1, 72.3],
                [166.4, 55.0], [160.0, 55.9], [152.4, 60.4], [170.2, 69.1], [162.6, 84.5],
                [170.2, 55.9], [158.8, 55.5], [172.7, 69.5], [167.6, 76.4], [162.6, 61.4],
                [167.6, 65.9], [156.2, 58.6], [175.2, 66.8], [172.1, 56.6], [162.6, 58.6],
                [160.0, 55.9], [165.1, 59.1], [182.9, 81.8], [166.4, 70.7], [165.1, 56.8],
                [177.8, 60.0], [165.1, 58.2], [175.3, 72.7], [154.9, 54.1], [158.8, 49.1],
                [172.7, 75.9], [168.9, 55.0], [161.3, 57.3], [167.6, 55.0], [165.1, 65.5],
                [175.3, 65.5], [157.5, 48.6], [163.8, 58.6], [167.6, 63.6], [165.1, 55.2],
                [165.1, 62.7], [168.9, 56.6], [162.6, 53.9], [164.5, 63.2], [176.5, 73.6],
                [168.9, 62.0], [175.3, 63.6], [159.4, 53.2], [160.0, 53.4], [170.2, 55.0],
                [162.6, 70.5], [167.6, 54.5], [162.6, 54.5], [160.7, 55.9], [160.0, 59.0],
                [157.5, 63.6], [162.6, 54.5], [152.4, 47.3], [170.2, 67.7], [165.1, 80.9],
                [172.7, 70.5], [165.1, 60.9], [170.2, 63.6], [170.2, 54.5], [170.2, 59.1],
                [161.3, 70.5], [167.6, 52.7], [167.6, 62.7], [165.1, 86.3], [162.6, 66.4],
                [152.4, 67.3], [168.9, 63.0], [170.2, 73.6], [175.2, 62.3], [175.2, 57.7],
                [160.0, 55.4], [165.1, 104.1], [174.0, 55.5], [170.2, 77.3], [160.0, 80.5],
                [167.6, 64.5], [167.6, 72.3], [167.6, 61.4], [154.9, 58.2], [162.6, 81.8],
                [175.3, 63.6], [171.4, 53.4], [157.5, 54.5], [165.1, 53.6], [160.0, 60.0],
                [174.0, 73.6], [162.6, 61.4], [174.0, 55.5], [162.6, 63.6], [161.3, 60.9],
                [156.2, 60.0], [149.9, 46.8], [169.5, 57.3], [160.0, 64.1], [175.3, 63.6],
                [169.5, 67.3], [160.0, 75.5], [172.7, 68.2], [162.6, 61.4], [157.5, 76.8],
                [176.5, 71.8], [164.4, 55.5], [160.7, 48.6], [174.0, 66.4], [163.8, 67.3],
                //

            ],
        },
        init: function (datasetName, datasetId) {

            var that = visualizationDetail;

            that.data.datasetId = datasetId;
            that.data.datasetName = datasetName;

            // 데이터셋 이름, ID setting
            that.pt.find("#datasetId").text(datasetId);
            that.pt.find("#datasetName").text(datasetName);

            // 차트 데이터 호출
            that.callDeferred();
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


            },

        },
        
        callDeferred : function() {
        
        	var that = visualizationDetail;
        	
        	
        	console.log("===== START !! ")
        	that.pt.find("select#label_id").attr("disabled", true);
        	visualization.pt.find("#workspace").append("<div class='loading'></div>")
        	
        	$.when(
       			that.computed.getDataQuantityPerResolution(),
                that.computed.getDataQuantityPerClass(),
                that.computed.getClassQuantityPerResolution(),
       			that.computed.getBoundaryRangeCentroidDistribution(),
				that.computed.getDistributionByObjectSize(),
               	that.computed.getLabelCountByWidth(),
                that.computed.getLabelCountByHeight(),
       			that.computed.getLabelCountByCenterY(),
       			that.computed.getLabelCountByCenterX(),
        	).done(function(){
        		console.log("===== END !! ")
        		visualization.pt.find("#workspace .loading").remove();
		      	that.pt.find("select#label_id").attr("disabled", false);
        	});
        },

        computed: {

            /* === 1. DATA Size 분포 : 해상도 별 데이터  */
            /*
                - 해상도에 따른 DATA 수 분포
                - x축 : hd이하,hd,fhd,QHD,4k이상
                - y축 : count
            */
            getDataQuantityPerResolution: function () {

                var that = visualizationDetail;
                
               	var deferred = $.Deferred();
                
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };

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
                                {type: 'HD이하', count: Math.floor(data.hd_data_cnt)},
                                {type: 'FHD', count: Math.floor(data.fhd_data_cnt)},
                                {type: 'QHD', count: Math.floor(data.qhd_data_cnt)},
                                {type: '4K이상', count: Math.floor(data.fk_data_cnt)}
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
                    that.pt.find("section#dataQuantityPerResolution .chart_wrap .no_result").css("visibility", "hide");
                } else {
                    that.pt.find("section#dataQuantityPerResolution .chart_wrap .no_result").css("visibility", "visible");
                }

            },

            /* === 2. Class별 수량 분포 */
            /*
                - 클래스별 수량 top 10만 표출
            */
            getDataQuantityPerClass: function () {

                var that = visualizationDetail;
                
                var deferred = $.Deferred();
                
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };

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
                    that.pt.find("section#dataQuantityPerClass .chart_wrap .no_result").css("visibility", "hide");
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

            getClassQuantityPerResolution: function () {

                var that = visualizationDetail;
                
                var deferred = $.Deferred();
                
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };

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
                                {type: 'HD이하', count: Math.floor(data.hd_meta_cnt)}
                                , {type: 'FHD', count: Math.floor(data.fhd_meta_cnt)}
                                , {type: 'QHD', count: Math.floor(data.qhd_meta_cnt)}
                                , {type: '4K이상', count: Math.floor(data.fk_meta_cnt)}
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
                    that.pt.find("section#classQuantityPerResolution .chart_wrap .no_result").css("visibility", "hide");
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
            getDistributionByObjectSize: function () {

                var that = visualizationDetail;
                
                var deferred = $.Deferred();
                
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };

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
                    that.pt.find("section#distributionByObjectSize .chart_wrap .no_result").css("visibility", "hide");
                } else {
                    that.pt.find("section#distributionByObjectSize .chart_wrap .no_result").css("visibility", "visible");
                }
            },

            /* === 5. 경계범위 중심분포 */
           	getBoundaryRangeCentroidDistribution : function() {
           		
           		var that = visualizationDetail;
           		var deferred = $.Deferred();
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };
                
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
                    that.pt.find("section#boundaryRangeCentroidDistribution .chart_wrap .no_result").css("visibility", "hide");
                } else {
                    that.pt.find("section#boundaryRangeCentroidDistribution .chart_wrap .no_result").css("visibility", "visible");
                }
                
           	},

            /* === 6. width별 분포 (누적 그래프) */
            /*
                - x축 : width
                - y축 : 수량
            */
            getLabelCountByWidth: function () {

                var that = visualizationDetail;
                
                var deferred = $.Deferred();
                
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };

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
                    that.pt.find("section#labelCountByWidth .chart_wrap .no_result").css("visibility", "hide");
                } else {
                    that.pt.find("section#labelCountByWidth .chart_wrap .no_result").css("visibility", "visible");
                }
                
            },
            
		   /* === 7. height별 분포 (누적 그래프) */
            getLabelCountByHeight : function() {
            	
            	var that = visualizationDetail;
            	var deferred = $.Deferred();
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };

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
                    that.pt.find("section#labelCountByHeight .chart_wrap .no_result").css("visibility", "hide");
                } else {
                    that.pt.find("section#labelCountByHeight .chart_wrap .no_result").css("visibility", "visible");
                }
            },
            
            /* === 8. centerY별 분포 */
           	getLabelCountByCenterY : function() {
           		
           		var that = visualizationDetail;
           		var deferred = $.Deferred();
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };
                
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
                    that.pt.find("section#labelCountByCenterY .chart_wrap .no_result").css("visibility", "hide");
                } else {
                    that.pt.find("section#labelCountByCenterY .chart_wrap .no_result").css("visibility", "visible");
                }
                
           	},
           	
           	/* === 9. centerX별 분포 */
           	getLabelCountByCenterX : function() {
           		
           		var that = visualizationDetail;
           		var deferred = $.Deferred();
           		
                var ajaxData = {
                    dataset_id: that.data.datasetId,
                };
                
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
                    that.pt.find("section#labelCountByCenterX .chart_wrap .no_result").css("visibility", "hide");
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
                            },
                            axisLine: {onZero: false, lineStyle: {color: "#e4e4e4"}},
                        },
                        {
                            type: 'category',
                            axisTick: {show: false},
                            axisLine: {onZero: false, lineStyle: {color: "#e4e4e4"}},

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