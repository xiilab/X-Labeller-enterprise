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
      
<%--       <jsp:include page="/import"  flush="false" /> --%>
    
      <style>
      
		#imgBBox .canvas-container {
			margin: 0px auto;
/* 			height: 100% !important; */
		}      
      
      	#accordionSidebar a.nav-link span { width:168px; display:block; }
	    #accordionSidebar .collapse-inner { height:300px; overflow:scroll; }
	    #accordionSidebar .video_name { 
	    	padding-left:0;
	    }
	    
	   #imgBBox a.next_page,a.prev_page { cursor:pointer; }
	   #imgBBox .pagination input.page-link { height:30px; width:30px; padding:0 0 0 8px; }
       #imgBBox .tab_wrap { width:180px; }
       #imgBBox a.disabled { color:#e74a3b !important; pointer-events: none; } 
	   #imgBBox .labeller_container { 
/* 	    	overflow:scroll;  */
			overflow: hidden; 
	    	display:flex; 
	    	flex-wrap:nowrap;  
	    	margin-top: 20px; 
	    	border-left: 0; border-right: 0; 
	    	min-height: 840px; max-height: 840px;
	    }
      	
      	#imgBBox .tab-pane{
      		position:relative;  
/*       		width:1024px;  */
/* 			width: 1219px;  */
			width: 100%;
			min-height: 600px;
/*       		height:auto;  */
/* 			height: calc(100% - 217px); */
      		flex-shrink:0;
      		border: 1px solid #eee;
      		border-bottom: 0;
/*       		border-radius: 0.35rem; */
      	}
      	#imgBBox .header_wrap { margin-bottom: 42px; }
      	
      	#imgBBox .tab-pane.cate_search_wrap {
/*       		border:1px solid #eeeeee; */
/*       		border-radius : 10px; */
      	}
/*       	.cate_search_wrap { border:1px solid #eeeeee; } */
/*       	.cate_search_wrap .content_wp .content_header .content_title { cursor:pointer; } */
/*       	.cate_search_wrap .search_cate { width:50%; } */
      	
/*       	.cate_search_wrap .search_wp .search_wrap .search_cate_list { cursor:pointer; } */
/*       	.cate_search_wrap .search_wp .search_wrap .search_cate_list:hover { color:red; } */
/*       	.cate_search_wrap .search_wp .search_wrap { position:absolute; width:50%; max-height:500px; overflow:scroll; background-color:#f8f9fc; z-index:100;  } */
      	
      	#imgBBox .search_all_wp .search_all_wrap { position:absolute; /* width:50%; */ max-height:500px; overflow:scroll; background-color:#f8f9fc; z-index:100;  }
      	#imgBBox .search_all_wp .search_all_wrap .search_cate_list { cursor:pointer; }
      	#imgBBox .search_all_wp .search_all_wrap .search_cate_list:hover { color:red; }
      	
/*       	.cate_search_wrap .content_wp { overflow:scroll; } */
/*       	.cate_search_wrap .content_wp.active { height:auto; } */
/*       	.cate_search_wrap .content_wp .content .cate_2,.cate_3 { cursor:pointer; } */
/*       	.cate_search_wrap .content_wp .content .cate_2.active,.cate_3.active { font-weight:bold; } */
/*       	.cate_search_wrap .content_wp .content .cate_2:hover,.cate_3:hover { color:red; } */

/* 		.cate_search_wrap .content_wp .content .cate_2.active,.cate_3.active { font-weight:bold; background-color:#eeeeee !important; color:black !important; } */
/* 		.cate_search_wrap .content_wp .content .cate_2:hover,.cate_3:hover { color:red !important; } */
/* 		.cate_search_wrap .content_wp .content .cate_wrap_3 { background-color:#eeeeee; } */
      	
      	#imgBBox .label_wrap { 
       		position:relative;  
      		width:100%; 
      		height:auto; 
/*       		border: 1px solid #eeeeee;  */
/*       		margin-left:20px;  */
/*       		border-radius:0.35rem;  */
      		flex-shrink:0;
      	}
      	
      	/* jh.sa 210520 */
		#imgBBox .label_wrap .cate_wp .visibility { width: 20px; height: 20px; display: inline-block; position: relative; top: 0px; background: url('${pageContext.request.contextPath}/resources/images/labeller/ico-eye-on-light.png') center no-repeat; }
		#imgBBox .label_wrap .cate_wp .visibility.off,	
		#imgBBox .label_wrap .cate_wp .visibility:hover { opacity: 1; background: url('${pageContext.request.contextPath}/resources/images/labeller/ico-eye-off-light.png') center no-repeat; cursor: pointer; }
      	
       	#imgBBox .video_wrap .canvas { width:800px; height:400px; position:absolute !important; }  
/*        	.video_wrap .video { width:1024px;  height:auto; position:absolute !important; }   */
       	
/*       	.video_wrap .video .video_js { position:absolute; } */
/*       	.video_wrap .video .vjs-control-bar { display: flex; height:40px; bottom:-40px;} */
/*       	.video_wrap .video .vjs-big-play-button { display:none; } */
      	#imgBBox .video_wrap .prog_bar { border:1px solid #eeeeee; width:100%; height:40px; position:relative; }
      	#imgBBox .video_wrap .prog_bar > div { color:#020b44; }
		#imgBBox .video_wrap .prog_bar .btn_wrap { width:400px; margin-top:0; }
/*       	.video_wrap .prog_bar .btn { color:#020b44; border-radius:50%; } */
      	#imgBBox .video_wrap .prog_bar input.curr_frame { width:50px; height:15px; margin-right:0px; }
      	#imgBBox .video_wrap .prog_bar .save_btn_wrap { width:260px; }
      	
      	#imgBBox .label_wrap .btn_wrap { margin:0; padding-bottom: 1px; border-bottom: 1px solid #eee;}
/*       	.label_wrap .btn_wrap > div { width:100%; margin:0;  cursor:pointer; } */
      	@media (min-height:960px){
/*       		#imgBBox .label_wrap .category_wrap { max-height: 880px; }  */
			#imgBBox .label_wrap .category_wrap { max-height: 785px; } 
      	}
      	@media (min-height: 730px) and (max-height:959px){
/*       		#imgBBox .label_wrap .category_wrap { max-height: 665px; }  */
			#imgBBox .label_wrap .category_wrap { max-height: 570px; } 
      	}      	
      	@media (min-height: 500px) and (max-height:729px){
/*       		#imgBBox .label_wrap .category_wrap { max-height: 500px; }  */
			#imgBBox .label_wrap .category_wrap { max-height: 405px; } 
      	} 
      	@media (min-height: 1px) and (max-height:499px){
/*       		#imgBBox .label_wrap .category_wrap { max-height: 400px; }  */
			#imgBBox .label_wrap .category_wrap { max-height: 305px; } 
      	} 
/*       	#imgBBox .label_wrap .category_wrap { width:100%; height:auto; max-height: 690px; overflow-y: scroll; overflow-x: hidden; flex-wrap: wrap; padding: 0 18px; } */
      	#imgBBox .label_wrap .category_wrap { width:100%; height:auto; overflow-y: scroll; overflow-x: hidden; flex-wrap: wrap; padding: 0 18px; }
      	#imgBBox .label_wrap .category_wrap .cate_wp { width:190px; /* height:90px; */height:200px; padding: 5px; margin: 5px 10px; border:1px solid #eeeeee; text-align: center; }
      	#imgBBox .label_wrap .category_wrap .cate_wp .crop_wrap{ width:180px; height:105px; align-items:center; display:flex; justify-content:center; padding: 0.25rem; padding-top: 0.9rem; }
      	#imgBBox .label_wrap .category_wrap .cate_wp .crop_img {position:relative; /* width:180px; height:105px; */ }
      	#imgBBox .label_wrap .category_wrap .cate_wp.selected { border-width:2px !important; }
/*       	.label_wrap .category_wrap .cate_wp .delete { margin-left:10px; } */
      	#imgBBox .label_wrap .category_wrap .cate_wp .color {     
      		width: 20px;
		    height: 20px;
		    margin-left: 2px;
	    }
	    
      	#imgBBox .label_wrap .category_wrap .cate { /*width:5em;*/ /* width:60px; */ border:1px solid #eeeeee; text-align:center; text-align-last:center; }
/*       	.label_wrap .category_wrap .cate option { text-align:center; text-align-last:center; } */
      	
      	/*       	#edit h.lee */
      	#imgBBox .prev_data_wrap { border: 1px solid white; width: 35px; height: 598px;}
		/* 		#edit h.lee */
		#imgBBox .next_data_wrap { border: 1px solid white; width: 35px; height: 598px;}	
		#imgBBox .prev_data_wrap:hover { cursor: pointer; background-color: #eee; opacity: 0.3; }
		#imgBBox .next_data_wrap:hover { cursor: pointer; background-color: #eee; opacity: 0.3; }
		
      	#imgBBox .page_title_wrap { position: relative; top: 20px; left: 90px; display: inline; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; }
      	#imgBBox .page_title_wrap span:first-child { font-size: 13px; }
		#imgBBox .page_title_wrap span:nth-child(2) { color: #4c84ff; font-size: 14px;}
		#imgBBox .add { width: 90px; margin-right: 10px; position: relative; color: #fff; font-size: 11px; background-color: #4c84ff; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; }
		#imgBBox .add:hover { background-color: #3A71E9; }
		#imgBBox .delete { width: 55px; color: #343434; font-size: 11px; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; margin-left: 10px;  }
      	#imgBBox .label_title { color: #777; font-weight: 400; padding: 20px; }
      	#imgBBox .cate_wp input { width: 165px; padding: 10px; margin-top: 3px; }
      	#imgBBox .save_btn_wrap { justify-content: center; position: absolute; bottom: 0; padding: 26px 0;  background-color: #fff; border-top: 1px solid #eee; }
      	#imgBBox .save_btn_wrap .save { width: 240px; line-height: 36px; margin: 0 auto; border-radius: 23px; box-shadow: 0 4px 8px 0 #b4d7ff; font-size: 13px; font-weight: 300; color: #fff; cursor: pointer; background-color: #4c84ff;}
		#imgBBox .save_btn_wrap .save:hover { background-color: #3A71E9; }
/* 		#imgBBox .img_list_wrap { width: calc(100% - 699px); position: absolute; bottom: 92px; border: 1px solid #e0e0e0; border-left: 0; border-right: 0; padding: 15px 0; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; background-color: #f8f8f8; }       */
		#imgBBox .img_list_wrap { width: 100%; position: relative; border: 1px solid #e0e0e0; border-left: 0; border-right: 0; padding: 15px 0; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; background-color: #f8f8f8; }      
/*       	#imgBBox .data_list_wrap { height: 682px !important; max-height: 682px !important; position: absolute; top: calc(100% - 785px); } */
		@media (min-height: 905px){
			#imgBBox .data_list_wrap { height: 448px; max-height: 448px; top: calc(100% - 550px); left: -1px; font-family: 'Open_Sans', sans-serif; font-size: 11px; font-weight: 300; color: #343434; z-index: 98; }  			
		}
		@media (max-height: 904px){
			#imgBBox .data_list_wrap { height: 448px; max-height: 448px; top: calc(100% - 550px); left: -1px; font-family: 'Open_Sans', sans-serif; font-size: 11px; font-weight: 300; color: #343434; z-index: 98; }  			
		}		
		
		#imgBBox .position_wrap { width: 100px; margin-right: 20px; }
		#imgBBox .position_wrap .position-value { width: 40px; padding: 5px; }
		#imgBBox .position_wrap .total_count { display: inline-block; }
		
		#imgBBox .video_wrap .prev_btn {
			position: absolute;
			background: url(images/btn_image_arrow_left_normal.png) left;
			width: 16px;
			height: 25px;
 			top: calc(50% - 25px); 
/* 			top: 300px; */
			left: 5px;
			z-index: 97;
		}
		
		#imgBBox .video_wrap .next_btn {
			position: absolute;
			background: url(images/btn_image_arrow_right_normal.png) right;
			width: 16px;
			height: 25px;
 			top: calc(50% - 25px); 
/* 			top: 300px; */
			right: 5px;
			z-index: 97;
		}      	
		
		#imgBBox .video_wrap .prev_btn:hover {
			background: url(images/btn_image_arrow_left_hover.png) left;
			cursor: pointer;
		}
		
		#imgBBox .video_wrap .next_btn:hover {
			background: url(images/btn_image_arrow_right_hover.png) right;
			cursor: pointer;
		}		
		
		#imgBBox .name_wrap { width: 600px; text-align: center; margin: 0 auto; }
		#imgBBox .name_wrap .file_name { max-width: 380px; text-overflow: ellipsis; overflow: hidden; }
		#imgBBox .name_wrap .prev_btn {
			background: url(images/btn_image_arrow_left_normal.png) left;
			width: 16px;
			height: 25px;
/* 			top: calc(50% - 25px); */
			top: 300px;
			left: 5px;
			z-index: 97;
		}
		
		#imgBBox .name_wrap .next_btn {
			background: url(images/btn_image_arrow_right_normal.png) right;
			width: 16px;
			height: 25px;
/* 			top: calc(50% - 25px); */
			top: 300px;
			right: 5px;
			z-index: 97;
		}    	
		
		#imgBBox .name_wrap .prev_btn:hover {
			background: url(images/btn_image_arrow_left_hover.png) left;
			cursor: pointer;
		}
		
		#imgBBox .name_wrap .next_btn:hover {
			background: url(images/btn_image_arrow_right_hover.png) right;
			cursor: pointer;
		}		
		
      	#imgBBox .list_btn_wrap { width: 100px; margin-left: 20px; }
      	#imgBBox .list_btn_wrap .data_list_btn { width: 30px; height: 30px; margin-right: 30px; background: url(images/icon_filter_normal.png) right; cursor: pointer; }

		/* panel label */
		#imgBBox .btn_wrap .visible { width: 18px; height: 18px; position: relative; left: -145px; }
		#imgBBox .btn_wrap .visible.on { background: url('images/btn_layer_view.png') no-repeat center; }
		#imgBBox .btn_wrap .visible.off { background: url('images/btn_checkbox_normal.png') no-repeat center; }		
		
/*  		#imgBBox .tag_wrap { width: 100%; height: 60px; position: absolute; bottom: 91px;  border-top: 1px solid #f8f8f8; font-size: 11px; justify-content: center; }  */
      
		#imgBBox section.enrichment {
			width: calc(100% - 486px);
			height: 100%;
			position: relative;
/* 			border: 1px solid #e5e5e5; */
		}      
		
		#imgBBox section.label {
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
		
		#imgBBox section.enrichment .empty_wrap { margin: 0 auto; text-align: center; margin-top: 300px; color: #777777; }
		#imgBBox section.enrichment .empty_wrap .no_image { margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; height: 37px; background-image: url(./images/icon_nodata_list.png); }
		#imgBBox section.enrichment .empty_wrap .eng_text { margin-bottom: 3px; font-size: 16px; }
		#imgBBox section.enrichment .empty_wrap .kor_text { font-size: 12px; }		
		
		/* quick */
/*  		#imgBBox .quick_wrap { width: 100%; position: absolute; bottom: 0px; padding: 26.5px 0; background-color: #fff; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }        */
 		#imgBBox .quick_wrap { width: 100%; bottom: 0px; padding: 26.5px 0; background-color: #fff; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }       

