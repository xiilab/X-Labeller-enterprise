<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>AI HUB</title>
      
<%--       <jsp:include page="/import"  flush="false" /> --%>
    
      <style>
      
      	#accordionSidebar a.nav-link span { width:168px; display:block; }
	    #accordionSidebar .collapse-inner { height:300px; overflow:scroll; }
	    #accordionSidebar .video_name { 
	    	padding-left:0;
	    }
	    
	    #videoBBox a.next_page,a.prev_page { cursor:pointer; }
	    #videoBBox .pagination input.page-link { height:30px; width:30px; padding:0 0 0 8px; }
      	#videoBBox .tab_wrap { width:180px; }
       	#videoBBox a.disabled { color:#e74a3b !important; pointer-events: none; } 
	    #videoBBox .labeller_container { 
/* 	    	overflow:scroll;  */
/* 			overflow:auto;  */
			overflow: hidden;
	    	display:flex; 
	    	flex-wrap:nowrap;  
	    	margin-top: 20px;
	    	border-left: 0;
	    	border-right: 0;
	    	min-height: 840px;
	    	max-height: 840px;
	    }
      	
/*       	#videoBBox .tab-pane{ */
/*       		position:relative;   */
/* 			width: calc(100% - 200px); */
/* 			height: calc(100% - 198px); */
/*       		flex-shrink:0; */
/*       		border-bottom: 0; */
/*       		margin: 0 auto; */
/*       		margin-top: 25px; */
/*       	} */
      	
/* 		#videoBBox .tab-pane { */
/* 		    position: relative; */
/* 		    width: 1024px; */
/* 		    height: auto; */
/* 		    flex-shrink: 0; */
/* 		    margin: 0 auto; */
/* 		}   	 */
      	
		#videoBBox .tab-pane {
		    position: relative;
		    width: 800px;
		    height: auto;
		    min-height: 600px;
		    flex-shrink: 0;
		    margin: 0 auto;
		}   	      	
      	#videoBBox .header_wrap { margin-bottom: 42px; }
      	#videoBBox .tab-pane.cate_search_wrap {
/*       		border:1px solid #eeeeee; */
/*       		border-radius : 10px; */
      	}
      	#videoBBox .cate_search_wrap { border:1px solid #eeeeee; }
      	#videoBBox .cate_search_wrap .content_wp .content_header .content_title { cursor:pointer; }
      	#videoBBox .cate_search_wrap .search_cate { width:50%; }
      	
      	#videoBBox .cate_search_wrap .search_wp .search_wrap .search_cate_list { cursor:pointer; }
      	#videoBBox .cate_search_wrap .search_wp .search_wrap .search_cate_list:hover { color:red; }
      	#videoBBox .cate_search_wrap .search_wp .search_wrap { position:absolute; width:50%; max-height:500px; overflow:scroll; background-color:#f8f9fc; z-index:100;  }
      	
      	#videoBBox .search_all_wp .search_all_wrap { position:absolute; /* width:50%; */ max-height:500px; overflow:scroll; background-color:#f8f9fc; z-index:100;  }
      	#videoBBox .search_all_wp .search_all_wrap .search_cate_list { cursor:pointer; }
      	#videoBBox .search_all_wp .search_all_wrap .search_cate_list:hover { color:red; }
      	
      	#videoBBox .cate_search_wrap .content_wp { overflow:scroll; }
      	#videoBBox .cate_search_wrap .content_wp.active { height:auto; }
      	#videoBBox .cate_search_wrap .content_wp .content .cate_2,.cate_3 { cursor:pointer; }
/*       	.cate_search_wrap .content_wp .content .cate_2.active,.cate_3.active { font-weight:bold; } */
/*       	.cate_search_wrap .content_wp .content .cate_2:hover,.cate_3:hover { color:red; } */

		#videoBBox .cate_search_wrap .content_wp .content .cate_2.active,.cate_3.active { font-weight:bold; background-color:#eeeeee !important; color:black !important; }
		#videoBBox .cate_search_wrap .content_wp .content .cate_2:hover,.cate_3:hover { color:red !important; }
		#videoBBox .cate_search_wrap .content_wp .content .cate_wrap_3 { background-color:#eeeeee; }
		
      	
      	#videoBBox .label_wrap { 
       		position:relative;  
/*       		width:420px;  */
			width: 100%;
      		height:auto; 
/*       		border: 1px solid #eeeeee;  */
/*       		margin-left:20px;  */
/*       		border-radius:0.35rem;  */
      		flex-shrink:0;
      	}
      	#videoBBox .video_wrap .canvas { width:800px; height:auto; position:absolute !important; }  
/*        	#videoBBox .video_wrap .canvas { width:1024px; height:auto; position:absolute !important; }   */
       	#videoBBox .video_wrap .video { /* width:1024px; */  /*height:auto;*/ width: 100%;  position:absolute !important; }  
       	
      	#videoBBox .video_wrap .video .video_js { position:absolute; }
      	#videoBBox .video_wrap .video .vjs-control-bar { display: flex; height:40px; bottom:-40px;}
      	#videoBBox .video_wrap .video .vjs-big-play-button { display:none; }
      	#videoBBox .video_wrap .prog_bar { border:1px solid #eeeeee; width:100%; height: 60px; position: absolute; margin-top:40px; bottom: -62px; background-color: #f8f8f8; }
      	#videoBBox .video_wrap .prog_bar > div { color:#020b44; }
		#videoBBox .video_wrap .prog_bar .btn_wrap { width: 40%; margin-top:0; }
/*       	.video_wrap .prog_bar .btn { color:#020b44; border-radius:50%; } */
      	#videoBBox .video_wrap .prog_bar input.curr_frame { width:70px; height:15px; margin-right:0px; padding: 11px 10px; box-sizing: border-box; }
      	#videoBBox .video_wrap .prog_bar .save_btn_wrap { width:260px; }
      	#videoBBox .video_wrap .frame_wrap { justify-content: center; font-size: 12px; }
      	
		#videoBBox .img_list_wrap .btn_wrap { width: 40%; margin-top:0; }
/*       	.video_wrap .prog_bar .btn { color:#020b44; border-radius:50%; } */
      	#videoBBox .img_list_wrap input.curr_frame { width:70px; height:15px; margin-right:0px; padding: 11px 10px; box-sizing: border-box; }
      	#videoBBox .img_list_wrap .frame_wrap { justify-content: center; font-size: 12px; }      	
      	
      	#videoBBox .btn-outline-primary { display: inline-block; font-weight: 400; text-align: center; cursor: pointer; vertical-align: middle; border: 1px solid #e0e0e0; border-radius: 0.35rem; width: 70px; margin: 0 4px; }
      	#videoBBox i.fa { margin-right: 0; }
      	
      	#videoBBox .label_wrap .btn_wrap { margin:0; padding-bottom: 1px; border-bottom: 1px solid #eee; }
/*       	.label_wrap .btn_wrap > div { width:100%; margin:0;  cursor:pointer; } */
      	@media (min-height:960px){
/*       		#videoBBox .label_wrap .category_wrap { max-height: 880px; }  */
			#videoBBox .label_wrap .category_wrap { max-height: 785px; } 
      	}
      	@media (min-height: 730px) and (max-height:959px){
/*       		#videoBBox .label_wrap .category_wrap { max-height: 665px; }  */
			#videoBBox .label_wrap .category_wrap { max-height: 570px; } 
      	}      	
      	@media (min-height: 500px) and (max-height:729px){
/*       		#videoBBox .label_wrap .category_wrap { max-height: 500px; }  */
			#videoBBox .label_wrap .category_wrap { max-height: 405px; } 
      	} 
      	@media (min-height: 1px) and (max-height:499px){
/*       		#videoBBox .label_wrap .category_wrap { max-height: 400px; }  */
			#videoBBox .label_wrap .category_wrap { max-height: 305px; } 
      	}   	
      	#videoBBox .label_wrap .category_wrap { width:100%; height:auto; /* overflow:scroll; */ overflow-y: scroll; overflow-x: hidden; flex-wrap: wrap; padding: 0 18px; }
/*       	#videoBBox .label_wrap .category_wrap .cate_wp { width:190px; height:90px; border:1px solid #eeeeee; margin: 5px 10px; padding: 7px; } */
      	#videoBBox .label_wrap .category_wrap .cate_wp { width: 414px; height: 75px; border:1px solid #eeeeee; margin: 5px 10px; padding: 7px; }
      	#videoBBox .label_wrap .category_wrap .cate_wp.selected { border-width:2px !important; }
/*       	.label_wrap .category_wrap .cate_wp .delete { margin-left:10px; } */
      	#videoBBox .label_wrap .category_wrap .cate_wp .color {     
      		width: 20px;
		    height: 20px;
	    }
/* 	    #videoBBox .label_wrap .category_wrap .cate_wp input { width: 165px; padding: 10px; margin-top: 3px; } */
	    #videoBBox .label_wrap .category_wrap .cate_wp input { width: 390px; padding: 10px; margin-top: 3px; }
	    
      	#videoBBox .label_wrap .category_wrap .cate { /*width:5em;*/ /* width:60px; */ border:1px solid #eeeeee; text-align:center; text-align-last:center; }
      	#videoBBox .label_wrap .category_wrap .cate option { text-align:center; text-align-last:center; }
      	
      	#videoBBox .page_title_wrap { position: relative; top: 20px; left: 90px; display: inline; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; }
      	#videoBBox .page_title_wrap span:first-child { font-size: 13px; }
		#videoBBox .page_title_wrap span:nth-child(2) { color: #4c84ff; font-size: 14px;}
		#videoBBox .add { width: 90px; margin-right: 10px; position: relative; color: #fff; font-size: 11px; background-color: #4c84ff; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; }
		#videoBBox .add:hover { background-color: #3A71E9; }
		#videoBBox .delete { width: 55px; color: #343434; font-size: 11px; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; margin-left: 10px;  }
		#videoBBox .delete_frm { width: auto; color: #343434; font-size: 11px; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; margin-left: 10px;  }
		#videoBBox .delete:hover,
		#videoBBox .delete_frm:hover { background-color: red; color: #fff; }		
		#videoBBox .start_frm, .end_frm { width: 55px; color: #4c84ff; font-size: 11px; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; margin-left: 10px;  }
		#videoBBox .start_frm:hover,
		#videoBBox .end_frm:hover { width: 55px; color: #fff; background-color: #4c84ff; font-size: 11px; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; margin-left: 10px;  }
		
      	#videoBBox .label_title { color: #777; font-weight: 400; padding: 20px; }
      	
      	#videoBBox .save_btn_wrap { justify-content: center; position: absolute; bottom: 0; padding: 26px 0;  background-color: #fff; border-top: 1px solid #eee; }
      	#videoBBox .save_btn_wrap .save { width: 240px; line-height: 36px; margin: 0 auto; border-radius: 23px; box-shadow: 0 4px 8px 0 #b4d7ff; font-size: 13px; font-weight: 300; color: #fff; cursor: pointer; background-color: #4c84ff;}
		#videoBBox .save_btn_wrap .save:hover { background-color: #3A71E9; }
		#videoBBox .img_list_wrap { width: 100%; position: absolute; bottom: 58px; border: 1px solid #e0e0e0; border-left: 0; border-right: 0; padding: 15px 0; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; background-color: #f8f8f8; }      
		      		
		#videoBBox .position_wrap { width: 100px; margin-right: 20px; }
		#videoBBox .position_wrap .position-value { width: 40px; padding: 5px; }
		#videoBBox .position_wrap .total_count { display: inline-block; }
		
		
		#videoBBox .name_wrap { width: 30%; text-align: center; margin-left: -70px; overflow-wrap: break-word; }
		#videoBBox .name_wrap .file_name { max-width: 280px; text-overflow: ellipsis; overflow: hidden; }
	
		
      	#videoBBox .list_btn_wrap { width: 60px; margin-left: 20px; }
      	#videoBBox .list_btn_wrap .data_list_btn { width: 30px; height: 30px; margin-right: 30px; background: url(images/icon_filter_normal.png) right; cursor: pointer; }

 		#videoBBox .quick_wrap { width: 100%; position: absolute; bottom: 0px; padding: 10px 0; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }       

/*  		#videoBBox .quick_wrap { width: calc(100% - 699px); position: absolute; bottom: 0px; padding: 25px 0; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }        */
/* 		#videoBBox .quick_wrap { width: 488px; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; position: absolute; top: -8px; left: 609px;}     */
      
		#videoBBox .quick_btn {
			width: 100px;
 			line-height: 36px; 
			margin: 0 20px;
			margin-top: 4px;
/* 			padding: 6px; */
			text-align: center;
			border-radius: 5px;
			box-shadow: 0 4px 8px 0 #e7e7e7;
			background-color: #4c84ff;
			font-size: 11px;
			font-weight: 300;
			color: #fff;
			cursor: pointer;
		}
		
		#videoBBox .quick_btn:hover {
			background-color: #3A71E9;
		}      
		
		/* panel label */
		#videoBBox .btn_wrap .visible { width: 18px; height: 18px; position: relative; left: -145px; }
		#videoBBox .btn_wrap .visible.on { background: url('images/btn_layer_view.png') no-repeat center; }
		#videoBBox .btn_wrap .visible.off { background: url('images/btn_checkbox_normal.png') no-repeat center; }		
		
/* 		#videoBBox .tag_wrap { width: 100%; height: 60px; position: absolute; bottom: 91px;  border-top: 1px solid #f8f8f8; font-size: 11px; justify-content: center; }      	 */
      	#videoBBox .video_name { font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434;}
      	
		#videoBBox section.enrichment {
			width: calc(100% - 486px);
			height: 100%;
			position: relative;
/* 			border: 1px solid #e5e5e5; */
		}      
		
		#videoBBox section.label {
			width: 486px;
			height: 100%;
			min-height: 727px;
			position: relative;
			background-color: #ffffff;
 			border: 1px solid #e5e5e5; 
			-ms-user-select: none;
			-moz-user-select: -moz-none;
			-webkit-user-select: none;
			-khtml-user-select: none;
			user-select: none;
		}		
		
		.card, .container-fluid, #wrapper, #content-wrapper, #content { height: 100%; }    
		@media (min-height: 905px){
			#videoBBox .data_list_wrap { height: 448px; max-height: 448px; top: calc(100% - 553px); left: -1px; font-family: 'Open_Sans', sans-serif; font-size: 11px; font-weight: 300; color: #343434; z-index: 98; }  			
		}
		@media (max-height: 904px){
			#videoBBox .data_list_wrap { height: 448px; max-height: 448px; top: calc(100% - 553px); left: -1px; font-family: 'Open_Sans', sans-serif; font-size: 11px; font-weight: 300; color: #343434; z-index: 98; }  			
		}
		
		
		#videoBBox .enrichment .prev_btn {
			position: absolute;
			background: url(images/btn_image_arrow_left_normal.png) left;
			width: 16px;
			height: 25px;
 			top: calc(50% - 78px); 
/* 			top: 300px; */
			left: 5px;
			z-index: 97;
		}
		
		#videoBBox .enrichment .next_btn {
			position: absolute;
			background: url(images/btn_image_arrow_right_normal.png) right;
			width: 16px;
			height: 25px;
 			top: calc(50% - 78px); 
/* 			top: 300px; */
			right: 5px;
			z-index: 97;
		}      	
		
		#videoBBox .enrichment .prev_btn:hover {
			background: url(images/btn_image_arrow_left_hover.png) left;
			cursor: pointer;
		}
		
		#videoBBox .enrichment .next_btn:hover {
			background: url(images/btn_image_arrow_right_hover.png) right;
			cursor: pointer;
		}			
		
		#videoBBox #pre_video { z-index: 99; }
		
		#videoBBox section.enrichment .empty_wrap { margin: 0 auto; text-align: center; margin-top: 130px; color: #777777; }
		#videoBBox section.enrichment .empty_wrap .no_image { margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; height: 37px; background-image: url(./images/icon_nodata_list.png); }
		#videoBBox section.enrichment .empty_wrap .eng_text { margin-bottom: 3px; font-size: 16px; }
		#videoBBox section.enrichment .empty_wrap .kor_text { font-size: 12px; }	
		
		/* quick */
 		#videoBBox .quick_wrap { width: 100%; position: absolute; bottom: 0px; padding: 0px 0; background-color: #fff; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }       

/*  		#videoBBox .quick_wrap { width: calc(100% - 699px); position: absolute; bottom: 0px; padding: 25px 0; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }        */
/* 		#videoBBox .quick_wrap { width: 488px; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; position: absolute; top: -8px; left: 609px;}     */
      
		#videoBBox .quick_btn {
			width: 100px;
 			line-height: 36px; 
			margin: 0 20px;
			margin-top: 4px;
/* 			padding: 6px; */
			text-align: center;
			border-radius: 5px;
			box-shadow: 0 4px 8px 0 #e7e7e7;
			background-color: #4c84ff;
			font-size: 11px;
			font-weight: 300;
			color: #fff;
			cursor: pointer;
		}
		
		#videoBBox .quick_btn:hover {
			background-color: #3A71E9;
		}    
		
		#videoBBox .quick_btn_wrap {
			padding-top: 10px;
		}		
				
		#videoBBox .quick_training, 
		#videoBBox .quick_inference {
			width: 400px;
			background-color: #fafafa;
			padding: 23px;
			border: 1px solid #d9d9d9;
			position: absolute;
			left: 38%;
			top: -940%;
/* 			top: -940% !important; */
			z-index: 9999999;
			display: none;
		}
		
		#videoBBox .quick_training.active, 
		#videoBBox .quick_inference.active {
			display: block;
		}
		
		#videoBBox .quick_training_btn, 
		#videoBBox .quick_inference_btn {
			width: 100px;
			line-height: 28px;
			margin: 0 auto;
			text-align: center;
			border-radius: 23px;
			background-color: #4c84ff;
			font-size: 11px;
			font-weight: 300;
			color: #ffffff;
			cursor: pointer;
		}
		
		#videoBBox .input_wrap {
			margin: 15px 0;
		}
		
		#videoBBox .input_wrap label {
			width: 100px;
			font: 400 12px system-ui;
		}
		
		#videoBBox .input_wrap input[type="text"] {
			width: 210px;
			height: 0px;
			font: 300 12px system-ui;
		}
		
		#videoBBox .input_wrap input::placeholder {
			font: 400 11px system-ui;
			color: #777;
		}
		
		#videoBBox .quick_close, 
		#videoBBox .project_close, 
		#videoBBox .config_close,
		#videoBBox .checkpoint_close {
			width: 37px;
			height: 37px;
			margin-top: -10px;
			display: inline-block;
			cursor: pointer;
			background:
				url("${pageContext.request.contextPath}/resources/images/btn-popup-close-normal.png");
		}
		
		#videoBBox .quick_title {
			font: 400 12px 'Open_Sans';
			padding-bottom: 10px;
		}
		
		#videoBBox .checkBtn {
			display: inline-block;
			width: 16px;
			height: 16px;
			background:
				url("${pageContext.request.contextPath}/resources/images/icon_gpu_check.png")
				no-repeat center;
		}
		
		#videoBBox .list_wrap {
			height: calc(100% - 149px);
			position: relative;
			width: 100%;
		}
		
		#videoBBox table.task_table th {
			border-top: 2px #3a3b3d solid;
			background-color: #fafafa;
			height: 44px;
			font-size: 12px;
			font-weight: 400;
			color: #333333;
		}
		
		#videoBBox table.task_table th, 
		#videoBBox table.task_table tr, 
		#videoBBox table.task_table td
			{
			text-align: center;
			border-bottom: 1px solid #e5e5e5;
			border-collapse: collapse;
			border-spacing: 0;
		}
		
		#videoBBox .table_body table.task_table {
			font-family: Open_Sans;
			font-size: 12px;
			color: #343434;
			font-weight: 300;
			border-collapse: collapse;
			width: 100%;
		}
		
		#videoBBox .table_body table.task_table tr:hover {
			background-color: #f4fcfe;
		}
		
		#videoBBox .table_body table.task_table td {
			padding-top: 3px;
			padding-bottom: 3px;
			font-size: 11px;
			cursor: default;
		}
		
		#videoBBox .table_header table.task_table {
			margin-top: 15px;
			border-collapse: collapse;
			width: 100%;
		}
		/* #videoBBox .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
		#videoBBox .table_body {
			max-height: 340px;
			overflow-y: overlay;
			overflow-x: hidden;
			background-color: #fff;
			position: relative;
			margin-bottom: 17px;
		}
		
		#videoBBox table td {
			height: 48px;
		}
		
		#videoBBox .radioBtn {
			margin-left: 5px;
		}
		
		#videoBBox .csv_name_input_wrap {
			
		}
		
		#videoBBox .csv_name_input_wrap span {
			font: 400 11px system-ui;
		}
		
		#videoBBox .csv_name_input_wrap input {
			font: 400 11px system-ui;
			width: 90%;
			height: 0px;
		}
		
		#videoBBox select {
			height: 40px;
			width: 253px;
			border: 1px solid #dedcde;
			font: 400 11px system-ui;
			background:
				url("${pageContext.request.contextPath}/resources/images/select_arrow.png")
				#fff no-repeat 97% 50%/10px;
		}
		
		#videoBBox select:focus {
			outline: none;
		}
		
		#videoBBox .select_project_wrap {
			position: relative;
			left: -1.5%;
			top: 13px;
		}
		
		#videoBBox .add_project_btn, 
		#videoBBox .training_config_btn, 
		#videoBBox .checkpoint_list_btn
			{
			width: 20px;
			height: 20px;
			margin-left: 18px;
			text-align: center;
			border: 1px solid #dedcde;
			background-color: #fff;
			cursor: pointer;
		}
		
		#videoBBox .add_project {
			width: 260px;
			height: 318px;
			background-color: #fafafa;
			padding: 23px;
			border: 1px solid #d9d9d9;
			top: -1px;
			left: 100%;
			position: absolute;
			z-index: 999;
			display: none;
		}
		
		#videoBBox .training_config {
			width: 385px;
			height: 416px;
			background-color: #fafafa;
			padding: 23px;
			border: 1px solid #d9d9d9;
			top: -1px;
			left: 100%;
			position: absolute;
			z-index: 999;
			display: none;
			overflow-y: scroll;
		}
		
		#videoBBox .add_project.active, 
		#videoBBox .training_config.active,
		#videoBBox .checkpoint_list.active, 
		#videoBBox .inference_config.active {
			display: block !important;
		}
		
		#videoBBox .add_project input[type="text"] {
			width: 210px;
			height: 0px;
		}
		
		#videoBBox .add_project label {
			width: 100px;
			font: 400 12px system-ui;
		}
		
		#videoBBox .add_project textarea {
			width: 210px;
			height: 150px;
			margin: 10px 0;
			font: 400 13px Arial;
		}
		/* #videoBBox .add_project .add_btn { width: 70px; padding: 4px; margin: 0 auto; background-color: #fff; border: 1px solid #dedcde; text-align: center; cursor: pointer; font: 400 13px system-ui; } */
		#videoBBox .training_config input[type=number]::-webkit-inner-spin-button,
			.training_config input[type=number]::-webkit-outer-spin-button {
			-webkit-appearance: none;
			margin: 0;
		}
		
		#videoBBox .training_config input, 
		#videoBBox .inference_config input {
			height: 0px;
		}
		
		#videoBBox .training_config input[type="text"],
		#videoBBox .inference_config input[type="text"]
			{
			width: 145px !important;
		}
		
		#videoBBox .training_config label, 
		#videoBBox .inference_config label {
			width: 180px !important;
			font: 400 12px system-ui;
		}
		
		#videoBBox .inference_config input[type=number]::-webkit-inner-spin-button,
		#videoBBox .training_config input[type=number]::-webkit-outer-spin-button {
			-webkit-appearance: none;
			margin: 0;
		}
		
		#videoBBox .tooltip_wrap {
			width: 17px;
			height: 17px;
			display: inline-block;
			cursor: pointer;
			margin: 0 5px;
			position: relative;
			top: 4px;
			background:
				url("${pageContext.request.contextPath}/resources/images/btn_help_nor.png")
				no-repeat;
		}
		
		#videoBBox .tooltip {
			min-width: 166px;
			max-width: 166px;
			padding: 12px 12px 12px 12px;
			color: #fff;
			background-color: rgba(0, 0, 0, 0.6);
			-webkit-border-radius: 3px;
			-moz-border-radius: 3px;
			border-radius: 3px;
			font: 400 12px system-ui;
			position: absolute;
			z-index: 9999;
			left: 47%;
			padding-left: 12px;
			visibility: hidden;
			opacity: 0;
			transition: visibility 0s, opacity 0.3s ease;
		}
		
		#videoBBox .tooltip.on {
			visibility: visible;
			opacity: 1;
			transition: visibility 0s, opacity 0.3s ease;
		}
		
		#videoBBox .description_wrap {
			min-width: 340px;
			max-width: 340px;
			margin: 17px 0;
			padding: 15px;
		}
		
		#videoBBox .description_wrap.border {
			border: 1px solid #dedcde;
		}
		
		#videoBBox .description_wrap .description {
			font: 400 12px system-ui;
		}
		
		#videoBBox .inference_config_btn {
			width: 20px;
			height: 20px;
			margin-left: 18px;
			text-align: center;
			border: 1px solid #dedcde;
			background-color: #fff;
			cursor: pointer;
			position: absolute;
			top: 13px;
			left: 89%;
			font-size: 13px;
		}
		
		#videoBBox .inference_config {
			width: 385px;
			height: 526px;
			background-color: #fafafa;
			padding: 23px;
			border: 1px solid #d9d9d9;
			top: -1px;
			left: 100%;
			position: absolute;
			z-index: 999;
			display: none;
			overflow-y: scroll;
		}
		
		#videoBBox .checkpoint_list {
			width: 385px;
			height: 490px;
			background-color: #fafafa;
			padding: 23px;
			border: 1px solid #d9d9d9;
			top: -1px;
			left: 100%;
			position: absolute;
			z-index: 999;
			display: none;
			overflow-y: scroll;
		}
		/* #videoBBox .checkBtn { display:inline-block; width: 16px; height: 16px; background: url("${pageContext.request.contextPath}/resources/images/icon_gpu_check.png") no-repeat center; } */
		#videoBBox .checkpoint_list .list_wrap {
			height: calc(100% - 149px);
			position: relative;
			width: 100%;
		}
		
		#videoBBox .checkpoint_list table.checkpoint_table th {
			border-top: 2px #3a3b3d solid;
			background-color: #fafafa;
			height: 44px;
			font-size: 11px;
			font-weight: 400;
			color: #333333;
		}
		
		#videoBBox .checkpoint_list table.checkpoint_table th, 
		#videoBBox .checkpoint_list table.checkpoint_table tr,
		#videoBBox .checkpoint_list table.checkpoint_table td {
			text-align: center;
			border-bottom: 1px solid #e5e5e5;
			border-collapse: collapse;
			border-spacing: 0;
		}
		
		#videoBBox .checkpoint_list .table_body table.checkpoint_table {
			font-family: Open_Sans;
			font-size: 12px;
			color: #343434;
			font-weight: 300;
			border-collapse: collapse;
			width: 100%;
		}
		
		#videoBBox .checkpoint_list .table_body table.checkpoint_table tr:hover
			{
			background-color: #f4fcfe;
		}
		
		#videoBBox .checkpoint_list .table_body table.checkpoint_table td {
			padding-top: 3px;
			padding-bottom: 3px;
		}
		
		#videoBBox .checkpoint_list .table_header table.checkpoint_table {
			margin-top: 15px;
			border-collapse: collapse;
			width: 100%;
		}
		/* #videoBBox .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
		#videoBBox .checkpoint_list .table_body {
			max-height: 340px;
			overflow-y: overlay;
			overflow-x: hidden;
			background-color: #fff;
			position: relative;
			margin-bottom: 17px;
		}
		
		#videoBBox .checkpoint_list table td {
			height: 48px;
		}
		
		#videoBBox .checkpoint_list .checkpoint_table .radioBtn {
			margin-left: 5px;
		}
		
		#videoBBox .checkpoint_list .selected_task_name {
			font: 400 11px system-ui !important;
			color: #777 !important;
		}
		
		#videoBBox .empty_wrap {
			text-align: center;
			margin-top: 120px;
		}
		
		#videoBBox .empty_wrap .no_image {
			margin-bottom: 17px;
			background-repeat: no-repeat;
			background-position-x: center;
		}
		
		#videoBBox .empty_wrap .eng_text {
			font-family: Open_Sans;
			margin-bottom: 3px;
			font-size: 16px;
			font-weight: 300;
			color: #777777;
		}
		
		#videoBBox .empty_wrap .kor_text {
			font-family: Open_Sans;
			font-size: 12px;
			color: #777777;
			font-weight: 200;
			margin-bottom: 120px;
		}
		
		#videoBBox .no_image {
			height: 37px;
			background-image: url('./images/icon_nodata_list.png');
		}
		
		#videoBBox .checkpoint_view {
			width: 270px;
			font: 400 10px system-ui;
			margin: -6px auto -6px 103px;
			display: none;
		}
		
		#videoBBox .checkpoint_view.active {
			display: block;
		}
		
		#videoBBox .inference_checkpoint {
			padding-top: 10px;
		}
		
		#videoBBox .inference_checkpoint .list_wrap {
			height: calc(100% - 149px);
			position: relative;
			width: 100%;
		}
		
		#videoBBox .inference_checkpoint table.checkpoint_table th {
			border-top: 2px #3a3b3d solid;
			background-color: #fafafa;
			height: 44px;
			font-size: 11px;
			font-weight: 400;
			color: #333333;
		}
		
		#videoBBox .inference_checkpoint table.checkpoint_table th, 
		#videoBBox .inference_checkpoint table.checkpoint_table tr,
		#videoBBox .inference_checkpoint table.checkpoint_table td {
			text-align: center;
			border-bottom: 1px solid #e5e5e5;
			border-collapse: collapse;
			border-spacing: 0;
		}
		
		#videoBBox .inference_checkpoint .table_body table.checkpoint_table {
			font-family: Open_Sans;
			font-size: 12px;
			color: #343434;
			font-weight: 300;
			border-collapse: collapse;
			width: 100%;
		}
		
		#videoBBox .inference_checkpoint .table_body table.checkpoint_table tr:hover
			{
			background-color: #f4fcfe;
		}
		
		#videoBBox .inference_checkpoint .table_body table.checkpoint_table td
			{
			padding-top: 3px;
			padding-bottom: 3px;
		}
		
		#videoBBox .inference_checkpoint .table_header table.checkpoint_table {
			margin-top: 15px;
			border-collapse: collapse;
			width: 100%;
		}
		/* #videoBBox .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
		#videoBBox .inference_checkpoint .table_body {
			max-height: 340px;
			overflow-y: overlay;
			overflow-x: hidden;
			background-color: #fff;
			position: relative;
			margin-bottom: 17px;
		}
		
		#videoBBox .inference_checkpoint table td {
			height: 48px;
		}
		
		#videoBBox .inference_algorithm {
			font: 400 10px system-ui;
		}
		
		#videoBBox .side_btn_wrap {
			margin: 0 auto;
			width: 60%;
		}
		
		#videoBBox .side_btn_wrap .cancel_btn {
			width: 100px;
			line-height: 36px;
			margin: 0 auto;
			padding: 10px 0px;
			margin-top: 5px;
			text-align: center;
			background-color: #fff;
			color: #777;
			font: 300 11px system-ui;
			cursor: pointer;
			border: 1px solid #e0e0e0;
		}
		
		#videoBBox .side_btn_wrap .save_btn, 
		#videoBBox .side_btn_wrap .add_btn {
			width: 100px;
			line-height: 36px;
			padding: 10px 0px;
			margin: 0 auto;
			margin-top: 5px;
			text-align: center;
			background-color: #4c84ff;
			color: #fff;
			font: 300 11px system-ui;
			cursor: pointer;
			border: 1px solid #e0e0e0;
		}
		
		#videoBBox .checkpoint_list .side_btn_wrap {
			margin-top: 60px;
			text-overflow: ellipsis;
		}
		
		#videoBBox .quick_wrap select { padding: 5px 20px; }
		#videoBBox .video_pwrap { height: calc(100% - 250px); border-top: 1px solid #eee; }				
		
		#videoBBox .data_list_header { margin-top: -10px; }
		#videoBBox .data_list_header .close_btn { font-size: 24px; cursor: pointer; position: relative; top: -5px; }	
		#videoBBox .data_list_header .close_btn:hover { color: #4c84ff; }	
		
		#videoBBox input.category::placeholder { font-size: 11px; }				
		
		#videoBBox .error_video { width: 100%; display: none; }
		#videoBBox .pre_video_error { width: 200px; height: 115px; background-color: #fff; border: 1px solid #eee; padding: 40px; z-index: 90; color: #cdcdcd; }
		#videoBBox .pre_video_error .error_img { width: 53px; height: 53px; margin: 0 auto; margin-bottom: 10px; background: url('${pageContext.request.contextPath}/resources/images/img_nodata.png') no-repeat; opacity: 0.4; }
		#videoBBox .pre_video_error .error_msg { width: 100%; font-size: 14px; font-weight: 300; }
		#videoBBox .pre_video_error .error_msg span { width: 100%; font-size: 11px; display: inline-block; font-weight: 300; }		
		
		#videoBBox .no_label { width: 84%; padding: 180px 30px; text-align: center; color: #cdcdcd; }
		#videoBBox .no_label div:nth-of-type(1) { width: 53px; height: 53px; margin: 0 auto; margin-bottom: 11px; background: url('${pageContext.request.contextPath}/resources/images/img_nodata.png') no-repeat; opacity: 0.4; /*  */}
		#videoBBox .no_label div:nth-of-type(2) { font-size: 16px; font-weight: 300; margin-bottom: 3px; }
		#videoBBox .no_label div:nth-of-type(3) { font-size: 12px; font-weight: 300; }				
		
		#videoBBox section.tag { width: 486px; height: 100%; position: relative; background-color: #fff; border: 1px solid #e5e5e5; border-bottom: 0; -ms-user-select: none; -moz-user-select: none; -webkit-user-select: none; -khtml-user-select: none; user-select: none; }
		#videoBBox section.tag .tag_margin { margin: 0 auto; padding: 10px; }
 		#videoBBox section.tag .tag_total { color: #777; font-weight: 400; padding: 20px; }
 		#videoBBox section.tag .tag_wrap { width: 100%; height: 90px; margin-top: 1px; border-top: 1px solid #e5e5e5; font-size: 11px; justify-content: center; } 
		#videoBBox section.tag .tag_wrap .content { width: 100%; height: auto; max-height: 75px; overflow-y: scroll; overflow-x: hidden; flex-wrap: wrap; -ms-overflow-style: none; }
		#videoBBox section.tag .tag_wrap .content::-webkit-scrollbar { display: none; }		
		#videoBBox section.tag .tag_wrap .tag { width: 81px; margin: 10px 5px; line-height: 32px; background: #f4f7fc; border: 1px solid #d9d9d9; border-radius: 4px; text-align: center; font-size: 14px; font-weight: 300; color: #555; cursor: pointer; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; }
		#videoBBox section.tag .tag_wrap .tag.selected { background-color: #4c84ff; border-color: #2b65e6; color: #fff; box-shadow: 0 3px 4px 0 rgba(159, 189, 255, 0.7); }
		#videoBBox .hover_box {border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
		#videoBBox .hover_box div {font-family: Open_Sans; font-size: 13px; color: #555555;}
		#videoBBox .hover_div div {word-break: break-word; margin: 2px 5px; white-space: normal; font-weight: 300; font-family: Open_Sans;}			
      </style>
   </head>
   <body id="page-top">
      <!-- Page Wrapper -->
      <div id="wrapper">
