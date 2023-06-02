/* === 1. DATA Size 분포 : 해상도 별 데이터  */
function procDataCountByResolution (xAxisData, seriesData) {

        var optionObj = {
            chartTitle: "",
            chartName: "",
            target: "",
            xAxisName: "",
            xAxisData: [],
            yAxisName: "",
            lagened: null,
            series: []
        };


        optionObj['chartTitle'] = "해상도별 데이터 수량";
        optionObj['chartName'] = "dataQuantityPerResolution";
        optionObj['target'] = "section#dataQuantityPerResolution .chart_wrap";
        optionObj['xAxisName'] = "해상도";
        optionObj['xAxisData'] = xAxisData;
        optionObj['yAxisName'] = "데이터 수량";
        optionObj['series'] = [
            {
                name: '해상도별 데이터 수량',
                type: 'bar',
                barWidth: '8%',
                data: seriesData,
                itemStyle: {
                    emphasis: {colo: "#fcaf17", barBorderRadius: [10, 10, 0, 0]},
                    normal: {color: "#fcaf17", barBorderRadius: [10, 10, 0, 0]},
                }
            }
        ];
        
        optionObj['xAxisInterval'] = 0; // 0 로 표시할시 xAxis 가 다 표시

        return optionObj;

}

/* === 2. Class별 수량 분포 */
function procDataCountByClass (xAxisData, seriesData) {

    

    var optionObj = {
        chartTitle: "",
        chartName: "",
        target: "",
        xAxisName: "",
        xAxisData: [],
        yAxisName: "",
        legend: false,
        series: []
    };

    optionObj['chartTitle'] = "클래스별 데이터 수량"
    optionObj['chartName'] = "dataQuantityPerClass";
    optionObj['target'] = "section#dataQuantityPerClass .chart_wrap";
    optionObj['xAxisName'] = "클래스";
    optionObj['xAxisData'] = xAxisData;
    optionObj['yAxisName'] = "데이터 수량";
    optionObj['series'] = [
        {
            name: '클래스별 수량',
            type: 'bar',
            barWidth: '8%',
            data: seriesData,
            itemStyle: {
                emphasis: {colo: "#517be5", barBorderRadius: [10, 10, 0, 0]},
                normal: {color: "#517be5", barBorderRadius: [10, 10, 0, 0]},
            }
        }
    ];
    
    optionObj['zoomOption'] = "inside";

    return optionObj;

}

/* === 3. Object 크기별 분포 -> 해상도별 객체 개수 */
function procObjectCountByResolution (xAxisData, seriesData) {

    

    var optionObj = {
        chartTitle: "",
        chartName: "",
        target: "",
        xAxisName: "",
        xAxisData: [],
        yAxisName: "",
        legend: false,
        series: []
    };

    optionObj['chartTitle'] = "해상도별 객체 수량"
    optionObj['chartName'] = "classQuantityPerResolution";
    optionObj['target'] = "section#classQuantityPerResolution .chart_wrap";
    optionObj['xAxisName'] = "해상도";
    optionObj['xAxisData'] = xAxisData;
    optionObj['yAxisName'] = "객체 수량";
    optionObj['series'] = [
        {
            name: '해상도별 객체 수량',
            type: 'bar',
            barWidth: '8%',
            data: seriesData,
            itemStyle: {
                emphasis: {colo: "#f35353", barBorderRadius: [10, 10, 0, 0]},
                normal: {color: "#f35353", barBorderRadius: [10, 10, 0, 0]},
            }
        }
    ];
    
    optionObj['xAxisInterval'] = 0; // 0 로 표시할시 xAxis 가 다 표시0

    return optionObj;

}

/* === 4. Object 크기별 분포 */
function procObjectDistributionBySize(seriesData) {

    var that = visualizationDetail;
    var optionObj = {
        chartTitle: "",
        chartName: "",
        target: "",
        xAxisName: "",
        xAxisData: [],
        yAxisName: "",
        legendData: null,
        series: []
    };

    optionObj['chartTitle'] = "오브젝트 크기별 분포";
    optionObj['chartName'] = "distributionByObjectSize";
    optionObj['target'] = "section#distributionByObjectSize .chart_wrap";
    optionObj['xAxisName'] = "width";
    optionObj['xAxisData'] = null;
    optionObj['yAxisName'] = "height";
    optionObj['series'] = [
        {
            name: '오브젝트 크기별 분포',
            type: 'scatter',
            data: seriesData,
            itemStyle: {
                opacity: 0.8
            },
            symbolSize: 3,

            large: true,
            largeThreshold: 500,

        }
    ];


    return optionObj;
}

  
/* === 5. 경계범위 중심분포 */     
function procBoundaryRangeCentroidDistribution(seriesData) {
	
    var optionObj = {
        chartTitle: "",
        chartName: "",
        target: "",
        xAxisName: "",
        xAxisData: [],
        yAxisName: "",
        legendData: null,
        series: []
    };

    optionObj['chartTitle'] = "경계범위 중심 분포";
    optionObj['chartName'] = "boundaryRangeCentroidDistribution";
    optionObj['target'] = "section#boundaryRangeCentroidDistribution .chart_wrap";
    optionObj['xAxisName'] = "x";
    optionObj['xAxisData'] = null;
    optionObj['yAxisName'] = "y";
    optionObj['series'] = [
        {
            name: '경계범위 중심 분포',
            type: 'scatter',
            data: seriesData,
            itemStyle: {
                opacity: 0.8
            },
            symbolSize: 3,

            large: true,
            largeThreshold: 500,

        }
    ];


  	return optionObj;
    
}

