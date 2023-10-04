<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
<style>
	#dataList2 { width: 100%; height: 100%; }
	#dataList2 .info_wrap { padding: 23px 30px 15px; border-bottom: 1px solid #e7e7e7; font-size: 12px; color: #343434; }
	#dataList2 .info_wrap .main_title { font-weight: 400; }
	#dataList2 .info_wrap .dataset_title { margin: 20px 0 8px 0; font-size: 20px; }
	#dataList2 .info_wrap .dataset_contents { color: #797a9c; }
	
/* 	테이블 */
	#dataList2 .list_wrap { height: calc(100% - 170px); margin: 22px 30px; font-size: 11px; }
	#dataList2 .list_wrap .list_title { margin-bottom: 22px; font-size: 14px; font-weight: 400; }
	#dataList2 .list_wrap .list_table { height:calc(100% - 126px); border-top: 2px solid #3a3b3d; }
	#dataList2 .list_wrap .list_table .h_wrap { font-weight: 400; height: 44px; background: #fafafa; border-bottom: 1px solid #e5e5e5; text-align: center; }
	#dataList2 .list_wrap .list_table .c_wrap { height: calc(100% - 90px); overflow-x: hidden; overflow-y: overlay; }
	#dataList2 .list_wrap .list_table .c_wrap li { height: 48px; border-bottom: 1px solid #e5e5e5; text-align: center; }
	#dataList2 .list_wrap .list_table .h_wrap div:nth-of-type(1),
	#dataList2 .list_wrap .list_table .c_wrap div:nth-of-type(1) { width: 46px; }
	#dataList2 .list_wrap .list_table .h_wrap div:nth-of-type(2),
	#dataList2 .list_wrap .list_table .c_wrap div:nth-of-type(2) { width: 100px; }
	#dataList2 .list_wrap .list_table .h_wrap div:nth-of-type(3),
	#dataList2 .list_wrap .list_table .c_wrap div:nth-of-type(3) { width: 100px; }
	#dataList2 .list_wrap .list_table .h_wrap div:nth-of-type(4),
	#dataList2 .list_wrap .list_table .c_wrap div:nth-of-type(4) { width: calc(100% - 174px); }
	#dataList2 .list_wrap .list_table .h_wrap div:nth-of-type(5),
	#dataList2 .list_wrap .list_table .c_wrap div:nth-of-type(5) { width: 130px; }
	#dataList2 .list_wrap .list_table .h_wrap div:nth-of-type(6),
	#dataList2 .list_wrap .list_table .c_wrap div:nth-of-type(6) { width: 200px; }		
	#dataList2 .list_wrap .list_table .c_wrap .preview .img_preview { cursor: pointer; border: 1px solid #979797; position: relative; margin: auto;  border-radius: 2px; background-size: 14px; width: 28px ; height: 28px; background-color: rgba(0, 0, 0, 0.1); background: url('images/icon-tree-image.png') no-repeat center; position: relative; }
	#dataList2 .list_wrap .list_table .c_wrap .preview .img_preview:hover { border: 1px solid #4c84ff;}
	
	#dataList2 .list_wrap .list_table .c_wrap .preview .img_preview .show_img_wrap { width: 294px; height: 248px; border-radius: 2px; box-shadow: 0 8px 14px -1px rgba(0, 0, 0, 0.16); border: solid 1px #dadada; background-color: #ffffff; }
	#dataList2 .list_wrap .list_table .c_wrap .preview .img_preview .title_wrap { width: 100%; height: 28px; border-bottom: 1px solid #dadada; }
	#dataList2 .list_wrap .list_table .c_wrap .preview .img_preview .title { overflow: hidden; white-space: nowrap; text-overflow: ellipsis; line-height: 28px; max-width: 254px; margin-right: 12px; margin-left: 4px; font-size: 12px; } 
	#dataList2 .list_wrap .list_table .c_wrap .preview .img_preview .frame_container { display: flex; width: 100%; height: 219px; align-items: center; justify-content: center; flex-direction: column; }
	
	
/* 	버튼 */
	#dataList2 .list_wrap .btn_wrap { width: calc(100% - 60px); height: 103px; position: absolute; bottom: 0; }
	#dataList2 .list_wrap .btn_wrap button { position: absolute; bottom: 41px; border-radius: 2px; text-align: center; padding: 0px; width: 68px; height: 28px; font-family: Open_Sans; font-size: 12px; font-weight: 300; }
	#dataList2 .list_wrap .btn_wrap .del_btn { position: absolute; left: 0; background-color: #f8f8f8; color: #343434; }
	#dataList2 .list_wrap .btn_wrap .copy_btn { position: absolute; right: 150px; background-color: #4c84ff; color: #ffffff; }
	#dataList2 .list_wrap .btn_wrap .copy_btn:hover { background-color: #3A71E9; }
	#dataList2 .list_wrap .btn_wrap .transfer_btn { position: absolute; right: 75px; background-color: #4c84ff; color: #ffffff; }
	#dataList2 .list_wrap .btn_wrap .transfer_btn:hover { background-color: #3A71E9; }
	#dataList2 .list_wrap .btn_wrap .add_btn { position: absolute; right: 0; background-color: #4c84ff; color: #ffffff; }
	#dataList2 .list_wrap .btn_wrap .add_btn:hover { background-color: #3A71E9; }
	
	#dataList2 .copy_wrap { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(255,255,255,0.9); z-index: 99999;  }
	#dataList2 .copy_wrap .wrap { width: 420px; height: 420px; margin: auto; border-radius: 2px; box-shadow: 0 4px 9px 0 rgba(0, 0, 0, 0.1); border: solid 1px #dadada; background-color: #ffffff; color: #616263; }
	#dataList2 .copy_wrap .list_wrap { margin: 0; width: 100%; height: auto; }
	#dataList2 .copy_wrap .list_wrap > div { line-height: 36px; font-weight: 400; padding: 0 15px; border-bottom: 1px solid #d8d8d8; }
	#dataList2 .copy_wrap .list_wrap > ul { height: 256px; overflow-y: overlay; border-bottom: 1px solid #d8d8d8; }
	#dataList2 .copy_wrap .list_wrap > ul > li {height: 36px; line-height: 36px; }
	#dataList2 .copy_wrap .list_wrap > ul > li:nth-of-type(odd) { background-color: #f8f8f8; }
	#dataList2 .copy_wrap .list_wrap > ul > li:hover { background-color: #e4f1ff; }
	#dataList2 .copy_wrap .list_wrap > ul > li .checkBox { margin-left: 17px }
	#dataList2 .copy_wrap .list_wrap > ul > li .img { margin: 0 8px; width: 24px; height: 24px; background: url('images/icon_tree_dataset_selected.png') center no-repeat; }
	#dataList2 .copy_wrap .list_wrap > ul > li .title { max-width: 330px; }
	#dataList2 .copy_wrap .select_wrap { margin: 20px 15px 0; }
	#dataList2 .copy_wrap.transfer .select_wrap { visibility: hidden; }
	#dataList2 .copy_wrap .btn_wrap { margin: 0 auto; width: 160px; height: auto; position: static; }
	#dataList2 .copy_wrap .btn_wrap button { margin: 20px 4px; width: 72px; height: 32px; border-radius: 2px; border: 1px solid #cbcbcb; position: static; }
	#dataList2 .copy_wrap input[type='radio'] { display: none; }
	#dataList2 .copy_wrap input[type='radio']+label { width: auto; padding-left:18px; margin-right: 18px; font-size: 13px; background: url('images/btn_radio_normal.png') left no-repeat; overflow: hidden; cursor: pointer; }
	#dataList2 .copy_wrap input[type='radio']:checked+label { background: url('images/btn_radio_selected.png') left no-repeat; }
	
	#dataList2 .f_wrap { width: auto; margin: 0 auto; z-index: 99; justify-content: center; }
