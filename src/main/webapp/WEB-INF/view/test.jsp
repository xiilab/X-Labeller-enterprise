<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <jsp:include page="/header"  flush="false" /> --%>

<%-- 	<script src="<c:url value="/js/echarts-all-3.js" />"></script> --%>

	<script src="<c:url value="/js/jquery-3.3.1.min.js" />"></script>
	<script src="<c:url value="/js/frame-extract.js" />"></script>
<style>
	.pie {width: 600px; height: 300px;}
	#log{
		overflow-y: scroll;
	    height: 300px;
	    width:800px;
    }
	#tt {margin-top:100px}
	#tt input{width:100px;height:50px}
	
</style>
<body>
	<div class="w1280">
		<div id="test_wrap">
			
		
		</div>
	
		<div id="tt">
			<input id="file1" type="file" name="file1"></input>
			
			
			
		</div>
		<div id='video_wrap'>
		</div>
	
		<div id="test">
		
			<div class="pie"></div>
		</div>
		<div id="log">
		</div>
	</div>
	
	
</body>
<script>
var isPrepend = 0;

var test = function(){
	
	//ip,index,status,node_id
	
	var data = [{"node_ip":"192.168.1.12","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"1"},
	{"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"}];
	
	var renderArr = []; 
	
	for(var j = 0 ; j < data.length ; j++){
	
		var tempObj = data[j];
		var node_ip = tempObj["node_ip"];
	 	var gpu_node_id = tempObj["gpu_node_id"];
		
		var agiArr = tempObj["available_gpu_index"].split(",");
		for(var i = 0 ; i < agiArr.length ; i++){
			var status = "true";	
			var resultObj = {"node_ip":node_ip,"index":agiArr[i],"status":status,"gpu_node_id":gpu_node_id};
			renderArr.push(resultObj);
			
		}
		var ugiArr = tempObj["unavailable_gpu_index"].split(",");
		for(var i = 0 ; i < ugiArr.length ; i++){
			var status = "false";
			var resultObj = {"node_ip":node_ip,"index":ugiArr[i],"status":status,"gpu_node_id":gpu_node_id};
			renderArr.push(resultObj);
			
		}
	}
	
	var html = "";
	
	for(var i = 0 ; i < renderArr.length;i++){
		var renderObj = renderArr[i];
		var template = "<div>"+renderObj["node_ip"]+"</div>"+"<div>"+renderObj["index"]+"</div>"+"<div>"+renderObj["status"]+"</div>"+"<div>"+renderObj["gpu_node_id"]+"</div>";
		html+= template;
	}
	
	$("#test_wrap").html(html);
	
	
	
}

var bb = function(url){
	VideoToFrames.getFrames(url, 30, VideoToFramesMethod.totalFrames).then(function (frames) {
		console.log("TEST");
	    
// 	    Do something with the frame data: eg: output them as canvasses to the DOM
	    frames.forEach(function (frame) {
	        var canvas = document.createElement('canvas');
	        canvas.width = frame.width;
	        canvas.height = frame.height;
	        canvas.getContext('2d').putImageData(frame, 0, 0);
	        document.getElementsByTagName('body')[0].appendChild(canvas);
	    });
	    
	
	});
}

var aa = function(){
	videoFile = $("#file1")[0].files[0];
	
	reader = new FileReader();
	
	

	reader.onload = function(e) {
		dataURL = reader.result;
		
		var HTMLstringvideo = "<video id='video1' width='100px' height='100px' controls='controls'>"
			+ "<source src='" + dataURL + "' type='video/mp4'>"
			+ "</video>";
		
		$("#video_wrap").html(HTMLstringvideo);
		
		video = document.getElementById('video1');
		video.play();
		
	}

	reader.readAsDataURL(videoFile);
	
// 	videoUrl = URL.createObjectURL(videoFile);
	
// 	URL.revokeObjectURL(videoUrl);
	
}




	$(function(){
		
		
// 		var pt = $("#test")
// 		drawChart(pt.find(".pie"));
	
		
// 		$("#log").off("scroll").on("scroll",function(e){
// 			console.log("TTT");
// 			var scrollY = $(this).scrollTop();
			
// 			if(scrollY == 0 && isPrepend == 0){
// 				//loading start
// 				isPrepend = 1;
				
// 				data();
				
// 				//loading end
// 				isPrepend = 0;
				
				
// 			}
			
			
			
			
			
// 		});
		
	
	});
	
	function drawChart(target){
		
		
		var myChart = echarts.init(target[0]);
		
		var legendData = ["A", "B", "C", "D"];
		
		var valueData = [
            {
            	name:"A",
            	value:335,
            	itemStyle: {
					normal: {  color: "red"   }
          		}
            },
            {value:310, name:"B"},
            {value:234, name:"C"},
            {value:135, name:"D"},
        ];
		
		var option = {
			    tooltip: {
			        trigger: "item",
			        formatter: "{a} <br/>{b}: {c} ({d}%)"
			    },
			    legend: {
			        orient: "vertical",
			        x: "left",
			        data:legendData
			    },
			    series: [
			        {
			            name:"DATA",
			            type:"pie",
			            radius: ["50%", "70%"],
			            avoidLabelOverlap: false,
			            label: {
			                normal: {
			                    show: false,
			                    position: "center"
			                },
			                emphasis: {
			                    show: true,
			                    textStyle: {
			                        fontSize: "30",
			                        fontWeight: "bold"
			                    }
			                }
			            },
			            labelLine: {
			                normal: {
			                    show: false
			                }
			            },
			            data: valueData
			        }
			    ]
			};
		
			myChart.setOption(option, true);
	}
    

	function data(){
		$("#log").prepend("testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest\ntesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest\ntesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest\ntesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest\ntesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest\ntesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest\ntesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest\ntesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest\n");
	}

	
	function getLogData(){
		var ajaxData = {
			id : 43,
			start : 0,
			size: 99999999
		};
		
		$.ajax({
			url : baseUrl + "task/getTrainLog.json",
			data : ajaxData,
			type : "POST",
			success : function(res) {
				parseLogData(res.result.data.log);
								
			},
			error : function(err) {
				if(type == "scroll"){ isPrepend = false; }
				console.log("ERROR!!", err);
			}
		});
	}
	function parseLogData(log){
		epochLog = log.split("Epoch ");
		logArr = [];
		
		for(var i = 0 ; i < epochLog.length;i++){
			if(epochLog[i].indexOf("saving model to") != -1){
				var number = epochLog[i].split(": saving model to")[0];
				var epochArr = epochLog[i-1].split("\n");
				var epoch = epochArr[0];
				var data = [];
				for(var j = 0 ; j < epochArr.length ; j++){
					if(epochArr[j].indexOf("loss") == -1){ continue;}
					var lossArr = epochArr[j].split(" - ");
					var loss = lossArr[2].replace("loss: ","");
					var r_loss = lossArr[3].replace("regression_loss: ","");
					var c_loss = lossArr[4].replace("classification_loss: ","");
					var dataObj = {'loss':loss,"r_loss":r_loss,"c_loss":c_loss};
					data.push(dataObj);
				}
				logArr.push({'epoch':epoch,'data':data});
			}
			
			
		}
		
		return logArr;
	}
	
</script>