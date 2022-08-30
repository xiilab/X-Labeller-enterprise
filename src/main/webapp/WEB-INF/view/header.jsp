<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
		
		<!-- Import CSS	-->
<%-- 		<link rel="shortcut icon" href="<c:url value="/images/favicon2.ico" />"> --%>
		<link rel="stylesheet" href="<c:url value="/css/fontawesome-all.min.css" />">
		<link rel="stylesheet" href="<c:url value="/css/common.css" />">
		<link rel="stylesheet" href="<c:url value="/css/workspace.css" />">
		<link rel="stylesheet" href="<c:url value="/css/video-js.min.css" />">
		<link rel="stylesheet" href="<c:url value="/css/tui-pagination.css" />">
		
		<!-- Import JS	-->
		<script src="<c:url value="/js/jquery-3.3.1.min.js" />"></script>
		<script src="<c:url value="/js/jquery-ui.min.js" />"></script>
		<script src="<c:url value="/js/moment.min.js" />"></script>

		<script src="https://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"></script>
		<script src="<c:url value="/js/video.min.js" />"></script>
		<script src="<c:url value="/js/VideoFrame.min.js" />"></script>

		<script src="<c:url value="/js/jquery.twbsPagination.min.js" />"></script>
		<script src="<c:url value="/js/tui-pagination.min.js" />"></script>		
		<script src="<c:url value="/js/common.js" />"></script>
		<script src="<c:url value="/js/color-hash.js" />"></script>
		<%-- <script src="<c:url value="/js/fabric.min.js" />"></script> --%>
		<script src="<c:url value="/js/fabric.js" />"></script>
		
		<script src="<c:url value="/js/xValidate.js" />"></script>
		<script src="<c:url value="/js/jquery.canvasjs.min.js" />"></script>
		
		<style>
			#header { background-image: linear-gradient(to bottom, #3c3d3f, #3a3b3d 55%, #343537); }
 			#header .logo { cursor: pointer; }
 			
		    /******************/
		    /* X-Labeller 로고 */
		    #header .logo_wrap { width: 221px; height: 64px; text-align: center; background: url('images/img-logo-x-labeller.png') no-repeat center; cursor: pointer; }
		    /**/
		    /* 성모 로고 */
		    /* #header .logo_wrap { width: 221px; height: 64px; text-align: center; background: url('images/sungmo_logo.png') no-repeat center; cursor: pointer; background-size : contain;} */ 
		    /* */
		    /* 위자드랩 */
		    /* #header .logo_wrap { width: 221px; height: 64px; text-align: center; background: url('images/wizardlab_logo.png') no-repeat center; cursor: pointer; background-size : contain;} 
		    /* */ 
		   	#header .logo_wrap .logo_contaion { background-size : contain;}
		    #header .nav_wrap { width: 640px; line-height: 64px; }
		    #header .account_wrap { height: 64px; }
		    
		    #header .nav_depth1 > ul {}
		   	#header .nav_depth1 > ul > li {text-align: center; width: 110px; }
		   	#header .nav_depth1 a {  position: relative; color: #ffffff;  line-height: 64px; display: inline-block;  width: 100%; }
		    
		    #header .nav_depth1 a:after{
			  content: '';
			  position: absolute; width: 0; height: 4px;
			  display: block; margin-top: -4px;  right: 0;
			  background-color: #4c84ff;
			}
			 
			#header .nav_depth1 a.hover{ color: #4c84ff; } 
			#header .nav_depth1 a.hover:after{ width: 100%; left: 0;   background-color: #4c84ff; }
		    #header .nav_depth1 a.active { color: #4c84ff; background-color: #333333; }
		    #header .nav_depth1 a.active:after{ width: 100%; left: 0;   background-color: #4c84ff; }
		    
		    #header .nav_depth2 { position: absolute; z-index: 100; width: 100%; height: 236px; background-color: #fff; display: none; border-top: 1px #eaeaea solid; border-bottom: 1px #eaeaea solid; }
			#header .nav_depth2 .nav_depth2_list { margin-left: 195px; align-items: flex-start;  padding-top: 50px; }
			#header .nav_depth2 .nav_depth2_list > li { text-align: center; width: 160px; }
			#header .nav_depth2 .nav_depth2_list a {  }
			#header .nav_depth2 .nav_depth2_list > li > ul > li { margin-bottom: 15px; padding-bottom: 15px; }
			#header .nav_depth2 .nav_depth2_list > li > ul > li > a:hover { padding-bottom: 15px; border-bottom: 1px #008bed solid; }
			
		    #header .account_wrap > ul { height: 100%; }
		   	#header .account_wrap > ul > li { width: auto; line-height: 40px; margin: 0 15px; position: relative; }
		   	#header .account_wrap > ul > li:not(.end):after{ content: ''; position: absolute; width: 1px; height: 16px; display: block; right: -15px; top: 12px; background-color: #777777; }
		   	#header .account_wrap > ul > li > a { font-size: 13px; font-weight: 300; color: #f5f5f5; }
		   	#header .account_wrap > ul > li > a .help_btn { width: 17px; height: 17px; margin-right: 6px; margin-bottom: -2px; display: inline-block; background: url('images/btn_help_nor.png') no-repeat left;  }
		   	#header .account_wrap > ul > li > a:hover .help_btn { background: url('images/btn_help_selected.png') no-repeat left; }
			#header .account_wrap > ul > li .state { width: 6px; height: 6px; background-color: #50e3c2; border-radius: 3px; margin-right: 6px; }
		   	#header .account_wrap > ul > li > a.logout_btn { width: 88px; line-height: 40px; text-align: center; display: inline-block; border-radius: 20px; background-color: #4c84ff; }

			/* 업로드 상태 바 */
			#progressBar { width: 100%; height: 100%; background: rgba(255, 255, 255, 0.95); position: absolute; top: 0; left: 0; z-index: 990; display: flex; justify-content: center; align-items: center; }
			/* #progressBar { position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(255, 255, 255, 0.9); z-index: 999\o; display: flex; justify-content: center; align-items: center;} */
			
			#progressBar .progress_back { width: 600px; height: 40px; margin-bottom: 40px; overflow: hidden; background-color: #e6e6e6; -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, .1); box-shadow: inset 0 1px 2px rgba(0, 0, 0, .1); }
			#progressBar .progress_value { width: 0; height: 100%; line-height: 40px; color: #fff; text-align: center; -webkit-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .15); box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .15); -webkit-transition: width .6s ease; -o-transition: width .6s ease; transition: width .6s ease; background-color: #4c84ff; }	
		    
		</style>
		
	</head>