</style>

</head>
<body>
	<div class="container" id="dataList2">
		<div class="info_wrap">
			<div class="main_title">데이터셋 정보</div>
			<div class="dataset_title"></div>
			<div class="dataset_contents"></div>
		</div>
		<div class="list_wrap">
			<div class="list_title">데이터 목록 (<span></span>)</div>
			<div class="list_table">
				<div class="h_wrap flex">
					<div class="checkBox all" ></div>
					<div class="preview">미리보기</div>
					<div class="id">ID</div>
					<div class="path">파일명</div>
					<div class="media_type">라벨 타입</div>
					<div class="created_date">생성시간</div>
				</div>
				<ul class="c_wrap">
				</ul>
				<div class="f_wrap flex">
					<div id="pagination" class="tui-pagination filter_color"></div>
				</div>				
			</div>
			<div class="btn_wrap">
				<button class="del_btn filter_color">삭제</button>
				<button class="copy_btn filter_color">복사</button>
				<button class="transfer_btn filter_color">Transfer</button>
				<button class="add_btn filter_color">추가</button>
			</div>
			<div class="copy_wrap flex">
				<div class="wrap filter_color">
					<div class="list_wrap">
						<div>데이터를 이동할 데이터셋을 선택해주세요.</div>
						<ul></ul>
					</div>
					<div class="select_wrap">
						<div>*조건을 선택해주세요.</div>
						<div class="flex">
							<input class="" type="radio" name="type" id="aa" value="0" checked="checked">
							<label for="aa" class="flex">이미지만</label>
							<input class="" type="radio" name="type" id="bb" value="1" >
							<label for="bb" class="flex">이미지 + 라벨</label>
						</div>
					</div>
					<div class="btn_wrap flex">
						<button class="cancel_btn">취소</button>
						<button class="confirm_btn">이동</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>


