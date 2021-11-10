<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/header"  flush="false" />

<style>
     .canvas-container{ margin : 0px auto;}
     .demo {padding:0;background-color: #f5f6fa; position:relative;}
	 #label-container {overflow-x: scroll; height:167px;  display:flex;align-items:center; width: 721px;margin: 0 auto;background-color: white;position:relative;margin-top:10px}
	 #label-container .label-wrap {float:left ; margin:10px; display:flex;align-items:center; justify-content: center;position:relative;flex-direction: column;width:94px;}
	 #label-container .label-wrap canvas{  ;position:relative}
	 #label-container .label-wrap.on .crop-img{border:solid #3656ff 2px}
	 #label-container .label-wrap .crop-img {cursor:pointer;display:flex;align-items:center; justify-content: center;position:relative;flex-direction: column;height:94px;width:94px;background-color:#f0f0f0;border:solid 1px #b2b7be}
	 
	 
	 #label-container .label-wrap .label{height:25px ; width:100%;position:relative;margin-top:10px}
	 #label-container .label-wrap .label input{width:100%;position:relative}
	 
	 #detail-info{position: absolute; top: 0px; left: 0px;}
	 #frame-container{position:relative;background-color: white;padding: 30px;height:450px;width:721px;margin:0 auto;display: flex;align-items: center;justify-content: center;padding-bottom:15px}
	 #frame-container .prev{position:absolute;background-image:url(/etriPortal/images/btn-arrow-left-normal.png);width:16px;height:25px;top:calc(50% - 25px);left:33px}
	 #frame-container .next{position:absolute;background-image:url(/etriPortal/images/btn-arrow-right-normal.png);width:16px;height:25px;top:calc(50% - 25px);right:33px}
     #frame-container .prev:hover{background-image:url(/etriPortal/images/btn-arrow-left-over.png);cursor:pointer;}
     #frame-container .next:hover{background-image:url(/etriPortal/images/btn-arrow-right-over.png);cursor:pointer;}
     #title-container{width: 722px;
	    height: 44px;
	    background-image: linear-gradient(to right, #0012ff, #00fff0);
	    margin: 0 auto;
	    border-top-left-radius: 8px;
    	border-top-right-radius: 8px;
	    
	 }
	    
     #title-container .title{font-family: OpenSans;
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
     	font-family: OpenSans;
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
     
     #submit{
	     width: 195px;
		  height: 45px;
		  border-radius: 22px;
		  border: solid 1px #3656ff;
		  background-color: #3656ff;
		  cursor:pointer;
		  font-family: MyriadPro;
		  font-size: 18px;
		  font-weight: normal;
		  font-style: normal;
		  font-stretch: normal;
		  line-height: 44px;
		  letter-spacing: normal;
		  text-align: center;
		  color: var(--white);
		  margin:0 auto;
		  margin-top:15px;
		  
	}
	
	.meta-list-wrap { position:absolute;}
	.meta-list-wrap .meta-list{
		background-color: white;
	   padding:10px 20px;
	   height: 625px;
	   width: 250px;
	   overflow-y:scroll;
	   
	   
	 }
	.meta-list-wrap .meta-list .meta-row{ ;}
	.meta-list-wrap .meta-list .meta-row .meta-nickname{ }
	.meta-list-wrap .meta-list .user-row{margin-top:5px;margin-bottom:5px;text-align: center; cursor: pointer; }
	.meta-list-wrap .meta-title{
		width: 250px;
	    height: 44px;
	    background-image: linear-gradient(to right, #0012ff, #00fff0);
	    
	    border-top-left-radius: 8px;
	    border-top-right-radius: 8px;
	    font-family: OpenSans;
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
	
     
</style>

  

   <section class="demo">
   	  <div class='meta-list-wrap'>
   	     <div class='meta-title'>Workers</div>
   	     <div class='meta-list' >
   	     	
   	     </div>
   	  </div>
   	  
   
      <div class="container">
      	
      	<div id='title-container'>
      		<div class='title'></div>
      		<div class='my-token'></div>
      	</div>
      	<div class='clear'></div>
      	<div id="frame-container" >
      		<div class="prev prev_btn"></div>
      		<div class="next next_btn"></div>
      		<canvas id='c' width="800px" height="600px" />
      		
      	</div>
      	
      	
      	<div id="label-container">
      		
      	</div>
      	
      	<div id='submit'>Submit</div>
      	
         
      </div>
      
      
   </section>
   
   <div id="detail-info">
   		<div class='detail-wrap'>
   			<table>   				
   				<tr>
   					<td>a</td>
   					<td>b</td>
   				</tr>
   				<tr>
   					<td>d</td>
   					<td>e</td>
   				</tr>
   			</table>
   		</div>
   
   </div>
   
   
<jsp:include page="/footer"  flush="false" />
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
		newRect : {id : 0, width: 100, height: 100, left: 5, top: 5, angle: 0,fill: 'rgba(255,0,0,0.5)',label:""},	
		labelMap : {},
		tempRect : {beforeX:0,beforeY:0,afterX:0,afterY:0}
	};
	
	var gObj = null;
	
	var canvas = window._canvas = new fabric.Canvas('c');
	var colorHash = new ColorHash();
	console.log(colorHash);
	$(function(){
		
		demo.route();
		
		
		
		
		
	});
	
	
	
	
	

    var demo = {
    	route : function(){
    		//세션처리 
    		var that = this;
    		var status = sessionStorage.getItem("detailStatus");
    		status = "enrichment";
    		if(status == "view"){
    			//이벤트 바인딩할때 못고치게
    			//권한이 있는 것으로 메타정보들의 리스트를 보여주며, 각 리스트를 선택하게 되면 가공데이터를 보여줘야함
    			that.getContentsDetail(assetboxId);
    			$("#submit").text("download");
    			
    			$(".meta-list-wrap").show();
    			$("#title-container .title").text("View");
    					
    			
    		}else if(status == "enrichment"){
    			//이벤트 바인딩 고치게
    			//가공일경우 내가 가공한 데이터가 있으면 가져와야함
    			that.getEnrichmentDetail("1");
    			$("#submit").text("submit");
    			$(".meta-list-wrap").hide();
    			$("#title-container .title").text("Enrichment");
    		}else{
    			//알람 및 리스트로 이동
    		}
    		
    	},
    	
    	getEnrichmentDetail : function(datasetId){
    		var that = this;
// 			showLoader();
			
            ajaxData = {
            	dataset_id : datasetId
            };
            
            
            $.ajax({
    		   	url :  baseUrl + "data/getDataList.json",
    		   	data : ajaxData,
    		   	type : "POST",
    		   	success : function(res){
    		   		console.log("===getEnrichmentDetail===",res);
//     				hideLoader();
    				if(res.result.code == "200"){
    					that.drawEnrichmentDetail(res.result.data);
    				} else{
    					alert(res.message);
    				}
    		   	},
    		   	
    		   	error : function(err){
					alert(err);
    		   		 console.log("ERROR!!", err);
    		   	}
    		});
    	},
    	
    	//
    	
    	
    	
    	
		drawEnrichmentDetail : function(data){
			var that = this;
    		//데이터를 가져오면,데이터는 리스트로 나올것이고, 리스트에는 
    		imgList = [];
    		assetList = [];
    		for(var i = 0 ; i < data.length ; i++){
        		assetList.push(data[i].id);
        		imgList.push(data[i].path);
        		
    			
        			
    		}
    		imgList = ["/etriPortal/images/sabana3.jpg","/etriPortal/images/sabana3.jpg","/etriPortal/images/sabana3.jpg"];
    		
			that.initEnrichment();
			that.eventBindEnrichment();

			
    		
	
    		
    	},
    	
    	getMyMetaDetail : function(dataId){
    		console.log("TT");
    		
    		var that = this;
// 			showLoader();
			var ajaxData = {
				data_id : dataId,	
			};
			
			
			$.ajax({
    		   	url :  baseUrl + "data/getMetaList/",
    		   	data : ajaxData,
    		   	type : "POST",
    		   	success : function(res){
    		   		console.log("===getMyMetaDetail===",res);
//     				hideLoader();
    				if(res.result.code == "200"){
    					
    					var data = res.result.data;
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
    					
    					
    				} 
    				updateRedraw();
    		   	},
    		   	error : function(err){
    		   		alert(err);
    		   		 console.log("ERROR!!", err);
    		   	}
    		});
    	},
    	
    	initEnrichment : function(){
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
			
			gObj.img.onload = function(){
				rescale(this);
				canvas.setBackgroundImage(gObj.img.src, canvas.renderAll.bind(canvas), {
			          backgroundImageOpacity: 0.5,
			          backgroundImageStretch: true,
			          width: canvas.width,
			          height: canvas.height
			          
			    });
				demo.getMyMetaDetail(assetList[gInfo.current_cursor]);
				
				
			}
			/*이미지 로딩 끝*/
			fabric.Object.prototype.set({
		          transparentCorners: false,
		          cornerColor: 'rgba(102,153,255,0.5)',
		          cornerSize: 12,
		          hasRotatingPoint: false,
		          padding: 5
			});

    	},
    	
    	
    	eventBindEnrichment : function(){
    		var that = this;
    		canvas.on("mouse:down",function(evt){
				console.log("mouse:down");
				if(evt.target != null){
					
					$("#label-container").find(".label-wrap").removeClass("on");
		    		$("#label-container").find("#div_"+evt.target.id).addClass("on");
					
					return;
					
				}else{
					$("#label-container").find(".label-wrap").removeClass("on");
				}
				var tempRect = gObj.tempRect;
				tempRect.beforeX = evt.e.layerX;
				tempRect.beforeY = evt.e.layerY;
				
			});
			
			canvas.on("object:moving",function(evt){
				console.log("object:moving");
				var uuid = evt.target.id
				setLabelById(uuid);

				var tempRect = gObj.tempRect;
				var newRect = gObj.newRect;
				var img = gObj.img;
				var imgInfo = gObj.imgInfo;
				newRect.width = evt.target.getWidth();
				newRect.left = evt.target.getLeft();
			
				newRect.height = evt.target.getHeight();
				newRect.top = evt.target.getTop();
			
				var canv = document.getElementById(evt.target.id);
				drawLabel(canv, newRect, img, imgInfo);
				
				gObj.labelMap[uuid] = JSON.parse( JSON.stringify(gObj.newRect) );
			});
			
			canvas.on("object:scaling",function(evt){
				console.log("object:scaling");
				var uuid = evt.target.id;
				setLabelById(uuid);
	 			
				var tempRect = gObj.tempRect;
				var newRect = gObj.newRect;
				
				var img = gObj.img;
				var imgInfo = gObj.imgInfo;
				
				
				newRect.width = evt.target.getWidth();
				newRect.left = evt.target.getLeft();
			
				newRect.height = evt.target.getHeight();
				newRect.top = evt.target.getTop();
			 
				var canv = document.getElementById(evt.target.id);
				drawLabel(canv, newRect, img, imgInfo);
		
				
				gObj.labelMap[uuid] = JSON.parse( JSON.stringify(gObj.newRect) );
			});
			
			
			
			canvas.on("mouse:up",function(evt){
				console.log("mouse:up");
				if(evt.target != null){ return ;}
				
				var tempRect = gObj.tempRect;
				var newRect = gObj.newRect;
				var img = gObj.img;
				var imgInfo = gObj.imgInfo;
				
				
				tempRect.afterX = evt.e.layerX;
				tempRect.afterY = evt.e.layerY;
				
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
				var uuid = guid();
				canv.id = newRect.id = rect.id = uuid;
				
				var div = "<div id='div_"+uuid+"' class='label-wrap'> <div class='crop-img'></div> <div class='label'><input type='text' /></div> </div>";
				$("#label-container").prepend(div);
				$("#label-container #div_"+uuid+" .crop-img").html(canv);
				
				//레이블
// 				$("#label-container #div_"+uuid+" .label input").off("change").on("change",function(e){
// 					//jpark
// 					gObj.labelMap[uuid].label = $(this).val();
// 				});
				$("#label-container #div_"+uuid+" .label input").off("focus").on("focus",function(e){
					$("#label-container").find(".label-wrap").removeClass("on");
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
				});
				
				
				
				
				drawLabel(canv, newRect, img, imgInfo);
				gObj.labelMap[uuid] = JSON.parse( JSON.stringify(gObj.newRect) );

				console.log("create rect");
				
				
			});
			
			canvas.on("object:modified",function(evt){
				console.log("object:modified");
				console.log(evt.target);
				
			});
			
			
			
			
			$(document).off("keydown").on("keydown", function(){
				if( $(".label-wrap.on").length == 0){return;} 
				if (event.keyCode == 8 || event.keyCode == 46) {
			        console.log('BACKSPACE was pressed');
			        del();
				    event.preventDefault();
			    }
			    
				
			});
			
			$(".prev_btn").off("click").on("click", function(){
				if(gInfo.current_cursor > 0){
					gInfo.current_cursor--;
					demo.initEnrichment()
				} else{
					alert("첫번째 이미지 입니다");
				}
			});
			
			$(".next_btn").off("click").on("click", function(){
				if(gInfo.current_cursor < imgList.length - 1){
					gInfo.current_cursor++;
					demo.initEnrichment()
				} else{
					alert("마지막 이미지 입니다");
				}
			});
			
			$("#submit").off("click").on("click", function(){
				that.submitMeta();
			});
			
    	},
    	
    	
    	//
    	
    	
    	
    	getMetaList : function(dataId){
    		var that = this;
// 			showLoader();
			var selector = ".meta-list";
			$(selector).html("");
            
            $.ajax({
    		   	url :  baseUrl + "data/getMetaList/",
    		   	data : {},
    		   	type : "POST",
    		   	success : function(res){
//     				hideLoader();
    				if(res.result.code == "200"){
    					console.log("===meta list ===",dataId,res);
    					that.drawMetaList(res.result.data);
    				} else{
    					alert(res.message);
    				}
    		   	},
    		   	error : function(err){
    		   		alert(err);
    		   		 console.log("ERROR!!", err);
    		   	}
    		});

    	},
    	
    	drawMetaList : function(data){
    		//좌측 리스트 표현 
    		var that = this;
    		
    		var keys = Object.keys(data);
    		
    		var html = "";
    		var selector = ".meta-list";
    		for(i = 0 ; i < keys.length ; i++){
    			
    			html += "<div class='user-row' ownerAcctId='"+keys[i]+"'  >"+data[keys[i]]+"</div>";	
    		}
    		$(selector).html(html);
    	
    		
    		//이벤트바인딩
    		$(".user-row").off("click").on("click",function(){
    			var assetId = assetList[gInfo.current_cursor];
    			var ownerAcctId = $(this).attr("ownerAcctId");
    			that.getMetaDetail(assetId,ownerAcctId);
    		});
    		
    	},
    	
    	
    	getMetaDetail : function(assetId,ownerAcctId){
    		var that = this;
			showLoader();
			
            $.ajax({
    		   	url :  demoUrl + "assetbox/assets/"+assetId+"/meta/"+ownerAcctId,
    		   	data : {},
    		   	type : "GET",
    		   	success : function(res){
    				hideLoader();
    				if(res.code == "200"){
    					that.drawMetaDetail(res.account);
    				} else{
    					alert(res.message);
    				}
    		   	},
    		   	error : function(err){
    		   		alert(err);
    		   		 console.log("ERROR!!", err);
    		   	}
    		});
    	},
    	
		drawMetaDetail : function(data){
			console.log(data);
			gObj.labelMap = {};
			for(var i = 0 ; i < data.length ; i++){
// 				if(i == 0){
					
// 					gObj.imgInfo.height = data[i].height,
// 					gObj.imgInfo.scaleFactor = data[i].scaleFactor,
// 					gObj.imgInfo.width = data[i].width
// 				}
				
				gObj.labelMap[data[i].id] = {						
					angle: data[i].angle,
					fill: "rgba(255,0,0,0.5)",
					height: data[i].metaHeight*1,
					id: data[i].id,
					label: data[i].label,
					left: data[i].left*1,
					top: data[i].top*1,
					width: data[i].metaWidth*1
				};
			}
			
			
			
			
			updateRedraw();
			
			canvas.selection = false;
			canvas.forEachObject(function(o) {
			  o.selectable = false;
			});
			
    	},
    	
    	getContentsDetail : function(assetboxId){
    		var that = this;
			showLoader();
			
            
            
            $.ajax({
    		   	url :  demoUrl + "assetbox/"+assetboxId,
    		   	data : {},
    		   	type : "GET",
    		   	success : function(res){
    		   		console.log("===getContentsDetail===",res);
    				hideLoader();
    				if(res.code == "200"){
    					that.drawContentsDetail(res.account);
    				} else{
    					alert(res.message);
    				}
    		   	},
    		   	error : function(err){
    		   		alert(err);
    		   		 console.log("ERROR!!", err);
    		   	}
    		});
    	},
		drawContentsDetail : function(data){
			var that = this;
    		//데이터를 가져오면,데이터는 리스트로 나올것이고, 리스트에는 
    		imgList = [];
    		assetList = [];
    		for(var i = 0 ; i < data.length ; i++){
//     			data[i].id
//         		data[i].name
//         		data[i].imgSrc
        		assetList.push(data[i].id);
        		imgList.push(data[i].imgSrc);
        		
    			
        			
    		}
    		
    		
			that.initView();
			that.getMetaList(assetList[0]);
			

			$(".prev_btn").off("click").on("click", function(){
				if(gInfo.current_cursor > 0){
					gInfo.current_cursor--;
					that.initView();
					that.getMetaList(assetList[gInfo.current_cursor]);
				} else{
					alert("첫번째 이미지 입니다");
				}
			});
			
			$(".next_btn").off("click").on("click", function(){
				if(gInfo.current_cursor < imgList.length - 1){
					gInfo.current_cursor++;
					that.initView();
					that.getMetaList(assetList[gInfo.current_cursor]);
				} else{
					alert("마지막 이미지 입니다");
				}
			});
			
			$("#submit").off("click").on("click", function(){
				
				var imgUrl = gObj.imgSrc;
				var filename = imgUrl.split("/")[imgUrl.split("/").length-1].split(".")[0];
				
				var data = "id,images,x,y,w,h,label\n";
				var keys = Object.keys(gObj.labelMap);
				
				for(var i = 0 ; i < keys.length ; i++){
					data += gObj.labelMap[keys[i]].id + "," + imgUrl + "," + gObj.labelMap[keys[i]].left + "," + gObj.labelMap[keys[i]].top + "," + gObj.labelMap[keys[i]].width + "," + gObj.labelMap[keys[i]].height + "," + gObj.labelMap[keys[i]].label+"\n";
				}
				
				download(data,filename+".txt","text/plain");
				
			});
	
    		
    	},
    	
    	initView : function(){
			canvas.clear();
			
    		
    		gArr[0] = JSON.parse( JSON.stringify(gObjTemplete) );	
    		
    		gObj = gArr[0];
			gObj.imgSrc = imgList[gInfo.current_cursor];
			
			
			
			/*이미지 로딩 시작*/
			gObj.img = new Image();
			gObj.img.src = "<c:url value='"+gObj.imgSrc+"' />";
			
			gObj.img.onload = function(){
				rescale(this);
				canvas.setBackgroundImage(gObj.img.src, canvas.renderAll.bind(canvas), {
			          backgroundImageOpacity: 0.5,
			          backgroundImageStretch: true,
			          width: canvas.width,
			          height: canvas.height
			          
			    });
				
				updateRedraw();
				
			}
			/*이미지 로딩 끝*/
			fabric.Object.prototype.set({
		          transparentCorners: false,
		          cornerColor: 'rgba(102,153,255,0.5)',
		          cornerSize: 12,
		          hasRotatingPoint: false,
		          padding: 5
			});
			
			
    		
    	},
    	
    	
    	submitMeta : function(){
    		var that = this;
// 			showLoader();
			

			var index = gInfo.current_cursor;
			
			var assetId = assetList[index];
          	var width = gObj.imgInfo.width;
          	var height = gObj.imgInfo.height;
          	var scaleFactor = gObj.imgInfo.scaleFactor;
          	
          	          	
          	var ajaxData = {info:[]};
          	
          	var keys = Object.keys(gObj.labelMap);
          	
          	for(var i = 0 ; i < keys.length ; i++){
          		
          		var box_width = gObj.labelMap[keys[i]].width;
              	var box_height = gObj.labelMap[keys[i]].height;
              	var left = gObj.labelMap[keys[i]].left;
              	var top = gObj.labelMap[keys[i]].top;
              	var label = gObj.labelMap[keys[i]].label;
              	
              	ajaxData.info.push({
              		data_id : assetId+"",
                   	width:box_width/scaleFactor+"",
                   	height:box_height/scaleFactor+"",
                   	left:left/scaleFactor+"",
                   	top:top/scaleFactor+"",
                   	label:label+""
              	});
          		
          	}
          	
			
			ajaxData.info = JSON.stringify(ajaxData.info); 
			console.log("==ajaxdata==",ajaxData);
			
           
            
            $.ajax({
    		   	url :  baseUrl + "data/updateMeta.json",
    		   	data : ajaxData,
    		   	type : "POST",
    		   	traditional: true,
    		   	success : function(res){
    				hideLoader();
    				if(res.code == "200"){
    					console.log(res);
    					alert("Enrichment가 완료되었습니다");
    					
    				} else{
    					alert(res.message);
    				}
    		   	},
    		   	error : function(err){
    		   		alert(err);
    		   		 console.log("ERROR!!", err);
    		   	}
    		});
    	},
    	
    	
    	
    		
    		
    	init : function(){
    		canvas.clear();
    		if(typeof gArr[gInfo.current_cursor] == "undefined"){
    			gArr[gInfo.current_cursor] = JSON.parse( JSON.stringify(gObjTemplete) );	
    		}
    		gObj = gArr[gInfo.current_cursor];
			gObj.imgSrc = imgList[gInfo.current_cursor];
			
			
			
			/*이미지 로딩 시작*/
			gObj.img = new Image();
			gObj.img.src = "<c:url value='"+gObj.imgSrc+"' />";
			
			gObj.img.onload = function(){
				rescale(this);
				canvas.setBackgroundImage(gObj.img.src, canvas.renderAll.bind(canvas), {
			          backgroundImageOpacity: 0.5,
			          backgroundImageStretch: true,
			          width: canvas.width,
			          height: canvas.height
			          
			    });
				updateRedraw();
				
			}
			/*이미지 로딩 끝*/
			fabric.Object.prototype.set({
		          transparentCorners: false,
		          cornerColor: 'rgba(102,153,255,0.5)',
		          cornerSize: 12,
		          hasRotatingPoint: false,
		          padding: 5
			});
			
			
						
			
		},
		
		eventBind : function(){

			canvas.on("mouse:down",function(evt){
				console.log("mouse:down");
				if(evt.target != null){
					
					$("#label-container").find(".label-wrap").removeClass("on");
		    		$("#label-container").find("#div_"+evt.target.id).addClass("on");
					
					return;
					
				}else{
					$("#label-container").find(".label-wrap").removeClass("on");
				}
				var tempRect = gObj.tempRect;
				tempRect.beforeX = evt.e.layerX;
				tempRect.beforeY = evt.e.layerY;
				
			});
			
			canvas.on("object:moving",function(evt){
				console.log("object:moving");
				var uuid = evt.target.id
				setLabelById(uuid);

				var tempRect = gObj.tempRect;
				var newRect = gObj.newRect;
				var img = gObj.img;
				var imgInfo = gObj.imgInfo;
				newRect.width = evt.target.getWidth();
				newRect.left = evt.target.getLeft();
			
				newRect.height = evt.target.getHeight();
				newRect.top = evt.target.getTop();
			
				var canv = document.getElementById(evt.target.id);
				drawLabel(canv, newRect, img, imgInfo);
				
				gObj.labelMap[uuid] = JSON.parse( JSON.stringify(gObj.newRect) );
			});
			
			canvas.on("object:scaling",function(evt){
				console.log("object:scaling");
				var uuid = evt.target.id;
				setLabelById(uuid);
	 			
				var tempRect = gObj.tempRect;
				var newRect = gObj.newRect;
				
				var img = gObj.img;
				var imgInfo = gObj.imgInfo;
				
				
				newRect.width = evt.target.getWidth();
				newRect.left = evt.target.getLeft();
			
				newRect.height = evt.target.getHeight();
				newRect.top = evt.target.getTop();
			 
				var canv = document.getElementById(evt.target.id);
				drawLabel(canv, newRect, img, imgInfo);
		
				
				gObj.labelMap[uuid] = JSON.parse( JSON.stringify(gObj.newRect) );
			});
			
			
			
			canvas.on("mouse:up",function(evt){
				console.log("mouse:up");
				if(evt.target != null){ return ;}
				
				var tempRect = gObj.tempRect;
				var newRect = gObj.newRect;
				var img = gObj.img;
				var imgInfo = gObj.imgInfo;
				
				
				tempRect.afterX = evt.e.layerX;
				tempRect.afterY = evt.e.layerY;
				
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
				var uuid = guid();
				canv.id = newRect.id = rect.id = uuid;
				
				var div = "<div id='div_"+uuid+"' class='label-wrap'> <div class='crop-img'></div> <div class='label'><input type='text' /></div> </div>";
				$("#label-container").prepend(div);
				$("#label-container #div_"+uuid+" .crop-img").html(canv);
				
				//레이블
				$("#label-container #div_"+uuid+" .label input").off("change").on("change",function(e){
					gObj.labelMap[uuid].label = $(this).val();
				});
				$("#label-container #div_"+uuid+" .label input").off("focus").on("focus",function(e){
					$("#label-container").find(".label-wrap").removeClass("on");
		    	});
				
				
				
				drawLabel(canv, newRect, img, imgInfo);
				gObj.labelMap[uuid] = JSON.parse( JSON.stringify(gObj.newRect) );

				console.log("create rect");
				
				
			});
			
			canvas.on("object:modified",function(evt){
				console.log("object:modified");
				console.log(evt.target);
				
			});
			
			
			
			
			$(document).off("keydown").on("keydown", function(){
				if( $(".label-wrap.on").length == 0){return;} 
				if (event.keyCode == 8 || event.keyCode == 46) {
			        console.log('BACKSPACE was pressed');
			        del();
				    event.preventDefault();
			    }
			    
				
			});
			
			$(".prev_btn").off("click").on("click", function(){
				if(gInfo.current_cursor > 0){
					gInfo.current_cursor--;
					demo.init()
				} else{
					alert("첫번째 이미지 입니다");
				}
			});
			
			$(".next_btn").off("click").on("click", function(){
				if(gInfo.current_cursor < imgList.length - 1){
					gInfo.current_cursor++;
					demo.init()
				} else{
					alert("마지막 이미지 입니다");
				}
			});
			
			
		}
		
    };
    
    
    function drawLabel(canv, newRect, img, imgInfo){
		var context = canv.getContext('2d');		
		var w = newRect.width/imgInfo.scaleFactor;
		var h = newRect.height/imgInfo.scaleFactor;
		
		var dw = 0;
		var dh = 0;
		
		var g_w = 90;
		var g_h = 90;
		
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
		context.clearRect(0, 0, canv.width, canv.height);			
		context.drawImage(img,newRect.left/imgInfo.scaleFactor, newRect.top/imgInfo.scaleFactor, newRect.width/imgInfo.scaleFactor, newRect.height/imgInfo.scaleFactor, 0, 0,dw,dh);		      
		console.log(newRect.label,$(canv).parent().find("input"));
		
		$(canv).parent().parent().find("input").val(newRect.label);		
		
		$($(canv).parent()).off("click").on("click",function(evt){
			cmp_id = $(this).parent()[0].id.split("_")[1];
			canvas.getObjects().forEach(function(o) {
    	        if(o.id === cmp_id) {
    	            canvas.setActiveObject(o);
    	        }
    		});
			$(this).parent().parent().find(".label-wrap").removeClass("on");
	   		$(this).parent().addClass("on");
			
			
		});
		
//     	$(canv).off("click").on("click",function(evt){
//     		canvas.getObjects().forEach(function(o) {
//     	        if(o.id === evt.target.id) {
//     	            canvas.setActiveObject(o);
//     	        }
//     	    });
//     		$(this).parent().parent().find("canvas").removeClass("on");
//     		$(this).addClass("on");
//     	});
    }
    
    function updateRedraw(){
    	console.log("updateRedraw");
    	$("#label-container").empty();
    	
    	var canvObjLen = canvas.getObjects().length;
    	for(var i = 0 ; i < canvObjLen; i++){
    		canvas.remove(canvas.getObjects()[0]);
    	}
    	
			
		
    	var keyArr = Object.keys(gObj.labelMap);
    	if(keyArr.length < 1 ){return;}
    	
    	for(i = 0 ; i < keyArr.length ; i++){
    		var uuid = keyArr[i];
    		var newRect = gObj.labelMap[uuid];
    		var img = gObj.img;
			var imgInfo = gObj.imgInfo;
    		
			var rect = new fabric.Rect(newRect);
		
			
			canvas.add(rect);
			
			var canv = document.createElement('canvas');
			canv.id = newRect.id = rect.id = uuid;
			
			var div = "<div id='div_"+uuid+"' class='label-wrap'> <div class='crop-img'></div> <div class='label'><input type='text' /></div> </div>";
			$("#label-container").prepend(div);
			$("#label-container #div_"+uuid+" .crop-img").html(canv);
			
			//레이블
// 			$("#label-container #div_"+uuid+" .label input").off("change").on("change",function(e){
// 				gObj.labelMap[uuid].label = $(this).val();
// 			});
			$("#label-container #div_"+uuid+" .label input").off("focus").on("focus",function(e){
				$("#label-container").find(".label-wrap").removeClass("on");
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
			});
			
			
			drawLabel(canv, newRect, img, imgInfo);
			
    		
    	}
    	
    	
    }
    
    function rescale(img){
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
        
	}
    
    
    
    function rescale2(cvs,c_width,c_height,width,height){
    	
        var scaleFactor=0;
        if(c_height/c_width >= height/width  ){
        	scaleFactor=c_width/width;
        }else{
        	scaleFactor=c_height/height;
        }
        
		cvs.setWidth(width*scaleFactor);
		cvs.setHeight(height*scaleFactor);
		cvs.calcOffset();
		cvs.renderAll();
        
	}
    
      
    function del(){
          del_obj = canvas.getActiveObject();
          console.log(del_obj);
          canvas.remove(del_obj);
          $("#div_"+del_obj.id).remove();
          delete(gObj.labelMap[del_obj.id]);
	}
      
	function guid() {
		function s4() {
			return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
		}
		return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
	}
	
	function setLabelById(uuid) {
		 gObj.newRect = gObj.labelMap[uuid]; 
		
	}

</script>
    
