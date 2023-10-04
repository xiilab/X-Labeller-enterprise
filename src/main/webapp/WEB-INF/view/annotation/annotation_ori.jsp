<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/header" flush="false" >
<jsp:param name= "cur_page" value="annotation"/>
</jsp:include>
<head>


<title>밀리터리 이미지넷 객체 라벨기</title>

<style>

.ztree .level0 span.button[id$=ico] { background: url("images/icon_tree_folder_normal.png") !important; }
		.ztree a.curSelectedNode.level0  span.button[id$=ico] { background: url("images/icon_tree_folder_white.png") !important; filter: saturate(200%) hue-rotate(145deg) !important;}
		.ztree .level1 span.button[id$=ico] { background: url("images/icon_tree_learningdata_normal.png") !important; }
		.ztree a.curSelectedNode.level1  span.button[id$=ico] { background: url("images/icon_tree_learningdata_white.png") !important; }


#annotation {min-height: calc(100% - 66px);}
#annotation .min_w1440 { position: absolute; height: 100%; }
#annotation .contents { height: 100%; }
#annotation .contents>div { height: 100%; }
#annotation .annotation_area {width: 100%; }
#annotation .annotation_area .section{ display: none; height: 100%; }
#annotation .annotation_area .section.selected{ display: block; }

.dragOver #main .main_wrap .drop_image {background-image : url('./images/img_dragdrop_white.png'); box-shadow: 0 6px 19px -7px rgba(25, 140, 255, 0.6); background-color: #81a8ff; border-color: #81a8ff;}
.dragOver #main .main_wrap .main_txt { color: #4c84ff;}
</style>

</head>
<body>
	<div class="container" id="annotation">
		<div class="min_w1440 min_h640">
			<div class="contents flex">
				<div class="">
					<jsp:include page="/workspace" flush="false" />
				</div>
				<div class="section_wrap annotation_area">
					<div class="section main">
						<jsp:include page="/annotation/main" flush="false" />
					</div>
					<div class="section upload">
						<jsp:include page="/annotation/upload" flush="false" />
					</div>
					<div class="section detail">
						<jsp:include page="/annotation/detail" flush="false" />
					</div>
					<div class="section list">
						<jsp:include page="/annotation/list" flush="false" />
					</div>
				</div>
			</div>
		</div>

	</div>

<%-- <script src="<c:url value="/js/fabric.min.js" />"></script> --%>
</body>