<script>
	const dataList2 = {
		pt : $("#dataList2"),
		linkedList : {},
		data : {
			label_type : null,
			node : null,
			// player params
			player : null,
			playerFrame : null,
//				currDataPage : 1,
			videoObj : {
				controls : true,
				autoplay : true,
				height:160,
				width:160,
				src : {
					type:"video/mp4",
					src:"",
				},
				"preload" : "auto",
				"data-setup" : '{ "playbackRages":[0.5,1,1.5,2], "loopbutton":true }',
				controlBar : {
					fullscreenToggle : false,
					volumePanel : false,
					pictureInPictureToggle : false,
				},
			},
			
			canvas : null,
			canvasObj : {
				origX : 0, 
				origY : 0, 
				isDown : false, // default : false
				freeDrawing : false, // default : false
				currDataNum : 1,
				datasetId : null,
//					isRectActive : true,
			},
			scaleFactor : {origWidth:0, origHeight:0, ratio:1},			
			
		},
		
		//init start
		datasetInit : function(dataset_id){
			const that = dataList2;
			
			that.data.canvasObj['datasetId'] = null;
			that.data.canvasObj['datasetId'] = dataset_id;
			that.init(dataset_id);
		},			
		
		init(datasetId) {
			const that = dataList2;
			
// 			that.computed.clearAllData();
			that.data.canvasObj['currDataNum'] = 1;
			$("#dataList2 .list_title span").html("");
			var page_num = 0;
			that.getDatasetById(datasetId);
			that.getVideoDataList(page_num, that.data.canvasObj['datasetId']);
// 			that.getDataList(node.id);
			
			
			that.listener();
		},
		dataList : [],
		listener() {
			const that = dataList2;
			
			//전체체크박스
			that.pt.find(".checkBox.all").off("click").on("click", function(){
				$(this).toggleClass("selected");
				
				if($(this).hasClass("selected")){
					that.pt.find(".checkBox").addClass("selected");
					
					let node = that.linkedList.head;
					while(node){
						scrollInfo.chkObj[node.value.data_id] = "selected";
						node = node.next;
					}
				} else {
					that.pt.find(".checkBox").removeClass("selected");
					scrollInfo.chkObj = {};
				}
				
			});
			
			$("#dataList2 .select_wrap label").off("click").on("click", function(){
				var datasetId = that.data.canvasObj["datasetId"];
				var targetId = $(this).attr("for");
				var targetA = $("#dataList2 .select_wrap input#aa");
				var targetB = $("#dataList2 .select_wrap input#bb");
				if(targetId == "aa"){
					targetB.prop("checked", false);
					targetA.prop("checked", true);
					that.getDatasetList(datasetId,"only");
				} else {
					targetA.prop("checked", false);
					targetB.prop("checked", true);
					that.getDatasetList(datasetId,"with");			// only == all label_type dataset
				}
// 				if(targetA.prop("checked") == true){
// 					$("#dataList2 .select_wrap input").prop("checked", false);
// 					$("#dataList2 .select_wrap input")target.prop("checked", );
// 				} else {
// 					target.prop("checked", true)
// 				}
			});
			
			//삭제
			that.pt.find(".del_btn").off("click").on("click", function(){
				var msg = "선택한 데이터를 삭제하시겠습니까?\n선택한 데이터의 개수에 따라 많은 시간이 소요될 수 있습니다";

				const keys = Object.keys(scrollInfo.chkObj);
				var target = $("#dataList2 .c_wrap .checkBox.selected").parent();
				
				if(target.length > 0){
					if(confirm(msg)){
						$("#loader").show();
						
						var deleteArr = [];
						var deleteTarget = [];
						for(var i=0; i < target.length; i++){
							
							var deleteDataId = $($(target)[i]).data("id");
// 							deleteTarget.push($($(target)[i]).data("id"));
							deleteArr.push(that.deleteAjax(deleteDataId));
							
						}
						
						that.deleteDeffered(deleteArr);
						
						alert("삭제가 완료되었습니다.");														// jh.sa 추가	
						$("#loader").hide();						
						
					} else {
						return false;
					}
				} else {
					alert("데이터 선택 후 다시 시도해주세요");
				}
				
				$("#dataList2 .c_wrap .checkBox").removeClass("selected");
				
// 				if(keys.length>0){
// 					if(confirm(msg)){
// 						$("#loader").show();
// 						let cnt = 0, i = 0;
						
// 						let deleteArr = [];
// 						for(let i=0; i<keys.length; i++){
// 							that.linkedList.removeNode(that.linkedList.obj[keys[i]]);
// 							delete that.linkedList.obj[keys[i]];
							
// 							const node = that.pt.find(".c_wrap li[data-id='" + keys[i] + "']");
// 							if(node.length>0){
// 								node.remove();
// 								cnt++;
// 							}
// 							deleteArr.push(that.deleteAjax(keys[i]));
// 						}
						
// 						that.deleteDeffered(deleteArr);

						
// 						alert("삭제가 완료되었습니다.");														// jh.sa 추가	
// 						$("#loader").hide();
// 					} else {
// 						return false;
// 					}

// 				} else {
// 					alert("데이터 선택 후 다시 시도해주세요");
// 				}
				
// 				scrollInfo.chkObj = {};
// 				that.pt.find(".checkBox").removeClass("selected");
// 				// 데이터 삭제 직후 data list 의 data 개수 갱신 
// 				$("#dataList2 .list_title span").text(" ("+that.linkedList.length+")");			// jh.sa 추가
				var page_num = 0;
				that.getVideoDataList(page_num, that.data.canvasObj['datasetId']);
				that.setListener();
			});
			
			
			
			//복사
			that.pt.find(".copy_btn").off("click").on("click", function(){
				var datasetId = that.data.canvasObj["datasetId"];
				var label_type = that.data.label_type;
				that.pt.find(".copy_wrap").removeClass("transfer");
				that.pt.find(".copy_wrap").css({"display":"flex"});
				
				// jh.sa copy 버튼 누를때마다 only data, with label 중 기본값으로 only data 선택
				if($("input#bb").prop("checked") == true){
					$("input#bb").prop("checked", false);
					$("input#aa").prop("checked", true);
				}
// 				if(that.pt.find(".c_wrap .checkBox.selected").length>0){
// 					that.getDatasetList(node.id);
// 				} else {
// 					alert("체크된 데이터를 찾을 수 없습니다");
// 					return false;
// 				}
				// jh.sa 수정: select한 checkbox가 스크롤이 아래쪽으로 로딩되면 인식이 안되는 문제 
// 				if(Object.keys(scrollInfo.chkObj).length > 0){
// 					that.getDatasetList(datasetId,label_type);
// 				} else {
// 					alert("데이터 선택 후 다시 시도해주세요");
// 					return false;
// 				}
				that.getDatasetList(datasetId,"only");			// only == all label_type dataset
			});
			
			//이동
			that.pt.find(".transfer_btn").off("click").on("click", function(){
				var datasetId = that.data.canvasObj["datasetId"];
				that.pt.find(".copy_wrap").addClass("transfer");
				that.pt.find(".copy_wrap").css({"display":"flex"});
				
// 				if(that.pt.find(".c_wrap .checkBox.selected").length>0){
// 					that.getDatasetList(node.id);
// 				} else {
// 					alert("체크된 데이터를 찾을 수 없습니다");
// 					return false;
// 				}
				// jh.sa 수정: select한 checkbox가 스크롤이 아래쪽으로 로딩되면 인식이 안되는 문제 
// 				if(Object.keys(scrollInfo.chkObj).length > 0){
// 					that.getDatasetList();
// 				} else {
// 					alert("데이터 선택 후 다시 시도해주세요");
// 					return false;
// 				}
				that.getDatasetList(datasetId,"with");			// with == specific label_type dataset
			});
			
			//취소
			$("#dataList2 .cancel_btn").off("click").on("click", function(){
				that.pt.find(".copy_wrap").hide();
				
				that.pt.find(".copy_wrap .list_wrap li").remove();
			});
			
			$("#dataList2 .confirm_btn").off("click").on("click", function(){
				var datasetId = that.data.canvasObj["datasetId"];
				var dataset = $("#dataList2 .copy_wrap .checkBox.selected").parent();
				var transfer = $("#dataList2 .copy_wrap").hasClass("transfer");
				var targetDataset;
				
// 				const dataList = that.pt.find(".c_wrap .checkBox.selected").parent();
// 				const dataList = Object.keys(scrollInfo.chkObj);							// jh.sa
				
				if(dataset.length>0){
					if(!transfer){
						targetDataset = [];
						for(var i =0; i < dataset.length; i++){
							targetDataset.push($($(dataset)[i]).data("id"));
						}					
						that.processCopy(targetDataset, datasetId, true);
					} else {
						targetDataset = $("#dataList2 .copy_wrap.transfer .checkBox.selected").parent().data("id");
						that.processCopy(targetDataset, datasetId);
					}		
					
				} else {
					alert("데이터셋 선택 후 다시 시도해주세요");
				}
			});
			//
			
			
			//이미지 추가
			that.pt.find(".add_btn").off("click").on("click", function(){
				labeller.pt.find("div.section").removeClass("selected");
				const node = ".section.addImg";
				labeller.pt.find(node).addClass("selected");
				// 기존 node 변수가 해당 데이터를 포함하고 있지 않아 addImg.init(node) 호출이 불가했던 문제 수정
				const nodes = wsObj[setting.key].dir.getSelectedNodes();			// jh.sa 추가 
				addImg.init(nodes[0]);					// jh.sa 수정 (addImg.init(node) => addImg.init(nodes))
			});
			
// 			that.pt.find(".c_wrap").off("scroll").on("scroll",function(){
// 				const target = $(this);
// 				const st = target.scrollTop();				
				
// 				if (st + target.innerHeight() >= target[0].scrollHeight && !scrollInfo.isScroll && !scrollInfo.isScrollEnd && scrollInfo.endNode.next != null){
// 					// 제일 아래,.
// 					scrollInfo.isScroll = true;
// 					scrollInfo.isScrollTop = false;
// 					that.addList(scrollInfo.endNode.next,"down");			
					
// 				} else if (st == 0 && !scrollInfo.isScroll && !scrollInfo.isScrollTop && scrollInfo.startNode.prev != null){
// 					//위에
// 					scrollInfo.isScroll = true;
// 					scrollInfo.isScrollEnd = false;
// 					that.addList(scrollInfo.startNode.prev,"up");
// 				}
// 			});
			
			//paging evt
			$("#dataList2 #pagination .first").off("click").on("click",function(){
				var page_num = 0;
				that.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
			});
			$("#dataList2 #pagination .prev").off("click").on("click",function(){
				var page_size=50;
				var page_num = $("#dataList2 #pagination .page-item.active .page-link").html()*1-2;
				if(page_num<0){
					alert("첫 페이지 입니다.");
					return false;
				}
				that.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
			});
			$("#dataList2 #pagination .page-link").off("click").on("click",function(){
				if(isNaN($(this).html()) == false){
					var page_num = $(this).html()*1-1;
					that.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
				}
			});
			$("#dataList2 #pagination .next").off("click").on("click",function(){
				var page_size=50;
				var page_num = $("#dataList2 #pagination .page-item.active .page-link").html()*1;
				var lastPage = Math.floor($("#dataList2 .list_title span").html()*1/page_size);
				if(page_num>lastPage){
					alert("마지막 페이지 입니다.");
					return false;
				}
				var page = $("#dataList2 .list_title span").html()*1/page_size;
				if(page == page_num){
					alert("마지막 페이지 입니다.");
					return false;
				} else {
					that.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
				}				
// 				that.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
			});
			$("#dataList2 #pagination .last").off("click").on("click",function(){
				var page_size = 50;
				var page_num = Math.floor($("#dataList2 .list_title span").html()*1/page_size);
				var page = $("#dataList2 .list_title span").html()*1/page_size;
				if(page == page_num){
					that.getVideoDataList(page_num-1,that.data.canvasObj['datasetId']);
				} else {
					that.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
				}
				
				
			});			
			
		},
		
		reset(data){
			const that = dataList2;
			
			that.pt.find(".dataset_title").text(data.title);
			that.pt.find(".dataset_contents").text(data.contents);

			that.pt.find(".checkBox").removeClass("selected");			
			that.pt.find(".c_wrap").empty()
			that.pt.find(".c_wrap").off("scroll");
			that.linkedList = {};
// 			scrollInfo.chkObj = {};
		},
		
		getDatasetById(id){
			const that = dataList2;
			$("#loader").show();
			$.ajax({
				url : baseUrl + "data/getDatasetById.json",
				data : {dataset_id : id},
				type : "POST",
				success : function(res){
					console.log("=====getDatasetById=====", res);
					$("#loader").hide();
					
					if(res.result.code == "200"){
						that.data["label_type"] = res.result.data.label_type;
						that.reset(res.result.data);
					} else if(res.result.code == "2001"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
						return false;
					}
				},
				error : function(err){
					$("#loader").hide();
					console.log("ERROR!!", err);
				}
			});			
		},
		
		getDatasetList(datasetId,type){
			const that= dataList2;
			
			$("#loader").show();
			$.ajax({
				url : baseUrl + "data/getDatasetList.json",
				data : {},
				type : "POST",
				success : function(res){
					console.log("=====getDatasetList=====", res);
					$("#loader").hide();
					
					if(res.result.code == "200"){
// 						that.pt.find(".copy_wrap").css({"display":"flex"});
						that.setDatasetList(datasetId, res.result.data, type);
					} else if(res.result.code == "2001"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
						return false;
					}
				},
				error : function(err){
					$("#loader").hide();
					console.log("ERROR!!", err);
				}
			});
		},		
		
		getVideoDataList(page,dataSet,currDataNum){
			const that = dataList2;
			$("#loader").show();
			var deferred = $.ajax({
				url : baseUrl + "data/getDataList.json",
				data : { page_num:page, dataset_id : dataSet },
				type : "POST",
				traditional : true,	
				success : function(res){
						console.log(":getDataList:",res);
				},
				error : function(err){
					$("#loader").hide();
					console.log(":ERROR:",err);
				}
			});
			
			Promise.resolve(deferred).then(function(data){
				$("#loader").hide();
				if(data.result.code == "3301"){
					alert(data.result.data);
					location.href = baseUrl + "login";
					return false;
				}
				if(data.result.code == "200"){
					if(data.result.data.length == 0){
						alert("데이터가 존재하지 않습니다.\n데이터를 추가해주세요.")
						labeller.pt.find("div.section").removeClass("selected");
						var nodes = wsObj[setting.key].dir.getSelectedNodes();
						var node = ".section.addImg";
						labeller.pt.find(node).addClass("selected");						
						addImg.init(null,that.data.canvasObj.datasetId);
						return;
					}
					
					if(!currDataNum){
						that.data.canvasObj['currDataNum'] = data.dataVO.page_num*1+1;
					}else{
						that.data.canvasObj['currDataNum'] = currDataNum*1+1;
					}
					var startPage = Math.floor(data.dataVO.page_num*1/data.dataVO.page_size*1)+1;
					var total_size = data.dataVO.total_size;
					var page_size = data.dataVO.page_size;
					var temp = data.result.data;
					
					//init one Data
					that.updateListPage(temp,startPage,page_size,total_size);
					
				}
				
			});
		},		
		
		updateListPage(temp,startPage,page_size,total_size){
			const that = dataList2;
			var totalPage = Math.ceil(total_size * 1 / page_size);
			
			if($("#dataList2 #pagination").data("twbs-pagination")){
				$("#dataList2 #pagination").twbsPagination('destroy');
			}
			$("#dataList2 #pagination").twbsPagination({
				  totalPages: totalPage,
				  visiblePages: 5,
				  first:"<<",
				  prev:"<",
				  next:">",
				  last:">>",
				  startPage: startPage,
//					  onPageClick: function (event, total_size) {
//						  that.render.drawDataList(temp,total_size, page_num, page_size);
//					  }
			});
			that.drawDataList(temp,total_size);
		},
		
		drawDataList(data, total_size){
			const that = dataList2;
			
			var total = $("#dataList2 .list_title span");
			var target = $("#dataList2 .list_table .c_wrap");
			var html = "";
			
			total.html(total_size);
			target.html("");
			for(var i=0; i < data.length; i++){
				html += "<li class='flex' data-id='" + data[i].data_id + "' data-index='" + (i+1) + "'>";	// (i+1) 부분은 수정필요
				html += " <div class='checkBox'></div>";
				html += " <div class='preview'><div class='img_preview'></div></div>";
				html += " <div class='id'>" + data[i].data_id + "</div>";
				html += " <div class='file_name'>" + data[i].filename + "</div>";
				html += " <div class='media_type'>" + that.data.label_type + "</div>";
				html += " <div class='created_date'>" + moment(data[i]['created_date']).format("YYYY-MM-DD") + "</div>";
				html += " <div class='path' style='display : none;'>" + data[i].path + "</div>";
				// k.park 201015
// 				html += " <div class='label_cnt'>" + data[i]['meta_cnt'] + "</div>";
				html += "</li>";
			}
			
			target.append(html);
			
			that.listener();
			that.setListener();
		},			
		
		getDataList(data,id,page){
			var that = dataList2;
			console.log("dataset_id : " + that.dataset_id);
			$("#loader").show();
			var data = {page_num : page, dataset_id : that.dataset_id};
			$.ajax({
				url : baseUrl + "data/getDataList.json",
				data : data,
				type : "POST",
				traditional : true,
				success : function(res){
					console.log("SUCCESS!",res);
					$("#loader").hide();
					if(that.userLevel != "1") {
						alert("접근 권한이 없습니다.");
						location.href = baseUrl + "login";
						return false;
					}
					if(res.result.code == "3301" || res.result.code == "3302"){
						alert(res.result.data);
						location.href = baseUrl + "login";
						return false;
					}
					if(res.result.code == "4051") {
						alert(res.result.data);
						history.back();
					}
					if(res.result.code == "200") {
						that.render.renderDataList(res.result.data,id,res.dataVO);
						that.bind.sideEvtCollision();
					}
				},
				error : function(err){
					$("#loader").hide();
					console.log("ERROR!",err);
					alert(err);
				}
			});
		},
		
// 		getDataList(id){
// 			const that= this;
			
// 			$("#loader").show();
// 			$.ajax({
// 				url : baseUrl + "data/getDataList.json",
// 				data : {dataset_id : id},
// 				type : "POST",
// 				success : function(res){
// 					console.log("=====getDataList=====", res);
// 					$("#loader").hide();
					
// 					if(res.result.code == "200"){
// 						that.setLinkedList(res.result.data);
// 					} else if(res.result.code == "2001"){
// 						alert(res.result.data);
// 						location.href = baseUrl + 'login';
// 					} else {
// 						alert(res.result.data);
// 						return false;
// 					}
// 				},
// 				error : function(err){
// 					console.log("ERROR!!", err);
// 				}
// 			});
// 		},
		
		setDatasetList(id, data, type){
			const that = dataList2;
			var target = $("#dataList2 .copy_wrap .list_wrap ul");
			var label_type = that.data.label_type;
			var targetData;
			target.html("");
			if(type == "only"){				// 데이터만 보낼때, label_type 상관 없음 (IMAGE, VIDEO는 구분)
				for(let i=0; i<data.length; i++){
					if(data[i].dataset_id != id){
						if(label_type == "IMAGE_BBOX" || label_type == "IMAGE_SEGMENTATION"){
							if(data[i].label_type.indexOf("IMAGE") == 0){
								var html = "<li class='flex' data-id='"+data[i].dataset_id+"'>"
								+"<div class='checkBox'></div>"
								+"<div class='img'></div>"
								+"<div class='title' title='"+data[i].title+"'>"+data[i].title+"</div>"
								+"</li>";
								
								target.append(html);								
							}
						} else if(label_type == "VIDEO_BBOX"){
							if(data[i].label_type.indexOf("VIDEO") == 0){
								var html = "<li class='flex' data-id='"+data[i].dataset_id+"'>"
								+"<div class='checkBox'></div>"
								+"<div class='img'></div>"
								+"<div class='title' title='"+data[i].title+"'>"+data[i].title+"</div>"
								+"</li>";
								
								target.append(html);								
							}
						}

					}
				}				
			} else if(type == "with") {		// 데이터 + 라벨 다 보낼때, label_type 맞춰서 뿌려줘야함 
				for(let i=0; i<data.length; i++){
					if(data[i].dataset_id != id){
						if(data[i].label_type == label_type){
							var html = "<li class='flex' data-id='"+data[i].dataset_id+"'>"
							+"<div class='checkBox'></div>"
							+"<div class='img'></div>"
							+"<div class='title' title='"+data[i].title+"'>"+data[i].title+"</div>"
							+"</li>";
							
							target.append(html);							
						}
					}	
				}
			}

			
			$("#dataList2 .copy_wrap .list_wrap ul li").off("click").on("click", function(){
				var check = $(this).find(".checkBox");
				if($("#dataList2 .copy_wrap").hasClass("transfer")){
					$("#dataList2 .copy_wrap .list_wrap ul li .checkBox").removeClass("selected");
					check.toggleClass("selected");
				} else {
					$(this).find(".checkBox").toggleClass("selected");
				}
			});
			
			$("#dataList2 .copy_wrap .list_wrap ul li .title").each(function(){
				let length = 50;
				
				$(this).each(function(){
					if($(this).text().length >= length){
						$(this).text($(this).text().substr(0,length)+"...");
					}
				});
			});	
				
		},
		
		processCopy(targetDataset, datasetId, isCopy){
			const that = dataList2;
			var label_type = that.data.canvasObj.dataId
			
// 			let dataset_id = "";
// 			let label_type = "";
// 			for(let i=0; i<dataset.length; i++){
// 				if(i == 0){
// 					dataset_id = dataset[i].dataset["id"];
// 					label_type = dataset[i].dataset["label_type"];
// 				} else {
// 					dataset_id += "," + dataset[i].dataset["id"];
// 					label_type = dataset[i].dataset["label_type"];
// 				}
// 			}
// 			console.log("label_type : " + label_type);
// 			console.log("processCopy data id: ", id);
// 			console.log("processCopy dataset id: ", dataset_id);
			var url = "";
			var ajaxData;
			if(!isCopy){
				url = "updateDataInId";
				ajaxData = {
						target_dataset_id : targetDataset,
						dataset_id : datasetId,
						label_type : label_type
				};
				that.ajaxCopy(url, ajaxData, "0");
			} else {
				if($("#dataList2 .select_wrap input[name='type']:checked").val() == 0){
					url = "insertReplicaPartData";
					ajaxData = {
							dataset_ids : targetDataset,
							dataset_id : datasetId,
							label_type : null
					};
					that.ajaxCopy(url, ajaxData, "1");
				} else {
					url = "insertReplicaPartDataWithMeta";
					ajaxData = {
							dataset_ids : targetDataset,
							dataset_id : datasetId,
							label_type : label_type
					};					
					that.ajaxCopy(url, ajaxData, "1");
				}	
			}
			
// 			let url = "";
// 			if(that.pt.find(".copy_wrap").hasClass("transfer")){
// 				url = "updateDataInId";
// 				that.ajaxCopy(url, ajaxData, node, "0");			// jh.sa 추가
// 			} else {
// 				if(that.pt.find(".select_wrap input[name='type']:checked").val() == 0){
// 					url = "insertReplicaData";
// 					that.ajaxCopy(url, ajaxData, node, "1");		// jh.sa 추가
// 				} else {
// 					// data copy 시 With label 옵션에 대한 url이 정의되어 있지 않아 수정
// 					url = "insertReplicaPartDataWithMeta";			// jh.sa 추가
// 					that.ajaxCopy(url, ajaxData, node, "1");		// jh.sa 추가
// 				}
// 			}
// 			that.ajaxCopy(url, ajaxData, node);
		},
		
		ajaxCopy(url, ajaxData, num){
			const that = dataList2;
			var datasetId = that.data.canvasObj.datasetId;
			console.log("url : " + url);
// 			showLoading(".copy_wrap");
			$("#loader").show();
			$.ajax({
				url : baseUrl + "data/"+url+".json",
				data : ajaxData,
				success : function(res) {
					console.log("=====updateDataInId=====", res);
					if(res.result.code == 200){
						that.pt.find(".cancel_btn").trigger("click");
						if(num == "0"){
							console.log("url : " + url );
							alert("데이터 이동이 완료되었습니다.");														// jh.sa 추가
						} else if (num == "1"){
							alert("데이터 복사가 완료되었습니다.");														// jh.sa 추가
						}
						
						that.init(datasetId);						
					} else if(res.result.code == "2001"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else if(res.result.code == 500){
						alert(res.result.data);
					} else {
						console.log(res.result.code + ", " + res.result.data);
					}
// 					hideLoading(".copy_wrap");
					$("#loader").hide();
				},
				error : function(err) {
					$("#loader").hide();
					console.log("ERROR!!", err);
				},
			});
		},
		
		setLinkedList(data){
			const that = dataList2;
			
			that.linkedList = new LinkedList();
			if(data.length == 0){
				alert("데이터가 존재하지 않습니다.\n데이터를 추가해주세요.")
				labeller.pt.find("div.section").removeClass("selected");
				var nodes = wsObj[setting.key].dir.getSelectedNodes();
				var node = ".section.addImg";
				labeller.pt.find(node).addClass("selected");
				addImg.init(nodes);
				return false;
			}
    		for(let i = 0; i<data.length; i++){
    			const id = data[i].data_id;
    			
    			if(that.linkedList.obj[id] == undefined){
    				that.linkedList.push(data[i], id);
				}
    		}
    		
    		that.initList();
			$("#dataList2 .list_title span").text(" ("+data.length+")");			// jh.sa 추가 
		},
		
		initList(){
			const that = dataList2;
			
// 			const maxSize = scrollInfo.maxSize
// 			const node = that.linkedList.head;
// 			scrollInfo.startNode = that.linkedList.head;
// 			that.loopList(maxSize, node, "down",true);
			
// 			if(that.linkedList.length > scrollInfo.maxSize){
// 				scrollInfo.isScrollTop = true;
// 			} else {
// 				scrollInfo.isScrollEnd = true;
// 			}
			that.setListener();
		},
		
		addList : function(node, type){
			const that = dataList2;
			
			that.loopList(scrollInfo.maxSize/2, node, type, false);
			scrollInfo.isScroll = false;
			that.setListener();
		},
		
		setHtml(node){
			const that = dataList2;
			
			const cur_id = node.value.data_id;

			let html = "<li class='flex' data-id='"+ node.value.data_id +"'>";
			
			if(scrollInfo.chkObj[cur_id] != undefined){
				html += "<div class='checkBox selected'></div>";
			} else {
				html += "<div class='checkBox'></div>";
			}
			
			html += "<div class='preview'><div class='img_preview'></div></div>"
				+ "<div class='id'>" + node.value.data_id + "</div>"
				+ "<div class='path'>" + node.value.path + "</div>"
				+ "</li>";
				
			return html;
		},
		
		loopDeletedRow : function(type,node){
			const that = dataList2;
			const target = that.pt.find(".c_wrap");
			const html = that.setHtml(node);
	
			if(type == "down"){
				target.append(html);
			} else {
				target.prepend(html);
			}
			
			that.setStartAndLastNode();			
		},
		
		loopList(size, node, type, isInit){			
			const that = dataList2;
			const target = that.pt.find(".list_table .c_wrap");	
			let i = 0;
			
			// 데이터셋 선택 시 스크롤이 있는 데이터셋에서 스크롤 도중 스크롤이 생기지 않는 작은 데이터셋으로 이동 시 종전의 로드 데이터가 출현하던 문제 수정
			if(isInit){target.html("");}		// jh.sa 추가 
			
			while(node){
				// 데이터셋 선택 시 처음 선택한 다음부터 스크롤이 생기는 다수의 이미지 데이터셋일 경우 전체 데이터가 불러와지지 않던 문제 수정
				// if(i>=size){break;}
				if(i>=size){
					scrollInfo.isScroll = false;
					scrollInfo.isScrollEnd = false;
					scrollInfo.isScrollTop = false;
					break;
					}	// jh.sa 추가
				i++;
				const html = that.setHtml(node);
				
				if(type == "down"){
					target.append(html);
					node = node.next;
				} else {
					target.prepend(html);
					node = node.prev;	
				}	
			}

			that.setStartAndLastNode();	
			if(!isInit){
				that.setNodeData(i,type);
			}		
		},
		
		canvas : null,
		scaleFactor : null,
		setListener(){
			const that = dataList2;
			
			$("#dataList2 .c_wrap .checkBox").off("click").on("click", function(){
				$(this).toggleClass("selected");
				
				if($(this).hasClass("selected")){
// 					scrollInfo.chkObj[$(this).parent().data("id")] = "selected";
					if(Object.keys(scrollInfo.chkObj).length == that.linkedList.length){
						that.pt.find(".checkBox.all").addClass("selected");
					}
				} else {
// 					delete scrollInfo.chkObj[$(this).parent().data("id")];
					that.pt.find(".checkBox.all").removeClass("selected");
				}
			});
			
			that.pt.find(".c_wrap .preview .img_preview").off("mouseenter").on("mouseenter", function(){
				const x = $(this).offset().left + $(this).outerWidth() + 10;
		        const y = $(this).offset().top + $(this).outerHeight() - 59;
		        const id = $(this).parents("li").find(".id").text();
		        const path = $(this).parents("li").find(".path").text();
		        const filename = $(this).parents("li").find(".file_name").text(); 
		        
		        if(that.data.label_type == "VIDEO_BBOX"){
			        const video_html = "<video id ='pre_video' style='position: fixed; top: "+ y +"px; left: "+ x +"px; width : 320px; height : 320px' ></video>"; 

			        $(this).append(video_html);		 
			        
			        const video_path = "/uploadFile/xlabeller/" + path; 
			        console.log("video_path" + video_path);
			        var pre_video = videojs("pre_video");
			        pre_video.src({
			        	src : video_path,
			        	type : "video/mp4",
			        	width : "auto",
			        	height : "auto",
			        	autoplay : false
			        });
			 
			        that.data.player = pre_video;
			        pre_video.autoplay('muted');			        
		        } else {
					const html = "<div class='show_img_wrap' style='position: fixed; top: "+ y +"px; left: "+ x +"px;'>"
						+ "<div class='title_wrap flex'><div class='image'></div><span class='title'></span></div>"
						+ "<div class='frame_container'>"
						+ 	"<canvas id='cc' width='270px' height='182px'>"
						+ "</div>"
						+ "</div>";
			        $(this).append(html);
			        
			        //img load
			        showLoading(".show_img_wrap");
			        
			        $(".show_img_wrap .title").text(filename);
			        that.canvas = new fabric.Canvas("cc");
		 			const imgObj = new Image();
					imgObj.src = "/uploadFile/xlabeller/" + path; 
					imgObj.onload = function(){
						that.rescale(this);
						
						that.canvas.setBackgroundImage(imgObj.src, that.canvas.renderAll.bind(that.canvas), {
							scaleX: that.scaleFactor,
							scaleY: that.scaleFactor
					    });
						
						that.clearCanvas();
// 						that.getMetaList(id);
						hideLoading(".show_img_wrap");
					}
					imgObj.onerror = function(){
						hideLoading(".show_img_wrap");
					}				        	
		        }
	
		        
		        
			});
			
			that.pt.find(".c_wrap .preview .img_preview").off("mouseleave").on("mouseleave", function(){
				if(that.data.label_type == "VIDEO_BBOX"){
					that.data.player.dispose();
				} else {
					that.pt.find(".show_img_wrap").remove();
				}
			});
			
			// 삭제 후 데이터 검사 시 데이터 없으면 addImg로 이동
			if(that.linkedList.length == 0){
				alert("데이터가 없습니다. \n데이터를 추가해주세요.");
				labeller.pt.find("div.section").removeClass("selected");
				var node = ".section.addImg";
				labeller.pt.find(node).addClass("selected");
					
				addImg.init(that.data.node);
			}
		},
		
		
		setNodeData(i,type){
			const that = dataList2;
			
			const tr_size = that.pt.find(".c_wrap li").length;
			if(type == "down"){
				//붙은 데이터가 half_size 보다 크거나 같고 마지막노드 다음이 널이 아닌경우
				if(i>=scrollInfo.maxSize/2 && scrollInfo.endNode.next != null){
					scrollInfo.isScroll_top = false;
					if(tr_size != scrollInfo.maxSize/2){
						that.removeTableBox((tr_size - scrollInfo.maxSize), type);
					} else {
						that.removeTableBox((tr_size - scrollInfo.maxSize/2), type);
					}
					scrollInfo.remainSize = 0;
					that.setStartAndLastNode();	
				} else {
					//붙은 데이터가 half_size 보다 작고 마지막노드 다음이 널인 경우 걍 마지막에 붙여버리면됌 remove 안시킴
					scrollInfo.remainSize = 0;
					scrollInfo.isScrollEnd =  true;
// 					console.log(i, tr_size, "down end");
				}

			} else {
				//붙은 데이터가 half_size 보다 크거나 같고 시작노드 전이 널이 아닌경우 
				if(i>=scrollInfo.maxSize/2 && scrollInfo.startNode.prev != null){
					scrollInfo.isScrollEnd = false;
					that.removeTableBox((scrollInfo.maxSize/2 + scrollInfo.remainSize), type);
					that.setStartAndLastNode();	
					scrollInfo.remainSize = 0;
// 					console.log(i, tr_size, "up normal");
				} else {
					//붙은 데이터가 half_size 보다 작고 널인경우
					
					//tr_size 가 default size 가 아닐때 .. 
					if(tr_size != scrollInfo.maxSize/2){
						that.removeTableBox((i + scrollInfo.remainSize), type);
						scrollInfo.remainSize = 0;
					}
					scrollInfo.isScrollTop =  true;
					
					scrollInfo.endNode = that.linkedList.obj[that.pt.find(".c_wrap li").last().data("id")];
// 					console.log(i, tr_size, "up end");
				}
			}
		},
		removeTableBox : function(size,type){
			let that = this;

			if(type == "down"){
				that.pt.find(".c_wrap li").slice(0,size).remove();					
			} else {		
				that.pt.find(".c_wrap li").slice(-size).remove();
			}
			that.pt.find(".c_wrap").scrollTop((that.pt.find(".c_wrap")[0].scrollHeight - that.pt.find(".c_wrap").height()) / 2);

		},
		
		setStartAndLastNode(){
			const that = dataList2;
			if(that.linkedList != null){
				const node = that.linkedList.obj;
				// 큰 데이터셋에서 스크롤없는 작은 데이터셋으로 이동 시 종전 데이터 충돌 오류 수정
				if(node != undefined){					// jh.sa 추가
					scrollInfo.endNode = node[that.pt.find(".c_wrap li").last().data("id")];
	  				scrollInfo.startNode = node[that.pt.find(".c_wrap li").first().data("id")];					
				} else {

				};

			};
		},
		
		deleteAjax(id){
			var deffered = $.ajax({
				url : baseUrl + "data/deleteData.json",
				data : {data_id : id},										// id => data_id(0921)
				async : false,											// jh.sa
			   	type : "POST",
			   	success : function(res){
// 					console.log("=====data=====", res);					// jh.sa
				},
			   	error : function(err){
			   		$("#loader").hide();
			   		 console.log("ERROR!!", err);
			   	}
			});

			return deffered;
		},
		
		deleteDeffered(arr){
			var that = this;
			Promise.all(arr).then(function(res){
				console.log("=====Delete Deffered Result=====", res);
			});
		},
		
		
		
		rescale(img){
			const that = dataList2;
			
        	const canvas_max_width = 270;
            const canvas_max_height = 182;
            
            let scaleFactor=0;
            if(canvas_max_height/canvas_max_width >= img.naturalHeight/img.naturalWidth){
            	scaleFactor=canvas_max_width/img.naturalWidth;
            } else{
            	scaleFactor=canvas_max_height/img.naturalHeight;
            }
            
            that.canvas.setWidth(img.naturalWidth*scaleFactor);
         	that.canvas.setHeight(img.naturalHeight*scaleFactor);
    		that.canvas.calcOffset();
    		that.canvas.renderAll();      
    		
    		that.scaleFactor =  scaleFactor;
    	},
        
        clearCanvas(){
    		const that = dataList2;
        	//캔버스에 존재하는 오브젝트 모두 삭제
        	var canvObjLen = that.canvas.getObjects().length;
        	for(var i = 0 ; i < canvObjLen; i++){
        		that.canvas.remove(that.canvas.getObjects()[0]);
        	}
        },
        
        getMetaList(id){
			const that = dataList2;
			$("#loader").show();
			$.ajax({
				url : baseUrl + "data/getMetaList.json",
				data : {data_id : id},
				type : "POST",
				success : function(res){
					console.log("=====getMetaList=====", res);
					$("#loader").hide();
					if(res.result.code == "200"){
						that.setMapping(res.result.data);
					} else if(res.result.code == "2001"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					}
				},
				error : function(err){
					$("#loader").hide();
					console.log("ERROR!!", err);
				}
			});
		},
		
		setMapping(data){
			const that = dataList2;
			
			const colorHash = new ColorHash();
			const arr = []
			for(let i=0; i<data.length; i++){
				const fillColor = colorHash.rgb(data[i].label);
				const info = data[i].info.split(",");
				const left = info[0]*that.scaleFactor;
				const top = info[1]*that.scaleFactor;
				const width = info[2]*that.scaleFactor;
				const height = info[3]*that.scaleFactor;
				
				const temp = {
						left,
						top,
						width,
						height,
						lockMovementX : true,
						lockMovementY : true,
						lockScalingX : true,
						lockScalingY : true,
						lockRotation : true,
						angle: 0,
						fill: "rgba("+fillColor[0]+","+fillColor[1]+","+fillColor[2]+",0.5)"	
				}
				
				that.updateCanvas(temp);
			}
			
		},
        
		updateCanvas(data){
			const that = dataList2;
			const rect = new fabric.Rect(data);	
			that.canvas.add(rect);
			
        },
	};

</script>