/*  		#imgBBox .quick_wrap { width: calc(100% - 699px); position: absolute; bottom: 0px; padding: 25px 0; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }        */
/* 		#imgBBox .quick_wrap { width: 488px; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; position: absolute; top: -8px; left: 609px;}     */
      
		#imgBBox .quick_btn {
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
		
		#imgBBox .quick_btn:hover {
			background-color: #3A71E9;
		}    
		
		#imgBBox .quick_btn_wrap {
			padding-top: 10px;
		}		
				
		#imgBBox .quick_training, 
		#imgBBox .quick_inference {
			width: 400px;
			background-color: #fafafa;
			padding: 23px;
			border: 1px solid #d9d9d9;
			position: absolute;
			left: 38%;
			top: 50%;
			z-index: 9999999;
			display: none;
		}
		
		#imgBBox .quick_training.active, 
		#imgBBox .quick_inference.active {
			display: block;
		}
		
		#imgBBox .quick_training_btn, 
		#imgBBox .quick_inference_btn {
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
		
		#imgBBox .input_wrap {
			margin: 15px 0;
		}
		
		#imgBBox .input_wrap label {
			width: 100px;
			font: 400 12px system-ui;
		}
		
		#imgBBox .input_wrap input[type="text"] {
			width: 210px;
			height: 0px;
			font: 300 12px system-ui;
		}
		
		#imgBBox .input_wrap input::placeholder {
			font: 400 11px system-ui;
			color: #777;
		}
		
		#imgBBox .quick_close, 
		#imgBBox .project_close, 
		#imgBBox .config_close,
		#imgBBox .checkpoint_close {
			width: 37px;
			height: 37px;
			margin-top: -10px;
			display: inline-block;
			cursor: pointer;
			background:
				url("${pageContext.request.contextPath}/resources/images/btn-popup-close-normal.png");
		}
		
		#imgBBox .quick_title {
			font: 400 12px 'Open_Sans';
			padding-bottom: 10px;
		}
		
		#imgBBox .checkBtn {
			display: inline-block;
			width: 16px;
			height: 16px;
			background:
				url("${pageContext.request.contextPath}/resources/images/icon_gpu_check.png")
				no-repeat center;
		}
		
		#imgBBox .list_wrap {
			height: calc(100% - 149px);
			position: relative;
			width: 100%;
		}
		
		#imgBBox table.task_table th {
			border-top: 2px #3a3b3d solid;
			background-color: #fafafa;
			height: 44px;
			font-size: 12px;
			font-weight: 400;
			color: #333333;
		}
		
		#imgBBox table.task_table th, 
		#imgBBox table.task_table tr, 
		#imgBBox table.task_table td
			{
			text-align: center;
			border-bottom: 1px solid #e5e5e5;
			border-collapse: collapse;
			border-spacing: 0;
		}
		
		#imgBBox .table_body table.task_table {
			font-family: Open_Sans;
			font-size: 12px;
			color: #343434;
			font-weight: 300;
			border-collapse: collapse;
			width: 100%;
		}
		
		#imgBBox .table_body table.task_table tr:hover {
			background-color: #f4fcfe;
		}
		
		#imgBBox .table_body table.task_table td {
			padding-top: 3px;
			padding-bottom: 3px;
			font-size: 11px;
			cursor: default;
		}
		
		#imgBBox .table_header table.task_table {
			margin-top: 15px;
			border-collapse: collapse;
			width: 100%;
		}
		/* #imgBBox .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
		#imgBBox .table_body {
			max-height: 340px;
			overflow-y: overlay;
			overflow-x: hidden;
			background-color: #fff;
			position: relative;
			margin-bottom: 17px;
		}
		
		#imgBBox table td {
			height: 48px;
		}
		
		#imgBBox .radioBtn {
			margin-left: 5px;
		}
		
		#imgBBox .csv_name_input_wrap {
			
		}
		
		#imgBBox .csv_name_input_wrap span {
			font: 400 11px system-ui;
		}
		
		#imgBBox .csv_name_input_wrap input {
			font: 400 11px system-ui;
			width: 90%;
			height: 0px;
		}
		
		#imgBBox select {
			height: 40px;
			width: 253px;
			border: 1px solid #dedcde;
			font: 400 11px system-ui;
			background:
				url("${pageContext.request.contextPath}/resources/images/select_arrow.png")
				#fff no-repeat 97% 50%/10px;
		}
		
		#imgBBox select:focus {
			outline: none;
		}
		
		#imgBBox .select_project_wrap {
			position: relative;
			left: -1.5%;
			top: 13px;
		}
		
		#imgBBox .add_project_btn, 
		#imgBBox .training_config_btn, 
		#imgBBox .checkpoint_list_btn
			{
			width: 20px;
			height: 20px;
			margin-left: 18px;
			text-align: center;
			border: 1px solid #dedcde;
			background-color: #fff;
			cursor: pointer;
		}
		
		#imgBBox .add_project {
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
		
		#imgBBox .training_config {
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
		
		#imgBBox .add_project.active, 
		#imgBBox .training_config.active,
		#imgBBox .checkpoint_list.active, 
		#imgBBox .inference_config.active {
			display: block !important;
		}
		
		#imgBBox .add_project input[type="text"] {
			width: 210px;
			height: 0px;
		}
		
		#imgBBox .add_project label {
			width: 100px;
			font: 400 12px system-ui;
		}
		
		#imgBBox .add_project textarea {
			width: 210px;
			height: 150px;
			margin: 10px 0;
			font: 400 13px Arial;
		}
		/* #imgBBox .add_project .add_btn { width: 70px; padding: 4px; margin: 0 auto; background-color: #fff; border: 1px solid #dedcde; text-align: center; cursor: pointer; font: 400 13px system-ui; } */
		#imgBBox .training_config input[type=number]::-webkit-inner-spin-button,
			.training_config input[type=number]::-webkit-outer-spin-button {
			-webkit-appearance: none;
			margin: 0;
		}
		
		#imgBBox .training_config input, 
		#imgBBox .inference_config input {
			height: 0px;
		}
		
		#imgBBox .training_config input[type="text"],
		#imgBBox .inference_config input[type="text"]
			{
			width: 145px !important;
		}
		
		#imgBBox .training_config label, 
		#imgBBox .inference_config label {
			width: 180px !important;
			font: 400 12px system-ui;
		}
		
		#imgBBox .inference_config input[type=number]::-webkit-inner-spin-button,
		#imgBBox .training_config input[type=number]::-webkit-outer-spin-button {
			-webkit-appearance: none;
			margin: 0;
		}
		
		#imgBBox .tooltip_wrap {
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
		
		#imgBBox .tooltip {
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
		
		#imgBBox .tooltip.on {
			visibility: visible;
			opacity: 1;
			transition: visibility 0s, opacity 0.3s ease;
		}
		
		#imgBBox .description_wrap {
			min-width: 340px;
			max-width: 340px;
			margin: 17px 0;
			padding: 15px;
		}
		
		#imgBBox .description_wrap.border {
			border: 1px solid #dedcde;
		}
		
		#imgBBox .description_wrap .description {
			font: 400 12px system-ui;
		}
		
		#imgBBox .inference_config_btn {
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
		
		#imgBBox .inference_config {
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
		
		#imgBBox .checkpoint_list {
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
		/* #imgBBox .checkBtn { display:inline-block; width: 16px; height: 16px; background: url("${pageContext.request.contextPath}/resources/images/icon_gpu_check.png") no-repeat center; } */
		#imgBBox .checkpoint_list .list_wrap {
			height: calc(100% - 149px);
			position: relative;
			width: 100%;
		}
		
		#imgBBox .checkpoint_list table.checkpoint_table th {
			border-top: 2px #3a3b3d solid;
			background-color: #fafafa;
			height: 44px;
			font-size: 11px;
			font-weight: 400;
			color: #333333;
		}
		
		#imgBBox .checkpoint_list table.checkpoint_table th, 
		#imgBBox .checkpoint_list table.checkpoint_table tr,
		#imgBBox .checkpoint_list table.checkpoint_table td {
			text-align: center;
			border-bottom: 1px solid #e5e5e5;
			border-collapse: collapse;
			border-spacing: 0;
		}
		
		#imgBBox .checkpoint_list .table_body table.checkpoint_table {
			font-family: Open_Sans;
			font-size: 12px;
			color: #343434;
			font-weight: 300;
			border-collapse: collapse;
			width: 100%;
		}
		
		#imgBBox .checkpoint_list .table_body table.checkpoint_table tr:hover
			{
			background-color: #f4fcfe;
		}
		
		#imgBBox .checkpoint_list .table_body table.checkpoint_table td {
			padding-top: 3px;
			padding-bottom: 3px;
		}
		
		#imgBBox .checkpoint_list .table_header table.checkpoint_table {
			margin-top: 15px;
			border-collapse: collapse;
			width: 100%;
		}
		/* #imgBBox .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
		#imgBBox .checkpoint_list .table_body {
			max-height: 340px;
			overflow-y: overlay;
			overflow-x: hidden;
			background-color: #fff;
			position: relative;
			margin-bottom: 17px;
		}
		
		#imgBBox .checkpoint_list table td {
			height: 48px;
		}
		
		#imgBBox .checkpoint_list .checkpoint_table .radioBtn {
			margin-left: 5px;
		}
		
		#imgBBox .checkpoint_list .selected_task_name {
			font: 400 11px system-ui !important;
			color: #777 !important;
		}
		
		#imgBBox .empty_wrap {
			text-align: center;
			margin-top: 120px;
		}
		
		#imgBBox .empty_wrap .no_image {
			margin-bottom: 17px;
			background-repeat: no-repeat;
			background-position-x: center;
		}
		
		#imgBBox .empty_wrap .eng_text {
			font-family: Open_Sans;
			margin-bottom: 3px;
			font-size: 16px;
			font-weight: 300;
			color: #777777;
		}
		
		#imgBBox .empty_wrap .kor_text {
			font-family: Open_Sans;
			font-size: 12px;
			color: #777777;
			font-weight: 200;
			margin-bottom: 120px;
		}
		
		#imgBBox .no_image {
			height: 37px;
			background-image: url('./images/icon_nodata_list.png');
		}
		
		#imgBBox .checkpoint_view {
			width: 270px;
			font: 400 10px system-ui;
			margin: -6px auto -6px 103px;
			display: none;
		}
		
		#imgBBox .checkpoint_view.active {
			display: block;
		}
		
		#imgBBox .inference_checkpoint {
			padding-top: 10px;
		}
		
		#imgBBox .inference_checkpoint .list_wrap {
			height: calc(100% - 149px);
			position: relative;
			width: 100%;
		}
		
		#imgBBox .inference_checkpoint table.checkpoint_table th {
			border-top: 2px #3a3b3d solid;
			background-color: #fafafa;
			height: 44px;
			font-size: 11px;
			font-weight: 400;
			color: #333333;
		}
		
		#imgBBox .inference_checkpoint table.checkpoint_table th, 
		#imgBBox .inference_checkpoint table.checkpoint_table tr,
		#imgBBox .inference_checkpoint table.checkpoint_table td {
			text-align: center;
			border-bottom: 1px solid #e5e5e5;
			border-collapse: collapse;
			border-spacing: 0;
		}
		
		#imgBBox .inference_checkpoint .table_body table.checkpoint_table {
			font-family: Open_Sans;
			font-size: 12px;
			color: #343434;
			font-weight: 300;
			border-collapse: collapse;
			width: 100%;
		}
		
		#imgBBox .inference_checkpoint .table_body table.checkpoint_table tr:hover
			{
			background-color: #f4fcfe;
		}
		
		#imgBBox .inference_checkpoint .table_body table.checkpoint_table td
			{
			padding-top: 3px;
			padding-bottom: 3px;
		}
		
		#imgBBox .inference_checkpoint .table_header table.checkpoint_table {
			margin-top: 15px;
			border-collapse: collapse;
			width: 100%;
		}
		/* #imgBBox .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
		#imgBBox .inference_checkpoint .table_body {
			max-height: 340px;
			overflow-y: overlay;
			overflow-x: hidden;
			background-color: #fff;
			position: relative;
			margin-bottom: 17px;
		}
		
		#imgBBox .inference_checkpoint table td {
			height: 48px;
		}
		
		#imgBBox .inference_algorithm {
			font: 400 10px system-ui;
		}
		
		#imgBBox .side_btn_wrap {
			margin: 0 auto;
			width: 60%;
		}
		
		#imgBBox .side_btn_wrap .cancel_btn {
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
		
		#imgBBox .side_btn_wrap .save_btn, 
		#imgBBox .side_btn_wrap .add_btn {
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
		
		#imgBBox .checkpoint_list .side_btn_wrap {
			margin-top: 60px;
			text-overflow: ellipsis;
		}
		
		#imgBBox .quick_wrap select { padding: 5px 20px; }			
		
		#imgBBox .data_list_header { margin-top: -10px; }
		#imgBBox .data_list_header .close_btn { font-size: 24px; cursor: pointer; position: relative; top: -5px; }	
		#imgBBox .data_list_header .close_btn:hover { color: #4c84ff; }
		
		#imgBBox .no_label { width: 84%; padding: 180px 30px; text-align: center; color: #cdcdcd; }
		#imgBBox .no_label div:nth-of-type(1) { width: 53px; height: 53px; margin: 0 auto; margin-bottom: 11px; background: url('${pageContext.request.contextPath}/resources/images/img_nodata.png') no-repeat; opacity: 0.4; /*  */}
		#imgBBox .no_label div:nth-of-type(2) { font-size: 16px; font-weight: 300; margin-bottom: 3px; }
		#imgBBox .no_label div:nth-of-type(3) { font-size: 12px; font-weight: 300; }					
		
		#imgBBox section.tag { width: 486px; height: 100%; position: relative; background-color: #fff; border: 1px solid #e5e5e5; border-bottom: 0; -ms-user-select: none; -moz-user-select: none; -webkit-user-select: none; -khtml-user-select: none; user-select: none; }
		#imgBBox section.tag .tag_margin { margin: 0 auto; padding: 10px; }
 		#imgBBox section.tag .tag_total { color: #777; font-weight: 400; padding: 20px; }
 		#imgBBox section.tag .tag_wrap { width: 100%; height: 90px; margin-top: 1px; border-top: 1px solid #e5e5e5; font-size: 11px; justify-content: center; } 
		#imgBBox section.tag .tag_wrap .content { width: 100%; height: auto; max-height: 75px; overflow-y: scroll; overflow-x: hidden; flex-wrap: wrap; -ms-overflow-style: none; }
		#imgBBox section.tag .tag_wrap .content::-webkit-scrollbar { display: none; }		
		#imgBBox section.tag .tag_wrap .tag { width: 81px; margin: 10px 5px; line-height: 32px; background: #f4f7fc; border: 1px solid #d9d9d9; border-radius: 4px; text-align: center; font-size: 14px; font-weight: 300; color: #555; cursor: pointer; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; }
		#imgBBox section.tag .tag_wrap .tag.selected { background-color: #4c84ff; border-color: #2b65e6; color: #fff; box-shadow: 0 3px 4px 0 rgba(159, 189, 255, 0.7); }
		#imgBBox .hover_box {border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
		#imgBBox .hover_box div {font-family: Open_Sans; font-size: 13px; color: #555555;}
		#imgBBox .hover_div div {word-break: break-word; margin: 2px 5px; white-space: normal; font-weight: 300; font-family: Open_Sans;}	
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
               <div id="imgBBox" class="container-fluid">
                  <!-- Page Heading -->


                  <div class="card shadow mb-4 flex fs">

                <!-- Quick Training & Inference Btn area end -->                     
                     
                     <section class="enrichment">
	                  	<div class="header_wrap flex sb">
		                  	<div class="page_title_wrap">
		                  		<span>Enrichment</span> <span>|</span> Image Bounding Box
	                  		</div>
	                  	</div>                     
                   		<div class="video_wrap flex tab-pane active" id="imgBBox-labeller" role="tabpanel" >
                   			<div class = "prev_data_wrap">
                		 			<div class="prev_btn prev_data"></div>
        		         	</div>
                   			<!-- <div class="prev_btn prev_data"></div>
							<div class="next_btn next_data"></div> -->
							
                   			<canvas class="canvas" id="imgBBox-canvas"></canvas>
                   			<!-- prog_bar start -->
                   			<div class="prog_bar flex justify-content-between hide">
                   				<div class="name_wrap ml-2">
                   					<div class="video_name font-weight-bold"></div>
                   				</div>
                   				
                   			</div><!-- prog_bar end -->
                   			<div class = "next_data_wrap">
									<div class="next_btn next_data"></div> 
							</div>
						</div> 
						
                 		<div class="img_list_wrap flex sb"> <!-- Image Slide area start -->
<!--                  			<div>Image Slide Section</div> -->
							<div class="list_btn_wrap">
								<div class="data_list_btn"></div>
							</div>

							<div class="name_wrap flex sb">
                   				<div class="prev_btn prev_data"></div>
								<div class="file_name"></div>
								<div class="next_btn next_data"></div>	
							</div>
							
							<div class="position_wrap">
	                 			<input type="text" class="position-value" value="1" onKeyPress="return checkNum2(event);" />
	                 			<div class="total_count"> / <span></span></div>							
							</div>							
	                 		<div class="data_list_wrap">
<!-- 	                 			<div class="data_total">Total <span>0</span></div> -->
								<div class="data_list_header flex sb">
									<div class="data_total">Total <span>0</span></div>
									<div class="close_btn">&times;</div>
								</div>	                 			
								<div class="list_table">
									<div class="h_wrap flex">
	<!-- 									<div class="checkBox all" ></div> -->
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
<!-- 							<div id="quick_training_btn" class="quick_btn filter_color">Quick Training</div> -->
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

                     
                      
                     
<!--                      labeller worksheet start -->
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
			var that = imgBBox;

			// canvas init
			that.data.canvas = new fabric.Canvas('imgBBox-canvas',{
				selection : false,
				width : 800,
				height : 600,
				uniScaleTransform : true,
			});
			
			that.bind.evtOnceInit();
