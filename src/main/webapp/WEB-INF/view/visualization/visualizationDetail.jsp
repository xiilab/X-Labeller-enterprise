<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
	<style>
		#visualizationDetail { height: 100%; width: 100%;  position: relative;}
		#visualizationDetail .content {height: 100%;}
		#visualizationDetail .main_wrap {text-align: center; margin: auto; display: block;}
		#visualizationDetail .main_wrap .drop_image {margin: 0 auto; background: url('./images/img_dragdrop_gray.png') no-repeat center; width: 140px; height: 34px; border-radius: 5px; border: 2px solid #e1e1e1;}
		#visualizationDetail .main_wrap .main_txt { color: #777777; font-size:16px; margin-top: 17px;}
		#visualizationDetail .main_wrap .sub_txt {font-weight: 200; color: #777777; font-size: 12px; margin-top: 4px;}
	</style>
</head>
<body>

	<div class="container" id="visualizationDetail">
		<div class="content flex">
			<div class="main_wrap">
				<div class="drop_image"></div>
				<div class="main_txt">Drag&Drop</div>
				<div class="sub_txt">Hello world!</div>
			</div>
		</div>
	</div>

</body>
<script>
	$(function() {
		visualizationDetail.init();
	});

	var visualizationDetail = {
		pt: $("#visualizationDetail"),
		node: null,
		data : {
			datasetId : null
		},
		init: function(datasetId){
			let that = this;
			console.log("WTF!");
			that.data.datasetId = datasetId;
			that.listener();
		},
		
		listener: function(){
			let that = this;
		},
		
	}
</script>