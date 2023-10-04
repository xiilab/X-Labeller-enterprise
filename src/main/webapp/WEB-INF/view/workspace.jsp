<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
<title>밀리터리 이미지넷 객체 라벨기</title>

<link rel="stylesheet" href="<c:url value="/css/zTreeStyle.css" />">

<script src="<c:url value="/js/jquery.ztree.all.min.js" />"></script>

<style>
#workspace #dir_wrap .ztree li {
	overflow: hidden;
}

#workspace #dir_wrap .ztree li a {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<div class="w220" id="workspace">
		<div id="dir_wrap">
			<ul id="" class="ztree"></ul>
			<div id="rMenu">
				<ul>
				</ul>
			</div>
			<div class="btn_wrap flex">
				<div class="new_btn filter_color">새 프로젝트 업로드</div>
			</div>
		</div>
	</div>

</body>
<script>
	if (typeof (wsObj) !== "object") {
		var wsObj = new Object();
	}
	/*
	 * setting = {
	 key : zTree Id,
	 create : 새로만들기,
	 info : [{
	 expandNode : 노드 정보, 
	 drop : { area : 드롭위치, onDrop : 드롭이벤, }, 
	 rMenu : {우클릭 메뉴}, 
	 }]
	 };
	 */
	function workspace(setting) {
		
		console.log("SETTING : ", setting)
		 
		var ws = {
			pt : {},
			dir : {},
			info_arr : [],

			init : function() {
				var that = this;
				console.log("B that.dir::", that.dir);

				/*
					zTree 세
					참조 api : http://www.treejs.cn/v3/api.php
				 */
				var zSetting = {
					view : {
						showLine : false,
						addDiyDom : ws.addDiyDom,
						dblClickExpand : false, // 더블 클릭 했을때 expand/collapse 이벤트 실행 안되
					},
					edit : {
						drag : {
							prev : ws.drag.dropPrev,
							inner : ws.drag.dropInner,
							next : ws.drag.dropNext
						},
						enable : true,
						showRemoveBtn : false,
						showRenameBtn : false
					},
					data : {
						keep : {
							parent : true
						},
						simpleData : {
							enable : true,
							idKey : "id",
							pIdKey : "pId",
							rootPid : null
						}
					},
					callback : {
						onRightClick : ws.rMenu.rClick,
						onClick : ws.rMenu.onClick,
						beforeClick : ws.rMenu.beforeClick,
						onDragMove : ws.drag.onDragMove,
						beforeDrag : ws.drag.beforeDrag,
						beforeDragOpen : ws.drag.beforeDragOpen,
						onDrop : ws.drag.onDrop,
					}
				};
				var zPt;
				if (setting.pointer) {
					//console.log("setting.pointer : " + setting.pointer);
					that.pt = $("." + setting.pointer + " #workspace");
					zPt = $("." + setting.pointer + " .ztree");
				} else {
					that.pt = $("#workspace");
					zPt = $(".ztree");
				}
				//console.log("zSetting::", zSetting);
				that.pt.find(".ztree").attr("id", setting.key);
				console.log("setting.key::", setting.key);
				that.dir = $.fn.zTree.init(zPt, zSetting); //zTree 실행
				console.log("A that.dir::", that.dir);
				/* console.log("dir : ", that.dir['addNodes']); */

				//console.log("setting.info::", setting.info);
				that.info_arr = setting.info;
				that.expandNode();

				//console.log("setting.create::", setting.create);

				that.create(setting.create);
			},

			//새로만들기
			create : function(inputValue) {
				var that = this;

				//console.log("inputValue::",inputValue);
				if (inputValue) {
					that.pt.find(".btn_wrap .new_btn").off("click").on("click",
							function() {
								inputValue();
							})
				} else {
					that.pt.find(".btn_wrap").hide();
				}
			},

			//ztree 디자인 변경
			addDiyDom : function(treeId, treeNode) {
				var that = ws;

				//console.log("stauts : " + treeNode.status); */
				var spaceWidth = 18;
				//console.log("treeNode.tId::",treeNode.tId);
				var switchObj = that.pt.find("#" + treeNode.tId + "_switch");
				var nodeName = that.pt.find("#" + treeNode.tId + "_span");
				icoObj = that.pt.find("#" + treeNode.tId + "_ico");
				//console.log("icoObj", icoObj);
				icoObj.addClass("filter_color");
				switchObj.remove();
				icoObj.before(switchObj);
				/* icoObj.after("<h1>qqq</h1>"); */
				let html = '';
				//annotation_icoObj.addClass("filter_color")
				if (treeNode.status != (undefined || null)) {
					if (treeNode.status == '1') {
						html += "<span id='" + treeNode.tId + "_loading' class='upload_complete'></span>";
					} else if (treeNode.status == '2' || '3') {
						html += "<span id='" + treeNode.tId + "_loading' class='upload_wait'></span>";
					}
					nodeName.after(html);
				}
				if (treeNode.level > 0) {
					var spaceStr = "<span style='display: inline-block;width:"
							+ (spaceWidth * treeNode.level) + "px'></span>";
					switchObj.before(spaceStr);
				}
			},

			//노드 추가
			addNode : function(pNode, config) {
				var that = this;
				
				// console.log("### addNode : ", this)
				//console.log("config::", config);
				that.dir.addNodes(pNode, config);

				var nodes;
				if (pNode === null) {
					nodes = that.dir.getNodesByParam("parentTId", null);
// 					console.log("nodes15 :", nodes);
				} else {
					nodes = that.dir.getNodesByParam("parentTId", pNode["tId"]);
// 					console.log("nodes16 : ", nodes);
				}
				

				// 트리에서 + : 클릭, 폴더 : 더블클릭 => 폴더 열기 
				that.pt.find(".switch").off("click").on("click", function() {
					
					$(this).next().trigger("click");
// 					$(this).addClass("filter_color");
					console.log("### switch Click", $(this));
					that.expandNode(this);
				});
				
				// 리스트 두번씩 클릭했을 때
				// 임시 주석 
				/* that.pt.find("a").off("dblclick").on("dblclick", function() {
					
					// 기존에 더블클릭시, 하위노드가 펼쳐졌음 
					//console.log("click!");
					$(this).find('#' + temp).addClass("filter_color");
					that.pt.find("span:last-child").removeClass("filter_color");
					$(this).find("span:last-child").addClass("filter_color");
					that.expandNode();
					
				}); */
				
				that.pt.find(".ztree li a").on("mouseover", function() {
					$(this).addClass("hover");
					//$(this).addClass("filter_color");
				});
				
				that.pt.find(".ztree li a").on("mouseout", function() {
					$(this).removeClass("hover");
					//$(this).removeClass("filter_color");
				});
			},

			//노드 확장/축소 (노드 열기/닫기)
			expandNode : function(e) {
				
				var that = this;
				var node = that.dir.getSelectedNodes()[0];
				that.dir.removeChildNodes(node);
				
				// console.log("### expandNode ::", node);

				if (!node) {
					//선택된 노드가 없을때 => 처음 실행했을때
					that.info_arr[0].expandNode();
					
				} else if (node.level == that.info_arr.length - 1) {
					// 선택한 노드가 최종노드일 때
// 					console.log("--- Children Node None")
					return;
					
				} else {
					
					if (!that.pt.find('#' + node.tId + '_ico').hasClass("ico_open") && that.info_arr[node.level].expandNode) {
// 						console.log("--- Expand Node ")
						that.info_arr[node.level + 1].expandNode();
					} else {
// 						console.log("--- Collapse Node : ")
						that.pt.find('#' + node.tId + '_ico').removeClass("ico_open");
						that.pt.find('#' + node.tId + '_ico').addClass("ico_close");
						that.pt.find('#' + node.tId + '_switch').removeClass("noline_open");
						that.pt.find('#' + node.tId + '_switch').addClass("noline_close");

					}
				}

			},

			rMenu : {
				startNode : {},
				selectedNodes : [],
				clickFlag : true,

				beforeClick : function(treeId, treeNode) {
					var that = ws;

					that.rMenu.selectedNodes = that.dir.getSelectedNodes();
					return true;
				},

				onClick : function(event, treeId, treeNode) {
					
					var that = ws;

					var nodes = that.dir.getSelectedNodes()

					console.log("### rMenu onClick");
					console.log("--- event : ", event);
					console.log("--- nodes : ", nodes);
					console.log("--- shiftKey : ", event.shiftKey);

					//shiftKey
					if (event.shiftKey) {
						that.rMenu.shiftKey(event, treeId, treeNode, nodes);
					} else {
						that.rMenu.clickFlag = true;
						if (event.ctrlKey || event.metaKey) {
							
							if (nodes.length > 0 && nodes[0].parentTId != nodes[nodes.length - 1].parentTId) {
								that.dir.selectNode(treeNode);
							}
						}
						that.rMenu.startNode = nodes[nodes.length - 1];
					}
				
					// military 20221125
					// 1. 해당 노드 클릭시 expand/collapse 이벤트 발생
					that.expandNode();
					
					// 2. drop 이벤트 연동
					var node = that.dir.getSelectedNodes()[0];
					var drop = that.info_arr[node.level].drop;
					
					if(!drop) { return false }
					
					$("." + drop.area).removeClass("dragOver");
					
					if ($("." + drop.area).length > 0) {
						drop.onDrop();
				 
					} 
					
				},

				//같은 레벨 노드 연속 선택
				shiftKey : function(event, treeId, treeNode, nodes) {
					var that = ws;
					var startNode = that.rMenu.startNode;

					if (!startNode.id || !treeNode || treeNode === startNode) {
						that.rMenu.startNode = nodes[nodes.length - 1];
						return;
					}
					var startPath = startNode.getPath();
					var endPath = treeNode.getPath();
					var i, t, needSwitch = null;
					if (startPath.length !== endPath.length
							|| startPath[startPath.length - 1].pId !== endPath[endPath.length - 1].pId) {
						that.dir.selectNode(treeNode);
						return;
					}
					for (i = 0; i < startPath.length && i < endPath.length; i++) {
						if (startPath[i] === endPath[i]) {
							continue;
						}
						needSwitch = startPath[i].getIndex() > endPath[i]
								.getIndex();
						break;
					}
					if (needSwitch === null) {
						needSwitch = startPath.length > endPath.length;
					}
					if (needSwitch) {
						t = treeNode;
						treeNode = startNode;
						startNode = t;
					}
					var treeObj = that.dir;
					var n = startNode;
					if (that.rMenu.clickFlag) {
						for (var j = 0; j < that.rMenu.selectedNodes.length; j++) {
							treeObj.selectNode(that.rMenu.selectedNodes[j],
									true);
						}
					}
					while (n) {
						treeObj.selectNode(n, true, true);
						if (n === treeNode) {
							break;
						}
						if (!n.isLastNode) {
							n = n.getNextNode();
						}
					}
					that.rMenu.clickFlag = false;
				},

				//우클릭이벤트
				rClick : function(event, treeId, treeNode) {
					
					console.log("### rMenu rClick : ", event, treeId, treeNode);
					
					var that = ws;

					if (!treeNode
							&& event.target.tagName.toLowerCase() != "button"
							&& $(event.target).parents("a").length == 0) {
						that.dir.cancelSelectedNode();
					} else {
						var flag = false;
						var selectedNodes = that.dir.getSelectedNodes();
						for (var i = 0; i < selectedNodes.length; i++) {
							if (selectedNodes[i] == treeNode) {
								flag = true;
								break;
							}
						}
						if (!flag) {
							that.dir.selectNode(treeNode);
						}

						var node = that.dir.getSelectedNodes()[0];
						if (that.info_arr[node.level].rMenu) {
							//우클릭메뉴 그리기
							that.rMenu.drawMenu();
							that.rMenu.showRMenu(event.clientX, event.clientY);
						}
					}
				},

				//우클릭메뉴 그리기
				drawMenu : function() {
					var that = ws;
					that.pt.find("#rMenu ul").empty();

					var node = that.dir.getSelectedNodes()[0];
					var rMenu_item = Object
							.keys(that.info_arr[node.level].rMenu);
					for (var i = 0; i < rMenu_item.length; i++) {
						var html = "<li class='"+rMenu_item[i]+"'>"
								+ rMenu_item[i];

						if (typeof (that.info_arr[node.level].rMenu[rMenu_item[i]]) == "object") {
							html += "<div class='ar'>▶︎</div>";
						}

						html += "</li>";
						that.pt.find("#rMenu ul").append(html);
					}

					// 우클릭 해서 생성된 메뉴를 클릭했을 때
					that.pt.find("#rMenu ul li").on("click", function() {
						
						var upper = that.info_arr[node.level].rMenu[this.className];
						if (typeof (upper) == "object") {
							return;
						} else if (typeof (upper) == "function") {
							upper();
						}

						that.pt.find("#rMenu").css({"display" : "none"});
					});

					//하위메뉴
					that.pt.find("#rMenu ul li").on("mouseenter",function() {
						
						that.pt.find(".lower").remove();
						var upper = that.info_arr[node.level].rMenu[this.className];
						console.log("this.className : "+ this.className);
						
						if (typeof (upper) == "object") {
							
							var html = "<ul class='lower' id="+this.className+">";
							var upperKey = Object.keys(upper);
							for (var i = 0; i < upperKey.length; i++) {
								html += "<li class='"+upperKey[i]+"'>"
										+ upperKey[i] + "</li>";
							}
							html += "</ul>";

							that.pt.find("#rMenu").after(html);

							var top = $(this).offset().top
									- that.pt.find("#dir_wrap")
											.offset().top;
							var left = $(this).offset().left
									+ (this.offsetWidth + 1)
									- that.pt.find("#dir_wrap")
											.offset().left;
							that.pt.find(
									".lower#" + this.className)
									.css({
										"top" : top + "px",
										"left" : left + "px"
									});

							that.pt.find(".lower li").on("click",function() {
								var parentId = this.parentNode.id;
								that.info_arr[node.level].rMenu[parentId][this.className]
										();

								that.pt
										.find(
												".lower")
										.remove();
								that.pt
										.find(
												"#rMenu")
										.css(
												{
													"display" : "none"
												});
								$("body")
										.off(
												"mousedown",
												that.rMenu.onBodyMouseDown);
							});
							
						}
					});
				},
				//우클릭 메뉴 show
				showRMenu : function(x, y) {
					var that = ws;

					$.each(wsObj, function(index, value) {
						value.pt.find("#rMenu").hide();
					})
					that.pt.find("#rMenu").show();

					y -= $(that.pt).find("#dir_wrap").offset().top;
					x -= $(that.pt).find("#dir_wrap").offset().left;
					that.pt.find("#rMenu").css({
						"top" : y + "px",
						"left" : x + "px",
						"display" : "block"
					});

					$("body").on("mousedown", that.rMenu.onBodyMouseDown);
				},
				//우클릭 메뉴 hide
				onBodyMouseDown : function(event) {
					var that = ws

					if (event.target.id == "rMenu"
							|| $(event.target).parents("#rMenu").length > 0) {
						return;
					} else if (event.target.id == "lower"
							|| $(event.target).parents(".lower").length > 0) {
						return;
					} else {
						that.pt.find(".lower").remove();
						$.each(wsObj, function(index, value) {
							value.pt.find("#rMenu").hide();
						})
					}
				},
			},

			//드래그 이벤트
			drag : {
				onDrop : function(event) {
					
					console.log("### DRAG onDrop : ", $(event.target))
					var that = ws;

					var node = that.dir.getSelectedNodes()[0];
					var drop = that.info_arr[node.level].drop
					if (!drop) {
						return false;
					}

					$("." + drop.area).removeClass("dragOver");
					if ($(event.target).hasClass(drop.area)
							|| $(event.target).parents("." + drop.area).length > 0) {
						drop.onDrop();

					} else if ($(event.target).parents(".ztree").length > 0
							&& (event.target.tagName.toLowerCase() == "a" || $(
									event.target).parents("a").length > 0)) {

						//dropInner함수 없을
						if (!that.info_arr[node.level].drop.dropInner) {
							return false;
						}

						that.info_arr[node.level].drop.dropInner();

					} else {
						return;
					}
				},

				onDragMove : function(event, treeId, treeNodes) {
					
					console.log("### DRAG onDragMove : ", $(event.target))
					var that = ws;

					var node = that.dir.getSelectedNodes()[0];
					var drop = that.info_arr[node.level].drop
					if ($(event.target).hasClass(drop.area)) {
						$(event.target).addClass("dragOver");
					} else if ($(event.target).parents("." + drop.area).length > 0) {
						$(event.target).parents("." + drop.area).addClass("dragOver");
					} else {
						$("." + drop.area).removeClass("dragOver");
					}
				},

				dropInner : function(treeId, nodes, targetNode) {
					
					console.log("### DRAG dropInner : ", )
					var that = ws;

					for (var i = 0; i < nodes.length; i++) {
						if (targetNode == null) {
							return false;
						} else if (targetNode && nodes[i].nodeMove === false) {
							return false;
						} else {
							if (nodes[i].level != targetNode.level + 1) {
								return false;
							}
						}
					}

					return true;
				},

				dropPrev : function(treeId, nodes, targetNode) {
					var that = this;

				},

				dropNext : function(treeId, nodes, targetNode) {
					var that = this;

				},

				curDragNodes : new Object(),
				autoExpandNode : new Object(),
				beforeDrag : function(treeId, treeNodes) {
					var that = this;
					for (var i = 0, l = treeNodes.length; i < l; i++) {
						if (treeNodes[i].drag === false) {
							that.curDragNodes = null;
							return false;
						} else if (treeNodes[i].parentTId
								&& treeNodes[i].getParentNode().childDrag === false) {
							that.curDragNodes = null;
							return false;
						}
					}
					that.curDragNodes = treeNodes;
					return true;
				},
				beforeDragOpen : function(treeId, treeNode) {
					var that = this;
					that.autoExpandNode = treeNode;
					return true;
				},

			},
		};

		wsObj[setting.key] = ws;

		wsObj[setting.key].init();

	};
</script>