// 			imgBBox.init();
		    
		});
		
		const imgBBox = {
				pt: $("#imgBBox"),
				data : {
					
					// initial canvas and canvas var
					canvas : null,
					canvasObj : {
						origX : 0, 
						origY : 0, 
						isDown : false, // default : false
						freeDrawing : false, // default : false
						currDataNum : 1,
						datasetId : null,
// 						isRectActive : true,
						state : false,
						isModified : 0,
					},
					scaleFactor : {origWidth:0, origHeight:0, ratio:1, minBboxSize:0},
					
					meta : {},
					
					colorHash : null,
					// initial canvas and canvas var end
					
					// undo, redo
					pauseSaving : false,	
					undoStack : [],
					redoStack : [],
					
					tag : [],
					
				}, // data end
				
				//init start
				datasetInit : function(dataset_id){
					const that = imgBBox;
					console.log("Start!");
					var data_list_wrap = that.pt.find(".data_list_wrap");
					data_list_wrap.removeClass("active");
					data_list_wrap.css("display", "none");
					
					that.data.canvasObj['datasetId'] = null;
					that.data.canvasObj['datasetId'] = dataset_id;
					that.init(dataset_id);
				},				
				
				init : function(dataset_id) {
					const that = imgBBox;
					console.log("Start2!");
					// jh.sa 추가 		
// 					that.bind.evtOnceInit();
					var nodes = wsObj["labeller"].dir.getSelectedNodes();
					var state = that.data.canvasObj["state"];
					console.log("status : " + nodes[0].status);
					if(state == false && $("#" + nodes[0].tId + "_loading").hasClass("upload_wait")) {
		  				alert("데이터를 업로드 하는 중입니다...");
		  				state = true;
		  				/* history.go(0); */
		  			}
				
					that.computed.clearAllData();
					that.bind.resetView();
					that.data.colorHash = new ColorHash();
					// j.seo 수정
					that.data.canvasObj['currDataNum'] = 1;
					// j.seo 추가 
					/* that.data.canvasObj['currDataNum'] = that.computed.getLastCursor(that.data.canvasObj['datasetId']); */
					
					// jh.sa 201015 : pagination
// 					that.pageKey = "imgBBox";
// 					sessionStorage.setItem(that.pageKey, 1);	
// 					$("#imgBBox .c_wrap .path").removeClass("active");

					//j.seo 수정 
					/* var page_num = 0; */
					// jh.sa 추가
					that.computed.getDatasetById(dataset_id);
					//j.seo 추가 
					let last_cursor = that.computed.getLastCursor(dataset_id);
					var page_num = Math.floor(last_cursor / 50);
					/* console.log("page_num : " + page_num); */
					//
					var current_idx = $("#imgBBox .position-value").val();
					$("#imgBBox .label_wrap .btn_wrap .add").hide();
					that.pt.find(".category_wrap").html("");
					that.pt.find(".data_list_wrap").removeClass("active").hide();
					//j.seo 수정 
					/* that.computed.getVideoDataList(page_num, that.data.canvasObj['datasetId']); */
					// j.seo 추가
					that.computed.getVideoDataList(page_num, dataset_id, last_cursor);
					//
					that.bind.sideEvtCollision();
// 					labeller.bind.evtAll();
// 					that.bind.evtOnceInit(); // added by k.park
					that.bind.keydownEvt();
					// Quick Training & Inference
					$("#imgBBox .quick_training").removeClass("active");
					$("#imgBBox .quick_inference").removeClass("active");
					$("#imgBBox .quick_task_list .list_wrap .table_body .task_table tbody").html("");
					imgBBoxQuick.init();		
					
					
				}, // init end
				
				bind : {
					evtOnceInit : function(){
						
						this.collision();
						this.downEvt();
						this.moveEvt();
						this.upEvt();
						this.wheelEvt();
						this.objMovingEvt();
						this.objModifiedEvt();
						this.objScalingEvt();
// 						this.keydownEvt();
// 						this.keydownEvt2();
					},
					collision : function(player,canvas) {
						const that = imgBBox;
						
// 						$("#imgBBox .category_wrap .label_wrap .cate_wp input").off("focus").on("focus", function(e){
// 							if(!$(this).parents(".cate_wp").hasClass("selected")){
// 								$(this).parents(".cate_wp").trigger("click");
// 							}
							
// 							$("#imgBBox .findTag").remove();
// 							var html = "<div class='findTag'><ul></ul></div>";
// 							$(this).parent().append(html);
							
// 							var dataId = $("#imgBBox .c_wrap .path.active").innerHTML;
// 							var tagset = that.computed.getLabelGroup(datasetId);
// 							that.computed.setLabelGroup(tagset);							
// 						});
						
					}, //collision end
					
					downEvt : () => { // canvas rect mouse down event
						const that = imgBBox;
						that.data.canvas.on('mouse:down',function(o){
							var uuid = "";
							that.data.canvasObj.isDown = true;

							if($("#imgBBox .label_wrap .category_wrap .cate_wp.selected").length > 0){
								uuid = $("#imgBBox .label_wrap .category_wrap .cate_wp.selected")[0].id;
								that.data.canvasObj.freeDrawing = true;
							}
							
							var canv = that.data.canvas.getObjects();
					    	for(var i=0; i<canv.length; i++){
					    		if(canv[i]["uuid"] == uuid){
					    			$("#imgBBox .label_wrap .category_wrap .cate_wp").removeClass("selected");
					    			that.data.canvasObj.freeDrawing = false;
					    			return;
					    		}
					    	}
					    	
							if (that.data.canvasObj.freeDrawing == true && uuid != "" ) {
// 								var uuid = $("#imgBBox .label_wrap .category_wrap .cate_wp.selected")[0].id;
							    var pointer = that.data.canvas.getPointer(o.e);
							    
							    that.data.canvasObj.origX = pointer.x;
							    that.data.canvasObj.origY = pointer.y;
// 							    that.data.canvasObj.isDown = true;
							    if(that.data.canvasObj.isDown && $("#imgBBox .label_wrap .category_wrap .cate_wp.selected").length > 0) {

									var temp = {
										uuid : uuid,
	 							    	left : that.data.canvasObj.origX,
	 							    	top : that.data.canvasObj.origY,
	 							    	width : pointer.x-that.data.canvasObj.origX,
	 							    	height : pointer.y-that.data.canvasObj.origY,
									}
								    
									var rectObj = that.computed.getRectObject(uuid,temp);
							    	that.computed.initRect(uuid,rectObj);
								}
							}
							
							
						});
					},// canvas rect mouse down event end
					
					moveEvt : () => { // canvas rect mouse move event
						const that = imgBBox;
						var data = that.data;
						var canvas = that.data.canvas;
						
						canvas.on('mouse:move', function(evt) {
							var tempRect = canvas.getActiveObject();
							
						    if (data.canvasObj.isDown == true && data.canvasObj.freeDrawing == true){
						    
								var pointer = canvas.getPointer(evt.e);
								var uuid = $("#imgBBox .label_wrap .category_wrap .cate_wp.selected")[0].id;
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
							    
							    canvas.renderAll();
							    
						   }else if(data.canvasObj.isDown==true && evt.target == null) {
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
					},// canvas rect mouse move event end
					
					upEvt : () => { // canvas rect mouse up event
						const that = imgBBox;
						var data = that.data;
						var meta = that.data.meta;
						var canvas = that.data.canvas;
						
						canvas.on('mouse:up', function(e) {
					    	
							if(e.target && canvas.getActiveObject() == e.target){
								$("#imgBBox .label_wrap .category_wrap .cate_wp").removeClass("selected");
								$("#imgBBox .label_wrap .category_wrap .cate_wp[id='"+e.target.uuid+"']").addClass("selected");
								let color = that.data.colorHash.rgb(e.target.uuid);
								$("#imgBBox .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
								$("#imgBBox .label_wrap .category_wrap .cate_wp[id='"+e.target.uuid+"'].selected ").css("border-color","rgb("+color+")");
							}
							
							data.canvasObj.isDown = false;
							data.canvasObj.freeDrawing = false;
							
							var tempRect = canvas.getActiveObject();
							if(tempRect ==null && tempRect == undefined){
								return false;
							}
// 							if(tempRect.width < 40){
// 								tempRect.set({width : 40});
// 								canvas.renderAll();
// 							}
// 							if(tempRect.height < 40){
// 								tempRect.set({height : 40});
// 								canvas.renderAll();
// 							}
							// jh.sa 201126 
							var iw = that.data.scaleFactor.origWidth;
							var ih = that.data.scaleFactor.origHeight;
							var sf = that.data.scaleFactor.ratio;
							var minBboxSize = that.data.scaleFactor.minBboxSize;
							
							if(tempRect.width < minBboxSize){
								const tw = tempRect.width;
								tempRect.set({width : minBboxSize});
								// 우측 가장자리
								if(((tempRect.left/sf) + (tempRect.width/sf)) > iw){
									tempRect.set({width : minBboxSize, left: tempRect.left - (minBboxSize-tw) });
								}								
								canvas.renderAll();
							}
							if(tempRect.height < minBboxSize){
								const th = tempRect.height;
								tempRect.set({height : minBboxSize});
								// 하단 가장자리
								if(((tempRect.top/sf) + (tempRect.height/sf)) > ih){
									tempRect.set({height : minBboxSize, top: tempRect.top - (minBboxSize-th) });
								}									
								canvas.renderAll();
							}
							//
							
							if(!$("#imgBBox .label_wrap .category_wrap .cate_wp[id='"+tempRect.uuid+"']").hasClass("selected")){
								$("#imgBBox .label_wrap .category_wrap .cate_wp[id='"+tempRect.uuid+"']").addClass("selected");
							}
							var uuid = $("#imgBBox .label_wrap .category_wrap .cate_wp.selected")[0].id;
							
							// edit j.seo
							/* if(!e.target || e.target != tempRect){
								that.computed.saveMetaData(tempRect, uuid);
							}else{
// 								var rectObj = {
// 									top : e.target.top,
// 									left : e.target.left,
// 									width : e.target.getScaledWidth(),
// 									height : e.target.getScaledHeight(),
// 								}
								// jh.sa 201126
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
								var labelBoxHeight = $("#imgBBox .label_wrap .category_wrap #"+uuid+"")[0].offsetTop;
								$("#imgBBox .label_wrap .category_wrap").animate({
									scrollTop:labelBoxHeight-60
								},500);
								
								// save meta
								that.computed.saveMetaData(tempRect, uuid);
							}
							
							// draw crop img into label box
							var newRect = that.computed.rescale(that.data.meta[uuid]['rectData'],true);
// 							that.render.renderCropImgIntoLabel(uuid,newRect[0]);
							that.render.renderCropImgIntoLabel(uuid,newRect);		// jh.sa 
							
							tempRect.setCoords(); */
							if(!that.data.meta[uuid].hasOwnProperty('rectData') || that.data.meta[uuid]['rectData']['top'] == undefined){
								// 새로 만든 바운딩 박스 저장 
// 								var path = that.pt.find(".list_table .path.active").attr("data-path");
								
								//test ai assitant
// 								var aiRect = Object.assign(that.computed.rescale(tempRect,true));
// 								var ajaxData = {
// 										path : path,
// 										left : aiRect.left,
// 										top : aiRect.top,
// 										width : aiRect.width,
// 										height : aiRect.height,
// 										type : "IMAGE_BBOX",
// 								}
								
// 								$.ajax({
// 									url : baseUrl + "aiAssistant/runAiAssistant.json",
// 									data : ajaxData,
// 								   	type : "POST",
// 								   	success : function(res){
// 								   		console.log("=====runAiAssistant=====", res);
// 										if(res.result.code == "200"){
// 											var temp = that.computed.rescale(JSON.parse(res.result.data),false);
// 											tempRect.set({
// 												left : temp.left,
// 												top : temp.top,
// 												width : temp.width,
// 												height : temp.height,
// 											});
// 											canvas.renderAll();
// 										}
// 								   	},
// 								   	error : function(err){
// 								   		$("#loader").hide();
// 								   		 console.log("ERROR!!", err);
// 								   	}
// 								});
								
								that.computed.saveMetaData(tempRect, uuid);
								that.computed.stackHistory(uuid,"created");
								console.log("새로 만든 바운딩 박스 저장 ");
							}else{
								// 기존에 있던 바운딩 박스 저장
// 								var rectObj = {
// 									top : e.target.top,
// 									left : e.target.left,
// 									width : e.target.getScaledWidth(),
// 									height : e.target.getScaledHeight(),
// 								}
								// jh.sa 201127
								var activeObj = that.data.canvas.getActiveObject();
								var rectObj = {
// 									top : e.target.top,
// 									left : e.target.left,
// 									width : e.target.getScaledWidth(),
// 									height : e.target.getScaledHeight(),
									top : activeObj.top,
									left : activeObj.left,
									width : activeObj.width,
									height : activeObj.height,
								}	
//								that.computed.saveMetaData(rectObj, uuid);
								// label box scroll move
								var labelBoxHeight = that.pt.find(".label_wrap .category_wrap #"+uuid+"")[0].offsetTop;
								that.pt.find(".label_wrap .category_wrap").animate({
									scrollTop:labelBoxHeight-60
								},500);
								
								// jh.sa 210402 
								// 서버에서 가져온 메타데이터일 경우 수정(undoStack add) 시 초기 rectData 값이 설정되어있지 않아 되돌아갈 수 없는 문제
								// uuid에 "-" 포함 안되어있고, 기존 undoStack에 history가 없는 경우 서버에서 가져온 메타데이터로 판단해 기본위치 stack에 등록
								var checked = that.computed.checkHistory(uuid);
								if(checked){
									that.computed.stackHistory(uuid,"loaded");
								}
								// save meta
								// jh.sa 210406 다른 id를 가진 객체와 병행 작업 시 충돌 방지
								console.log("that.data.meta[uuid].rectData::", that.data.meta[uuid]);
								var prevRect = JSON.parse( JSON.stringify(that.data.meta[uuid].rectData));
								that.computed.saveMetaData(rectObj, uuid);
								//that.computed.saveMetaData(tempRect, uuid);
								that.computed.stackHistory(uuid,"modified",prevRect);
								console.log("기존에 있던 바운딩 박스 저장");
								
								// draw crop img into label box
								
							}
							var newRect = that.computed.rescale(that.data.meta[uuid]['rectData'],true);
							that.render.renderCropImgIntoLabel(uuid,newRect);
							
							tempRect.setCoords();
							
						});
					},// canvas rect mouse up event end
					
					wheelEvt : () => {
						const that = imgBBox;
						var canvas = that.data.canvas;
						canvas.on("mouse:wheel",function(evt){
// 							console.log("mouse wheel!",evt);
							//클릭 이벤트가 없을경우만 실행
							if(that.data.canvasObj.isDown == false){
								const delta = evt.e.deltaY;
								const pointer = canvas.getPointer(evt.e);
								let zoom = canvas.getZoom();
								zoom = zoom + delta/200;
								
								// jh.sa : zoom 확대 시에 rectgon point 크기가 커지던 문제 수정
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
					
					objMovingEvt : () => {
						const that = imgBBox;
						var canvas = that.data.canvas;
						that.data.canvas.on("object:moving",function(evt){
							var rects = canvas.getObjects();
// 							for(var i = 0; i<rects.length; i++){
// 								if(rects[i].uuid == evt.target.uuid){
// 									var tempRect = rects[i];
// 									break;
// 								}
// 							}							
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
							////201031
// 							if(!that.data.canvasObj.freeDrawing){
// 								tempRect = {
// 										left : evt.target.left,
// 										top : evt.target.top,
// 										width : evt.target.width,
// 										height : evt.target.height,
// 								}
								
// 								if(( tempRect.left + tempRect.width ) > canvas.getWidth() ){
// 									tempRect.left = canvas.getWidth() - tempRect.width;
// 								}
// 								if(( tempRect.top + tempRect.height ) > canvas.getHeight() ){
// 									tempRect.top = canvas.getHeight() - tempRect.height;
// 								}
// 								if(tempRect.width > canvas.getWidth()){
// 									tempRect.width = canvas.getWidth();
// 								}
// 								if(tempRect.height > canvas.getHeight()){
// 									tempRect.height = canvas.getHeight();
// 								}
// 								if(tempRect.left < 0){
// 									tempRect.left = 0;
// 								}
// 								if(tempRect.top < 0){
// 									tempRect.top = 0;
// 								}
// 								evt.target.left = tempRect.left;
// 								evt.target.top = tempRect.top;								
// 							}
// 							else {
// 								evt.target.left = tempRect.left;
// 								evt.target.top = tempRect.top;																
// 							}

							
						});
					},
					
					objModifiedEvt : () => {
						const that = imgBBox;
						var canvas = that.data.canvas;
						canvas.on("object:modified",function(evt){
							// 201031
// 							if(!that.data.canvasObj.freeDrawing){
// 								that.data.canvas.getActiveObject().lockScalingX = false;
// 								that.data.canvas.getActiveObject().lockScalingY = false;	
// 								that.data.canvas.getActiveObject().lockMovementX = false;
// 								that.data.canvas.getActiveObject().lockMovementY = false;								
// 							}
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
							that.data.canvasObj['isModified'] = 1;
						});
					},
					
					objScalingEvt : () => {
						const that = imgBBox;
						var canvas = that.data.canvas;
						
						canvas.on("object:scaling",function(evt){
// 							$("#labeller-video .vjs-progress-control").hide();
							
							var tempRect = that.data.canvas.getActiveObject();
							var pointer = canvas.getPointer(evt.e);
							var minBboxSize = that.data.scaleFactor.minBboxSize;
							
							//tempRect.width = evt.target.getScaledWidth();
							tempRect.left = evt.target.left;
							//tempRect.height = evt.target.getScaledHeight();
							tempRect.top = evt.target.top;
							
							// selection pointer 별 예외처리
							switch (evt.transform.corner){
								case "tl":
									if(pointer.x >= tempRect.aCoords.tr.x-5){
										pointer.x = tempRect.aCoords.tr.x-5;
										evt.target.left = pointer.x;
									}
									if(pointer.y >= tempRect.aCoords.bl.y-5){
										pointer.y = tempRect.aCoords.bl.y-5;
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
									if(pointer.y >= tempRect.aCoords.br.y-5){
										pointer.y = tempRect.aCoords.br.y-5;
										evt.target.top = pointer.y;
									}
									
									tempRect.set({
										//width : Math.abs(tempRect.aCoords.tr.x - tempRect.aCoords.tl.x),
										height : Math.abs(tempRect.aCoords.br.y - pointer.y)
									});
									//evt.target.scaleX = tempRect.width / evt.target.width;
									evt.target.scaleY = tempRect.height / evt.target.height;
									break;
								case "tr":
									if(pointer.x <= tempRect.aCoords.tl.x-5){
										pointer.x = tempRect.aCoords.tl.x;
										evt.target.left = pointer.x;
									}
									if(pointer.y >= tempRect.aCoords.br.y-5){
										pointer.y = tempRect.aCoords.br.y-5;
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
									if(pointer.x >= tempRect.aCoords.br.x-5){
										pointer.x = tempRect.aCoords.br.x-5;
										evt.target.left = pointer.x;
									}
									if(pointer.y <= tempRect.aCoords.tl.y+5){
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
									if(pointer.x >= tempRect.aCoords.tr.x-5){
										pointer.x = tempRect.aCoords.tr.x-5;
										evt.target.left = pointer.x;
									}
									tempRect.set({
										width : Math.abs(tempRect.aCoords.tr.x - pointer.x),
										//height : Math.abs(tempRect.aCoords.bl.y - tempRect.aCoords.tl.y)
									});
									evt.target.scaleX = tempRect.width / evt.target.width;
									//evt.target.scaleY = tempRect.height / evt.target.height;
									break;
								case "mb":
									tempRect.set({
										//width : Math.abs(tempRect.aCoords.tr.x - tempRect.aCoords.tl.x),
										height : Math.abs(tempRect.aCoords.tr.y - pointer.y)
									});
									//evt.target.scaleX = tempRect.width / evt.target.width;
									evt.target.scaleY = tempRect.height / evt.target.height;
									break;
								case "mr":
									/*tempRect.set({height : Math.abs(tempRect.aCoords.bl.y - tempRect.aCoords.tl.y)});
									evt.target.scaleY = tempRect.height / evt.target.height;*/
									if(pointer.x <= tempRect.aCoords.tl.x-5){
										pointer.x = tempRect.aCoords.tl.x-5;
										evt.target.left = pointer.x;
									}
									tempRect.set({
										width : Math.abs(tempRect.aCoords.tl.x - pointer.x),
										//height : Math.abs(tempRect.aCoords.bl.y - tempRect.aCoords.tl.y)
									});
									evt.target.scaleX = tempRect.width / evt.target.width;
									break;
								case "br":
									if(pointer.x <= tempRect.aCoords.bl.x+5){
										pointer.x = tempRect.aCoords.bl.x;
										evt.target.left = pointer.x;
									}
									if(pointer.y <= tempRect.aCoords.tl.y+5){
										pointer.y = tempRect.aCoords.tl.y;
										evt.target.top = pointer.y;
									}
									tempRect.set({
										width : Math.abs(tempRect.aCoords.bl.x - pointer.x),
										height : Math.abs(tempRect.aCoords.tl.y - pointer.y) 
									});
	//									evt.target.scaleX = tempRect.width / evt.target.width;
	//									evt.target.scaleY = tempRect.height / evt.target.height;
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
						const that = imgBBox;
						var canvas = that.data.canvas;
						// jh.sa save 버튼 단축키
						var isCtrl;		// ctrl, s 눌림 여부 확인
						$(document).off("keyup").on("keyup", function(evt){
// 							if (evt.keyCode == "17") isCtrl = false;
							if(evt.keyCode == "83" && evt.ctrlKey == true){
								that.computed.insertMetaData();
							}
							if(evt.keyCode == "81" && evt.shiftKey == true){
								var currDataNum = that.data.canvasObj['currDataNum']*1-2;
								var page_size = 50;
								if(currDataNum<0){
									alert("처음 데이터입니다.");
									return;
								}
								if(currDataNum%page_size == 49){
									var page_num = Math.floor(currDataNum/page_size);
									that.computed.clearAllData();
									that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId'],currDataNum);
									return;
								}
								that.computed.initImgData(currDataNum);
							}
							if(evt.keyCode == "87" && evt.shiftKey == true){
								var currDataNum = that.data.canvasObj['currDataNum']*1;
								var page_size = 50;
								var total_size = $("#imgBBox .position_wrap .total_count span").html()*1;
								if(currDataNum>=total_size){
									alert("마지막 데이터입니다.");
									return;
								}
								if(currDataNum%page_size == 0){
									var page_num = Math.floor(currDataNum/page_size);
									that.computed.clearAllData();
									that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
									return;
								}
								that.computed.initImgData(currDataNum);	
							}							
							that.bind.keydownEvt();
						});						
// 						$(document).off("keydown").on("keydown",function(evt){
// 							// del evt
// 							if(evt.keyCode == "46" || evt.keyCode == "68" && evt.ctrlKey == true){
// 								evt.preventDefault();
// 								if(canvas.getActiveObject() == null){
// 									alert("바운딩 박스를 선택해 주세요.");
// 									return
// 								}
// 								var tmp = confirm("삭제하시면 이후 프레임에 대한 데이터는 삭제됩니다. 그래도 삭제하시겠습니까?");
// 								if(tmp == true && canvas.getActiveObject() != null){
// 									var uuid = canvas.getActiveObject().uuid;
// 									delete that.data.meta[uuid];
									
// 									that.bind.keydownEvt();
// 								}
// 							}

// 						});

						$(document).off("keydown").on("keydown",function(evt){
							if(evt.keyCode == "46" || evt.keyCode == "68" && evt.ctrlKey == true){
								evt.preventDefault();
								if(canvas.getActiveObject() == null){
									alert("바운딩 박스를 선택해 주세요.");
									return
								}
								var tmp = confirm("데이터를 삭제하시겠습니까?");
								if(tmp == true && canvas.getActiveObject() != null){
									var uuid = canvas.getActiveObject().uuid;
									
									var dataId = $("#imgBBox .c_wrap .path.active").parent("li").attr("data-id");
		// 							var labelBox = $(this).parent().parent().attr("id",uuid);
									var labelBox = $("#imgBBox .category_wrap .cate_wp#"+uuid);
									if(uuid.indexOf("-") == -1){
										// call ajax
										that.computed.deleteMetaById(uuid, labelBox[0]);
									} else {
										// not call ajax
										that.computed.deleteMetaData(uuid, labelBox[0],false);	
									}
		// 							delete that.data.meta[uuid];
									
									that.bind.keydownEvt();
									//
// 									labeller.bind.evtAll();							
								}						
							}
							
							// jh.sa 210318 라벨박스, 메타 복사
							// ctrl + shift + c evt 복사
							// xrp
						    if(evt.ctrlKey == true && evt.shiftKey == true && evt.keyCode == "67"){
						    	console.log("ctrl + shift + c == copy");
						    	evt.preventDefault();
								var canv = canvas.getActiveObject();
								if(canv == null){
									alert("바운딩 박스를 선택해 주세요.");
									return;
								}
								if(canv != null){
									var copy_id = canv['uuid'];
									if(!copy_id){
										alert("복사할 라벨을 선택해 주세요.");
										return;
									}			
									// 라벨박스, 메타 복사
									that.computed.copyMetaData(copy_id);
								}
						    }
							
							// jh.sa 210323 
// 						    // ctrl + z evt undo
						    if(evt.ctrlKey == true && evt.shiftKey == false && evt.keyCode == "90"){
						    	console.log("ctrl + z == undo");
						    	evt.preventDefault();				
						    	
								that.computed.history("undo");
						    }
						    
// 						    // ctrl + shift + z evt redo
						    if(evt.ctrlKey == true && evt.shiftKey == true && evt.keyCode == "90"){
						    	console.log("ctrl + shift + z == redo");
						    	evt.preventDefault();	
						    	
								that.computed.history("redo");
						    }
							
						 	// h.lee
							// ctrl + shift + s : 저장
						    if(evt.shiftKey == true && evt.keyCode == "83"){
						    	evt.preventDefault();
						    	console.log("ctrl + shift + s == save");
								that.computed.insertMetaData();
								
								
						    }
						    
						 	// h.lee
						    // shift + < : 이전 클립으로 이동
						    if(evt.shiftKey == true && evt.keyCode == "188"){
						    	console.log("shift + < == prev clip");
						    	var currDataNum = that.data.canvasObj['currDataNum']*1-2;
								var page_size = 50;
								if(currDataNum<0){
									alert("처음 데이터입니다.");
									return;
								}
								if(currDataNum%page_size == 49){
									var page_num = Math.floor(currDataNum/page_size);
									that.computed.clearAllData();
									that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId'],currDataNum);
									return;
								}
								that.computed.initImgData(currDataNum);
						    }
						    
						    // h.lee
						    // shift + > : 다음 클립으로 이동
						    if(evt.shiftKey == true && evt.keyCode == "190"){
						    	console.log("shift + > == next clip");
						    	var currDataNum = that.data.canvasObj['currDataNum']*1;
								var page_size = 50;
								var total_size = that.pt.find(".position_wrap .total_count span").html()*1;
								if(currDataNum>=total_size){
									alert("마지막 데이터입니다.");
									return;
								}
								if(currDataNum%page_size == 0){
									var page_num = Math.floor(currDataNum/page_size);
									that.computed.clearAllData();
									that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
									return;
								}else{
									that.computed.initImgData(currDataNum);	
								}
								
								
								
						    }
						    
						 	// h.lee
						    // shift + n : 바운딩 박스 생성 
						   	if(evt.shiftKey == true && evt.keyCode == "78"){
						   		
								var uuid = that.computed.generateUUID();
								var keys = Object.keys(that.data.meta);
								
								if(that.pt.find(".category_wrap .cate_wp").length == 0){
									that.pt.find(".label_wrap .category_wrap .no_label").remove();
								} 							
								
								if(keys.length > 0){
									for(var i=0; i<keys.length; i++){
										if(keys[i] == uuid){
											uuid = that.computed.generateUUID();
										}
									}
								}
								
								var labelNo = eval(that.pt.find(".label_wrap .category_wrap").find(".cate_wp").length+1);
								
								var html = that.render.tempInitCategory(uuid);
								that.pt.find(".label_wrap .category_wrap").append(html);
								
								let color = that.data.colorHash.rgb(uuid);
								that.pt.find(".label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
								
								that.pt.find(".label_wrap .category_wrap .cate_wp").removeClass("selected");
								that.pt.find(".label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
								that.pt.find(".label_wrap .category_wrap .cate_wp").last().addClass("selected");
								that.pt.find(".label_wrap .category_wrap .cate_wp[id='"+uuid+"'].selected ").css("border-color","rgb("+color+")");
								
								var active_obj = that.data.canvas.getActiveObject();
								if(active_obj != null){
									that.data.canvas.discardActiveObject().renderAll();
								}
								
								that.data.canvasObj['isModified'] = 1;							
								that.computed.initMetaData(uuid,labelNo);

								that.computed.stackHistory(uuid,"created");
								that.bind.sideEvtCollision();
						   	}
						    
						 	// h.lee
						    // 라벨클릭 + shift + d : 바운딩 박스 삭제
							if( evt.shiftKey == true && evt.keyCode == "68"){
						 		
						 		evt.preventDefault();
						 		
						 		var labelSelect = $(".cate_wp.selected");
						 		
						 		if(labelSelect.length != 0){
						 			var check = confirm("라벨을 삭제하시겠습니까?\n삭제할 경우 삭제 사항이 자동 저장됩니다.");
						 			
						 			if(check == true){
						 				let uuid = labelSelect.attr("id");
						 				var labelBox = labelSelect.attr("id", uuid);
						 				
						 				if(!uuid){
						 					alert("삭제할 라벨을 선택해 주세요.")
						 				}
						 				if(uuid.indexOf("-") == -1 ){
						 					// call ajax
						 					that.computed.deleteMetaById(uuid, labelBox[0]);
						 					
						 				} else {
						 					// not call ajax 
						 					that.computed.deleteMetaData(uuid, labelBox[0], false);
						 				}
						 				
						 			}
						 		}
						 			
						 	}
						   	
 							// h.lee
 						 	// esc : 라벨 클릭 해제
							if( evt.keyCode == "27"){

						 		evt.preventDefault();
								
								$(".cate_wp.selected").css("border-color", "#eeeeee");
								$(".cate_wp.selected").removeClass("selected");
								
								canvas.discardActiveObject().renderAll();
						 	}
							
						});
						
					},
					
					keydownEvt2 : function(evt){
						const that = imgBBox;
						var canvas = that.data.canvas;
						$(document).off("keydown").on("keydown",function(evt){
							if(evt.keyCode == "46" || evt.keyCode == "68" && evt.ctrlKey == true){
								evt.preventDefault();
								if(canvas.getActiveObject() == null){
									alert("바운딩 박스를 선택해 주세요.");
									return
								}
								var tmp = confirm("데이터를 삭제하시겠습니까?");
								if(tmp == true && canvas.getActiveObject() != null){
									var uuid = canvas.getActiveObject().uuid;
									
									var dataId = $("#imgBBox .c_wrap .path.active").parent("li").attr("data-id");
		// 							var labelBox = $(this).parent().parent().attr("id",uuid);
									var labelBox = $("#imgBBox .category_wrap .cate_wp#"+uuid);
									if(uuid.indexOf("-") == -1){
										// call ajax
										that.computed.deleteMetaById(uuid, labelBox[0]);
									} else {
										// not call ajax
										that.computed.deleteMetaData(uuid, labelBox[0],false);	
									}
		// 							delete that.data.meta[uuid];
									
									that.bind.keydownEvt();
									//
									labeller.bind.evtAll();							
								}						
							}
						});
						
					},
					
					sideEvtCollision : function(evt) {
						const that = imgBBox;
						
						$("#imgBBox .label_wrap input[name='label_name']").on("propertychange change keyup paste input", function(e) {
							var uuid = $(this).parent().parent().attr("id");							
							that.data.meta[uuid]['category'] = $(this).val();			
							that.data.canvasObj['isModified'] = 1;		
							
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
						
						// 임시
// 						$("#imgBBox .quick_btn").off("click").on("click", function(){
// 							alert("서비스 준비중 입니다.");
// 							return false;
// 						});
						
						// DOM Event
// 						$("#imgBBox .cate_wp input").off("input").on("input", function(e){
// 							//영문, 숫자, 특수문자
// 							if($(this).val().match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
// 								alert("영문과 특수문자 및 숫자만 입력 가능합니다");
// 							}
							
// 							const str = $(this).val().replace(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/gi,"");
// 		                    if(str.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
// 									$(this).val(str.slice(0, -1));						
// 							} else {
// 									$(this).val(str);						
// 							}
// 						});
						
						$("#imgBBox .position-value").off("input").on("input", function(e){
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
						
						$("#imgBBox .label_wrap .btn_wrap .add").off("click").on("click",function(evt){
							$(this).blur();
							var uuid = that.computed.generateUUID();
							var keys = Object.keys(that.data.meta);
							
							// jh.sa 210122 
							if($("#imgBBox .category_wrap .cate_wp").length == 0){
								$("#imgBBox .label_wrap .category_wrap .no_label").remove();
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
							
							var labelNo = eval($("#imgBBox .label_wrap .category_wrap").find(".cate_wp").length+1);
							
							var html = that.render.tempInitCategory(uuid);
							$("#imgBBox .label_wrap .category_wrap").append(html);
							
							let color = that.data.colorHash.rgb(uuid);
							$("#imgBBox .label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
							
							$("#imgBBox .label_wrap .category_wrap .cate_wp").removeClass("selected");
							$("#imgBBox .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
							$("#imgBBox .label_wrap .category_wrap .cate_wp").last().addClass("selected");
							$("#imgBBox .label_wrap .category_wrap .cate_wp[id='"+uuid+"'].selected ").css("border-color","rgb("+color+")");
							
							that.data.canvasObj['isModified'] = 1;
							that.computed.initMetaData(uuid);
							// jh.sa 210325
							that.computed.stackHistory(uuid,"created");
							that.bind.sideEvtCollision();
						});
						
						// alert and meta data delete!!
						$("#imgBBox .label_wrap .category_wrap .cate_wp .delete").off("click").on("click",function(evt){
						
							var check = confirm("데이터를 삭제하시겠습니까?");
							if(check == true){
								let uuid = $(this).parent().parent().attr("id");
// 								var dataId = $(".data_item .collapse-item.active").attr("data-id");
								var dataId = $("#imgBBox .c_wrap .path.active").parent("li").attr("data-id");
								var labelBox = $(this).parent().parent().attr("id",uuid);
// 								that.computed.deleteMetaDataById(uuid,dataId);
								if(uuid.indexOf("-") == -1){
									// call ajax
									that.computed.deleteMetaById(uuid, labelBox[0]);
								} else {
									// not call ajax
									that.computed.deleteMetaData(uuid, labelBox[0],false);
								}
							}
						});
						
						// jh.sa : meta data visibility
						$("#imgBBox .label_wrap .category_wrap .cate_wp .visible").off("click").on("click",function(evt){
							let uuid = $(this).parent().parent().attr("id");
							var canv = that.computed.getCanvasObject(uuid);
							var meta = that.data.meta;
							var l_all = $("#imgBBox .label_wrap .category_wrap .cate_wp .visible");
							var b_all = $("#imgBBox .label_wrap .btn_wrap .visible");
							
							if($(this).hasClass("on")){
								$(this).removeClass("on");
								$(this).addClass("off");
								that.data.canvas.remove(canv);
								
								var off = $("#imgBBox .label_wrap .category_wrap .cate_wp .visible.off");
								if(off.length === l_all.length){
									b_all.removeClass("on");
									b_all.addClass("off");
								}								
								
							} else {
								$(this).removeClass("off");
								$(this).addClass("on");
								
								var rectObj = that.computed.getRectObject2(meta[uuid]);
								var tempRect = new fabric.Rect(rectObj);
								
								that.data.canvas.add(tempRect);
								
								var isSelected = $(this).parent().parent().hasClass("selected");
								var canvArr = that.data.canvas.getObjects();
								for(var i=0; i<canvArr.length; i++){
									if(canvArr[i]['uuid'] == uuid && isSelected){
										that.data.canvas.bringToFront(canvArr[i]);
										that.data.canvas.setActiveObject(canvArr[i]);
									}
								}
								
								var on = $("#imgBBox .label_wrap .category_wrap .cate_wp .visible.on");
								if(on.length === l_all.length){
									b_all.removeClass("off");
									b_all.addClass("on");
								}
								
							}
						});		
						
						$("#imgBBox .label_wrap .btn_wrap .visible").off("click").on("click",function(evt){
							var label_visible = $("#imgBBox .cate_wp .visible");
							
							
							if($(this).hasClass("on")){
								$(this).removeClass("on");
								$(this).addClass("off");
								
								for(var i = 0; i < label_visible.length; i++){
									if($($(label_visible)[i]).hasClass("on")){
										$($(label_visible)[i]).trigger("click");
									}
								}
							} else {
								$(this).removeClass("off");
								$(this).addClass("on");
								
								for(var i = 0; i < label_visible.length; i++){
									if($($(label_visible)[i]).hasClass("off")){
										$($(label_visible)[i]).trigger("click");
									}
								}
							}
						});						
						
						$("#imgBBox .category_wrap .cate_wp .category").off('keypress').on('keypress',function(evt){
							if(evt.keyCode == 13){
								var uuid = $(this).parent().parent().attr("id");
								that.data.meta[uuid]['category'] = $(this).val();
							}
						});
						
						// jh.sa add
						$("#imgBBox .category_wrap .cate_wp .category").off('input').on('input',function(evt){
							var uuid = $(this).parent().parent().attr("id");
							that.data.meta[uuid]['category'] = $(this).val();
						});						
						
						$("#imgBBox .category_wrap .cate_wp").off("click").on("click",function(){
							var uuid = $(this).attr("id");
							var color = that.data.colorHash.rgb(uuid);
							$("#imgBBox .label_wrap .category_wrap .cate_wp").removeClass("selected");
							$("#imgBBox .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
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
						
						// jh.sa test 
						$("#imgBBox .save_btn_wrap .save").off("click").on("click",function(e){
							$(this).blur();
							$(this).prop("disabled",true);
							setTimeout(function(){
								that.computed.insertMetaData();
							},200)
						});
						
						
						//paging evt
						$("#imgBBox .data_item .prev_page").off("click").on("click",function(){
							var page_num =  $(".data_item.show .current_page .page-link").attr("tabindex")*1-2;
							if(page_num < 0 ){
								page_num = 0;
							}
// 							var dtCate = $(".data_item.show").attr("data-cate");
// 							var isInit = true;
							that.computed.clearAllData();
							that.computed.getVideoDataList(page_num);							
						});
						
						$("#imgBBox .data_item .next_page").off("click").on("click",function(){
							var page_num =  $(".data_item.show .current_page .page-link").attr("tabindex")*1;
// 							var dtCate = $(".data_item.show").attr("data-cate");
// 							var isInit = true;
							that.computed.clearAllData();
							that.computed.getVideoDataList(page_num);
						});
						
						$("#imgBBox .pagination .page-item input.page-link").off("keypress").on("keypress",function(evt){
							
							var totalPage = $(this).parent().parent().find(".total_page a").attr("tabindex")*1;
							
							if(evt.keyCode == "13" ){
								evt.preventDefault();
								var page_num = $(this).val()*1;
								if(page_num <=0){
									page_num = 1;
								}
								if(page_num > totalPage){
									alert("총 페이지수보다 큰 페이지 이동이 불가합니다.");
									return;
								}
// 								var dtCate = $(".data_item.show").attr("data-cate");
// 								var isInit = true;
								that.computed.clearAllData();
								that.computed.getVideoDataList(page_num-1);
							}
						});
						//paging evt end
						// data area Click event end
						
						$("#imgBBox .data_list_btn").off("click").on("click", function(){
							var data_list_wrap = $("#imgBBox .data_list_wrap");
							if(data_list_wrap.hasClass("active")){
								data_list_wrap.removeClass("active");
								data_list_wrap.css("display", "none");	
							} else {
								data_list_wrap.addClass("active");
								data_list_wrap.css("display", "block");	
								data_list_wrap.attr("state", true);
							}
						});
						
						$("#imgBBox .data_list_wrap .close_btn").off("click").on("click", function(){
							var data_list_wrap = $("#imgBBox .data_list_wrap");
							data_list_wrap.removeClass("active");
							data_list_wrap.css("display", "none");	
						});
						
						// jh.sa 210121 데이터 리스트 이외 영역 클릭 시 데이터리스트 닫기
						$("#imgBBox .data_list_wrap").off("click").on("click", function(){
							var data_list_wrap = $("#imgBBox .data_list_wrap");
							data_list_wrap.attr("state", true);
						});
						
						$(".section.imgBBox.selected #wrapper").off("click").on("click", function(){
							//console.log("click");
							var data_list_wrap = $("#imgBBox .data_list_wrap");
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
						
						// jh.sa : data list image preview
						$("#imgBBox .c_wrap .preview .img_preview").off("mouseenter").on("mouseenter", function(){
							const x = $(this).offset().left + $(this).outerWidth() + 10;
					        const y = $(this).offset().top + $(this).outerHeight() - 59;
							const html = "<div class='show_img_wrap' style='position: fixed; top: "+ y +"px; left: "+ x +"px;'>"
								+ "<div class='title_wrap flex'><div class='image'></div><span class='title'></span></div>"
								+ "<div class='frame_container'>"
								+ 	"<canvas id='imgBBox-cc' width='270px' height='182px'>"
								+ "</div>"
								+ "</div>";
					        $(this).append(html);
					        
					        showLoading(".show_img_wrap");
					        const id = $(this).parents("li").find(".id").text();
					        const path = $(this).parents("li").find(".path").data("path");
					        const filename = $(this).parents("li").find(".path").text();
					        
					        $("#imgBBox .show_img_wrap .title").text(filename);
					        var canvasPreview = new fabric.Canvas("imgBBox-cc");
				 			const imgObj = new Image();
							imgObj.src = "/uploadFile/xlabeller/" + path; 
							imgObj.onload = function(){ 
// 								that.computed.rescalePreview(this);
								
							    const canvas_max_width = 270;
							    const canvas_max_height = 182;
							    
							    let scaleFactor=0;
							    if(canvas_max_height/canvas_max_width >= this.naturalHeight/this.naturalWidth){
							        scaleFactor=canvas_max_width/this.naturalWidth;
							    } else{
							        scaleFactor=canvas_max_height/this.naturalHeight;
							    }				

							    canvasPreview.setWidth(this.naturalWidth*scaleFactor);
							    canvasPreview.setHeight(this.naturalHeight*scaleFactor);
							    canvasPreview.calcOffset();
							    canvasPreview.renderAll();  
							    canvasPreview.scaleFactor = scaleFactor;
								
								canvasPreview.setBackgroundImage(imgObj.src, canvasPreview.renderAll.bind(canvasPreview), {
									scaleX: canvasPreview.scaleFactor,
									scaleY: canvasPreview.scaleFactor 
							    });
								
								hideLoading(".show_img_wrap");
							}
							imgObj.onerror = function(){
								hideLoading(".show_img_wrap");
							}	
					        
						});
						
						$("#imgBBox .c_wrap .preview .img_preview").off("mouseleave").on("mouseleave", function(){
							that.pt.find(".show_img_wrap").remove();
						});						

						// k.park 201015
						$("#imgBBox .img_list_wrap .data_list_wrap .list_table ul li .path").off("click").on("click",function(){
							var data_num = $(this).parent().attr("data-index")*1-1;
							var page_size=50;
							var currPage = $("#imgBBox #pagination .page-item.active .page-link").html()*1-1;
							var currDataNum = currPage*page_size + data_num;
							that.computed.initImgData(currDataNum);
						});
						

						$("#imgBBox #pagination .first").off("click").on("click",function(){
							that.computed.clearAllData();
							var page_num = 0;
							that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
						});
						$("#imgBBox #pagination .prev").off("click").on("click",function(){
							var page_size = 50;
							var page_num = $("#imgBBox #pagination .page-item.active .page-link").html()-2;
							if(page_num<0){
								alert("첫 페이지 입니다.");
								return false;
							}
							that.computed.clearAllData();
							that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
						});
						$("#imgBBox #pagination .page-link").off("click").on("click",function(){
							if( isNaN($(this).html()) == false){
								var page_num = $(this).html()*1-1;
								that.computed.clearAllData();
								that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
							}
						});
						$("#imgBBox #pagination .next").off("click").on("click",function(){
							var page_size = 50;
							var page_num = $("#imgBBox #pagination .page-item.active .page-link").html()*1;
							var lastPage = Math.floor($("#imgBBox .position_wrap .total_count span").html()*1/page_size);
							if(page_num>lastPage){
								alert("마지막 페이지 입니다.");
								return false;
							}
							var page = $("#imgBBox .position_wrap .total_count span").html()*1/page_size;
							if(page == page_num){
								alert("마지막 페이지 입니다.");
								return false;
							} else {
								that.computed.clearAllData();
								that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);								
							}							
							
// 							that.computed.clearAllData();
// 							that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
						});
						$("#imgBBox #pagination .last").off("click").on("click",function(){
							var page_size = 50;
							that.computed.clearAllData();
							var page_num = Math.floor($("#imgBBox .position_wrap .total_count span").html()*1/page_size);
							
							var page = $("#imgBBox .position_wrap .total_count span").html()*1/page_size;
							if(page == page_num){
								that.computed.getVideoDataList(page_num-1,that.data.canvasObj['datasetId']);
							} else {
								that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
							}							
							
// 							that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
						});
						
						$("#imgBBox .prev_data_wrap").off("click").on("click",function(){
							var currDataNum = that.data.canvasObj['currDataNum']*1-2;
							var page_size = 50;
							if(currDataNum<0){
								alert("처음 데이터입니다.");
								return;
							}
							if(currDataNum%page_size == 49){
								var page_num = Math.floor(currDataNum/page_size);
								that.computed.clearAllData();
								that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId'],currDataNum);
								return;
							}
							
							that.computed.initImgData(currDataNum);	

						});
						$("#imgBBox .next_data_wrap").off("click").on("click",function(){
							var currDataNum = that.data.canvasObj['currDataNum']*1;
							var page_size = 50;
							var total_size = $("#imgBBox .position_wrap .total_count span").html()*1;
							if(currDataNum>=total_size){
								alert("마지막 데이터입니다.");
								return;
							}
// 							setTimeout(function(){
// 								if(currDataNum%page_size == 0){
// 									var page_num = Math.floor(currDataNum/page_size);
// 									that.computed.clearAllData();
// 									that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
// 									return;
// 								}else{
// 									that.computed.initImgData(currDataNum);	
// 								}								
// 							}, 800)
							if(currDataNum%page_size == 0){
								var page_num = Math.floor(currDataNum/page_size);
								that.computed.clearAllData();
								that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
								return;
							}
							
							that.computed.initImgData(currDataNum);	

						});
						
						$("#imgBBox .img_list_wrap .name_wrap .prev_btn").off("click").on("click",function(){
							var currDataNum = that.data.canvasObj['currDataNum']*1-2;
							var page_size = 50;
							if(currDataNum<0){
								alert("처음 데이터입니다.");
								return;
							}
							if(currDataNum%page_size == 49){
								var page_num = Math.floor(currDataNum/page_size);
								that.computed.clearAllData();
								that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId'],currDataNum);
								return;
							}
							that.computed.initImgData(currDataNum);
						});
						$("#imgBBox .img_list_wrap .name_wrap .next_btn").off("click").on("click",function(){
							var currDataNum = that.data.canvasObj['currDataNum']*1;
							var page_size = 50;
							var total_size = $("#imgBBox .position_wrap .total_count span").html()*1;
							if(currDataNum>=total_size){
								alert("마지막 데이터입니다.");
								return;
							}
							if(currDataNum%page_size == 0){
								var page_num = Math.floor(currDataNum/page_size);
								that.computed.clearAllData();
								that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
								return;
							}
							
							that.computed.initImgData(currDataNum);
							
							
						});
						
						$("#imgBBox .position-value").off("keypress").on("keypress",function(evt){
							if(evt.keyCode == "13"){
								var page_size = 50;
								var targetDataNum = $(this).val()*1-1;
								var targetPageNum = Math.floor(targetDataNum*1/page_size*1)+1;
								var currPageNum = $("#imgBBox #pagination .page-item.active .page-link").html();
								var total_size = $("#imgBBox .position_wrap .total_count span").html()*1;
								if(isNaN(targetDataNum) == true){
									alert("숫자만 입력 가능합니다.");
									$(this).val(that.data.canvasObj['currDataNum']);
									return;
								}
								if(targetDataNum < 0){
									that.computed.initImgData(0);
									return false;
								}else if(targetDataNum >=total_size){
									alert("전체 데이터 수는 "+total_size+" 입니다.");
									that.computed.initImgData(total_size-1);
									return false;
								}
								if(targetPageNum != currPageNum){
									that.computed.getVideoDataList(targetPageNum-1,that.data.canvasObj['datasetId'],targetDataNum);
								}
								
								that.computed.initImgData(targetDataNum);
							}
							
						}); //paging evt end
						
						
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
								console.log("targetArr::", targetArr);
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
								//console.log("settingTargets::", settingTargets);
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
						
						// edit j.seo
						// jh.sa 210520 선택한 라벨 hide
						that.pt.find(".cate_wp .visibility").off("click").on("click", function(e){
							console.log("visibility!");
							var uuid = $(this).parents(".cate_wp")[0].id;
							//console.log("uuid::", uuid);
							var canvas = that.data.canvas;
							var o = canvas.getObjects();
							
							// 210521
							/* var check = that.computed.checkExistMeta(uuid);
							if(!check){
								alert("숨김 설정할 바운딩 박스가 없습니다.")	;						
								return;
							} */
							
							that.pt.find(".label_wrap .category_wrap .cate_wp").removeClass("selected");
							that.pt.find(".label_wrap .category_wrap .cate_wp[id='"+uuid+"']").addClass("selected");
							let color = that.data.colorHash.rgb(uuid);
							that.pt.find(".label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
							that.pt.find(".label_wrap .category_wrap .cate_wp[id='"+uuid+"'].selected ").css("border-color","rgb("+color+")");									
							
							
							$(this).toggleClass("off");
							
							if($(this).hasClass("off")){
								$(this).attr("data-id", uuid);
								that.data.meta[uuid]['visible'] = false;
								for(var i=0; i<o.length; i++){
									/* var active_obj = canvas.getActiveObject();
									console.log("active_obj::", active_obj);
									if(active_obj != null){
										canvas.discardActiveObject().renderAll();
									} */
									// 선택한 라벨만 숨기기	
							        if(o[i].uuid == uuid){
							        	canvas.discardActiveObject().renderAll();
							            o[i].visible = false;
							            o[i].selectable = false;
							            o[i].hasControls = false;
							            o[i].hasBorders = false;
							            canvas.discardActiveObject();
							        }
								}			
								canvas.renderAll();	
							} else {
								that.data.meta[uuid]['visible'] = true;
								var canvas = that.data.canvas;
								var o = canvas.getObjects();
								for(var i=0; i<o.length; i++){
						            if(o[i].uuid == uuid){
						            	o[i].visible = true;						            	
						                o[i].selectable = true;
						                o[i].hasControls = true;
						                o[i].hasBorders = true;
										canvas.bringToFront(o[i]);
										canvas.setActiveObject(o[i]);
						            }
								}			
								canvas.renderAll();									
							}							
						});

						
					},// DOM Event end
					
                    resetView : function(){
                        const that = imgBBox;
						var no_label = '<div class="no_label"><div></div><div>No Label</div><div>Please Add Label</div></div>';
						$("#imgBBox .category_wrap").html(no_label);                          
//                         $("#imgBBox .category_wrap").html("");
                        $("#imgBBox .img_list_wrap .name_wrap .file_name").html("");
                        $("#imgBBox .empty_wrap").remove();
                        const html = '<div class="empty_wrap"><div class="no_image"></div><div class="eng_text">No Data</div><div class="kor_text">you have not selected any data yet</div></div>';
                        that.pt.find("section.enrichment .canvas-container").hide();
                        that.pt.find("section.enrichment .video_wrap").append(html);
                    },					
					
				},// bind end
				computed : {
					root : null,
					checkHistory : function(uuid){
						const that = imgBBox;
						var checked = false;
						var undo = that.data.undoStack;
						var arr = [];
						if(uuid.indexOf("-") != -1){
							return false;
						}
						for(var i=0; i<undo.length; i++){
							if(uuid == undo[i].id){
								arr.push(undo[i].id);
							}
						}
						if(arr.length == 0){
							checked = true;
						}
						
						return checked;
					},

					// jh.sa 210402 edited
					history : function(mode){
						const that = imgBBox;
						var canvas = that.data.canvas;
						switch (mode){
							case "undo":
								if(that.data.undoStack.length == 0){
									console.log("불러올 undo history 없음");
									return;
								}
								that.data.pauseSaving = true;
								var state = that.data.undoStack.pop();
								var prev = that.data.undoStack[that.data.undoStack.length-1];
								if(state != null){
									that.data.redoStack.push(state);
									if(state.action == "label"){
										that.computed.modifyLabel(state, "undo");
										that.data.pauseSaving = false;
										return;
									}
									if(state.action == "created"){
										if(state.rectData == undefined || state.rectData == null){
											that.computed.historyBox(state, "undo");
											that.data.pauseSaving = false;
											return;
										}
										that.computed.historyBox(state, "undo");
									}
									if(state.action == "modified"){
// 										that.computed.updateCanvasObj(prev,"undo");
										that.computed.updateCanvasObj(state,"undo");
									}
									if(state.action == "removed"){
										that.computed.historyBox(state, "undo");
										that.computed.updateCanvasObj(state, "undo");
									}
									if(state.action == "copied"){
										that.computed.historyBox(state, "undo");
									}
									that.data.pauseSaving = false;
								}								
								break;
							case "redo":
						    	if(that.data.redoStack.length == 0){
						    		console.log("불러올 redo history 없음");
						    		return;
						    	}					
						    	that.data.pauseSaving = true;
						    	var state = that.data.redoStack.pop();
						    	var prev = that.data.undoStack[that.data.undoStack.length-1];
						    	if(state != null){
							    	that.data.undoStack.push(state);
							    	console.log("redo state", state,"\n","undo stack",that.data.undoStack,"\n","redo stack",that.data.redoStack);
									if(state.action == "label"){
										that.computed.modifyLabel(state, "redo");
										that.data.pauseSaving = false;
										return;
									}
									if(state.action == "created"){
										if(state.rectData == undefined || state.rectData == null){
											that.computed.historyBox(state, "redo");
											that.data.pauseSaving = false;
											return;										
										}
										that.computed.updateCanvasObj(state,"redo");
									}			
									if(state.action == "modified"){
										that.computed.updateCanvasObj(state,"redo");
									}						
									if(state.action == "removed"){
										that.computed.historyBox(state, "redo");
									}
									if(state.action == "copied"){
										that.computed.historyBox(state, "redo");
										that.computed.updateCanvasObj(state,"redo");
									}
									that.data.pauseSaving = false;
						    	}								
								break;
						}
					},
					
					// jh.sa 210402 
					updateCanvasObj : function(state,mode){
						const that = imgBBox;
						var canvas = that.data.canvas;
						switch (mode){
							case "undo":
								if(state.action == "removed"){
									that.computed.setHistoryCanvasObj(state);								
								} else {
									var canv = canvas.getObjects();
									for(var i=0; i<canv.length; i++){
										if(canv[i].uuid == state.id){
											if(that.data.meta[state.id] == null){
												that.computed.initMetaData(state.id);
											}										
											that.computed.setHistoryCanvasObj(state,canv[i],"undo");
										}
									}										
								}
								break;
							case "redo":
								if(that.data.meta[state.id] != null){
									if(state.action == "created" || state.action == "copied"){
										that.computed.setHistoryCanvasObj(state);
									} else {
										var canv = canvas.getObjects();
										for(var i=0; i<canv.length; i++){
											if(canv[i].uuid == state.id){
												that.computed.setHistoryCanvasObj(state,canv[i],"redo");
											}
										}
									}
								} 
								break;
						}
					},
					
					// jh.sa 210405
					// xr 
					setHistoryCanvasObj : function(state, canvObj, mode){
						const that = imgBBox;
						var canvas = that.data.canvas;
						
						if(canvObj != null){
							// jh.sa 210406 다른 id를 가진 객체와 병행 작업 시 충돌 방지
							if(state.action == "modified" && mode == "undo"){
								canvObj.left = state.prevRect.left;
								canvObj.top = state.prevRect.top;
								canvObj.width = state.prevRect.width;
								canvObj.height = state.prevRect.height;
								canvObj.selectable = true;								
							} else {
								canvObj.left = state.rectData.left;
								canvObj.top = state.rectData.top;
								canvObj.width = state.rectData.width;
								canvObj.height = state.rectData.height;
								canvObj.selectable = true;								
							}

							
							that.computed.saveMetaData(canvObj,canvObj.uuid);
							var newRect = that.computed.rescale(that.data.meta[canvObj.uuid]['rectData'],true);
							that.render.renderCropImgIntoLabel(canvObj.uuid,newRect);		
							
							canvObj.setCoords();
							canvas.renderAll();								
						} else {
							var temp = {
									uuid : state.id,
									left : state.rectData.left,
									top : state.rectData.top,
									width : state.rectData.width,
									height : state.rectData.height
								}					    		
								var rectObj = that.computed.getRectObject(state.id,temp);
						    	that.computed.initRect(state.id,rectObj);	
						    	that.computed.saveMetaData(rectObj,state.id);
						    	var newRect = that.computed.rescale(rectObj,true);							    	
						    	that.render.renderCropImgIntoLabel(state.id,newRect);							
						}
					},
					
					// jh.sa 210402 
					modifyLabel : function(state, mode){
						const that = imgBBox;
						if(state.label_id != null && state.category != null || state.label_id != null && state.category != "" ){
							switch (mode){
								case "undo":
					    			that.pt.find(".cate_wp#"+state.id).find("input[name='label_name']").val("");
					    			that.data.meta[state.id]["label_id"] = null;
									break;
								case "redo":
					    			that.pt.find(".cate_wp#"+state.id).find("input[name='label_name']").val(state.category);
					    			that.data.meta[state.id]["label_id"] = state.label_id;
					    			that.data.meta[state.id]["category"] = state.category;			
									break;
							}
						}
					},
					
					// jh.sa 210402 
					historyBox : function(state, mode){
						const that = imgBBox;
						var canvas = that.data.canvas;
						switch (mode){
							case "undo":
								if(state.action == "removed"){
									if(that.pt.find(".cate_wp#"+state.id).length == 0){
										that.computed.setHistoryBox(state);
									}									
								} else {
									that.computed.removeHistoryBox(state);
								}
								break;
							case "redo":
								if(state.action == "removed"){
									that.computed.removeHistoryBox(state);
								} else {
									if(that.pt.find(".cate_wp#"+state.id).length == 0){
										that.computed.setHistoryBox(state);
									}											
								}
								break;
						}						
					},
					
					// jh.sa 210405
					setHistoryBox : function(state){
						const that = imgBBox;
						that.pt.find(".label_wrap .category_wrap .no_label").remove();
	    				that.computed.initMetaData(state.id);
	    				
	    				var html = that.render.tempInitCategory(state.id);
	    				that.pt.find(".label_wrap .category_wrap ").append(html);
	    				
	    				var color = that.data.colorHash.rgb(state.id);
						that.pt.find(".label_wrap .category_wrap [id='"+state.id+"'] .color").css("background-color","rgb("+color+")");
						if(that.data.meta[state.id]['category'] != null){
							that.pt.find(".label_wrap .category_wrap [id='"+state.id+"'] .category").val(that.data.meta[state.id]['category']);
						} else {
							that.pt.find(".label_wrap .category_wrap [id='"+state.id+"'] .category").val(state.category);
							that.data.meta[state.id]['label_id'] = state.label_id;
							that.data.meta[state.id]['category'] = state.category;
							// 서버에 저장된 메타데이터를 지울때 ajax 태우는거 수정되면 살리기
							// 현재는 삭제하면 데이터 검수상태가 대기로 바뀌고, 다시 복원된 데이터로 저장하려해도 오류가 생겨서 막아둔 상태.
// 							if(state.rejectedInfo != null){			
// 								that.data.meta[state.id]['confirmStatus'] = state.confirmStatus;
// 								that.data.meta[state.id]['rejectedInfo'] = state.rejectedInfo;
// 							}
						}						
					},
					
					// jh.sa 210405
					removeHistoryBox : function(state){
						const that = imgBBox;
						var canvas = that.data.canvas;
						var canv = canvas.getObjects();
						var arr = [];
						for(var i=0; i<canv.length; i++){
							// 캔버스에서 객체 지우고 우측 라벨박스 미리보기도 지우기 
							if(canv[i].uuid == state.id){
									arr.push(canv[i]);
									that.data.meta[state.id].rectData = [];
									canvas.remove(canv[i]);
									canvas.renderAll();
									var crop = that.pt.find(".cate_wp#"+state.id).find(".crop_img");
									var ctx = crop[0].getContext('2d');
									var panelW = 200;
									var panelH = 200;
									ctx.clearRect(0,0,panelW,panelH);
//										console.log("ctx: ", ctx);
							}
							
						}
						// 라벨박스만 남아있을 때 라벨박스, 메타 삭제
						if(arr.length == 0 || state.action == "copied" || state.action == "removed"){
							that.pt.find(".cate_wp#"+state.id).remove();
							delete that.data.meta[state.id];
						}	
						
						if(that.pt.find(".category_wrap .cate_wp").length == 0){
							var no_label = '<div class="no_label"><div></div><div>라벨 없음</div><div>라벨을 추가해주세요.</div></div>';
							that.pt.find(".label_wrap .category_wrap ").html(no_label);							
						}
					},
					
					// jh.sa 210402 edited
					// jh.sa 210323 
					stackHistory : function(uuid,action,prevRect){
						const that = imgBBox;
						var meta = that.data.meta;
						var canvas = that.data.canvas;
						var pause_saving = that.data.pauseSaving;
						var undo_stack = that.data.undoStack;
						var redo_stack = that.data.redoStack;
						
						if(uuid == null || action == null || uuid == undefined || action == undefined){
							return;
						}
						
						if(!pause_saving){
// 					        undo_stack.push(JSON.stringify(canvas));
					        that.data.redoStack = [];
					        var data = JSON.parse(JSON.stringify(meta[uuid]));
					        if(action == "created"){
					        	data.action = "created";
					        } else if(action == "modified"){
					        	data.action = "modified";		
					        	if(prevRect != null){
					        		data.prevRect = prevRect;
					        	}
					        } else if(action == "removed"){
					        	data.action = "removed";					        	
					        } else if(action == "label"){
					        	data.action = "label";
					        } else if(action == "loaded"){
					        	data.action = "loaded";
					        } else if(action == "copied"){
					        	data.action = "copied";
					        }
					        undo_stack.push(data);
					        console.log("undoStack from stackHistory: ", undo_stack);
					        console.log("redoStack from stackHistory: ", redo_stack);
						}
					},
					// jh.sa 210318 라벨박스, 메타 복사
					copyMetaData : function(copyId){
						const that = imgBBox;	
						var meta = that.data.meta;
						var uuid = that.computed.generateUUID();
						that.data.canvasObj['isModified'] = 1;
						that.data.pauseSaving = false;
						console.log("copyMetaData copy data : ", meta[copyId]);

						that.data.meta[uuid] = JSON.parse(JSON.stringify(meta[copyId]));
						that.data.meta[uuid]["id"] =  uuid;
						that.data.meta[uuid]["confirmStatus"] =  "0";
						that.data.meta[uuid]["rejectedInfo"] =  null;						
						
						that.computed.initMetaRect(uuid);
						that.render.renderCopyMeta(uuid);
					},
					// jh.sa 210318 선택한 라벨 제외 hide
					visibleMeta : function(uuid){
						const that = imgBBox;
						var canvas = that.data.canvas;
						var o = canvas.getObjects();
						for(var i=0; i<o.length; i++){
						    o[i].visible = true;
				            if(o[i].uuid == uuid){
				                o[i].selectable = true;
								canvas.bringToFront(o[i]);
								canvas.setActiveObject(o[i]);
				            }
						}			
						canvas.renderAll();							
					},					
					initRect(uuid,obj) { //create new rect data
						// obj => {top/left/width/height}
						const that = imgBBox;
						var tempRect = {};
						tempRect = new fabric.Rect( obj );
						
						that.data.canvas.add(tempRect);
						that.data.canvas.setActiveObject(tempRect);
						that.data.canvas.renderAll();
					},
					
					// k.park 20201013
					initMetaRect(uuid) { // from Server Data, initiate meta rect data
						const that = imgBBox;
						var meta = that.data.meta;
						
						if(!uuid){
							return false;
						}
						
						var rectObj = this.getRectObject(uuid,meta[uuid]['rectData']);
						var tempRect = new fabric.Rect( rectObj );	
						that.data.canvas.add(tempRect);
						
					}, //init rect data end
					
					deleteMetaObject(uuid, btn){
						const that = imgBBox;
						
						if(!uuid){
							return false;
						}
						
						btn.parent().parent().attr("id",uuid).remove();
						delete that.data.meta[uuid];
						
						var canv = that.computed.getCanvasObject(uuid);
						that.data.canvas.remove(canv);							
						
					},
					
					// get/init rectangle object
					// k.park 20201013
					getRectObject(uuid,rectData) {
						const that = imgBBox;
						var object = {};
						
						object = {
								left : rectData.left,
								top : rectData.top,
								width : rectData.width,
								height : rectData.height,
								uuid : uuid,
// 								stroke : "rgb("+that.data.colorHash.rgb(meta.uuid)+")",
// 						        fill: "rgb("+that.data.colorHash.rgb(meta.uuid)+",0.2)",
								stroke : "rgb("+that.data.colorHash.rgb(uuid)+")",
						        fill: "rgb("+that.data.colorHash.rgb(uuid)+",0.2)",
						        type : 'rect',
						        strokeWidth : 2,
						        strokeWidthUnscaled:2,
						        lockRotation : true,
								noScaleCache : false,
						        lockUniScaling : false,
						        lockScalingFlip : true,
						        transparentCorners : false,
						        strokeUniform : true,
// 						        cornerColor : "rgb("+that.data.colorHash.rgb(meta.uuid)+")",
						        cornerColor : "rgb("+that.data.colorHash.rgb(uuid)+")",
						        cornerSize : 10,
						}
						
						return object;	
					},
					
					getRectObject2(meta) {
						const that = imgBBox;
						var object = {};
						
						object = {
								left : meta.rectData.left,
								top : meta.rectData.top,
								width : meta.rectData.width,
								height : meta.rectData.height,
								uuid : meta.id,
								stroke : "rgb("+that.data.colorHash.rgb(meta.id)+")",
						        fill: "rgb("+that.data.colorHash.rgb(meta.id)+",0.2)",
						        type : 'rect',
						        strokeWidth : 2,
						        strokeWidthUnscaled:2,
						        lockRotation : true,
								noScaleCache : false,
						        lockUniScaling : false,
						        lockScalingFlip : true,
						        transparentCorners : false,
						        strokeUniform : true,
						        cornerColor : "rgb("+that.data.colorHash.rgb(meta.id)+")",
						        cornerSize : 10,
						}
						
						return object;	
					},		
					
					initImgData : function(dataNum){
						const that = imgBBox;
						let canvas = that.data.canvas;
						var isModified = that.data.canvasObj['isModified'];
						var msg = "데이터 이동 시 저장되지 않은 라벨은 손실됩니다. 계속하시겠습니까?";						
						
						if(isModified == 1){
							if(!confirm(msg)){
								return false;
							}
						}							
						$("#imgBBox .category_wrap").html("");
						that.computed.clearAllData();
						that.computed.getDataByNum(dataNum);
						
						// s.kim 210506
						// zoom 초기화 
						that.data.undoStack = [];
						that.data.redoStack = [];
						canvas.setZoom(1);
						canvas.viewportTransform[4] = 0;
						canvas.viewportTransform[5] = 0;
						canvas.renderAll();
					},					
					
					// create meta data
					// k.park 20201013
					initMetaData(uuid) {
						const that = imgBBox;
						
						that.data.meta[uuid] = {
							id : uuid,
							category : null,
						};
						
					},// create meta data end
					
					clearAllData(){
						const that = imgBBox;
						that.data.scaleFactor = {origWidth:0, origHeight:0, ratio:1, minBboxSize:0};
						that.data.canvasObj.isModified = 0;
						this.clearCanvas();
						this.clearMeta();
						this.clearRect();
					},
					
					clearCanvas(){
						const that = imgBBox;
						that.data.canvasObj['currDataNum'] = null;
						that.data.canvas.clear();
					},
					
					clearMeta(){
						const that = imgBBox;
						that.data.meta = {};
					},
					
					clearRect(){
						const that = imgBBox;
						that.data.rect = {};
					},
					
					// jh.sa 201028 추가 
					getDatasetById : function(id){
						var that = imgBBox;
						$("#loader").show();
						$.ajax({
							url :  baseUrl + "data/getDatasetById.json",
						   	data : { dataset_id : id },
						   	type : "POST",
						   	success : function(res){
						   		//$("#loader").hide();
						   		// ㅌ
						   		console.log("=====getDatasetById=====", res);
								if(res.result.code == "200"){
									var media_type = res.result.data.media_type;
									var label_type = res.result.data.label_type;
									var nodes = wsObj["labeller"].dir.getSelectedNodes();
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
					// k.park 20201013
					getVideoDataList : function(page,dataSet,currDataNum){	
						const that = imgBBox;
						$("#loader").show();
						var deferred = $.ajax({
							url : baseUrl + "data/getDataList.json",
							data : { page_num:page, dataset_id : dataSet },
							type : "POST",
							traditional : true,	
							success : function(res){
// 								console.log(":getDataList:",res);
							},
							error : function(err){
								$("#loader").hide();
								console.log(":ERROR:",err);
							}
						});
						
						Promise.resolve(deferred).then(function(data){
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
									addImg.init(nodes[0]);
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
								that.render.updateListPage(temp,startPage,page_size,total_size);
								if(!currDataNum){
									that.render.renderImageByData(temp[0],total_size);	
								}else{
									that.render.renderImageByData(temp[currDataNum%page_size],total_size);
								}
								
								
							}
							
							
						});
					},
					
					getDataByNum(dataNum){
						const that = imgBBox;
						$("#loader").show();
						$.ajax({
							url : baseUrl + "data/getDataByNum.json",
							data : {dataset_id:that.data.canvasObj['datasetId'],data_num : dataNum},
							type : "POST",
							traditional : true,
							success : function(res){
								$("#loader").hide();
// 								console.log(":SUCCESS: getDataByNum",res);
								that.data.canvasObj['currDataNum'] = res.dataVO.data_num*1+1;
								that.render.renderImageByData(res.result.data);
							},
							error : function(err){
								$("#loader").hide();
								console.log(":ERROR:",err);
							}
						});
					},					
					
					// k.park 20201013
					getMetaByDataId(dataId){
						const that = imgBBox;
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
							}
// 							var temp = [];
							var result = data.result.data;
							
							// 생성된 라벨 총 개수 
							$("#imgBBox .label_wrap .label_title span").html(result.length);
                            // jh.sa 210122
							if(result.length > 0){
								that.render.initMetaFromData(result);
							} else {
								var no_label = '<div class="no_label"><div></div><div>No Label</div><div>Please Add Label</div></div>';
								$("#imgBBox .category_wrap").html(no_label); 	
								$("#loader").hide();
								$("#imgBBox .label_wrap .btn_wrap .add").show();
							}
							
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
					// k.park 20201013
					insertMetaData(){
						const that = imgBBox;
						var meta = that.data.meta;
						var keys = Object.keys(meta);
						var data = [];
						
						// 수정!
// 						var dataId = $(".data_item .collapse-item.active").attr("data-id");
						var dataId = that.data.canvas.dataId;
						if(!dataId){
							alert("데이터를 선택해 주세요.");
							$("#imgBBox .save").prop("disabled",false);
							return false;
						}
						
						$("#loader").show();
						for(var i=0; i<keys.length; i++){
							if(!meta[keys[i]]['rectData']){
								alert("바운딩박스를 그려주세요.");
								$("#loader").hide();
								$("#imgBBox .save").prop("disabled",false);
								return false;
							}
							if(meta[keys[i]]['category'] == ""){
								alert("라벨명을 입력해주세요.")
								$("#loader").hide();
								$("#imgBBox .save").prop("disabled",false);
								return false;
							}
							
							that.computed.checkRectData(meta[keys[i]]['rectData']);
							
							
							var temp = that.computed.rescale(meta[keys[i]]['rectData'],true);
							
							// jh.sa 201126 : 가장자리 쪽에 바운딩 박스를 그린 경우 width, height 값의 오차 조정 
// 							var ow = that.data.scaleFactor.origWidth;
// 							var oh = that.data.scaleFactor.origHeight;
// 							// 우측 가장자리 
// 						    if((temp.left + temp.width) > ow){
// 						        temp.width = ow - temp.left;
// 						    }
// 							// 하단 가장자리
// 						    if((temp.top + temp.height) > oh){
// 						        temp.height = oh - temp.top;
// 						    }
							
							
							// 수정 예정 -> for문 확인
							var tmpRect = temp['left']+','+temp['top']+','+temp['width']+','+temp['height'];
							data.push({
								meta_id : meta[keys[i]]["id"],
								label : meta[keys[i]]['category'],
								info : tmpRect,	
							});
							
						}
						
						var ajaxData = {
							label_type : "IMAGE_BBOX",
							data_id : dataId,
							data : JSON.stringify(data)
						}
						
						if(data.length <=0){
							alert("저장할 데이터가 없습니다.");
							$("#loader").hide();
							$("#imgBBox .save").prop("disabled",false);
							return false;
						}
						
						$.ajax({
							url : baseUrl + "meta/insertMeta.json",
							data : ajaxData,
							type : "POST",
							traditional : true,
							timeout : 120000,
							success : function(res){
								$("#imgBBox .save").prop("disabled",false);
 								/* console.log("SUCCESS!",res); */
 								$("#loader").hide();
								if(res.result.code == "3301"){
									alert(res.result.data);
									location.href = baseUrl + "login";
									return false;
								}
								if(res.result.code == "200"){
									alert(res.result.data);
									$("#imgBBox .category_wrap").html("");
									that.data.canvasObj.isModified = 0;
									that.computed.initImgData(that.data.canvasObj['currDataNum']*1-1);
									that.computed.updateDataset(that.data.canvasObj['datasetId'], ajaxData['data_id']);
									return false;
								}else{
									alert(res.result.data);
								}
							},
							error : function(err){
								$("#imgBBox .save").prop("disabled",false);
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
								$("#loader").hide();
	//  						console.log("=======updateDataset======", res);
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
	 					const that = imgBBox;
	 					$("#loader").show();
	 					let result;
	 					$.ajax({
		 				url :  baseUrl + "data/getLastCursor.json",
		 				data : {dataset_id : dataset_id * 1},					//	id => dataset_id(0921)
		 				type : "GET",
		 				async : false,
		 				success : function(res){
		 					console.log("=====getLastCursor=====",res);
		 					$("#loader").hide();
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
					
					// load image with getting img info and modifying scale factor
					loadImage : function(dataAddr){
						const that = imgBBox;
						var canvas = that.data.canvas;
						var tmpObj = {};
						var tmpImage = new Image();
						
// 						tmpImage.src = '<c:url value="'+dataAddr+'" />';
						tmpImage.src = dataAddr;
						
						tmpImage.onload = function(){
							tmpObj = {
								width : this.naturalWidth,
								height : this.naturalHeight,
							};
							
							//
							that.computed.rescaleTempImg(this);			// jh.sa
							//
							
							// after modifying scale factor, then laod image
							$.when(that.computed.getScaleFactor(tmpObj)).done(function(){
								
								canvas.setHeight(tmpObj.height*that.data.scaleFactor.ratio);
								canvas.setBackgroundImage(dataAddr,canvas.renderAll.bind(canvas),{
									scaleX : that.data.scaleFactor.ratio,
									scaleY : that.data.scaleFactor.ratio,
								});	
								// k.park 20201013
								that.computed.getMetaByDataId(canvas.dataId);
								// jh.sa 210226 tag
								that.computed.getLabelGroup(canvas.dataId);
							});
							
							canvas.imgInfo = tmpImage;
							
						}
					},				
					
					// jh.sa 210226 tag
					getLabelGroup : function(dataId){
						const that = imgBBox;
						
						var tagset = [];
						var ajaxData = {
							data_id : dataId		
						};
						$.ajax({
							url :  baseUrl + "data/getLabelGroup.json",
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
									//$("#imgBBox .label_wrap .label_title span").html(tagset.length);
									/* let label_length = $(".category_wrap .cate_wp").length;
									console.log("label_length : " + label_length);
									$("#imgBBox .label_wrap .label_title span").html(label_length); */
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
						const that = imgBBox;
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
					
					// gap between real video size and web page
					getScaleFactor : function(imgObj){
						const that = imgBBox;
						var minBboxSize = 10;
// 						var imgObj = this.checkImageSize(dataAddr);
						// 실제 비디오 크기 기준
						// scaleFactor > 1 : 실제 비디오가 캔버스 크기보다 큼
						// scaleFactor < 1 : 실제 비디오가 캔버스 크기보다 작음
						that.data.scaleFactor.origWidth = imgObj['width'];
						that.data.scaleFactor.origHeight = imgObj['height'];
						that.data.scaleFactor.ratio = $("#imgBBox-canvas").width() / that.data.scaleFactor.origWidth;
						that.data.scaleFactor.minBboxSize = that.data.scaleFactor.ratio * minBboxSize;
						
					}, // scalefactor end
					
					// re-size rect on canvas
					rescale : function(rectData,isSave){
						const that = imgBBox;
						var scaledRatio = that.data.scaleFactor.ratio;
						var tempData = [];
						
						if(!isSave){
							tempData = {};
							tempData.top = rectData.top*scaledRatio;
							tempData.left = rectData.left*scaledRatio;
							tempData.width = rectData.width*scaledRatio;
							tempData.height = rectData.height*scaledRatio;
// 							for(var i=0; i<rectData.length; i++){
// 								tempData[i] = {};
// 								tempData[i].top = rectData[i].top*scaledRatio;
// 								tempData[i].left = rectData[i].left*scaledRatio;
// 								tempData[i].width = rectData[i].width*scaledRatio;
// 								tempData[i].height = rectData[i].height*scaledRatio;
// 								tempData[i].status = rectData[i].status;
// 							}
						}else{
							tempData = {};
							tempData.top = rectData.top/scaledRatio;
							tempData.left = rectData.left/scaledRatio;
							tempData.width = rectData.width/scaledRatio;
							tempData.height = rectData.height/scaledRatio;
// 							for(var i=0; i<rectData.length; i++){
// 								tempData[i] = {};
// 								tempData[i].top = rectData[i].top/scaledRatio;
// 								tempData[i].left = rectData[i].left/scaledRatio;
// 								tempData[i].width = rectData[i].width/scaledRatio;
// 								tempData[i].height = rectData[i].height/scaledRatio;
// 								tempData[i].status = rectData[i].status;
// 							}
						}
						
						
						return tempData;
						
					}, // re-size rect on canvas end
					
					// jh.sa : rescale temp base image
					
					rescaleTempImg(img,w,h){
						const that = imgBBox;
						
						const canvas_max_width = 800;
						const canvas_max_height = 600;
						
						if(w != null && h != null){
							canvas_max_width = w;
							canvas_max_height = h;        		
						}
						
						// canvas 최대 너비와 높이에 맞춰 원본 이미지 비율대로 이미지 크기 설정
						let scaleFactor = 0;
						if(canvas_max_height/canvas_max_width >= img.naturalHeight/img.naturalWidth  ){
							scaleFactor = canvas_max_width/img.naturalWidth;
						} else {
							scaleFactor = canvas_max_height/img.naturalHeight;
						}
						
						let imgInfo = that.data.scaleFactor;
						imgInfo.scaleFactor = scaleFactor;
						imgInfo.width = img.naturalWidth;
						imgInfo.height = img.naturalHeight;					
						
						that.data.canvas.setWidth(img.naturalWidth*scaleFactor);
						that.data.canvas.setHeight(img.naturalHeight*scaleFactor);
						that.data.canvas.calcOffset();
						that.data.canvas.renderAll();
// 						$("#imgBBox #imgBBox-labeller").height(img.naturalHeight*scaleFactor);						
					},					
					
					// save rect all data
					// k.park 20201013
					saveMetaData : function(newRect,uuid){
						window.getSession();
						const that = imgBBox;
						var meta = that.data.meta;
						var keys = Object.keys(meta);
						
						var tempRect = {
							top : newRect.top,
							left : newRect.left, 
							width : newRect.width, 
							height : newRect.height, 
						}
						meta[uuid]['id'] = uuid;
						meta[uuid]['rectData'] = tempRect;
						meta[uuid].category = $("#imgBBox .category_wrap [id="+uuid+"] .category").val();
						
					},	
					
					// k.park 20201013
					deleteMetaById(uuid, labelBox){
						const that = imgBBox;
						$("#loader").show();
						$.ajax({
							url : baseUrl + "meta/deleteMetaById.json",
							data : {meta_id:uuid},
							type : "POST",
							traditional : true,
							success : function(res){
								console.log("=====deleteMetaById=====", res)
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
					
					// k.park 201015
					deleteMetaData(uuid,labelBox,isAjax){
						const that = imgBBox;
						var label_name = $(labelBox).find("input").val();
						if(!uuid){
							return false;
						}
						labelBox.remove();
						
						// jh.sa 210122
						if($("#imgBBox .category_wrap .cate_wp").length == 0){
							var no_label = '<div class="no_label"><div></div><div>No Label</div><div>Please Add Label</div></div>';
							$("#imgBBox .label_wrap .category_wrap ").html(no_label);
							that.data.canvasObj.isModified = 0;
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
						const that = imgBBox;
						var canvasObjs = that.data.canvas.getObjects();
						var tempRect;
						
						for(var i=0; i<canvasObjs.length; i++){
							if(canvasObjs[i].uuid == uuid){
								tempRect = canvasObjs[i];
							}
						}
						return tempRect
					},		
					
					
                    checkRectData : function(rectData) {
                        const that = imgBBox;           
                        var ow = that.data.scaleFactor.origWidth;
                        var oh = that.data.scaleFactor.origHeight;               
                        var sf = that.data.scaleFactor.ratio;  
                        var minBboxSize = that.data.scaleFactor.minBboxSize;

                        // 우측 가장자리 
                        if(((rectData.left / sf) + (rectData.width / sf)) > ow){
                        	rectData.width = (ow * sf) - rectData.left;
                            if(rectData.width < minBboxSize){
								const tw = rectData.width;                                	
                            	rectData.width = minBboxSize;
                            	rectData.left = rectData.left - (minBboxSize-tw);
                            }
                        }
                        // 하단 가장자리
                        if(((rectData.top / sf) + (rectData.height / sf)) > oh){
                        	rectData.height = (oh * sf) - rectData.top;
                            if(rectData.height < minBboxSize){
                            	const th = rectData.height;
                            	rectData.height = minBboxSize;
                            	rectData.top = rectData.top - (minBboxSize-th);                                	
                            }                        	
                        }    
                        
                    },					

					
				}, // computed end
				
				// draw something
				render : {
					// jh.sa 210318 라벨박스, 메타 복사
					renderCopyMeta : function(uuid){
						const that = imgBBox;
						var meta = that.data.meta;
						
						let html = that.render.tempInitCategory(uuid);
						that.pt.find(".label_wrap .category_wrap ").append(html);
						
						var newRect = that.computed.rescale(meta[uuid]['rectData'],true);
						that.render.renderCropImgIntoLabel(uuid,newRect);
						
						let color = that.data.colorHash.rgb(uuid);
						that.pt.find(".label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
						that.pt.find(".label_wrap .category_wrap [id='"+uuid+"'] .category").val(meta[uuid]['category']);	
						
						that.computed.stackHistory(uuid,"copied")
						that.bind.sideEvtCollision();
					},	
					updateListPage(temp,startPage,page_size,total_size){
						const that = imgBBox;
						var totalPage = Math.ceil(total_size * 1 / page_size);
						
						if($("#imgBBox #pagination").data("twbs-pagination")){
							$("#imgBBox #pagination").twbsPagination('destroy');
						}
						$("#imgBBox #pagination").twbsPagination({
							  totalPages: totalPage,
							  visiblePages: 5,
							  first:"<<",
							  prev:"<",
							  next:">",
							  last:">>",
							  startPage: startPage,
// 							  onPageClick: function (event, total_size) {
// 								  that.render.drawDataList(temp,total_size, page_num, page_size);
// 							  }
						});
						that.render.drawDataList(temp,total_size);
					},					
					
					/*
					* drawDataList
					*/
					drawDataList(data, total_size){
						const that = imgBBox;
						
						var total = $("#imgBBox .data_list_wrap .data_total span");
						var target = $("#imgBBox .list_table .c_wrap");
						var html = "";
						
						total.html(total_size);
						target.html("");
						for(var i=0; i < data.length; i++){
							html += "<li class='flex' data-id='" + data[i].data_id + "' data-index='" + (i+1) + "'>";	// (i+1) 부분은 수정필요
							html += " <div class='preview'><div class='img_preview'></div></div>";
							html += " <div class='id'>" + data[i].data_id + "</div>";
							html += " <div class='path filter_color' data-path='"+data[i].path+"'title='"+data[i].filename+"'>" + data[i].filename + "</div>";
							// k.park 201015
							html += " <div class='label_cnt'>" + data[i]['meta_cnt'] + "</div>";
							html += "</li>";
						}
						
						target.append(html);
					},				
					
					renderImageByData(data,total_size){
						const that = imgBBox;
						
						
						that.data.canvas['dataId'] = data['data_id'];
						var dataAddr = '/uploadFile/xlabeller/'+data.path;
						
// 						$("#imgBBox .prog_bar .name_wrap .video_name").html(data['filename']);
						$("#imgBBox .img_list_wrap .name_wrap .file_name").html(data['filename']);
						$("#imgBBox .img_list_wrap .name_wrap .file_name").attr("title",data['filename']);
						$("#imgBBox .list_table .c_wrap .path").removeClass("active");
						$("#imgBBox .list_table .c_wrap [data-id='"+data['data_id']+"'] .path").addClass("active");
						$("#imgBBox .list_table .c_wrap [data-id='"+data['data_id']+"'] .label_cnt").html(data['meta_cnt']);
						$("#imgBBox .position_wrap .position-value").val(that.data.canvasObj['currDataNum']);
						
						if(total_size){
							$("#imgBBox .position_wrap .total_count span").html(total_size);
						}
						
//							that.computed.adjustVideoSrc(dataAddr,fps);
						that.pt.find(".empty_wrap").remove();
						that.pt.find("section.enrichment .canvas-container").show();
						that.render.adjustArea();
						that.computed.loadImage(dataAddr);
						that.render.checkWindowWidth();
						that.bind.sideEvtCollision();
						
					},					
			
					
					// function move rect
					moveRectOnCanvas(uuid,arrNum){
						const that = imgBBox;
						
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
					
					
					// k.park 20201013
					initMetaFromData(result){
						const that = imgBBox;
						var meta = that.data.meta;
						var keys = [];
						var pt = that.pt;
						
						$("#imgBBox .label_wrap .category_wrap").empty();
						
						for(let i=0; i<result.length; i++){
							
							var tmpRectData = {
								left:result[i].info.split(",")[0],
								top:result[i].info.split(",")[1],
								width:result[i].info.split(",")[2],
								height:result[i].info.split(",")[3],
							}
							var rectData = that.computed.rescale(tmpRectData);
							
							meta[result[i]['meta_id']] = {
								id : result[i]['meta_id'],
								rectData : rectData,
								category : result[i]['label']
							}
							keys.push(result[i]['meta_id']);
						};
						
						for(var i=0; i<keys.length; i++){
							that.computed.initMetaRect(keys[i]);
						}
						
						that.render.renderCate();
						$("#imgBBox .label_wrap .btn_wrap .add").show();
						$("#imgBBox .label_wrap .category_wrap .cate").removeClass("selected");
						$("#imgBBox .label_wrap .category_wrap .cate").last().addClass("selected");
						$("#loader").hide();
					},					
					
					// in labeller tab
					// k.park 20201013
					tempInitCategory(uuid){
						const that = imgBBox;
						
// 						var html = '<div class=" cate_wp  " id="'+uuid+'" no="'+labelNo+'">';
						var html = '<div class=" cate_wp  " id="'+uuid+'">';
						html += '	<div class="cate_header col-12 flex sb p-1">';
						html += '		<div class="color  "><div class="visibility"></div></div>';
// 						html += '		<button  class="start_frm btn btn-info">첫점</button>';
// 						html += '		<button class="end_frm btn btn-info">끝점</button>';
// 						html += '       <div class="visible on"></div>';							// jh.sa
						html += '		<button class="delete btn btn-danger ">Delete</button>';
						html += '	</div>';
						html += '	<div class="w-100"></div>';
						html += '	<div class="col-12 text-center p-1">';
						html += '		<input type="text" class="form-control category" name="label_name" onkeyUp="noKor(event);noSpaceForm(this);" onchange="noSpaceForm(this);"/>';
						html += '	</div>';
						html += '	<div class="col-12 text-center p-1 crop_wrap"><canvas class="crop_img"></canvas></div>';
						
						html += '</div>';
						
						return html;
					},					
					
					// render crop Image from canvas into the Label Box(category_wrap)
					renderCropImgIntoLabel(uuid,newRect){		// 좌표값,
						const that = imgBBox;
						var scaleRatio = that.data.scaleFactor.ratio;

						var pt = $("#imgBBox .label_wrap .category_wrap .cate_wp[id="+uuid+"]").find(".crop_img");	// canvas
						var ctx = pt[0].getContext('2d');
						
						var panelW = 180;
						var panelH = 105;
						
						var newWidth = 0;
						var newHeight = 0;
						
						var scaleW = newRect.width/panelW;
						var scaleH = newRect.height/panelH;
						
						if(scaleW>=scaleH){
							newWidth = newRect.width/scaleW;
							newHeight = newRect.height/scaleW;
						}else{
							newWidth = newRect.width/scaleH;
							newHeight = newRect.height/scaleH;
						}
						
						pt[0].width = newWidth;
						pt[0].height = newHeight;
						
						ctx.clearRect(0, 0, panelW, panelH);
						ctx.drawImage(that.data.canvas.imgInfo,newRect.left,newRect.top,newRect.width,newRect.height,0,0,newWidth,newHeight);
						
					},
					
					// k.park 20201013
					renderCate() { //drawing category from meta in imgBBox tab
						const that = imgBBox;
						var meta = that.data.meta;
						var metaKeys = Object.keys(meta);
						var pt = that.pt;
						
						for(var i=0; i<metaKeys.length; i++){
							
							var uuid = meta[metaKeys[i]]['id'];
							
							let html = that.render.tempInitCategory(uuid);
							$("#imgBBox .label_wrap .category_wrap ").append(html);
							
							var newRect = that.computed.rescale(meta[uuid]['rectData'],true);
							that.render.renderCropImgIntoLabel(uuid,newRect);
							
							let color = that.data.colorHash.rgb(uuid);
							$("#imgBBox .label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
							$("#imgBBox .label_wrap .category_wrap [id='"+uuid+"'] .category").val(meta[metaKeys[i]]['category']);
						}
	
						that.bind.sideEvtCollision();
					
					}, // drawing category from meta end in imgBBox tab
					
					adjustArea(){
						const that = imgBBox;
						var scaleFactor = that.data.scaleFactor;
						
						var scaledHeight = scaleFactor.origHeight * scaleFactor.ratio;
// 						var progBarHeight = $("#imgBBox .prog_bar").height();
						var progBarHeight = 157;
						var headerHeight = 67*1;
						// video area height
// 						$("#labeller-video").css("height",scaledHeight);
						$("#imgBBox .enrichment").css("height",scaledHeight*1+progBarHeight+headerHeight);
						// canvas init and adjust height
// 						that.data.canvas.setHeight(scaledHeight-progBarHeight);
// 						that.data.canvas.setHeight(scaledHeight);
// 						// search area height
// 						$(".cate_search_wrap .content_wp").css("height",scaledHeight-progBarHeight);
						
		 				// category area height
// 						$("#imgBBox .label_wrap ").css("height",$("#labeller-video")[0].clientHeight);
// 						$("#imgBBox .label_wrap .category_wrap").css("height",$("#labeller-video")[0].clientHeight-progBarHeight-10);
						
					},
					
					checkWindowWidth(){
						var bodyWidth = $("body").width();
						if(bodyWidth <= 1440){
							$(".labeller_container .label_wrap").css("width","200px");
						}
					},
					
					// jh.sa 210226 tag
					drawTagset : function(tags,isDel){
						const that = imgBBox;
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
						const that = imgBBox;

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
						const that = imgBBox;
						elem.find(".hover_box").remove();
					},					
					
					
				},// draw something end
				
		};
		
		const imgBBoxQuick = {
			data : {
				taskName : null,
				annotationName : null,
				inferenceName : null,		
			},
			init : function(){
				const that = imgBBoxQuick;
				
				that.bind.quickTraining();
				that.bind.quickInference();
			},
			bind : {
				// Quick Training & Inference
				quickTraining() {
					const that = imgBBoxQuick;
					
					// quick training 팝업창 띄우기
					$("#imgBBox #quick_training_btn").off("click").on("click", function(){
						$("#imgBBox .quick_training").toggleClass("active");
						$("#imgBBox .quick_training").draggable({containment: "document"});
						$("#imgBBox .add_project").removeClass("active");
						$("#imgBBox .checkpoint_list").removeClass("active");
						$("#imgBBox .quick_training .radioBtn.selected").removeClass("selected");	
						$("#imgBBox .training_config").removeClass("active");
						$("#imgBBox .add_project_btn")[0].textContent = "+";
						$("#imgBBox .training_config_btn")[0].textContent = "+";
						$("#imgBBox #quick_training .checkpoint_list_btn")[0].textContent = "+";
						$("#imgBBox .description_wrap").removeClass("border");
						$("#imgBBox .checkpoint_view").removeClass("active");
						$("#imgBBox .algorithm_result").removeAttr("disabled");
						$("#imgBBox #training_config .config_wrap").html("");
						$("#imgBBox #training_config .description_wrap").html("");	
						$("#imgBBox .empty_wrap").remove();
						// j.seo 수정
						/* that.root.computed.getDatasetList(); */
						that.computed.setAnnoTaskName();
						that.computed.getTaskList(null, "0");
						that.computed.getAlgorithmList();
					});
					// 새 project 생성 창 띄우기 버튼 
					$("#imgBBox .add_project_btn").off("click").on("click", function() {
						let add_project_zIndex = parseInt($("#imgBBox #quick_training .add_project").css("zIndex"));
						let checkpoint_list_zIndex = parseInt($("#imgBBox #quick_training .checkpoint_list").css("zIndex"));
						let train_config_zIndex = parseInt($("#imgBBox #quick_training .training_config").css("zIndex"));	
						
						$("#imgBBox .add_project").toggleClass("active");
						$("#imgBBox .add_project input").val("");
						$("#imgBBox .add_project textarea").val("");
						if($("#imgBBox .add_project").hasClass("active")){
							$("#imgBBox .add_project_btn")[0].textContent = "-";
						} else {
							$("#imgBBox .add_project_btn")[0].textContent = "+";
						}
						
						// z-index 우선순위 제어
						if(add_project_zIndex <= checkpoint_list_zIndex){
							$("#imgBBox #quick_training .add_project").css({"zIndex":checkpoint_list_zIndex + 1});
						} else if(add_project_zIndex <= train_config_zIndex) {
							$("#imgBBox #quick_training .add_project").css({"zIndex":train_config_zIndex + 1});
						}					
					});
					// Checkpoint list 창 띄우기 버튼
					$("#imgBBox #quick_training .checkpoint_list_btn").off("click").on("click", function() {
						let add_project_zIndex = parseInt($("#imgBBox #quick_training .add_project").css("zIndex"));
						let checkpoint_list_zIndex = parseInt($("#imgBBox #quick_training .checkpoint_list").css("zIndex"));
						let train_config_zIndex = parseInt($("#imgBBox #quick_training .training_config").css("zIndex"));
						
						if($("#imgBBox .task_result").val() != ""){
							$("#imgBBox #quick_training .checkpoint_list").toggleClass("active");
//	 						$("#imgBBox .empty_wrap").remove();
//	 						$(".quick_training .radioBtn.selected").removeClass("selected");	// 수정 창 띄울때 없애는것이 아니라 옵션이 바뀔때 없애야함
							if($("#imgBBox #quick_training .checkpoint_list").hasClass("active")){
								$("#imgBBox #quick_training .checkpoint_list_btn")[0].textContent = "-";
							} else {
								$("#imgBBox #quick_training .checkpoint_list_btn")[0].textContent = "+";
							}					
						} else {
							alert("Inheritance에 사용할 task를 선택해주세요");	
						}
						
						// z-index 우선순위 제어
						if(checkpoint_list_zIndex <= add_project_zIndex){
							$("#imgBBox #quick_training .checkpoint_list").css({"zIndex":add_project_zIndex + 1});
						} else if(checkpoint_list_zIndex <= train_config_zIndex) {
							$("#imgBBox #quick_training .checkpoint_list").css({"zIndex":train_config_zIndex + 1});
						}					
					});
					// Training config 입력 영역 띄우기 버튼
					$("#imgBBox .training_config_btn").off("click").on("click", function() {
						let add_project_zIndex = parseInt($("#imgBBox #quick_training .add_project").css("zIndex"));
						let checkpoint_list_zIndex = parseInt($("#imgBBox #quick_training .checkpoint_list").css("zIndex"));
						let train_config_zIndex = parseInt($("#imgBBox #quick_training .training_config").css("zIndex"));
						
						$("#imgBBox .training_config").toggleClass("active");
//	 					$("#imgBBox .description_wrap").html("");
						if($("#imgBBox .training_config").hasClass("active")){
							$("#imgBBox .training_config_btn")[0].textContent = "-";
						} else {
							$("#imgBBox .training_config_btn")[0].textContent = "+";
						}
						
						// z-index 우선순위 제어
						if(train_config_zIndex <= add_project_zIndex){
							$("#imgBBox #quick_training .training_config").css({"zIndex":add_project_zIndex + 1});
						} else if(train_config_zIndex <= checkpoint_list_zIndex) {
							$("#imgBBox #quick_training .training_config").css({"zIndex":checkpoint_list_zIndex + 1});
						}					
					});					
					// 팝업창 닫기
					$("#imgBBox #quick_training .quick_close").off("click").on("click", function() {
						$("#imgBBox .quick_training").removeClass("active");
						$("#imgBBox .checkpoint_list .selected_task_name").html("");					
					});
					$("#imgBBox #quick_training .add_project .side_btn_wrap .cancel_btn").off("click").on("click", function() {
						$("#imgBBox .add_project").removeClass("active");
						$("#imgBBox .add_project_btn")[0].textContent = "+";
					});
					$("#imgBBox #quick_training .training_config .side_btn_wrap .cancel_btn").off("click").on("click", function() {
						$("#imgBBox .training_config").removeClass("active");
						$("#imgBBox .training_config_btn")[0].textContent = "+";
						let temp_id = $("#imgBBox .quick_training .algorithm_result option:selected").data("id");
						that.computed.getAlgorithmById(temp_id, "0");
					});		
					$("#imgBBox #quick_training .training_config .side_btn_wrap .save_btn").off("click").on("click", function() {
						$("#imgBBox .training_config").removeClass("active");
						$("#imgBBox .training_config_btn")[0].textContent = "+";
					});						
					
					$("#imgBBox #quick_training .checkpoint_list .side_btn_wrap .cancel_btn").off("click").on("click", function() {
						$("#imgBBox #quick_training .checkpoint_list").removeClass("active");
						$("#imgBBox #quick_training .checkpoint_list_btn")[0].textContent = "+";					
//	 					$(".quick_training .radioBtn.selected").removeClass("selected");
						if($("#imgBBox .quick_training .radioBtn.selected").length == 0){
							$("#imgBBox .checkpoint_view").removeClass("active");
						}
						let temp_id = $("#imgBBox .quick_training .task_result option:selected").data("id");
						that.computed.getCheckpointList(temp_id, "0");
					});		
					$("#imgBBox #quick_training .checkpoint_list .side_btn_wrap .save_btn").off("click").on("click", function() {
						$("#imgBBox #quick_training .checkpoint_list").removeClass("active");
						$("#imgBBox #quick_training .checkpoint_list_btn")[0].textContent = "+";
					});
					// project 생성 버튼
					$("#imgBBox .quick_training .add_btn").off("click").on("click", function() {
						that.computed.getProjectData();
						$("#imgBBox .add_project").removeClass("active");
						$("#imgBBox .add_project_btn")[0].textContent = "+";					
					});
					// start training 버튼 			
					$("#imgBBox .quick_training_btn").off("click").on("click", function() {
						$("#imgBBox .algorithm_result").removeAttr("disabled");
						that.computed.createJsonQuickTrain();
					});
				
				},
				
				quickInference() {
					const that = imgBBoxQuick;
					
					// 팝업창 띄우기
					$("#imgBBox #quick_inference_btn").off("click").on("click", function(){
						$("#imgBBox .quick_inference").toggleClass("active");
						$("#imgBBox .quick_inference").draggable({containment: "document"});
						$("#imgBBox .quick_inference .radioBtn.selected").removeClass("selected");					
						$("#imgBBox .inference_config").removeClass("active");
						$("#imgBBox .inference_config_btn")[0].textContent = "+";			
						$("#imgBBox .description_wrap").removeClass("border");						
						$("#imgBBox #inference_config .config_wrap").html("");
						$("#imgBBox #inference_config .description_wrap").html("");
						$("#imgBBox .quick_task_list .table_body tbody").html("");
						that.computed.getTaskList(null, "1");
						that.computed.setAnnoTaskName();
					});				
					// Inference config 입력 영역 띄우기 버튼
					$("#imgBBox .inference_config_btn").off("click").on("click", function() {
						if($("#imgBBox #quick_inference .radioBtn.selected").length == 0){
							alert("Task를 선택해주세요");
							return
						} else {
							$("#imgBBox .inference_config").toggleClass("active");
//		 					$("#imgBBox .description_wrap").html("");
							if($("#imgBBox .inference_config").hasClass("active")){
								$("#imgBBox .inference_config_btn")[0].textContent = "-";
							} else {
								$("#imgBBox .inference_config_btn")[0].textContent = "+";
							}
						}
					});				
					// 팝업창 닫기
					$("#imgBBox #quick_inference .quick_close").off("click").on("click", function() {
						$("#imgBBox .quick_inference").removeClass("active");
						$("#imgBBox .quick_inference input[name='csv_title']").val("");
					});	
					$("#imgBBox #quick_inference .side_btn_wrap .cancel_btn").off("click").on("click", function() {
						$("#imgBBox .inference_config").removeClass("active");
						$("#imgBBox .inference_config_btn")[0].textContent = "+";
						let temp_id = $("#imgBBox .quick_inference .quick_task_list .radioBtn.selected").parent().next().data("id");
						that.computed.getTaskById(temp_id);
					});		
					$("#imgBBox #quick_inference .side_btn_wrap .save_btn").off("click").on("click", function() {
						$("#imgBBox .inference_config").removeClass("active");
						$("#imgBBox .inference_config_btn")[0].textContent = "+";
					});							
					// run inference 버튼 			
					$("#imgBBox .quick_inference_btn").off("click").on("click", function() {
						that.computed.createJsonQuickInference();
					});				
				},		
				
				checkPointListener() {
					const that = imgBBoxQuick;
					 
					let chk_radio_obj;
					let row_click = $("#imgBBox .checkpoint_list .list_wrap .checkpoint_table tbody tr")
					row_click.off("click").on("click",function() {
						let tr = $(this);
						let btn = tr.children().children(".radioBtn");
						let chkpoint_name = tr.children(".checkPoint_name").val();
						let checkpoint_view = $("#imgBBox .checkpoint_view");
						btn.toggleClass("selected");
						if(btn.hasClass("selected")){
							chk_radio_obj = {};
							$("#imgBBox .checkpoint_list .list_wrap .checkpoint_table tbody tr .radioBtn").removeClass("selected");
							btn.addClass("selected");
							chk_radio_obj[chkpoint_name] = chkpoint_name;
//	 						that.selectCheckpointAlgorithm();
							
							let selected_id = $("#imgBBox .task_result option:selected").data("id");
							that.render.getSelectedTaskById(selected_id);
							
							let selected_cp_name = $("#imgBBox .checkpoint_list .radioBtn.selected").parent().next().text();
							console.log("chkpoint_name: ", selected_cp_name);
							checkpoint_view.addClass("active");
							checkpoint_view.html("Selected Checkpoint :" + selected_cp_name);
							
							$("#imgBBox .algorithm_result").attr("disabled","disabled");		// 체크포인트 선택 시 algorithm select 비활성화 
						} else {
							chk_radio_obj = {};
							$("#imgBBox .algorithm_result").removeAttr("disabled");
							checkpoint_view.removeClass("active");
							checkpoint_view.html("");
							// 초기화시 RETINAT 기본값 적용 
							let options = $("#imgBBox .algorithm_result").children("option");
							let selected_option_id;
							for(var i=1; i < options.length; i++){
							    if(options[i].label == "RETINANET"){
							    	options[i].selected = true;
							    	selected_option_id = options[i].attributes["data-id"].value
							    }
							}
							that.computed.getAlgorithmById(selected_option_id, "0", null);				// RETINANET algorithm_id
						}
						
					});	
				},
				
				inferenceCheckPointListener() {
					const that = imgBBoxQuick;
					 
					let chk_radio_obj;
					let row_click = $("#imgBBox .inference_checkpoint .list_wrap .checkpoint_table tbody tr")
					row_click.off("click").on("click",function() {
						let tr = $(this);
						let btn = tr.children().children(".radioBtn");
						let chkpoint_name = tr.children(".checkPoint_name").val();
						let checkpoint_view = $("#imgBBox .checkpoint_view");
						btn.toggleClass("selected");
						if(btn.hasClass("selected")){
							chk_radio_obj = {};
							$("#imgBBox .inference_checkpoint .list_wrap .checkpoint_table tbody tr .radioBtn").removeClass("selected");
							btn.addClass("selected");
							chk_radio_obj[chkpoint_name] = chkpoint_name;
							
//	 						let selected_cp_name = $("#imgBBox .inference_checkpoint .radioBtn.selected").parent().next().text();
//	 						console.log("chkpoint_name: ", selected_cp_name);
//	 						checkpoint_view.addClass("active");
//	 						checkpoint_view.html("Selected Checkpoint :" + selected_cp_name);
						} else {
							chk_radio_obj = {};
							checkpoint_view.removeClass("active");
							checkpoint_view.html("");
						}
						
					});	
				},		
				
				taskListener : function() {
					const that = imgBBoxQuick;
					 
					let chk_radio_obj_inf;
					let row_click_inf = $("#imgBBox #quick_inference .list_wrap .table_body .task_table tbody tr")
					row_click_inf.off("click").on("click",function() {
						let tr = $(this);
						let btn = tr.children().children(".radioBtn");
						let task_name = tr.children(".task_name").val();
						let task_id = tr.children(".task_name")[0].attributes["data-id"].value;
						btn.toggleClass("selected");
						if(btn.hasClass("selected")){
							chk_radio_obj_inf = {};
							$("#imgBBox #quick_inference .list_wrap .table_body .task_table tbody tr .radioBtn").removeClass("selected");
							btn.addClass("selected");
							chk_radio_obj_inf[task_name] = task_name;
						} else {
							chk_radio_obj_inf = {};
							$("#imgBBox .inference_checkpoint .list_wrap .checkpoint_table tbody").html("");
							$("#imgBBox .inference_config").removeClass("active");
							$("#imgBBox .inference_config_btn")[0].textContent = "+";
						}
						$("#imgBBox .inference_checkpoint .list_wrap .checkpoint_table tbody").html("");
						that.computed.getTaskById(task_id);
						$("#imgBBox #inference_config .description_wrap").addClass("border");	
					});	
					
					let chk_radio_obj_train;
					let row_click_train = $("#imgBBox #quick_training .list_wrap .table_body .task_table tbody tr")
					row_click_train.off("click").on("click",function() {
						let tr = $(this);
						let btn = tr.children().children(".radioBtn");
						let task_name = tr.children(".task_name").val();
						let task_id = tr.children(".task_name")[0].attributes["data-id"].value;
						btn.toggleClass("selected");
						if(btn.hasClass("selected")){
							chk_radio_obj_train = {};
							$("#imgBBox #quick_training .list_wrap .table_body .task_table tbody tr .radioBtn").removeClass("selected");
							btn.addClass("selected");
							chk_radio_obj_train[task_name] = task_name;
						} else {
							chk_radio_obj_train = {};
						}
						that.computed.getTaskById(task_id);
						$("#imgBBox #training_config .description_wrap").addClass("border");	
					});					
				},				
				
				selectCheckpointAlgorithm(algorithm_id){
					const that = imgBBoxQuick;
					
					console.log("algorithm_id???? ", algorithm_id);
					let options = $("#imgBBox .algorithm_result").children("option");
					for(var i=1; i < options.length; i++){
					    if(options[i].attributes["data-id"].value == algorithm_id){
					    	options[i].selected = true;
					    }
					}
				},				
			},
			computed : {
				setAnnoTaskName() {
					const that = imgBBoxQuick;
					$("#loader").show();
					const deffered = $.ajax({
						url : baseUrl + "task/setAnnoTaskName.json",
						data : {dataset_id : imgBBox.data.canvasObj.datasetId},
						type : "POST",
						success(res){
							console.log("=======setAnnoTaskName=======", res);
							$("#loader").hide();
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
					const that = imgBBoxQuick;
					$("#loader").show();
					const deffered = $.ajax({
						url : baseUrl + "data/getDatasetList.json",
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
					const that = imgBBoxQuick;
					console.log("imgBBox.data.canvasObj.datasetId::", imgBBox.data.canvasObj.datasetId);
					$("#loader").show();
					const deffered = $.ajax({
						url : baseUrl + "task/getQuickInferenceTaskList.json",
						data : {project_id : null, dataset_id : imgBBox.data.canvasObj.datasetId},
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
					const that = imgBBoxQuick;
					$("#loader").show();
					const deffered = $.ajax({
						url : baseUrl + "algorithm/getAlgorithmList.json",
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
					const that = imgBBoxQuick;
					$("#loader").show();
					const deffered = $.ajax({
						url : baseUrl + "algorithm/getAlgorithmList.json",
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
					const that = imgBBoxQuick;
					$("#loader").show();
					const deffered = $.ajax({
						url : baseUrl + "algorithm/getAlgorithmById.json",
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
					const that = imgBBoxQuick;
					$("#loader").show();
					const deffered = $.ajax({
						url : baseUrl + "task/getTaskById.json",
						data : {task_id : id},
						type : "POST",
						success(res){
							console.log("=======getTaskById=======", res);
							$("#loader").hide();
							if(res.result.code == "200"){
								that.computed.getAlgorithmById(res.result.data.algorithm_id, "1");
								that.computed.getCheckpointList(id, "1");
// 								that.computed.getAlgorithmById(res.result.data.algorithm_id, "2");
// 								that.computed.getCheckpointList(id, "2");
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
					const that = imgBBoxQuick;
					let task_list_data = data;
					$("#loader").show();
					const deffered = $.ajax({
						url : baseUrl + "project/getProjectList.json",
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
					const that = imgBBoxQuick;
					$("#loader").show();
					const deffered = $.ajax({
						url : baseUrl + "task/getCheckPointList.json",
						data : { task_id : id },
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
					const that = imgBBoxQuick;
					$("#loader").show();
					const deffered = $.ajax({
						url : baseUrl + "task/getTaskById.json",
						data : {task_id : id},
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
					const that = imgBBoxQuick;
					
					let title = $("#imgBBox .add_project input[name='title']").val();
					let contents = $("#imgBBox .add_project textarea[name='contents']").val();

					if(title == ""){
					 	alert("제목을 입력해주세요");
					 	$("#imgBBox input[name='title']").focus();
					 	return;
					}
					
					if(contents == ""){
					 	alert("내용을 입력해주세요");
					 	$("#imgBBox textarea[name='contents']").focus();
					 	return;
					} 
					

					$("#loader").show();
					console.log("title, contents : ", title, contents);
					that.computed.insertProject(title, contents);				
				},			
				
				insertProject(t, c){
					const that = imgBBoxQuick;
					
					let ajaxData = {
							title : t,
							contents : c
					}
					
					const deffered = $.ajax({
						url : baseUrl + "project/insertProject.json",
						data : ajaxData,
						type : "POST",
						success(res){
							$("#loader").hide();
							console.log("=======insertProject=======", res);
							
							if(res.result.code == "200"){
//		 						that.drawTaskList(task_list_data, res.result.data);
								that.computed.getTaskList(res.result.data,"0");
								$("#imgBBox .quick_training .add_project").removeClass("active");
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
					const that = imgBBoxQuick;
					let annotation_title = $("#imgBBox input[name='annotation_name']");
					let task_title = $("#imgBBox input[name='task_name']");
					let task_contents = $("#imgBBox input[name='task_contents']");
					let training_arr = {};
					let project_id = $("#imgBBox select[name='project_result'] option:selected").attr("data-id");
	 				let algorithm_id = $("#imgBBox select[name='algorithm_result'] option:selected").attr("data-id");
	 				let base_task_id = $("#imgBBox select[name='task_result'] option:selected").attr("data-id");
	 				let selected_checkpoint_name = null;
	 				// config변수
	 				let train_string = $("#imgBBox .training_config .config_wrap").children(".light").children("input[type='text']");
	 				let train_number = $("#imgBBox .training_config .config_wrap").children(".light").children("input[type='number']");
	 				let train_chk = $("#imgBBox .training_config .config_wrap").children(".check").children(".check_box_wrap").children(".check_box").children(".first");
	 				console.log("train_chk::", train_chk);
	 				console.log("train_string::", train_string);
	 				console.log("train_number::", train_number);
	 	 			let train_arr = {};
	 	 			
	 				/* let selected_checkpoint_name = $("#imgBBox .radioBtn.selected").parent().parent("tr").children(".checkPoint_name"); */
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
	 					selected_checkpoint_name = $("#imgBBox .checkpoint_list .radioBtn.selected").parent().parent("tr").children(".checkPoint_name").text();
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
					training_arr["dataset_id"] = imgBBox.data.canvasObj.datasetId;
	 				training_arr["project_id"] = project_id;
	 				training_arr["algorithm_id"] = algorithm_id;
	 				training_arr["config"] = result_string;
	 				training_arr["base_task_id"] = base_task_id;
	 				training_arr["selected_checkpoint_name"] = selected_checkpoint_name;
					
					var quick_training_data = JSON.stringify(training_arr);
					console.log("quick_training_data : ", quick_training_data);
//	 				$("#imgBBox #quick_training").removeClass("active");		// training confirm 에서 확인 시 200일 때 닫기 
//	 				annotation_title.val("");										// training confirm 에서 확인 시 200일 때 초기화 
//	 				task_title.val("");												// training confirm 에서 확인 시 200일 때 초기화
					that.computed.ajaxQuickTrain(training_arr, quick_training_data);
				},
				
				createJsonQuickInference(){
					const that = imgBBoxQuick;
					
					let select_task_btn = $("#imgBBox #quick_inference .radioBtn");
					let selected_task = $("#imgBBox #quick_inference .radioBtn.selected").parent().parent("tr").children(".task_name");
					let csv_title = $("#imgBBox input[name='csv_title']").val();
					let check_box = $("#imgBBox #quick_inference .checkBox");
				    let inf_string = $("#imgBBox #quick_inference .config_wrap").children(".light").children("input[type='text']");
				    let inf_number = $("#imgBBox #quick_inference .config_wrap").children(".light").children("input[type='number']");
				    let inf_chk = $("#imgBBox #quick_inference .config_wrap").children(".check").children(".check_box_wrap").children(".check_box").children(".first");
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
					
					selected_checkpoint_name = $("#imgBBox .inference_checkpoint .radioBtn.selected").parent().next().text();
					if(selected_checkpoint_name == null || selected_checkpoint_name == "" || selected_checkpoint_name == undefined) {
						alert("CheckPoint를 선택해주세요.");
						return ;
					}
					
					inference_arr["selected_task_id"] = selected_task_id;
					inference_arr["dataset_id"] = imgBBox.data.canvasObj.datasetId;
					inference_arr["csv_title"] = csv_title;
					inference_arr["config"] = config_string;
					inference_arr["selected_checkpoint_name"] = selected_checkpoint_name;
					
					var quick_inference_data = JSON.stringify(inference_arr);
					console.log("selected_task_id: ", selected_task_id);
					//console.log("current dataset_id : ", dataset_id);
					console.log("quick_project_id dataset_id : ", quick_project_id);
					console.log("quick_inference_data : ", quick_inference_data);
					that.computed.ajaxQuickInference(inference_arr, quick_project_id, quick_inference_data);
				},
				
				ajaxQuickTrain(arr, data){
					const that = imgBBoxQuick;
					//let ajaxData = data;
					let annotation_title = $("#imgBBox input[name='annotation_name']");
					let task_title = $("#imgBBox input[name='task_name']");
					let ajaxData = {
	 						annotation_title : arr.annotation_title,
	 						task_title : arr.task_title,
	 						contents : arr.task_contents,
	 						dataset_id : imgBBox.data.canvasObj.datasetId * 1,
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
									$("#imgBBox #quick_training").removeClass("active");
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
					const that = imgBBoxQuick;
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
									$("#imgBBox #quick_inference").removeClass("active");
									// 세션에 task_id, project_id 저장 후 inference list 확인을 위해 trainer 페이지로 이동 
									if(window.sessionStorage){
										sessionStorage.setItem("selected_task_id", arr.selected_task_id);
										sessionStorage.setItem("selected_pId", quick_project_id);
										let position = sessionStorage.getItem("selected_task_id");
										let position2 = sessionStorage.getItem("selected_pId");
										console.log("position: ", position, position2);
									}
									imgBBox.init(imgBBox.data.canvasObj["datasetId"]);
// 									that.root.computed.initEnrichment();
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
					const that = imgBBoxQuick;
					elem.append("<div class='empty_wrap'><div class='no_image'></div><div class='eng_text'>"+data1+"</div><div class='kor_text'>"+data2+"</div></div>")
				},
				
				removeEmptyData(elem){
					const that = imgBBoxQuick;
					elem.find(".empty_wrap").remove();
				},
				
				drawDefaultQuickInfo(datasetData){
					const that = imgBBoxQuick;
					
					let dataset_data = datasetData;
					let annotation_title_input = $("#imgBBox input[name='annotation_name']");
					let task_title_input = $("#imgBBox input[name='task_name']");
					let task_contents_input = $("#imgBBox input[name='task_contents']");
				
					console.log("dataset_data : ", dataset_data);
					console.log("taskName3 : " + that.data.taskName);
					console.log("annoName3 : " + that.data.annotationName);
					for(let i = 0; i < dataset_data.length; i++){
						if(dataset_data[i].dataset_id === imgBBox.data.canvasObj.datasetId){
							$(annotation_title_input).val(that.data.annotationName);			// jh.sa default name  
							$(task_title_input).val(that.data.taskName); 
							$(task_contents_input).val("Quick training model");
						} else {
							continue;
						}
					};
				},				
				
				drawDefaultCsvInfo(datasetData){
					const that = imgBBoxQuick;
				
					let dataset_data = datasetData;
					let csv_title = $("#imgBBox input[name='csv_title']");
				
					console.log("dataset_data : ", dataset_data);
					for(let i = 0; i < dataset_data.length; i++){
						if(dataset_data[i].dataset_id === imgBBox.data.canvasObj.datasetId){
							csv_title.val(that.data.inferenceName);			// jh.sa default name  
						} else {
							continue;
						}
					};				
				},				
				
				drawAlgorithmList(data){
					const that = imgBBoxQuick;
					
					console.log("algorithmListData : ", data);
					let selectTarget = $("#imgBBox .quick_training .algorithm_result");
					$(selectTarget).html("");
					
					let html = "<option value=''>Please select the algorithm</option>"; 
					for(let i=0, len = data.length; i<len; i++){
						if(data[i].label_type == "IMAGE_BBOX"){
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
					const that = imgBBoxQuick;
					
					console.log("projectListData : ", data);
					let selectTarget = $("#imgBBox .quick_training .project_result");
					$(selectTarget).html("");
					
					let html = "<option value=''>Please select the project</option>"; 
					for(let i=0, len = data.length; i<len; i++){
						html += "<option data-id='"+data[i]["project_id"]+"' value='"+data[i]["title"]+"'>";
						html += data[i]["title"];
						html += "</option>";
			
					}
					$(selectTarget).append(html);
					
					// 기본값으로 첫번째 프로젝트 지정 
					let options = $("#imgBBox .project_result").children("option");
					options[1].selected = true;
					
				},
				
				// inheritance 대상이 될 task list를 select box으로 보여줌 
				drawInheritTaskList(task_list_data, project_data){
					const that = imgBBoxQuick;
					console.log("inheritTaskListData : ", task_list_data);
					console.log("inheritProjectData : ", project_data);
					let selectTarget = $("#imgBBox .quick_training .task_result");
					$(selectTarget).html("");
					
					let html = "<option value=''>Please select the task</option>"; 
					for(let i=0; i < task_list_data.length; i++){
						for(let j=0; j < project_data.length; j++){
							if(task_list_data[i].label_type == "IMAGE_BBOX"){
								if(task_list_data[i].project_id === project_data[j].project_id){
									html += "<option data-id='"+task_list_data[i]["task_id"]+"' data-projectId='"+project_data[j].project_id+"' value='"+task_list_data[i]["title"]+"'>";
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
					const that = imgBBoxQuick;
					
					if(data != null && data.length > 0){
						let checkPoints = data.reverse();
						let target = $("#imgBBox #quick_training .checkpoint_table tbody");
						
						let html = "";
						$(target).html("");
						$("#imgBBox .empty_wrap").remove();
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
						that.render.removeEmptyData($("#imgBBox #quick_training .checkpoint_list .list_wrap"));
						
						//jh.sa
						let checkpoint_view = $("#imgBBox .checkpoint_view");
						let selected_cp_name = $("#imgBBox .checkpoint_list .radioBtn.selected").parent().next().text();
						console.log("chkpoint_name: ", selected_cp_name);
						checkpoint_view.addClass("active");
						checkpoint_view.html("Selected Model :" + selected_cp_name);
						let selected_id = $("#imgBBox .task_result option:selected").data("id");
						that.computed.getSelectedTaskById(selected_id);
						$("#imgBBox .algorithm_result").attr("disabled","disabled");
						
						that.computed.checkPointListener();					
					} else if(data != null && data.length == 0) {
//	 					that.root.bind.removeEmptyData($("#imgBBox #quick_training .checkpoint_list .list_wrap"));					
						if($("#imgBBox #quick_training .checkpoint_list .empty_wrap").length == 0){
							that.render.addEmptyData($("#imgBBox #quick_training .checkpoint_list .list_wrap"), "No Model", "please train your task first");
						}
					} else {
//	 					that.root.bind.removeEmptyData($("#imgBBox #quick_training .checkpoint_list .list_wrap"));					
						if($("#imgBBox #quick_training .checkpoint_list .empty_wrap").length == 0){
							that.render.addEmptyData($("#imgBBox #quick_training .checkpoint_list .list_wrap"), "No Model", "please train your task first");				
						}
					}

				},
				
				// quick inference checkpoint
				drawInferenceCheckpointList(data){
					const that = imgBBoxQuick;
					
					if(data != null && data.length > 0){
						let checkPoints = data.reverse();
						let target = $("#imgBBox #quick_inference .inference_checkpoint .checkpoint_table tbody");
						
						let html = "";
						
						$(target).html("");
						$("#imgBBox .empty_wrap").remove();
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
						that.render.removeEmptyData($("#imgBBox #quick_inference .inference_checkpoint .list_wrap"));
						that.bind.inferenceCheckPointListener();					
					} else if(data != null && data.length == 0) {
//	 					that.root.bind.removeEmptyData($("#imgBBox #quick_inference .inference_checkpoint .list_wrap"));					
						if($("#imgBBox #quick_inference .inference_checkpoint .empty_wrap").length == 0){
							that.render.addEmptyData($("#imgBBox #quick_inference .inference_checkpoint .list_wrap"), "No Model", "please train your task first");
						}
					} else {
//	 					that.root.bind.removeEmptyData($("#imgBBox #quick_inference .inference_checkpoint .list_wrap"));					
						if($("#imgBBox #quick_inference .inference_checkpoint .empty_wrap").length == 0){
							that.render.addEmptyData($("#imgBBox #quick_inference .inference_checkpoint .list_wrap"), "No Model", "please train your task first");
						}
					}
				},			
				
				// quick inference 팝업의 task list 그리기 
				drawTaskList(task_list_data, project_data){
					const that = imgBBoxQuick;
					

					console.log("taskDataa:: " , task_list_data);
					console.log("project_data :: ", project_data);
					let target = $("#imgBBox .quick_task_list .list_wrap .table_body .task_table tbody");
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
							if(task_list_data[i].label_type == "IMAGE_BBOX"){
								if(task_list_data[i].project_id === project_data[j].project_id){
									html += "<td class='task_name' data-id='"+task_list_data[i].task_id+"' data-projectId='"+project_data[j].project_id+"'>"+project_data[j].title+" / "+task_list_data[i].title+"</td>";							
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
					const that = imgBBoxQuick;
					
					let configData;
					let description;
					let target = $("#imgBBox #training_config .config_wrap");
					let description_target = $("#imgBBox #training_config .description_wrap");
					$("#imgBBox #training_config .description_wrap").addClass("border");	
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
						let tooltip_wrap = $("#imgBBox #training_config .tooltip_wrap");
//							console.log("tooltip_wrap:: ", tooltip_wrap);
						tooltip_wrap.off("mouseover").on("mouseover", function() {
							let tooltip = $(this).parent("label").next(".tooltip");
							tooltip.toggleClass("on");
						});
						tooltip_wrap.off("mouseout").on("mouseout", function() {
							let tooltip = $(this).parent("label").next(".tooltip");
							tooltip.removeClass("on");						
						})
						
						// checkbox 활성화
						let check_first = $("#imgBBox #training_config .checkBox");

						check_first.off("click").on("click", function() {
							$(this).toggleClass("selected");
						});					
					}
					
				},
				
				// quick inference 에서 task 선택 시 config 셋팅 
				setInferenceConfig(data, taskId){
					const that = imgBBoxQuick;
					
					let task_id = taskId;
					let configData;
					let description;
					let algorithm_name;
					let target = $("#imgBBox #inference_config .config_wrap");
					let description_target = $("#imgBBox #inference_config .description_wrap");
					let algorithm_target = $("#imgBBox .inference_algorithm");
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
						let tooltip_wrap = $("#imgBBox #inference_config .tooltip_wrap");
//							console.log("tooltip_wrap:: ", tooltip_wrap);
						tooltip_wrap.off("mouseover").on("mouseover", function() {
							let tooltip = $(this).parent("label").next(".tooltip");
							tooltip.toggleClass("on");
						});
						tooltip_wrap.off("mouseout").on("mouseout", function() {
							let tooltip = $(this).parent("label").next(".tooltip");
							tooltip.removeClass("on");						
						})
						
						// checkbox 활성화
						let check_first = $("#imgBBox #inference_config .checkBox");

						check_first.off("click").on("click", function() {
							$(this).toggleClass("selected");
						});					
					}
						
					
					if($("#imgBBox #quick_inference .radioBtn.selected").length == 0){
						$(target).html("");
						$(description_target).html("Please select task data");
					};
					

					
				},			
				
				// quick training의 algorithm select box 
				selectAlgorithm(data){
					const that = imgBBoxQuick;
					
					// 초기화시 RETINAT 기본값 적용 
// 					let options = $(".algorithm_result").children("option");
// 					let selected_option_id;
// 					for(var i=1; i < options.length; i++){
// 					    if(options[i].label == "RETINANET"){
// 					    	options[i].selected = true;
// 					    	selected_option_id = options[i].attributes["data-id"].value
// 					    }
// 					}
					// 초기화시 YOLO 기본값 적용
					let options = $(".algorithm_result").children("option");
					let selected_option_id;
					for(var i=1; i < options.length; i++){
					    if(options[i].label == "YOLO"){
					    	options[i].selected = true;
					    	selected_option_id = options[i].attributes["data-id"].value
					    }
					}
					that.computed.getAlgorithmById(selected_option_id, "0", null);				// RETINANET algorithm_id
					
					$("#imgBBox #quick_training .algorithm_result").on("change", function(){
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
					const that = imgBBoxQuick;
					
					$("#imgBBox #quick_training .task_result").on("change", function(){
						let selected_task = $(this).val();
						if(selected_task != ""){
							$("#imgBBox .empty_wrap").remove();
//	 						that.root.bind.removeEmptyData($("#imgBBox .checkpoint_list .list_wrap"));
							$("#imgBBox .checkpoint_list .list_wrap .checkpoint_table tbody").html("");
							if($("#imgBBox .quick_training .radioBtn.selected").length == 0){
								$("#imgBBox .checkpoint_view").removeClass("active");
								$("#imgBBox .algorithm_result").removeAttr("disabled");
							} else if ($("#imgBBox .quick_training .radioBtn.selected").length > 0){
								$("#imgBBox .quick_training .radioBtn.selected").removeClass("selected");			//추가 
							}

							for(let i=0; i < data.length; i++){
								if(selected_task == data[i]["title"]){
									that.computed.getCheckpointList(data[i]["task_id"], "0");
									that.render.drawTaskName(data[i]["title"]);
									break;
								};
							};						
						} else if(selected_task == "") {
							$("#imgBBox .checkpoint_view").removeClass("active");
							$("#imgBBox .algorithm_result").removeAttr("disabled");
							that.render.removeEmptyData($("#imgBBox .checkpoint_list .list_wrap"));
							that.render.addEmptyData($("#imgBBox .checkpoint_list .list_wrap"), "No Model", "please train your task first");				
							// 						that.root.bind.removeEmptyData($("#imgBBox .checkpoint_list .list_wrap"));
							$("#imgBBox .checkpoint_list .list_wrap .checkpoint_table tbody").html("");
							$("#imgBBox .checkpoint_list .selected_task_name").html("");
							$("#imgBBox #quick_training .checkpoint_list").removeClass("active");
							$("#imgBBox #quick_training .checkpoint_list_btn")[0].textContent = "+";					
							$("#imgBBox .quick_training .radioBtn.selected").removeClass("selected");
						}

					});
				},
				
				// quick training 의 inheritance task 선택 시 checkpoint list 상단에 선택한 task 이름 표시 
				drawTaskName(data){
					const that = imgBBoxQuick;
					
					let taskName_data = data;
					let target_title = $("#imgBBox .checkpoint_list .selected_task_name");
					let select_task_name = "( Selected Task : " + taskName_data + " )";
					$(target_title).html(select_task_name);
					console.log("taskName_data : ", taskName_data);

				},				
			},
		};
		
		
	  </script>		
   </body>
</html>