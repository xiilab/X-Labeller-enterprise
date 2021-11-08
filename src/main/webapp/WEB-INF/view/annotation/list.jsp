<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <jsp:include page="/header" flush="false" /> --%>

<head>

<title>X-labeller</title>

<style>

#annotation_list {height: 100%;}
.section_wrap {background-color: #fff;}

#annotation_list .contents {width: 100%; height: 100%; overflow: hidden; position:relative;}
#annotation_list .contents .title_wrap {margin-top: 23px;}
#annotation_list .contents .title_wrap span {font-family: Open_Sans; font-size: 12px; font-weight: 400; color: #343434;}

#annotation_list .contents .title_wrap .list_total {float: right; }

#annotation_list .contents .list_wrap {margin-top: 21px; height: 100%; }
#annotation_list .contents .btn_wrap {position: absolute; bottom: 0; margin-bottom: 41px;}
#annotation_list .contents .btn_wrap .del_btn {padding: 0 ; position:relative; font-family: Open_Sans; font-size: 12px; font-weight: 300; color: #343434;width: 68px; height: 28px; background-color: #f8f8f8;}

#annotation_list .table_body{max-height: calc(100% - 211px); overflow-y: overlay; overflow-x:hidden;}

#annotation_list .hover_box {border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
#annotation_list .hover_box div {font-family: NotoSansKR; font-size: 13px; color: #555555;}
#annotation_list .hover_div div {word-break: break-word; margin: 2px 5px; white-space: normal; font-weight: 300; font-family: NotoSansKR;}
#annotation_list .hover_div {max-width: 264px; text-align: left; position: relative; }
#annotation_list .hover_box {max-width: 264px; text-align: left; }


#annotation_list .empty_wrap {text-align: center; margin-top: 296px; }
#annotation_list .empty_wrap .no_image {margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; }
#annotation_list .empty_wrap .eng_text {font-family: Open_Sans; margin-bottom: 3px; font-size: 16px; font-weight: 300; color: #777777;}
#annotation_list .empty_wrap .kor_text {font-family: Open_Sans; font-size: 12px; color: #777777; font-weight: 200;}
#annotation_list .no_image {height: 37px; background-image: url('./images/icon_nodata_list.png'); }

</style>

</head>

<body>
	<div class="container" id="annotation_list">
		<div class="contents">
			<div class="ms">
				<div class="title_wrap">
					<span>ANNOTATION LIST</span>
					<span class="list_total">Total 0</span>
				</div>

				<div class="list_wrap">
					<div class="table_header">
					<table class="anno_table">
						<colgroup>
							<col style="width: 40px;"></col>
							<col style="width: 100px;"></col>
							<col style="width: 100px;"></col>
							<col style="width: 150px;"></col>
							<col style="width: 150px;"></col>
							<col style="width: 100px;"></col>

						</colgroup>
						<thead>
							<tr>
								<th><div class="checkBox"></div></th>
								<th>ID</th>
								<th>USER_ID</th>
								<th>TITLE</th>
								<th>CONTENTS</th>
								<th>CREATED_DATE</th>
							</tr>
						</thead>
					</table>
					</div>
					<div class="table_body">
					<table class="anno_table">
						<colgroup>
							<col style="width: 40px;"></col>
							<col style="width: 100px;"></col>
							<col style="width: 100px;"></col>
							<col style="width: 150px;"></col>
							<col style="width: 150px;"></col>
							<col style="width: 100px;"></col>

						</colgroup>
						<tbody></tbody>
					</table>
					</div>
				</div>
	 			<div class="btn_wrap fl"> 
 					<button class="del_btn">Delete</button>
 				</div>
			</div>
		</div>

	</div>
</body>


<script>
	$(document).on("sessionLoad", function() {

	});
	
	//스크롤
// 	var image_default_size = 40;						// jh.sa 210225 image_default_size => that.data.scrollObj.image_default_size
// 	var image_arr = [];									// jh.sa 210225 image_arr => that.data.scrollObj.image_arr 사용 안함
// 	var image_obj = {};									// jh.sa 210225 image_obj => that.data.scrollObj.image_obj 사용 안함
// 	var image_half_size = (image_default_size / 2);		// jh.sa 210225 image_half_size => that.data.scrollObj.image_half_size
// 	var removed_size = 0;								// jh.sa 210225 removed_size => that.data.scrollObj.removed_size 사용 안함
// 	var linked_list = null; 							// jh.sa 210225 linked_list => that.data.scrollObj.linked_list
// 	var last_node;										// jh.sa 210225 last_node => that.data.scrollObj.last_node
// 	var start_node;										// jh.sa 210225 start_node => that.data.scrollObj.start_node
// 	var image_remain_size;								// jh.sa 210225 image_remain_size => that.data.scrollObj.image_remain_size
// 	var isImageScroll_top = false;						// jh.sa 210225 isImageScroll_top => that.data.scrollObj.isImageScroll_top
// 	var isImageScroll_end = false;						// jh.sa 210225 isImageScroll_end => that.data.scrollObj.isImageScroll_end
// 	var isImageScroll = false;							// jh.sa 210225 isImageScroll => that.data.scrollObj.isImageScroll
// 	var box_obj = {};									// jh.sa 210225 box_obj => that.data.scrollObj.box_obj

	var annotation_list = {
		pt : $("#annotation_list"),
		data : {
			scrollObj : {
				image_default_size : 40,
				image_half_size : (40 / 2),
// 				removed_size : 0,
				image_remain_size : null,
// 				image_arr : [],
// 				image_obj : {},
				linked_list : null,
				start_node : null,
				last_node : null,
				isImageScroll : false,
				isImageScroll_top : false,
				isImageScroll_end : false,
				box_obj : {},
			},
		},
		init : function() {
			let that = this;
			that.pt.find("button").show();
			that.pt.find(".empty_wrap").remove();
			that.pt.find(".list_total").text("Total 0");
			that.defaultListener();
			that.getAnnotationList();
		},
		
		//addEmptyData
		addEmptyData : function(elem, data1, data2){
			let that = this;
			that.pt.find("button").hide();
			elem.append("<div class='empty_wrap'><div class='no_image'></div><div class='eng_text'>"+data1+"</div><div class='kor_text'>"+data2+"</div></div>")
		},
		
		//removeEmptyData
		removeEmptyData : function(elem){
			let that = this;
			elem.find(".empty_wrap").remove();
		},
		
		//annotation 데이터 불러오기
		getAnnotationList : function() {
			let that = this;
			$("#loader").show();
			$.ajax({
				url : baseUrl + "annotation/getAnnotationList.json",
				type : "POST",
				success : function(res) {
					$("#loader").hide();
					console.log("=====getAnnotationList=====", res);
					if(res.result.code == "3301"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} 
					if (res.result.code == "200") {
						that.modifyAnnotationListData(res.result.data);
					} else {
						alert(res.result.data);
					}
				},
				error : function(err) {
					$("#loader").hide();
					console.log("ERROR!!", err);
				}
			});
		},
		
		//기본 리스너 이벤트
		defaultListener : function(){
			let that = this;
			
			that.pt.find(".btn_wrap .del_btn").off("click").on("click",function(){
				var box_obj = that.data.scrollObj.box_obj;
				var deArr = [];
				var nodes = that.pt.find(".checkBox.selected");
				var msg = "삭제하시겠습니까?";
				
				if(confirm(msg)){
					
					let keys = Object.keys(box_obj);
					for(var i = 0, len = keys.length; i<len; i++){
						var id = keys[i].split(",")[0];
						deArr.push(that.deleteAnnotation(id));
					}

					Promise.all(deArr).then(function(){
						if(deArr.length==0){
							alert("선택된 데이터가 없습니다");
							return;
						}
						that.init();
						that.refresh();
					},function (err){
						alert("다시 시도해주세요");
						console.log("Sync Error", err);
						that.init();
					});
				}
			});
		},
		
		//화면 리셋
		resetView : function(){
			let that = this;
			that.pt.find(".table_body").off("scroll");
			that.pt.find("tbody").html("");
			that.pt.find("thead tr .checkBox").removeClass("selected");
		},
		
		//linked list 용 처음 노드랑 마지막 노드 세팅
		setStartAndLastNode : function(){
			var that = this;
			var linked_list = that.data.scrollObj.linked_list; 
			if(linked_list != null){
				that.data.scrollObj.last_node = linked_list.obj[that.pt.find("tbody tr").last().data("id")];
				that.data.scrollObj.start_node = linked_list.obj[that.pt.find("tbody tr").first().data("id")];
			}
		},
		
		//annotation 데이터 리셋
		resetAnnotationListData : function(){
			let that = this;
			that.data.scrollObj.linked_list = new LinkedList();
			that.resetView();
			that.data.scrollObj.image_remain_size = 0;
			that.data.scrollObj.isImageScroll_top = false;
			that.data.scrollObj.isImageScroll_end = false;
			that.data.scrollObj.isImageScroll = false;
// 			that.data.scrollObj.image_arr = [];
// 			that.data.scrollObj.image_obj = {};
			that.data.scrollObj.box_obj = {};
		},
		
		// 서버에서 받은 데이터 가공
		modifyAnnotationListData : function(data){
			let that = this;
			that.resetAnnotationListData();
			
			if(data.length == 0){
				that.addEmptyData(that.pt.find(".list_wrap"),  "No Annotation", "please add an annotation");
			}
			
			//test
// 			for(let y = 0; y<30; y++){
// 				for(let i = 0, len = data.length; i<len; i++){
// 					let id = data[i].id+y + "," + data[i].user_id + "," + data[i].title + "," + data[i].contents;
// 					that.data.scrollObj.linked_list.push({"id" : data[i].id+y, "user_id" : data[i].user_id, "title" : data[i].title, "contents" : data[i].contents, "created_date" : data[i].created_date }, id);
// 				}
// 			}
			
			for(let i = 0, len = data.length; i<len; i++){
				let id = data[i].annotation_id + "," + data[i].user_id + "," + data[i].title + "," + data[i].contents;
				that.data.scrollObj.linked_list.push({"annotation_id" : data[i].annotation_id, "user_id" : data[i].user_id, "title" : data[i].title, "contents" : data[i].contents, "created_date" : data[i].created_date }, id);
			}

			that.pt.find(".list_total").text("Total " + that.data.scrollObj.linked_list.length);
			that.initAnnotationList();
		},
		
		initAnnotationList : function(){
			var that = this;
			var image_default_size = that.data.scrollObj.image_default_size;
			var linked_list = that.data.scrollObj.linked_list;
			var node = linked_list.head;
			that.data.scrollObj.start_node = node;
			that.loopAnnotationList(image_default_size, node, "down",true);
			that.annotationListener();
			
			if(linked_list.length > image_default_size){
				that.data.scrollObj.isImageScroll_top = true;
				that.setAnnotationListScrollListener();
			} else {
				that.data.scrollObj.isImageScroll_end = true;
			}
		},
		
		addAnnotationList : function(node,type){
			var that = this;
			var	image_half_size = that.data.scrollObj.image_half_size;
			that.loopAnnotationList(image_half_size, node, type, false);
			that.data.scrollObj.isImageScroll = false;
			that.annotationListener();
		},
		
		loopAnnotationList : function(size, node, type, isInit){
			let that = this;
			let temp_node = node;
			let target = that.pt.find("table tbody");	
			let i = 0;
			
			while(node){
				if(i>=size){break;}
				
				var html = ""
				i++;
				
				var annotation_id = node.value.annotation_id;
				var user_id = node.value.user_id;
				var title = node.value.title;
				var contents = node.value.contents;
				var created_date = node.value.created_date;
				var box_obj = that.data.scrollObj.box_obj;
				
				var cur_id = annotation_id + "," + user_id + "," + title + "," + contents;
				
				html += " <tr data-id='"+cur_id+"'> ";
				if(box_obj[cur_id] != undefined){
					html += "   <td><div class='checkBox selected'></div></td>";
				} else {
					html += "   <td><div class='checkBox'></div></td>";
				}
				html += " 	<td>"+annotation_id+"</td> ";
				html += " 	<td>"+user_id+"</td> ";
				html += " 	<td>"+title+"</td> ";
				html += " 	<td>"+contents+"</td> ";
				html += " 	<td>"+moment(created_date).format("YYYY-MM-DD")+"</td> ";
				html += " </tr> ";
				that.data.scrollObj.start_node = node;
				that.data.scrollObj.last_node = node;

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
		
		setNodeData : function(i,type){
			var that = this;
			var linked_list = that.data.scrollObj.linked_list;
			var image_half_size = that.data.scrollObj.image_half_size;
			var image_default_size = that.data.scrollObj.image_default_size;
			var image_remain_size = that.data.scrollObj.image_remain_size;
			var start_node = that.data.scrollObj.start_node;
			var last_node = that.data.scrollObj.last_node;
			var tr_size = that.pt.find("tbody tr").length;
			if(type == "down"){
				
				if(i>=image_half_size && last_node.next != null){
// 					console.log(i, tr_size , "down normal");
		
					that.data.scrollObj.isImageScroll_top = false;
					if(tr_size != image_half_size){
						that.removeTableBox((tr_size - image_default_size), type);
					} else {
						that.removeTableBox((tr_size - image_half_size), type);
					}
					that.data.scrollObj.image_remain_size = 0;
					that.setStartAndLastNode();	
				} else {
					that.data.scrollObj.image_remain_size = i;
					that.data.scrollObj.isImageScroll_end =  true;
// 					console.log(i, tr_size, "down end");
				}

			} else {
				
				if(i>=image_half_size && start_node.prev != null){
					that.data.scrollObj.isImageScroll_end = false;
					that.removeTableBox((image_half_size + image_remain_size), type);
					that.setStartAndLastNode();	
					that.data.scrollObj.image_remain_size = 0;
// 					console.log(i, tr_size, "up normal");
				} else {
					if(tr_size != image_half_size){
						that.removeTableBox((i + image_remain_size), type);
						that.data.scrollObj.image_remain_size = 0;
					}
					that.data.scrollObj.isImageScroll_top =  true;
					that.data.scrollObj.last_node = linked_list.obj[that.pt.find("tbody tr").last().data("id")];
					
// 					console.log(i, tr_size, "up end");
				}
			}
		},
		
		//annotation 스크롤리스너
		setAnnotationListScrollListener : function(){
			let that = this;
			that.pt.find(".table_body").off("scroll").on("scroll",function(){	
				var isImageScroll = that.data.scrollObj.isImageScroll;
				var isImageScroll_top = that.data.scrollObj.isImageScroll_top;
				var isImageScroll_end = that.data.scrollObj.isImageScroll_end;
				var start_node = that.data.scrollObj.start_node;
				var last_node = that.data.scrollObj.last_node;
				var target = $(this);
				var st = target.scrollTop();
				
				if (st + target.innerHeight() >= target[0].scrollHeight && !isImageScroll && !isImageScroll_end && last_node.next != null){
					that.data.scrollObj.isImageScroll = true;
					that.data.scrollObj.isImageScroll_top = false;
					that.addAnnotationList(last_node.next,"down");	
					
				} else if (st == 0 && !isImageScroll && !isImageScroll_top && start_node.prev != null){
					that.data.scrollObj.isImageScroll = true;
					that.data.scrollObj.isImageScroll_end = false;
					that.addAnnotationList(start_node.prev,"up");
						
				}
			});
		},
		
		// 스크롤시 row 삭제
		removeTableBox : function(size,type){
			let that = this;

			if(type == "down"){
				that.pt.find("tbody tr").slice(0,size).remove();					
			} else {		
				that.pt.find("tbody tr").slice(-size).remove();
			}
			that.pt.find(".table_body").scrollTop((that.pt.find(".table_body")[0].scrollHeight - that.pt.find(".table_body").height()) / 2);

		},
		
		//annotation 리스트 그릴때 필요한 이벤트 리스너
		annotationListener : function() {
			let that = this;
			
			that.pt.find("tbody td").off("click").on("click", function() {
				let text = $(this)[0].innerText;
				if(text == ""){return;}
				let id = $(this).parent().data("id").split(",")[0];
				annotation.detail(id);
			});

			that.pt.find("table thead tr .checkBox").off("click").on("click",function() {
				var linked_list = that.data.scrollObj.linked_list;
				var box_obj = that.data.scrollObj.box_obj;
				$(this).toggleClass("selected");
				
				if ($(this).hasClass("selected")) {
					that.pt.find("table tbody tr .checkBox").addClass("selected");
					let keys = Object.keys(linked_list.obj);
					for(let i = 0, len = keys.length; i<len; i++){
						if(box_obj[keys[i]] == undefined){
							that.data.scrollObj.box_obj[keys[i]] = keys[i];
						}
					}
				} else {
					that.pt.find("table tbody tr .checkBox").removeClass("selected");
					that.data.scrollObj.box_obj = {};
				}
			});
			
			that.pt.find("table tbody td").off("mouseenter").on("mouseenter",function(){
				let text = $(this)[0].innerText;
				if(text == "") {return;}				
				$(this).empty();
				$(this).append(text);
				that.addHoverBox($(this), text);
			});
			
			that.pt.find("table tbody td").off("mouseleave").on("mouseleave",function(){
				that.removeHoverBox($(this));
			});

			that.pt.find("table tbody tr .checkBox").off("click").on("click",function(){
				var linked_list = that.data.scrollObj.linked_list;
				var box_obj = that.data.scrollObj.box_obj;
				var id = $(this).parent().parent().data("id");
				$(this).toggleClass("selected");
				
				if($(this).hasClass("selected")){
					if(box_obj[id] == undefined){
						that.data.scrollObj.box_obj[id] = id;
					}
					if(linked_list.length == Object.keys(box_obj).length){
						that.pt.find("table thead tr .checkBox").addClass("selected");
					}
				} else {
					delete that.data.scrollObj.box_obj[id];
					that.pt.find("table thead tr .checkBox").removeClass("selected");
				}
				
			});
	
		},
		
		addHoverBox : function(elem,text){
			let that = this;

			if (elem[0].scrollWidth >  elem.innerWidth()) {
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
			   		x = left - text_width;
			   		
			   	} else {
			   		x = left + btn_width / 2;
			   	}
			   	
			   	if(bottom - text_height < 0){
		   			y = top - text_height;
		   		} else {
		   			y = top + btn_height / 2;
		   		}

			   	hover_box.css({"top":y+"px", "left":x+"px","position": "fixed","display" : "block"});
			}
		},
		
		removeHoverBox : function(elem){
			let that = this;
			elem.find(".hover_box").remove();
		},
		
		refresh : function(){
			let that = annotation;
			//이 노드는 0 번째 노드만불러옴 부모 노드가여러개 있으면 따로 설정해줘야함.. project_list 참조
			let node = wsObj[that.data.initObj.key].dir.getNodes()[0];
			wsObj[that.data.initObj.key].dir.removeChildNodes(node);
			that.getAnnotationList();
		},
		
		deleteAnnotation : function(id){
			console.log(id);
			let ajaxData = {
				annotation_id :  id	
			}
			
			let deffered = $.ajax({
				url : baseUrl + "annotation/deleteAnnotation.json",
				data : ajaxData,
				type : "POST",
				success : function(res){
					console.log("=====deleteAnnotation======", res);
					if(res.result.code == "3301"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} 
				},
				error : function(err){
					
				}
			});
			return deffered;
		},
	}
</script>
