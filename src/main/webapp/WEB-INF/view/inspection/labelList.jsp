<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<c:url value="/css/swiper.min.css" />">
<script src="<c:url value="/js/swiper.min.js" />"></script> 
<style>
	@media screen and (min-width: 1600px){
		#labelList section.label .frame-wrap .label-container { width : 536px; }
		#labelList section.label .tag-wrap .content { width: 540px; }
		#labelList section.label .tag-box { width: 78px; margin: 16px 5px 0 5px; }
	}
	@media screen and (max-width: 1600px){
		#labelList section.label .frame-wrap .label-container { width : 402px; }
		#labelList section.label .tag-wrap .content { width: 405px; }
		#labelList section.label .tag-box { width: 71px; margin: 16px 4px 0 4px; }
	}
	@media screen and (max-width: 1440px){
		#labelList section.label .frame-wrap .label-container { width : 402px; }
		#labelList section.label .tag-wrap .content { width: 405px; }
		#labelList section.label .tag-box { width: 69px; margin: 16px 5px 0 5px; }
	}
	
	#labelList {height: 100%;}
	#labelList .enrichment_wrap { background-color: #fff; }
	#labelList section.enrichment {width: 60%; height: 100%; position:relative; border: 1px solid #e5e5e5; }
	#labelList section .title-wrap{ width: 657px; margin: 23px auto 17px; font-size: 12px; font-weight: 400; color: #343434;}
	#labelList section .title-wrap .poly_btn{ padding: 3px 10px; font-weight: 300; color: #333333; border: 1px solid #d9d9d9; border-radius: 3px; background-color: #ffffff; cursor: pointer; }
	#labelList section .title-wrap .poly_btn:hover { background-color: #fafafa; }
	#labelList section .title-wrap .poly_btn.action { background-color: #4c84ff; }
	#labelList section.enrichment .frame-wrap{width: 657px; position: relative; padding: 40px 0 40px 0; margin: 0 auto; border: 1px solid #e5e5e5;}
	#labelList section.enrichment .prev{position:absolute;background:url(images/btn_image_arrow_left_normal.png) left;width:16px;height:25px;top:calc(50% - 25px);left:23px}
	#labelList section.enrichment .next{position:absolute;background:url(images/btn_image_arrow_right_normal.png) right;width:16px;height:25px;top:calc(50% - 25px);right:23px}
    #labelList section.enrichment .prev:hover{background:url(images/btn_image_arrow_left_hover.png) left;cursor:pointer;}
    #labelList section.enrichment .next:hover{background:url(images/btn_image_arrow_right_hover.png) right;cursor:pointer;}
    #labelList section.enrichment #frame-container { height: 380px; display: flex; display: -webkit-flex; display: -ms-flexbox; -webkit-align-items: center; align-items: center; }
	#labelList section.enrichment canvas { border-radius: 8px; }
	#labelList section.enrichment .empty_wrap { margin: 0 auto; text-align: center; margin-top: 10px; color: #777777; }
	#labelList section.enrichment .empty_wrap .no_image { margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; height: 37px; background-image: url(./images/icon_nodata_list.png); }
	#labelList section.enrichment .empty_wrap .eng_text { margin-bottom: 3px; font-size: 16px; }
	#labelList section.enrichment .empty_wrap .kor_text { font-size: 12px; }
	#labelList section.enrichment .imgList-wrap { width: 657px; margin: 20px auto; background-color: #f5f5f5; border: 1px solid #e5e5e5; }
	#labelList section.enrichment .imgList { width: 657px; position: relative; overflow: hidden; list-style: none; padding: 16px 0; z-index: 1; border-top: 1px solid #e5e5e5; }
	#labelList section.enrichment .swiper-slide { background-position: center; background-size: cover; width: 120px; height: 89px; }
	#labelList section.enrichment .swiper-slide img { width: 100%; height: 100%; }
	
	#labelList section.label { width: 40%; height: 100%; position: relative; background-color: #ffffff; border: 1px solid #e5e5e5; -ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none; }
	#labelList section.label .ar { position: absolute; right: 50px; font-size: 12px; font-weight: 300; }
	
	#labelList section.label .tag-wrap .title { font-weight: 400; color: #555555; position: relative; width: calc(100% - 100px); height: 48px; padding: 0 50px; border-bottom: 1px solid #e7e7e7; }
	#labelList section.label .tag-wrap .title .layer_bar { display: inline-block; width: 2px; height: 12px; margin-right: 10px; border-radius: 1px; background: #4c84ff; }
	#labelList section.label .tag-wrap .content-wrap { height: 116px; overflow: overlay; }
	#labelList section.label .tag-wrap .content { padding-bottom: 16px; margin: 0 auto; }
	#labelList section.label .tag-box { line-height: 32px; background: #f4f7fc; border: 1px solid #d9d9d9; border-radius: 4px; text-align: center;  font-size: 14px; font-weight: 300; color: #555555; cursor: pointer; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; }
	#labelList section.label .tag-box.selected { background: #4c84ff; border-color: #2b65e6; color: #ffffff; box-shadow: 0 3px 4px 0 rgba(159, 189, 255, 0.7);}
	
	#labelList section.label .frame-wrap { height: calc(100% - 269px); border-top: 1px solid #e7e7e7; overflow: overlay; }
	#labelList section.label .frame-wrap .label-container { margin: 13px auto; }
	#labelList section.label .frame-wrap .label-container .box_contain {float:left ; display:flex;align-items:center; justify-content: center;flex-direction: column;width:120px;margin: 7px;}
	#labelList section.label .frame-wrap .label-container .box_contain canvas{  position:relative;}
	#labelList section.label .frame-wrap .label-container .box_contain .box.on{border:solid #218aff 1px; background-color: rgba(76, 132, 255, 0.2);}
	#labelList section.label .frame-wrap .label-container .box_contain .box {cursor:pointer;display:flex;align-items:center; justify-content: center;position:relative;flex-direction: column;height:94px;width:120px;border:solid 1px #d9d9d9; border-radius: 2px; background-color: #ffffff; }
	#labelList section.label .frame-wrap .label-container .box_contain .label_wrap { position: relative; }
	#labelList section.label .frame-wrap .label-container .box_contain .label_wrap input{ width: 94px;position: relative; margin: 8px 0 0 0; padding: 5px 23px 5px 3px; border: 1px solid #d9d9d9; border-radius: 2px; font-family: Open_Sans; font-size: 13px; font-weight: 300; background-color: #ffffff; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; }
	#labelList section.label .frame-wrap .label-container .box_contain .label_wrap input:focus { border: 1px solid #218aff; background: none; background-color: #ffffff; }
	#labelList section.label .frame-wrap .label-container .box_contain .findTag { position: absolute; top: 25px; left: 0; width: calc(100% + 1px); max-height: 144px; margin-top: 16px; overflow-x:hidden; overflow-y: overlay; white-space: nowrap; text-overflow: ellipsis; border-radius: 2px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1); border: 1px solid #dadada; background-color: #ffffff; z-index: 99999999; }
	#labelList section.label .frame-wrap .label-container .box_contain .findTag li { line-height: 30px; padding: 0 16px; color: #616263; }
	#labelList section.label .frame-wrap .label-container .box_contain .findTag li:nth-of-type(odd) { background-color: #f8f8f8; }
	#labelList section.label .frame-wrap .label-container .box_contain .findTag li:hover { background-color: #cde5ff; }
	
    #labelList .btn_wrap { height: 103px; position: absolute; right: 0; bottom: 0; background-color: #ffffff; }
    #labelList .submit_btn { width: 240px; line-height: 36px; margin: 0 auto; border-radius: 23px; box-shadow: 0 4px 8px 0 #b4d7ff; background-color: #4c84ff; font-size: 13px; font-weight: 300; color: #ffffff; cursor: pointer; }
    #labelList .submit_btn:hover { background-color: #3A71E9; }
    #labelList .list_btn { cursor:pointer; width: 153px; line-height: 44px;     margin-top: 0;   font-size: 14px;  font-weight: 300;}
	#labelList .list_btn a:hover {color:#fff; background-color: #008bed;}
	
	#labelList .hover_box { max-width: 140px; border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
	#labelList .hover_box div {font-family: Open_Sans; font-size: 13px; color: #555555;}
	#labelList .hover_div div {word-break: break-word; margin: 2px 5px; line-height:20px; white-space: normal; font-weight: 300; font-family: Open_Sans;}
	
	#labelList .frame-wrap .title { font-size: 14px; font-weight: 400; color: #555; position: relative; width: calc(100% - 100px); height: 48px; line-height: 48px; padding: 0 50px; border-bottom: 1px solid #e7e7e7; }
	#labelList .title-wrap span:first-child { font-size: 13px; }
	#labelList .title-wrap span:last-child { color: #4c84ff; font-size: 14px; }
