<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/header" flush="false" >
	<jsp:param name= "cur_page" value="algorithm"/>
</jsp:include>
<head>

	<title>X-labeller</title>
	
	<style>
		#main { height: 100%; width: 100%;  position: relative;}
		#main .content {height: 100%;}
		#main .main_wrap {text-align: center; margin: auto; display: block;}
		#main .main_wrap .drop_image {margin: 0 auto; background: url('../images/icon_click.png') no-repeat center; width: 140px; height: 34px; border-radius: 5px; border: 2px solid #e1e1e1;}
		#main .main_wrap .main_txt { color: #777777; font-size:16px; margin-top: 17px;}
		#main .main_wrap .sub_txt {font-weight: 200; color: #777777; font-size: 12px; margin-top: 4px;}
		
		.main { height: 100%; }	
	
		/* 해당 페이지에서 헤더 이미지를 못 가져온 부분 */
		/* 기본 */
	    #header .logo_wrap { width: 221px; height: 64px; text-align: center; background: url('../images/img-logo-x-labeller.png') no-repeat center; cursor: pointer; }	
	    /* 성모 */
	    /* #header .logo_wrap { width: 221px; height: 64px; text-align: center; background: url('../images/sungmo_logo.png') no-repeat center; cursor: pointer; background-size : contain;} */
	    /* 위자드랩 */
	    /* #header .logo_wrap { width: 221px; height: 64px; text-align: center; background: url('../images/wizardlab_logo.png') no-repeat center; cursor: pointer; background-size : contain;} */
	   	#header .account_wrap > ul > li > a .help_btn { width: 17px; height: 17px; margin-right: 6px; margin-bottom: -2px; display: inline-block; background: url('../images/btn_help_nor.png') no-repeat left;  }
	   	#header .account_wrap > ul > li > a:hover .help_btn { background: url('../images/btn_help_selected.png') no-repeat left; }		    
/* 		#algorithmList { width: 100%; height: 100%; background-color:#f5f5f5;} */
		#algorithmList { width: 100%; min-height: calc(100% - 66px); background-color:#f5f5f5;}
		#algorithmList .contents { height: 100%; }
		#algorithmList .contents>div { height: 100%; }
		#algorithmList .min_w1440 { position: absolute; height: 100%; }		
		#algorithmList .title_wrap .c_wrap { width: 50%; height: 14px; margin-left:44px;   }
		
		#algorithmList .prerequirement_wrap {height: 100px; background-color: #ffffff;}
		#algorithmList .prerequirement_wrap .title_wrap { margin: 38px 32px; height: 24px;   font-size: 20px;font-weight: 500; float:left; background-color: #ffffff; padding-right: 33px; border-right: 1px solid #dedcde}
		#algorithmList .prerequirement_wrap .c_wrap { width: 100px; height: 40px; width: 180px; padding: 30px 42px 30px; }
		#algorithmList .prerequirement_wrap .c_wrap button { width:150px; height:40px; background-color: #4c84ff; color:#ffffff; border-radius: 20px;}
		#algorithmList .prerequirement_wrap .c_wrap div{ width:150px; height:38px; font-size:12px; font-weight: 400; background-color: #f5f5f5; color:#555555; border: 1px solid #dedcde; border-radius: 20px; text-align:center; line-height:3;}
		
		#algorithmList .section { width: 100%; position: relative; background-color: #f5f5f5;}
		#algorithmList .title_wrap div {width: 100%; height: 14px;   font-size:12px; font-weight: 300; color: #343434; background-color:#f5f5f5; float:left; padding: 36px 32px 21px;}
		
		#algorithmList .GPU_wrap select { width: 158px; text-align-last: center; font-weight: 300; background-color: #f8f8f8; border-radius: 4px;}
		#algorithmList .swarmjoin_wrap { width: 100%; margin-bottom: 10px; position: relative;}
		
		#algorithmList .h_wrap {height: 44px; width: calc(100% - 65px); border-top: 2px solid #3a3b3d; background-color:#fafafa; border-bottom: 1px solid #dedcde; margin-left:32px; margin-right:32px;}
		#algorithmList .h_wrap div { line-height: 30px; font-size: 11px; font-weight: 300; color: #555555; display: inline-block; width: 100%; height: 30px; text-align: center;}
		
		#algorithmList .c_wrap { height:100%; width: calc(100% - 65px); background-color: #ffffff; overflow-y: scroll;margin-left:32px; margin-right:32px;}
		#algorithmList .c_wrap .gpu_list { width: 100%; border-bottom: 1px solid #dedcde; height: 50px; }
		#algorithmList .c_wrap .gpu_list div { display: inline-block; width: 100%; line-height: 30px; font-size: 11px; font-weight: 300; color: #555555; text-align: center;}
		#algorithmList .c_wrap .gpu_list input { width:158px; height:28px; border-width :1px; padding:0; text-align: center; border-radius: 3px; font-family: Open_Sans; font-weight: 300; }
		#algorithmList .c_wrap .gpu_list input:focus { border: 1px solid #218aff; background: none; background-color: #ffffff; }
		#algorithmList .c_wrap .gpu_list .password { -webkit-text-security: disc !important; font:small-caption;font-size:16px;}
		
		#algorithmList .btn_wrap { display: flex; display: -webkit-flex; }
		#algorithmList .btn_wrap button { cursor: pointer; width: 54px; height: 28px; text-align: center; background-color: #f8f8f8; font-family: Open_Sans; font-size: 12px; font-weight: 300; font-color: #343434; border: 1px solid #dedcde; }
		
		#algorithmList .algorithm_area{width: 100%;}
 		#algorithmList .algorithm_area .section{ display: none; height: 100%; }	 
