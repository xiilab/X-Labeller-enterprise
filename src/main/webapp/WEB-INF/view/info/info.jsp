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
		
		<!-- Import JS	-->
		<script src="<c:url value="/js/jquery-3.3.1.min.js" />"></script>
		<script src="<c:url value="/js/jquery-ui.min.js" />"></script>
		<script src="<c:url value="/js/moment.min.js" />"></script>

		<script src="<c:url value="/js/jquery.twbsPagination.min.js" />"></script>
		<script src="<c:url value="/js/common.js" />"></script>
		<script src="<c:url value="/js/color-hash.js" />"></script>
		
		<style>
			#header { height: 56px; background-color: #ffffff; border-bottom: 1px solid #dedcde; }
 			#header .logo { cursor: pointer; }
 			
 			
 			section { height: calc(100% - 57px); }
 			
		    /******************/
		    /* 기본 */
		    #header .logo_wrap { width: 221px; height: 56px; text-align: center; background: url('images/img-logo-x-labeller-black.png') no-repeat center; cursor: pointer; }
		    /* 성모 */
			/* #header .logo_wrap { width: 221px; height: 64px; text-align: center; background: url('images/sungmo_logo.png') no-repeat center; cursor: pointer; background-size : contain;} */
			/* 위자드랩 */
			/* #header .logo_wrap { width: 221px; height: 64px; text-align: center; background: url('images/wizardlab_logo.png') no-repeat center; cursor: pointer; background-size : contain;} */ 
		 
		    #header .nav_wrap { width: 600px; line-height: 56px; }
		    
		    #header .nav_depth1 > ul {}
		   	#header .nav_depth1 > ul > li {text-align: center; width: 110px; }
		   	#header .nav_depth1 a {  position: relative; color: #393a3c;  line-height: 56px; display: inline-block;  width: 100%; }
		    
		    #header .nav_depth1 a:after{
			  content: '';
			  position: absolute; width: 0; height: 4px;
			  display: block; margin-top: -4px;  right: 0;
			  background-color: #4c84ff;
			}
		
			
			 
			#header .nav_depth1 a.hover{ color: #4c84ff; } 
			#header .nav_depth1 a.hover:after{ width: 100%; left: 0;   background-color: #4c84ff; }
		    #header .nav_depth1 a.active { color: #4c84ff; }
		    #header .nav_depth1 a.active:after{ width: 100%; left: 0;   background-color: #4c84ff; }
		    
		</style>
		
	</head>
<body>
	<header id="header">
		<div class="min_w1440">
			<div class="contents">
				<div class="logo_wrap fl"></div>
				
				
				<div class="nav_wrap nav_depth1 fl flex">
					<ul class="flex filter_color">
						<li menu="menu_1"><a href="" class="active">Labeller</a></li>
						<li menu="menu_2"><a href="" >Annotation</a></li>
						<li menu="menu_3"><a href="">Trainer</a></li>
						<li menu="menu_4"><a href="">Comparison</a></li>
						<li menu="menu_5"><a href="">Setup</a></li>
						<li menu="menu_6"><a href="">Monitor</a></li>
						<li menu="menu_7"><a href="">Algorithm</a></li>
					</ul>
				</div>
				
				<div class="clear"></div>
			</div>
		</div>
		
	</header>
	<section>
	</section>
<!-- 	<div class="section labeller selected"> -->
<%-- 		<jsp:include page="/labeller/info" flush="false" /> --%>
<!-- 	</div> -->
<!-- 	<div class="section annotation"> -->
<%-- 		<jsp:include page="/labeller/info" flush="false" /> --%>
<!-- 	</div> -->
<!-- 	<div class="section trainer"> -->
<%-- 		<jsp:include page="/labeller/info" flush="false" /> --%>
<!-- 	</div> -->
<!-- 	<div class="section comparison"> -->
<%-- 		<jsp:include page="/labeller/info" flush="false" /> --%>
<!-- 	</div> -->


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
			    
				/* nav hover event */
				$(".nav_depth1 > ul > li").hover(
					function(){
						$(".nav_depth1 a").removeClass("hover");
						$(this).children("a").addClass("hover");
					},
					function(){
						$(".nav_depth1 a").removeClass("hover");
					}
				);
				
				$(".nav_depth1 > ul > li > a").off("click").on("click", function(){
					$(".nav_depth1 a").removeClass("active");
					$(this).addClass("active");
					let info = this.innerText;
					$("section").load("info/"+info.toLowerCase());
					
					
					return false;
				});
				
				$(".nav_depth1 > ul > li:first-of-type > a").trigger("click");
			    
		});	

	</script>
