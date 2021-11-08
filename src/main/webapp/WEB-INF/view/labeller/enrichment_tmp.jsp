<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<c:url value="/css/swiper.min.css" />">
<script src="<c:url value="/js/swiper.min.js" />"></script> 
<style>
     .canvas-container{ margin : 0px auto;}
	 
	 #detail-info{position: absolute; top: 0px; left: 0px;}
	 
     #title-container{ width: 722px;
	    height: 44px;
	    background-image: linear-gradient(to right, #0012ff, #00fff0);
	    margin: 0 auto;
	    border-top-left-radius: 8px;
    	border-top-right-radius: 8px;
	    
	 }
	    
     #title-container .title{
	    font-size: 18px;
	    font-weight: normal;
	    font-style: normal;
	    font-stretch: normal;
	    line-height: 45px;
	    letter-spacing: normal;
	    text-align: left;
	    color: white;
	    margin-left: 27px;
	    float:left
    }
     #title-container .my-token{
     	float:right;
	  font-size: 16px;
	  font-weight: 900;
	  font-style: normal;
	  font-stretch: normal;
	  line-height: 46px;
	  letter-spacing: normal;
	  text-align: center;
	  color: #0614ff;
	  margin-right: 27px;
     }
     
	
	.meta-list-wrap { position:absolute;}
	.meta-list-wrap .meta-list{
		background-color: white;
	   padding:10px 20px;
	   height: 625px;
	   width: 250px;
	   overflow-y:scroll;
	   
	   
	 }
	.meta-list-wrap .meta-list .meta-row{ }
	.meta-list-wrap .meta-list .meta-row .meta-nickname{ }
	.meta-list-wrap .meta-list .user-row{margin-top:5px;margin-bottom:5px;text-align: center; cursor: pointer; }
	.meta-list-wrap .meta-title{
		width: 250px;
	    height: 44px;
	    background-image: linear-gradient(to right, #0012ff, #00fff0);
	    
	    border-top-left-radius: 8px;
	    border-top-right-radius: 8px;
	    font-size: 18px;
	    font-weight: normal;
	    font-style: normal;
	    font-stretch: normal;
	    line-height: 45px;
	    letter-spacing: normal;
	    text-align: left;
	    color: var(--white);
	    text-indent: 25px
	    
	    
	}
	
	@media screen and (min-width: 2625px){
		#enrichment section.label .frame-wrap #label-container { width : 804px; }
	}
	@media screen and (max-width: 2625px){
		#enrichment section.label .frame-wrap #label-container { width : 804px; }
	}
	@media screen and (max-width: 2290px){
		#enrichment section.label .frame-wrap #label-container { width : 670px; }
	}
	@media screen and (max-width: 1950px){
		#enrichment section.label .frame-wrap #label-container { width : 536px; }
	}
	@media screen and (max-width: 1620px){
		#enrichment section.label .frame-wrap #label-container { width : 402px; }
	}
	
	#enrichment {height: 100%;}
	#enrichment .enrichment_wrap { background-color: #fff; }
	#enrichment section.enrichment {width: 60%; height: 100%; position:relative; border: 1px solid #e5e5e5; }
	#enrichment section .title-wrap{margin: 23px 30px 17px; font-family: Roboto; font-size: 12px; font-weight: 500; color: #343434;}
	#enrichment section.enrichment .frame-wrap{width: 657px; position: relative; padding: 40px 0 40px 0; margin: 0 auto; border: 1px solid #e5e5e5;}
	#enrichment section.enrichment .prev{position:absolute;background-image:url(images/btn-arrow-left-normal.png);width:16px;height:25px;top:calc(50% - 25px);left:23px}
	#enrichment section.enrichment .next{position:absolute;background-image:url(images/btn-arrow-right-normal.png);width:16px;height:25px;top:calc(50% - 25px);right:23px}
    #enrichment section.enrichment .prev:hover{background-image:url(images/btn-arrow-left-over.png);cursor:pointer;}
    #enrichment section.enrichment .next:hover{background-image:url(images/btn-arrow-right-over.png);cursor:pointer;}
    #enrichment section.enrichment #frame-container { height: 380px; display: flex; display: -webkit-flex; display: -ms-flexbox; -webkit-align-items: center; align-items: center; }
	#enrichment section.enrichment #frame-container span{ margin: 30px;font-family: Roboto;font-size: 12px;font-weight: 400;line-height:30px; color: #343434; }
	#enrichment section.enrichment canvas { border-radius: 8px; }
	#enrichment section.enrichment .imgList { width: 657px; margin: 20px auto; position: relative; overflow: hidden; list-style: none; padding: 16px 0; z-index: 1; border: 1px solid #e5e5e5; background-color: #f5f5f5; }
	#enrichment section.enrichment .swiper-slide { background-position: center; background-size: cover; width: 120px; height: 89px; }
	#enrichment section.enrichment .swiper-slide img { width: 100%; height: 100%; }
	
	#enrichment section.label { width: 40%; height: 100%; background-color: #f5f5f5; border: 1px solid #e5e5e5; }
	#enrichment section.label .frame-wrap{ height: calc(100% - 300px); margin-bottom: 20px; overflow-y: overlay; }
	#enrichment section.label .frame-wrap #label-container { margin: 0 auto; }
	#enrichment section.label .frame-wrap #label-container .label-wrap {float:left ; display:flex;align-items:center; justify-content: center;flex-direction: column;width:120px;margin: 7px;}
	#enrichment section.label .frame-wrap #label-container .label-wrap canvas{  ;position:relative;}
	#enrichment section.label .frame-wrap #label-container .label-wrap.on .crop-img{border:solid #218aff 1px}
	#enrichment section.label .frame-wrap #label-container .label-wrap.off {display: none; }
	#enrichment section.label .frame-wrap #label-container .label-wrap .crop-img {cursor:pointer;display:flex;align-items:center; justify-content: center;position:relative;flex-direction: column;height:94px;width:120px;border:solid 1px #aaaaaa; background-color: #ffffff; }
	#enrichment section.label .frame-wrap #label-container .label-wrap .label{ width:100%;position:relative;}
	#enrichment section.label .frame-wrap #label-container .label-wrap .label input{ width: 94px;position: relative; margin: 8px 0 10px 0; padding: 5px 23px 5px 3px; border: 1px solid #aaaaaa; font-size: 13px; background: url('images/icon-edit.png') right no-repeat; background-color: #ffffff; }
	#enrichment section.label .frame-wrap #label-container .label-wrap .label input:focus{ border: 1px solid #218aff; background: none; background-color: #ffffff; }

    #enrichment .btn_wrap { width: 240px; height: 48px; margin: 0 auto; justify-content: center; border-radius: 23px; box-shadow: 0 4px 8px 0 #b4d7ff; background-color: #218aff; font-size: 13px; font-weight: 500; color: #ffffff; cursor: pointer; }
    #enrichment .btn_wrap:hover {background-color: #3A71E9;}
    #enrichment .submit_btn { font-size: 13px; font-weight: 500; color: #ffffff; }
    #enrichment .list_btn { cursor:pointer; width: 153px; line-height: 44px;     margin-top: 0;   font-size: 14px;  font-weight: 300;}
	#enrichment .list_btn a:hover {color:#fff; background-color: #008bed;}
	
	
	#enrichment section.label .filter_title {display: block;  font-family: Roboto; font-size: 12px;color: #343434; font-weight: 400;}
	#enrichment section.label .label_filter {margin-top: 17px; position: relative; display: block;}
	#enrichment section.label .label_filter input {width: calc(100% - 101px); border-radius: 2px; border-color: #dedcde; border-right: none; padding: 0 90px 0 11px ; width: calc(100% - 101px); height: 40px; background-color: #ffffff; font-family: Roboto; font-size: 13px; color: #555555; box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1);}
	#enrichment section.label .search_btn {top: 0 ; background-repeat: no-repeat; background-position: center; background-image: url('./images/icon_filter_search_normal.png'); right: 0; position: absolute;  width: 40px; height: 40px; background-color: #4c84ff; border-radius: 4px;}
	#enrichment section.label .search_btn:hover {background-color: #3A71E9; }
	
	#enrichment section.label .ms_wrap {width: calc(100% - 101px); margin-top: 23px;}
	
</style>
<c:set var="datasetId" value="${param.datasetId}" />
	<div class="container" id="enrichment">
		<div class="contents">
			<div class="enrichment_wrap flex">
				<!-- jpark -->
				<section class="enrichment">
					<div class="title-wrap">Image Preview</div>
					<div class='clear'></div>
					<div class="frame-wrap">
						<div class="prev prev_btn"></div>
						<div class="next next_btn"></div>
						<div id="frame-container" >
							<canvas id='c' width="800px" height="600px" />
						</div>
					</div>
					<div class="imgList"></div>
					
				</section>
				<section class="label">
					<div class = "ms">
						<div class = "ms_wrap">
							<span class="filter_title">Visible/Invisible setting by label name</span>
							<div class="label_filter">
								<input type ="text" placeholder="찾고자 하는 label을 입력해주세요">
								<button class="search_btn"></button>
								<button class="show_all">Show All</button>
							</div>
							<div class="horizontal_line"></div>
						</div>	
					</div>
					
					<div class="title-wrap">Search Crop Image by label name</div>
					<div class="frame-wrap">
						<div id="label-container"></div>
					</div>
					<div class="btn_wrap flex">
						<div id="submit" class="submit_btn">저장하기</div>
					</div>
				</section>
				<!-- jpark -->
			</div>
		</div>
		<!-- end contents -->
	</div>
   
<script src="<c:url value="/js/fabric.js" />"></script>
<script src="<c:url value="/js/download.js" />"></script>



<script>
	
	var imgList = ["/ico/images/img-team-temp.jpeg","/ico/images/img-about-bdot.png","/ico/images/img-main-bg.png"];
	var assetList = [];
	var gInfo = {current_cursor:0};
	var gArr = [];
	
	var gObjTemplete = {
		imgSrc : 0,
		imgInfo: {scaleFactor : 1 , width : 0 , height : 0},
		img : null,
		newRect : {id : 0, width: 100, height: 100, left: 5, top: 5, angle: 0,fill: 'rgba(33,138,255,0.15)',label:""},	
		labelMap : {},
		tempRect : {beforeX:0,beforeY:0,afterX:0,afterY:0}
	};
	
	var gObj = null;
	
	var canvas;
	var colorHash = new ColorHash();
	
	var meta;

    var enrichment = {
    	nodes : {},
    	datasetId: "${datasetId}",
    	pt: $("#enrichment"),
    	init : function(nodes) {
    		var that = this;
    		
    		that.reset();
    		$("#submit").text("저장하기");
			$(".meta-list-wrap").hide();
			
			this.nodes = nodes;
   			switch(nodes[0].level){
   				case 0:
//    					wsObj[setting.key].dir.removeChildNodes(nodes[0]);
// 					var url = "getDataList";
// 					var pNode = nodes[0];
// 					var ajaxData = { dataset_id : nodes[0].id };
// 					labeller.getList(url, ajaxData, pNode);
					
   					that.getEnrichmentDetail(nodes);
   					break;
   				case 1:
   					for(var i = 0 ; i < nodes.length ; i++){
   		        		assetList.push(nodes[i].id);
   		        		imgList.push("/uploadFile/xlabeller/"+nodes[i].path);
   		        	}
    				imgList = ["/xlabeller/images/sabana3.jpg","/xlabeller/images/sabana2.jpg","/xlabeller/images/sabana3.jpg"];
   					that.initEnrichment();
   					that.drawImgList();
   					that.eventBindEnrichment();
   					break;
   				case 2:
   					var inputValue = [{ id : nodes[0].pId, path : nodes[0].path}]
   					that.drawEnrichmentDetail(inputValue);
   					meta = [nodes[0]];
   					break;
   			}
    	},
    	reset : function(){
    		imgList = [];
    		assetList = [];
    		gInfo = {current_cursor:0};
    		gArr = [];
    		gObj = null;
    		
    		meta = false;
    		
    		$("#frame-container").find(".canvas-container").remove();
			$("#frame-container").find("canvas").remove();
    		$("#frame-container").append("<canvas id='c' width='800px' height='600px' />");
    		$("#label-container").empty();
    		canvas = window._canvas = new fabric.Canvas('c');
    		
    	},
    	
    	enrichmentAjax : function(id){
    		var deffered = $.ajax({
    		   	url :  baseUrl + "/data/getDataList.json",
    		   	data : {dataset_id : id},
    		   	type : "POST",
    		   	success : function(res){
    		   		 
    		   	},
    		   	error : function(err){
					alert(err);
    		   		 console.log("ERROR!!", err);
    		   	}
    		});
    		
    		return deffered;
    	},
    	
    	getEnrichmentDetail : function(nodes){
			var that = this;
			var enrichArr = [];
			
			for(var i=0; i<nodes.length; i++){
				enrichArr.push(that.enrichmentAjax(nodes[i].id));
			}
			Promise.all(enrichArr).then(function(res){
				console.log("===getEnrichmentDetail===",res);
				var resArr=[];
				for(var i=0; i<res.length; i++){
					for(var j=0; j<res[i].result.data.length; j++){
						resArr.push(res[i].result.data[j]);
					}
				}
				that.drawEnrichmentDetail(resArr);
			});
            
    	},
    	
    	drawEnrichmentDetail : function(data){
			var that = this;
    		imgList = [];
    		assetList = [];
    		for(var i = 0 ; i < data.length ; i++){
        		assetList.push(data[i].id);
        		imgList.push("/uploadFile/xlabeller/"+data[i].path);
        	}
// 			imgList = ["/xlabeller/images/sabana3.jpg","/xlabeller/images/sabana2.jpg","/xlabeller/images/sabana3.jpg"];
			that.initEnrichment();
			that.drawImgList();
			that.eventBindEnrichment();
    	},
    	
    	getMyMetaDetail : function(dataId){
    		//메타데이터 로딩
    		
    		var that = this;

			var ajaxData = {
				data_id : dataId,	
			};
			$.ajax({
    		   	url :  baseUrl + "/data/getMetaList.json",
    		   	data : ajaxData,
    		   	type : "POST",
    		   	success : function(res){
    		   		console.log("===getMyMetaDetail===",res);
    				if(res.result.code == "200"){
    					var data = res.result.data;
    					that.dataToObject(data);
    				} 
    				that.updateRedraw();
    		   	},
    		   	error : function(err){
    		   		alert(err);
    		   		 console.log("ERROR!!", err);
    		   	}
    		});
    	},
    	
    	dataToObject : function(data){
    		//메타데이터를 Object로
    		gObj.labelMap = {};
			if(data != null){
				for(var i = 0 ; i < data.length ; i++){
					var inf = data[i].info.split(",");
					var fillColor = colorHash.rgb(data[i].label);
					gObj.labelMap[data[i].id] = {						
						angle: 0,
						fill: "rgba("+fillColor[0]+","+fillColor[1]+","+fillColor[2]+",0.5)",
						height: inf[3]*1*gObj.imgInfo.scaleFactor,
						id: data[i].id,
						label: data[i].label,
						left: inf[0]*1*gObj.imgInfo.scaleFactor,
						top: inf[1]*1*gObj.imgInfo.scaleFactor,
						width: inf[2]*1*gObj.imgInfo.scaleFactor
					};
				}
			}
    	
    	},
    	
    	swiper : {},
    	drawImgList : function(){
    		var that = this;
    		
    		var html='<ul class="swiper-wrapper">';
    		for(var i=0; i<imgList.length; i++){
    			html += "<li class='swiper-slide'><img src='<c:url value='"+imgList[i]+"'/>'></li>";
    		}
    		html += '</ul>';
    		$(".imgList").empty();
    		$(".imgList").append(html);
    		
			that.swiper = new Swiper('.imgList', {
				effect: 'coverflow',
				grabCursor: true,
				centeredSlides: true,
				slidesPerView: 'auto',
				mousewheel : {},
				coverflowEffect: {
					rotate: 20,
					stretch: 20,
					depth: 150,
					modifier: 1,
					slideShadows : true,
				},
			});

			$(".swiper-slide").off("click").on("click", function(e){
				gInfo.current_cursor = that.swiper.clickedIndex;
				that.initEnrichment();
				that.swiper.slideTo(gInfo.current_cursor, 500);
			});
			
    	},
    	
    	initEnrichment : function(){
    		//캔버스 초기화
			var that = this;
    		canvas.clear();
    		
			if(typeof gArr[gInfo.current_cursor] == "undefined"){
    			gArr[gInfo.current_cursor] = JSON.parse( JSON.stringify(gObjTemplete) );	
    		}
    		gObj = gArr[gInfo.current_cursor];
			gObj.imgSrc = imgList[gInfo.current_cursor];
			
			
			/*이미지 로딩 시작*/
			gObj.img = new Image();
			gObj.img.src = "<c:url value='"+gObj.imgSrc+"' />";
			console.log(gObj);
			
			gObj.img.onload = function(){
				that.rescale(this);
				canvas.setBackgroundImage(gObj.img.src, canvas.renderAll.bind(canvas), {
			          backgroundImageOpacity: 0.5,
			          backgroundImageStretch: true,
			          width: canvas.width,
			          height: canvas.height
			          
			    });
				if(meta){
					that.dataToObject(meta);
					that.updateRedraw();
				} else {
					that.getMyMetaDetail(assetList[gInfo.current_cursor]);
				}
				
				
			}
			/*이미지 로딩 끝*/
			fabric.Object.prototype.set({
		          transparentCorners: false,
		          cornerColor: 'rgba(102,153,255,0.5)',
		          cornerSize: 12,
		          hasRotatingPoint: false,
		          padding: 5
			});
			
			canvas.viewportTransform = [1,0,0,1,0,0];
			canvas.renderAll();
    	},
    	
    	
    	eventBindEnrichment : function(){
    		var that = this;
    		that.evtCanvas();
			that.evtTool();
    	},
    	
    	evtCanvas : function(){
    		var that = this;
    		
    		var chkClick = false;
    		canvas.on("mouse:down",function(evt){
				console.log("mouse:down");
				console.log("evt:",evt);

				//
				chkClick = true;
				
				// 선택영역 클릭 시 라벨 추가 막기
				var tempRect = gObj.tempRect;
				tempRect.beforeX=null;
				tempRect.beforeY=null;				

				
				//canvas movement
				var evte = evt.e;
				if (evte.altKey === true) {
					this.isDragging = true;
					this.selection = false;
					return;
				}
				//
				
				if(this.selection != true){return;}
				
				//label name copy
				if (evte.ctrlKey === true || evte.metaKey === true) {
					this.isCopy = true;
					this.copyLabel = $("#label-container .label input[type='text']").first().val();
				}
				//
				
				if(evt.target != null){
					$("#label-container").find(".label-wrap").removeClass("on");
		    		$("#label-container").find("#div_"+evt.target.id).removeClass("off");
		    		$("#label-container").find("#div_"+evt.target.id).addClass("on");
					
					return;
				}else{
					$("#label-container").find(".label-wrap").removeClass("on");
				}
				tempRect.beforeX = (evt.e.layerX - this.viewportTransform[4]) / this.viewportTransform[0];
				tempRect.beforeY = (evt.e.layerY - this.viewportTransform[5]) / this.viewportTransform[0];
				if(tempRect.beforeX >= canvas.getWidth()){
					tempRect.beforeX = canvas.getWidth()
				} else if ( tempRect.beforeX <= 0) {
					tempRect.beforeX = 0;
				}
				if(tempRect.beforeY >= canvas.getHeight()){
					tempRect.beforeY = canvas.getHeight();
				} else if ( tempRect.beforeY <= 0) {
					tempRect.beforeY = 0;
				}
			});
    		
    		canvas.on('mouse:move', function(evt) {
				if (this.isDragging) {
    				var units = 10;
    				var zoom = canvas.getZoom();

					if (this.viewportTransform[4] + evt.e.movementX >= 0) {
						return;
					} else if (this.viewportTransform[4] + evt.e.movementX < canvas.getWidth() - canvas.getWidth() * zoom) {
						return;
					} 
					if (this.viewportTransform[5] + evt.e.movementY >= 0) {
						return;
					} else if (this.viewportTransform[5] + evt.e.movementY < canvas.getHeight() - canvas.getHeight() * zoom) {
						return;
					}	
    		        var delta = new fabric.Point(evt.e.movementX, evt.e.movementY);
    		        canvas.relativePan(delta);
				}
			});
    		
			canvas.on("object:moving",function(evt){
				console.log("object:moving");
				var uuid = evt.target.id;
				that.setLabelById(uuid);

				console.log(evt);
				var tempRect = gObj.tempRect;
				var newRect = gObj.newRect;
				var img = gObj.img;
				var imgInfo = gObj.imgInfo;
				newRect.width = evt.target.getWidth();
				newRect.left = evt.target.getLeft();
			
				newRect.height = evt.target.getHeight();
				newRect.top = evt.target.getTop();
				
				
				//
				if(newRect.left < 0){
					newRect.left = 0;
				} else if (newRect.left+newRect.width > canvas.getWidth()){
					newRect.left = canvas.getWidth() - newRect.width;
				}
				if(newRect.top < 0){
					newRect.top = 0;
				} else if (newRect.top+newRect.height > canvas.getHeight()){
					newRect.top = canvas.getHeight() - newRect.height;
				}
				evt.target.setLeft(newRect.left);
				evt.target.setTop(newRect.top);
				canvas.renderAll();
				//
			
				var canv = document.getElementById(evt.target.id);
				that.drawLabelImage(canv, newRect, img, imgInfo);
				
				gObj.labelMap[uuid] = JSON.parse( JSON.stringify(gObj.newRect) );
			});
			
			canvas.on("object:scaling",function(evt){
				console.log("object:scaling");
				var uuid = evt.target.id;
				that.setLabelById(uuid);
	 			
				var tempRect = gObj.tempRect;
				var newRect = gObj.newRect;
				
				var img = gObj.img;
				var imgInfo = gObj.imgInfo;	
				newRect.width = evt.target.getWidth();
				newRect.left = evt.target.getLeft();
			
				newRect.height = evt.target.getHeight();
				newRect.top = evt.target.getTop();
				//
//				if (newRect.left+newRect.width > canvas.getWidth()){
// 					console.log("tttttt")
// 				} else {
// 					newRect.width = evt.target.getWidth();
// 					console.log("ffffff")
// 				}
// 				if (newRect.top+newRect.height > canvas.getHeight()){
// 					console.log("tttttt")
// 				} else {
// 					newRect.height = evt.target.getHeight();
// 					console.log("ffffff")
// 				}
// 				evt.target.setLeft(newRect.left);
// 				evt.target.setWidth(newRect.width);
// 				evt.target.setTop(newRect.top);
// 				evt.target.setHeight(newRect.height);
// 				canvas.renderAll();
				
// 				console.log("left", newRect.left);
// 				console.log("top", newRect.top);
// 				console.log("width", newRect.width);
// 				console.log("height", newRect.height);
			 
				var canv = document.getElementById(evt.target.id);
				that.drawLabelImage(canv, newRect, img, imgInfo);
		
				
				gObj.labelMap[uuid] = JSON.parse( JSON.stringify(gObj.newRect) );
			});
			
			canvas.on("mouse:up",function(evt){
				console.log("mouse:up");
				
// 				canvas.discardActiveObject();
// 				canvas.renderAll();
				
				//
				chkClick = false;
				
				//canvas movement
				if (this.isDragging) {
					this.isDragging = false;
			        this.selection = true;
			        return;
				}
				//
				
				//드로잉 막기
				if(evt.e.metaKey == true || evt.e.ctrlKey == true){
					return;
				}
				canvas.on('selection:created', function (evt) {
					console.log("selection:created");
					canvas.discardActiveGroup();
			        canvas.renderAll();
					
				});
				
				if(this.selection != true){return;}
// 				if(evt.target != null){ return; }
				if(meta) { return; }
				
				var tempRect = gObj.tempRect;
				var newRect = gObj.newRect;
				var img = gObj.img;
				var imgInfo = gObj.imgInfo;
				
				
				tempRect.afterX = (evt.e.layerX - this.viewportTransform[4]) / this.viewportTransform[0];
				tempRect.afterY = (evt.e.layerY - this.viewportTransform[5]) / this.viewportTransform[0];
				
				// canvas 영역 밖 선택
				if(evt.e.target != $("#frame-container").find(".upper-canvas")[0]){
					return false;
				}
				if(tempRect.afterX >= canvas.getWidth()){
					tempRect.afterX = canvas.getWidth()
				} else if ( tempRect.afterX <= 0) {
					tempRect.afterX = 0;
				}
				if(tempRect.afterY >= canvas.getHeight()){
					tempRect.afterY = canvas.getHeight();
				} else if ( tempRect.afterY <= 0) {
					tempRect.afterY = 0;
				}
				//
				
				// 선택영역 클릭 시 라벨 추가 막기
				if(tempRect.beforeX==null && tempRect.beforeY ==null){return;}
				//
				
				var w = tempRect.afterX - tempRect.beforeX;
				var h = tempRect.afterY - tempRect.beforeY;
				
				if(w == 0 || h == 0){ return ;}
				
				if( w < 0 ){
					newRect.width = w*(-1);
					newRect.left = tempRect.afterX;
				}else{
					newRect.width = w;
					newRect.left = tempRect.beforeX;
				}
				if( h < 0 ){
					newRect.height = h*(-1);
					newRect.top = tempRect.afterY;
				}
				else{
					newRect.height = h;
					newRect.top = tempRect.beforeY;
				}
				
				var rect = new fabric.Rect(newRect);
				canvas.add(rect);
				
				//여기부터 드로잉
				
				var canv = document.createElement('canvas');
				var uuid = that.guid();
				canv.id = newRect.id = rect.id = uuid;
				
				that.drawLabelContainer(canv,uuid);
				that.drawLabelImage(canv, newRect, img, imgInfo);
				gObj.labelMap[uuid] = JSON.parse( JSON.stringify(gObj.newRect) );

				console.log("create rect");
				
				//label name copy
				if (this.isCopy) {
					this.isCopy = false;
					$("#label-container .label input[type='text']").first().val(this.copyLabel);
				}
				//
			});
			
			canvas.on("object:modified",function(evt){
				console.log("object:modified");
				console.log(evt.target);
				
			});
			
			canvas.on('mouse:wheel', function(evt) {
				console.log(evt.e);
				
				//클릭 이벤트가 없을경우만 실행
				if(!chkClick){
					var delta = evt.e.deltaY;
					var pointer = canvas.getPointer(evt.e);
					var zoom = canvas.getZoom();
					zoom = zoom + delta/200;
					
					//최대크기 : 10(10이상시 크기변화가 크지않음), 최소크기 : 0.8
					if (zoom > 10) zoom = 10;
					if (zoom < 0.8) zoom = 0.8;
					canvas.zoomToPoint({ x: evt.e.offsetX, y: evt.e.offsetY }, zoom);
					evt.e.preventDefault();
					evt.e.stopPropagation();
					
					//줌이 1보다 작을때 컨버스를 중앙에
					if (zoom < 1) {
						this.viewportTransform[4] = (this.getWidth() - this.getWidth() * zoom) / 2;
						this.viewportTransform[5] = (this.getHeight() - this.getHeight() * zoom) / 2;
					} else {
						if (this.viewportTransform[4] >= 0) {
				            this.viewportTransform[4] = 0;
				          } else if (this.viewportTransform[4] < canvas.getWidth() - canvas.getWidth() * zoom) {
				            this.viewportTransform[4] = canvas.getWidth() - canvas.getWidth() * zoom;
				          }
				          if (this.viewportTransform[5] >= 0) {
				            this.viewportTransform[5] = 0;
				          } else if (this.viewportTransform[5] < canvas.getHeight() - canvas.getHeight() * zoom) {
				            this.viewportTransform[5] = canvas.getHeight() - canvas.getHeight() * zoom;
				          }
					}
					
					this.renderAll();
				}
				
			});
		},
    	evtLabel : function(){
    		var that = this;
    	},
    	evtTool : function(){
    		var that = this;

    		var gObjCopy;
			$(document).off("keydown").on("keydown", function(){
				if (meta) {return;}

				if ( $(".label-wrap.on").length != 0){
					if (event.keyCode == 8 || event.keyCode == 46) {
				        console.log('BACKSPACE was pressed');
				        var searchNode = that.pt.find(".label_filter input[type='text']:focus");
				        var textNode = that.pt.find("#label-container .label input[type='text']:focus");
						if(textNode.length>0 || searchNode.length>0 ){
							return;
						}
				        that.del();
					    event.preventDefault();
				    } else if (event.keyCode == 67 && (event.ctrlKey === true || event.metaKey === true)) {
				    	//copy
				    	var id = $(".label-wrap.on")[0].id.substr(4);
//				    	console.log($(".label-wrap.on")[0].id);
//				    	console.log(id);
				    	gObjCopy = $.extend({}, gObj.labelMap[id]);
				    	gObjCopy.id = "";
				    	
				    } 
				} 
				if (event.keyCode == 86 && (event.ctrlKey === true || event.metaKey === true)) {
			    	//paste
			    	if (!gObjCopy) { return; };
			    	if (gObjCopy.top + gObjCopy.height > canvas.getHeight()-10 ) {
			    		gObjCopy.top = 10;
			    		gObjCopy.left = gObjCopy.left -  150;
			    	} else if(gObjCopy.left + gObjCopy.width > canvas.getWidth() - 10 ) {
			    		gObjCopy.left = 10;
			    	}
				gObjCopy.top = gObjCopy.top + 10;
			    	gObjCopy.left = gObjCopy.left + 10;
			    	
			    	
			    	var img = gObj.img;
					var imgInfo = gObj.imgInfo;
			    	var rect = new fabric.Rect(gObjCopy);
					canvas.add(rect);
					
					//여기부터 드로잉
					
					var canv = document.createElement('canvas');
					var uuid = that.guid();
					canv.id = gObjCopy.id = rect.id = uuid;
					
					that.drawLabelContainer(canv,uuid);
					that.drawLabelImage(canv, gObjCopy, img, imgInfo);
					gObj.labelMap[uuid] = JSON.parse( JSON.stringify(gObjCopy) );

			    }
			});
			
			$(".prev_btn").off("click").on("click", function(){
				if(gInfo.current_cursor > 0){
					gInfo.current_cursor--;
					that.initEnrichment();
					that.swiper.slidePrev(500);
				} else{
					alert("첫번째 이미지 입니다");
				}
			});
			
			$(".next_btn").off("click").on("click", function(){
				if(gInfo.current_cursor < imgList.length - 1){
					gInfo.current_cursor++;
					that.initEnrichment();
					that.swiper.slideNext(500);
				} else{
					alert("마지막 이미지 입니다");
				}
			});
			
			$("#submit").parent().off("click").on("click", function(){
				var labelArr = that.pt.find("#label-container .label input[type='text']");
				console.log(labelArr);
				for(var i=0; i<labelArr.length; i++){
					if($(labelArr[i]).val() == "") {
						alert("라벨명을 입력해주세요.");
						$(labelArr[i]).focus();
						
						return false;
					}
				}
				
				that.submitMeta();
			});
			
			$(".search_btn").off("click").on("click", function(){
				that.filterMeta();
			});
			
			$(".label_filter input[type='text']").off("keypress").on("keypress",function(key){
				if(key.which == 13){
					that.filterMeta();
				}
			});
			
			$(".show_all").off("click").on("click", function(){
				that.updateRedraw();
			});
			
    	},
    	filterMeta : function(){
    		var that = this;
    		
    		var canvObjLen = canvas.getObjects().length;
        	for(var i = 0 ; i < canvObjLen; i++){
        		canvas.remove(canvas.getObjects()[0]);
        	}
        	
    		var filter_str = that.pt.find(".label_filter input[type='text']").val();
		let pt = $("#label-container")[0].childNodes;
	    	$.each(pt,function(index,value){
	    		if(filter_str==''){
	    			that.updateRedraw();
	    			return false;
	    		}
	    		var id= $(value).find("input[type='text']").val();
	    		if(id.match(filter_str)){
	    			$(value).removeClass("off");
	    			$(value).addClass("on");
		    		that.drawCanvasImage($(value)[0].id.substr(4));
	    		}
	    		else{
	    			$(value).removeClass("on");
	    			$(value).addClass("off");
	    		}
    		});
    	},
    	
    	submitMeta : function(){
    		var that = this;
    		var index = gInfo.current_cursor;
			
			var assetId = assetList[index];
          	var width = gObj.imgInfo.width;
          	var height = gObj.imgInfo.height;
          	var scaleFactor = gObj.imgInfo.scaleFactor;
          	
          	var ajaxData = {info:[]};
          	var keys = Object.keys(gObj.labelMap);
          	
			if(meta){
            	ajaxData["stay_flag"] = 2;
			}
                	
            for(var i = 0 ; i < keys.length ; i++){
				var box_width = gObj.labelMap[keys[i]].width;
				var box_height = gObj.labelMap[keys[i]].height;
				var left = gObj.labelMap[keys[i]].left;
				var top = gObj.labelMap[keys[i]].top;
				var label = gObj.labelMap[keys[i]].label;
				var meta_id = gObj.labelMap[keys[i]].id;
                    	
				ajaxData.info.push({
					data_id : assetId+"",
					width:box_width/scaleFactor+"",
					height:box_height/scaleFactor+"",
					left:left/scaleFactor+"",
					top:top/scaleFactor+"",
					label:label+"",
					meta_id : meta_id,
				});
                	
			}
          	
			ajaxData.info = JSON.stringify(ajaxData.info); 
			console.log("==ajaxdata==",ajaxData);
			
			$("#loader").show();
            $.ajax({
    		   	url :  baseUrl + "data/updateMeta.json",
    		   	data : ajaxData,
    		   	type : "POST",
    		   	traditional: true,
    		   	success : function(res){
    		   		$("#loader").hide();
    		   		console.log(res);

    				if(res.result.code == "200"){
    					alert("Enrichment 가 완료되었습니다");
    					
						var url = "getMetaList";
						var pNode = "";
						var ajaxData = { data_id : assetId };
						var nodes = that.nodes;
    					if(nodes[0].level==0){
    						var children = nodes[0].children;
    						if(children){
    							for(var i=0; i<children.length; i++){
        							if(children[i].id == assetId){
        								wsObj[setting.key].dir.removeChildNodes(children[i]);
        								pNode = children[i];
        							}
        						}
    						}
    					}else if(nodes[0].level==1){
    						for(var i=0; i<nodes.length; i++){
    							if(nodes[i].id == assetId){
    								wsObj[setting.key].dir.removeChildNodes(nodes[i]);
    								pNode = nodes[i];
    							}
    						}
    					}
						labeller.getList(url, ajaxData, pNode);
    				} else{
    					alert(res.result.data);
    				}
    		   	},
    		   	error : function(err){
    		   		$("#loader").hide();
    		   		alert(err);
					console.log("ERROR!!", err);
    		   	}
    		});
    	},
    	
    	drawLabelContainer : function(canv,uuid){
    		var that = this;
        	var div = "<div id='div_"+uuid+"' class='label-wrap'> <div class='crop-img'></div> <div class='label'><input type='text' /></div> </div>";
			$("#label-container").prepend(div);
			$("#label-container #div_"+uuid+" .crop-img").html(canv);
			
			
			$("#label-container #div_"+uuid+" .label input").off("focus").on("focus",function(e){
				if($(this).parents(".label-wrap").hasClass("on")){
				} else {
					$("#label-container").find(".label-wrap").removeClass("on");
					$(this).parents(".label-wrap").removeClass("off");
					$(this).parents(".label-wrap").addClass("on")
				}
	    	});
			
			$("#label-container #div_"+uuid+" .label input").off("input").on("input",function(e){
				//jpark
				var uuid = $(this).parent().parent()[0].id.split("_")[1];
				gObj.labelMap[uuid].label = $(this).val();
				var fillColor = colorHash.rgb($(this).val());
				gObj.labelMap[uuid].fill = "rgba("+fillColor[0]+","+fillColor[1]+","+fillColor[2]+",0.5)";
				canvas.getObjects().forEach(function(o) {
	    	        if(o.id === uuid) {
	    	        	o.set("fill",gObj.labelMap[uuid].fill);
	    	            canvas.renderAll();
	    	            
	    	        }
	    		});
				
				var str = $(this).val();
				var label = $("#label-container").find(".label-wrap.on .label input[type='text']");
				$.each(label, function(index, value){
					$(value).val(str);
				});
			});
        },
    	
    	drawLabelImage : function(canv, newRect, img, imgInfo){
    		var context = canv.getContext('2d');		
    		var w = newRect.width/imgInfo.scaleFactor;
    		var h = newRect.height/imgInfo.scaleFactor;
    		
    		var dw = 0;
    		var dh = 0;
    		
    		var g_w = 105;
    		var g_h = 80;
    		
    		var fw = w/g_w;
    		var fh = h/g_h;
    		
    		if(fw >= fh){
    			dw = w / fw;
    			dh = h / fw;
    		}else{
    			dw = w / fh;
    			dh = h / fh;
    		}
    		canv.width = dw;
    		canv.height = dh;
    		
    		var left = newRect.left/imgInfo.scaleFactor;
    		var top = newRect.top/imgInfo.scaleFactor;
    		var width = newRect.width/imgInfo.scaleFactor;
    		var height = newRect.height/imgInfo.scaleFactor;
    		
    		context.clearRect(0, 0, canv.width, canv.height);			
    		context.drawImage(img,newRect.left/imgInfo.scaleFactor, newRect.top/imgInfo.scaleFactor, newRect.width/imgInfo.scaleFactor, newRect.height/imgInfo.scaleFactor, 0, 0,dw,dh);		      
    		console.log(newRect.label,$(canv).parent().find("input"));
    		
    		$(canv).parent().parent().find("input").val(newRect.label);		
    		
    		$($(canv).parent()).off("click").on("click",function(evt){
    			if (evt.ctrlKey === true || evt.metaKey === true) {
    				if(canvas.getActiveObject()!==null){
    					canvas.discardActiveObject();
    					canvas.renderAll();
    				}
    				$(this).parent().toggleClass("on");
    			} else {
    				cmp_id = $(this).parent()[0].id.split("_")[1];
        			canvas.getObjects().forEach(function(o) {
            	        if(o.id === cmp_id) {
            	            canvas.setActiveObject(o);
            	        }
            		});
        			$(this).parent().parent().find(".label-wrap").removeClass("on");
        			$(this).parent().removeClass("off");
        	   		$(this).parent().addClass("on");
    			}
    		});
     },
     drawCanvasImage : function(id){
    	 	var that = this;
    	 	console.log("drawCanvasImage");
    	 	
        	var gObjDraw;
        	gObjDraw = $.extend({}, gObj.labelMap[id]);
        	var rect = new fabric.Rect(gObjDraw);
        	canvas.add(rect);
     },
     
        updateRedraw : function(){
        	var that = this;
        	console.log("updateRedraw");
        	$("#label-container").empty();
        	//캔버스에 존재하는 오브젝트 모두 삭제
        	var canvObjLen = canvas.getObjects().length;
        	for(var i = 0 ; i < canvObjLen; i++){
        		canvas.remove(canvas.getObjects()[0]);
        	}
        	
    			
    		//글로벌 변수에서 오브젝트 정보 가져옴
        	var keyArr = Object.keys(gObj.labelMap);
        	if(keyArr.length < 1 ){return;}
        	
        	//글로벌 변수의 정보를 통해 오브젝트를 그리고 이벤트 바인딩
        	for(i = 0 ; i < keyArr.length ; i++){
        		var uuid = keyArr[i];
        		var newRect = gObj.labelMap[uuid];
        		var img = gObj.img;
    			var imgInfo = gObj.imgInfo;
        		
    			var rect = new fabric.Rect(newRect);
    			canvas.add(rect);
    			
    			var canv = document.createElement('canvas');
    			canv.id = newRect.id = rect.id = uuid;
    			
    			
    			
    			
    			that.drawLabelContainer(canv,uuid);
    			that.drawLabelImage(canv, newRect, img, imgInfo);
    			
        		
        	}
        	
        	
        },
        
        
        
        rescale : function(img){
        	var canvas_max_width = 560;
            var canvas_max_height = 380;
            var scaleFactor=0;
            if(canvas_max_height/canvas_max_width >= img.naturalHeight/img.naturalWidth  ){
            	scaleFactor=canvas_max_width/img.naturalWidth;
            }else{
            	scaleFactor=canvas_max_height/img.naturalHeight;
            }
            
            var imgInfo = gObj.imgInfo;
            imgInfo.scaleFactor = scaleFactor;
            imgInfo.width = img.naturalWidth;
            imgInfo.height = img.naturalHeight;
            
            
            canvas.setWidth(img.naturalWidth*scaleFactor);
         	canvas.setHeight(img.naturalHeight*scaleFactor);
    		canvas.calcOffset();
    		canvas.renderAll();
            
    	},
    	
    	del : function(){
    		var del = $("#label-container").find(".label-wrap.on");
    		$.each(del, function(index, value){
    			cmp_id = value.id.split("_")[1];
    			canvas.getObjects().forEach(function(o) {
        	        if(o.id === cmp_id) {
        	        	 canvas.remove(o);
        	             $("#div_"+o.id).remove();
        	             delete(gObj.labelMap[o.id]);
        	        }
        		});
    		});
  	},
  		
  		guid : function() {
  			function s4() {
  				return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
  			}
  			return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
  		},
  		
  		setLabelById : function(uuid) {
  			 gObj.newRect = gObj.labelMap[uuid]; 
  		}
    	
		
    };

</script>
    