</style>
<c:set var="datasetId" value="${param.datasetId}" />
	<div class="container" id="labelList">
		<div class="contents">
			<div class="enrichment_wrap flex">
				<!-- jpark -->
				<section class="enrichment">
					<div class="title-wrap"><span>Label List</span> <span>|</span> Canvas</div>
					
					<div class="frame-wrap">
						<div id="frame-container" >
							<canvas id='p' width="800px" height="600px"></canvas>
						</div>
					</div>
				</section>
				<section class="label">
					<div class="tag-wrap">
						<div class="title flex">
							<div class="name">Filter</div>
<!-- 							<div class="name">Tag</div> -->
						</div>
						<div class="content-wrap">
							<div class="content"></div>
						</div>
					</div>
					<div class='clear'></div>
					<div class="frame-wrap">
						<div class="title">Label</div>
						<div class="label-container"></div>
						<div class="clear"></div>
					</div>
					<div class="btn_wrap flex">
						<div id="submit_btn" class="submit_btn">Save</div>
					</div>
				</section>
				<!-- jpark -->
			</div>
		</div>
		<!-- end contents -->
	</div>
   
<script src="<c:url value="/js/download.js" />"></script>

<script>
	let scf;
	const labelList = {
		pt:$("#labelList"),
		data: {
			nodes : null,
			searchObj : {},
			modifiedObj : {},
			groupView : null,
			preView : null,
			media_type : null,
			label_type : null,
		},
		init(nodes) {
			
			const that = this;
			
			//j.park 초기화 이슈로 추가
			that.data.modifiedObj = {};
			
			//jh.sa: enrichment => label list 페이지로 이동한 경우 label 이동해도 canvas id가 겹쳐서 동작이 안되는것처럼 보이던 이슈로 추가
			enrichment.pt.find("section.label .frame-wrap").html("");
			
			that.data.nodes = nodes;
			that.reset();
			setParentObj(this);	//객체 root 세팅
			
			that.data.groupView = new groupView(that, nodes.id);
			that.data.preView = new preView(that);
			
			const html = '<div class="empty_wrap"><div class="no_image"></div><div class="eng_text">No Data</div><div class="kor_text">you have not selected any data yet</div></div>';
			that.pt.find(".enrichment #frame-container .canvas-container").hide();
			that.pt.find(".enrichment #frame-container").append(html);
			
			that.bind.submit();
			
			dataset_id = nodes.id;
			that.computed.getDatasetById(dataset_id);
		},
		bind : {
			root : null,
			submit() {
				const that = this;
				that.root.pt.find("#submit_btn").off("click").on("click", function() {
					const labelArr = that.root.pt.find(".label_wrap input[type='text']");
					
					for(let i=0; i<labelArr.length; i++){
						if($(labelArr[i]).val() == "") {
							alert("Label 이름을 입력해주세요");
							$(labelArr[i]).focus();
							
							return false;
						}
					}
					that.root.computed.submitMeta();
				});
				
				
			},
			
			addHoverBox(elem,text){
				const that = this;

				if (elem[0].scrollWidth >  elem[0].clientWidth) {
					let btn_width = elem.outerWidth();
					let btn_height = elem.outerHeight();
					let top = elem.offset().top;
					let left = elem.offset().left;
					let right = ($(window).width() - (elem.offset().left + elem.outerWidth())); 
					let bottom = ($(window).height() - (elem.offset().top + elem.outerHeight()));

				   	elem.append("<div class='hover_box'><div class='hover_div'><div>"+text+"</div</div></div>");
				   	let hover_box = elem.children(".hover_box");
				   	let text_div = hover_box.find(".hover_div div");
					hover_box.css({"display" : "block"});
				   	let text_width = text_div.outerWidth();
				   	let text_height = text_div.outerHeight();
				   	hover_box.css({"display" : "none"});
		   	
				   	let x;
				   	let y;
				   	
				   	
				   	if(right - text_width < 0){
				   	//오른쪽이 text 길이보다 작을때
				   		x = left - text_width;
				   		
				   	} else {
				   	//오른쪽이 text 길이보다 클때
				   		x = left + btn_width / 2;
				   	}
				   	
				   	if(bottom - text_height < 0){
				   	//아래가 text 길이보다 작을때
			   			y = top - text_height;
			   		} else {
			   			y = top + btn_height / 2;
			   		}

				   	hover_box.css({"top":y+"px", "left":x+"px","position": "fixed","display" : "block"});
				};
			},			
			
			removeHoverBox(elem){
				let that = this;
				elem.find(".hover_box").remove();
			},			
		},
		computed : {
			root : null,
			
			getDatasetById : function(id){
				const root = this.root;
				var that = this;
				$("#loader").show();
				$.ajax({
					url :  baseUrl + "data/getDatasetById.json",
				   	data : { dataset_id : id },
				   	type : "POST",
				   	success : function(res){
				   		$("#loader").hide();
				   		// ㅌ
				   		console.log("=====getDatasetById=====", res);
						if(res.result.code == "200"){
							that.root.data.media_type = res.result.data.media_type;
							that.root.data.label_type = res.result.data.label_type;
/* 							console.log("root.nodes : ", that.root.data.nodes); */
							console.log("이 데이터셋의 미디어 유형은 [", that.root.data.media_type, "] 입니다.");	
							console.log("이 데이터셋의 라벨링 유형은 [", that.root.data.label_type, "] 입니다.");	
						} else if(res.result.code == "2001"){
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}
				   	},
				   	error : function(err){
				   		$("#loader").hide();
				   		 console.log("ERROR!!", err);
				   	}
				});				
			},			
			
			selectLabel(id) {
				const root = this.root;
				
				console.log("selected Object : ", root.data.searchObj[id]);
				const map = this.mappingLabel(root.data.searchObj[id]);
				root.data.preView.drawCanvas(map)
			},
			updateLabelName(id, labelName){
				const root = this.root;
				root.data.searchObj[id].label = labelName;
				root.data.preView.updateLabeling(id, labelName);
			},
			/* mappingLabel(obj) {
				const root = this.root;
					// 기존에 존재하던 소스, if문만 없애면 됨
					const inf = obj.info.split(",");
					console.log("inf::",inf);
					const fillColor = colorHash.rgb(obj.label);
					const labelMap = {
						angle : 0,
						fill: "rgba("+fillColor[0]+","+fillColor[1]+","+fillColor[2]+",0.5)",
						id: obj.meta_id,
						label: obj.label,
						left: inf[0],
						top: inf[1],
						width: inf[2],
						height: inf[3],
					} 
					// 여기까지
				
				///////////////// rescale repeat
// 				const canvas_max_width = 596;
// 				const canvas_max_height = 447;
				
// 				if(w != null && h != null){
// 					canvas_max_width = w;
// 					canvas_max_height = h;        		
// 				}
					
// 				// canvas 최대 너비와 높이에 맞춰 원본 이미지 비율대로 이미지 크기 설정
// 				let scaleFactor=0;
// 				if(canvas_max_height/canvas_max_width >= img.naturalHeight/img.naturalWidth  ){
// 					scaleFactor=canvas_max_width/img.naturalWidth;
// 				}else{
// 					scaleFactor=canvas_max_height/img.naturalHeight;
// 				}				
				
				
				if(obj.segmentation != null){
					const temp = obj.segmentation.replace(/[\[\]\{ ]/gi, "");
					const strPoints = temp.split("},");
					const points = [];
					//console.log("scf::??", scf); 
					for(let j=0; j<strPoints.length; j++){
						let x, y, t;
						const p = strPoints[j].replace(/\}/, "").split(",");
						x = eval(p[0].split(":")[1]);
						y = eval(p[1].split(":")[1]);
						
						t = { x, y };
						console.log(t);
						points.push(t);
					}
					labelMap["points"] = points;
				}; 
			
			
				console.log("inf :: ", inf);
				console.log("obj :: ", obj);
				
				let map = {
					labelMap,
					dataset_id : root.data.nodes.id,
					data_id : obj.data_id,
					img : null,
					imgSrc : obj.path,
					imgInfo : {
						height: 0,
						scaleFactor: 1,
						width: 0,
					},
				};
				
				return map;
			}, */
			// 수정됨
			mappingLabel(obj) {
 				const root = this.root;
 				console.log("obj::",obj);
 				let labelMap = {};
 				if(obj.label_type == "IMAGE_BBOX") {
 					/* console.log("box!"); */
 					// 기존에 존재하던 소스, if문만 없애면 됨
 					console.log("obj::")
 					const inf = obj.info.split(",");
 					/* console.log("inf::",inf); */
 					const fillColor = colorHash.rgb(obj.label);
 					labelMap = {
 						angle : 0,
 						fill: "rgba("+fillColor[0]+","+fillColor[1]+","+fillColor[2]+",0.5)",
 						id: obj.meta_id,
 						label: obj.label,
 						left: inf[0],
 						top: inf[1],
 						width: inf[2],
 						height: inf[3],
 					};
 					if(labelMap["points"] != "undefined") {
 						labelMap["points"] = undefined;
 					}
 					console.log("box labelMap : ", labelMap);
 					// 여기까지
 				} else if(obj.label_type == "IMAGE_SEGMENTATION") {
 					/* console.log("seg!"); */
 					const infoParser = JSON.parse(obj.info);
 					const info_box = infoParser.box.split(",");
 					const segmetation_fillColor = colorHash.rgb(obj.label);
 					const info_segmentation = infoParser.segmentation.replace(/[\[\]\{ ]/gi, "");
 					const strPoints = info_segmentation.split("},");
 					const points = [];
 					labelMap = {
 							angle : 0,
 							fill: "rgba("+segmetation_fillColor[0]+","+segmetation_fillColor[1]+","+segmetation_fillColor[2]+",0.5)",
 							id: obj.meta_id,
 							label: obj.label,
 							left: info_box[0],
 							top: info_box[1],
 							width: info_box[2],
 							height: info_box[3],
 						};
 					
 					for(let j=0; j<strPoints.length; j++){
 						let x, y, t;
 						const p = strPoints[j].replace(/\}/, "").split(",");
 						x = eval(p[0].split(":")[1]);
 						y = eval(p[1].split(":")[1]);
 						t = { x, y };
 						/* console.log(t); */
 						points.push(t);
 					}
 					labelMap["points"] = points;
 					/* console.log("labelMap::",labelMap); */
 				} 
 				
 				///////////////// rescale repeat
// 				const canvas_max_width = 596;
// 				const canvas_max_height = 447;
 				
// 				if(w != null && h != null){
// 					canvas_max_width = w;
// 					canvas_max_height = h;        		
// 				}
 					
// 				// canvas 최대 너비와 높이에 맞춰 원본 이미지 비율대로 이미지 크기 설정
// 				let scaleFactor=0;
// 				if(canvas_max_height/canvas_max_width >= img.naturalHeight/img.naturalWidth  ){
// 					scaleFactor=canvas_max_width/img.naturalWidth;
// 				}else{
// 					scaleFactor=canvas_max_height/img.naturalHeight;
// 				}				

/*  				console.log("inf :: ", inf);
 				console.log("obj :: ", obj); */
 				
 				let map = {
 					labelMap,
 					dataset_id : root.data.nodes.id,
 					data_id : obj.data_id,
 					img : null,
 					imgSrc : obj.path,
 					imgInfo : {
 						height: 0,
 						scaleFactor: 1,
 						width: 0,
 					},
 				};
 				
 				return map;
 			},
			//폴리곤
/* 			convertPoint(id){
				const root = this.root;
				const points = root.data.modifiedObj[id].labelMap.points;
				const sObj = root.data.searchObj[id];
				let segmentation = "[";
				for(let k=0; k<points.length; k++){
					if(k==0){
						segmentation += "{x: "+points[k].x+", y: "+points[k].y+"}";									
					} else {
						segmentation += ",{x: "+points[k].x+", y: "+points[k].y+"}";
					}
				}
				segmentation += "]";
				
				sObj.segmentation = segmentation;
			},
			
			ObjectEvent(canv, id) {
				const root = this.root;
				const mObj = root.data.modifiedObj[id];
				console.log("mObj::",mObj);
				const l = mObj.labelMap.left/mObj.imgInfo.scaleFactor;
				const t = mObj.labelMap.top/mObj.imgInfo.scaleFactor;
				const w = mObj.labelMap.width/mObj.imgInfo.scaleFactor;
				const h = mObj.labelMap.height/mObj.imgInfo.scaleFactor;
				const sObj = root.data.searchObj[id];
				sObj.info = l+","+t+","+w+","+h;
				if(mObj.labelMap.points){
					this.convertPoint(id);
				}
				
				root.data.groupView.computed.updateLabel(canv, mObj);
			}, */
			// 수정됨
			convertPoint(id){
				const root = this.root;
				const points = root.data.modifiedObj[id].labelMap.points;
				const sObj = root.data.searchObj[id];
				/* console.log("sObj : " , sObj); */
				let convert_info = new Object();
				convert_info.box = sObj.info;
				/* const scaleFactor = sObj.imgInfo.scaleFactor; */

				let segmentation = "[";
				for(let k=0; k<points.length; k++){
					if(k==0){
						segmentation += "{x: "+points[k].x+", y: "+points[k].y+"}";									
					} else {
						segmentation += ",{x: "+points[k].x+", y: "+points[k].y+"}";
					}
/* 					if(k==0){
						segmentation += "{x: "+points[k].x/scaleFactor+", y: "+points[k].y/scaleFactor+"}";									
					} else {
						segmentation += ",{x: "+points[k].x/scaleFactor+", y: "+points[k].y/scaleFactor+"}";
					} */
				}
				segmentation += "]";
				convert_info.segmentation = segmentation;
				
				let jsonInfo = JSON.stringify(convert_info);
				sObj.info = jsonInfo;
			},
			
			ObjectEvent(canv, id) {
				const root = this.root;
				const mObj = root.data.modifiedObj[id];
				/* console.log("mObj::",mObj); */
				const l = mObj.labelMap.left/mObj.imgInfo.scaleFactor;
				const t = mObj.labelMap.top/mObj.imgInfo.scaleFactor;
				const w = mObj.labelMap.width/mObj.imgInfo.scaleFactor;
				const h = mObj.labelMap.height/mObj.imgInfo.scaleFactor;
				const sObj = root.data.searchObj[id];
				sObj.info = l+","+t+","+w+","+h;
				if(mObj.labelMap.points){
					this.convertPoint(id);
				}
				
				root.data.groupView.computed.updateLabel(canv, mObj);
			},
			
			submitMeta() {
				const that = this;
				
				$("#loader").show();
				const ajaxData = {
					data_id : 2,
					stay_flag : 2,
					info : [],
				}
				
				const mObj = this.root.data.modifiedObj;
				const keys = Object.keys(mObj);
				for(let i=0, len=keys.length; i<len; i++){
					const labelMap = mObj[keys[i]].labelMap;
					
					const box_width = labelMap.width;
					const box_height = labelMap.height;
					const left = labelMap.left;
					const top = labelMap.top;
					const label = that.root.pt.find("canvas#"+labelMap.id).parents(".box_contain").find("input").val();
					const meta_id = labelMap.id;
					const scaleFactor = mObj[keys[i]].imgInfo.scaleFactor;
					
					//폴리곤일때
					if(labelMap.points){
						const points = labelMap.points;
						let segmentation = "[";
						for(let k=0; k<points.length; k++){
/* 							if(k==0){
								segmentation += "{x: "+points[k].x+", y: "+points[k].y+"}";									
							} else {
								segmentation += ",{x: "+points[k].x+", y: "+points[k].y+"}";
							} */
							if(k==0){
								segmentation += "{x: "+points[k].x/scaleFactor+", y: "+points[k].y/scaleFactor+"}";									
							} else {
								segmentation += ",{x: "+points[k].x/scaleFactor+", y: "+points[k].y/scaleFactor+"}";
							}
						}
						segmentation += "]";
							
						/* console.log("labelMap scale Seg::"+ segmentation); */
						
						ajaxData.info.push({
							segmentation,
							data_id : mObj[keys[i]].data_id+"",
							width:box_width/scaleFactor+"",
							height:box_height/scaleFactor+"",
							left:left/scaleFactor+"",
							top:top/scaleFactor+"",
							label:label+"",
							label_type : that.root.data.label_type+"",
							meta_id : meta_id,
						});
						
						continue;
					}
						
					ajaxData.info.push({
						data_id : mObj[keys[i]].data_id+"",
						width:box_width/scaleFactor+"",
						height:box_height/scaleFactor+"",
						left:left/scaleFactor+"",
						top:top/scaleFactor+"",
						label:label+"",
						label_type : that.root.data.label_type+"",
						meta_id : meta_id,
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

						//j.park 초기화 추가 및 화면 프레시 제거
						console.log("====updateMeta====", res);						
						$("#loader").hide();
						if(res.result.code == "200"){
							alert("저장이 완료되었습니다");
							that.root.data.modifiedObj = {};
// 							that.root.init(that.root.data.nodes);							
						} else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
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
		},
		render : {
			
		},
		reset() {
			const that = this;
			
			$(document).off();
			that.pt.find(".label .tag-wrap .content").empty();
			that.pt.find(".label .frame-wrap .label-container").empty();
			
			that.pt.find(".enrichment #frame-container").empty();
			that.pt.find(".enrichment #frame-container").append("<canvas id='p' width='800px' height='600px' />");
		},
	}

	//////////// instance ///////////////
	function preView(parent){
		preView.prototype.parent = null;
		preView.prototype.pt = null;
		preView.prototype.drawCanvas = (lObj) => {
			this.render.drawImg(lObj);
		}
		preView.prototype.updateLabeling = (id, labelName) => {
			this.bind.objLabeling(id, labelName);
		}
		preView.prototype.data = {
			canvas : null,
			lObj : null,
		}
		preView.prototype.init = (parent) => {
			const that = this;
			that.parent = parent;
			that.pt = parent.pt.find("section.enrichment");
			that.data.canvas = that.parent.data.canvas = window._canvas = new fabric.Canvas('p', {
				perPixelTargetFind : true,
			});
		}
		preView.prototype.bind = {
			canvasListener : () => {
				this.bind.objMoving();
				this.bind.objScaling();
				this.bind.objModified();
				this.bind.downEvt();
				this.bind.moveEvt();
				this.bind.upEvt();
				this.bind.wheelEvt();
			},
			downEvt : () => {
				const that = this;
				const canvas = that.data.canvas;
				canvas.on("mouse:down", function(evt){
					/* console.log("mouse:down", evt); */
					const evte = evt.e;
					
					//wheel break;
					that.bind.chkClick = true;

					//canvas shortcut
					if (evte.altKey === true) {
						if(canvas.getActiveObject()){
							canvas.getActiveObject().lockMovementX = true;
							canvas.getActiveObject().lockMovementY = true;
							canvas.getActiveObject().lockScalingX = true;
							canvas.getActiveObject().lockScalingY = true;
						}
					
						//movement
						this.isDragging = true;
						this.selection = false;
						return;
					}
				});

			},
			moveEvt : () => {
				const that = this;
				const canvas = that.data.canvas;
				canvas.on("mouse:move",function(evt){
					if (this.isDragging) {
						const units = 10;
						const zoom = canvas.getZoom();

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
						const delta = new fabric.Point(evt.e.movementX, evt.e.movementY);
						canvas.relativePan(delta);
					}
				});
			},
			upEvt : () => {
				const that = this;
				const canvas = that.data.canvas;
				const gObj = that.data.gObj;
				canvas.on("mouse:up",function(evt){
					//wheel break;
					that.bind.chkClick = false;
					
					//canvas movement
					if (this.isDragging) {
						if(canvas.getActiveObject()){
							canvas.getActiveObject().lockMovementX = false;
							canvas.getActiveObject().lockMovementY = false;
							canvas.getActiveObject().lockScalingX = false;
							canvas.getActiveObject().lockScalingY = false;
						}
						
						this.isDragging = false;
						this.selection = true;
						return;
					}
					//

				});
			},
			wheelEvt : () => {
				const that = this;
				const canvas = that.data.canvas;
				canvas.on("mouse:wheel",function(evt){
					console.log("mouse:wheel", evt);
					
					//클릭 이벤트가 없을경우만 실행
					if(!that.bind.chkClick){
						const delta = evt.e.deltaY;
						const pointer = canvas.getPointer(evt.e);
						let zoom = canvas.getZoom();
						zoom = zoom + delta/200;
						
						// jh.sa : zoom 확대 시에 polygon point 크기가 커지던 문제 수정
						let allPoints = canvas.getObjects("point");
						$.each(allPoints, function(i, obj){
							if (zoom > 10) zoom = 10;
							if (zoom < 0.8) zoom = 0.8;							
							obj.set({
								scaleX: 1/zoom,
								scaleY: 1/zoom
							});
						});						
						
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
			
			
			objLabeling : (id, labelName) => {
				const fillColor = colorHash.rgb(labelName);
				const fill = "rgba("+fillColor[0]+","+fillColor[1]+","+fillColor[2]+",0.5)";
				
				this.data.lObj.labelMap.label = labelName;
				this.data.lObj.labelMap.fill = fill;
				this.parent.data.modifiedObj[id] = this.data.lObj;
			},
			objMoving : () => {
				const that = this;
				const canvas = that.data.canvas;
				canvas.on("object:moving",function(evt){
					/* console.log("object:moving"); */
					if(canvas.getActiveObject()==null){
						return;
					}
					
					let canv;
					const newRect = that.data.lObj.labelMap;
					if(canvas.getActiveObject().type == "point"){
						const p = evt.target;

						//객체 위치 업데이트
						newRect.points[p.name] = {x: p.getCenterPoint().x, y: p.getCenterPoint().y};
			    			
						const polygon = that.render.upsertPolygon(newRect.id, newRect.points);
			    		that.computed.resetPolyPosition(polygon, newRect);
			    		
			    		canv = document.getElementById(evt.target.parent_obj_id);
			    		that.parent.data.modifiedObj[evt.target.parent_obj_id] = that.data.lObj;
					} else {
						const newRect = that.data.lObj.labelMap;
						newRect.width = evt.target.getScaledWidth();
						newRect.left = evt.target.left;
						newRect.height = evt.target.getScaledHeight();
						newRect.top = evt.target.top;
					
						//
						if (newRect.left+newRect.width > canvas.getWidth()){
							newRect.left = canvas.getWidth() - newRect.width;
						}
						
						if (newRect.top+newRect.height > canvas.getHeight()){
							newRect.top = canvas.getHeight() - newRect.height;
						}
						
						if(newRect.width > canvas.getWidth()){
							newRect.width = canvas.getWidth();
						}
						
						if(newRect.height > canvas.getHeight()){
							newRect.height = canvas.getHeight();
						}
						if(newRect.left < 0){
							newRect.left = 0;
						}
						if(newRect.top < 0){
							newRect.top = 0;
						}
						
						evt.target.left = newRect.left;
						evt.target.top = newRect.top;
						
						canv = document.getElementById(evt.target.id);
						that.parent.data.modifiedObj[evt.target.id] = that.data.lObj;
						
						
						
					}
					that.parent.computed.ObjectEvent(canv, newRect.id);
				});
			},
			objScaling : () => {
				const that = this;
				const canvas = that.data.canvas;
				canvas.on("object:scaling",function(evt){
					/* console.log("object:scaling"); */
					const uuid = evt.target.id;
					const newRect = that.data.lObj.labelMap;
					newRect.width = evt.target.getScaledWidth();
					newRect.left = evt.target.left;
					newRect.height = evt.target.getScaledHeight();
					newRect.top = evt.target.top;

					if(newRect.left < 0){
						newRect.left = 0;
						evt.target.left = newRect.left;
					}
					if(newRect.top < 0){
						newRect.top = 0;
						evt.target.top = newRect.top;
					}
					if (newRect.left+newRect.width > canvas.getWidth()){
						newRect.width = canvas.getWidth() - newRect.left;
						evt.target.scaleX = newRect.width / evt.target.width;
					}
					
					if (newRect.top+newRect.height > canvas.getHeight()){
						newRect.height =  canvas.getHeight() - newRect.top;
						evt.target.scaleY = newRect.height / evt.target.height;
					}
					
					console.log("scale :: ", evt.target);
					canv = document.getElementById(evt.target.id);
					that.parent.data.modifiedObj[evt.target.id] = that.data.lObj;
					that.parent.computed.ObjectEvent(canv, newRect.id);
				});
			},
			objModified : () => {
				const that = this;
				const canvas = that.data.canvas;
				canvas.on("object:modified",function(evt){
					/* console.log("object:modified"); */
				});
			},
		}
		//참고
		preView.prototype.computed = {
			updateLabelMapInfo : () => {
				const lObj = this.data.lObj			
				const sc = lObj.imgInfo.scaleFactor;
				lObj.labelMap.left *= sc;
				lObj.labelMap.top *= sc;
				lObj.labelMap.width *= sc;
				lObj.labelMap.height *= sc;
				
				console.log(this.data.lObj);
			},
			
			resetPolyPosition : (polygon, labelMap) => {
				const that = this;
				labelMap.left = polygon.aCoords.tl.x;
				labelMap.top = polygon.aCoords.tl.y;
				labelMap.width = polygon.aCoords.br.x - polygon.aCoords.tl.x;
				labelMap.height = polygon.aCoords.br.y - polygon.aCoords.tl.y;
			},
			
			//
			rescale : (img,w,h) => {
				const that = this;
				const canvas_max_width = 596;
				const canvas_max_height = 447;
				
				if(w != null && h != null){
					canvas_max_width = w;
					canvas_max_height = h;        		
				}
				let scaleFactor=0;
				if(canvas_max_height/canvas_max_width >= img.naturalHeight/img.naturalWidth  ){
					scaleFactor=canvas_max_width/img.naturalWidth;
				}else{
					scaleFactor=canvas_max_height/img.naturalHeight;
				}
				
				let imgInfo = that.data.lObj.imgInfo;
				imgInfo.scaleFactor = scaleFactor;
				imgInfo.width = img.naturalWidth;
				imgInfo.height = img.naturalHeight;
				
// 				console.log(that.data.lObj);
// 				console.log(imgInfo);
				
				let pppoint = that.data.lObj.labelMap.points;
				console.log(typeof(pppoint));
				console.log(pppoint);
				if(typeof(pppoint) != "undefined"){
					for(let i = 0; i < pppoint.length; i++){
						pppoint[i].x = pppoint[i].x*scaleFactor;
						pppoint[i].y = pppoint[i].y*scaleFactor;
					}					
				}

				
				that.data.canvas.setWidth(img.naturalWidth*scaleFactor);
				that.data.canvas.setHeight(img.naturalHeight*scaleFactor);
				that.data.canvas.calcOffset();
				that.data.canvas.renderAll();
// 				that.root.pt.find("section.labelList #frame-container").height(img.naturalHeight*scaleFactor);
				
			},
		}
		preView.prototype.render = {
			drawImg : (lObj) => {
				const that = this;
				that.data.lObj = lObj;
				
				const canv = that.data.canvas;
				canv.clear();
				$("#loader").show();
				lObj.img = new Image();
				lObj.img.src = "/uploadFile/xlabeller/"+lObj.imgSrc+"";
				lObj.img.onload = function() {
					$("#loader").hide();
					console.log("this",this);
					that.computed.rescale(this);
					scf = this;
					canv.setBackgroundImage(lObj.img.src, canv.renderAll.bind(canv), {
						scaleX: lObj.imgInfo.scaleFactor,
						scaleY: lObj.imgInfo.scaleFactor
			    	});
					
					that.computed.updateLabelMapInfo();
					that.render.addLabel();
					that.bind.canvasListener();
				}
				lObj.img.onerror = function(){
					$("#loader").hide();
					alert("이미지 파일이 아닙니다");
				}
				fabric.Object.prototype.set({
					transparentCorners: false,
					cornerColor: 'rgba(102,153,255,0.5)',
					cornerSize: 12,
					hasRotatingPoint: false,
					padding: 5
				});
				canv.viewportTransform = [1,0,0,1,0,0];
				canv.renderAll();
			},
			addLabel : () => {
				const labelMap = this.data.lObj.labelMap;
				const canv = this.data.canvas;
				
				if(labelMap.points) {
					this.render.createPoints(labelMap.id, labelMap.points, labelMap.fill);		// jh.sa polygon fill
				}else {
					const rect = new fabric.Rect(labelMap);
					canv.add(rect);
				}
			},
			createPoints : (uuid, points, label_fill) => {
				const that = this;
				const canvas = that.data.canvas;		
				
				for(let i=0; i<points.length; i++){
					const circle = new fabric.Circle({
						type : "point",
						radius: 3,
						fill: 'green',
						left: points[i].x,
						top: points[i].y,
						originX: 'center',
						originY: 'center',
						// hasBorders: false,
						objectCaching: false,
						hasControls: false,
						selectable: true,
						name: i,
						parent_obj_id : uuid,
						ignoreZoom: true
					});
					canvas.add(circle);
					console.log("circle: ", circle);
				}
				that.render.upsertPolygon(uuid, points, label_fill);		// jh.sa polygon fill
			},
			upsertPolygon : (uuid, points, label_fill) => {
				const that = this;
				const canvas = that.data.canvas;
				
				canvas.getObjects().forEach(function(o) {
					if(typeof o.id != "undefined" && o.id === uuid) {
			            canvas.remove(o);
			        }
				});
				const clonedPoints = points.map(function(o){
				    return fabric.util.object.clone(o);
				});
				let fill = 'rgba(33,138,255,0.5)'
				if(label_fill){
					fill = label_fill;							// jh.sa polygon fill
				}
				const polygon = new fabric.Polygon(clonedPoints, {
				    fill: fill,
				    selectable: false,
				    hasControls: false,
				    objectCaching: false,
				    // hasBorders: false,
					lockMovementX: true,
					lockMovementY: true,
				    id:uuid
				});
				canvas.add(polygon);
				return polygon;
			},
		}
		preView.prototype.init(parent);
	}
	
	
	
	
	
	
	function groupView(parent, dataset_id){
		groupView.prototype.parent = null;
		groupView.prototype.pt = null;
		groupView.prototype.data = {
			scroll : {
				scroll_index:0,
				scroll_size:0,
					
				scroll_start:0,
				scroll_end:0,
					
				isScroll_top:0,
				isScroll_end:0,
				isScroll : false,
				default_size : 40,
				half_size : (40 / 2)

			}
			,search_arr : []
			,filter_arr : []
			,label_group : {}
		}
		groupView.prototype.init = (parent, dataset_id) => {
			const that = this;
			that.parent = parent;
			that.pt = parent.pt.find("section.label");
			that.computed.loadLabelData(dataset_id);
			
			
		}
		groupView.prototype.bind = {
			evtInit: () => {

			},
			inputListener : () => {
				const that = this;
				const canvas = that.parent.data.canvas;
				this.pt.find(".box_contain input").off("focus").on("focus", function(e){
					//tag 자동완성
					if(!$(this).parent().prev().hasClass("on")){
						$(this).parent().prev().trigger("click");
					}
					
					$(".findTag").remove();
					const html = "<div class='findTag'><ul></ul></div>";
					$(this).parent().append(html);
					that.data.isTagAppend = true;
					
					const nodes = that.parent.data.nodes;
					const tagset = that.computed.getDatasetAllLabelGroup(nodes.id);
					that.computed.setDatasetAllLabelGroup(tagset);
					
					//자동완성 닫기
					that.parent.pt.on("mousedown", that.computed.removeFindTag);
					
					return false;
				});
				this.pt.find(".box_contain input").off("input").on("input", function(e){
					//메타정보 변경
					const id = $(this).parents(".box_contain").data().id.split(",")[0];
					const fillColor = colorHash.rgb(this.value);
					const fill = "rgba("+fillColor[0]+","+fillColor[1]+","+fillColor[2]+",0.5)";
					canvas.getObjects().forEach(function(o) {
						if(o.id === id) {
							o.set("fill",fill);
						}
					});
					
					canvas.renderAll();
					$(".findTag").remove();
				});
				this.pt.find(".box_contain input").off("blur").on("blur",function(){
					//preview, tag 반영
					const data = $(this).parents(".box_contain").data();
					const id = data.id.split(",")[0];
					that.parent.computed.updateLabelName(id, this.value)
					that.computed.groupLabel();
					that.render.drawLabelGroup();
					
				});
				
				$(".label-container .label_wrap input").off("input").on("input",function(e){
					//영문, 숫자, 특수문자
					if($(this).val().match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
						alert("영문과 특수문자 및 숫자만 입력 가능합니다");
					}					
					var str = $(this).val().replace(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/gi,"");					
// 					let str = $(this).val();
					if(str.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
							$(this).val(str.slice(0, -1));						
					} else {
							$(this).val(str);						
					}
					// 텍스트 길이 제한 
					console.log($(this).val());
					if($(this).data("length") == 250 && $(this).val().length > 250){
						var string = $(this).val();
						alert("입력 가능한 텍스트 개수를 초과하였습니다\n중간에 입력하신 경우 기존 텍스트의 마지막 글자를 삭제합니다");
						$(this).val(string.slice(0,250));
						return false;							
					} 					
					return;		
				});
				
			
			},
			
			inputHover: () => {
				let that = this;
				
				$(".label-container .label_wrap").off("mouseenter").on("mouseenter", function(){
					let label_title = $(this).children("input");
					let text = label_title.val();
					label_title.empty();
					label_title.append(text);
					that.parent.bind.addHoverBox($(this), text);					
				});
				
				$(".label-container .label_wrap").off("mouseleave").on("mouseleave", function(){
					that.parent.bind.removeHoverBox($(this));
				});					
			},
			
			selectLabelListener : () => {
				let that = this;	
				this.pt.find(".box_contain .box").off("click").on("click",function(){
					//label box 선택
					const data = $(this).parent().data();
					const id = data.id.split(",")[0];

					that.pt.find(".box_contain .box").removeClass("on");
					$(this).addClass("on");
					that.parent.computed.selectLabel(id);
					
					console.log("선택된 레이블 : ", id);
					
					that.parent.pt.find(".enrichment #frame-container .canvas-container").show();
					that.parent.pt.find(".enrichment #frame-container .empty_wrap").remove();
				});
			},
			scrollListener : () => {
				let that = this;	
				this.pt.find(".frame-wrap").off("scroll").on("scroll",function(){
					
					let scroll_info = that.data.scroll;
					let search_arr = that.data.filter_arr;
					let target = $(this);
					let st = target.scrollTop();
					let box_size = that.pt.find(".box_contain").length;
					
					
					
					
					if(st + target.innerHeight() >= target[0].scrollHeight && !scroll_info.isScroll && !scroll_info.isScroll_end){
						
						scroll_info.isScroll = true;
						
						var diff = 0;
						if(scroll_info.scroll_end + scroll_info.half_size >= search_arr.length){
							diff = search_arr.length - scroll_info.scroll_end;
							scroll_info.scroll_end = search_arr.length;
							scroll_info.scroll_start = scroll_info.scroll_start + diff;
							scroll_info.isScroll_end = true;
							
						}else{
							diff = scroll_info.half_size;
							scroll_info.scroll_end = scroll_info.scroll_end + diff;
							scroll_info.scroll_start = scroll_info.scroll_start + diff;
						}
						var end = scroll_info.scroll_end;
						var start = end - diff;
						
						that.render.addList("down",start,end);
						that.render.removeBox(diff,"down");	
						scroll_info.isScroll_top = false;
							
					}else if(st == 0 && !scroll_info.isScroll && !scroll_info.isScroll_top){
						
						scroll_info.isScroll = true;					
						
						var diff = 0;
						if(scroll_info.scroll_start - scroll_info.half_size <= 0){						
							diff = scroll_info.scroll_start;
							scroll_info.scroll_start = 0;
							scroll_info.scroll_end = scroll_info.scroll_end - diff;
							scroll_info.isScroll_top = true;
							
						}else{
							diff = scroll_info.half_size;
							scroll_info.scroll_end = scroll_info.scroll_end - diff;
							scroll_info.scroll_start = scroll_info.scroll_start - diff;
						}
						var start = scroll_info.scroll_start;
						var end = start + diff;
						
						console.log(start, end);
						console.log(diff);
						that.render.addList("up",start,end);
						that.render.removeBox(diff,"up");	
						scroll_info.isScroll_end = false;
						
					}
				});
			},
			
			
			
			//
			labelGroupListener : () => {
				let that = this;
				that.pt.find(".tag-box").off("click").on("click",function(){
					$(this).toggleClass("selected");
					
					const ids = that.pt.find(".tag-box.selected").text();
					const id_arr = ids.replace(/\s/gi,"").split("#").slice(1,);
					that.computed.selectGroupLabel(id_arr);
					that.render.resetBox();
					that.render.drawLabelData();
				});
				
				that.pt.find(".tag-box").off("mouseenter").on("mouseenter",function(){
					let text = $(this)[0].innerText;
					$(this).empty();
					$(this).append(text);
					that.parent.bind.addHoverBox($(this), $(this)[0].innerText.slice(1));
				});				
				
				that.pt.find(".tag-box").off("mouseleave").on("mouseleave", function(){
					that.parent.bind.removeHoverBox($(this));
				});					
			},
		}
		groupView.prototype.computed = {
			// 메타정보가져와서 그리기
			loadLabelData : (dataset_id) => {
				const ajaxData = {
					'dataset_id' : dataset_id
				};
				this.computed.resetScroll();
				this.computed.resetData();
				this.computed.getLabelDataByDatasetId(ajaxData,this.render.initDraw);
			},
			
			getLabelDataByDatasetId : (ajaxData,callback) =>{
				let that = this;
				$("#loader").show();
				return $.ajax({
					url : baseUrl + "data/getSearchVisionList.json",
					data : ajaxData,
					type : "POST",
					success : function(res) {
						$("#loader").hide();
						console.log("=====getSearchVisionList=====", res);
						if (res.result.code == "200") {
							if(res.result.data.length == 0){
								alert("사용 가능한 데이터가 없습니다");
								labeller.event.openNode();								
							} else {
								that.data.search_arr = res.result.data;
								that.computed.mappingSearchArr();
								that.computed.groupLabel();
								callback();	
								// jh.sa 201019
// 								var result = res.result.data;
// 								that.initMetaFromData(result);
							}
						} else if(res.result.code == "2001"){
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}
					},
					error : function(err) {
						console.log("ERROR!!", err);
					}
				});
			},
			
			mappingSearchArr : () => {
				const sArr = this.data.search_arr;
				console.log("sARr??:: ", sArr);
				let sObj = {};
				for(let i=0, len=sArr.length; i<len; i++){
					sObj[sArr[i].meta_id] = sArr[i];
				}
				this.parent.data.searchObj = sObj;
			},
			
			//그룹 태그 생성
			groupLabel : () => {
				let data = this.data.search_arr;
				this.data.filter_arr = this.data.search_arr;
				let label_group = this.data.label_group = {};
				for(var i = 0 ; i < data.length ; i++){
					var label = data[i].label;
					if(typeof label_group[label] != "object"){
						label_group[label] = [];
					}
					label_group[label].push(data[i]);
				}			
			},
			
			//태그선택
			selectGroupLabel : (id_arr) => {
				console.log(id_arr);
				let filter_arr = this.data.filter_arr = [];
				let label_group = this.data.label_group;
				if(id_arr.length>0){
					for(var i = 0 ; i < id_arr.length;i++){
						var temp = label_group[id_arr[i]];
						for(var j = 0 ; j < temp.length ;j++){
							filter_arr.push(temp[j]);	
						}
					}
				} else {
					const keys = Object.keys(label_group);
					for(var i=0; i<keys.length; i++){
						var temp = label_group[keys[i]];
						for(var j = 0 ; j < temp.length ;j++){
							filter_arr.push(temp[j]);	
						}
					}
				}
			},
			
			getDatasetAllLabelGroup : (id) => {
				const tagset = [];
				$.ajax({
					url :  baseUrl + "data/getLabelGroup.json",
					data : {dataset_id : id},
					type : "POST",
					async: false,
					success : function(res){
						console.log("=====getLabelGroup=====", res);
						if(res.result.code == 200){
							const data = res.result.data
							for(let i=0, len=data.length; i<len; i++){
								tagset.push(data[i].label);
							}
						} else if(res.result.code == "2001"){
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data)
						}
					},
					error : function(err){
						alert(err);
						console.log("ERROR!!", err);
					}
				});
				
				return tagset
			},
			//태그 자동완성 리스트
			setDatasetAllLabelGroup: (tagset) => {
				const that = this;
// 				const gObj = that.data.gObj;
				const canvas = that.parent.data.canvas;
				
				if(tagset.length<=0){
					$(".findTag").remove();
					return;
				}
				let html="";
				for(let i=0, len=tagset.length; i<len; i++){
					html +="<li> #"+tagset[i]+"</li>";
				}
				$(".findTag ul").append(html);
				
				$(".findTag li").off("click").on("click", function(){
					//label meta 정보 변경
					const tag = $(this).text().split("#")[1];
					const fillColor = colorHash.rgb(tag);
					const label = $(this).parents(".findTag").prev();
					label.val(tag);
					const id = label.parents(".box_contain").data().id.split(",")[0];
					
					const fill = "rgba("+fillColor[0]+","+fillColor[1]+","+fillColor[2]+",0.5)";
					canvas.getObjects().forEach(function(o) {
						if(o.id === id) {
							o.set("fill",fill);
						}
					});
					
					canvas.renderAll();
					label.trigger("blur");
					$(".findTag").remove();
				});
			},
			removeFindTag : (e) => {
				console.log(e);
				if($(e.target).parents(".findTag").length>0){
					
				}else{
					$(".findTag").remove();
				}
				
				this.parent.pt.off("mousedown", this.computed.removeFindTag);
			},
			
			resetData : () =>{
				this.data.label_group = {};
				this.data.search_arr = [];
				this.data.filter_arr = [];
			},
			
			resetScroll : () => {
				let scroll_info = this.data.scroll;	
				scroll_info.isScroll_top = false;
				scroll_info.isScroll_end = false;
				scroll_info.scroll_index = 0;
				scroll_info.scroll_size = scroll_info.default_size;
				scroll_info.isScroll = false;
			},
			
			updateLabel : (canv, lObj) => {
				const label = lObj.labelMap;
				const img = lObj.img;
				const scaleFactor = lObj.imgInfo.scaleFactor;

				const context = canv.getContext('2d');		
				const w = label.width/scaleFactor;
				const h = label.height/scaleFactor;
				
				let dw = 0;
				let dh = 0;
				
				const g_w = 105;
				const g_h = 80;
				
				const fw = w/g_w;
				const fh = h/g_h;
				
				if(fw >= fh){
					dw = w / fw;
					dh = h / fw;
				}else{
					dw = w / fh;
					dh = h / fh;
				}
				canv.width = dw;
				canv.height = dh;
				
				const left = label.left/scaleFactor;
				const top = label.top/scaleFactor;
				const width = label.width/scaleFactor;
				const height = label.height/scaleFactor;

				context.clearRect(0, 0, canv.width, canv.height);	
				context.drawImage(img,label.left/scaleFactor, label.top/scaleFactor, label.width/scaleFactor, label.height/scaleFactor, 0, 0,dw,dh);		      
				
// 				$(canv).parent().parent().find("input").val(label.label);	
			},
			crop : (canvas_hover,imgObj, xx, yy, ww, hh) => {
				let that = this;
				var ctx = canvas_hover.getContext("2d");			
//	 			hideLoading(".show_img");	    	
		    	var w = ww;
		    	var h = hh;
		    		
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
		    	canvas_hover.width = dw;
		    	canvas_hover.height = dh;

				ctx.clearRect(0, 0, canvas_hover.width, canvas_hover.height);
				ctx.drawImage(imgObj, xx, yy, ww, hh,0,0, dw,dh);
	        },
		}
		groupView.prototype.render = {
			initDraw : () => {
				//j.park 추가 스크롤 이슈로
				this.computed.resetScroll();
				
				
				this.render.drawLabelGroup(); 	//태그 그리기
				this.render.drawLabelData();	//label 그리기
			},
			drawLabelData : () => {
				let search_arr = this.data.filter_arr;
				let scroll_info = this.data.scroll;
				scroll_info.scroll_start = 0;
				scroll_info.scroll_end = (scroll_info.default_size < search_arr.length ) ? scroll_info.default_size : search_arr.length;
				this.render.addList("down",scroll_info.scroll_start,scroll_info.scroll_end);

			},
			
			resetBox : () => {
				this.pt.find(".box_contain").remove();					
			},
			
			removeBox : (size,type) => {
				
				if(size == 0){
					return;
				} else if(type == "down"){
					this.pt.find(".box_contain").slice(0,size).remove();					
				} else {		
					this.pt.find(".box_contain").slice(-size).remove();
				}
				this.pt.find(".frame-wrap").scrollTop((this.pt.find(".frame-wrap")[0].scrollHeight - this.pt.find(".frame-wrap").height()) / 2);
			},

			drawImageBox : () => {
				let that = this;
				this.pt.find(".box_contain .box").each(function(){
					let box = $(this);
					let cur_id = $(this).parent().data("id");
					let sp = cur_id.split(",");

					let imgObj = new Image();
					imgObj.src = "/uploadFile/xlabeller/" + sp[1]; 

					imgObj.onload = function(){
						var canvas_hover = document.createElement('canvas');
						canvas_hover.id = sp[0];
						box.find(".img").html(canvas_hover);
						that.computed.crop(canvas_hover,imgObj, sp[2], sp[3], sp[4], sp[5]);
					}
				});

			},
			
			drawLabelGroup : () => {
				let that = this;
				let html ="";
				let tag = this.data.label_group;
				let tagKeys = Object.keys(tag);
				
				let target = that.pt.find(".tag-wrap .content-wrap .content");
				$(target).html("");

				for(let i = 0, len = tagKeys.length; i<len;i++){
					html += "<div class='tag-box fl'>#"+tagKeys[i]+"</div>";
				}
				html += "<div class='clear'></div>";
				target.append(html.trim());
				
				that.bind.labelGroupListener();
			},
			
			
			addList : (type,start,end) => {
				const that = this;
				const target = that.pt.find(".label-container");
				
				const scroll_info = that.data.scroll;
				const search_arr = that.data.filter_arr;
				console.log(start,end);
				
				let html = "";
				for (let i = start ; i < end ; i++) {
					let data = search_arr[i];
					let info = "";
					if(data.label_type == "IMAGE_BBOX") {
						info = data.info;
					} else if(data.label_type == "IMAGE_SEGMENTATION") {
						let parseInfo = JSON.parse(data.info);
						info = parseInfo.box; 
						/* console.log("info :: ", info) */
					}
					let cur_id = data.meta_id +","+ data.path +","+ info +","+ data.label;
					html += " <div class='box_contain' data-id='"+cur_id+"'> ";
					html += "  <div class='box'>";
					html += " 	<div class='img'></div> ";
					html += "  </div>";
					html += "   <div class='label_wrap'>";
					html += "   <input type='text' data-length='250' value='"+data.label+"' onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>";
					html += "   </div>";
					html += " </div> ";
				}
				scroll_info.isScroll = false;
				
				if(type == "down"){
//	 				console.log("append");
					target.append(html);	
				} else {
//	 				console.log("prepend");
					target.prepend(html);
				}
				

				that.render.drawImageBox();
				that.bind.inputHover();
				that.bind.inputListener();
				that.bind.scrollListener();
				that.bind.selectLabelListener();
				
			}
		}
		groupView.prototype.init(parent, dataset_id);
	}

</script>
    
