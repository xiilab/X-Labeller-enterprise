<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <jsp:include page="/header" flush="false" /> --%>

<head>

<title>X-labeller</title>

<style>


.section_wrap {background-color: #fff;}
#project_list {width: 100%; height:100%;}

#project_list .contents {height: 100%; position:relative;}
#project_list .contents .title_wrap {padding-top: 23px;}
#project_list .contents .title_wrap span {font-family: Open_Sans; font-size: 12px; font-weight: 400; color: #343434;}

#project_list .contents .title_wrap .list_total {float: right; }

#project_list .contents .list_wrap {margin-top: 21px; height: calc(100% - 62px); position:relative;}
#project_list .contents .btn_wrap {position: absolute; bottom: 0; margin-bottom: 41px;}
#project_list .contents .btn_wrap .del_btn {padding: 0 ; position:relative; font-family: Open_Sans; font-size: 12px; font-weight: 300; color: #343434;width: 68px; height: 28px; background-color: #f8f8f8;}

#project_list .table_body{max-height: calc(100% - 149px); overflow-y: overlay; overflow-x:hidden; }

#project_list .hover_box {border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
#project_list .hover_box div {font-family: NotoSansKR; font-size: 13px; color: #555555;}
#project_list .hover_div div {word-break: break-word; margin: 2px 5px; white-space: normal; font-weight: 300; font-family: Open_Sans;}
#project_list .hover_div {max-width: 264px; text-align: left; position: relative; }
#project_list .hover_box {max-width: 264px; text-align: left; }

#project_list .empty_wrap {text-align: center; margin-top: 170px; }
#project_list .empty_wrap .no_image {margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; }
#project_list .empty_wrap .eng_text {font-family: Open_Sans; margin-bottom: 3px; font-size: 16px; font-weight: 300; color: #777777;}
#project_list .empty_wrap .kor_text {font-family: Open_Sans; font-size: 12px; color: #777777;  font-weight: 200;}
#project_list .no_image {height: 37px; background-image: url('./images/icon_nodata_list.png'); }

</style>

</head>
<body>

	<div class="container" id="project_list">

		<div class="contents">
			<div class="ms filter_color">
				<div class="title_wrap">
					<span>TASK LIST</span>
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
	
// 	var cur_id;										// jh.sa 210223 cur_id => that.data.project_id
// 	var cur_node;									// jh.sa 210223 cur_node => that.data.cur_node
	
	//스크롤
// 	var image_default_size = 40;					// jh.sa 210223 image_default_size => that.data.scrollObj.image_default_size
// 	var image_arr = [];								// jh.sa 210223 image_arr => that.data.scrollObj.image_arr 사용 안함
// 	var image_obj = {};								// jh.sa 210223 image_obj => that.data.scrollObj.image_obj 사용 안함
// 	var image_half_size = (image_default_size / 2);	// jh.sa 210223 image_half_size => that.data.scrollObj.image_half_size
// 	var removed_size = 0;							// jh.sa 210223 removed_size => that.data.scrollObj.removed_size 사용 안함 
// 	var linked_list = null; 						// jh.sa 210223 linked_list => that.data.scrollObj.linked_list
// 	var last_node;									// jh.sa 210223 last_node => that.data.scrollObj.last_node
// 	var start_node;									// jh.sa 210223 start_node => that.data.scrollObj.start_node
// 	var image_remain_size;							// jh.sa 210223 image_remain_size => that.data.scrollObj.image_remain_size
// 	var isImageScroll_top = false;					// jh.sa 210223 isImageScroll_top => that.data.scrollObj.isImageScroll_top
// 	var isImageScroll_end = false;					// jh.sa 210223 isImageScroll_end => that.data.scrollObj.isImageScroll_end
// 	var isImageScroll = false;						// jh.sa 210223 isImageScroll => that.data.scrollObj.isImageScroll
// 	var isInit = false;								// jh.sa 210223 isInit => that.data.scrollObj.isInit 사용 안함
// 	var task_box_obj = {};							// jh.sa 210223 task_box_obj => that.data.scrollObj.task_box_obj
	
	var project_list = {
		pt : $("#project_list"),
		data : {
			project_id : null,
			cur_node : null,
			scrollObj : {
				linked_list : null,
				start_node : null,
				last_node : null,
				image_remain_size : null,
				image_default_size : 40,
// 				image_arr : [],
// 				image_obj : {},
				image_half_size : (40 / 2),
// 				removed_size : 0,
				isImageScroll_top : false,
				isImageScroll_end : false,
				isImageScroll : false,
// 				isInit : false,
				task_box_obj : {},
			},
		},
		init : function(id,node) {
			var that = this;
			console.log("init");
			that.data.project_id = id;
			that.data.cur_node = node;
			that.resetView();
			that.defaultListener();
			that.getTaskList();		
		},
		
		addEmptyData : function(elem, data1, data2){
			var that = this;
			elem.append("<div class='empty_wrap'><div class='no_image'></div><div class='eng_text'>"+data1+"</div><div class='kor_text'>"+data2+"</div></div>")
		},
		
		removeEmptyData : function(elem){
			var that = this;
			elem.find(".empty_wrap").remove();
		},
		
		resetView : function(){
			var that = this;
			that.pt.find(".table_body").off("scroll");
			that.pt.find(".empty_wrap").remove();
			that.pt.find("thead tr .checkBox").removeClass("selected");
			that.pt.find("tbody tr .checkBox").removeClass("selected");
			that.pt.find(".list_total").text("Total 0");
		},
		
		refresh : function(){
			var that = this;
			var cur_node = that.data.cur_node;
			trainer.refreshTask(cur_node);
		},
		
		
		defaultListener : function(){
			var that = project_list;
			var cur_id = that.data.project_id;
			var cur_node = that.data.cur_node;
			
			that.pt.find(".btn_wrap .del_btn").off("click").on("click",function(){
				var deArr = [];
				var nodes = that.pt.find(".checkBox.selected");
				var task_box_obj = that.data.scrollObj.task_box_obj;
				let msg = "삭제하시겠습니까?";
				
				
				if(confirm(msg)){
					
					let keys = Object.keys(task_box_obj);
					for(let i = 0, len = keys.length; i<len; i++){
						let id = keys[i].split(",")[0];
						if(id == "1" || id == "2"){
							alert("기본으로 제공되는 Task는 삭제할 수 없습니다");
							return false;
						}
						deArr.push(that.deleteTask(id));
					}
					Promise.all(deArr).then(function(){
						if(deArr.length==0){
							alert("선택된 데이터가 없습니다");
							return false;
						}
						that.init(cur_id,cur_node);
						that.refresh();
					},function (err){
						alert("다시 시도해주세요");
						console.log("Sync Error", err);
						that.getTaskList();
					});
				}
			});
			
		},
		
		setStartAndLastNode : function(){
			var that = this;
			var linked_list = that.data.scrollObj.linked_list;
			if(linked_list != null){
				that.data.scrollObj.last_node = linked_list.obj[that.pt.find("tbody tr").last().data("id")];
				that.data.scrollObj.start_node = linked_list.obj[that.pt.find("tbody tr").first().data("id")];
			}
		},
		
		getTaskList: function(){
			var that = this;
			var cur_id = that.data.project_id;
			var ajaxData = {
					project_id : cur_id
				}
			$("#loader").show();
				$.ajax({
					url : baseUrl + "task/getTaskList.json",
					data : ajaxData,
					type : "POST",
					success : function(res) {
						$("#loader").hide();
						console.log("=====getTaskList=====", res);
						if (res.result.code == "200") {
							that.modifyTaskListData(res.result.data);
						} else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
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
		
		resetTaskListData : function(){
			var that = this;
			
			that.resetView();
			that.data.scrollObj.linked_list = new LinkedList();
			that.data.scrollObj.image_remain_size = 0;
			that.data.scrollObj.isImageScroll_top = false;
			that.data.scrollObj.isImageScroll_end = false;
			that.data.scrollObj.isImageScroll = false;
// 			that.data.scrollObj.image_arr = [];
// 			that.data.scrollObj.image_obj = {};
			that.data.scrollObj.task_box_obj = {};
    		
		},
		
		modifyTaskListData : function(data){
			var that = this;
			that.resetTaskListData();
			that.pt.find("tbody").html("");
			that.pt.find(".table_body").scrollTop(0);
			
			if(data.length == 0){
				that.pt.find(".del_btn").hide();
				that.addEmptyData(that.pt.find(".list_wrap"), "No Data","you have not added any data yet");
				alert("Task가 존재하지 않습니다\nTask를 추가해주세요");
				trainer.pt.find("div.section").removeClass("selected");
				var nodes = wsObj["trainer"].dir.getSelectedNodes();
				var node = ".section.project_upload";
				trainer.pt.find(node).addClass("selected");
				project_upload.init(nodes[0]);
				return false;
				
			} else {
				that.pt.find(".del_btn").show();
			}
			
			//test
// 			for(var y = 0; y<100; y++){
// 				for(let i = 0, len = data.length; i<len; i++){
// 	    			let sp = data[i];
// 	    			let id = sp.id+i+y + "," + sp.user_id + "," + sp.title + "," + sp.contents;
// 	    			linked_list.push({ "id" : sp.id+i+y, "user_id" : sp.user_id, "title" : sp.title, "contents" : sp.contents, "created_date" : sp.created_date}, id);
// 	    		}
// 			}
			
			for(let i = 0, len = data.length; i<len; i++){
    			let sp = data[i];
    			let id = sp.task_id + "," + sp.user_id + "," + sp.title + "," + sp.contents;
    			that.data.scrollObj.linked_list.push({ "task_id" : sp.task_id, "user_id" : sp.user_id, "title" : sp.title, "contents" : sp.contents, "created_data" : sp.created_date }, id);
    		}
			
			
			that.pt.find(".list_total").text("Total " + that.data.scrollObj.linked_list.length);
			that.initTaskList();
		},
		
		initTaskList : function(){
			var that = this;
			var linked_list = that.data.scrollObj.linked_list;
			var node = that.data.scrollObj.linked_list.head;
			var image_default_size = that.data.scrollObj.image_default_size;
			that.data.scrollObj.start_node = node;
			that.loopTaskList(image_default_size, node, "down",true);
			that.taskListener();
			
			if(linked_list.length > image_default_size){
				that.data.scrollObj.isImageScroll_top = true;
				that.setTaskListScrollListener();
			} else {
				that.data.scrollObj.isImageScroll_end = true;
			}
		},
	
		loopTaskList : function(size, node, type, isInit){
			var that = this;
			var temp_node = node;
			var task_box_obj = that.data.scrollObj.task_box_obj;
			var target = that.pt.find("table tbody");	
			var i = 0;
			
			while(node){
				if(i>=size){break;}
				
				let html = ""
				i++;
				
				let id = node.value.task_id;
				let user_id = node.value.user_id;
				let title = node.value.title;
				let contents = node.value.contents;
				let created_date = node.value.created_date;
				
				let cur_id = id + "," + user_id + "," + title + "," + contents;
				
				html += " <tr data-id='"+cur_id+"'> ";
				if(task_box_obj[cur_id] != undefined){
					html += "   <td><div class='checkBox selected'></div></td>";
				} else {
					html += "   <td><div class='checkBox'></div></td>";
				}
				html += " 	<td>"+id+"</td> ";
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
		
		addTaskList : function(node,type){
			var that = this;
			var image_half_size = that.data.scrollObj.image_half_size;
			
			that.loopTaskList(image_half_size, node, type, false);
			that.data.scrollObj.isImageScroll = false;
			that.taskListener();
		},
		
		setNodeData : function(i,type){
			var that = this;
			var linked_list = that.data.scrollObj.linked_list;
			var image_default_size = that.data.scrollObj.image_default_size;
			var image_half_size = that.data.scrollObj.image_half_size;
			var start_node = that.data.scrollObj.start_node;
			var last_node = that.data.scrollObj.last_node;
			
			let tr_size = that.pt.find("tbody tr").length;
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
		
		setTaskListScrollListener : function(){
			var that = this;
			var isImageScroll = that.data.scrollObj.isImageScroll;
			var isImageScroll_top = that.data.scrollObj.isImageScroll_top;
			var isImageScroll_end = that.data.scrollObj.isImageScroll_end;
			var start_node = that.data.scrollObj.start_node;
			var last_node = that.data.scrollObj.last_node;
			
			that.pt.find(".table_body").off("scroll").on("scroll",function(){
    			
				let target = $(this);
				let st = target.scrollTop();
				
				let box_size = that.pt.find("tbody tr").length;
				
				if (st + target.innerHeight() >= target[0].scrollHeight && !isImageScroll){
					// 제일 아래,.
					if(!isImageScroll_end){
						if(last_node.next != null) {
							that.data.scrollObj.isImageScroll = true;
							that.data.scrollObj.isImageScroll_top = false;
							that.addTaskList(last_node.next,"down");	
						} 
					}
				} else if (st == 0 && !isImageScroll){
					if(!isImageScroll_top){
						if(start_node.prev != null){
							that.data.scrollObj.isImageScroll = true;
							that.data.scrollObj.isImageScroll_end = false;
							that.addTaskList(start_node.prev,"up");
						}
					}
				}
			});
		},
		
		removeTableBox : function(size,type){
			var that = this;

			if(type == "down"){
				that.pt.find("tbody tr").slice(0,size).remove();					
			} else {		
				that.pt.find("tbody tr").slice(-size).remove();
			}
			that.pt.find(".table_body").scrollTop((that.pt.find(".table_body")[0].scrollHeight - that.pt.find(".table_body").height()) / 2);

		},
		
		deleteTask : function(id){
			var that = this;
			
			console.log(id);
			let ajaxData = {
				task_id :  id	
			}
			
			let deffered = $.ajax({
				url : baseUrl + "task/deleteTask.json",
				data : ajaxData,
				type : "POST",
				success : function(res){
					console.log("=====deleteTask======", res);
					if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}
				},
				error : function(err){
					alert(err);
				}
			});
			return deffered;
		},
		
		taskListener : function(){
			var that = this;
			
			that.pt.find("table tbody td").off("click").on("click", function(){
				if(this.children.length){ return false; }
				let id = $(this).parent().data("id");
				let sp = id.split(",");
				var isTaskList = true;
				trainer.detail(sp[0],isTaskList);
			});
			
			
			//전체 선택
			that.pt.find("table thead tr .checkBox").off("click").on("click",function() {
				var task_box_obj = that.data.scrollObj.task_box_obj;
				$(this).toggleClass("selected");

				if ($(this).hasClass("selected")) {
					var linked_list = that.data.scrollObj.linked_list;
					that.pt.find("table tbody tr .checkBox").addClass("selected");
					var keys = Object.keys(linked_list.obj);
					for(let i = 0, len = keys.length; i<len; i++){
						that.data.scrollObj.task_box_obj[keys[i]] = keys[i];
					}
					
				} else {
					that.pt.find("table tbody tr .checkBox").removeClass("selected");
					that.data.scrollObj.task_box_obj = {};
				}
			});
			
			that.pt.find("table tbody td").off("mouseenter").on("mouseenter",function(){
				let text = $(this)[0].innerText;
				if(text == "") {return false;}	
				$(this).empty();
				$(this).append(text);
				that.addHoverBox($(this), text);
			});
			
			that.pt.find("table tbody td").off("mouseleave").on("mouseleave",function(){
				that.removeHoverBox($(this));
			});
			
			that.pt.find("table tbody tr .checkBox").off("click").on("click",function(){
				var task_box_obj = that.data.scrollObj.task_box_obj;
				var id = $(this).parent().parent().data("id");
				var linked_list = that.data.scrollObj.linked_list;
				$(this).toggleClass("selected");
				if($(this).hasClass("selected")){
					if(task_box_obj[id] == undefined){
						that.data.scrollObj.task_box_obj[id] = id;
					}
					if(linked_list.length == Object.keys(task_box_obj).length){
						that.pt.find("table thead tr .checkBox").addClass("selected");	
					}
				} else {
					delete that.data.scrollObj.task_box_obj[id];
					that.pt.find("table thead tr .checkBox").removeClass("selected");
				}
			});		
		},
		
		addHoverBox : function(elem,text){
			var that = this;

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
			var that = this;
			elem.find(".hover_box").remove();
		},
	}
	
	

</script>