<%--          <jsp:include page="/side"  flush="false" /> --%>
         <!-- Content Wrapper -->
         <div id="content-wrapper" class="d-flex flex-column">
         
            <!-- Main Content -->
            <div id="content">
<%--                <jsp:include page="/nav"  flush="false" /> --%>
               
               <!-- Begin Page Content -->
               <div id="videoBBox" class="container-fluid">
                  <!-- Page Heading -->


                  <div class="card shadow mb-4 flex fs">
                  
                  	<section class="enrichment">
	                     <div class="header_wrap flex sb">
		                  	<div class="page_title_wrap">
		                  		<span>Enrichment</span> <span>|</span> Video Bounding Box
	                  		</div>
	                  	</div>
                 		<div class="prev_btn prev_data"></div>
						<div class="next_btn next_data"></div>	  
						<div class="video_pwrap flex">
	                   		<div class="video_wrap flex tab-pane active" id="videoBBox-labeller" role="tabpanel" >				             			
	                   			<video class="video video-js vjs-default-skin" id="videoBBox-video"></video>
	                   			<div class="error_video" id="error_video"></div>
	                   			<canvas class="canvas" id="videoBBox-canvas"></canvas>
							</div>
						</div>                	
	               		<div class="img_list_wrap flex sb"> <!-- Image Slide area start -->
	<!--                  			<div>Image Slide Section</div> -->
							<div class="list_btn_wrap">
								<div class="data_list_btn"></div>
							</div>
		
							<div class="name_wrap flex sb">
								<div class="video_name"></div>
							</div>
                   			<div class="btn_wrap flex">
								<button type="button" class="prev-5  btn-outline-primary btn">-5</button>
	                   			<button type="button" class="prev  btn-outline-primary btn">-1</button>
	                   			<button type="button" class="play_btn btn btn-outline-primary">
	                   				<i class="fa fa-play fa-lg" aria-hidden="true"></i>
	                   			</button>
	                   			<button type="button" class="next  btn-outline-primary btn">+1</button>
	                   			<button type="button" class="next-5  btn-outline-primary btn">+5</button>
	                   			<div class="frame_wrap flex">
		                   			<div class="curr_frame  mr-2">Frame : </div>
	                   				<input class="curr_frame " name="curr_frame" type="text" value="0" onkeyPress="return checkNum2(event);">
		                   			<div class="total_frame ml-2"> / <span></span></div>	
	                   			</div>
                   			</div>							
							<div class="position_wrap">
		                			<input type="text" class="position-value" value="1" onKeyPress="return checkNum2(event);"/>
		                			<div class="total_count"> / <span></span></div>							
							</div>							
			                <div class="data_list_wrap">
<!-- 			                 	<div class="data_total">Total <span>0</span></div> -->
								<div class="data_list_header flex sb">
									<div class="data_total">Total <span>0</span></div>
									<div class="close_btn">&times;</div>
								</div>	
								<div class="list_table">
									<div class="h_wrap flex">
										<div class="preview">PREVIEW</div>
										<div class="id">ID</div>
										<div class="path">FILE NAME</div>
										<div class="label_cnt">LABELS</div>
									</div>
										<ul class="c_wrap">
										</ul>
									<div class="f_wrap flex">
										<div id="pagination" class="tui-pagination filter_color"></div>
									</div>
								</div>
			                 </div> 	
	               		</div>              <!-- Image Slide area end -->  							                  	                 	
	               		<div class="quick_wrap flex"> <!-- Quick Training & Inference Btn area start -->
							<div id="quick_training_btn" class="quick_btn filter_color">Quick Training</div>
							<div id="quick_inference_btn" class="quick_btn filter_color">Quick Inference</div>
							
							<!-- Quick Training -->
							<div id="quick_training" class="quick_training filter_color">
								<div class="quick_title">
									Quick Training<span class="quick_close fr"></span>
								</div>
								<div class="input_wrap flex">
									<label>Annotation</label> 
									<input type="text" name="annotation_name" data-length="100" placeholder="Please enter the annotation name" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'>
								</div>
								<div class="input_wrap flex">
									<label>Project</label> <select id="project_result"
										class="project_result" name="project_result">
		
									</select> <span class="add_project_btn">+</span>
								</div>
								<div class="input_wrap flex"> 
									<label>Task</label> <input type="text" name="task_name"
										placeholder="Please enter the task name" data-length="100" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'>
								</div>
								<div class="input_wrap flex">
									<label>Description</label> <input type="text"
										name="task_contents"
										data-length="200" 
										placeholder="Please enter the task description">
								</div>
								<div class="input_wrap flex">
									<label>Inheritance</label> <select id="task_result"
										class="task_result" name="task_result">
		
									</select> <span class="checkpoint_list_btn">+</span>
								</div>
								<span class="checkpoint_view"></span>
								<div class="input_wrap flex">
									<label>Algorithm</label> <select id="algorithm_result"
										class="algorithm_result" name="algorithm_result">
		
									</select> <span class="training_config_btn">+</span>
								</div>
								<div class="quick_btn_wrap">
									<div class="quick_training_btn">Start Training</div>
								</div>
								<div id="add_project" class="add_project">
									<div class="quick_title">
										Create New Project
										<!-- 								<span class="project_close fr"></span>							 -->
									</div>
									<input type="text" name="title"
										placeholder="Please enter the title" data-length="100" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'>
									<textarea class="contents_area" name="contents"
										data-length="200" 
										placeholder="Please enter the description"></textarea>
									<div class="side_btn_wrap flex">
										<div class="cancel_btn">Cancel</div>
										<div class="add_btn">Create</div>
									</div>
		
								</div>
								<div id="checkpoint_list" class="checkpoint_list">
									<div class="quick_title">
										Select Model <span class="selected_task_name"></span>
										<!-- 								<span class="checkpoint_close fr"></span> -->
									</div>
									<div class="list_wrap">
										<div class="table_header">
											<table class="checkpoint_table">
												<colgroup>
													<col style="width: 15px;"></col>
													<col style="width: 200px;"></col>
												</colgroup>
												<thead>
													<tr>
														<th><div class="checkBtn"></div></th>
														<th>MODEL</th>
													</tr>
												</thead>
											</table>
										</div>
										<div class="table_body">
											<table class="checkpoint_table">
												<colgroup>
													<col style="width: 15px;"></col>
													<col style="width: 200px;"></col>
												</colgroup>
												<tbody>
													<!--                                     <tr><td colspan='4' align='center'>Loading GPU list...</td></tr> -->
												</tbody>
											</table>
										</div>
									</div>
									<div class="side_btn_wrap flex">
										<div class="cancel_btn">Cancel</div>
										<div class="save_btn">Save</div>
									</div>
								</div>
								<div id="training_config" class="training_config">
									<div class="quick_title">
										Training Config
										<!-- 								<span class="config_close fr"></span>		 -->
									</div>
									<div class="description_wrap"></div>
									<div class="config_wrap"></div>
									<div class="side_btn_wrap flex">
										<div class="cancel_btn">Cancel</div>
										<div class="save_btn">Save</div>
									</div>
								</div>
							</div>
		
		
		
							<!-- Quick Inference -->
							<div id="quick_inference" class="quick_inference filter_color">
								<div class="quick_title">
									Quick Inference<span class="quick_close fr"></span>
								</div>
								<div class="csv_name_input_wrap">
									<!-- 							<span>output file name</span> -->
									<input type="text" name="csv_title"
										placeholder="Please enter the output file name" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>
								</div>
								<div class="quick_task_list">
									<div class="list_wrap">
										<div class="table_header">
											<table class="task_table">
												<colgroup>
													<col style="width: 25px;"></col>
													<col style="width: 200px;"></col>
													<col style="width: 5px;"></col>
												</colgroup>
												<thead>
													<tr>
														<th><div class="checkBtn"></div></th>
														<th>Select Task</th>
														<th><span class="inference_config_btn">+</span></th>
													</tr>
												</thead>
											</table>
										</div>
										<div class="table_body">
											<table class="task_table">
												<colgroup>
													<col style="width: 15px;"></col>
													<col style="width: 200px;"></col>
												</colgroup>
												<tbody>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="quick_btn_wrap">
									<div class="quick_inference_btn">Start Inference</div>
								</div>
								<div id="inference_config" class="inference_config">
									<div class="quick_title">
										Inference Config & Select Model
										<!-- 								<span class="config_close fr"></span>		 -->
									</div>
									<div class="inference_algorithm"></div>
									<div class="description_wrap"></div>
									<div class="config_wrap"></div>
									<div class="inference_checkpoint">
										<div class="list_wrap">
											<div class="table_header">
												<table class="checkpoint_table">
													<colgroup>
														<col style="width: 15px;"></col>
														<col style="width: 200px;"></col>
													</colgroup>
													<thead>
														<tr>
															<th><div class="checkBtn"></div></th>
															<th>MODEL</th>
														</tr>
													</thead>
												</table>
											</div>
											<div class="table_body">
												<table class="checkpoint_table">
													<colgroup>
														<col style="width: 15px;"></col>
														<col style="width: 200px;"></col>
													</colgroup>
													<tbody>
														<!--                                     <tr><td colspan='4' align='center'>Loading GPU list...</td></tr> -->
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="side_btn_wrap flex">
										<div class="cancel_btn">Cancel</div>
										<div class="save_btn">Save</div>
									</div>
								</div>
							</div>								
	               		</div>                        		
                  	</section>
                  	<section class="label_tag">
	                    <section class="tag">
	                   			<div class="btn_wrap flex sb">
	               					<div class="label_title">Tag (<span></span>)</div>