/* 		#algorithmList .algorithm_area .section{ display: block; height: 100%; }	 */	
		#algorithmList .algorithm_area .section.selected{ display: block; }
		#algorithmList #dir_wrap { height: 100%; }
		#algorithmList #dir_wrap .algorithm_dir { height: calc(100% - 103px)!important; min-height: calc(100% - 103px); padding: 0; overflow-x: hidden; overflow-y: overlay; }
		#algorithmList #dir_wrap .algorithm_dir li {    line-height: 47px; font-size: 13px; color: #333333; background-color: #ffffff;}
		#algorithmList #dir_wrap .algorithm_dir li a { width: 100%; height: 47px; border-bottom: 1px solid #e5e5e5; padding: 1px 3px 0 0; margin: 0; cursor: pointer; background-color: transparent; text-decoration: none; vertical-align: top; display: inline-block; }
		#algorithmList #dir_wrap .algorithm_dir li a:hover { background-color: #cde5ff; color: #333; text-decoration: none; }		
		#algorithmList #dir_wrap .algorithm_dir li a.curSelectedNode { background-color: #4c84ff; color: #ffffff; border: 0; border-bottom: 1px solid #e5e5e5; opacity: 1; }		
		
		#algorithmList .algorithm_tree { height: 100%; border-right: 1px solid #e5e5e5; background-color: #ffffff; text-align: center; }
		#algorithmList .algorithm_tree .btn_wrap{ height: 103px; }
		#algorithmList .algorithm_tree .new_btn { width: 190px; line-height: 36px; margin: 0 auto; border-radius: 5px; background-color: #4c84ff; font-size: 12px; color: #ffffff; cursor: pointer; }
		#algorithmList .algorithm_tree .new_btn:hover { background-color: #3A71E9; }	
		#algorithmList .w220 { position:relative; width: 220px !important; margin: 0 auto; }
		
		#contextmenu { z-index: 1000; display:none; position:fixed; width:96px; height:54px; background: #fff; border: 1px solid #e0e0e0; border-radius: 5px; padding: 0; cursor: pointer; }
		#contextmenu ul li { text-align: center; padding: 4px 0 4px 0; }
		#contextmenu ul li:hover { background-color: #cde5ff; }
		
	</style>
</head>
<body>

	<div class="container" id="algorithmList">

		<div class="min_w1440 min_h640">
			<div class="contents flex">