<body>
	<header id="header">
		<div class="min_w1440">
			<div class="contents">
				<div class="logo_wrap fl"></div>
				
				
				<div class="nav_wrap nav_depth1 fl flex">
					<ul class="flex filter_color">
						<li menu="menu_1"><a href="<c:url value="/labeller" />" >Labeller</a></li>
						<li menu="menu_2"><a href="<c:url value="/annotation" />" >Annotation</a></li>
						<li menu="menu_3"><a href="<c:url value="/trainer" />">Trainer</a></li>
<%-- 						<li menu="menu_4"><a href="<c:url value="/comparison" />">Comparison</a></li> --%>
						<li menu="menu_5"><a href="<c:url value="/setup" />">Setup</a></li>
						<li menu="menu_6"><a href="<c:url value="/monitor" />">Monitor</a></li>
						<li menu="menu_7"><a href="<c:url value="/visualization" />">Visualization</a></li>
<%-- 						<li menu="menu_7"><a href="<c:url value="/algorithm/list" />">Algorithm</a></li> --%>
						<!-- mAP 임시 -->
<%-- 						<li menu="menu_8"><a href="<c:url value="/map/comparison"/>">Score</a></li>					 --%>
					</ul>
				</div>
				
				<div class="account_wrap fr">
<!-- 					<ul class="flex"> -->
<%-- 						<li menu=""><a href="<c:url value="/login" />" >로그인</a></li> --%>
<%-- 						<li menu=""><a href="<c:url value="/join" />">회원가입</a></li> --%>
<!-- 					</ul> -->
				</div>
				<div class="clear"></div>
			</div>
		</div>
		
	</header>

	<div id="loader" style="display: none;">
		<div class="spinner">
		  <div class="dot1"></div>
		  <div class="dot2"></div>
		</div>
	</div>

	<div id="progressBar" class="hide">
		<div class="progress_back">
	    		<div class="progress_value"></div>
	  	</div>
	</div>
	<script>
		
		$(function(){
			
				"use strict";    
				
// 				window.console = {};
// 				window.console.log = function(obj){};
		 	 
				window.baseUrl = '${pageContext.request.contextPath}'+'/';
				window.imgUrl = '${pageContext.request.contextPath}'+'/images/';
				
// 				window.uploadImgUrl ="http://192.168.1.19:8088/uploadFile/etri/";
				window.uploadImgUrl = location.origin + "/uploadFile/etri/";
	 			
	 			window.tf = "YYYY-MM-DD HH:mm:ss";

	 			
				$.ajaxSetup({
					cache:false,
					crossDomain:true,
					crossOrigin: true,
					contentType:"application/x-www-form-urlencoded; charset=UTF-8",
					type:"POST",
					dataType:"json"
				});
				
			    jQuery.ajaxSettings.traditional = true; 
	
				
			    $(".logo_wrap").off("click").on("click",function(){
			    	location.href = baseUrl + "main";
			    });
			    
			     //현재 사용중인 메뉴의 글씨색을 파란색으로 바꾸는 부분
			    var cur_page='${pageContext.request.getParameter("cur_page")}'
			    switch(cur_page){
			    		case "labeller":
			    			$(".nav_depth1 li").eq(0).children("a").addClass("active");
			    			console.log(this);
			    			break;
			    		case "annotation":
			    			$(".nav_depth1 li").eq(1).children("a").addClass("active");
			    			break;
			    		case "trainer":
			    			$(".nav_depth1 li").eq(2).children("a").addClass("active");
			    			break;
			    		case "comparison":
			    			$(".nav_depth1 li").eq(3).children("a").addClass("active");
			    			break;
			    		case "setup":
// 			    			$(".nav_depth1 li").eq(4).children("a").addClass("active");
			    			$(".nav_depth1 li").eq(3).children("a").addClass("active");
			    			break;
			    		case "monitor":
// 			    			$(".nav_depth1 li").eq(5).children("a").addClass("active");
			    			$(".nav_depth1 li").eq(4).children("a").addClass("active");
			    			break;
						case "visualization":
// 			    			$(".nav_depth1 li").eq(5).children("a").addClass("active");
							$(".nav_depth1 li").eq(5).children("a").addClass("active");
							break;
			    		case "algorithm":
			    			$(".nav_depth1 li").eq(6).children("a").addClass("active");			    			
			    			break;
			    		case "map":
			    			$(".nav_depth1 li").eq(7).children("a").addClass("active");
			    			break;
			    }
				/* nav hover event */
				$(".nav_depth1 > ul > li").hover(
					function(){
						$(".nav_depth1 a").removeClass("hover");
						$(this).children("a").addClass("hover");
						$(".nav_depth2").stop().slideDown(300);
					},
					function(){
						$(".nav_depth1 a").removeClass("hover");
						$(".nav_depth2").stop().slideUp(300);
					}
				);
				
				$(".nav_depth2").hover(
					function(){
						$(this).stop().slideDown(300);
					},
					function(){
						$(this).stop().slideUp(300);
						$(".nav_depth1 a").removeClass("hover");
					}
				);
				
				$(".nav_depth2 .nav_depth2_list > li").hover(
					function(){
						var menu = $(this).attr("menu");
						if(!$(".nav_depth1 > ul > li[menu='"+menu+"'] > a").hasClass("hover")){
							$(".nav_depth1 a").removeClass("hover");
							$(".nav_depth1 > ul > li[menu='"+menu+"'] > a").addClass("hover")
						}
					},
					function(){
						
					}
				);
				
				$.datepicker.setDefaults({
						inline: true,
						showOtherMonths: true,
						dateFormat: "yy-mm-dd",
						dayNamesMin: ["월", "화", "수", "목", "금", "토", "일"],
						monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
						monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
						maxDate : moment().format("YYYY-MM-DD")
				});
				
				function logout(){
					
					$.ajax({
					   	url :  baseUrl + "auth/logout.json",
					   	data : {	},
					   	type : "POST",
					   	success : function(res){
							console.log("=====logout=====", res);
							location.href = baseUrl + "main";
					   	},
					   	error : function(err){
					   		 console.log("ERROR!!", err);
					   	}
					});
				}
				
				getSession();
				
				function getSession(){
					
					$.ajax({
					   	url :  baseUrl + "auth/getSession.json",
					   	data : {},
					   	type : "POST",
					   	success : function(res){
							console.log("=====getSession=====", res);
							
							if(res.result.code == "200"){
								// 로그인 되어있는 상태
								window.loginUserInfo = res.result;
								
								//console.log("menu_1 : ", res.result);
								/* if(res.result.level_cd != "0") {
									if($("#header .nav_wrap.flex ul li").eq(0).attr("menu") == "menu_1") {
										$("#header .nav_wrap.flex ul li").eq(0).children().html("Inspection");
									}
								} */
								var html = ""
									+ "	<ul class='flex'> "
// 									+"		<li menu=''><a href='<c:url value='/info' />' target='_blank' ><div class='help_btn'></div>help</a></li> "
									+"		<li menu='' class='flex'><div class='state'></div><a href='<c:url value='/mypage' />' >"+res.result.data.account+"</a></li> "
									+"		<li menu='' class='end'><a class='logout_btn cp filter_color'>Logout</a></li> "
									+ "	</ul> ";
									
								$("#header .account_wrap").html(html);
								$("#header .logout_btn").off("click").on("click",function(){
									logout();
								});
								
							} else{
								window.loginUserInfo = {};
// 								var html = ""
// 									+ "	<ul class='flex'> "
// 									+"		<li menu=''><a href='<c:url value='/login' />' >Login</a></li> "
// 									+"		<li menu='' class='end'><a href='<c:url value='/join' />'>Join</a></li> "
// 									+ "	</ul> ";
									
// 								$("#header .account_wrap").html(html);
							}
							  
							
							$(document).trigger("sessionLoad");
					   	},
					   	error : function(err){
					   		 console.log("ERROR!!", err);
					   	}
					});
				}

				
			    
		});	

	</script>