/* === 6. width별 분포 (누적 그래프) */
function procDataCountByWidth(xAxisData, seriesData) {
    

    var optionObj = {
        chartTitle: "",
        chartName: "",
        target: "",
        xAxisName: "",
        xAxisData: [],
        yAxisName: "",
        legend: false,
        series: []
    };

    optionObj['chartTitle'] = "width별 분포"
    optionObj['chartName'] = "labelCountByWidth";
    optionObj['target'] = "section#labelCountByWidth .chart_wrap";
    optionObj['xAxisName'] = "width";
    optionObj['xAxisData'] = xAxisData;
    optionObj['yAxisName'] = "수량";
    optionObj['series'] = [
        {
            name: 'width별 수량',
            type: 'bar',
            barWidth: '50%',
            data: seriesData,
            itemStyle: {
                emphasis: {colo: "#0C59A9" },
                normal: {color: "#0C59A9" },
            }
        }
    ];
    optionObj['zoomOption'] = true;
    optionObj['stacked'] = true;

    return optionObj;
}

function procLabelCountByHeight(xAxisData, seriesData) {
    

    var optionObj = {
        chartTitle: "",
        chartName: "",
        target: "",
        xAxisName: "",
        xAxisData: [],
        yAxisName: "",
        legend: false,
        series: []
    };

    optionObj['chartTitle'] = "height별 분포"
    optionObj['chartName'] = "dataCountByWidth";
    optionObj['target'] = "section#labelCountByHeight .chart_wrap";
    optionObj['xAxisName'] = "height";
    optionObj['xAxisData'] = xAxisData;
    optionObj['yAxisName'] = "수량";
    optionObj['series'] = [
        {
            name: 'height별 수량',
            type: 'bar',
            barWidth: '50%',
            data: seriesData,
            itemStyle: {
                emphasis: {colo: "#0C59A9" },
                normal: {color: "#0C59A9" },
            }
        }
    ];
    optionObj['zoomOption'] = true;
    optionObj['stacked'] = true;

    return optionObj;
}

/* === 8. centerY별 분포 */
function procLabelCountByCenterY(xAxisData, seriesData) {
    

    var optionObj = {
        chartTitle: "",
        chartName: "",
        target: "",
        xAxisName: "",
        xAxisData: [],
        yAxisName: "",
        legend: false,
        series: []
    };

    optionObj['chartTitle'] = "centerY별 분포"
    optionObj['chartName'] = "labelCountByCenterY";
    optionObj['target'] = "section#labelCountByCenterY .chart_wrap";
    optionObj['xAxisName'] = "center";
    optionObj['xAxisData'] = xAxisData;
    optionObj['yAxisName'] = "수량";
    optionObj['series'] = [
        {
            name: 'height별 수량',
            type: 'bar',
            barWidth: '50%',
            data: seriesData,
            itemStyle: {
                emphasis: {colo: "#0C59A9" },
                normal: {color: "#0C59A9" },
            }
        }
    ];
    optionObj['zoomOption'] = true;
    optionObj['stacked'] = true;

    return optionObj;
}

/* === 9. centerX별 분포 */
function procLabelCountByCenterX(xAxisData, seriesData) {
    

    var optionObj = {
        chartTitle: "",
        chartName: "",
        target: "",
        xAxisName: "",
        xAxisData: [],
        yAxisName: "",
        legend: false,
        series: []
    };

    optionObj['chartTitle'] = "centerX별 분포"
    optionObj['chartName'] = "labelCountByCenterX";
    optionObj['target'] = "section#labelCountByCenterX .chart_wrap";
    optionObj['xAxisName'] = "center";
    optionObj['xAxisData'] = xAxisData;
    optionObj['yAxisName'] = "수량";
    optionObj['series'] = [
        {
            name: 'centerX별 분포',
            type: 'bar',
            barWidth: '50%',
            data: seriesData,
            itemStyle: {
                emphasis: {colo: "#0C59A9" },
                normal: {color: "#0C59A9" },
            }
        }
    ];
    optionObj['zoomOption'] = true;
    optionObj['stacked'] = true;

    return optionObj;
}