<%-- 				<div class="ws_wrap">
					<jsp:include page="/workspace" flush="false" />
				</div> --%>
				<div class="ws_wrap">
					<div class="w220 algorithm_tree">
						<div id="dir_wrap">
							<ul class="algorithm_dir filter_color">
<!-- 								<li class="algorithm_item">
									<a class="" title="FasterRCNN">Faster RCNN</a>
								</li>
								<li class="algorithm_item">
									<a class="" title="Retinanet">Retinanet</a>
								</li>							
								<li class="algorithm_item">
									<a class="" title="YOLO">YOLO</a>
								</li>		
								<li class="algorithm_item">
									<a class="" title="SSD">SSD</a>
								</li>
								<li class="algorithm_item">
									<a class="" title="CustomAlgorithm">Custom Algorithm</a>
								</li> -->

																											
							</ul>
							<div class="btn_wrap flex">
								<div class="new_btn filter_color" >New +</div>
							</div>			
						</div>	
					</div>
				</div>
				<div class="section_wrap algorithm_area">
					<div class="section main"></div>
					<div class="section algorithm_register">
						<jsp:include page="/algorithm/register" flush="false" />
					</div>
					<div class="section algorithm_detail">
						<jsp:include page="/algorithm/detail" flush="false" />
					</div>										
				</div>
			</div>
		</div>
	</div>