<!-- 	               					<div class="tag_total">Total <span>0</span></div> -->
	                   			</div>	  
               					<div class="tag_wrap">
               						<div class="tag_margin"></div>
               					</div>	                   			                   	
	                    </section>                  		
	                  	<section class="label">
							<!-- label area start -->
	                   		<div class="label_wrap ">
	                   			<div class="btn_wrap flex sb">
	               					<div class="label_title">Label (<span></span>)</div>
	<!--                					<div class="visible on"></div> -->
									<button type="button" class="btn btn-primary add filter_color">+ Add Label</button>
	                   			</div>
	                   			<div class="category_wrap flex fs"></div>
	<!--                    			<div class="tag_wrap flex">Label Group Tag Area (#label)</div> -->
	                   		</div><!-- label area end -->            
			                <div class="save_btn_wrap flex">
	                 				<button type="button" class="btn btn-primary save filter_color">Save</button>
	                 		</div>		                   		      	
	                  	</section>                  	
                  	</section>

                  

                     
                     <!-- labeller worksheet start -->
<!--                      <div class="py-3 labeller_container tab-content"> -->
                     	
                 		                 		                   		
<!--                      </div>labeller worksheet end -->
                     
                     
                     
                  </div>
               </div>
            </div>
            <!-- End of Main Content -->
<%--       		<jsp:include page="/footer"  flush="false" /> --%>


         </div>
         <!-- End of Content Wrapper -->
      </div>
      <!-- End of Page Wrapper -->
<%--       <script src="<c:url value="/js/common.js" />"></script> --%>
      
      <script>
		$(function(){
			var that = videoBBox;
			// player init
			that.data.player = videojs('videoBBox-video', that.data.videoObj);
			
			that.data.canvas = new fabric.Canvas('videoBBox-canvas',{
				selection : false,
				width : 800,
				height : $("#videoBBox .video_wrap")[0].clientHeight-40,
				uniScaleTransform : true,
			});
			
			// video-frame plugin 설정
			that.data.playerFrame = VideoFrame({
				id : $('#videoBBox-video'),
// 				frameRate : 30,
// 				callback : function(frame){
// 					that.computed.checkMetaFrame(frame);
// 				},
				callback : function(frame,format){
					
					/*
					* NETWORKSTATE
					* NETWORK_EMPTY :  0
					* NETWORK_IDLE :  1 (using this while playing)
					* NETWORK_LOADING :  2
					* NETWORK_NO_SOURCE :  3
					*/
					if(that.data.player.networkState() == 1){
						that.computed.checkMetaFrame(frame);
						that.render.inputCurrFrame(frame);
					}
				},
			});
			
	        // jh.sa error display test
		    that.data.player.on('error', function(e){
// 	        	    //console.log(e);
// 	        	    e.stopImmediatePropagation();
	        	    var error = this.player().error();
	        	    //console.log('error!', error.code, error.type , error.message);
					$("#videoBBox .empty_wrap").remove();
					var html = '<div class="empty_wrap"><div class="no_image"></div><div class="eng_text">Failed to Play</div><div class="kor_text">The media could not be loaded</div></div>';
					$("#videoBBox #videoBBox-video").hide();
					$("#videoBBox .canvas-container").hide();
					$("#videoBBox .error_video").show();
					$("#videoBBox .error_video").prepend(html);
					var no_label = '<div class="no_label"><div></div><div>No Label</div><div>Please Add Label</div></div>';
					$("#videoBBox .category_wrap").html(no_label);					
		    });				
			
			// 비디오 클립 로딩
			that.data.player.on('loadedmetadata',function(evt){
				$("#videoBBox .error_video").hide();
				$("#videoBBox #videoBbox-video").show();
				$("#videoBBox .canvas-container").show();					
				that.computed.getScaleFactor();
				that.render.adjustArea();
				that.computed.getMetaByDataId(that.data.player.dataId);
				// jh.sa 210226 tag
				that.computed.getLabelGroup(that.data.player.dataId);
				return;
			});
			
			that.bind.evtOnceInit();
// 			videoBBox.init();
		    
		});
		
		const videoBBox = {
				pt : $("#videoBBox"),
				data : {
					
					// player params
					player : null,
					playerFrame : null,
// 					currDataPage : 1,
					videoObj : {
						videoId : null,
						currDataNum : 1,
						datasetId : null,
						isModified : 0,
						controls : true,
						autoplay : false,
						loadingSpinner:false,
						height:"auto",
						width:"auto",
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
						state : false,
					},

					// initial canvas and canvas var
					canvas : null,
					canvasObj : {
						isDown : null,
						origX : 0, 
						origY : 0, 
						freeDrawing : true,
						isRectActive : true,
					},
					
					scaleFactor : {origWidth:0, origHeight:0, ratio:1, minBboxSize:0},
					
					meta : {},
					
					colorHash : null,
					// initial canvas and canvas var end
					
					tag : [],
					
					
				}, // data end

				datasetInit : function(dataset_id){
					const that = videoBBox;
					var data_list_wrap = $("#videoBBox .data_list_wrap");
					data_list_wrap.removeClass("active");
					data_list_wrap.css("display", "none");
					
					that.data.videoObj['datasetId'] = null;
					that.data.videoObj['datasetId'] = dataset_id;
					that.init(dataset_id);
				},
				// ㅌㅍ
				init : function(datasetId) {
					const that = videoBBox;
// 					that.bind.evtOnceInit();
					// jh.sa 추가 		
					var nodes = wsObj["inspection"].dir.getSelectedNodes();
					var state = that.data.videoObj["state"];
					console.log("status : " + nodes[0].status);
					if(state == false && $("#" + nodes[0].tId + "_loading").hasClass("upload_wait")) {
		  				alert("데이터를 업로드 하는 중입니다...");
		  				state = true;
		  				/* history.go(0); */
		  			}	
					
// 					var isInit = true
					that.computed.clearAllData();
					that.bind.resetView();
					that.data.colorHash = new ColorHash();
					that.data.videoObj['currDataNum'] = 1;
					
					// jh.sa 추가
					that.computed.getDatasetById(datasetId);
					$("#imgSeg .label_wrap .btn_wrap .add").hide();
// 					var dataSet = "5";
					//var page_num = 0;
					let last_cursor = that.computed.getLastCursor(datasetId);
					var page_num = Math.floor(last_cursor / 50);
					console.log("last_cursor : " + last_cursor);
					/* that.computed.getVideoDataList(page_num,datasetId); */
					that.computed.getVideoDataList(page_num, datasetId, last_cursor);
					// jh.sa 210122
					that.computed.initControlBar();
// 					that.computed.getVideoDataList("",isInit,page_num);
// 					that.bind.evtOnceInit();
					that.bind.sideEvtCollision();
					labeller.bind.evtAll();
					
					// Quick Training & Inference
					$("#videoBBox .quick_training").removeClass("active");
					$("#videoBBox .quick_inference").removeClass("active");
					$("#videoBBox .quick_task_list .list_wrap .table_body .task_table tbody").html("");
					videoBBoxQuick.init();		
					
					that.bind.keydownEvt();
				}, // init end
				bind : {
					evtOnceInit : function(){
						this.collision();
						this.downEvt();
						this.moveEvt();
						this.upEvt();
						this.objMovingEvt();
						this.objModifiedEvt();
						this.objScalingEvt();
// 						this.keydownEvt();
					},
					collision : function(player,canvas) {
						const that = videoBBox;
						
						// video play event
						that.data.player.one('play', function(e) {
							that.data.playerFrame.listen('frame',48);
							var isPaused = false;
							that.render.renderTogglePlayBtn(isPaused);
							
							that.bind.sideEvtCollision();
						});	// video play event end
						
						// video pause event
						that.data.player.one('pause', function(e){
							var frame = that.data.playerFrame.get();
							that.render.inputCurrFrame(frame);
							var isPaused = true;
							that.render.renderTogglePlayBtn(isPaused);
							that.bind.sideEvtCollision();
						}); //// video pause event end 
						
						// jh.sa 201202
						that.data.player.on('ended', function(e) {
// 							that.data.playerFrame.listen('frame',48);
							
							$(e.target).find(".vjs-play-progress").css("width","100%");
							$("#videoBBox .vjs-play-control.vjs-control").removeClass("vjs-paused");
							$("#videoBBox .vjs-play-control.vjs-control").removeClass("vjs-ended");							
							var frame = that.data.playerFrame.get();
							that.render.inputCurrFrame(frame);
							var isPaused = true;
							that.render.renderTogglePlayBtn(isPaused);
							that.bind.sideEvtCollision();
						});	// video ended event end							
						
						that.data.player.controlBar.playToggle.on("click",function(e){
							var status = that.data.player.paused();
							that.render.renderTogglePlayBtn(status);
						});
						
						
						that.data.player.controlBar.progressControl.on("mouseup",function(e){
							that.data.player.pause();
							var frame = that.data.playerFrame.get();
							that.render.inputCurrFrame(frame);
							that.computed.checkMetaFrame(frame);
							
						});

						that.data.player.controlBar.progressControl.on("mousedown",function(e){
							that.data.player.pause();
						});
						that.data.player.controlBar.progressControl.seekBar.on("mousedown",function(e){
							that.data.player.pause();
						});
						
						that.data.player.controlBar.progressControl.on("mousemove",function(e){
							var frame = that.data.playerFrame.get();
							that.render.inputCurrFrame(frame);
							that.computed.checkMetaFrame(frame);
						});
						
						that.data.player.controlBar.progressControl.on("mouseover",function(e){
							that.data.player.controlBar.progressControl.enable();
						});
						
						that.data.player.controlBar.progressControl.on("mouseleave",function(e){
							that.data.player.controlBar.progressControl.disable();
						});						
						
						
						
					}, //collision end
					
					downEvt : () => { // canvas rect mouse down event
						const that = videoBBox;
						 
						that.data.canvas.on('mouse:down',function(o){
// 							 that.data.canvasObj.isDown = true;			// 다른부분(원래 없었음)
// 							if(that.data.player.paused()==false){
// 								that.data.player.pause();
// 							}							
							// 처음 init시에 label 리스트가 추가되는 것보다 이벤트가 먼저 실행되는 것을 막는 처리
							if(that.data.meta && $("#videoBBox .label_wrap .category_wrap .cate_wp.selected").length == 0){
								return false;
							}
							
							var uuid = "";
							if($("#videoBBox .label_wrap .category_wrap .cate_wp.selected").length == 0){
								return
							}else{
								// jh.sa 210127 라벨을 그리거나 선택할 때만 영상이 일시정지 되도록 수정 									
								if(that.data.player.paused()==false){
									that.data.player.pause();
									var isPaused = true;
									that.render.renderTogglePlayBtn(isPaused);
								}								
								uuid = $("#videoBBox .label_wrap .category_wrap .cate_wp.selected")[0].id;
								that.data.canvasObj.freeDrawing = true;
// 								uuid = $("#videoBBox .label_wrap .category_wrap .cate_wp.selected")[0].id;	// 다른부분 (원래 없었ㅇ음)
// 								that.data.canvasObj.freeDrawing = true;
							}
					    	
							var canv = that.data.canvas.getObjects();
					    	for(var i=0; i<canv.length; i++){
					    		if(canv[i]["uuid"] == uuid){
					    			$("#videoBBox .label_wrap .category_wrap .cate_wp").removeClass("selected");	// 다른부분 (원래 없었음)
					    			that.data.canvasObj.freeDrawing = false;					    		// 다른부분 (원래 없었음)
					    			return;
					    		}
					    	}

					    	$("#videoBBox-video .vjs-progress-control").hide();
					    	
// 							if (that.data.canvasObj.freeDrawing && o.target == null ) {
							if (that.data.canvasObj.freeDrawing && uuid != "") {	
								var uuid = $("#videoBBox .label_wrap .category_wrap .cate_wp.selected")[0].id;
							    var pointer = that.data.canvas.getPointer(o.e);
							    
							 	// k.park 201217 lock movement
							    for(var i=0; i<canv.length; i++){
							    	canv[i].lockMovementX = true;
									canv[i].lockMovementY = true;	
							    }							    
							    
							    that.data.canvasObj.origX = pointer.x;
							    that.data.canvasObj.origY = pointer.y;
							    that.data.canvasObj.isDown = true;			// 다른부분(원래는 주석 해제) => k.park 주석해제
							    
							    if(that.data.canvasObj.isRectActive && $("#videoBBox .label_wrap .category_wrap .cate_wp").length > 0) {

									var temp = {
										uuid : uuid,
	 							    	left : that.data.canvasObj.origX,
	 							    	top : that.data.canvasObj.origY,
	 							    	width : pointer.x-that.data.canvasObj.origX,
	 							    	height : pointer.y-that.data.canvasObj.origY,
									}
								    
									var rectObj = that.computed.getRectObject(temp);
							    	that.computed.initRect(uuid,rectObj);
								}
							}
							
							
						});
					},// canvas rect mouse down event end
					
					moveEvt : () => { // canvas rect mouse move event
						const that = videoBBox;
						var data = that.data;
						var canvas = that.data.canvas;
						
						canvas.on('mouse:move', function(o) {
							
							var tempRect = canvas.getActiveObject();
							
						    if (data.canvasObj.isDown && data.canvasObj.freeDrawing) {
								var pointer = canvas.getPointer(o.e);
								var uuid = $("#videoBBox .label_wrap .category_wrap .cate_wp.selected")[0].id;
							    if( data.canvasObj.isRectActive && $("#videoBBox .label_wrap .category_wrap .cate_wp").length > 0 ) {
							    	
							    	var canvs = canvas.getObjects();
									for(var i=0; i<canvs.length; i++){
										if(canvs[i]['uuid'] != uuid){
											canvs[i].lockMovementX = true;
											canvs[i].lockMovementY = true;
										}
									}
							    	
							    	if(pointer.x < 0){
							    		pointer.x = 0;
							    	}
							    	if(pointer.y < 0){
							    		pointer.y = 0;
							    	}
							    	if(pointer.x > canvas.getWidth()){
							    		pointer.x = canvas.getWidth();
							    	}
							    	if(pointer.y > canvas.getHeight()){
							    		pointer.y = canvas.getHeight();
							    	}
							    	
							    	if(data.canvasObj.origX > pointer.x){
							    		tempRect.set({ left: pointer.x });
								    }else{
								    	tempRect.set({ left: data.canvasObj.origX });
								    }
								    if(data.canvasObj.origY > pointer.y){
								    	tempRect.set({ top: pointer.y });
								    }else{
								    	tempRect.set({ top: data.canvasObj.origY });
								    }
								    
								    tempRect.set({ width: Math.abs(data.canvasObj.origX - pointer.x) });
								    tempRect.set({ height: Math.abs(data.canvasObj.origY - pointer.y) });
								    
								}
							    canvas.renderAll();
						   } 
							
						});
					},// canvas rect mouse move event end
					
					upEvt : () => { // canvas rect mouse up event
						const that = videoBBox;
						var data = that.data;
						var meta = that.data.meta;
						var canvas = that.data.canvas;
						
						canvas.on('mouse:up', function(e) {
					    	
							if(e.target && canvas.getActiveObject() == e.target){
							
								$("#videoBBox .label_wrap .category_wrap .cate_wp").removeClass("selected");
								$("#videoBBox .label_wrap .category_wrap .cate_wp[id='"+e.target.uuid+"']").addClass("selected");
								let color = that.data.colorHash.rgb(e.target.uuid);
								$("#videoBBox .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
								$("#videoBBox .label_wrap .category_wrap .cate_wp[id='"+e.target.uuid+"'].selected ").css("border-color","rgb("+color+")");
								
							}else if($("#videoBBox .label_wrap .category_wrap .cate_wp").length == 0){
								alert("라벨을 추가해 주세요!");
								return false;
							} else if($("#videoBBox .label_wrap .category_wrap .cate_wp.selected").length == 0){
								//console.log("wp : " + $(pt+" .label_wrap .category_wrap .cate_wp.selected").length);
								alert("선택된 바운딩 박스가 없습니다.\n추가나 수정을 원하시면, 바운딩박스를 클릭하거나 라벨추가를 눌러주세요.");
								return false;
							}
							$("#videoBBox-video .vjs-progress-control").show();
							
							var tempRect = canvas.getActiveObject();
							if(tempRect ==null && tempRect == undefined){
								return false;
							}
							// jh.sa 201125 : 가장자리 쪽에 바운딩 박스를 그린 경우 left, top 값의 오차 조정 
							var ow = that.data.scaleFactor.origWidth;
							var oh = that.data.scaleFactor.origHeight;
							var sf = that.data.scaleFactor.ratio;
							var minBboxSize = that.data.scaleFactor.minBboxSize;
							
							
							if(tempRect.width < minBboxSize){
								const tw = tempRect.width;
								tempRect.set({width : minBboxSize});
								// 우측 가장자리
								if(((tempRect.left / sf) + (tempRect.width / sf)) > ow){
									tempRect.set({width : minBboxSize, left: tempRect.left - (minBboxSize-tw) });
								}								
								canvas.renderAll();
							}
							if(tempRect.height < minBboxSize){
								const th = tempRect.height;
								tempRect.set({height : minBboxSize});
								// 하단 가장자리
								if(((tempRect.top / sf) + (tempRect.height / sf)) > oh){
									tempRect.set({height : minBboxSize, top: tempRect.top - (minBboxSize-th) });
								}									
								canvas.renderAll();
							}
							//
							
							var currFrame = data.playerFrame.get();
							
							if(data.canvasObj.freeDrawing) {
								data.canvasObj.isDown = false;
								data.canvasObj.isRectActive = !data.canvasObj.isRectActive;
								data.canvasObj.freeDrawing = !data.canvasObj.freeDrawing;
							}
							
							
							var uuid = $("#videoBBox .label_wrap .category_wrap .cate_wp.selected")[0].id;
							var panelObj=[];
							if(!e.target || e.target != tempRect){
								that.computed.saveMetaData(tempRect, currFrame, uuid);
							}else{
								// jh.sa 201125 
								var activeObj = that.data.canvas.getActiveObject();
								var rectObj = {
									top : e.target.top,
									left : e.target.left,
// 									width : e.target.getScaledWidth(),
// 									height : e.target.getScaledHeight(),
									width : activeObj.width,
									height : activeObj.height,
								}
								// label box scroll move
								var labelBoxHeight = $("#videoBBox .label_wrap .category_wrap #"+uuid+"")[0].offsetTop;
								$("#videoBBox .label_wrap .category_wrap").animate({
									scrollTop:labelBoxHeight-60
								},500);
								
								// save meta
								that.computed.saveMetaData(rectObj, currFrame, uuid);
							}
							
							tempRect.setCoords();
							data.canvasObj.isRectActive = true;
							data.canvasObj.freeDrawing = true;
							
						});
					},// canvas rect mouse up event end
					
					objMovingEvt : () => {
						const that = videoBBox;
						var canvas = that.data.canvas;
						that.data.canvas.on("object:moving",function(evt){
							$("#videoBBox-video .vjs-progress-control").hide();
							
							var tempRect = that.data.canvas.getActiveObject();
							tempRect = {
									left : evt.target.left,
									top : evt.target.top,
									width : evt.target.width,
									height : evt.target.height,
							}
							
							if(( tempRect.left + tempRect.width ) > canvas.getWidth() ){
								tempRect.left = canvas.getWidth() - tempRect.width;
							}
							if(( tempRect.top + tempRect.height ) > canvas.getHeight() ){
								tempRect.top = canvas.getHeight() - tempRect.height;
							}
							if(tempRect.width > canvas.getWidth()){
								tempRect.width = canvas.getWidth();
							}
							if(tempRect.height > canvas.getHeight()){
								tempRect.height = canvas.getHeight();
							}
							if(tempRect.left < 0){
								tempRect.left = 0;
							}
							if(tempRect.top < 0){
								tempRect.top = 0;
							}
							evt.target.left = tempRect.left;
							evt.target.top = tempRect.top;
							
						});
					},
					
					objModifiedEvt : () => {
						const that = videoBBox;
						var canvas = that.data.canvas;
						canvas.on("object:modified",function(evt){
							
							var canvs = canvas.getObjects();
							for(var i=0; i<canvs.length; i++){
								canvs[i].lockScalingX = false;
								canvs[i].lockScalingY = false;
								canvs[i].lockMovementX = false;
								canvs[i].lockMovementY = false;
							}
							
// 							that.data.canvas.getActiveObject().lockScalingX = false;
// 							that.data.canvas.getActiveObject().lockScalingY = false;	
// 							that.data.canvas.getActiveObject().lockMovementX = false;
// 							that.data.canvas.getActiveObject().lockMovementY = false;

							// jh.sa 210122
							that.data.videoObj['isModified'] = 1;
						});
					},
					
					objScalingEvt : () => {
						const that = videoBBox;
						var canvas = that.data.canvas;
						
						canvas.on("object:scaling",function(evt){
							$("#videoBBox-video .vjs-progress-control").hide();
							
							var tempRect = that.data.canvas.getActiveObject();
							var pointer = canvas.getPointer(evt.e);
							var minBboxSize = that.data.scaleFactor.minBboxSize;
							
							tempRect.width = evt.target.getScaledWidth();
							tempRect.left = evt.target.left;
							tempRect.height = evt.target.getScaledHeight();
							tempRect.top = evt.target.top;
							
							// selection pointer 별 예외처리
							switch (evt.transform.corner){
								case "tl":
									if(pointer.x >= tempRect.aCoords.tr.x-minBboxSize){
										pointer.x = tempRect.aCoords.tr.x-minBboxSize;
										evt.target.left = pointer.x;
									}
									if(pointer.y >= tempRect.aCoords.bl.y-minBboxSize){
										pointer.y = tempRect.aCoords.bl.y-minBboxSize;
										evt.target.top = pointer.y;
									}
									
									tempRect.set({
										width : Math.abs(tempRect.aCoords.tr.x - pointer.x),
										height : Math.abs(tempRect.aCoords.bl.y - pointer.y)
									});
									evt.target.scaleX = tempRect.width / evt.target.width;
									evt.target.scaleY = tempRect.height / evt.target.height;
									break;
								case "mt":
									if(pointer.y >= tempRect.aCoords.br.y-minBboxSize){
										pointer.y = tempRect.aCoords.br.y-minBboxSize;
										evt.target.top = pointer.y;
									}
									
									tempRect.set({
										width : Math.abs(tempRect.aCoords.tr.x - tempRect.aCoords.tl.x),
										height : Math.abs(tempRect.aCoords.br.y - pointer.y)
									});
									evt.target.scaleX = tempRect.width / evt.target.width;
									evt.target.scaleY = tempRect.height / evt.target.height;
									break;
								case "tr":
									if(pointer.x <= tempRect.aCoords.tl.x-minBboxSize){
										pointer.x = tempRect.aCoords.tl.x;
										evt.target.left = pointer.x;
									}
									if(pointer.y >= tempRect.aCoords.br.y-minBboxSize){
										pointer.y = tempRect.aCoords.br.y-minBboxSize;
										evt.target.top = pointer.y;
									}
									
									tempRect.set({
										width : Math.abs(tempRect.aCoords.tl.x - pointer.x),
										height : Math.abs(tempRect.aCoords.br.y - pointer.y) 
									});
									evt.target.scaleX = tempRect.width / evt.target.width;
									evt.target.scaleY = tempRect.height / evt.target.height;
									break;
								case "bl":
									if(pointer.x >= tempRect.aCoords.br.x-minBboxSize){
										pointer.x = tempRect.aCoords.br.x-minBboxSize;
										evt.target.left = pointer.x;
									}
									if(pointer.y <= tempRect.aCoords.tl.y+minBboxSize){
										pointer.y = tempRect.aCoords.tl.y;
										evt.target.top = pointer.y;
									}
									
									tempRect.set({
										width : Math.abs(tempRect.aCoords.br.x - pointer.x),
										height : Math.abs(tempRect.aCoords.tl.y - pointer.y) 
									});
									evt.target.scaleX = tempRect.width / evt.target.width;
									evt.target.scaleY = tempRect.height / evt.target.height;
									break;
								case "ml":
									if(pointer.x >= tempRect.aCoords.tr.x-minBboxSize){
										pointer.x = tempRect.aCoords.tr.x-minBboxSize;
										evt.target.left = pointer.x;
									}
									tempRect.set({
										width : Math.abs(tempRect.aCoords.tr.x - pointer.x),
										height : Math.abs(tempRect.aCoords.bl.y - tempRect.aCoords.tl.y)
									});
									evt.target.scaleX = tempRect.width / evt.target.width;
									evt.target.scaleY = tempRect.height / evt.target.height;
									break;
								case "mb":
									tempRect.set({
										width : Math.abs(tempRect.aCoords.tr.x - tempRect.aCoords.tl.x),
										height : Math.abs(tempRect.aCoords.tr.y - pointer.y)
									});
									evt.target.scaleX = tempRect.width / evt.target.width;
									evt.target.scaleY = tempRect.height / evt.target.height;
									break;
								case "mr":
									tempRect.set({height : Math.abs(tempRect.aCoords.bl.y - tempRect.aCoords.tl.y)});
									evt.target.scaleY = tempRect.height / evt.target.height;
									break;
								case "br":
									if(pointer.x <= tempRect.aCoords.bl.x+minBboxSize){
										pointer.x = tempRect.aCoords.bl.x;
										evt.target.left = pointer.x;
									}
									if(pointer.y <= tempRect.aCoords.tl.y+minBboxSize){
										pointer.y = tempRect.aCoords.tl.y;
										evt.target.top = pointer.y;
									}
									tempRect.set({
										width : Math.abs(tempRect.aCoords.bl.x - pointer.x),
										height : Math.abs(tempRect.aCoords.tl.y - pointer.y) 
									});
// 									evt.target.scaleX = tempRect.width / evt.target.width;
// 									evt.target.scaleY = tempRect.height / evt.target.height;
									break;
							}
							
							if(tempRect.left < 0){
								tempRect.left = 0;
								evt.target.left = tempRect.left;
								tempRect.width = evt.target.aCoords.br.x-0;
								evt.target.scaleX = tempRect.width / evt.target.width;
							}
							
							if(tempRect.top < 0){
								tempRect.top = 0;
								evt.target.top = tempRect.top;
								tempRect.height = evt.target.aCoords.br.y-0;
								evt.target.scaleY = tempRect.height / evt.target.height;
							}
							
// 							if(tempRect.left+tempRect.width > canvas.getWidth() && tempRect.width < 40) {
// 								tempRect.left = canvas.getWidth()-40;
// 								evt.target.left = tempRect.left;
// 								tempRect.width = evt.target.aCoords.tl.x+40;
// 								evt.target.scaleX = tempRect.width / evt.target.width;
// 							}
// 							if(tempRect.top+tempRect.height > canvas.getHeight() && tempRect.height < 40) {
// 								tempRect.top = canvas.getHeight()-40;
// 								evt.target.top = tempRect.top;
// 								tempRect.height = evt.target.aCoords.tl.y+40;
// 								evt.target.scaleY = tempRect.height / evt.target.height;
// 							}
							
							if(tempRect.left+tempRect.width > canvas.getWidth()) {
								tempRect.width = canvas.getWidth() - tempRect.left;
								evt.target.scaleX = tempRect.width / evt.target.width;
							}
							
							if(tempRect.top + tempRect.height > canvas.getHeight()) {
								tempRect.height = canvas.getHeight() - tempRect.top;
								evt.target.scaleY = tempRect.height / evt.target.height;
							}
							
							if(tempRect.width < minBboxSize){
								tempRect.set({width : minBboxSize});
								evt.target.scaleX = tempRect.width / evt.target.width;
// 								tempRect.lockScalingX = true;
							}
							
							if(tempRect.height < minBboxSize){
								tempRect.set({height : minBboxSize});
								evt.target.scaleY = tempRect.height / evt.target.height;
// 								tempRect.lockScalingY = true;
							}
							
							
						});
						
					},
					
					keydownEvt : () => {
						const that = videoBBox;
						var canvas = that.data.canvas;
						
						$(document).off("keyup").on("keyup", function(evt){
// 							if (evt.keyCode == "17") isCtrl = false;
							if(evt.keyCode == "83" && evt.ctrlKey == true){
								that.computed.insertMetaData();
							}
							
							if(evt.keyCode == "81" && evt.shiftKey == true){
								var currDataNum = that.data.videoObj['currDataNum']*1-2;
								var page_size=50;
								if(currDataNum<0){
									alert("처음 데이터입니다.");
									return;
								}
								if(currDataNum%page_size == 49){
									var page_num = Math.floor((currDataNum)/page_size);
									that.computed.clearAllData();
									that.computed.getVideoDataList(page_num,that.data.videoObj['datasetId'],currDataNum);
									return;
								}
								that.computed.initVideoData(currDataNum);
							}
							if(evt.keyCode == "87" && evt.shiftKey == true){
								var currDataNum = that.data.videoObj['currDataNum']*1;
								var page_size=50;
								var total_size = $("#videoBBox .position_wrap .total_count span").html()*1;
								
								if(currDataNum>=total_size){
									alert("마지막 데이터입니다.");
									return;
								}
								if(currDataNum%page_size == 0){
									var page_num = Math.floor(currDataNum/page_size);
									that.computed.clearAllData();
									that.computed.getVideoDataList(page_num,that.data.videoObj['datasetId']);
									return;
								}
								that.computed.initVideoData(currDataNum);
							}								
							that.bind.keydownEvt();
						});							
						
						$(document).off("keydown").on("keydown",function(evt){
							// del evt
							if(evt.keyCode == "46"){
								evt.preventDefault();
								if(canvas.getActiveObject() == null){
									alert("바운딩 박스를 선택해 주세요.");
									return
								}
								
								// jh.sa 210125
								var tmp = confirm("삭제하시면 이후 프레임에 대한 바운딩 박스 데이터는 삭제됩니다. 그래도 삭제하시겠습니까?");
								
								if(tmp == true && canvas.getActiveObject() != null){
									var uuid = canvas.getActiveObject().uuid;
									var frame = that.data.playerFrame.get();
	 								var meta = that.data.meta[uuid];
									
									// 첫/끝 프레임 존재할 때
									if(frame > meta.startFrame){
										var currArr = frame - meta.startFrame;
										meta.endFrame = frame-1;
										meta.rectData.length = currArr;
										meta.rectData[currArr-1].status = 1;	
									}else{ // 첫 프레임만 존재하거나 첫 프레임에서 이후 프레임 삭제시
										delete that.data.meta[uuid]['startFrame'];
										delete that.data.meta[uuid]['endFrame'];
										delete that.data.meta[uuid]['rectData'];
									}
									that.computed.checkMetaFrame(frame);
	 								that.bind.keydownEvt();
								}								
// 								if(tmp == true && canvas.getActiveObject() != null){
// 									var uuid = canvas.getActiveObject().uuid;
// 									var frame = that.data.playerFrame.get();
// 									var meta = that.data.meta[uuid];
// 									var currArr = frame - meta.startFrame;
									
// 									meta.endFrame = frame-1;
// 									meta.rectData.length = currArr;
// 									meta.rectData[currArr-1].status = 1;	
// 									that.computed.checkMetaFrame(frame);
									
// 									that.bind.keydownEvt();
// 								}
							}
							
							var focus = $("#videoBBox .cate_wp.selected input:focus").length;
							
							// space evt
							if(evt.keyCode == "32"){
								if(focus == 0){
									evt.preventDefault();
									if(that.data.player.paused() == true){
										that.data.player.play();
										var isPaused = false;
										that.render.renderTogglePlayBtn(isPaused);
									}else{
										that.data.player.pause();
										var isPaused = true;
										that.render.renderTogglePlayBtn(isPaused);
									}
								}

							}
							// right arrow evt
							if(evt.shiftKey == false && evt.keyCode == "39"){
								var curr_input = Number($("#videoBBox .frame_wrap input[name='curr_frame']").val());
								var curr_frame = that.data.playerFrame.get();
								var final_frame = that.data.player.finalFrame;								
								
								if(focus == 0){
									if(curr_input == final_frame || curr_frame == final_frame){
										alert("마지막 프레임입니다.");
										return false;
									}										
									evt.preventDefault();
									that.data.playerFrame.seekForward();
									var frame = that.data.playerFrame.get();
									that.computed.checkMetaFrame(frame);
									that.render.inputCurrFrame(frame);
									var isPaused = true;
									that.render.renderTogglePlayBtn(isPaused);									
								}

							}
							// left arrow evt
							if(evt.shiftKey == false && evt.keyCode == "37"){
								var curr_input = Number($("#videoBBox .frame_wrap input[name='curr_frame']").val());
								var curr_frame = that.data.playerFrame.get();
								
								if(focus == 0){
									if(curr_input == 0 || curr_frame == 0){
										alert("첫 번째 프레임입니다.");
										return false;
									}										
									evt.preventDefault();
									that.data.playerFrame.seekBackward();
									var frame = that.data.playerFrame.get();
									that.computed.checkMetaFrame(frame);
									that.render.inputCurrFrame(frame);
									var isPaused = true;
									that.render.renderTogglePlayBtn(isPaused);									
								}

							}
							
							// shift + right arrow evt
							if(evt.shiftKey == true && evt.keyCode == "39"){
								var curr_input = Number($("#videoBBox .frame_wrap input[name='curr_frame']").val());
								var curr_frame = that.data.playerFrame.get();
								var final_frame = that.data.player.finalFrame;		
								
								if(focus == 0){
									if(curr_input == final_frame || curr_frame == final_frame){
										alert("마지막 프레임입니다.");
										return false;
									}										
									evt.preventDefault();
									that.data.playerFrame.seekForward(5);
									var frame = that.data.playerFrame.get();
									that.computed.checkMetaFrame(frame);
									that.render.inputCurrFrame(frame);
									var isPaused = true;
									that.render.renderTogglePlayBtn(isPaused);									
								}

							}
							// shift + left arrow evt
							if(evt.shiftKey == true && evt.keyCode == "37"){
								var curr_input = Number($("#videoBBox .frame_wrap input[name='curr_frame']").val());
								var curr_frame = that.data.playerFrame.get();
								
								if(focus == 0){
									if(curr_input == 0 || curr_frame == 0){
										alert("첫 번째 프레임입니다.");
										return false;
									}	
									evt.preventDefault();
									that.data.playerFrame.seekBackward(5);
									var frame = that.data.playerFrame.get();
									that.computed.checkMetaFrame(frame);
									that.render.inputCurrFrame(frame);
									var isPaused = true;
									that.render.renderTogglePlayBtn(isPaused);									
								}

							}
						});
						
					},
					
					keydownEvt2 : function(evt){
						const that = videoBBox;
						var canvas = that.data.canvas;
						if(evt.keyCode == "46"|| evt.keyCode == "68" && evt.ctrlKey == true){
							evt.preventDefault();
							if(canvas.getActiveObject() == null){
								alert("바운딩 박스를 선택해 주세요.");
								return;
							}
							var tmp = confirm("삭제하시면 이후 프레임에 대한 데이터는 삭제됩니다. 그래도 삭제하시겠습니까?");
							if(tmp == true && canvas.getActiveObject() != null){
								var uuid = canvas.getActiveObject().uuid;
//	 							var labelBox = $("#videoBBox .category_wrap .cate_wp#"+uuid);
//	 							if(!uuid){
//	 								alert("삭제할 데이터를 선택해 주십시오.");
//	 							}
//	 							if(uuid.indexOf("-") == -1){
//	 								// call ajax
//	 								that.computed.deleteMetaById(uuid,labelBox[0]);
//	 							}else{
//	 								// not call ajax
//	 								that.computed.deleteMetaData(uuid,labelBox[0]);
//	 							}								
								var frame = that.data.playerFrame.get();
								var meta = that.data.meta[uuid];
								var currArr = frame - meta.startFrame;
								
								meta.endFrame = frame-1;
								meta.rectData.length = currArr;
								meta.rectData[currArr-1].status = 1;	
								that.computed.checkMetaFrame(frame);
								
								that.bind.keydownEvt();
								//
								labeller.bind.evtAll();
							}								
						}
		
						// space evt
						if(evt.keyCode == "32"){
							evt.preventDefault();
							if(that.data.player.paused() == true){
								that.data.player.play();
								var isPaused = false;
								that.render.renderTogglePlayBtn(isPaused);
							}else{
								that.data.player.pause();
								var isPaused = true;
								that.render.renderTogglePlayBtn(isPaused);
							}
						}
						// right arrow evt
						if(evt.shiftKey == false && evt.keyCode == "39"){
							evt.preventDefault();
							that.data.playerFrame.seekForward();
							var frame = that.data.playerFrame.get();
							that.computed.checkMetaFrame(frame);
							that.render.inputCurrFrame(frame);
							var isPaused = true;
							that.render.renderTogglePlayBtn(isPaused);
						}
						// left arrow evt
						if(evt.shiftKey == false && evt.keyCode == "37"){
							evt.preventDefault();
							that.data.playerFrame.seekBackward();
							var frame = that.data.playerFrame.get();
							that.computed.checkMetaFrame(frame);
							that.render.inputCurrFrame(frame);
							var isPaused = true;
							that.render.renderTogglePlayBtn(isPaused);
						}
						
						// shift + right arrow evt
						if(evt.shiftKey == true && evt.keyCode == "39"){
							evt.preventDefault();
							that.data.playerFrame.seekForward(5);
							var frame = that.data.playerFrame.get();
							that.computed.checkMetaFrame(frame);
							that.render.inputCurrFrame(frame);
							var isPaused = true;
							that.render.renderTogglePlayBtn(isPaused);
						}
						// shift + left arrow evt
						if(evt.shiftKey == true && evt.keyCode == "37"){
							evt.preventDefault();
							that.data.playerFrame.seekBackward(5);
							var frame = that.data.playerFrame.get();
							that.computed.checkMetaFrame(frame);
							that.render.inputCurrFrame(frame);
							var isPaused = true;
							that.render.renderTogglePlayBtn(isPaused);
						}						
						
						labeller.bind.evtAll();
					},
					
					sideEvtCollision : function(evt) {
						const that = videoBBox;
						// 임시
// 						$("#videoBBox .quick_btn").off("click").on("click", function(){
// 							alert("서비스 준비중 입니다.");
// 						});							
						// DOM Event
						
						$("#videoBBox .label_wrap input").off("input").on("input", function(e){
							//영문, 숫자, 특수문자
							if($(this).val().match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
								alert("영문과 특수문자 및 숫자만 입력 가능합니다");
							}
							
							const str = $(this).val().replace(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/gi,"");
		                    if(str.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
									$(this).val(str.slice(0, -1));						
							} else {
									$(this).val(str);						
							}
						});
						
						$("#videoBBox .position-value").off("input").on("input", function(e){
							// 숫자
// 							if($(this).val().match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
// 								alert("영문과 특수문자 및 숫자만 입력 가능합니다");
// 							}
							
							const str = $(this).val().replace(/[^0-9 ]/gi,"");
		                    if(str.match(/[^0-9 ]/)){
									$(this).val(str.slice(0, -1));						
							} else {
									$(this).val(str);						
							}							
						});						
						
						$("#videoBBox .label_wrap .btn_wrap .add").off("click").on("click",function(evt){
							$(this).blur();
							var uuid = that.computed.generateUUID();
							var keys = Object.keys(that.data.meta);
							
							// jh.sa 210122 
							if($("#videoBBox .category_wrap .cate_wp").length == 0){
								$("#videoBBox .label_wrap .category_wrap .no_label").remove();
							}
// 							else if($(pt + " .category_wrap .cate_wp").length >= 30){
// 								alert("라벨은 30개 까지만 추가할 수 있습니다.");
// 								return;
// 							}							
							
							if(keys.length > 0){
								for(var i=0; i<keys.length; i++){
									if(keys[i] == uuid){
										uuid = that.computed.generateUUID();
									}
								}
							}
							
							var labelNo = eval($("#videoBBox .label_wrap .category_wrap").find(".cate_wp").length+1);
							
							var html = that.render.tempInitCategory(uuid);
							$("#videoBBox .label_wrap .category_wrap").append(html);
							
							let color = that.data.colorHash.rgb(uuid);
							$("#videoBBox .label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
							
							$("#videoBBox .label_wrap .category_wrap .cate_wp").removeClass("selected");
							$("#videoBBox .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
							$("#videoBBox .label_wrap .category_wrap .cate_wp").last().addClass("selected");
							$("#videoBBox .label_wrap .category_wrap .cate_wp[id='"+uuid+"'].selected ").css("border-color","rgb("+color+")");
							
							// jh.sa 210122
							var active_obj = that.data.canvas.getActiveObject();
							if(active_obj != null){
								that.data.canvas.discardActiveObject().renderAll();
							}
							
							that.data.videoObj['isModified'] = 1;
// 							that.computed.getCategoryData(data,uuid);
							that.computed.initMetaData(uuid,labelNo);
							that.bind.sideEvtCollision();
							
						});
						
						$("#videoBBox .label_wrap .category_wrap .cate_wp .start_frm").off("click").on("click",function(){
							var uuid = $(this).parent().parent().attr("id");
							var startFrm = that.data.meta[uuid]['startFrame'];
							if(startFrm == undefined){
								alert("바운딩 박스를 그려주세요.");
							}								
							if(startFrm == 0){
								that.data.playerFrame.seekTo({seconds:0});
							}else{
								that.data.playerFrame.seekTo({frame:startFrm});
							}
							
							var frame = that.data.playerFrame.get();
							that.computed.checkMetaFrame(frame);
							that.render.inputCurrFrame(frame);
						});
						
						$("#videoBBox .label_wrap .category_wrap .cate_wp .end_frm").off("click").on("click",function(){
							var uuid = $(this).parent().parent().attr("id");
							var startFrm = that.data.meta[uuid]['startFrame'];
							var endFrm = that.data.meta[uuid]['endFrame'];
							
							if(endFrm == undefined){
								alert("바운딩 박스를 그려주세요.");
							} else if(endFrm == startFrm){
								alert("끝점으로 지정할 프레임에 바운딩 박스를 그려주세요.");
							}							
							
							that.data.playerFrame.seekTo({frame:endFrm});
							
							var frame = that.data.playerFrame.get();
							that.computed.checkMetaFrame(frame);
							that.render.inputCurrFrame(frame);
						});
						
						
						// alert and meta data delete!!
						$("#videoBBox .label_wrap .category_wrap .cate_wp .delete").off("click").on("click",function(evt){
						
							var check = confirm("데이터를 삭제하시겠습니까?");
							if(check == true){
								let uuid = $(this).parent().parent().attr("id");
// 								var dataId = $(".data_item .collapse-item.active").attr("data-id");
								var labelBox = $(this).parent().parent().attr("id",uuid);
								if(!uuid){
									alert("삭제할 데이터를 선택해 주십시오.");
								}
								if(uuid.indexOf("-") == -1){
									// call ajax
									that.computed.deleteMetaById(uuid,labelBox[0]);
								}else{
									// not call ajax
									that.computed.deleteMetaData(uuid,labelBox[0],false);
								}								
							}
						});
						
						$("#videoBBox .category_wrap .cate_wp .category").off('keypress').on('keypress',function(evt){
							if(evt.keyCode == 13){
								console.log("enter!");
								var uuid = $(this).parent().parent().attr("id");
								that.data.meta[uuid]['category'] = $(this).val();
							}
						});
						
						// jh.sa add
						$("#videoBBox .category_wrap .cate_wp .category").off('blur').on('blur',function(evt){
							var uuid = $(this).parent().parent().attr("id");
							that.data.meta[uuid]['category'] = $(this).val();
						});								
						
						$("#videoBBox .category_wrap .cate_wp").off("click").on("click",function(){
							var uuid = $(this).attr("id");
							var color = that.data.colorHash.rgb(uuid);
							$("#videoBBox .label_wrap .category_wrap .cate_wp").removeClass("selected");
							$("#videoBBox .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
							$(this).addClass("selected");
							$(this).css("border-color","rgb("+color+")");
							
							that.data.canvas.discardActiveObject();
							var canvArr = that.data.canvas.getObjects();
							for(var i=0; i<canvArr.length; i++){
								if(canvArr[i]['uuid'] == uuid){
									that.data.canvas.bringToFront(canvArr[i]);
									that.data.canvas.setActiveObject(canvArr[i]);
								}
							}
						});
						
						$("#videoBBox .save_btn_wrap .save").off("click").on("click",function(){
							$(this).blur();
							that.computed.insertMetaData();
						});						
						
						$("#videoBBox .btn_wrap .prev-5").off("click").on("click",function(){
							// jh.sa 210126
							var curr_input = Number($("#videoBBox .frame_wrap input[name='curr_frame']").val());
							var curr_frame = that.data.playerFrame.get();
							console.log(curr_frame);
							console.log(curr_input);
							if(curr_input == 0 || curr_frame == 0){
								alert("첫 번째 프레임입니다.");
							}								
							//							
							that.data.playerFrame.seekBackward(5);
							var frame = that.data.playerFrame.get();
							that.computed.checkMetaFrame(frame);
							that.render.inputCurrFrame(frame);
							
							var isPaused = true;
							that.render.renderTogglePlayBtn(isPaused);
						});
						
						$("#videoBBox .btn_wrap .prev").off("click").on("click",function(){
							// jh.sa 210126
							var curr_input = Number($("#videoBBox .frame_wrap input[name='curr_frame']").val());
							var curr_frame = that.data.playerFrame.get();
							if(curr_input == 0 || curr_frame == 0){
								alert("첫 번째 프레임입니다.");
							}								
							//							
							
							that.data.playerFrame.seekBackward();
							var frame = that.data.playerFrame.get();
							that.computed.checkMetaFrame(frame);
							that.render.inputCurrFrame(frame);
							
							var isPaused = true;
							that.render.renderTogglePlayBtn(isPaused);
						});
						
						$("#videoBBox .btn_wrap .next-5").off("click").on("click",function(){
							// jh.sa 210126
							var curr_input = Number($("#videoBBox .frame_wrap input[name='curr_frame']").val());
							var curr_frame = that.data.playerFrame.get();
							var final_frame = that.data.player.finalFrame;
							if(curr_input == final_frame || curr_frame == final_frame){
								alert("마지막 프레임입니다.");
							}							
							//							
							
							that.data.playerFrame.seekForward(5);
							var frame = that.data.playerFrame.get();
							that.computed.checkMetaFrame(frame);
							that.render.inputCurrFrame(frame);
							
							var isPaused = true;
							that.render.renderTogglePlayBtn(isPaused);
						});
						
						$("#videoBBox .btn_wrap .next").off("click").on("click",function(){
							// jh.sa 210126
							var curr_input = Number($("#videoBBox .frame_wrap input[name='curr_frame']").val());
							var curr_frame = that.data.playerFrame.get();
							var final_frame = that.data.player.finalFrame;
							if(curr_input == final_frame || curr_frame == final_frame){
								alert("마지막 프레임입니다.");
							}							
							//								
							
							that.data.playerFrame.seekForward();
							var frame = that.data.playerFrame.get();
							that.computed.checkMetaFrame(frame);
							that.render.inputCurrFrame(frame);
							
							var isPaused = true;
							that.render.renderTogglePlayBtn(isPaused);
						});
						
						$("#videoBBox .btn_wrap input.curr_frame").off("keypress").on("keypress",function(e){
							if(e.keyCode == "13"){
								e.preventDefault();
								var frame = $(this).val();	
								// jh.sa 201217
								var final_frame = Number(that.data.player.finalFrame);
								if(Number(frame) > final_frame){
									alert("입력된 숫자가 해당 영상 데이터의 전체 프레임 수 보다 큽니다.\n마지막 프레임으로 이동합니다.")
									that.data.playerFrame.seekTo({frame: final_frame});	
									that.computed.checkMetaFrame(final_frame);
									that.render.inputCurrFrame(final_frame);
								} else {
									that.data.playerFrame.seekTo({frame: frame});	
									that.computed.checkMetaFrame(frame);
									that.render.inputCurrFrame(frame);
								}								
// 								that.data.playerFrame.seekTo({frame:frame});	
// 								that.computed.checkMetaFrame(frame);
							}
						});
						
						// play button toggle event wrap
						$("#videoBBox .btn_wrap .play_btn ").off("click").on("click",function(){
							that.data.player.play();
							var isPaused = false;
							that.render.renderTogglePlayBtn(isPaused);
						});
						$("#videoBBox .btn_wrap .pause_btn ").off("click").on("click",function(){
							that.data.player.pause();
							var isPaused = true;
							that.render.renderTogglePlayBtn(isPaused);
						});
						
						//paging evt
						$("#videoBBox .data_list_wrap .list_table ul li .path").off("click").on("click",function(){
							var data_num = $(this).parent().attr("data-index")*1-1;
							var page_size=50;
							var currPage = $("#videoBBox #pagination .page-item.active .page-link").html()*1-1;
							var currDataNum = currPage*page_size + data_num;
							that.computed.initVideoData(currDataNum);
						});

						$("#videoBBox #pagination .first").off("click").on("click",function(){
							that.computed.clearAllData();
							var page_num = 0;
							that.computed.getVideoDataList(page_num,that.data.videoObj['datasetId']);
						});
						$("#videoBBox #pagination .prev").off("click").on("click",function(){
							var page_size=50;
							var page_num = $("#videoBBox #pagination .page-item.active .page-link").html()-2;
							if(page_num<0){
								alert("첫 페이지 입니다.");
								return false;
							}
							that.computed.clearAllData();
							that.computed.getVideoDataList(page_num,that.data.videoObj['datasetId']);
						});
						$("#videoBBox #pagination .page-link").off("click").on("click",function(){
							if( isNaN($(this).html()) == false){
								var page_num = $(this).html()*1-1;
								that.computed.clearAllData();
								that.computed.getVideoDataList(page_num,that.data.videoObj['datasetId']);
							}
						});
						$("#videoBBox #pagination .next").off("click").on("click",function(){
							var page_size=50;
							var page_num = $("#videoBBox #pagination .page-item.active .page-link").html()*1;
							var lastPage = Math.floor($("#videoBBox .position_wrap .total_count span").html()*1/page_size);
							if(page_num>lastPage){
								alert("마지막 페이지 입니다.");
								return false;
							}
							
							var page = $("#videoBBox .position_wrap .total_count span").html()*1/page_size;
							if(page == page_num){
								alert("마지막 페이지 입니다.");
								return false;
							} else {
								that.computed.clearAllData();
								that.computed.getVideoDataList(page_num,that.data.videoObj['datasetId']);
							}								
							
// 							that.computed.clearAllData();
// 							that.computed.getVideoDataList(page_num,that.data.videoObj['datasetId']);
						});
						$("#videoBBox #pagination .last").off("click").on("click",function(){
							that.computed.clearAllData();
							var page_size=50;
							var page_num = Math.floor($("#videoBBox .position_wrap .total_count span").html()*1/page_size);
							
							var page = $("#videoBBox .position_wrap .total_count span").html()*1/page_size;
							if(page == page_num){
								that.computed.getVideoDataList(page_num-1,that.data.videoObj['datasetId']);
							} else {
								that.computed.getVideoDataList(page_num,that.data.videoObj['datasetId']);
							}								
							
// 							that.computed.getVideoDataList(page_num,that.data.videoObj['datasetId']);
						});
						
						$("#videoBBox .prev_data").off("click").on("click",function(){
							var currDataNum = that.data.videoObj['currDataNum']*1-2;
							var page_size=50;
							if(currDataNum<0){
								alert("처음 데이터입니다.");
								return;
							}
							if(currDataNum%page_size == 49){
								var page_num = Math.floor((currDataNum)/page_size);
								that.computed.clearAllData();
								that.computed.getVideoDataList(page_num,that.data.videoObj['datasetId'],currDataNum);
								return;
							}
							that.computed.initVideoData(currDataNum);
						});
						$("#videoBBox .next_data").off("click").on("click",function(){
							var currDataNum = that.data.videoObj['currDataNum']*1;
							var page_size=50;
							var total_size = $("#videoBBox .position_wrap .total_count span").html()*1;
							
							if(currDataNum>=total_size){
								alert("마지막 데이터입니다.");
								return;
							}
							if(currDataNum%page_size == 0){
								var page_num = Math.floor(currDataNum/page_size);
								that.computed.clearAllData();
								that.computed.getVideoDataList(page_num,that.data.videoObj['datasetId']);
								return;
							}
							that.computed.initVideoData(currDataNum);
						});
						
// 						$("#videoBBox .img_list_wrap .name_wrap .prev_btn").off("click").on("click",function(){
// 							var currDataNum = that.data.videoObj['currDataNum']*1-2;
// 							var page_size=5;
// 							if(currDataNum%page_size == 0){
// 								var page_num = Math.floor(currDataNum/page_size);
// 								that.computed.clearAllData();
// 								that.computed.getVideoDataList(page_num,that.data.videoObj['datasetId']);
// 								return;
// 							}
// 							that.computed.initVideoData(currDataNum);
// 						});
// 						$("#videoBBox .img_list_wrap .name_wrap .next_btn").off("click").on("click",function(){
// 							var currDataNum = that.data.videoObj['currDataNum']*1;
// 							var page_size=5;
// 							if(currDataNum%page_size == 0){
// 								var page_num = Math.floor(currDataNum/page_size);
// 								that.computed.clearAllData();
// 								that.computed.getVideoDataList(page_num,that.data.videoObj['datasetId']);
// 								return;
// 							};
// 							that.computed.initVideoData(currDataNum);
// 						}); 
						
						$("#videoBBox .position-value").off("keypress").on("keypress",function(evt){
							if(evt.keyCode == "13"){
								var page_size = 50;
								var targetDataNum = $(this).val()*1-1;
								var targetPageNum = Math.floor(targetDataNum*1/page_size*1)+1;
								var currPageNum = $("#videoBBox #pagination .page-item.active .page-link").html();
								var total_size = $("#videoBBox .position_wrap .total_count span").html()*1;
								if(isNaN(targetDataNum) == true){
									alert("숫자만 입력 가능합니다.");
									$(this).val(that.data.videoObj['currDataNum']);
									return;
								}
								if(targetDataNum < 0){
									that.computed.initVideoData(0);
									return false;
								}else if(targetDataNum >=total_size){
									alert("전체 데이터 수는 "+total_size+" 입니다.");
									that.computed.initVideoData(total_size-1);
									return false;
								}
								if(targetPageNum != currPageNum){
									that.computed.getVideoDataList(targetPageNum-1,that.data.videoObj['datasetId'],targetDataNum);
								}
								that.computed.initVideoData(targetDataNum);
							}
							
						}); 
						//paging evt end
						
						// jh.sa 201015 : data list btn
						$("#videoBBox .list_btn_wrap .data_list_btn").off("click").on("click", function(){
							var data_list_wrap = $("#videoBBox .data_list_wrap");
							if(data_list_wrap.hasClass("active")){
								data_list_wrap.removeClass("active");
								data_list_wrap.css("display", "none");	
							} else {
								data_list_wrap.addClass("active");
								data_list_wrap.css("display", "block");	
								data_list_wrap.attr("state", true);								
							}							
						});			
						
						$("#videoBBox .data_list_wrap .close_btn").off("click").on("click", function(){
							var data_list_wrap = $("#videoBBox .data_list_wrap");
							data_list_wrap.removeClass("active");
							data_list_wrap.css("display", "none");	
						});				
						
						// jh.sa 210121 데이터 리스트 이외 영역 클릭 시 데이터리스트 닫기
						$("#videoBBox .data_list_wrap").off("click").on("click", function(){
							var data_list_wrap = $("#videoBBox .data_list_wrap");
							data_list_wrap.attr("state", true);
						});
						
						$(".section.videoBBox.selected #wrapper").off("click").on("click", function(){
							//console.log("click");
							var data_list_wrap = $("#videoBBox .data_list_wrap");
							if(data_list_wrap.attr("state") == "true") {
								data_list_wrap.attr("state", false);
								return ;
							} 
							if(data_list_wrap.attr("state") == "false") {
								data_list_wrap.removeClass("active");
								data_list_wrap.css("display", "none");
								return ;
							}
						});						
						
						// jh.sa 201019
						// data list preview
						$("#videoBBox .preview .img_preview").off("mouseenter").on("mouseenter", function(){
// 							const x = $(this).offset().left + $(this).outerWidth();
// 					        const y = $(this).offset().top + $(this).outerHeight() - 59 - $(window).scrollTop();
					        
// 					        const video_html = "<video id ='pre_video' style='position: fixed; top: "+ y +"px; left: "+ x +"px; width : auto; max-width: 260px; height : 260px' ></video>"; 
							const x = $(this).offset().left + $(this).outerWidth() + 2;
					        const y = $(this).offset().top + $(this).outerHeight() - 80 - $(window).scrollTop();
					        
					        const video_html = "<video id ='pre_video' style='position: fixed; top: "+ y +"px; left: "+ x +"px; float left; width : auto; max-width: 280px; height : 260px;' ></video>";
					        
					        $(this).append(video_html);
					        
					        var this_pt = $(this);
					        
					        const id = $(this).parents("li").find(".id").text();
					        const path = $(this).parents("li").find(".path").data("path");
					 
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
					        
					        // jh.sa 210122
					        pre_video.on('error', function(e){
			 	        	    e.stopImmediatePropagation();
				        	    var error = this.player().error();
				        	    //console.log('error!', error.code, error.type , error.message);
								const error_html = "<div id ='pre_video_error' class='pre_video_error' style='position: fixed; top: "+ y +"px; left: "+ x +"px;' ><div class='error_img'></div><div class='error_msg'>Failed to Play<span>The media could not be loaded</span></div></div>";
								$("#videoBBox #pre_video").hide();
								$(this_pt).append(error_html);
					        });			
					        
						});
						
						$("#videoBBox .preview .img_preview").off("mouseleave").on("mouseleave", function(){
							var tmpPlayer = videojs("pre_video");
							tmpPlayer.dispose();
							// 에러 영상
							if($("#pre_video_error")){
								$("#pre_video_error").remove();
							}
						});			
						
						// 이후 프레임 삭제 버튼
						$("#videoBBox .cate_wp .delete_frm").off("click").on("click", function(){
							var canvas = that.data.canvas;
							var this_uuid = $(this).parents(".cate_wp")[0].id;
							var select_uuid = null;
							if($("#videoBBox .label_wrap .category_wrap .cate_wp.selected")[0]){
								select_uuid = $("#videoBBox .label_wrap .category_wrap .cate_wp.selected")[0].id;
							}
							if(select_uuid != null && this_uuid != select_uuid) {
								$("#videoBBox .label_wrap .category_wrap .cate_wp").removeClass("selected");
								$("#videoBBox .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
								let color = that.data.colorHash.rgb(this_uuid);
								$("#videoBBox .label_wrap .category_wrap .cate_wp[id='"+this_uuid+"']").addClass("selected");
								$("#videoBBox .label_wrap .category_wrap .cate_wp[id='"+this_uuid+"'].selected ").css("border-color","rgb("+color+")");								
								
								canvas.discardActiveObject();
								var canvArr = that.data.canvas.getObjects();
								for(var i=0; i<canvArr.length; i++){
									if(canvArr[i]['uuid'] == this_uuid){
										that.data.canvas.bringToFront(canvArr[i]);
										that.data.canvas.setActiveObject(canvArr[i]);
									}
								}									
							}
							if(canvas.getActiveObject() == null){
								that.data.canvas.discardActiveObject().renderAll();
								alert("선택한 라벨의 바운딩 박스가 현재 프레임에 없습니다.");
								return;
							}
							
// 							var uuid = canvas.getActiveObject().uuid;
							var labelNo = $(this).parents(".cate_wp"[0].no);
// 							if(uuid != select_uuid){
// 								alert("해당 라벨의 바운딩 박스를 선택해주세요.");
// 								return;
// 							}
							var tmp = confirm("삭제하시면 이후 프레임에 대한 바운딩 박스 데이터는 삭제됩니다. 그래도 삭제하시겠습니까?");
							if(tmp == true && canvas.getActiveObject() != null){
								var frame = that.data.playerFrame.get();
// 								var meta = that.data.meta[uuid];
								var meta = that.data.meta[this_uuid];
								
								// 첫/끝 프레임 존재할 때
								if(frame > meta.startFrame){
									var currArr = frame - meta.startFrame;
									meta.endFrame = frame-1;
									meta.rectData.length = currArr;
									meta.rectData[currArr-1].status = 1;	
								}else{ // 첫 프레임만 존재하거나 첫 프레임에서 이후 프레임 삭제시
									delete that.data.meta[this_uuid]['startFrame'];
									delete that.data.meta[this_uuid]['endFrame'];
									delete that.data.meta[this_uuid]['rectData'];
								}
								that.computed.checkMetaFrame(frame);
// 								that.bind.keydownEvt();
							}
						});			
						
						
						// jh.sa 201204 input 유효성 검사 		                
						$("#videoBBox input[name='label_name']").on("propertychange change keyup paste input", function(e) {
							var uuid = $(this).parent().parent().attr("id");
							that.data.meta[uuid]['category'] = $(this).val();			
							that.data.videoObj['isModified'] = 1;

							if($(this).val().length > 250){
								var string = $(this).val();
								$(this).val(string.slice(0,250));
								return false;
							};
						});					
						
						
						// jh.sa 210226 tag
						that.pt.find(".tag_wrap .tag").off("click").on("click", function(e){
							$(this).toggleClass("selected");
							
							var targets = that.pt.find(".category_wrap .cate_wp");
							targets.removeClass("selected");
							targets.css("border-color","#eeeeee");
							targets.hide();
							
							
							if(that.pt.find(".tag_wrap .tag.selected").length > 0){
								var selectedTag = that.pt.find(".tag_wrap .tag.selected");
								var targetArr = [];
								for(var i=0; i<selectedTag.length; i++){
									
									var tagName = that.pt.find(".tag_wrap .tag.selected")[i].id;
									for(var j=0; j<targets.length; j++){
										if($(targets[j]).find("input[type='text']").val() == tagName){
											$(targets[j]).show();
											targetArr.push(targets[j]);
										}										
									}
								}
								that.pt.find(".label_wrap .label_title span").html(targetArr.length);
								
								// jh.sa 210303
								var canvas = that.data.canvas;
								var o = canvas.getObjects();
								for(var i=0; i<o.length; i++){
								    o[i].visible = false;
									var active_obj = canvas.getActiveObject();
									if(active_obj != null){
										canvas.discardActiveObject().renderAll();
									}
								    for(var j=0; j<targetArr.length; j++){
								        if(o[i].uuid == targetArr[j].id){
								            o[i].visible = true;
// 								            if($(targetArr[j]).hasClass("selected")){
// 								                o[i].selectable = true;
// 												canvas.bringToFront(o[i]);
// 												canvas.setActiveObject(o[i]);
// 								            }
								        }

								    }
								}			
								canvas.renderAll();
							} else {
								that.pt.find(".category_wrap .cate_wp").show();
								var settingTargets = that.pt.find(".category_wrap .cate_wp");
								settingTargets.removeClass("selected");
								settingTargets.css("border-color","#eeeeee");
// 								that.computed.tagSetting(targets);
								that.pt.find(".label_wrap .label_title span").html(settingTargets.length);
								
								// jh.sa 210303
								var canvas = that.data.canvas;
								var o = canvas.getObjects();
								for(var i=0; i<o.length; i++){
								    o[i].visible = true;
								    for(var j=0; j<settingTargets.length; j++){
							            if($(settingTargets[j]).hasClass("selected")){
							                o[i].selectable = true;
											canvas.bringToFront(o[i]);
											canvas.setActiveObject(o[i]);
							            }
								    }
								}			
								canvas.renderAll();								
							}
							
							console.log(targetArr);
						});					
						
						that.pt.find(".tag_wrap .tag").off("mouseenter").on("mouseenter",function(){
							var text = $(this)[0].innerText.substr(1);
							that.render.addHoverBox($(this) , text);
						});
						
						that.pt.find(".tag_wrap .tag").off("mouseleave").on("mouseleave",function(){
							that.render.removeHoverBox($(this));
						});							
						
						that.pt.find(".cate_wp input").off("blur").on("blur", function(e){
							var text = $(this).val();
							var tags = that.computed.updateTagset(text);
							that.render.drawTagset(tags);							
						});						
						
						
					},// DOM Event end
					
                    resetView : function(){
                        const that = videoBBox;
                        $("#videoBBox input.curr_frame").val(0);					// jh.sa 201103
                        $("#videoBBox input.position-value").val(1);
                        var no_label = '<div class="no_label"><div></div><div>No Label</div><div>Please Add Label</div></div>';
						$("#videoBBox .category_wrap").html(no_label);                        
//                         $("#videoBBox .category_wrap").html("");
    					$("#videoBBox .img_list_wrap .name_wrap .video_name").html("");
    					$("#videoBBox .total_count span").html("")
    					$("#videoBBox .frame_wrap .total_frame span").html(""); // jh.sa 201217
    					$("#videoBBox .empty_wrap").remove();
    					const html = '<div class="empty_wrap"><div class="no_image"></div><div class="eng_text">No Data</div><div class="kor_text">you have not selected any data yet</div></div>';
    					$("#videoBBox section.enrichment #videoBBox-video").hide();
    					$("#videoBBox section.enrichment .canvas-container").hide();
    					$("#videoBBox section.enrichment .video_wrap").append(html);	                        
                    },					
					
					
				},// bind end
				computed : {
					root : null,
					initRect(uuid,obj) { //create new rect data
						// obj => {top/left/width/height}
						const that = videoBBox;
						var tempRect = {};
						tempRect = new fabric.Rect( obj );
						
						that.data.canvas.add(tempRect);
						that.data.canvas.setActiveObject(tempRect);
						that.data.canvas.renderAll();
					},
					
					initMetaRect(uuid,arrNum) { // from Server Data, initiate meta rect data
						const that = videoBBox;
						var meta = that.data.meta;
						
						var rectObj = this.getRectObject(meta[uuid],arrNum);
						var tempRect = new fabric.Rect( rectObj );
						
						that.data.canvas.add(tempRect);
						
						
					}, //init Rect data end		
					
					// get/init rectangle object
					getRectObject(meta,arrNum) {
						const that = videoBBox;
						var object = {};
						
						if(arrNum>=0){ // 메타데이터에서 rectangle 그릴 시
							
							object = {
									left : meta.rectData[arrNum].left,
									top : meta.rectData[arrNum].top,
									width : meta.rectData[arrNum].width,
									height : meta.rectData[arrNum].height,
									uuid : meta["id"],
									stroke : "rgb("+that.data.colorHash.rgb(meta["id"])+")",
							        fill: "rgb("+that.data.colorHash.rgb(meta["id"])+",0.2)",
							        type : 'rect',
							        strokeWidth:2,
							        strokeWidthUnscaled:2,
							        lockRotation : true,
									noScaleCache : false,
							        lockUniScaling : false,
							        lockScalingFlip : true,
							        transparentCorners : false,
							        strokeUniform : true,
							        cornerColor : "rgb("+that.data.colorHash.rgb(meta.uuid)+")",
							        cornerSize : 10,
							}
						
						}else{ // rectangle 추가시
							
							object = {
									left : meta.left,
									top : meta.top,
									width : meta.width,
									height : meta.height,
									uuid : meta.uuid,
									stroke : "rgb("+that.data.colorHash.rgb(meta.uuid)+")",
							        fill: "rgb("+that.data.colorHash.rgb(meta.uuid)+",0.2)",
							        type : 'rect',
							        strokeWidth : 2,
							        strokeWidthUnscaled:2,
							        lockRotation : true,
									noScaleCache : false,
							        lockUniScaling : false,
							        lockScalingFlip : true,
							        transparentCorners : false,
							        strokeUniform : true,
							        cornerColor : "rgb("+that.data.colorHash.rgb(meta.uuid)+")",
							        cornerSize : 10,
							}
						}
						
						return object;	
					},
					
					initVideoData : function(dataNum){
						const that = videoBBox;
						// jh.sa => workspace에서 다른 dataset으로 이동할 때에도 검사를 해줘야할 것 같음.
						var isModified = that.data.videoObj['isModified'];
						var msg = "영상 데이터 이동 시 저장되지 않은 라벨은 손실됩니다. 계속하시겠습니까?";		
						
						if(isModified == 1){
							if(!confirm(msg)){
								return false;
							}
						}									
						
						that.computed.clearAllData();
						that.computed.getDataByNum(dataNum);
						that.computed.initControlBar();
					},					
					
					// create meta data
					initMetaData(uuid,labelNo) {
						const that = videoBBox;
						
						that.data.meta[uuid] = {
							labelNo : labelNo,
							id : uuid,
							category : null,
						};
						
					},// create meta data end
					
					clearAllData(){
						const that = videoBBox;
						that.data.scaleFactor = {origWidth:0, origHeight:0, ratio:1};
// 						that.data.player.dataId = null;
						that.data.videoObj['isModified'] = 0;
						this.clearCanvas();
						this.clearMeta();
						this.clearRect();
						
					},
					clearCanvas(){
						const that = videoBBox;
						that.data.videoObj['currDataNum'] = null;
						that.data.canvas.clear();
					},
					clearMeta(){
						const that = videoBBox;
						that.data.meta = {};
					},
					clearRect(){
						const that = videoBBox;
						that.data.rect = {};
					},
					
					// jh.sa 210122
					initControlBar(){
						const that = videoBBox;
						
						that.data.player.pause();
						that.data.player.resetControlBarUI_();		// jh.sa 201210 영상내장컨트롤바 재생시간초기화
						$("#videoBBox .vjs-play-control").removeClass("vjs-ended");
						$("#videoBBox .vjs-play-control").removeClass("vjs-paused");
						that.render.inputCurrFrame(0);
						var isPaused = true;
						that.render.renderTogglePlayBtn(isPaused);
					},					
					
					// jh.sa 201028 추가 
					getDatasetById : function(id){
						var that = videoBBox;
						$("#loader").show();
						$.ajax({
							url :  baseUrl + "data/getDatasetById.json",
						   	data : { dataset_id : id },
						   	type : "POST",
						   	success : function(res){
						   		//$("#loader").hide();
						   		console.log("=====getDatasetById=====", res);
								if(res.result.code == "200"){
									var media_type = res.result.data.media_type;
									var label_type = res.result.data.label_type;
									var nodes = wsObj["inspection"].dir.getSelectedNodes();
		/* 							console.log("root.nodes : ", that.root.data.nodes); */
									if(res.result.data.status == '1') {
										if($("#" + nodes[0].tId + "_loading").hasClass("upload_wait")) {
											$("#" + nodes[0].tId + "_loading").removeClass("upload_wait");
							  				$("#" + nodes[0].tId + "_loading").addClass("upload_complete");	
										}
						  			}
									console.log("이 데이터셋의 미디어 유형은 [", media_type, "] 입니다.");	
									console.log("이 데이터셋의 라벨링 유형은 [", label_type, "] 입니다.");	
								} else if(res.result.code == "2001"){
									alert(res.result.data);
									$("#loader").hide();
									location.href = baseUrl + 'login';
								} else {
									alert(res.result.data);
									$("#loader").hide();
								}
						   	},
						   	error : function(err){
						   		$("#loader").hide();
						   		 console.log("ERROR!!", err);
						   	}
						});				
					},					
					
					/*
					*  get Video Data List
					*/
					getVideoDataList : function(page,dataSet,currDataNum){
						const that = videoBBox;
// 						var category = dataCate;
						$("#loader").show();
						var deferred = $.ajax({
// 							url : baseUrl + "data/getDatasetList.json",
							url : baseUrl + "data/getDataList.json",
							data : {dataset_id:dataSet,page_num:page},
							type : "POST",
							traditional : true,	
							success : function(res){
// 								console.log(":getDatasetList:",res);
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
							
							if(data.result.data.length == 0){
								alert("데이터가 존재하지 않습니다.\n데이터를 추가해주세요.")
								labeller.pt.find("div.section").removeClass("selected");
								var nodes = wsObj[setting.key].dir.getSelectedNodes();
								var node = ".section.addImg";
								labeller.pt.find(node).addClass("selected");
								addImg.init(nodes[0]);
								return;
							}
							
							if(!currDataNum){
								that.data.videoObj['currDataNum'] = data.dataVO.page_num*1+1;
							}else{
								that.data.videoObj['currDataNum'] = currDataNum*1+1;
							}
							var startPage = Math.floor(data.dataVO.page_num*1/data.dataVO.page_size*1)+1;
							
							var total_size = data.dataVO.total_size;
							var page_size = data.dataVO.page_size;
							var temp = data.result.data;
							
							that.render.updateListPage(temp,startPage,page_size,total_size,currDataNum);
							//init one Data
							if(!currDataNum){
								that.render.renderVideoByData(temp[0],total_size);	
							}else{
								that.render.renderVideoByData(temp[currDataNum%page_size],total_size);
							}
							
							
							
						});
					},					
					
					getDataByNum(dataNum){
						const that = videoBBox;
						$("#loader").show();
						$.ajax({
							url : baseUrl + "data/getDataByNum.json",
							data : {dataset_id:that.data.videoObj['datasetId'],data_num : dataNum},
							type : "POST",
							traditional : true,
							success : function(res){
								$("#loader").hide();
// 								console.log(":SUCCESS: getDataByNum",res);
								that.data.videoObj['currDataNum'] = res.dataVO.data_num*1+1;
								that.render.renderVideoByData(res.result.data);
							},
							error : function(err){
								$("#loader").hide();
								console.log(":ERROR:",err);
							}
						});
					},				
					
					getMetaByDataId(dataId){
						const that = videoBBox;
						var meta = that.data.meta;
						$("#loader").show();
						var deferred = $.ajax({
							url : baseUrl + "meta/getMetaByDataId.json",
							data : {data_id : dataId},
							type : "POST",
							traditional : true,
							success : function(res){
// 								console.log(":SUCCESS: getMetaByDataId",res);
							},
							error : function(err){
								$("#loader").hide();
								console.log(":ERROR:",err);
							}
						});
						
						Promise.resolve(deferred).then(function(data){
							
							if(data.result.code == "3301"){
								$("#loader").hide();
								alert(data.result.data);
								location.href = baseUrl + "login";
								return false;
							}else if(data.result.code == "200"){
								var result = data.result.data;
// 								that.render.initMetaFromData(result);
// 								that.computed.checkMetaFrame(0);	
								
								$("#videoBBox .label_wrap .label_title span").html(result.length);
								
								// jh.sa 210122
								if(result.length > 0){
									that.render.initMetaFromData(result);
									that.computed.checkMetaFrame(0);
								} else {
									var no_label = '<div class="no_label"><div></div><div>No Label</div><div>Please Add Label</div></div>';
									$("#videoBBox .category_wrap").html(no_label); 	
									$("#loader").hide();
									$("#videoBBox .label_wrap .btn_wrap .add").show();
								}								
							}
							
						});
						
					},					
					
					adjustVideoSrc(dataAddr,fps){
						const that = videoBBox;
						
						that.data.player.src({
							type : "video/mp4",
							src : dataAddr,
						});
						that.data.playerFrame.frameRate = fps*1;
					},
					
					getSelectedCategoryDetail(data,uuid){
						const that = videoBBox;
						$("#loader").show();
						var deferred = $.ajax({
							url : baseUrl + "category/getSelectedCategoryDetail.json",
							data : data,
							type : "POST",
							traditional : true,
							success : function(res){
// 								console.log("::getSelectedCategoryDetail::",res);
								
							},
							error : function(err){
								$("#loader").hide();
								console.log("ERROR:",err)
							}
						});
						
						Promise.resolve(deferred).then(function(res){
							$("#loader").hide();
							$("#videoBBox .label_wrap .category_wrap .cate_wp[id='"+uuid+"'] select[name='category_0'] option[value='"+res.metaVO.category_0+"']").prop("selected",true);
							that.bind.sideEvtCollision();
						});
						
					},
					
					/* 
					@param ::
					meta_id : meta ID
					data_id : data ID
					user_id : user ID
					category : category written by input field
					created_date : create data
					info : startFm, endFm, uuid, rectData Array
					 */
					insertMetaData: function(){
						const that = videoBBox;
						var meta = that.data.meta;
						var keys = Object.keys(meta);
						var ajaxData = {};
						var data = [];
						
						// 수정!
// 						var dataId = $(".data_item .collapse-item.active").attr("data-id");
						var dataId = that.data.player.dataId;
						if(!dataId){
							alert("데이터를 선택해 주세요.");
							return false;
						}
						$("#loader").show();
						for(var i=0; i<keys.length; i++){
							
							// jh.sa 210126
							// k.park 201214 : startFrame 0일 경우 예외처리
							if(meta[keys[i]]['startFrame'] != 0 && !meta[keys[i]]['startFrame']){
								alert("바운딩 박스를 찾을 수 없습니다.\n첫점과 끝점에 바운딩 박스를 그린 후에 다시 시도해주세요.");
								$("#loader").hide();
								return false;
							}
							if((meta[keys[i]]['startFrame'] == meta[keys[i]]['endFrame']) || !meta[keys[i]]['endFrame'] ){
								var frame = that.data.playerFrame.get();
								that.computed.checkMetaFrame(frame);
								alert("끝점을 정해주세요.");
								$("#loader").hide();
								return false;
							}
							
							if(meta[keys[i]]['category'] == ""){
								alert("라벨명을 입력해주세요.");
								$("#loader").hide();
								return false;
							}							
// 							if(meta[keys[i]]['category'] == undefined){
// 								continue;
// 							}
// 							ajaxData[keys[i]] = {};
// 							ajaxData[keys[i]]["rectData"] = temp;
// 							ajaxData[keys[i]]["startFrame"] = meta[keys[i]]["startFrame"];
// 							ajaxData[keys[i]]["endFrame"] = meta[keys[i]]["endFrame"];
// 							ajaxData[keys[i]]["id"] = meta[keys[i]]["id"];
							
// 							ajaxData[keys[i]]["labelNo"] = meta[keys[i]]["labelNo"];

							// jh.sa 201125 : 가장자리 쪽에 바운딩 박스를 그린 경우 width, height 값의 오차 조정 
							that.computed.checkRectData(meta[keys[i]].rectData);

							var temp = that.computed.rescale(meta[keys[i]].rectData,true);
							
							var tmpObj = {
								startFrame : meta[keys[i]]["startFrame"],
								endFrame : meta[keys[i]]["endFrame"],
								rectData : temp,
							}
							var tmpRect = {
								meta_id : keys[i],
								label : meta[keys[i]]['category'],
								info : JSON.stringify(tmpObj),
							}
							data.push(tmpRect);
						}
						
// 						for(let i=0; i<keys.length; i++){
// 							if(meta[keys[i]]['category'] == undefined){
// 								continue;
// 							}
// 							let tmpObj = {
// 								data_id : dataId, 
// 								meta_id : keys[i],
// 								label : meta[keys[i]]["category"],
// 								label_type : "vBox", // video box(rectangle)
// 								info : JSON.stringify(ajaxData[keys[i]]),
// 							}
// 							data.push(tmpObj);
// 						}
						
						
						
						var ajaxData = {
							label_type : "VIDEO_BBOX",
							data_id : dataId,
							data : JSON.stringify(data)
						}
						
						if(data.length <=0){
							alert("저장할 데이터가 없습니다.");
							$("#loader").hide();
							return false;
						}
						
						$.ajax({
							url : baseUrl + "meta/insertMeta.json",
// 							data : { data : JSON.stringify(data) },
							data : ajaxData,
							type : "POST",
							traditional : true,
							timeout : 120000,
							success : function(res){
// 								console.log("SUCCESS!",res);
								$("#loader").hide();
								if(res.result.code == "3301"){
									alert(res.result.data);
									location.href = baseUrl + "login";
									return false;
								}
								if(res.result.code == "200"){
									alert(res.result.data);
									$("#videoBBox .category_wrap").html("");
									that.render.inputCurrFrame(0);
									that.data.videoObj.isModified = 0;
									
									that.computed.initVideoData(that.data.videoObj['currDataNum']*1-1);
									that.computed.updateDataset(that.data.videoObj['datasetId'], ajaxData['data_id']);
									
									
// 									that.computed.initVideoData(currDataNum);									
									return false;
								}else{
									alert(res.result.data);
									return false;
								}
							},
							error : function(err){
								$("#loader").hide();
								console.log("ERROR!",err);
								if(err.statusText == "timeout"){
									alert("네트워크가 지연되고 있습니다. 다시 저장해주십시요.");
								}
							}
						});
						
					},
					// j.seo 20201021
					updateDataset(dataset_id, data_id) {
						$("#loader").show();
 						$.ajax({
 							url : baseUrl + "data/updateDataset.json",
 							data : { dataset_id : dataset_id, save_data_id : data_id},			// id => dataset_id(0921)
 							type : "POST",
 							async : false,
 							success : function(res) {
//  						console.log("=======updateDataset======", res);
							$("#loader").hide();
 							console.log("SUCCESS");	 						
 							}, 
 							error : function(err) {
 								$("#loader").hide();
 								console.log("error!!!!", err);
 							}
 						});
 					}, 
					// j.seo 20201021
					getLastCursor(dataset_id) {
	 					const that = videoBBox;
	 					let result;
	 					$("#loader").show();
	 					$.ajax({
		 				url :  baseUrl + "data/getLastCursor.json",
		 				data : {dataset_id : dataset_id * 1},					//	id => dataset_id(0921)
		 				type : "GET",
		 				async : false,
		 				success : function(res){
		 					$("#loader").hide();
		 					console.log("=====getLastCursor=====",res);
		 					if(res.result.code == "200"){
		 						result = res.result.data;
		 					} else if(res.result.code == "2001"){
								alert(res.result.data);
								location.href = baseUrl + 'login';
							}
		 				},
		 				error : function(err){
		 					$("#loader").hide();
		 					alert(err);
		 					console.log("ERROR!!", err);
		 					}
	 					}); 	
	 				return result;
	 				},
					deleteMetaById(uuid,labelBox){
						const that = videoBBox;
						$("#loader").show();
						$.ajax({
							url : baseUrl + "meta/deleteMetaById.json",
							data : {meta_id:uuid},
							type : "POST",
							traditional : true,
							success : function(res){
// 								console.log(res);
								$("#loader").hide();
								if(res.result.code == "3301"){
									alert(res.result.data);
									location.href = baseUrl + "login";
									return false;
								}
								if(res.result.code == "3454"){
									alert(res.result.data);
									return false;
								}
								if(res.result.code == "200"){
									alert(res.result.data);
									that.computed.deleteMetaData(uuid,labelBox,true);
									return false;
								}
							},
							error : function(err){
								$("#loader").hide();
								console.log("ERROR!",err);
							}
						});
					},			
					
					
					// gap between real video size and web page
					getScaleFactor : function(){
						const that = videoBBox;
						var minBboxSize = 10;
						// 실제 비디오 크기 기준
						// scaleFactor > 1 : 실제 비디오가 캔버스 크기보다 큼
						// scaleFactor < 1 : 실제 비디오가 캔버스 크기보다 작음
						that.data.scaleFactor.origWidth = that.data.player.videoWidth();
						that.data.scaleFactor.origHeight = that.data.player.videoHeight();
						that.data.scaleFactor.ratio = $("#videoBBox-video").width() / that.data.scaleFactor.origWidth;
						that.data.scaleFactor.minBboxSize = that.data.scaleFactor.ratio * minBboxSize;
					}, // scalefactor end
					
					// re-size rect on canvas
					rescale : function(rectData,isSave){
						const that = videoBBox;
						var scaledRatio = that.data.scaleFactor.ratio;
						var tempData = [];
						
						if(!isSave){
							for(var i=0; i<rectData.length; i++){
								tempData[i] = {};
								tempData[i].top = rectData[i].top*scaledRatio;
								tempData[i].left = rectData[i].left*scaledRatio;
								tempData[i].width = rectData[i].width*scaledRatio;
								tempData[i].height = rectData[i].height*scaledRatio;
								tempData[i].status = rectData[i].status;
							}
						}else{
							for(var i=0; i<rectData.length; i++){
								tempData[i] = {};
								tempData[i].top = rectData[i].top/scaledRatio;
								tempData[i].left = rectData[i].left/scaledRatio;
								tempData[i].width = rectData[i].width/scaledRatio;
								tempData[i].height = rectData[i].height/scaledRatio;
								tempData[i].status = rectData[i].status;
							}
						}
						
						
						return tempData;
						
					}, // re-size rect on canvas end
					
					checkMetaFrame : function(frame){
						const that = videoBBox;
						
						var data = that.data;
						var meta = that.data.meta;
						var keys = Object.keys(meta);
						var canvas = that.data.canvas;
						var candidateMetaList = [];
						
						// 없음
						if(keys.length == 0 ){
							return;
						}
						// 메타 접근. 후보리스트 가져옴
						for(var i=0; i<keys.length; i++){
							// 메타에 프레임수를 통해 객체 있는거 가져옴(시작 끝 비교)
							var sf = meta[keys[i]].startFrame;
							var ef = meta[keys[i]].endFrame;
							
							if(frame >= sf && frame <= ef){
								// 후보리스트로 갖고있음
								candidateMetaList.push(meta[keys[i]]);
								
							}
						}
						
						var canvasObjects = canvas.getObjects();
						
						
						// 후보 리스트에 없는 캔버스 내의 객체는 삭제
						
						for(var i = 0; i < canvasObjects.length; i++){
							var isExist = false;
							var uuid = canvasObjects[i]["uuid"];
							
							for(var j = 0; j < candidateMetaList.length; j++){
								if(uuid == candidateMetaList[j]["id"]){
									isExist = true;
								}
							}
							
							if(!isExist){
								// delete
								canvas.remove(canvasObjects[i]);
							}else{
								// modify
								var arrNum = frame - meta[uuid].startFrame;
								that.render.moveRectOnCanvas(uuid,arrNum);
							}
						}
						
						if(candidateMetaList.length == 0){
							return;
						}
						
						
						// 후보 리스트 객체가 캔버스에 없으면 그려좀
						for(var i=0; i<candidateMetaList.length; i++){
							var isExist = false;
							var uuid = candidateMetaList[i]["id"];
							
							for(var j=0; j<canvasObjects.length; j++){
								if(uuid == canvasObjects[j]["uuid"]){
									isExist = true;
								}
							}
							
							if(!isExist){
								var arrNum = frame - meta[uuid].startFrame;
								that.computed.initMetaRect(uuid,arrNum);
							}
						};
						
					},
					
					//get array Number
					checkMetaDataStatus : function(uuid,currFrm){ 
						const that = videoBBox;
						
						var meta = that.data.meta;
						var keys = Object.keys(that.data.meta);
						var chkRectArrNum = {
							prevArrNum : 0,
							nextArrNum : 0,
							totalArrLen : meta[uuid].rectData.length-1,
						}
						// 중간에 위치 수정한 경우
						if( meta[uuid].startFrame < currFrm && currFrm < meta[uuid].endFrame){
							// min curr, max end
							let totalArrLenRev = meta[uuid].endFrame - currFrm;
							for(let i=currFrm-meta[uuid].startFrame+1; i<=meta[uuid].rectData.length; i++){
								
								if(meta[uuid].rectData[i] != undefined && meta[uuid].rectData[i].status == 1){
									chkRectArrNum.nextArrNum = i;
									break;
								}
							}
							for(let i=currFrm - meta[uuid].startFrame-1; i>=0; i--) {
								if(meta[uuid].rectData[i] != undefined && meta[uuid].rectData[i].status == 1 && i < chkRectArrNum.totalArrLen){
									chkRectArrNum.prevArrNum = i;
									break;
								}
							};
						
						// 앞 / 뒤에서 추가할 시.
						
						}
						
						// 마지막 이후에 추가시
						if(!meta[uuid].endFrame || meta[uuid].endFrame <= currFrm ){
							for(let i=chkRectArrNum.totalArrLen-1; i>=0; i--) {
								if(meta[uuid].rectData[i] != undefined && meta[uuid].rectData[i].status == 1 ) {
									chkRectArrNum.prevArrNum = i;
									chkRectArrNum.nextArrNum = chkRectArrNum.totalArrLen;
									meta[uuid].endFrame = currFrm;
									break;
								}
							};
							
						}
						
						// 처음 이전에 추가시
						if(meta[uuid].startFrame >= currFrm){
							
							for(let i=1; i <= chkRectArrNum.totalArrLen; i++) {
								if(meta[uuid].rectData[i] != undefined && meta[uuid].rectData[i].status == 1 ) {
									chkRectArrNum.nextArrNum = i;
									meta[uuid].startFrame = currFrm;
									break;
								}
							};
						}
												
						return chkRectArrNum
					},
					modifyMetaDataArr : function(uuid,currFrm){
						const that = videoBBox;
						var meta = that.data.meta;
						
						var emptyGap = meta[uuid].startFrame - currFrm;
						
						var tempArr = []; 
						for(var i=0; i< meta[uuid].rectData.length; i++){
							tempArr[i+emptyGap] = meta[uuid].rectData[i];
						}
						meta[uuid].rectData = tempArr;
					},
					
					generateMetaTempData : function(uuid,currFrm){
						const that = videoBBox;
						const totalLen = that.data.meta[uuid].rectData.length;
						var chkRectArrNum = this.checkMetaDataStatus(uuid,currFrm);
						
						for(let i=chkRectArrNum.prevArrNum+1; i<chkRectArrNum.nextArrNum; i++){
							that.data.meta[uuid].rectData[i] = {
									top : 0,
									left : 0,
									width : 0,
									height : 0,
									status : 0,
							}
						};
						
						Promise.all(that.data.meta[uuid].rectData).then( this.generateMetaData(uuid,currFrm) ); //added uuid 
						
					},
					
					generateMetaData : function(uuid,currFrm){
						const that = videoBBox;
						var chkRectArrNum = this.checkMetaDataStatus(uuid,currFrm);
						var meta = that.data.meta;
						
						
						if(meta[uuid].startFrame < currFrm && currFrm < meta[uuid].endFrame){
							fillForwardRectData(chkRectArrNum.prevArrNum, chkRectArrNum.nextArrNum);
							fillBackwardRectData(chkRectArrNum.nextArrNum);
						}
						
						if(meta[uuid].endFrame == currFrm){
							fillForwardRectData(chkRectArrNum.prevArrNum, chkRectArrNum.totalArrLen);
						}
						
						if(meta[uuid].startFrame == currFrm){
							fillBackwardRectData(chkRectArrNum.nextArrNum);
						}
						
						
						
						function fillForwardRectData(prevArrNum,nextArrNum){
							var currArrNum = currFrm-meta[uuid].startFrame;
							var frameGap = currArrNum-prevArrNum;
							if(isNaN(currArrNum)==true || isNaN(frameGap)){
								currArrNum = 0;
								frameGap = 1;
							}
							
							const gapObj = {
									tGap : (meta[uuid].rectData[currArrNum].top - meta[uuid].rectData[prevArrNum].top)/frameGap,
									lGap : (meta[uuid].rectData[currArrNum].left - meta[uuid].rectData[prevArrNum].left)/frameGap,
									wGap : (meta[uuid].rectData[currArrNum].width - meta[uuid].rectData[prevArrNum].width)/frameGap,
									hGap : (meta[uuid].rectData[currArrNum].height - meta[uuid].rectData[prevArrNum].height)/frameGap,
							};
							for(let i=prevArrNum+1; i<currArrNum; i++){
								meta[uuid].rectData[i] = {
										top : meta[uuid].rectData[i-1].top + gapObj.tGap,
										left : meta[uuid].rectData[i-1].left + gapObj.lGap,
										width : meta[uuid].rectData[i-1].width + gapObj.wGap,
										height : meta[uuid].rectData[i-1].height + gapObj.hGap,
										status : 0,
								}
							};
							
						};
						
						
						function fillBackwardRectData(nextArrNum){
							var currArrNum = currFrm - meta[uuid].startFrame;
							var frameGap = nextArrNum - currArrNum;
							
							if(isNaN(currArrNum)==true || isNaN(frameGap)){
								currArrNum = 0;
								frameGap = 1;
							}
							
							const gapObj = {
									tGap : (meta[uuid].rectData[nextArrNum].top - meta[uuid].rectData[currArrNum].top)/frameGap,
									lGap : (meta[uuid].rectData[nextArrNum].left - meta[uuid].rectData[currArrNum].left)/frameGap,
									wGap : (meta[uuid].rectData[nextArrNum].width - meta[uuid].rectData[currArrNum].width)/frameGap,
									hGap : (meta[uuid].rectData[nextArrNum].height - meta[uuid].rectData[currArrNum].height)/frameGap,
							};
							
							for(let i=currArrNum+1; i<nextArrNum; i++){
								meta[uuid].rectData[i] = {
										top : meta[uuid].rectData[i-1].top + gapObj.tGap,
										left : meta[uuid].rectData[i-1].left + gapObj.lGap,
										width : meta[uuid].rectData[i-1].width + gapObj.wGap,
										height : meta[uuid].rectData[i-1].height + gapObj.hGap,
										status : 0,
								}
							};
						};
						
					},
					
					// save rect all data
					saveMetaData : function(newRect,currFrm, uuid){
						window.getSession();
						const that = videoBBox;
						var meta = that.data.meta;
						var keys = Object.keys(meta);
						
						var tempRect = {
							top : newRect.top,
							left : newRect.left, 
							width : newRect.width, 
							height : newRect.height, 
							status:1,
						}
						
						if(meta[uuid].rectData != undefined){ // 수정/이동/추가 부분
							
							if(meta[uuid].startFrame > currFrm){
								this.modifyMetaDataArr(uuid,currFrm);
								meta[uuid].rectData[0] = tempRect;
							}else{
								var arrNum = currFrm - meta[uuid].startFrame;
								meta[uuid].rectData[arrNum] = tempRect;	
							}
							
							meta[uuid].category = $("#videoBBox .category_wrap [id="+uuid+"] .category").val();
							
							if(meta[uuid].startFrame < currFrm && currFrm < meta[uuid].endFrame){
								this.generateMetaData(uuid,currFrm);
							}else{
								this.generateMetaTempData(uuid,currFrm);
							}
							
						}else{ // 처음 저장시
							
							meta[uuid]['id'] = uuid;
							meta[uuid]['rectData'] = [tempRect];
							meta[uuid]['startFrame'] = currFrm;
							meta[uuid]['endFrame'] = currFrm;
							meta[uuid].category = $("#videoBBox .category_wrap [id="+uuid+"] .category").val();
							
							return;
						}
			   	    	
					},
					
					deleteMetaData(uuid,labelBox,isAjax){
						const that = videoBBox;
						var label_name = $(labelBox).find("input").val();
						if(!uuid){
							return false;
						}
						labelBox.remove();
						
						// jh.sa 210122
						if($("#videoBBox .category_wrap .cate_wp").length == 0){
							var no_label = '<div class="no_label"><div></div><div>No Label</div><div>Please Add Label</div></div>';
							$("#videoBBox .label_wrap .category_wrap ").html(no_label);
							that.data.videoObj.isModified = 0;
						}						
						
						delete that.data.meta[uuid];
						var canv = that.computed.getCanvasObject(uuid);
						that.data.canvas.remove(canv);
						var isDel = true;
						var tagset = that.computed.updateTagset(label_name, isDel);
						that.render.drawTagset(tagset, isDel);						
						
						if(!isAjax){
							alert("삭제가 완료되었습니다.");
						}								
					},					
					
					generateUUID : function(){
					    var d = new Date().getTime();
					    if(window.performance && typeof window.performance.now === "function"){
					        d += performance.now(); //use high-precision timer if available
					    }
					    var uuid = 'xxxxxxxx-xxxx-xxxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
					        var r = (d + Math.random()*16)%16 | 0;
					        d = Math.floor(d/16);
					        return (c=='x' ? r : (r&0x3|0x8)).toString(16);
					    });
					    return uuid;
					},
					
					getCanvasObject(uuid){
						const that = videoBBox;
						var canvasObjs = that.data.canvas.getObjects();
						var tempRect;
						
						for(var i=0; i<canvasObjs.length; i++){
							if(canvasObjs[i].uuid == uuid){
								tempRect = canvasObjs[i];
							}
						}
						return tempRect
					},
					
                    checkRectData : function(rectData){
						const that = videoBBox;               	
                        var ow = that.data.scaleFactor.origWidth;
                        var oh = that.data.scaleFactor.origHeight;
                        var sf = that.data.scaleFactor.ratio;
                        var minBboxSize = that.data.scaleFactor.minBboxSize;

                        for(var j=0; j < rectData.length; j++){
                            // 우측 가장자리								
                            if(((rectData[j].left / sf) + (rectData[j].width / sf)) > ow){
                                rectData[j].width = (ow * sf) - rectData[j].left;
                                if(rectData[j].width < minBboxSize){
									const tw = rectData[j].width;                                	
                                	rectData[j].width = minBboxSize;
                                	rectData[j].left = rectData[j].left - (minBboxSize-tw);
                                }
                            }
                            // 하단 가장자리
                            if(((rectData[j].top / sf) + (rectData[j].height / sf)) > oh){
                                rectData[j].height = (oh * sf) - rectData[j].top;
                                if(rectData[j].height < minBboxSize){
                                	const th = rectData[j].height;
                                	rectData[j].height = minBboxSize;
                                	rectData[j].top = rectData[j].top - (minBboxSize-th);                                	
                                }
                            }
                        }
                    },			
                    
					// jh.sa 210226 tag
					getLabelGroup : function(dataId){
						const that = videoBBox;
						
						var tagset = [];
						var ajaxData = {
							data_id : dataId		
						};
						$.ajax({
							url :  baseUrl + "/data/getLabelGroup.json",
							data : ajaxData,
							type : "POST",
							async: false,
							success : function(res){
								console.log("=====getLabelGroup=====", res);
								if(res.result.code == 200){
									const data = res.result.data;
									for(let i=0, len=data.length; i<len; i++){
										tagset.push(data[i].label);
									}
									that.data.tag = tagset;
									console.log("이 데이터의 라벨 태그: ",tagset);
									that.render.drawTagset(tagset);
									$("#videoBBox .label_wrap .label_title span").html(tagset.length);
								} else {
									alert(res.result.data)
								}
							},
							error : function(err){
								alert(err);
								console.log("ERROR!!", err);
							}
						});						
					},
					
					updateTagset : function(text, isDel){
						const that = videoBBox;
						var tagset = that.data.tag;
						var isDup = false;
						
						for(var i=0; i<tagset.length; i++){
							if(tagset[i] == text){
								isDup = true;
								break;
							} else {
								isDup = false;
							}
						}
						
						if(isDel != undefined){
							if(isDup){
								tagset.splice(tagset.indexOf(text),1);
							}
						} else {
							if(!isDup){
								tagset.push(text);
							}
						}
						
						that.data.tag = tagset;
						console.log("tagset: ",tagset);
						
						return tagset;
					},                    
                   
					
				}, // computed end
				
				// draw something
				render : {
					
					updateListPage(temp,startPage,page_size,total_size){
						const that = videoBBox;
						var pt = that.pt;
						var totalPage = Math.ceil(total_size * 1 / page_size);
						
						if($("#videoBBox #pagination").data("twbs-pagination")){
							$("#videoBBox #pagination").twbsPagination('destroy');
						}
						
						$("#videoBBox #pagination").twbsPagination({
							  totalPages: totalPage,
							  visiblePages: 5,
							  first:"<<",
							  prev:"<",
							  next:">",
							  last:">>",
// 							  initiateStartPageClick : true,
							  startPage: startPage,
// 							  onPageClick: function (event, page_num) {
// 								  console.log(event,page_num);
// 								  that.render.drawDataList(temp,total_size, page_num, page_size);
// 							  }
						});
						that.render.drawDataList(temp,total_size);
						
					},					
					
					/*
					*  jh.sa 201015 : drawDataList
					*/
					drawDataList(data, totalSize, pageNum, pageSize){
						const that = videoBBox;
						
						var total = $("#videoBBox .data_list_wrap .data_total span");
						var target = $("#videoBBox .list_table .c_wrap");
						var html = "";
						
						total.html(totalSize);
						target.html("");
						for(var i=0; i < data.length; i++){
							html += "<li class='flex' data-id='" + data[i].data_id + "' data-index='" + (i+1) + "'>";	// (i+1) 부분은 수정필요
							html += " <div class='preview'><div class='img_preview'></div></div>";
							html += " <div class='id'>" + data[i].data_id + "</div>";
							html += " <div class='path filter_color' data-path='"+data[i].path+"' title='"+data[i].filename+"'>" + data[i].filename + "</div>";
							html += " <div class='label_cnt'>" + data[i]['meta_cnt'] + "</div>";
							html += "</li>";
						}
						
						target.append(html);
					},					
					
					renderVideoByData(data,total_size){
						const that = videoBBox;
						
						that.data.player['dataId'] = data['data_id'];
						// jh.sa 210121
						that.data.player['finalFrame'] = data['frame'];
						var dataAddr = '/uploadFile/xlabeller/'+data.path;
						
						$("#videoBBox .prog_bar .name_wrap .video_name").html(data['filename']);
						$("#videoBBox .img_list_wrap .name_wrap .video_name").html(data['filename']);
						$("#videoBBox .img_list_wrap .name_wrap .video_name").attr("title",data['filename']);
						$("#videoBBox .list_table .c_wrap .path").removeClass("active");
						$("#videoBBox .list_table .c_wrap [data-id='"+data['data_id']+"'] .path").addClass("active");
						$("#videoBBox .list_table .c_wrap [data-id='"+data['data_id']+"'] .label_cnt").html(data['meta_cnt']);
						$("#videoBBox .position_wrap .position-value").val(that.data.videoObj['currDataNum']);
						
						if(total_size){
							$("#videoBBox .position_wrap .total_count span").html(total_size);
						}
						
						// jh.sa 210121
						if(that.data.player['finalFrame']){
							$("#videoBBox .frame_wrap .total_frame span").html(that.data.player['finalFrame']);
						}							
						
						that.pt.find(".empty_wrap").remove();
						that.pt.find("section.enrichment .canvas-container").show();	
						that.pt.find("section.enrichment #videoBBox-video").show();							
						that.computed.adjustVideoSrc(dataAddr,data['fps']);
// 						that.computed.loadImage(dataAddr);
						that.render.checkWindowWidth();
						that.bind.sideEvtCollision();
						
					},					
					
					// function move rectangle
					moveRectOnCanvas(uuid,arrNum){
						const that = videoBBox;
						
						var meta = that.data.meta[uuid].rectData[arrNum];
						var tempRect = that.computed.getCanvasObject(uuid);
						 
						tempRect.set({ 
							scaleX : 1,
							scaleY : 1,
							top: Math.abs(meta.top),
							left: Math.abs(meta.left),
							width: Math.abs(meta.width),
							height: Math.abs(meta.height),
						});
						
						tempRect.setCoords();
						that.data.canvas.renderAll();
						
					},
					initMetaFromData(result){
						const that = videoBBox;
						var meta = that.data.meta;
						var cateArr = [];
						
						$("#videoBBox .label_wrap .category_wrap").empty();
						if(!result){
							return false;
						}
						for(let i=0; i<result.length; i++){
							var temp = JSON.parse(result[i].info);
							
							var rectData = that.computed.rescale(temp['rectData']);
							meta[result[i]['meta_id']] = {
								id : result[i]['meta_id'],
								rectData : rectData,
								category : result[i]['label'],
								startFrame : temp['startFrame'],
								endFrame : temp['endFrame'],
							}
						};
						
						that.render.renderCate();
						$("#videoBBox .label_wrap .btn_wrap .add").show();
						$("#videoBBox .label_wrap .category_wrap .cate").removeClass("selected");
						$("#videoBBox .label_wrap .category_wrap .cate").last().addClass("selected");
						$("#loader").hide();
					},
					// in labeller tab
					tempInitCategory(uuid){
						const that = videoBBox;
						
						var html = '<div class=" cate_wp  " id="'+uuid+'">';
						html += '	<div class="cate_header col-12 flex justify-content-between p-1">';
						html += '		<div class="color  "></div>';
						html += '		<button  class="start_frm btn btn-info">Start</button>';
						html += '		<button class="end_frm btn btn-info">End</button>';
						html += '       <button class="delete_frm btn btn-danger">Delete subsequent frames</button>';
						html += '		<button class="delete btn btn-danger ">Delete</button>';
						html += '	</div>';
						html += '	<div class="w-100"></div>';
						html += '	<div class="col-12 text-center p-1">';
						html += '		<input type="text" class="form-control category" name="label_name" placeholder="Please enter label name" onkeyUp="noKor(event);noSpaceForm(this);" onchange="noSpaceForm(this);"/>';
						html += '	</div>';
						
						html += '</div>';
						
						return html;
					},
					
					renderCate() { //drawing category from meta in labeller tab
						const that = videoBBox;
						var meta = that.data.meta;
						var metaKeys = Object.keys(meta);
						
						if(metaKeys.length == 0){
							var no_label = '<div class="no_label"><div></div><div>No Label</div><div>Please Add Label</div></div>';
							$("#videoBBox .label_wrap .category_wrap ").html(no_label);
						} else {
							$("#videoBBox .label_wrap .category_wrap ").html("");
						}						
						
						for(var i=0; i<metaKeys.length; i++){
							
							var uuid = meta[metaKeys[i]]['id'];
							var labelNo = meta[metaKeys[i]]['labelNo'];
							
							let html = that.render.tempInitCategory(uuid);
							$("#videoBBox .label_wrap .category_wrap ").append(html);
							
							let color = that.data.colorHash.rgb(uuid);
							$("#videoBBox .label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
							
							$("#videoBBox .label_wrap .category_wrap [id='"+uuid+"'] .category").val(meta[metaKeys[i]]['category']);
						}
						
						that.bind.sideEvtCollision();
					
					}, // drawing category from meta end in Labeller tab
					
					// input current Frame info on the progress bar
					inputCurrFrame(frame){
						$("#videoBBox .btn_wrap input.curr_frame").val(frame);
					}, //  input curr frame end
					
					adjustArea(){
						const that = videoBBox;
						var scaleFactor = that.data.scaleFactor;
						
						var scaledHeight = scaleFactor.origHeight * scaleFactor.ratio;
						var progBarHeight = 157;
						var headerHeight = 67*1;
// 						var progBarHeight = $("#videoBBox .prog_bar").height();
						// video area height
						$("#videoBBox .enrichment").css("height",scaledHeight*1+progBarHeight+headerHeight);
						$("#videoBBox-video").css("height",scaledHeight);
						$("#videoBBox .video_pwrap ").css("height",scaledHeight);
						
						// canvas init and adjust height
// 						that.data.canvas.setHeight(scaledHeight-progBarHeight);
						that.data.canvas.setHeight(scaledHeight);
// 						// search area height
// 						$(".cate_search_wrap .content_wp").css("height",scaledHeight-progBarHeight);
						
		 				// category area height
// 						$("#videoBBox .label_wrap ").css("height",$("#labeller-video")[0].clientHeight); //jh.sa
// 						$("#videoBBox .label_wrap .category_wrap").css("height",$("#labeller-video")[0].clientHeight-progBarHeight-10); //jh.sa
						
						// side bar list height
// 						$("#accordionSidebar li.nav-item").css("height",$(".labeller_container")[0].clientHeight+progBarHeight);
// 						$("#accordionSidebar .data_list .data_item.show").css("max-height",$(".labeller_container")[0].clientHeight-( $("#accordionSidebar a.nav-link")[0].clientHeight) );
					},
					
					checkWindowWidth(){
						var bodyWidth = $("body").width();
						if(bodyWidth <= 1440){
							$(".labeller_container .label_wrap").css("width","200px");
						}
					},
					
					//toggle playbutton
					// isPaused == true -> change play button to pause button
					renderTogglePlayBtn(isPaused){
						const that = videoBBox;
					
						if(isPaused == false){
							$("#videoBBox .img_list_wrap .btn_wrap .play_btn").find("i").removeClass("fa-play");
							$("#videoBBox .img_list_wrap .btn_wrap .play_btn").find("i").addClass("fa-pause");
							$("#videoBBox .img_list_wrap .btn_wrap .play_btn").addClass("pause_btn");
							$("#videoBBox .img_list_wrap .btn_wrap .play_btn").removeClass("play_btn");
						}else{
							$("#videoBBox .img_list_wrap .btn_wrap .pause_btn").find("i").removeClass("fa-pause");
							$("#videoBBox .img_list_wrap .btn_wrap .pause_btn").find("i").addClass("fa-play");
							$("#videoBBox .img_list_wrap .btn_wrap .pause_btn").addClass("play_btn");
							$("#videoBBox .img_list_wrap .btn_wrap .pause_btn").removeClass("pause_btn");
							
						}
						that.bind.sideEvtCollision();
					},
					
					// jh.sa 210226 tag
					drawTagset : function(tags,isDel){
						const that = videoBBox;
						var target = that.pt.find(".tag_wrap .tag_margin");
						target.empty();
						that.pt.find("section.tag .label_title span").html(tags.length);
						if(tags.length>0){
							that.pt.find(".tag_wrap .tag_margin").append("<div class='content'></div>");
							for(var i=0; i<tags.length; i++){
								var html = "<div id='"+tags[i]+"' class='tag fl'>#"+tags[i]+"</div>";
								that.pt.find(".tag_wrap .tag_margin .content").append(html);
							}
							that.pt.find(".tag_wrap .tag_margin .content").append("<div class='clear'></div>");
						}
						if(isDel){
							that.pt.find(".category_wrap .cate_wp").show();
							var settingTargets = that.pt.find(".category_wrap .cate_wp");
//								that.computed.tagSetting(targets);
							that.pt.find(".label_wrap .label_title span").html(settingTargets.length);
						}
						that.bind.sideEvtCollision();
					},					
					
					addHoverBox : function(elem,text){
						const that = videoBBox;

						if (elem[0].scrollWidth >  elem[0].clientWidth) {
							var btn_width = elem.outerWidth();
							var btn_height = elem.outerHeight();
							var top = elem.offset().top;
							var left = elem.offset().left;
							var right = ($(window).width() - (elem.offset().left + elem.outerWidth())); 
							var bottom = ($(window).height() - (elem.offset().top + elem.outerHeight()));

						   	elem.append("<div class='hover_box'><div class='hover_div'><div>"+text+"</div</div></div>");
						   	var hover_box = elem.children(".hover_box");
						   	var text_div = hover_box.find(".hover_div div");
							hover_box.css({"display" : "block"});
						   	var text_width = text_div.outerWidth();
						   	var text_height = text_div.outerHeight();
						   	hover_box.css({"display" : "none"});
				   	
						   	var x;
						   	var y;
						   	
						   	
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
						}
					},
					
					removeHoverBox : function(elem){
						const that = videoBBox;
						elem.find(".hover_box").remove();
					},						
					
				},// draw something end
				
				
		};
		
		const videoBBoxQuick = {
				data : {
					taskName : null,
					annotationName : null,
					inferenceName : null,		
				},
				init : function(){
					const that = videoBBoxQuick;
					
					that.bind.quickTraining();
					that.bind.quickInference();
				},
				bind : {
					// Quick Training & Inference
					quickTraining() {
						const that = videoBBoxQuick;
						
						// quick training 팝업창 띄우기
						$("#videoBBox #quick_training_btn").off("click").on("click", function(){
							$("#videoBBox .quick_training").toggleClass("active");
							$("#videoBBox .quick_training").draggable({containment: "document"});
							$("#videoBBox .add_project").removeClass("active");
							$("#videoBBox .checkpoint_list").removeClass("active");
							$("#videoBBox .quick_training .radioBtn.selected").removeClass("selected");	
							$("#videoBBox .training_config").removeClass("active");
							$("#videoBBox .add_project_btn")[0].textContent = "+";
							$("#videoBBox .training_config_btn")[0].textContent = "+";
							$("#videoBBox #quick_training .checkpoint_list_btn")[0].textContent = "+";
							$("#videoBBox .description_wrap").removeClass("border");
							$("#videoBBox .checkpoint_view").removeClass("active");
							$("#videoBBox .algorithm_result").removeAttr("disabled");
							$("#videoBBox #training_config .config_wrap").html("");
							$("#videoBBox #training_config .description_wrap").html("");	
							$("#videoBBox .empty_wrap").remove();
							// j.seo 수정
							/* that.root.computed.getDatasetList(); */
							that.computed.setAnnoTaskName();
							that.computed.getTaskList(null, "0");
							that.computed.getAlgorithmList();
						});
						// 새 project 생성 창 띄우기 버튼 
						$("#videoBBox .add_project_btn").off("click").on("click", function() {
							let add_project_zIndex = parseInt($("#videoBBox #quick_training .add_project").css("zIndex"));
							let checkpoint_list_zIndex = parseInt($("#videoBBox #quick_training .checkpoint_list").css("zIndex"));
							let train_config_zIndex = parseInt($("#videoBBox #quick_training .training_config").css("zIndex"));	
							
							$("#videoBBox .add_project").toggleClass("active");
							$("#videoBBox .add_project input").val("");
							$("#videoBBox .add_project textarea").val("");
							if($("#videoBBox .add_project").hasClass("active")){
								$("#videoBBox .add_project_btn")[0].textContent = "-";
							} else {
								$("#videoBBox .add_project_btn")[0].textContent = "+";
							}
							
							// z-index 우선순위 제어
							if(add_project_zIndex <= checkpoint_list_zIndex){
								$("#videoBBox #quick_training .add_project").css({"zIndex":checkpoint_list_zIndex + 1});
							} else if(add_project_zIndex <= train_config_zIndex) {
								$("#videoBBox #quick_training .add_project").css({"zIndex":train_config_zIndex + 1});
							}					
						});
						// Checkpoint list 창 띄우기 버튼
						$("#videoBBox #quick_training .checkpoint_list_btn").off("click").on("click", function() {
							let add_project_zIndex = parseInt($("#videoBBox #quick_training .add_project").css("zIndex"));
							let checkpoint_list_zIndex = parseInt($("#videoBBox #quick_training .checkpoint_list").css("zIndex"));
							let train_config_zIndex = parseInt($("#videoBBox #quick_training .training_config").css("zIndex"));
							
							if($("#videoBBox .task_result").val() != ""){
								$("#videoBBox #quick_training .checkpoint_list").toggleClass("active");
//		 						$("#videoBBox .empty_wrap").remove();
//		 						$(".quick_training .radioBtn.selected").removeClass("selected");	// 수정 창 띄울때 없애는것이 아니라 옵션이 바뀔때 없애야함
								if($("#videoBBox #quick_training .checkpoint_list").hasClass("active")){
									$("#videoBBox #quick_training .checkpoint_list_btn")[0].textContent = "-";
								} else {
									$("#videoBBox #quick_training .checkpoint_list_btn")[0].textContent = "+";
								}					
							} else {
								alert("Inheritance에 사용할 task를 선택해주세요");	
							}
							
							// z-index 우선순위 제어
							if(checkpoint_list_zIndex <= add_project_zIndex){
								$("#videoBBox #quick_training .checkpoint_list").css({"zIndex":add_project_zIndex + 1});
							} else if(checkpoint_list_zIndex <= train_config_zIndex) {
								$("#videoBBox #quick_training .checkpoint_list").css({"zIndex":train_config_zIndex + 1});
							}					
						});
						// Training config 입력 영역 띄우기 버튼
						$("#videoBBox .training_config_btn").off("click").on("click", function() {
							let add_project_zIndex = parseInt($("#videoBBox #quick_training .add_project").css("zIndex"));
							let checkpoint_list_zIndex = parseInt($("#videoBBox #quick_training .checkpoint_list").css("zIndex"));
							let train_config_zIndex = parseInt($("#videoBBox #quick_training .training_config").css("zIndex"));
							
							$("#videoBBox .training_config").toggleClass("active");
//		 					$("#videoBBox .description_wrap").html("");
							if($("#videoBBox .training_config").hasClass("active")){
								$("#videoBBox .training_config_btn")[0].textContent = "-";
							} else {
								$("#videoBBox .training_config_btn")[0].textContent = "+";
							}
							
							// z-index 우선순위 제어
							if(train_config_zIndex <= add_project_zIndex){
								$("#videoBBox #quick_training .training_config").css({"zIndex":add_project_zIndex + 1});
							} else if(train_config_zIndex <= checkpoint_list_zIndex) {
								$("#videoBBox #quick_training .training_config").css({"zIndex":checkpoint_list_zIndex + 1});
							}					
						});					
						// 팝업창 닫기
						$("#videoBBox #quick_training .quick_close").off("click").on("click", function() {
							$("#videoBBox .quick_training").removeClass("active");
							$("#videoBBox .checkpoint_list .selected_task_name").html("");					
						});
						$("#videoBBox #quick_training .add_project .side_btn_wrap .cancel_btn").off("click").on("click", function() {
							$("#videoBBox .add_project").removeClass("active");
							$("#videoBBox .add_project_btn")[0].textContent = "+";
						});
						$("#videoBBox #quick_training .training_config .side_btn_wrap .cancel_btn").off("click").on("click", function() {
							$("#videoBBox .training_config").removeClass("active");
							$("#videoBBox .training_config_btn")[0].textContent = "+";
							let temp_id = $("#videoBBox .quick_training .algorithm_result option:selected").data("id");
							that.computed.getAlgorithmById(temp_id, "0");
						});		
						$("#videoBBox #quick_training .training_config .side_btn_wrap .save_btn").off("click").on("click", function() {
							$("#videoBBox .training_config").removeClass("active");
							$("#videoBBox .training_config_btn")[0].textContent = "+";
						});						
						
						$("#videoBBox #quick_training .checkpoint_list .side_btn_wrap .cancel_btn").off("click").on("click", function() {
							$("#videoBBox #quick_training .checkpoint_list").removeClass("active");
							$("#videoBBox #quick_training .checkpoint_list_btn")[0].textContent = "+";					
//		 					$(".quick_training .radioBtn.selected").removeClass("selected");
							if($("#videoBBox .quick_training .radioBtn.selected").length == 0){
								$("#videoBBox .checkpoint_view").removeClass("active");
							}
							let temp_id = $("#videoBBox .quick_training .task_result option:selected").data("id");
							that.computed.getCheckpointList(temp_id, "0");
						});		
						$("#videoBBox #quick_training .checkpoint_list .side_btn_wrap .save_btn").off("click").on("click", function() {
							$("#videoBBox #quick_training .checkpoint_list").removeClass("active");
							$("#videoBBox #quick_training .checkpoint_list_btn")[0].textContent = "+";
						});
						// project 생성 버튼
						$("#videoBBox .quick_training .add_btn").off("click").on("click", function() {
							that.computed.getProjectData();
							$("#videoBBox .add_project").removeClass("active");
							$("#videoBBox .add_project_btn")[0].textContent = "+";					
						});
						// start training 버튼 			
						$("#videoBBox .quick_training_btn").off("click").on("click", function() {
							$("#videoBBox .algorithm_result").removeAttr("disabled");
							that.computed.createJsonQuickTrain();
						});
					
					},
					
					quickInference() {
						const that = videoBBoxQuick;
						
						// 팝업창 띄우기
						$("#videoBBox #quick_inference_btn").off("click").on("click", function(){
							$("#videoBBox .quick_inference").toggleClass("active");
							$("#videoBBox .quick_inference").draggable({containment: "document"});
							$("#videoBBox .quick_inference .radioBtn.selected").removeClass("selected");					
							$("#videoBBox .inference_config").removeClass("active");
							$("#videoBBox .inference_config_btn")[0].textContent = "+";			
							$("#videoBBox .description_wrap").removeClass("border");						
							$("#videoBBox #inference_config .config_wrap").html("");
							$("#videoBBox #inference_config .description_wrap").html("");
							$("#videoBBox .quick_task_list .table_body tbody").html("");
							that.computed.getTaskList(null, "1");
							that.computed.setAnnoTaskName();
						});				
						// Inference config 입력 영역 띄우기 버튼
						$("#videoBBox .inference_config_btn").off("click").on("click", function() {
							if($("#videoBBox #quick_inference .radioBtn.selected").length == 0){
								alert("Task를 선택해주세요");
								return
							} else {
								$("#videoBBox .inference_config").toggleClass("active");
//			 					$("#videoBBox .description_wrap").html("");
								if($("#videoBBox .inference_config").hasClass("active")){
									$("#videoBBox .inference_config_btn")[0].textContent = "-";
								} else {
									$("#videoBBox .inference_config_btn")[0].textContent = "+";
								}
							}
						});				
						// 팝업창 닫기
						$("#videoBBox #quick_inference .quick_close").off("click").on("click", function() {
							$("#videoBBox .quick_inference").removeClass("active");
							$("#videoBBox .quick_inference input[name='csv_title']").val("");
						});	
						$("#videoBBox #quick_inference .side_btn_wrap .cancel_btn").off("click").on("click", function() {
							$("#videoBBox .inference_config").removeClass("active");
							$("#videoBBox .inference_config_btn")[0].textContent = "+";
							let temp_id = $("#videoBBox .quick_inference .quick_task_list .radioBtn.selected").parent().next().data("id");
							that.computed.getTaskById(temp_id);
						});		
						$("#videoBBox #quick_inference .side_btn_wrap .save_btn").off("click").on("click", function() {
							$("#videoBBox .inference_config").removeClass("active");
							$("#videoBBox .inference_config_btn")[0].textContent = "+";
						});							
						// run inference 버튼 			
						$("#videoBBox .quick_inference_btn").off("click").on("click", function() {
							that.computed.createJsonQuickInference();
						});				
					},		
					
					checkPointListener() {
						const that = videoBBoxQuick;
						 
						let chk_radio_obj;
						let row_click = $("#videoBBox .checkpoint_list .list_wrap .checkpoint_table tbody tr")
						row_click.off("click").on("click",function() {
							let tr = $(this);
							let btn = tr.children().children(".radioBtn");
							let chkpoint_name = tr.children(".checkPoint_name").val();
							let checkpoint_view = $("#videoBBox .checkpoint_view");
							btn.toggleClass("selected");
							if(btn.hasClass("selected")){
								chk_radio_obj = {};
								$("#videoBBox .checkpoint_list .list_wrap .checkpoint_table tbody tr .radioBtn").removeClass("selected");
								btn.addClass("selected");
								chk_radio_obj[chkpoint_name] = chkpoint_name;
//		 						that.selectCheckpointAlgorithm();
								
								let selected_id = $("#videoBBox .task_result option:selected").data("id");
								that.render.getSelectedTaskById(selected_id);
								
								let selected_cp_name = $("#videoBBox .checkpoint_list .radioBtn.selected").parent().next().text();
								console.log("chkpoint_name: ", selected_cp_name);
								checkpoint_view.addClass("active");
								checkpoint_view.html("Selected Checkpoint :" + selected_cp_name);
								
								$("#videoBBox .algorithm_result").attr("disabled","disabled");		// 체크포인트 선택 시 algorithm select 비활성화 
							} else {
								chk_radio_obj = {};
								$("#videoBBox .algorithm_result").removeAttr("disabled");
								checkpoint_view.removeClass("active");
								checkpoint_view.html("");
								// 초기화시 YOWO 기본값 적용 
								let options = $("#videoBBox .algorithm_result").children("option");
								let selected_option_id;
								for(var i=1; i < options.length; i++){
								    if(options[i].label == "YOWO"){
								    	options[i].selected = true;
								    	selected_option_id = options[i].attributes["data-id"].value
								    }
								}
								that.computed.getAlgorithmById(selected_option_id, "0", null);				// YOWO algorithm_id
							}
							
						});	
					},
					
					inferenceCheckPointListener() {
						const that = videoBBoxQuick;
						 
						let chk_radio_obj;
						let row_click = $("#videoBBox .inference_checkpoint .list_wrap .checkpoint_table tbody tr")
						row_click.off("click").on("click",function() {
							let tr = $(this);
							let btn = tr.children().children(".radioBtn");
							let chkpoint_name = tr.children(".checkPoint_name").val();
							let checkpoint_view = $("#videoBBox .checkpoint_view");
							btn.toggleClass("selected");
							if(btn.hasClass("selected")){
								chk_radio_obj = {};
								$("#videoBBox .inference_checkpoint .list_wrap .checkpoint_table tbody tr .radioBtn").removeClass("selected");
								btn.addClass("selected");
								chk_radio_obj[chkpoint_name] = chkpoint_name;
								
//		 						let selected_cp_name = $("#videoBBox .inference_checkpoint .radioBtn.selected").parent().next().text();
//		 						console.log("chkpoint_name: ", selected_cp_name);
//		 						checkpoint_view.addClass("active");
//		 						checkpoint_view.html("Selected Checkpoint :" + selected_cp_name);
							} else {
								chk_radio_obj = {};
								checkpoint_view.removeClass("active");
								checkpoint_view.html("");
							}
							
						});	
					},		
					
					taskListener : function() {
						const that = videoBBoxQuick;
						 
						let chk_radio_obj_inf;
						let row_click_inf = $("#videoBBox #quick_inference .list_wrap .table_body .task_table tbody tr")
						row_click_inf.off("click").on("click",function() {
							let tr = $(this);
							let btn = tr.children().children(".radioBtn");
							let task_name = tr.children(".task_name").val();
							let task_id = tr.children(".task_name")[0].attributes["data-id"].value;
							btn.toggleClass("selected");
							if(btn.hasClass("selected")){
								chk_radio_obj_inf = {};
								$("#videoBBox #quick_inference .list_wrap .table_body .task_table tbody tr .radioBtn").removeClass("selected");
								btn.addClass("selected");
								chk_radio_obj_inf[task_name] = task_name;
							} else {
								chk_radio_obj_inf = {};
								$("#videoBBox .inference_checkpoint .list_wrap .checkpoint_table tbody").html("");
								$("#videoBBox .inference_config").removeClass("active");
								$("#videoBBox .inference_config_btn")[0].textContent = "+";
							}
							$("#videoBBox .inference_checkpoint .list_wrap .checkpoint_table tbody").html("");
							that.computed.getTaskById(task_id);
							$("#videoBBox #inference_config .description_wrap").addClass("border");	
						});	
						
						let chk_radio_obj_train;
						let row_click_train = $("#videoBBox #quick_training .list_wrap .table_body .task_table tbody tr")
						row_click_train.off("click").on("click",function() {
							let tr = $(this);
							let btn = tr.children().children(".radioBtn");
							let task_name = tr.children(".task_name").val();
							let task_id = tr.children(".task_name")[0].attributes["data-id"].value;
							btn.toggleClass("selected");
							if(btn.hasClass("selected")){
								chk_radio_obj_train = {};
								$("#videoBBox #quick_training .list_wrap .table_body .task_table tbody tr .radioBtn").removeClass("selected");
								btn.addClass("selected");
								chk_radio_obj_train[task_name] = task_name;
							} else {
								chk_radio_obj_train = {};
							}
							that.computed.getTaskById(task_id);
							$("#videoBBox #training_config .description_wrap").addClass("border");	
						});					
					},				
					
					selectCheckpointAlgorithm(algorithm_id){
						const that = videoBBoxQuick;
						
						console.log("algorithm_id???? ", algorithm_id);
						let options = $("#videoBBox .algorithm_result").children("option");
						for(var i=1; i < options.length; i++){
						    if(options[i].attributes["data-id"].value == algorithm_id){
						    	options[i].selected = true;
						    }
						}
					},				
				},
				computed : {
					setAnnoTaskName() {
						const that = videoBBoxQuick;
						$("#loader").show();
						const deffered = $.ajax({
							url : baseUrl + "task/setAnnoTaskName.json",
							data : {dataset_id : videoBBox.data.videoObj.datasetId},
							type : "POST",
							success(res){
								$("#loader").hide();
								console.log("=======setAnnoTaskName=======", res);
								that.data.taskName = res.result[0];
								that.data.annotationName = res.result[1];
								that.data.inferenceName = res.result[2];
								that.computed.getDatasetList();

							},
							error(err) {
								$("#loader").hide();
								console.log("ERROR!!", err);
							}
						});
						return deffered;
					},
					
					getDatasetList(){
						const that = videoBBoxQuick;
						$("#loader").show();
						const deffered = $.ajax({
							url : baseUrl + "/data/getDatasetList.json",
							data : {dataset_id : null},							// id => dataset_id(0921)
							type : "POST",
							success(res){
								console.log("=======getDatasetList=======", res);
								$("#loader").hide();
								if(res.result.code == "200"){
									that.render.drawDefaultQuickInfo(res.result.data);
									that.render.drawDefaultCsvInfo(res.result.data);							
								} else if(res.result.code == "2001"){
									alert(res.result.data);
									location.href = baseUrl + 'login';
								} else {
									alert(res.result.data);
								}

							},
							error(err) {
								$("#loader").hide();
								console.log("ERROR!!", err);
							}
						});
						return deffered;				
					},					
					
					getTaskList(data, num){
						const that = videoBBoxQuick;
						$("#loader").show();
						const deffered = $.ajax({
							url : baseUrl + "/task/getQuickInferenceTaskList.json",
							data : {project_id : null, id : videoBBox.data.videoObj.datasetId},
							type : "POST",
							success(res){
								console.log("=======getQuickInferenceTaskList=======", res);
								$("#loader").hide();
								if(res.result.code == "200"){
									if(num == "0"){
										that.computed.getProjectList(res.result.data, "0");
									} else if (num == "1") {
										that.computed.getProjectList(res.result.data, "1");
									}
								} else if (res.result.code == "2001") {
									alert(res.result.data);
									location.href = baseUrl + 'login';
								} else {
									alert(res.result.data);
								}								

								
							},
							error(err) {
								$("#loader").hide();
								console.log("ERROR!!", err);
							}
						});
						return deffered;				
					},				
					
					getAlgorithmList(){
						const that = videoBBoxQuick;
						$("#loader").show();
						const deffered = $.ajax({
							url : baseUrl + "/algorithm/getAlgorithmList.json",
							data : {algorithm_id : null},
							type : "POST",
							success(res){
								console.log("=======getAlgorithmList=======", res);
								$("#loader").hide();
								if(res.result.code == "200"){
									that.render.drawAlgorithmList(res.result.data);
								} else if (res.result.code == "2001") {
									alert(res.result.data);
									location.href = baseUrl + 'login';
								} else {
									alert(res.result.data);
								}						
								
							},
							error(err) {
								$("#loader").hide();
								console.log("ERROR!!", err);
							}
						});
						return deffered;								
					},				
					
					getAlgorithmList(){
						const that = videoBBoxQuick;
						$("#loader").show();
						const deffered = $.ajax({
							url : baseUrl + "/algorithm/getAlgorithmList.json",
							data : {algorithm_id : null},
							type : "POST",
							success(res){
								console.log("=======getAlgorithmList=======", res);
								$("#loader").hide();
								if(res.result.code == "200"){
									that.render.drawAlgorithmList(res.result.data);
								} else if (res.result.code == "2001") {
									alert(res.result.data);
									location.href = baseUrl + 'login';
								} else {
									alert(res.result.data);
								}						
								
							},
							error(err) {
								$("#loader").hide();
								console.log("ERROR!!", err);
							}
						});
						return deffered;								
					},
					
					getAlgorithmById(data, num){
						const that = videoBBoxQuick;
						$("#loader").show();
						const deffered = $.ajax({
							url : baseUrl + "/algorithm/getAlgorithmById.json",
							data : {algorithm_id : data},
							type : "POST",
							success(res){
								console.log("=======getAlgorithmById=======", res);
								$("#loader").hide();
								if(res.result.code == "200"){
									if(num == "0") {
										that.render.setTrainingConfig(res.result.data);					
									} else if (num == "1") {
										that.render.setInferenceConfig(res.result.data);
									}
								} else if (res.result.code == "2001") {
									alert(res.result.data);
									location.href = baseUrl + 'login';
								} else {
									alert(res.result.data);
								}		

							},
							error(err) {
								$("#loader").hide();
								console.log("ERROR!!", err);
							}
						});
						return deffered;					
					},
					
					getTaskById(id){
						const that = videoBBoxQuick;
						$("#loader").show();
						const deffered = $.ajax({
							url : baseUrl + "/task/getTaskById.json",
							data : {id : id},
							type : "POST",
							success(res){
								console.log("=======getTaskById=======", res);
								$("#loader").hide();
								if(res.result.code == "200"){
									that.computed.getAlgorithmById(res.result.data.algorithm_id, "1");
									that.computed.getCheckpointList(id, "1");
								} else if (res.result.code == "2001") {
									alert(res.result.data);
									location.href = baseUrl + 'login';
								} else {
									alert(res.result.data);
								}		
							},
							error(err) {
								$("#loader").hide();
								console.log("ERROR!!", err);
							}
						});
						return deffered;				
					},
					
					getProjectList(data, num){
						const that = videoBBoxQuick;
						let task_list_data = data;
						$("#loader").show();
						const deffered = $.ajax({
							url : baseUrl + "/project/getProjectList.json",
							data : null,
							type : "POST",
							success(res){
								console.log("=======getProjectList=======", res);
								$("#loader").hide();
								if(res.result.code == "200"){
									if(num == "0"){
										that.render.drawInheritTaskList(task_list_data, res.result.data);
										that.render.drawProjectList(res.result.data);
									} else if (num == "1"){
										that.render.drawTaskList(task_list_data, res.result.data);
									}
								} else if (res.result.code == "2001") {
									alert(res.result.data);
									location.href = baseUrl + 'login';
								} else {
									alert(res.result.data);
								}								
								

							},
							error(err) {
								$("#loader").hide();
								console.log("ERROR!!", err);
							}
						});
						return deffered;				
					},
					
					getCheckpointList(id, num){
						const that = videoBBoxQuick;
						$("#loader").show();
						const deffered = $.ajax({
							url : baseUrl + "/task/getCheckPointList.json",
							data : { id : id },
							type : "POST",
							success(res){
								console.log("=======getCheckPointList=======", res);
								$("#loader").hide();
								if(res.result.code == "200"){
									if(num == "0"){
										that.render.drawInheritCheckpointList(res.result.data);
									} else if(num == "1"){
										that.render.drawInferenceCheckpointList(res.result.data);
									}
								} else if (res.result.code == "2001") {
									alert(res.result.data);
									location.href = baseUrl + 'login';
								} else {
									alert(res.result.data);
								}								

								
							},
							error(err) {
								$("#loader").hide();
								console.log("ERROR!!", err);
							}
						});
						return deffered;				
					},
					
					// quick training 에서 checkpoint 선택 시 해당 task에 적용된 알고리즘 반영
					getSelectedTaskById(id){
						const that = videoBBoxQuick;
						$("#loader").show();
						const deffered = $.ajax({
							url : baseUrl + "/task/getTaskById.json",
							data : {id : id},
							type : "POST",
							success(res){
								console.log("=======getTaskById=======", res);
								$("#loader").hide();
								if(res.result.code == "200"){
									that.bind.selectCheckpointAlgorithm(res.result.data.algorithm_id);
									that.computed.getAlgorithmById(res.result.data.algorithm_id, "0", null);
								} else if (res.result.code == "2001") {
									alert(res.result.data);
									location.href = baseUrl + 'login';
								} else {
									alert(res.result.data);
								}								
							},
							error(err) {
								$("#loader").hide();
								console.log("ERROR!!", err);
							}
						});
						return deffered;					
						
					},		
					
					getProjectData(){
						const that = videoBBoxQuick;
						
						let title = $("#videoBBox .add_project input[name='title']").val();
						let contents = $("#videoBBox .add_project textarea[name='contents']").val();

						if(title == ""){
						 	alert("제목을 입력해주세요");
						 	$("#videoBBox input[name='title']").focus();
						 	return;
						}
						
						if(contents == ""){
						 	alert("내용을 입력해주세요");
						 	$("#videoBBox textarea[name='contents']").focus();
						 	return;
						} 
						

						$("#loader").show();
						console.log("title, contents : ", title, contents);
						that.computed.insertProject(title, contents);				
					},			
					
					insertProject(t, c){
						const that = videoBBoxQuick;
						
						let ajaxData = {
								title : t,
								contents : c
						}
						
						const deffered = $.ajax({
							url : baseUrl + "/project/insertProject.json",
							data : ajaxData,
							type : "POST",
							success(res){
								$("#loader").hide();
								console.log("=======insertProject=======", res);
								
								if(res.result.code == "200"){
//			 						that.drawTaskList(task_list_data, res.result.data);
									that.computed.getTaskList(res.result.data,"0");
									$("#videoBBox .quick_training .add_project").removeClass("active");
								} else if (res.result.code == "2001") {
									alert(res.result.data);
									location.href = baseUrl + 'login';
								} else {
									alert(res.result.data);
								}								

							},
							error(err) {
								$("#loader").hide();
								console.log("ERROR!!", err);
							}
						});
						return deffered;						
					},
					
					createJsonQuickTrain(){
						const that = videoBBoxQuick;
						let annotation_title = $("#videoBBox input[name='annotation_name']");
						let task_title = $("#videoBBox input[name='task_name']");
						let task_contents = $("#videoBBox input[name='task_contents']");
						let training_arr = {};
						let project_id = $("#videoBBox select[name='project_result'] option:selected").attr("data-id");
		 				let algorithm_id = $("#videoBBox select[name='algorithm_result'] option:selected").attr("data-id");
		 				let base_task_id = $("#videoBBox select[name='task_result'] option:selected").attr("data-id");
		 				let selected_checkpoint_name = null;
		 				// config변수
		 				let train_string = $("#videoBBox .training_config .config_wrap").children(".light").children("input[type='text']");
		 				let train_number = $("#videoBBox .training_config .config_wrap").children(".light").children("input[type='number']");
		 				let train_chk = $("#videoBBox .training_config .config_wrap").children(".check").children(".check_box_wrap").children(".check_box").children(".first");
		 				console.log("train_chk::", train_chk);
		 				console.log("train_string::", train_string);
		 				console.log("train_number::", train_number);
		 	 			let train_arr = {};
		 	 			
		 				/* let selected_checkpoint_name = $("#videoBBox .radioBtn.selected").parent().parent("tr").children(".checkPoint_name"); */
		 			// 해당 알고리즘 입력, config에 삽입하는 데이터
		 				for(var i=0; i < train_string.length; i++){
		 					if(train_string[i].value != ""){
		 						train_arr[train_string[i].name] = train_string[i].value;
		 					} else {
		 						alert("config에 값을 입력해주세요.");
		 						train_string[i].focus();
		 						return;
		 					}
		 				}; 
		 				
		 				for(var i=0; i < train_number.length; i++){
		 					if(train_number[i].value != ""){
		 						train_arr[train_number[i].name] = train_number[i].value * 1;
		 						console.log("train_number[i].value * 1:::", train_number[i].value * 1);
		 						console.log("typeof train_number[i].value * 1 :::", typeof(train_number[i].value * 1));
		 					} else {
		 						alert("config에 값을 입력해주세요.");
		 						train_number[i].focus();
		 						return;
		 					}
		 				};			
		 				
		 				for(let j=0; j < train_chk.length; j++){
		 				    if(train_chk[j].classList.contains('selected') == true){
		 				    	train_arr[train_chk[j].attributes.name.value] = true;
		 				    } else {
		 				    	train_arr[train_chk[j].attributes.name.value] = false;
		 				    }
		 				};
		 				
		 				let result_string = JSON.stringify(train_arr); 
		 				console.log("result_string::"+result_string);
		 				
						if(annotation_title.val() == null || annotation_title.val() == "") {
							alert("Annotation의 이름을 입력해주세요");
							return;
						}
						if(task_title.val() == null || task_title.val() == ""){
							alert("Task의 이름을 입력해주세요");
							return;
						}
						if(task_contents.val() == null || task_contents.val() == ""){
							alert("Task의 내용을 입력해주세요");
							return;
						}
		 				if(project_id == null || project_id == "" || project_id == "undefined"){
		 					alert("Task를 생성할 Project 폴더를 선택해주세요.");
		 					return;
		 				}
		 				if(algorithm_id == null || algorithm_id == "" || algorithm_id == "undefined"){
		 					alert("알고리즘을 선택해주세요.");
		 					return;
		 				}
		 				if(base_task_id != undefined || base_task_id != null) {
		 					console.log("1");
		 					// inheritstance에 checkpoint 선택했는데 checkpoint 선택 안했으면 선택해라는 메시지띄우기
		 					selected_checkpoint_name = $("#videoBBox .checkpoint_list .radioBtn.selected").parent().parent("tr").children(".checkPoint_name").text();
		 					if(selected_checkpoint_name == null || selected_checkpoint_name == "" || selected_checkpoint_name == undefined) {
		 						alert("CheckPoint를 선택해주세요.");
		 						return ;
		 					}
		 				} else if(base_task_id == null || base_task_id == undefined || base_task_id == "") {
		 				// inheritstance가 undefined면 ajaxData null로 전달
		 				console.log("2");
		 					base_task_id = null;
		 					selected_checkpoint_name = null;
		 				}
						
						training_arr["annotation_title"] = annotation_title.val();
						training_arr["task_title"] = task_title.val();
						training_arr["task_contents"] = task_contents.val();
						training_arr["dataset_id"] = videoBBox.data.videoObj.datasetId;
		 				training_arr["project_id"] = project_id;
		 				training_arr["algorithm_id"] = algorithm_id;
		 				training_arr["config"] = result_string;
		 				training_arr["base_task_id"] = base_task_id;
		 				training_arr["selected_checkpoint_name"] = selected_checkpoint_name;
						
						var quick_training_data = JSON.stringify(training_arr);
						console.log("quick_training_data : ", quick_training_data);
//		 				$("#videoBBox #quick_training").removeClass("active");		// training confirm 에서 확인 시 200일 때 닫기 
//		 				annotation_title.val("");										// training confirm 에서 확인 시 200일 때 초기화 
//		 				task_title.val("");												// training confirm 에서 확인 시 200일 때 초기화
						that.computed.ajaxQuickTrain(training_arr, quick_training_data);
					},
					
					createJsonQuickInference(){
						const that = videoBBoxQuick;
						
						let select_task_btn = $("#videoBBox #quick_inference .radioBtn");
						let selected_task = $("#videoBBox #quick_inference .radioBtn.selected").parent().parent("tr").children(".task_name");
						let csv_title = $("#videoBBox input[name='csv_title']").val();
						let check_box = $("#videoBBox #quick_inference .checkBox");
					    let inf_string = $("#videoBBox #quick_inference .config_wrap").children(".light").children("input[type='text']");
					    let inf_number = $("#videoBBox #quick_inference .config_wrap").children(".light").children("input[type='number']");
					    let inf_chk = $("#videoBBox #quick_inference .config_wrap").children(".check").children(".check_box_wrap").children(".check_box").children(".first");
					        console.log("inf_chk::", inf_chk);
					        console.log("inf_string::", inf_string);
					        console.log("inf_number::", inf_number);
					    let config_arr = {};
					    let result = [];
					    let selected_checkpoint_name = null;
					    
					    // 해당 inference parameters 입력
					    for(let i=0; i < inf_string.length; i++){
					        if(inf_string[i].value != ""){
					            config_arr[inf_string[i].name] = inf_string[i].value;
					        } else {
					            alert("값을 입력해주세요");
					            inf_string[i].focus();
					            return;
					        }
					    };
					    
					    for(let i=0; i < inf_number.length; i++){
					        if(inf_number[i].value != ""){
					            config_arr[inf_number[i].name] = inf_number[i].value * 1;
					            console.log("inf_number[i].value * 1:::", inf_number[i].value * 1);
					            console.log("typeof inf_number[i].value * 1 :::", typeof(inf_number[i].value * 1));
					        } else {
					            alert("값을 입력해주세요");
					            inf_number[i].focus();
					            return;
					        }
					    };			
					    
					    for(let j=0; j < inf_chk.length; j++){
					        if(inf_chk[j].classList.contains('selected') == true){
					            config_arr[inf_chk[j].attributes.name.value] = true;
					        } else {
					            config_arr[inf_chk[j].attributes.name.value] = false;
					        }
					    };

					    
					    let config_string = JSON.stringify(config_arr);				////// quickInference 파라미터로 넘겨야할 값 
					    console.log("config_string;::::", config_string);				

						let inference_arr = {};
						if(select_task_btn.hasClass("selected")){
							selected_task_id = selected_task[0].attributes["data-id"].value;
							quick_project_id = selected_task[0].attributes["data-projectId"].value;
						} else {
							alert("Task를 선택해주세요");
							return;
						};
						
						if(csv_title == "" || csv_title == "undefined" || csv_title == null){
							alert("CSV output 파일명을 입력해주세요");
							return;
						}
						
						selected_checkpoint_name = $("#videoBBox .inference_checkpoint .radioBtn.selected").parent().next().text();
						if(selected_checkpoint_name == null || selected_checkpoint_name == "" || selected_checkpoint_name == undefined) {
							alert("CheckPoint를 선택해주세요.");
							return ;
						}
						
						inference_arr["selected_task_id"] = selected_task_id;
						inference_arr["dataset_id"] = videoBBox.data.videoObj.datasetId;
						inference_arr["csv_title"] = csv_title;
						inference_arr["config"] = config_string;
						inference_arr["selected_checkpoint_name"] = selected_checkpoint_name;
						
						var quick_inference_data = JSON.stringify(inference_arr);
						console.log("selected_task_id: ", selected_task_id);
						console.log("current dataset_id : ", dataset_id);
						console.log("quick_project_id dataset_id : ", quick_project_id);
						console.log("quick_inference_data : ", quick_inference_data);
						that.computed.ajaxQuickInference(inference_arr, quick_project_id, quick_inference_data);
					},
					
					ajaxQuickTrain(arr, data){
						const that = videoBBoxQuick;
						//let ajaxData = data;
						let annotation_title = $("#videoBBox input[name='annotation_name']");
						let task_title = $("#videoBBox input[name='task_name']");
						let ajaxData = {
		 						annotation_title : arr.annotation_title,
		 						task_title : arr.task_title,
		 						contents : arr.task_contents,
		 						dataset_id : videoBBox.data.videoObj.datasetId * 1,
								project_id : arr.project_id,
		 						algorithm_id : arr.algorithm_id,
		 						config : arr.config,
		 						base_task_id : arr.base_task_id,
		 						check_point_name : arr.selected_checkpoint_name
		 				};

						console.log("ajaxData for Q-training:: ", ajaxData, arr);
						let msg = "Annotation : "+arr.annotation_title+"\n"+"Trainer : "+arr.task_title+"\n\n"+"입력하신 정보로 training을 시작합니다. 계속하시겠습니까?";
						if(confirm(msg)){
							// ajax 호출 
							$("#loader").show();
							const deffered = $.ajax({
								url : baseUrl + "task/quickTraining.json",
								data : ajaxData,
								type : "POST",
								success(res){
									$("#loader").hide();
									if(res.result.code == "200"){
										console.log("=======QuickTrainer=======", res);
										alert(res.result.data);
										$("#videoBBox #quick_training").removeClass("active");
									} else if (res.result.code == "2001") {
										alert(res.result.data);
										location.href = baseUrl + 'login';
									} else {
										alert(res.result.data);
									}									
								},
								error(err) {
									$("#loader").hide();
									console.log("ERROR!!", err);
								}
							});
							return deffered;						
						} else {
							alert("취소되었습니다.");
						}
					
					},
					
					ajaxQuickInference(arr, quick_project_id, data){
						const that = videoBBoxQuick;
						let ajaxData = {
							task_id : arr.selected_task_id,
							dataset_id : arr.dataset_id,
							csv_title : arr.csv_title,
							config : arr.config,
							check_point_name : arr.selected_checkpoint_name
						};
						console.log("ajaxData for Q-inference:: ", ajaxData);				
						let msg = "선택하신 task 데이터로 inference를 시작합니다. 계속하시겠습니까?";
						
						if(confirm(msg)){
							// ajax 호출				
							$("#loader").show();
							const deffered = $.ajax({
								url : baseUrl + "task/quickInference.json",
								data : ajaxData,
								type : "POST",
								success(res){
									$("#loader").hide();
									console.log("=======QuickInference=======", res);
									if(res.result.code == 200) {
										alert(res.result.data);
										$("#videoBBox #quick_inference").removeClass("active");
										// 세션에 task_id, project_id 저장 후 inference list 확인을 위해 trainer 페이지로 이동 
										if(window.sessionStorage){
											sessionStorage.setItem("selected_task_id", arr.selected_task_id);
											sessionStorage.setItem("selected_pId", quick_project_id);
											let position = sessionStorage.getItem("selected_task_id");
											let position2 = sessionStorage.getItem("selected_pId");
											console.log("position: ", position, position2);
										}
										videoBBox.init(videoBBox.data.videoObj["datasetId"]);
//	 									that.root.computed.initEnrichment();
									} else if (res.result.code == "2001"){
										alert(res.result.data);
										location.href = baseUrl + 'login';
									} else if (res.result.code == 3404) {
										alert("이미 중복된 이름의 CSV 파일이 존재합니다.\n다른 CSV파일명으로 Inference해주시길 바랍니다.");
									}
									else {
										alert(res.result.data);
									}
								},
								error(err) {
									$("#loader").hide();
									console.log("ERROR!!", err);
								}
							});
							return deffered;						
						} else {
							alert("취소되었습니다.");
						}

						

					},	
					
				},
				render : {
					addEmptyData(elem, data1, data2){
						const that = videoBBoxQuick;
						elem.append("<div class='empty_wrap'><div class='no_image'></div><div class='eng_text'>"+data1+"</div><div class='kor_text'>"+data2+"</div></div>")
					},
					
					removeEmptyData(elem){
						const that = videoBBoxQuick;
						elem.find(".empty_wrap").remove();
					},
					
					drawDefaultQuickInfo(datasetData){
						const that = videoBBoxQuick;
						
						let dataset_data = datasetData;
						let annotation_title_input = $("#videoBBox input[name='annotation_name']");
						let task_title_input = $("#videoBBox input[name='task_name']");
						let task_contents_input = $("#videoBBox input[name='task_contents']");
					
						console.log("dataset_data : ", dataset_data);
						console.log("taskName3 : " + that.data.taskName);
						console.log("annoName3 : " + that.data.annotationName);
						
						for(let i = 0; i < dataset_data.length; i++){
							if(dataset_data[i].dataset_id === videoBBox.data.videoObj.datasetId){
								$(annotation_title_input).val(that.data.annotationName);			// jh.sa default name  
								$(task_title_input).val(that.data.taskName); 
								$(task_contents_input).val("Quick training model");
							} else {
								continue;
							}
						};
					},					
					
					drawDefaultCsvInfo(datasetData){
						const that = videoBBoxQuick;
					
						let dataset_data = datasetData;
						let csv_title = $("#videoBBox input[name='csv_title']");
					
						console.log("dataset_data : ", dataset_data);
						for(let i = 0; i < dataset_data.length; i++){
							if(dataset_data[i].dataset_id === videoBBox.data.videoObj.datasetId){
								csv_title.val(that.data.inferenceName);			// jh.sa default name  
							} else {
								continue;
							}
						};				
					},					
					
					drawAlgorithmList(data){
						const that = videoBBoxQuick;
						
						console.log("algorithmListData : ", data);
						let selectTarget = $("#videoBBox .quick_training .algorithm_result");
						$(selectTarget).html("");
						
						let html = "<option value=''>Please select the algorithm</option>"; 
						for(let i=0, len = data.length; i<len; i++){
							if(data[i].label_type == "VIDEO_BBOX"){
								html += "<option data-id='"+data[i]["algorithm_id"]+"' value='"+data[i]["title"]+"'>";
								html += data[i]["title"];
								html += "</option>";							
							}
						}
						$(selectTarget).append(html);
						that.render.selectAlgorithm(data);
					},					
					
					// quick training을 할 task를 생성할 프로젝트 
					drawProjectList(data){
						const that = videoBBoxQuick;
						
						console.log("projectListData : ", data);
						let selectTarget = $("#videoBBox .quick_training .project_result");
						$(selectTarget).html("");
						
						let html = "<option value=''>Please select the project</option>"; 
						for(let i=0, len = data.length; i<len; i++){
							html += "<option data-id='"+data[i]["id"]+"' value='"+data[i]["title"]+"'>";
							html += data[i]["title"];
							html += "</option>";
				
						}
						$(selectTarget).append(html);
						
						// 기본값으로 첫번째 프로젝트 지정 
						let options = $("#videoBBox .project_result").children("option");
						options[1].selected = true;
						
					},
					
					// inheritance 대상이 될 task list를 select box으로 보여줌 
					drawInheritTaskList(task_list_data, project_data){
						const that = videoBBoxQuick;
						console.log("inheritTaskListData : ", task_list_data);
						console.log("inheritProjectData : ", project_data);
						let selectTarget = $("#videoBBox .quick_training .task_result");
						$(selectTarget).html("");
						
						let html = "<option value=''>Please select the task</option>"; 
						for(let i=0; i < task_list_data.length; i++){
							for(let j=0; j < project_data.length; j++){
								if(task_list_data[i].label_type == "VIDEO_BBOX"){
									if(task_list_data[i].project_id === project_data[j].id){
										html += "<option data-id='"+task_list_data[i]["id"]+"' data-projectId='"+project_data[j].id+"' value='"+task_list_data[i]["title"]+"'>";
										html +=  project_data[j].title+ " / " + task_list_data[i]["title"];
										html += "</option>";							
									} else {
										continue
									}								
								}
							}
						}
						$(selectTarget).append(html);	
						that.render.selectInheritTask(task_list_data);
					},
					
					// inheritance 선택 시 checkpoint list 그리기 
					drawInheritCheckpointList(data){
						const that = videoBBoxQuick;
						
						if(data != null && data.length > 0){
							let checkPoints = data.reverse();
							let target = $("#videoBBox #quick_training .checkpoint_table tbody");
							
							let html = "";
							$(target).html("");
							$("#videoBBox .empty_wrap").remove();
							console.log("checkPoints : ", checkPoints);
							console.log("target html : ", target);
							
							if(checkPoints.includes(".DS_Store")){
								let index = checkPoints.indexOf(".DS_Store");
								if(index>-1){
									checkPoints.splice(index, 1);
								}
							}
							console.log("checkPoints : ", checkPoints);
							
							for(let i = 0; i < checkPoints.length; i++){
								if(checkPoints[i] != ".DS_Store"){
									html += "<tr>";
									html += "<td class='checkPoint_check'>";
									if(i == 0){
										html += "<div class='radioBtn selected'></div>";
									} else {
										html += "<div class='radioBtn'></div>";								
									}
									html += "</td>";
									html += "<td class='checkPoint_name'>"+checkPoints[i]+"</td>";
									html += "</tr>";					
								}
							}
							
							$(target).prepend(html);
							that.render.removeEmptyData($("#videoBBox #quick_training .checkpoint_list .list_wrap"));
							
							//jh.sa
							let checkpoint_view = $("#videoBBox .checkpoint_view");
							let selected_cp_name = $("#videoBBox .checkpoint_list .radioBtn.selected").parent().next().text();
							console.log("chkpoint_name: ", selected_cp_name);
							checkpoint_view.addClass("active");
							checkpoint_view.html("Selected Model :" + selected_cp_name);
							let selected_id = $("#videoBBox .task_result option:selected").data("id");
							that.computed.getSelectedTaskById(selected_id);
							$("#videoBBox .algorithm_result").attr("disabled","disabled");
							
							that.computed.checkPointListener();					
						} else if(data != null && data.length == 0) {
//		 					that.root.bind.removeEmptyData($("#videoBBox #quick_training .checkpoint_list .list_wrap"));					
							if($("#videoBBox #quick_training .checkpoint_list .empty_wrap").length == 0){
								that.render.addEmptyData($("#videoBBox #quick_training .checkpoint_list .list_wrap"), "No Model", "please train your task first");
							}
						} else {
//		 					that.root.bind.removeEmptyData($("#videoBBox #quick_training .checkpoint_list .list_wrap"));					
							if($("#videoBBox #quick_training .checkpoint_list .empty_wrap").length == 0){
								that.render.addEmptyData($("#videoBBox #quick_training .checkpoint_list .list_wrap"), "No Model", "please train your task first");				
							}
						}

					},
					
					// quick inference checkpoint
					drawInferenceCheckpointList(data){
						const that = videoBBoxQuick;
						
						if(data != null && data.length > 0){
							let checkPoints = data.reverse();
							let target = $("#videoBBox #quick_inference .inference_checkpoint .checkpoint_table tbody");
							
							let html = "";
							
							$(target).html("");
							$("#videoBBox .empty_wrap").remove();
							console.log("checkPoints : ", checkPoints);
							console.log("target html : ", target);
							
							if(checkPoints.includes(".DS_Store")){
								let index = checkPoints.indexOf(".DS_Store");
								if(index>-1){
									checkPoints.splice(index, 1);
								}
							}
							console.log("checkPoints : ", checkPoints);
							
							for(let i = 0; i < checkPoints.length; i++){
								if(checkPoints[i] != ".DS_Store"){
									html += "<tr>";
									html += "<td class='checkPoint_check'>";
									if(i == 0){
										html += "<div class='radioBtn selected'></div>";
									} else {
										html += "<div class='radioBtn'></div>";								
									}
									html += "</td>";
									html += "<td class='checkPoint_name'>"+checkPoints[i]+"</td>";
									html += "</tr>";					
								}
							}
							
							$(target).prepend(html);
							that.render.removeEmptyData($("#videoBBox #quick_inference .inference_checkpoint .list_wrap"));
							that.bind.inferenceCheckPointListener();					
						} else if(data != null && data.length == 0) {
//		 					that.root.bind.removeEmptyData($("#videoBBox #quick_inference .inference_checkpoint .list_wrap"));					
							if($("#videoBBox #quick_inference .inference_checkpoint .empty_wrap").length == 0){
								that.render.addEmptyData($("#videoBBox #quick_inference .inference_checkpoint .list_wrap"), "No Model", "please train your task first");
							}
						} else {
//		 					that.root.bind.removeEmptyData($("#videoBBox #quick_inference .inference_checkpoint .list_wrap"));					
							if($("#videoBBox #quick_inference .inference_checkpoint .empty_wrap").length == 0){
								that.render.addEmptyData($("#videoBBox #quick_inference .inference_checkpoint .list_wrap"), "No Model", "please train your task first");
							}
						}
					},			
					
					// quick inference 팝업의 task list 그리기 
					drawTaskList(task_list_data, project_data){
						const that = videoBBoxQuick;
						

						console.log("taskDataa:: " , task_list_data);
						console.log("project_data :: ", project_data);
						let target = $("#videoBBox .quick_task_list .list_wrap .table_body .task_table tbody");
						let html = "";
						
						if(task_list_data == null || task_list_data.length == 0){
							html += '<tr>';
							html += '    <td></td>';
							html += '    <td colspan="">';
							html += '         <div>There is no task data</div>';
							html += '    </td>';
							html += '</tr>';
						}
						
						for(let i = 0; i < task_list_data.length; i++){
							html += "<tr>";
							html += "<td class='task_check'>";
							html += "<div class='radioBtn'></div>";
							html += "</td>";
							for(let j = 0; j < project_data.length; j++){
								if(task_list_data[i].label_type == "VIDEO_BBOX"){
									if(task_list_data[i].project_id === project_data[j].id){
										html += "<td class='task_name' data-id='"+task_list_data[i].id+"' data-projectId='"+project_data[j].id+"'>"+project_data[j].title+" / "+task_list_data[i].title+"</td>";							
									} else {
										continue;
									}								
								}
							}
							html += "</tr>";	
						}
						
						$(target).append(html);
						that.bind.taskListener();
						
					},
					
					// quick training 창에서 algorithm 선택 시 config 셋팅 
					setTrainingConfig(data){
						const that = videoBBoxQuick;
						
						let configData;
						let description;
						let target = $("#videoBBox #training_config .config_wrap");
						let description_target = $("#videoBBox #training_config .description_wrap");
						$("#videoBBox #training_config .description_wrap").addClass("border");	
						if(data == null) {
							$(target).html("");
							$(description_target).html("");
							
							description = "<div class='description'>The algorithm does not exist.</div>";
							$(description_target).append(description);						
						} else {
							configData = JSON.parse(data.train_param);		
							
							$(target).html("");
							$(description_target).html("");
							
							description = "<div class='description'>"+data.description+"</div>";
							$(description_target).append(description);		
							
							for(let i=0; i < configData.length; i++){
								console.log(configData[i]);
								let html = "";
								if(configData[i].type == "string") {
									html += '<div class="input_wrap flex light">';
									html += '<label>'+configData[i].param+'<span class="tooltip_wrap"></span></label>';
									html += '<span class="tooltip">'+configData[i].helper+'</span>';
									html += '<input type="text" name="'+configData[i].param+'" value="'+configData[i].defaultvalue+'"/>';
									html += '</div>';
									$(target).append(html);
								} else if(configData[i].type == "number"){
									html += '<div class="input_wrap flex light">';
									html += '<label>'+configData[i].param+'<span class="tooltip_wrap"></span></label>';
									html += '<span class="tooltip">'+configData[i].helper+'</span>';
									html += '<input type="number" name="'+configData[i].param+'" value="'+configData[i].defaultvalue+'" onKeyPress="return checkNum(event);"/>';
									html += '</div>';	
									$(target).append(html);
								} else if (configData[i].type = "boolean"){
									if(configData[i].defaultvalue === true) {
										html += '<div class="input_wrap flex check">';
										html += '<label>'+configData[i].param+'<span class="tooltip_wrap"></span></label>';
										html += '<span class="tooltip">'+configData[i].helper+'</span>';
										html += '<div class="check_box_wrap">';
										html += '<div class="check_box">';					
										html += '<div class="checkBox first selected" name="'+configData[i].param+'"></div>';
										html += '</div>';
										html += '</div>';
										html += '</div>';							
									} else {
										html += '<div class="input_wrap flex check">';
										html += '<label>'+configData[i].param+'<span class="tooltip_wrap"></span></label>';
										html += '<span class="tooltip">'+configData[i].helper+'</span>';
										html += '<div class="check_box_wrap">';
										html += '<div class="check_box">';					
										html += '<div class="checkBox first" name="'+configData[i].param+'"></div>';
										html += '</div>';
										html += '</div>';
										html += '</div>';
									}

									
									$(target).append(html);
								};				
							};
							
							// helper 툴팁
							let tooltip_wrap = $("#videoBBox #training_config .tooltip_wrap");
//								console.log("tooltip_wrap:: ", tooltip_wrap);
							tooltip_wrap.off("mouseover").on("mouseover", function() {
								let tooltip = $(this).parent("label").next(".tooltip");
								tooltip.toggleClass("on");
							});
							tooltip_wrap.off("mouseout").on("mouseout", function() {
								let tooltip = $(this).parent("label").next(".tooltip");
								tooltip.removeClass("on");						
							})
							
							// checkbox 활성화
							let check_first = $("#videoBBox #training_config .checkBox");

							check_first.off("click").on("click", function() {
								$(this).toggleClass("selected");
							});					
						}
						
					},
					
					// quick inference 에서 task 선택 시 config 셋팅 
					setInferenceConfig(data, taskId){
						const that = videoBBoxQuick;
						
						let task_id = taskId;
						let configData;
						let description;
						let algorithm_name;
						let target = $("#videoBBox #inference_config .config_wrap");
						let description_target = $("#videoBBox #inference_config .description_wrap");
						let algorithm_target = $("#videoBBox .inference_algorithm");
						console.log("setInference task_id : ", task_id);
						if(data == null) {
							$(target).html("");
							$(description_target).html("");
							$(algorithm_target).html("");
							
							description = "<div class='description'>The algorithm does not exist.</div>";
							$(description_target).append(description);	
						} else {
							configData = JSON.parse(data.inference_param);		
							
							$(target).html("");
							$(description_target).html("");
							$(algorithm_target).html("");
							
							description = "<div class='description'>"+data.description+"</div>";
							$(description_target).append(description);	
							algorithm_name = "Selected algorithm : " + data.title;
							$(algorithm_target).html(algorithm_name);
							
							for(let i=0; i < configData.length; i++){
								console.log(configData[i]);
								let html = "";
								if(configData[i].type == "string") {
									html += '<div class="input_wrap flex light">';
									html += '<label>'+configData[i].param+'<span class="tooltip_wrap"></span></label>';
									html += '<span class="tooltip">'+configData[i].helper+'</span>';
									html += '<input type="text" name="'+configData[i].param+'" value="'+configData[i].defaultvalue+'"/>';
									html += '</div>';
									$(target).append(html);
								} else if(configData[i].type == "number"){
									html += '<div class="input_wrap flex light">';
									html += '<label>'+configData[i].param+'<span class="tooltip_wrap"></span></label>';
									html += '<span class="tooltip">'+configData[i].helper+'</span>';
									html += '<input type="number" name="'+configData[i].param+'" value="'+configData[i].defaultvalue+'" onKeyPress="return checkNum(event);"/>';
									html += '</div>';	
									$(target).append(html);
								} else if (configData[i].type = "boolean"){
									if(configData[i].defaultvalue === true) {
										html += '<div class="input_wrap flex check">';
										html += '<label>'+configData[i].param+'<span class="tooltip_wrap"></span></label>';
										html += '<span class="tooltip">'+configData[i].helper+'</span>';
										html += '<div class="check_box_wrap">';
										html += '<div class="check_box">';					
										html += '<div class="checkBox first selected" name="'+configData[i].param+'"></div>';
										html += '</div>';
										html += '</div>';
										html += '</div>';							
									} else {
										html += '<div class="input_wrap flex check">';
										html += '<label>'+configData[i].param+'<span class="tooltip_wrap"></span></label>';
										html += '<span class="tooltip">'+configData[i].helper+'</span>';
										html += '<div class="check_box_wrap">';
										html += '<div class="check_box">';					
										html += '<div class="checkBox first" name="'+configData[i].param+'"></div>';
										html += '</div>';
										html += '</div>';
										html += '</div>';
									}

									
									$(target).append(html);
								};
							};
							
							// helper 툴팁
							let tooltip_wrap = $("#videoBBox #inference_config .tooltip_wrap");
//								console.log("tooltip_wrap:: ", tooltip_wrap);
							tooltip_wrap.off("mouseover").on("mouseover", function() {
								let tooltip = $(this).parent("label").next(".tooltip");
								tooltip.toggleClass("on");
							});
							tooltip_wrap.off("mouseout").on("mouseout", function() {
								let tooltip = $(this).parent("label").next(".tooltip");
								tooltip.removeClass("on");						
							})
							
							// checkbox 활성화
							let check_first = $("#videoBBox #inference_config .checkBox");

							check_first.off("click").on("click", function() {
								$(this).toggleClass("selected");
							});					
						}
							
						
						if($("#videoBBox #quick_inference .radioBtn.selected").length == 0){
							$(target).html("");
							$(description_target).html("Please select task data");
						};
						

						
					},			
					
					// quick training의 algorithm select box 
					selectAlgorithm(data){
						const that = videoBBoxQuick;
						
						// 초기화시 YOWO 기본값 적용 
						let options = $(".algorithm_result").children("option");
						let selected_option_id;
						for(var i=1; i < options.length; i++){
						    if(options[i].label == "YOWO"){
						    	options[i].selected = true;
						    	selected_option_id = options[i].attributes["data-id"].value
						    }
						}
						that.computed.getAlgorithmById(selected_option_id, "0", null);				// YOWO algorithm_id
						
						$("#videoBBox #quick_training .algorithm_result").on("change", function(){
							let selected_algorithm = $(this).val();
							
							for(let i=0; i < data.length; i++){
								if(selected_algorithm == data[i]["title"]){
									that.computed.getAlgorithmById(data[i]["algorithm_id"], "0", null);
									break;
								};
							};				
						});
					},
					
					// quick training 의 inheritance task select box 선택 시 호출 
					selectInheritTask(data){
						const that = videoBBoxQuick;
						
						$("#videoBBox #quick_training .task_result").on("change", function(){
							let selected_task = $(this).val();
							if(selected_task != ""){
								$("#videoBBox .empty_wrap").remove();
//		 						that.root.bind.removeEmptyData($("#videoBBox .checkpoint_list .list_wrap"));
								$("#videoBBox .checkpoint_list .list_wrap .checkpoint_table tbody").html("");
								if($("#videoBBox .quick_training .radioBtn.selected").length == 0){
									$("#videoBBox .checkpoint_view").removeClass("active");
									$("#videoBBox .algorithm_result").removeAttr("disabled");
								} else if ($("#videoBBox .quick_training .radioBtn.selected").length > 0){
									$("#videoBBox .quick_training .radioBtn.selected").removeClass("selected");			//추가 
								}

								for(let i=0; i < data.length; i++){
									if(selected_task == data[i]["title"]){
										that.computed.getCheckpointList(data[i]["id"], "0");
										that.render.drawTaskName(data[i]["title"]);
										break;
									};
								};						
							} else if(selected_task == "") {
								$("#videoBBox .checkpoint_view").removeClass("active");
								$("#videoBBox .algorithm_result").removeAttr("disabled");
								that.render.removeEmptyData($("#videoBBox .checkpoint_list .list_wrap"));
								that.render.addEmptyData($("#videoBBox .checkpoint_list .list_wrap"), "No Model", "please train your task first");				
								// 						that.root.bind.removeEmptyData($("#videoBBox .checkpoint_list .list_wrap"));
								$("#videoBBox .checkpoint_list .list_wrap .checkpoint_table tbody").html("");
								$("#videoBBox .checkpoint_list .selected_task_name").html("");
								$("#videoBBox #quick_training .checkpoint_list").removeClass("active");
								$("#videoBBox #quick_training .checkpoint_list_btn")[0].textContent = "+";					
								$("#videoBBox .quick_training .radioBtn.selected").removeClass("selected");
							}

						});
					},
					
					// quick training 의 inheritance task 선택 시 checkpoint list 상단에 선택한 task 이름 표시 
					drawTaskName(data){
						const that = videoBBoxQuick;
						
						let taskName_data = data;
						let target_title = $("#videoBBox .checkpoint_list .selected_task_name");
						let select_task_name = "( Selected Task : " + taskName_data + " )";
						$(target_title).html(select_task_name);
						console.log("taskName_data : ", taskName_data);

					},				
				},
			};				
		
	  </script>		
   </body>
</html>