<script>
	$(document).on("sessionLoad", function() {
		if(!loginCheck()){
			alert("로그인 후 이용 가능합니다");
			location.href = baseUrl + "login";
		} else {
			$("#loader").show();
			createObject();
			workspace(obj);
			annotation.init();
		}

	});
	var obj;
	var hide_id;
	var parent_node;
	var annotation = {
		pt : $("#annotation"),
		init : function() {
			let that = annotation;
			that.defaultListener();
			that.setView();
			
		},
		
		defaultListener : function(){
			let that = annotation;
			$("input").off("input").on("input",function(e){
				//영문, 숫자, 특수문자
				if($(this).val().match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
					alert("영문과 특수문자 및 숫자만 입력 가능합니다");
				}					
				var str = $(this).val().replace(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/gi,"");					
// 				var str = $(this).val();
				if(str.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
					alert("영문과 특수문자 및 숫자만 입력 가능합니다");
					$(this).val(str.slice(0, -1));
				} else {
					$(this).val(str);	
				}
				
				if($(this).data("length") == 100 && $(this).val().length > 100){
					var string = $(this).val();
					alert("입력 가능한 텍스트 개수를 초과하였습니다\n중간에 입력하신 경우 기존 텍스트의 마지막 글자를 삭제합니다");
					$(this).val(string.slice(0,100));
					return false;
				} else if ($(this).data("length") == 200 && $(this).val().length > 200){
					var string = $(this).val();
					alert("입력 가능한 텍스트 개수를 초과하였습니다\n중간에 입력하신 경우 기존 텍스트의 마지막 글자를 삭제합니다");
					$(this).val(string.slice(0,200));
					return false;	
				}				
				return;
			});
		},

		setView : function() {
			let that = annotation;
			that.main();
			that.getAnnotationList();
		},
		
		main : function(){
			let that = annotation;
			that.hideView();
			that.addView($(".main"));
		},
		
		list : function() {
			let that = annotation;
			that.hideView();
			that.addView($(".list"))
			annotation_list.init();
		},

		upload : function() {
			let that = annotation;
			that.hideView();
			that.addView($(".upload"))
			annotation_upload.init();
		},

		detail : function(id) {
			let that = annotation;
			let detail_id;
			let label_type;
			let nodes = wsObj[obj.key].dir.getSelectedNodes();
			if(nodes.length != 1){
				alert("한 개의 Annotation만 선택해주세요");
				return false;
			}
			if(id == null){
				detail_id = wsObj[obj.key].dir.getSelectedNodes()[0].id;
				label_type = wsObj[obj.key].dir.getSelectedNodes()[0].labelType;
				console.log("wsObj[obj.key].dir.getSelectedNodes()[0]:: ", wsObj[obj.key].dir.getSelectedNodes()[0]);
			} else {
				detail_id = id;
			}

			that.hideView();
			that.addView($(".detail"))
			annotation_detail.init(detail_id, label_type);
		},
		
		del : function(){
			
			deArr = [];
			
			hide_id = "";
			
			let that = annotation;
			let nodes = wsObj[obj.key].dir.getSelectedNodes();
			let msg = "삭제하시겠습니까?";
			
			if(confirm(msg) == true){
				for(var i=0; i< nodes.length; i++){
					deArr.push(that.deleteAnnotation(nodes[i].id));
				}

				Promise.all(deArr).then(function(value){
					that.refresh();
					let arr = hide_id.split(",");
					for(let i=0;i<arr.length; i++){
						if(arr[i] == cur_id){
							that.hideView();
							that.main();
							break;
						}
					}

				},function (err){
					alert("다시 시도해주세요");
					console.log("Sync Error", err);
					that.refresh();
				});
			}

		},
		
		exports : function() {
			let that = annotation;
			let node = wsObj[obj.key].dir.getSelectedNodes()[0];
			let nodes = wsObj[obj.key].dir.getSelectedNodes();
			if(nodes.length != 1){
				alert("한 개의 Annotation만 선택해주세요");
				return false;
			}			
			let win = window.open(baseUrl + "annotation/exportAnnotation.json?id="+node.id);
			
		},
		
		refresh : function(){
			let that = annotation;
			let node = wsObj[obj.key].dir.getNodes()[0];
			wsObj[obj.key].dir.removeChildNodes(node);
			that.getAnnotationList();
		},
		
		deleteAnnotation : function(node_id){
			let that = annotation;
			let ajaxData = {
				id :  node_id	
			}
			
			if(hide_id == "" || hide_id == null){
				hide_id += ""+node_id;	
			} else {
				hide_id += ","+node_id;
			}
			
			$("#loader").show();
			let deffered = $.ajax({
				url : baseUrl + "annotation/deleteAnnotation.json",
				data : ajaxData,
				type : "POST",
				success : function(res){
					console.log("=====deleteAnnotation======", res);
					$("#loader").hide();
					if(res.result.code == "200"){
						alert("삭제가 완료되었습니다");
					} else if(res.result.code == "2001"){
							alert(res.result.data);
							location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}
				},
				error : function(err){
					$("#loader").hide();
				}
			});
			return deffered;
		},

		getRootList : function() {
			let that = annotation;
			let config = new Array();
			let data_obj = new Object();
			data_obj.id = 0;
			data_obj.pId = null;
			data_obj.name = " /";
			data_obj.type = "root";
			data_obj.isParent = true;
			data_obj.drag = false;
			data_obj.dropPrev = false;
			data_obj.dropNext = false;
			config.push(data_obj);

			wsObj[obj.key].addNode(null, config);
			$("#loader").hide();
		},

		getAnnotationList : function() {
			
			let parent_node = wsObj[obj.key].dir.getNodes()[0];
		
			let that = annotation;
			let data = {};
			let url = "annotation/getAnnotationList.json";
			that.getDataList(url, data, parent_node);
		},
		getDataList : function(url, ajaxData, parentNode) {
			let that = annotation;

			that.setProgressbarVisible(parentNode);
			$("#loader").show();
			$.ajax({
				url : baseUrl + url,
				data : ajaxData,
				success : function(res) {
					console.log("=====getDataList======", res);
					$("#loader").hide();
					if(res.result.code == "200"){
						if (res.annotationVO != undefined) {
							that.setAnnotationResult(res.result.data , parentNode);
						} else {
							alert(res.result.data);
						}

						that.setProgressbarGone(parentNode);						
					} else if(res.result.code == "2001"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}

				},
				error : function(err) {
					$("#loader").hide();
					that.setProgressbarGone(parentNode);
					console.log("ERROR!!", err);
				},
			});

		},

		setProgressbarGone : function(node) {
			if (node != null) {
				node.icon = "";
				wsObj[obj.key].dir.updateNode(node);
			}
		},

		setProgressbarVisible : function(node) {
			if (node != null) {
				node.icon = baseUrl + "css/img/loading.gif";
				wsObj[obj.key].dir.updateNode(node);
			}
		},

		setAnnotationResult : function(data, parentNode) {
			var config = new Array();
			$.each(data, function(index, value) {
				var obj = new Object();
				obj.id = value.id;
				obj.pId =  "0." + value.id;
				obj.name = value.title;
				obj.labelType  = value.label_type;

				obj.type = "annotation";
				obj.isParent = false;
				obj.drag = true;
				obj.dropPrev = false;
				obj.dropNext = false;
				config.push(obj);
			});

			wsObj[obj.key].addNode(parentNode, config);
		},

		addView : function(view) {
			view.addClass("selected");
		},

		hideView : function() {
			let that = annotation;
			$("#annotation .section_wrap .section").each(function() {
				$(this).removeClass("selected");
			});
		},
	}
	
	LinkedList.prototype.push = function(value,id) {
		
		 const newNode = new Node(value, null, this.tail);
		 if (this.tail) this.tail.next = newNode;
		 else this.head = newNode;
		 this.tail = newNode;
		 this.length += 1;
		 this.obj[id] = newNode;
		 
	};
	
	LinkedList.prototype.removeNode = function(removeNode) {
		let node = removeNode;
		this.length = this.length -1;
		prev = node.prev;
		next = node.next;

		if(prev != null){
			if(next != null){
				next.prev = prev;
			}
		} else{
			next.prev = null;
			if(next != null){
				this.head = next;	
			} else {
				this.head = null;
			}
			
		}
		
		if(next != null){
			if(prev != null){
				prev.next = next;
			}
		} else {
			prev.next = null;
			if(prev != null){
				this.tail = prev;	
			} else {
				this.tail = null;
			}
			
		}
	};
	
	function LinkedList(){
		this.head = null;
		this.tail = null;
		this.length = 0;
		this.obj = [];
	};
	
	function Node(value, next, prev){
		this.value = value;
		this.next = next;
		this.prev = prev;
	};

	var createObject = function() {
		
		let that = annotation;
		
		let arr = {};
		let arr2 = {};
		let result = [];

		arr["expandNode"] = that.getRootList
		arr["rMenu"] = {
			"View List" : that.list
		}

		arr2["expandNode"] = that.getAnnotationList
		arr2["drop"] = {
				"area" : "annotation_area",
				"onDrop" : that.detail
		}
		arr2["rMenu"] = {
			"Modify" : that.detail,
			"Export" : that.exports,
			"Delete" : that.del
		}

		result.push(arr);
		result.push(arr2);

		obj = {
			key : "annotation",
			info : result,
			create : that.upload
		}
	}
</script>
