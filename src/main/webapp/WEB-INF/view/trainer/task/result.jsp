<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>

<title>X-labeller</title>

<style>

#task_result {margin: 50px; padding:0; position:relative;}

#task_result .contents .text_header span {text-align:center; font-size: 16px; display:block; margin-bottom: 20px;}

.canvas-container{ margin : 0px auto;}
#label-container {overflow-x: scroll;   display:flex;align-items:center; margin-bottom: 50px; background-color: white;position:relative; }
#label-container .label-wrap {float:left ; margin:10px; display:flex;align-items:center; justify-content: center;position:relative;flex-direction: column;width:94px;}
#label-container .label-wrap canvas{  ;position:relative}
#label-container .label-wrap.on .crop-img{border:solid #3656ff 2px}
#label-container .label-wrap .crop-img {cursor:pointer;display:flex;align-items:center; justify-content: center;position:relative;flex-direction: column;height:94px;width:94px;border:solid 1px #d9d9d9; }
	 
	 
#label-container .label-wrap .label{ width:100%;position:relative;}
#label-container .label-wrap .label input{    width: 100%;position: relative; padding: 10px 0;  text-align: center;  border: 0; }
	 
#detail-info{position: absolute; top: 0px; left: 0px;}
#frame-container{position:relative;background-color: white;height:450px;margin:0 auto;display: flex;align-items: center;justify-content: center;}
#frame-container .prev{position:absolute;background-image:url(images/btn-arrow-left-normal.png);width:16px;height:25px;top:calc(50% - 25px);left:0px}
#frame-container .next{position:absolute;background-image:url(image`s/btn-arrow-right-normal.png);width:16px;height:25px;top:calc(50% - 25px);right:0px}
#frame-container .prev:hover{background-image:url(images/btn-arrow-left-over.png);cursor:pointer;}
#frame-container .next:hover{background-image:url(images/btn-arrow-right-over.png);cursor:pointer;}
#title-container{ width:722px; height: 44px; background-image: linear-gradient(to right, #0012ff, #00fff0); margin: 0 auto; border-top-left-radius: 8px; border-top-right-radius: 8px;   }

</style>

</head>
<body>

	<div class="container" id="task_result">

		<div class="contents">

			<div class="text_header">
				<span>INFERENCE RESULT</span>
			</div>

			


			<div class='clear'></div>
			<div id="frame-container">
				<div class="prev prev_btn"></div>
				<div class="next next_btn"></div>
				<canvas id='c' width="800px" height="600px"></canvas>

			</div>


			<div id="label-container"></div>
		</div>

	</div>
</body>


<script>
	$(document).on("sessionLoad", function() {
	});

	var assetList = [];
	var gInfo = {
		current_cursor : 0
	};
	var gArr = [];

	var gObjTemplete = {
		imgSrc : 0,
		imgInfo : {
			scaleFactor : 1,
			width : 0,
			height : 0
		},
		img : null,
		newRect : {
			id : 0,
			width : 100,
			height : 100,
			left : 5,
			top : 5,
			angle : 0,
			fill : 'rgba(255,0,0,0.5)',
			label : ""
		},
		labelMap : {},
		tempRect : {
			beforeX : 0,
			beforeY : 0,
			afterX : 0,
			afterY : 0
		}
	};
	var gObj = null;
	var canvas;
	var colorHash = new ColorHash();
	var meta;
	var cur_id;
	var cur_filename;

	var task_result = {
		pt : $("#task_result"),
		init : function(id, name) {
			cur_id = id;
			cur_filename = name;
			let that = this;
			that.resetView();
		},

		resetView : function() {
			let that = this;
			that.reset();
			that.getInferenceResult()
		},

		reset : function() {
			imgList = [];
			assetList = [];
			gInfo = {
				current_cursor : 0
			};
			gArr = [];
			gObj = null;

			meta = false;

			$("#frame-container").find(".canvas-container").remove();
			$("#frame-container").find("canvas").remove();
			$("#frame-container").append(
					"<canvas id='c' width='800px' height='600px' />");
			$("#label-container").empty();
			canvas = window._canvas = new fabric.Canvas('c');
		},

		getInferenceResult : function() {
			let that = this;

			let ajaxData = {
				id : cur_id,
				filename : cur_filename
			}

			$.ajax({
				url : baseUrl + "task/getInferenceResult.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("=====getInferenceResult=====", res);
					if (res.result.code == "200") {
						that.drawInferenceResult(res.result.data);
					} else {
						alert(res.result.data);
					}
				},
				error : function(err) {
					console.log("ERROR!!", err);
				}
			});
		},

		drawInferenceResult : function(data) {
			
			//데이터에 들어갈것
			//image_path , x, y, w, h, label
			
			let that = this;
			that.listener();
		},
		listener : function() {
			let that = this;

		},

	}
</script>
 --%>