</body>
<script>
	$(document).on("sessionLoad", function() {
		if(!loginCheck()){
			alert("로그인 후 이용 가능합니다");
			location.href = baseUrl + "login";
		} else {
			algorithmList.init();
		}
	});
	
	
	var algorithmList = {
		pt : $("#algorithmList"),
		init : function(node) {
			let that = algorithmList;
			$("#loader").show();
			that.setView();
			that.getAlgorithmList();
			that.algorithmListener();
		},
		
		setView : function() {
			let that = algorithmList;
			that.main();
		},
		
		algorithmListener : function() {
			let that = algorithmList;
			
			// new 버튼 클릭
			that.pt.find(".btn_wrap .new_btn").off("click").on("click", function(){
				that.pt.find(".docker_cmd_list_wrap").html("");
				that.pt.find(".train_param_list_wrap").html("");
				that.pt.find(".inference_param_list_wrap").html("");
				that.pt.find(".curSelectedNode").removeClass('curSelectedNode');
				that.hideView();
				that.addView($(".algorithm_register"));
				algorithmRegister.init();
			});
			
			that.pt.find("input").off("input").on("input",function(e){
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
				
				return;
			});			
		},
		
		main : function(){
			let that = algorithmList;
			
			that.hideView();
			$("#loader").hide();		
			
			let target = that.pt.find(".section.main");
			target.addClass("selected");
			$(target).html("");
		
			let html = "";
			html += '	<div class="container" id="main">';
			html += '		<div class="content flex">';
			html += '			<div class="main_wrap">';
			html += '				<div class="drop_image"></div>';
			html += '				<div class="main_txt">Click</div>';
			html += '				<div class="sub_txt">Please click the Algorithm</div>';
			html += '			</div>';
			html += '		</div>';
			html += '	</div>';
			
			$(target).append(html);			
		},
		
 		getAlgorithmList : function() {
			let that = algorithmList;
			$("#loader").show();
			$.ajax({
				url : baseUrl + "algorithm/getAlgorithmList.json",
				type : "POST",
				success : function(res) {
					$("#loader").hide();
					console.log("=====getAlgorithmList=====", res);
					
					if(res.result.code == "3301"){
							alert(res.result.data);
							location.href = baseUrl + 'login';
					}
					
					if (res.result.code == "200") {
					 	that.setAlgorithmList(res.result.data);
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
		
		setAlgorithmList : function(data) {
			let that = algorithmList;
			let algorithm_data = data;
			let target = that.pt.find(".algorithm_dir");
			$(target).html("");
			
			let html = ""; 
			for(let i=0, len = data.length; i<len; i++){
				html += "<li data-id='"+data[i]["algorithm_id"]+"'class='algorithm_item'>";
				// 알고리즘 목록 드래그 허용 
// 				html += "	<a class='title' draggable='true' ondragend='algorithmList.detail("+data[i]["algorithm_id"]+")'>"+data[i]["title"]+"</a>";
				html += "	<a class='title' draggable='true' ondragend='algorithmList.detail("+data[i]["algorithm_id"]+")'>";
				html += " <span class='algorithm_ico'></span>";
				html += data[i]["title"];
				html += "</a>";
// 				html += "	<a class='title'>"+data[i]["title"]+"</a>";				
				html += "</li>"
			}
			$(target).append(html);
			
			that.pt.find(".algorithm_dir .algorithm_item").off("click").on("click", function() {
				//let targetId = $(this).data("algorithm_id");
				let targetId = $(this).attr("data-id");
				//console.log("click", targetId);
				let here = $(this).find("a");
				here.addClass("curSelectedNode");
				
 				that.hideView();
				that.addView($(".algorithm_detail"));
				//algorithm_detail.init(); 
				
				if(here.hasClass("curSelectedNode")){
					that.pt.find(".algorithm_item a").not(here).removeClass("curSelectedNode");
				};				
				document.documentElement.scrollTop = 0;
				// 페이지 호출하는 ajax 
				that.detail(targetId);
				//console.log("targetId :", targetId);
			});
			
				
			that.contextMenu();
		},
		
		contextMenu : function() {
			let Contextmenu = !function(){
					let that = algorithmList;
					let id = 'contextmenu';
					{
					let div = document.createElement('div');
					div.id = id;
					document.body.appendChild(div);
					}
					let div = document.getElementById(id);
					
					that.pt.find(".algorithm_item").on("contextmenu", function(e) {
						var list_item = $(this);
						e.preventDefault();
		
						let x = e.pageX + 'px';
						let y = e.pageY + 'px';
						div.style.display = 'block';
						div.style.left = x;
						div.style.top = y;
						
						let ctxTarget = $("#contextmenu");
						let html = "";
						ctxTarget.html("");
						html += "<ul>";
						html += "<li class='al_delete'>Delete</li>";
						html += "<li class='al_deploy'>Deploy</li>";
						html += "</ul>";
						ctxTarget.append(html);
						
						that.rightMenu(list_item);
						console.log("list_item::", list_item);
					});
	
					
					document.addEventListener("click", function(e) {
						div.style.display = 'none'
					});
				}();			
		},
		
		rightMenu : function(listItem) {
			let that = algorithmList;
			let list_data = listItem;
			console.log("list_data::", list_data);
			let data_id = list_data[0].attributes[0].value;
			console.log("list_data.attr.val:", data_id);
			console.log(".al_delete:", $("#contextmenu").find(".al_delete"));
			console.log(".al_deploy:", $("#contextmenu").find(".al_deploy"));
			
			$("#contextmenu .al_delete").off("click").on("click", function() {
// 				algorithm_detail.init();
// 				let msg = "All data will be deleted. Continue?";
				let msg = "해당 알고리즘의 설정 값과 해당 알고리즘으로 생성된 모든 task 데이터가 \n삭제됩니다. 계속하시겠습니까?";
				if(confirm(msg)==true){
				algorithmDetail.deleteAlgorithm(data_id);
				} else {
					
				}
			});
			
			$("#contextmenu .al_deploy").off("click").on("click", function() {
				that.detail(data_id);			
				that.pt.find(".curSelectedNode").removeClass('curSelectedNode');
				that.pt.find(".algorithm_item[data-id='"+data_id+"'] a").addClass('curSelectedNode');
				algorithmDetail.deployAlgorithm(data_id);				
			});				
		},
		
		detail : function(id) {
			let that = algorithmList;
			
			let detail_id = id;
			//console.log("detail_id : ", detail_id);
			
			that.hideView();
			that.addView($(".algorithm_detail"))
			algorithmDetail.init(detail_id);


		},
		
		addView : function(view) {
			view.addClass("selected");
		},

		hideView : function() {
			$("#algorithmList .section_wrap .section").each(function() {
				let view = $(this);
				view.removeClass("selected");
			});
		},

	};
</script>