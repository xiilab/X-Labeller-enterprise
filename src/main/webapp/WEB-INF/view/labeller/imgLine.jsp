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
      
       #accordionSidebar a.nav-link span { width:168px; display:block; }
	   #accordionSidebar .collapse-inner { height:300px; overflow:scroll; }
	   #accordionSidebar .video_name { 
	    	padding-left:0;
	   }
	   #imgLine .canvas-container {
			margin: 0px auto;
/* 			height: 100% !important; */
	   }  	    
	   #imgLine a.next_page,a.prev_page { cursor:pointer; }
	   #imgLine .pagination input.page-link { height:30px; width:30px; padding:0 0 0 8px; }
       #imgLine .tab_wrap { width:180px; }
       #imgLine a.disabled { color:#e74a3b !important; pointer-events: none; } 
	   #imgLine .labeller_container { 
/* 	    	overflow:scroll;  */
			overflow: hidden; 
	    	display:flex; 
	    	flex-wrap:nowrap;  
	    	margin-top: 20px; 
	    	border-left: 0; border-right: 0; 
	    	min-height: 840px; max-height: 840px;
	    }
      	
      	#imgLine .tab-pane{
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
      	
      	#imgLine .header_wrap { margin-bottom: 42px; }
      	#imgLine .tab-pane.cate_search_wrap {
/*       		border:1px solid #eeeeee; */
/*       		border-radius : 10px; */
      	}
/*       	.cate_search_wrap { border:1px solid #eeeeee; } */
/*       	.cate_search_wrap .content_wp .content_header .content_title { cursor:pointer; } */
/*       	.cate_search_wrap .search_cate { width:50%; } */
      	
/*       	.cate_search_wrap .search_wp .search_wrap .search_cate_list { cursor:pointer; } */
/*       	.cate_search_wrap .search_wp .search_wrap .search_cate_list:hover { color:red; } */
/*       	.cate_search_wrap .search_wp .search_wrap { position:absolute; width:50%; max-height:500px; overflow:scroll; background-color:#f8f9fc; z-index:100;  } */
      	
      	#imgLine .search_all_wp .search_all_wrap { position:absolute; /* width:50%; */ max-height:500px; overflow:scroll; background-color:#f8f9fc; z-index:100;  }
      	#imgLine .search_all_wp .search_all_wrap .search_cate_list { cursor:pointer; }
      	#imgLine .search_all_wp .search_all_wrap .search_cate_list:hover { color:red; }
      	
      	/* jh.sa 210520 */
		#imgLine .label_wrap .cate_wp .visibility { width: 20px; height: 20px; display: inline-block; position: relative; top: 0px; background: url('${pageContext.request.contextPath}/resources/images/labeller/ico-eye-on-light.png') center no-repeat; }
		#imgLine .label_wrap .cate_wp .visibility.off,	
		#imgLine .label_wrap .cate_wp .visibility:hover { opacity: 1; background: url('${pageContext.request.contextPath}/resources/images/labeller/ico-eye-off-light.png') center no-repeat; cursor: pointer; }
/*       	.cate_search_wrap .content_wp { overflow:scroll; } */
/*       	.cate_search_wrap .content_wp.active { height:auto; } */
/*       	.cate_search_wrap .content_wp .content .cate_2,.cate_3 { cursor:pointer; } */
/*       	.cate_search_wrap .content_wp .content .cate_2.active,.cate_3.active { font-weight:bold; } */
/*       	.cate_search_wrap .content_wp .content .cate_2:hover,.cate_3:hover { color:red; } */

/* 		.cate_search_wrap .content_wp .content .cate_2.active,.cate_3.active { font-weight:bold; background-color:#eeeeee !important; color:black !important; } */
/* 		.cate_search_wrap .content_wp .content .cate_2:hover,.cate_3:hover { color:red !important; } */
/* 		.cate_search_wrap .content_wp .content .cate_wrap_3 { background-color:#eeeeee; } */
      	
      	#imgLine .label_wrap { 
       		position:relative;  
      		width:100%; 
      		height:auto; 
/*       		border: 1px solid #eeeeee;  */
/*       		margin-left:20px;  */
/*       		border-radius:0.35rem;  */
      		flex-shrink:0;
      	}
      	
       	#imgLine .video_wrap .canvas { width:800px; height:400px; position:absolute !important; }  
/*        	.video_wrap .video { width:1024px;  height:auto; position:absolute !important; }   */
       	
/*       	.video_wrap .video .video_js { position:absolute; } */
/*       	.video_wrap .video .vjs-control-bar { display: flex; height:40px; bottom:-40px;} */
/*       	.video_wrap .video .vjs-big-play-button { display:none; } */
      	#imgLine .video_wrap .prog_bar { border:1px solid #eeeeee; width:100%; height:40px; position:relative; }
      	#imgLine .video_wrap .prog_bar > div { color:#020b44; }
		#imgLine .video_wrap .prog_bar .btn_wrap { width:400px; margin-top:0; }
/*       	.video_wrap .prog_bar .btn { color:#020b44; border-radius:50%; } */
      	#imgLine .video_wrap .prog_bar input.curr_frame { width:50px; height:15px; margin-right:0px; }
      	#imgLine .video_wrap .prog_bar .save_btn_wrap { width:260px; }
      	
      	#imgLine .label_wrap .btn_wrap { margin:0; padding-bottom: 1px; border-bottom: 1px solid #eee;}
/*       	.label_wrap .btn_wrap > div { width:100%; margin:0;  cursor:pointer; } */
      	@media (min-height:960px){
/*       		#imgLine .label_wrap .category_wrap { max-height: 880px; }  */
			#imgLine .label_wrap .category_wrap { max-height: 785px; } 
      	}
      	@media (min-height: 730px) and (max-height:959px){
/*       		#imgLine .label_wrap .category_wrap { max-height: 665px; }  */
			#imgLine .label_wrap .category_wrap { max-height: 570px; } 
      	}      	
      	@media (min-height: 500px) and (max-height:729px){
/*       		#imgLine .label_wrap .category_wrap { max-height: 500px; }  */
			#imgLine .label_wrap .category_wrap { max-height: 405px; } 
      	} 
      	@media (min-height: 1px) and (max-height:499px){
/*       		#imgLine .label_wrap .category_wrap { max-height: 400px; }  */
			#imgLine .label_wrap .category_wrap { max-height: 305px; } 
      	}     	      	
      	#imgLine .label_wrap .category_wrap { width:100%; height:auto; overflow-y: scroll; overflow-x: hidden; flex-wrap: wrap; padding: 0 18px; }
      	#imgLine .label_wrap .category_wrap .cate_wp { width:190px; /* height:90px; */height:200px; padding: 5px; margin: 5px 10px; border:1px solid #eeeeee; text-align: center; }
      	#imgLine .label_wrap .category_wrap .cate_wp .crop_wrap{ width:180px; height:105px; align-items:center; display:flex; justify-content:center; padding: 0.25rem; padding-top: 0.9rem; }
      	#imgLine .label_wrap .category_wrap .cate_wp .crop_img {position:relative; margin-top: 15px;/* width:180px; height:105px; */ }
      	#imgLine .label_wrap .category_wrap .cate_wp.selected { border-width:2px !important; }
/*       	.label_wrap .category_wrap .cate_wp .delete { margin-left:10px; } */
      	#imgLine .label_wrap .category_wrap .cate_wp .color {     
      		width: 20px;
		    height: 20px;
		    margin-left: 2px;
	    }
	    
      	#imgLine .label_wrap .category_wrap .cate { /*width:5em;*/ /* width:60px; */ border:1px solid #eeeeee; text-align:center; text-align-last:center; }
/*       	.label_wrap .category_wrap .cate option { text-align:center; text-align-last:center; } */
      	
      	/*       	#edit h.lee */
      	#imgLine .prev_data_wrap { border: 1px solid white; width: 35px; height: 598px;}
		
		/* 		#edit h.lee */
		#imgLine .next_data_wrap { border: 1px solid white; width: 35px; height: 598px;}
		
		#imgLine .prev_data_wrap:hover { cursor: pointer; background-color: #eee; opacity: 0.3; }
		
		#imgLine .next_data_wrap:hover { cursor: pointer; background-color: #eee; opacity: 0.3; }
		
      	#imgLine .page_title_wrap { position: relative; top: 20px; left: 90px; display: inline; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; }
      	#imgLine .page_title_wrap span:first-child { font-size: 13px; }
		#imgLine .page_title_wrap span:nth-child(2) { color: #4c84ff; font-size: 14px;}
		#imgLine .add { width: 90px; margin-right: 10px; position: relative; color: #fff; font-size: 11px; background-color: #4c84ff; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; }
		#imgLine .add:hover { background-color: #3A71E9; }
		#imgLine .delete { width: 55px; color: #343434; font-size: 11px; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; margin-left: 10px;  }
      	#imgLine .label_title { color: #777; font-weight: 400; padding: 20px; }
      	#imgLine .cate_wp input { width: 165px; padding: 10px; margin-top: 3px; }
      	#imgLine .save_btn_wrap { justify-content: center; position: absolute; bottom: 0; padding: 26px 0;  background-color: #fff; border-top: 1px solid #eee; }
      	#imgLine .save_btn_wrap .save { width: 240px; line-height: 36px; margin: 0 auto; border-radius: 23px; box-shadow: 0 4px 8px 0 #b4d7ff; font-size: 13px; font-weight: 300; color: #fff; cursor: pointer; background-color: #4c84ff;}
		#imgLine .save_btn_wrap .save:hover { background-color: #3A71E9; }
/* 		#imgLine .img_list_wrap { width: calc(100% - 699px); position: absolute; bottom: 92px; border: 1px solid #e0e0e0; border-left: 0; border-right: 0; padding: 15px 0; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; background-color: #f8f8f8; }       */
		#imgLine .img_list_wrap { width: 100%; position: relative; border: 1px solid #e0e0e0; border-left: 0; border-right: 0; padding: 15px 0; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; background-color: #f8f8f8; }      
/*       	#imgLine .data_list_wrap { height: 637px !important; max-height: 637px !important; position: absolute; top: calc(100% - 740px); } */

		@media (min-height: 905px){
			#imgLine .data_list_wrap { height: 448px; max-height: 448px; top: calc(100% - 550px); left: -1px; font-family: 'Open_Sans', sans-serif; font-size: 11px; font-weight: 300; color: #343434; z-index: 98; }  			
		}
		@media (max-height: 904px){
			#imgLine .data_list_wrap { height: 448px; max-height: 448px; top: calc(100% - 550px); left: -1px; font-family: 'Open_Sans', sans-serif; font-size: 11px; font-weight: 300; color: #343434; z-index: 98; }  			
		}
		
		#imgLine .position_wrap { width: 100px; margin-right: 20px; }
		#imgLine .position_wrap .position-value { width: 40px; padding: 5px; }
		#imgLine .position_wrap .total_count { display: inline-block; }
		
		#imgLine .video_wrap .prev_btn {
			position: absolute;
			background: url(images/btn_image_arrow_left_normal.png) left;
			width: 16px;
			height: 25px;
 			top: calc(50% - 25px); 
/* 			top: 300px; */
			left: 5px;
			z-index: 97;
		}
		
		#imgLine .video_wrap .next_btn {
			position: absolute;
			background: url(images/btn_image_arrow_right_normal.png) right;
			width: 16px;
			height: 25px;
 			top: calc(50% - 25px); 
/* 			top: 300px; */
			right: 5px;
			z-index: 97;
		}      	
		
		#imgLine .video_wrap .prev_btn:hover {
			background: url(images/btn_image_arrow_left_hover.png) left;
			cursor: pointer;
		}
		
		#imgLine .video_wrap .next_btn:hover {
			background: url(images/btn_image_arrow_right_hover.png) right;
			cursor: pointer;
		}		
		
		#imgLine .name_wrap { width: 600px; text-align: center; margin: 0 auto; }
		#imgLine .name_wrap .file_name { max-width: 380px; text-overflow: ellipsis; overflow: hidden; }
		#imgLine .name_wrap .prev_btn {
			background: url(images/btn_image_arrow_left_normal.png) left;
			width: 16px;
			height: 25px;
/* 			top: calc(50% - 25px); */
			top: 300px;
			left: 5px;
			z-index: 97;
		}
		
		#imgLine .name_wrap .next_btn {
			background: url(images/btn_image_arrow_right_normal.png) right;
			width: 16px;
			height: 25px;
/* 			top: calc(50% - 25px); */
			top: 300px;
			right: 5px;
			z-index: 97;
		}    	
		
		#imgLine .name_wrap .prev_btn:hover {
			background: url(images/btn_image_arrow_left_hover.png) left;
			cursor: pointer;
		}
		
		#imgLine .name_wrap .next_btn:hover {
			background: url(images/btn_image_arrow_right_hover.png) right;
			cursor: pointer;
		}		
		
      	#imgLine .list_btn_wrap { width: 100px; margin-left: 20px; }
      	#imgLine .list_btn_wrap .data_list_btn { width: 30px; height: 30px; margin-right: 30px; background: url(images/icon_filter_normal.png) right; cursor: pointer; }
 		
/*  		#imgLine .quick_wrap { width: 100%; position: absolute; bottom: 0px; padding: 26.5px 0; background-color: #fff; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }        */
 		#imgLine .quick_wrap { width: 100%; bottom: 0px; padding: 26.5px 0; background-color: #fff; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }       

/*  		#imgLine .quick_wrap { width: calc(100% - 699px); position: absolute; bottom: 0px; padding: 25px 0; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }        */
/* 		#imgLine .quick_wrap { width: 488px; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; position: absolute; top: -8px; left: 609px;}     */
      
		#imgLine .quick_btn {
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
		
		#imgLine .quick_btn:hover {
			background-color: #3A71E9;
		}      
		
		/* panel label */
		#imgLine .btn_wrap .visible { width: 18px; height: 18px; position: relative; left: -145px; }
		#imgLine .btn_wrap .visible.on { background: url('images/btn_layer_view.png') no-repeat center; }
		#imgLine .btn_wrap .visible.off { background: url('images/btn_checkbox_normal.png') no-repeat center; }		
		
		#imgLine section.enrichment {
			width: calc(100% - 486px);
			height: 100%;
			position: relative;
/* 			border: 1px solid #e5e5e5; */
		}      
		
		#imgLine section.label {
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
		
		#imgLine section.enrichment .empty_wrap { margin: 0 auto; text-align: center; margin-top: 300px; color: #777777; }
		#imgLine section.enrichment .empty_wrap .no_image { margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; height: 37px; background-image: url(./images/icon_nodata_list.png); }
		#imgLine section.enrichment .empty_wrap .eng_text { margin-bottom: 3px; font-size: 16px; }
		#imgLine section.enrichment .empty_wrap .kor_text { font-size: 12px; }	
		
		/* quick */
/*  		#imgLine .quick_wrap { width: 100%; position: absolute; bottom: 0px; padding: 26.5px 0; background-color: #fff; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }        */

/*  		#imgLine .quick_wrap { width: calc(100% - 699px); position: absolute; bottom: 0px; padding: 25px 0; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }        */
/* 		#imgLine .quick_wrap { width: 488px; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; position: absolute; top: -8px; left: 609px;}     */
      
		#imgLine .quick_btn {
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
		
		#imgLine .quick_btn:hover {
			background-color: #3A71E9;
		}    
		
		#imgLine .quick_btn_wrap {
			padding-top: 10px;
		}		
				
		#imgLine .quick_training, 
		#imgLine .quick_inference {
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
		
		#imgLine .quick_training.active, 
		#imgLine .quick_inference.active {
			display: block;
		}
		
		#imgLine .quick_training_btn, 
		#imgLine .quick_inference_btn {
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
		
		#imgLine .input_wrap {
			margin: 15px 0;
		}
		
		#imgLine .input_wrap label {
			width: 100px;
			font: 400 12px system-ui;
		}
		
		#imgLine .input_wrap input[type="text"] {
			width: 210px;
			height: 0px;
			font: 300 12px system-ui;
		}
		
		#imgLine .input_wrap input::placeholder {
			font: 400 11px system-ui;
			color: #777;
		}
		
		#imgLine .quick_close, 
		#imgLine .project_close, 
		#imgLine .config_close,
		#imgLine .checkpoint_close {
			width: 37px;
			height: 37px;
			margin-top: -10px;
			display: inline-block;
			cursor: pointer;
			background:
				url("${pageContext.request.contextPath}/resources/images/btn-popup-close-normal.png");
		}
		
		#imgLine .quick_title {
			font: 400 12px 'Open_Sans';
			padding-bottom: 10px;
		}
		
		#imgLine .checkBtn {
			display: inline-block;
			width: 16px;
			height: 16px;
			background:
				url("${pageContext.request.contextPath}/resources/images/icon_gpu_check.png")
				no-repeat center;
		}
		
		#imgLine .list_wrap {
			height: calc(100% - 149px);
			position: relative;
			width: 100%;
		}
		
		#imgLine table.task_table th {
			border-top: 2px #3a3b3d solid;
			background-color: #fafafa;
			height: 44px;
			font-size: 12px;
			font-weight: 400;
			color: #333333;
		}
		
		#imgLine table.task_table th, 
		#imgLine table.task_table tr, 
		#imgLine table.task_table td
			{
			text-align: center;
			border-bottom: 1px solid #e5e5e5;
			border-collapse: collapse;
			border-spacing: 0;
		}
		
		#imgLine .table_body table.task_table {
			font-family: Open_Sans;
			font-size: 12px;
			color: #343434;
			font-weight: 300;
			border-collapse: collapse;
			width: 100%;
		}
		
		#imgLine .table_body table.task_table tr:hover {
			background-color: #f4fcfe;
		}
		
		#imgLine .table_body table.task_table td {
			padding-top: 3px;
			padding-bottom: 3px;
			font-size: 11px;
			cursor: default;
		}
		
		#imgLine .table_header table.task_table {
			margin-top: 15px;
			border-collapse: collapse;
			width: 100%;
		}
		/* #imgLine .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
		#imgLine .table_body {
			max-height: 340px;
			overflow-y: overlay;
			overflow-x: hidden;
			background-color: #fff;
			position: relative;
			margin-bottom: 17px;
		}
		
		#imgLine table td {
			height: 48px;
		}
		
		#imgLine .radioBtn {
			margin-left: 5px;
		}
		
		#imgLine .csv_name_input_wrap {
			
		}
		
		#imgLine .csv_name_input_wrap span {
			font: 400 11px system-ui;
		}
		
		#imgLine .csv_name_input_wrap input {
			font: 400 11px system-ui;
			width: 90%;
			height: 0px;
		}
		
		#imgLine select {
			height: 40px;
			width: 253px;
			border: 1px solid #dedcde;
			font: 400 11px system-ui;
			background:
				url("${pageContext.request.contextPath}/resources/images/select_arrow.png")
				#fff no-repeat 97% 50%/10px;
		}
		
		#imgLine select:focus {
			outline: none;
		}
		
		#imgLine .select_project_wrap {
			position: relative;
			left: -1.5%;
			top: 13px;
		}
		
		#imgLine .add_project_btn, 
		#imgLine .training_config_btn, 
		#imgLine .checkpoint_list_btn
			{
			width: 20px;
			height: 20px;
			margin-left: 18px;
			text-align: center;
			border: 1px solid #dedcde;
			background-color: #fff;
			cursor: pointer;
		}
		
		#imgLine .add_project {
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
		
		#imgLine .training_config {
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
		
		#imgLine .add_project.active, 
		#imgLine .training_config.active,
		#imgLine .checkpoint_list.active, 
		#imgLine .inference_config.active {
			display: block !important;
		}
		
		#imgLine .add_project input[type="text"] {
			width: 210px;
			height: 0px;
		}
		
		#imgLine .add_project label {
			width: 100px;
			font: 400 12px system-ui;
		}
		
		#imgLine .add_project textarea {
			width: 210px;
			height: 150px;
			margin: 10px 0;
			font: 400 13px Arial;
		}
		/* #imgLine .add_project .add_btn { width: 70px; padding: 4px; margin: 0 auto; background-color: #fff; border: 1px solid #dedcde; text-align: center; cursor: pointer; font: 400 13px system-ui; } */
		#imgLine .training_config input[type=number]::-webkit-inner-spin-button,
			.training_config input[type=number]::-webkit-outer-spin-button {
			-webkit-appearance: none;
			margin: 0;
		}
		
		#imgLine .training_config input, 
		#imgLine .inference_config input {
			height: 0px;
		}
		
		#imgLine .training_config input[type="text"],
		#imgLine .inference_config input[type="text"]
			{
			width: 145px !important;
		}
		
		#imgLine .training_config label, 
		#imgLine .inference_config label {
			width: 180px !important;
			font: 400 12px system-ui;
		}
		
		#imgLine .inference_config input[type=number]::-webkit-inner-spin-button,
		#imgLine .training_config input[type=number]::-webkit-outer-spin-button {
			-webkit-appearance: none;
			margin: 0;
		}
		
		#imgLine .tooltip_wrap {
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
		
		#imgLine .tooltip {
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
		
		#imgLine .tooltip.on {
			visibility: visible;
			opacity: 1;
			transition: visibility 0s, opacity 0.3s ease;
		}
		
		#imgLine .description_wrap {
			min-width: 340px;
			max-width: 340px;
			margin: 17px 0;
			padding: 15px;
		}
		
		#imgLine .description_wrap.border {
			border: 1px solid #dedcde;
		}
		
		#imgLine .description_wrap .description {
			font: 400 12px system-ui;
		}
		
		#imgLine .inference_config_btn {
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
		
		#imgLine .inference_config {
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
		
		#imgLine .checkpoint_list {
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
		/* #imgLine .checkBtn { display:inline-block; width: 16px; height: 16px; background: url("${pageContext.request.contextPath}/resources/images/icon_gpu_check.png") no-repeat center; } */
		#imgLine .checkpoint_list .list_wrap {
			height: calc(100% - 149px);
			position: relative;
			width: 100%;
		}
		
		#imgLine .checkpoint_list table.checkpoint_table th {
			border-top: 2px #3a3b3d solid;
			background-color: #fafafa;
			height: 44px;
			font-size: 11px;
			font-weight: 400;
			color: #333333;
		}
		
		#imgLine .checkpoint_list table.checkpoint_table th, 
		#imgLine .checkpoint_list table.checkpoint_table tr,
		#imgLine .checkpoint_list table.checkpoint_table td {
			text-align: center;
			border-bottom: 1px solid #e5e5e5;
			border-collapse: collapse;
			border-spacing: 0;
		}
		
		#imgLine .checkpoint_list .table_body table.checkpoint_table {
			font-family: Open_Sans;
			font-size: 12px;
			color: #343434;
			font-weight: 300;
			border-collapse: collapse;
			width: 100%;
		}
		
		#imgLine .checkpoint_list .table_body table.checkpoint_table tr:hover
			{
			background-color: #f4fcfe;
		}
		
		#imgLine .checkpoint_list .table_body table.checkpoint_table td {
			padding-top: 3px;
			padding-bottom: 3px;
		}
		
		#imgLine .checkpoint_list .table_header table.checkpoint_table {
			margin-top: 15px;
			border-collapse: collapse;
			width: 100%;
		}
		/* #imgLine .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
		#imgLine .checkpoint_list .table_body {
			max-height: 340px;
			overflow-y: overlay;
			overflow-x: hidden;
			background-color: #fff;
			position: relative;
			margin-bottom: 17px;
		}
		
		#imgLine .checkpoint_list table td {
			height: 48px;
		}
		
		#imgLine .checkpoint_list .checkpoint_table .radioBtn {
			margin-left: 5px;
		}
		
		#imgLine .checkpoint_list .selected_task_name {
			font: 400 11px system-ui !important;
			color: #777 !important;
		}
		
		#imgLine .empty_wrap {
			text-align: center;
			margin-top: 120px;
		}
		
		#imgLine .empty_wrap .no_image {
			margin-bottom: 17px;
			background-repeat: no-repeat;
			background-position-x: center;
		}
		
		#imgLine .empty_wrap .eng_text {
			font-family: Open_Sans;
			margin-bottom: 3px;
			font-size: 16px;
			font-weight: 300;
			color: #777777;
		}
		
		#imgLine .empty_wrap .kor_text {
			font-family: Open_Sans;
			font-size: 12px;
			color: #777777;
			font-weight: 200;
			margin-bottom: 120px;
		}
		
		#imgLine .no_image {
			height: 37px;
			background-image: url('./images/icon_nodata_list.png');
		}
		
		#imgLine .checkpoint_view {
			width: 270px;
			font: 400 10px system-ui;
			margin: -6px auto -6px 103px;
			display: none;
		}
		
		#imgLine .checkpoint_view.active {
			display: block;
		}
		
		#imgLine .inference_checkpoint {
			padding-top: 10px;
		}
		
		#imgLine .inference_checkpoint .list_wrap {
			height: calc(100% - 149px);
			position: relative;
			width: 100%;
		}
		
		#imgLine .inference_checkpoint table.checkpoint_table th {
			border-top: 2px #3a3b3d solid;
			background-color: #fafafa;
			height: 44px;
			font-size: 11px;
			font-weight: 400;
			color: #333333;
		}
		
		#imgLine .inference_checkpoint table.checkpoint_table th, 
		#imgLine .inference_checkpoint table.checkpoint_table tr,
		#imgLine .inference_checkpoint table.checkpoint_table td {
			text-align: center;
			border-bottom: 1px solid #e5e5e5;
			border-collapse: collapse;
			border-spacing: 0;
		}
		
		#imgLine .inference_checkpoint .table_body table.checkpoint_table {
			font-family: Open_Sans;
			font-size: 12px;
			color: #343434;
			font-weight: 300;
			border-collapse: collapse;
			width: 100%;
		}
		
		#imgLine .inference_checkpoint .table_body table.checkpoint_table tr:hover
			{
			background-color: #f4fcfe;
		}
		
		#imgLine .inference_checkpoint .table_body table.checkpoint_table td
			{
			padding-top: 3px;
			padding-bottom: 3px;
		}
		
		#imgLine .inference_checkpoint .table_header table.checkpoint_table {
			margin-top: 15px;
			border-collapse: collapse;
			width: 100%;
		}
		/* #imgLine .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
		#imgLine .inference_checkpoint .table_body {
			max-height: 340px;
			overflow-y: overlay;
			overflow-x: hidden;
			background-color: #fff;
			position: relative;
			margin-bottom: 17px;
		}
		
		#imgLine .inference_checkpoint table td {
			height: 48px;
		}
		
		#imgLine .inference_algorithm {
			font: 400 10px system-ui;
		}
		
		#imgLine .side_btn_wrap {
			margin: 0 auto;
			width: 60%;
		}
		
		#imgLine .side_btn_wrap .cancel_btn {
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
		
		#imgLine .side_btn_wrap .save_btn, 
		#imgLine .side_btn_wrap .add_btn {
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
		
		#imgLine .checkpoint_list .side_btn_wrap {
			margin-top: 60px;
			text-overflow: ellipsis;
		}
		
		#imgLine .quick_wrap select { padding: 5px 20px; }		
		
		#imgLine .data_list_header { margin-top: -10px; }
		#imgLine .data_list_header .close_btn { font-size: 24px; cursor: pointer; position: relative; top: -5px; }	
		#imgLine .data_list_header .close_btn:hover { color: #4c84ff; }	
		
		#imgLine .no_label { width: 84%; padding: 180px 30px; text-align: center; color: #cdcdcd; }
		#imgLine .no_label div:nth-of-type(1) { width: 53px; height: 53px; margin: 0 auto; margin-bottom: 11px; background: url('${pageContext.request.contextPath}/resources/images/img_nodata.png') no-repeat; opacity: 0.4; /*  */}
		#imgLine .no_label div:nth-of-type(2) { font-size: 16px; font-weight: 300; margin-bottom: 3px; }
		#imgLine .no_label div:nth-of-type(3) { font-size: 12px; font-weight: 300; }						
		
		#imgLine section.tag { width: 486px; height: 100%; position: relative; background-color: #fff; border: 1px solid #e5e5e5; border-bottom: 0; -ms-user-select: none; -moz-user-select: none; -webkit-user-select: none; -khtml-user-select: none; user-select: none; }
		#imgLine section.tag .tag_margin { margin: 0 auto; padding: 10px; }
 		#imgLine section.tag .tag_total { color: #777; font-weight: 400; padding: 20px; }
 		#imgLine section.tag .tag_wrap { width: 100%; height: 90px; margin-top: 1px; border-top: 1px solid #e5e5e5; font-size: 11px; justify-content: center; } 
		#imgLine section.tag .tag_wrap .content { width: 100%; height: auto; max-height: 75px; overflow-y: scroll; overflow-x: hidden; flex-wrap: wrap; -ms-overflow-style: none; }
		#imgLine section.tag .tag_wrap .content::-webkit-scrollbar { display: none; }		
		#imgLine section.tag .tag_wrap .tag { width: 81px; margin: 10px 5px; line-height: 32px; background: #f4f7fc; border: 1px solid #d9d9d9; border-radius: 4px; text-align: center; font-size: 14px; font-weight: 300; color: #555; cursor: pointer; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; }
		#imgLine section.tag .tag_wrap .tag.selected { background-color: #4c84ff; border-color: #2b65e6; color: #fff; box-shadow: 0 3px 4px 0 rgba(159, 189, 255, 0.7); }
		#imgLine .hover_box {border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
		#imgLine .hover_box div {font-family: Open_Sans; font-size: 13px; color: #555555;}
		#imgLine .hover_div div {word-break: break-word; margin: 2px 5px; white-space: normal; font-weight: 300; font-family: Open_Sans;}							
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
               <div id="imgLine" class="container-fluid">
                  <!-- Page Heading -->
                  


                  <div class="card shadow mb-4 flex fs">
                  
                  	<section class="enrichment">
	                  	<div class="header_wrap flex sb">
		                  	<div class="page_title_wrap">
		                  		<span>Enrichment</span> <span>|</span> Image Line
	                  		</div>
	                  	</div>      
                  		<div class="video_wrap flex tab-pane active" id="imgLine-labeller" role="tabpanel" >
                  			<div class = "prev_data_wrap">
                		 			<div class="prev_btn prev_data"></div>
        		         	</div>
                   			<!-- <div class="prev_btn prev_data"></div> -->
							<!-- <div class="next_btn next_data"></div> -->
							
                   			<canvas class="canvas" id="imgLine-canvas"></canvas>
                   			<!-- prog_bar start -->
                   			<div class="prog_bar flex justify-content-between hide">
                   				<div class="name_wrap ml-2">
                   					<div class="video_name font-weight-bold"></div>
                   				</div>
<!--                    				<div class="save_btn_wrap flex justify-content-end"> -->
<!--                    					<button type="button" class="btn btn-primary  save">저장</button> -->
<!--                    				</div> -->
                   				
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
	                 		<div class="data_list_wrap">		<!-- Data List Popup area start -->
<!-- 	                 			<div class="data_total">Total <span>0</span></div> -->
								<div class="data_list_header flex sb">
									<div class="data_total">Total <span>0</span></div>
									<div class="close_btn">&times;</div>
								</div>	
								<div class="list_table">
									<div class="h_wrap flex">
	<!-- 									<div class="checkBox all" ></div> -->
										<div class="preview">미리보기</div>
										<div class="id">ID</div>
										<div class="path">FILE NAME</div>
										<div class="label_cnt">라벨S</div>
									</div>
									<ul class="c_wrap">
									</ul>
									<div class="f_wrap flex">
										<div id="pagination" class="tui-pagination filter_color"></div>
									</div>
								</div>
	                 		</div>            		<!-- Data List Popup area end -->    							
                 		</div>              <!-- Image Slide area end -->     						
	               		<div class="quick_wrap flex"> <!-- Quick Training & Inference Btn area start -->
							<div id="quick_training_btn" class="quick_btn filter_color">Quick Training</div>
							<div id="quick_inference_btn" class="quick_btn filter_color">Quick Inference</div>
							
							<!-- Quick Training -->
							<div id="quick_training" class="quick_training filter_color">
								<div class="quick_title flex sb">
									Quick Training<span class="quick_close fr"></span>
								</div>
								<div class="input_wrap flex">
									<label>Annotation</label> 
									<input type="text" name="annotation_name" data-length="100" placeholder="데이터세트 패키지명을 입력해주세요." onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'>
								</div>
								<div class="input_wrap flex">
									<label>Project</label> <select id="project_result"
										class="project_result" name="project_result">
		
									</select> <span class="add_project_btn">+</span>
								</div>
								<div class="input_wrap flex"> 
									<label>Task</label> <input type="text" name="task_name"
										placeholder="태스크명을 입력해주세요." data-length="100" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'>
								</div>
								<div class="input_wrap flex">
									<label>Description</label> <input type="text"
										name="task_contents"
										data-length="200" 
										placeholder="설명을 입력해주세요.">
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
									<div class="quick_training_btn">학습 시작</div>
								</div>
								<div id="add_project" class="add_project">
									<div class="quick_title">
										Create New Project
										<!-- 								<span class="project_close fr"></span>							 -->
									</div>
									<input type="text" name="title"
										placeholder="제목을 입력해주세요." data-length="100" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'>
									<textarea class="contents_area" name="contents"
										data-length="200" 
										placeholder="설명을 입력해주세요."></textarea>
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
								<div class="quick_title flex sb">
									Quick Inference<span class="quick_close fr"></span>
								</div>
								<div class="csv_name_input_wrap">
									<!-- 							<span>output file name</span> -->
									<input type="text" name="csv_title"
										placeholder="추론 결과 파일명을 입력해주세요." onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>
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
									<div class="quick_inference_btn">추론 시작</div>
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
	               					<div class="label_title">태그(색인목록) (<span></span>)</div>
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
	<!--                					<div class="label_title">Label (<span></span>)</div> -->
	               					<div class="label_title">Label (<span></span>)</div>
	<!--                					<div class="visible on"></div> -->
									<button type="button" class="btn btn-primary add filter_color">+ Add Label</button>
	                   			</div>
	                   			<div class="category_wrap flex fs"></div>
	                   		</div><!-- label area end -->   
			                <div class="save_btn_wrap flex">
	                 			<button type="button" class="btn btn-primary save filter_color">저장하기</button>
	                 		</div>                   		               	
	                  	</section>                  	
                  	</section>


                <!-- Quick Training & Inference Btn area end -->                     
                     
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
			var that = imgLine;

			// canvas init
			that.data.canvas = new fabric.Canvas('imgLine-canvas',{
				selection : false,
				width : 800,
				height : 600,
				uniScaleTransform : true,
			});
			
			that.bind.evtOnceInit();
// 			imgLine.init();
		    
		});
		
		const imgLine = {
				pt: $("#imgLine"),
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
// 						isPolyActive : true,
						state : false,
						isModified : 0,
					},
					
					scaleFactor : {origWidth:0, origHeight:0, ratio:1},
					
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
					const that = imgLine;
					var data_list_wrap = that.pt.find(".data_list_wrap");
					data_list_wrap.removeClass("active");
					data_list_wrap.css("display", "none");
					
					that.data.canvasObj['datasetId'] = null;
					that.data.canvasObj['datasetId'] = dataset_id;
					that.init(dataset_id);
				},					
				
				init : function(dataset_id) {
					const that = imgLine;
// 					that.bind.evtOnceInit(); //  added by k.park
					// jh.sa 추가 		
					var nodes = wsObj["labeller"].dir.getSelectedNodes();
					var state = that.data.canvasObj["state"];
					console.log("status : " + nodes[0].status);
					if(state == false && $("#" + nodes[0].tId + "_loading").hasClass("upload_wait")) {
		  				alert("데이터를 업로드 하는 중입니다...");
		  				state = true;
		  				/* history.go(0); */
		  			}					
					
					that.computed.clearAllData();
					//$("#loader").show();
					that.bind.resetView();
					//$("#loader").hide();
					that.data.colorHash = new ColorHash();
					that.data.canvasObj['currDataNum'] = 1;
					
					// jh.sa 추가
					that.computed.getDatasetById(dataset_id);					
					//j.seo 수정 
//					var page_num = 0;
					//j.seo 추가 
					let last_cursor = that.computed.getLastCursor(dataset_id);
					var page_num = Math.floor(last_cursor / 50);
					//
					
					$("#imgLine .label_wrap .btn_wrap .add").hide();
					that.pt.find(".category_wrap").html("");
					that.pt.find(".data_list_wrap").removeClass("active").hide();
//					j.seo 수정
//					that.computed.getVideoDataList(page_num, that.data.canvasObj['datasetId']);
					// j.seo 추가
					that.computed.getVideoDataList(page_num, dataset_id, last_cursor);
					//
					that.bind.sideEvtCollision();
// 					labeller.bind.evtAll();
// 					that.bind.evtOnceInit(); //  added by k.park
					
					// Quick Training & Inference
					$("#imgLine .quick_training").removeClass("active");
					$("#imgLine .quick_inference").removeClass("active");
					$("#imgLine .quick_task_list .list_wrap .table_body .task_table tbody").html("");
					imgLineQuick.init();				
					
					that.bind.keydownEvt();
				}, // init end
				
				bind : {
					evtOnceInit : function(){
						
						this.collision();
						this.downEvt();
						this.moveEvt();
						this.upEvt();
						this.wheelEvt();
						this.objMovingEvt();
// 						this.objModifiedEvt();
// 						this.objScalingEvt();
// 						this.keydownEvt();
// 						this.keydownEvt2();
					},
					collision : function(player,canvas) {
						const that = imgLine;
						
						
					}, //collision end
					
					downEvt : () => { // canvas poly mouse down event
						const that = imgLine;
						var canvas = that.data.canvas;
						var canvasObj = that.data.canvasObj;
// 						var meta = that.data.meta;
						that.data.canvas.on('mouse:down',function(o){
							var meta = that.data.meta;
							canvasObj.isDown = true;
							if(canvasObj.freeDrawing == true) {
								var pointer = canvas.getPointer(o.e);
								if($(".label_wrap .category_wrap .cate_wp.selected").length == 0 && o.target == null){
									return;
								}
								
								// 다른 오브젝트 선택 안되게 막음
								let polylineArr = canvas.getObjects();
								for(let i = 0; i < polylineArr.length; i++) {
									console.log("block!");
									polylineArr[i].selectable = false;  
								}
								
								// jh.sa 210406
								if (o.target != null && $(".label_wrap .category_wrap .cate_wp.selected").length <= 0) {
									//that.pt.find(".label_wrap .category_wrap .cate_wp").removeClass("selected");
									//console.log("true");
									that.pt.find(".label_wrap .category_wrap .cate_wp[id='"+o.target.uuid+"']").addClass("selected");
									let color = that.data.colorHash.rgb(o.target.uuid);
									that.pt.find(".label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
									that.pt.find(".label_wrap .category_wrap .cate_wp[id='"+o.target.uuid+"'].selected ").css("border-color","rgb("+color+")");
								}

								var uuid = $(".label_wrap .category_wrap .cate_wp.selected")[0].id;
								
							    canvasObj.origX = pointer.x;
							    canvasObj.origY = pointer.y;
							    
							   	if(canvasObj.origX <= 0) {
							   		canvasObj.origX = 0;
							   	}
							   	if(canvasObj.origY <= 0) {
							   		canvasObj.origY = 0;
							   	}
							   	if(canvasObj.origX >= canvas.getWidth()) {
							   		canvasObj.origX = canvas.getWidth();
							   	}
							   	if(canvasObj.origY >= canvas.getHeight()) {
							   		canvasObj.origY = canvas.getHeight();
							   	}
								var temp = {
							    	x : canvasObj.origX,
							    	y : canvasObj.origY,
								}
								
								// line 종료&grouping 부분 start
								var canvs = canvas.getObjects();
							
								for(var i=0; i<canvs.length; i++){
									if(o.target && o.target['uuid'] == canvs[i]['uuid'] && canvs[i]['uuid'] == uuid && o.target['index'] == canvs[i]['index']){
										canvasObj.freeDrawing = false;
										that.computed.deletePoint(uuid);
										that.computed.generatePoly(uuid);
										meta[uuid].freeDrawing = false;
										for(let i = 0; i < polylineArr.length; i++) {
											polylineArr[i].selectable = true;  
										}
										//canvas.discardActiveObject();
										
										//canvas.setActiveObject(canvs[i]);
										//that.bind.evtHandlers.editPolygon(true);
										return;
									}
								}// line 종료&grouping 부분 end
								
								// line 시작 부분 -> save meta, create point, connect line, generate line(polygon)
								// save & draw point:
								that.computed.saveMetaData(uuid,temp);
// 								that.computed.stackHistory(uuid,"created");
								that.computed.createPoint(uuid,temp);
								//canvas.bringToFront(o[i]);
								
								if(meta[uuid] && meta[uuid]['polyData'].length > 1){
 									//that.computed.generatePoly(uuid);
									that.computed.addLine(uuid);
									meta[uuid].freeDrawing = true;
								}
								
							} else {			// jh.sa 201031
								//console.log("freeDrawing false click!"); 
								//console.log("WTF!")
								var polyLineObj = canvas.getObjects("polyline");
								//var canvs = canvas.getObjects();
								if(o.target) {
									console.log("modifyPolyLine!");
									that.computed.modifyPolyLine(o.target.uuid);
								}
								//console.log("polyLineObj::", polyLineObj);
								//var uuid = $(".label_wrap .category_wrap .cate_wp.selected")[0].id;
								if(o.target && polyLineObj){ 
//	 								canvasObj.freeDrawing = true;
									//var uuid = $(".label_wrap .category_wrap .cate_wp.selected")[0].id;
									//console.log("uuid:" + uuid);
									that.pt.find(".label_wrap .category_wrap .cate_wp").removeClass("selected");
									that.pt.find(".label_wrap .category_wrap .cate_wp[id='"+o.target.uuid+"']").addClass("selected");
									let color = that.data.colorHash.rgb(o.target.uuid);
									that.pt.find(".label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
									that.pt.find(".label_wrap .category_wrap .cate_wp[id='"+o.target.uuid+"'].selected ").css("border-color","rgb("+color+")");
									//var uuid = $(".label_wrap .category_wrap .cate_wp.selected")[0].id;
									
									//$("#imgLine .label_wrap .category_wrap .cate_wp#"+o.target.uuid).trigger("click");
									// jh.sa 210406
									if(o.target.type == "point"){
										var checked = that.computed.checkHistory(o.target.uuid);
										var point = that.computed.getPointObject(o.target.uuid, that.data.meta[o.target.uuid].polyData[o.target.index], o.target.index);
										/* if(checked){
											that.computed.stackHistory(o.target.uuid,"loaded",point);
										} */										
									}
								} 	
// 								that.computed.stackHistory(uuid,"modified");
							}
							
							
						});
					},// canvas poly mouse down event end
					
					moveEvt : () => { // canvas poly mouse move event
						const that = imgLine;
						var data = that.data;
						var canvas = that.data.canvas;
						
						canvas.on('mouse:move', function(evt) {
							var tempPoly = canvas.getActiveObject();
							
							if(data.canvasObj.isDown == true && data.canvasObj.freeDrawing == false){
								var objType = null;
								var target = null;
								var polyline = null;
								
								// 줌 인/아웃시 캔버스 이동
								if(evt.target == null && data.canvasObj.isDown == true && data.canvasObj.freeDrawing == false){
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
								
								// segmentation point 수정
/* 								if(evt.target){
									objType = evt.target.type;
									target = evt.target;
									canvas.getObjects().forEach(function(canv,index){
										if(canv['type'] == 'polygon' && canv['uuid'] == target['uuid']){
											polygon = canv;
										}
									});
									polygon.points[target.index] = {x: target.getCenterPoint().x, y: target.getCenterPoint().y}
								} */
							} 
							
						});
					},// canvas poly mouse move event end
					
					upEvt : () => { // canvas poly mouse up event
						const that = imgLine;
						var data = that.data;
						var meta = that.data.meta;
						var canvas = that.data.canvas;
						var canvasObj = that.data.canvasObj;
						
						canvas.on('mouse:up', function(e) {
							console.log("up!");
							data.canvasObj.isDown = false;
							if(that.pt.find(".label_wrap .category_wrap .cate_wp.selected").length == 0){
								return;
							}
							var uuid = $(".label_wrap .category_wrap .cate_wp.selected")[0].id;
							
							// 다른 오브젝트 선택되게 변경
							/* let polylineArr = canvas.getObjects("polyline");
							for(let i = 0; i < polylineArr.length; i++) {
								polylineArr[i].selectable = false;  
							} */
							
							var canv = that.data.canvas.getObjects();
							var target;
							for(var i=0; i<canv.length; i++){
								if(canv[i]['uuid']==uuid && canv[i]['type'] == 'polyline'){
									target = canv[i];
									break;
								}
							}
							//console.log("target::", target);
							if(target && target.freeDrawing == false){
// 								that.computed.addLine(uuid);
// 								that.computed.generatePoly(uuid);

								canvas.setActiveObject(target);
								that.computed.modifyPolyLine(uuid);
								
								var checked = that.computed.checkHistory(uuid);
								if(checked){
									that.computed.stackHistory(uuid,"loaded");
								}
								/* if(that.data.meta[uuid]['visible']) {
									that.computed.modifyPolyLine(uuid);
								} */
								var prevPoly = that.computed.getPrevPolyData(target)
								var newUpdatedPoints = JSON.parse(JSON.stringify(that.computed.getMatrixPosition(target)));
			                	that.data.meta[uuid]['polyData'] = newUpdatedPoints;
								that.computed.stackHistory(uuid,"modified", e.target, prevPoly);
			            
								//console.log("undo stack !", that.data.undoStack);
								/* if(e.target != null && e.target.type == "point"){
	 								console.log("modified upEvt undoStack: ",that.data.undoStack[that.data.undoStack.length-1]);									
									var prevPoly = that.computed.getPrevPolyData(e.target);
									that.computed.stackHistory(uuid,"modified",e.target,prevPoly);
								} *////////
							} else {
								that.computed.stackHistory(uuid,"created",e.target);
								console.log("created stack !", that.data.undoStack);
							}						
							
				
							var newPoly = that.computed.resetPolyPosition(that.data.canvas.getObjects(),uuid);
							that.data.meta[uuid]['polyData']['box'] = newPoly;
							that.render.renderCropImgIntoLabel(newPoly,uuid);
							
							that.data.canvasObj['isModified'] = 1;
							that.data.meta[uuid].confirmStatus = "0";
						});
					},// canvas poly mouse up event end
					
					wheelEvt : () => {
						const that = imgLine;
						var canvas = that.data.canvas;
						canvas.on("mouse:wheel",function(evt){
// 							console.log("mouse wheel!",evt);
							//클릭 이벤트가 없을경우만 실행
							if(that.data.canvasObj.isDown == false){
								const delta = evt.e.deltaY;
								const pointer = canvas.getPointer(evt.e);
								let zoom = canvas.getZoom();
								zoom = zoom + delta/200;
								
								// jh.sa : zoom 확대 시에 polygon point 크기가 커지던 문제 수정
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
						const that = imgLine;
						var canvas = that.data.canvas;
						that.data.canvas.on("object:moving",function(evt){
							var tempPoly = that.data.canvas.getActiveObject();
							tempPoly = {
									left : evt.target.left,
									top : evt.target.top,
									width : evt.target.width,
									height : evt.target.height,
							}
							
							if(( tempPoly.left + tempPoly.width ) > canvas.getWidth() ){
								tempPoly.left = canvas.getWidth() - tempPoly.width;
							}
							if(( tempPoly.top + tempPoly.height ) > canvas.getHeight() ){
								tempPoly.top = canvas.getHeight() - tempPoly.height;
							}
							if(tempPoly.width > canvas.getWidth()){
								tempPoly.width = canvas.getWidth();
							}
							if(tempPoly.height > canvas.getHeight()){
								tempPoly.height = canvas.getHeight();
							}
							if(tempPoly.left < 0){
								tempPoly.left = 0;
							}
							if(tempPoly.top < 0){
								tempPoly.top = 0;
							}
							evt.target.left = tempPoly.left;
							evt.target.top = tempPoly.top;
							
						});
					},
					evtHandlers : {
						
						getRoot : function(){
							const that = imgLine;
							var canvas = that.data.canvas;
							return that,canvas; 
						},
						// polyline event handler
						polyLinePositionHandler : function(dim,finalMatrix, object){ 
							var x = object.points[this.pointIndex].x - object.pathOffset.x;
							var y = object.points[this.pointIndex].y - object.pathOffset.y;
							return fabric.util.transformPoint(
								{ x : x, y : y, },
								fabric.util.multiplyTransformMatrices( object.canvas.viewportTransform, object.calcTransformMatrix() )
							);
						},
						
						actionHandler : function(eventData, transform, x, y){
							//console.log(":actionHandler:");
							const that = imgLine;
							var canvas = that.data.canvas;
							
							if(x <= 0) { x = 0; };
							if(y <= 0) { y = 0; };
							if(x >= canvas.getWidth()) { x = canvas.getWidth(); };
							if(y >= canvas.getHeight()) { y = canvas.getHeight(); };
							
							var polyline = transform.target,
							currentControl = polyline.controls[polyline.__corner],
							mouseLocalPosition = polyline.toLocalPoint( new fabric.Point(x,y), "center", "center"),
							polygonBaseSize = polyline._getNonTransformedDimensions(),
							size = polyline._getNonTransformedDimensions(0,0),
							finalPointPosition = {
								x : (mouseLocalPosition.x * polygonBaseSize.x) / size.x + polyline.pathOffset.x,
								y : (mouseLocalPosition.y * polygonBaseSize.y) / size.y + polyline.pathOffset.y
							};
							polyline.points[currentControl.pointIndex] = finalPointPosition;
							return true;
						},
						
						anchorWrapper : function(index, fn){
							return function(eventData, transform, x, y){
								var polyline = transform.target,
								absolutePoint = fabric.util.transformPoint({
									x : polyline.points[index].x - polyline.pathOffset.x,
									y : polyline.points[index].y - polyline.pathOffset.y,
								},
								polyline.calcTransformMatrix()
								),
								actionPerformed = fn(eventData, transform, x, y),
								newDim = polyline._setPositionDimensions({});
								var polylineBaseSize = polyline._getNonTransformedDimensions();
								newX = (polyline.points[index].x - polyline.pathOffset.x) / polylineBaseSize.x,
								newY = (polyline.points[index].y - polyline.pathOffset.y) / polylineBaseSize.y;
								polyline.setPositionByOrigin(absolutePoint, newX+0.5, newY+0.5);
								return actionPerformed;
							};
							//console.log("actionPerformed::", "
						},
						
						// main handler
// 						editPolyline : function(){
// 							var handler = this;
// 							var that,canvas = handler.getRoot();
							
// 							var polyline = null; 
// 							var uuid = canvas.getActiveObject()['uuid'];
// 							var canvs = canvas.getObjects();
// 							for(var i=0; i<canvs.length; i++){
// 								if(canvs[i]['type'] == 'polyline' && uuid == canvs[i]['uuid']){
// 									polyline = canvs[i];
// 								}
// 							}
							
// 							if(uuid && polyline){
// 								polyline.edit = true;
// 								polyline.hasBorders = false;
// 								var lastControl = polyline.points.length - 1;
// 								polyline.controls = polyline.points.reduce(function(acc, point, index){
// 									acc["p"+index] = new fabric.Control({
// 										positionHandler : handler.polyLinePositionHandler,
// 										actionHandler : handler.anchorWrapper( index > 0 ? index - 1 : lastControl, handler.actionHandler),
// 										actionName : "modifyPolyline",
// 										pointIndex : index,
// 									});
// 									return acc;
// 								}, {});
// 								canvas.requestRenderAll();
// 							}
// 						}, //editPolyline end
					},
					
// 					objModifiedEvt : () => {
// 						const that = imgLine;
// 						var canvas = that.data.canvas;
// 						canvas.on("object:modified",function(evt){
// 							that.data.canvas.getActiveObject().lockScalingX = false;
// 							that.data.canvas.getActiveObject().lockScalingY = false;	
// 							that.data.canvas.getActiveObject().lockMovementX = false;
// 							that.data.canvas.getActiveObject().lockMovementY = false;
// 						});
// 					},
					
// 					objScalingEvt : () => {
// 						const that = imgLine;
// 						var canvas = that.data.canvas;
						
// 						canvas.on("object:scaling",function(evt){
// // 							$("#labeller-video .vjs-progress-control").hide();
							
// 							var tempPoly = that.data.canvas.getActiveObject();
// 							var pointer = canvas.getPointer(evt.e);
							
// 							tempPoly.width = evt.target.getScaledWidth();
// 							tempPoly.left = evt.target.left;
// 							tempPoly.height = evt.target.getScaledHeight();
// 							tempPoly.top = evt.target.top;
							
// 							// selection pointer 별 예외처리
// 							switch (evt.transform.corner){
// 								case "tl":
// 									tempPoly.set({
// 										width : Math.abs(tempPoly.aCoords.tr.x - pointer.x),
// 										height : Math.abs(tempPoly.aCoords.bl.y - pointer.y) 
// 									});
// 									evt.target.scaleX = tempPoly.width / evt.target.width;
// 									evt.target.scaleY = tempPoly.height / evt.target.height;
// 									break;
// 								case "mt":
// 									tempPoly.set({
// 										width : Math.abs(tempPoly.aCoords.tr.x - tempPoly.aCoords.tl.x),
// 										height : Math.abs(tempPoly.aCoords.br.y - pointer.y)
// 									});
// 									evt.target.scaleX = tempPoly.width / evt.target.width;
// 									evt.target.scaleY = tempPoly.height / evt.target.height;
// 									break;
// 								case "tr":
// 									tempPoly.set({
// 										width : Math.abs(tempPoly.aCoords.tl.x - pointer.x),
// 										height : Math.abs(tempPoly.aCoords.br.y - pointer.y) 
// 									});
// 									evt.target.scaleX = tempPoly.width / evt.target.width;
// 									evt.target.scaleY = tempPoly.height / evt.target.height;
// 									break;
// 								case "bl":
// 									tempPoly.set({
// 										width : Math.abs(tempPoly.aCoords.br.x - pointer.x),
// 										height : Math.abs(tempPoly.aCoords.tl.y - pointer.y) 
// 									});
// 									evt.target.scaleX = tempPoly.width / evt.target.width;
// 									evt.target.scaleY = tempPoly.height / evt.target.height;
// 									break;
// 								case "ml":
// 									tempPoly.set({
// 										width : Math.abs(tempPoly.aCoords.tr.x - pointer.x),
// 										height : Math.abs(tempPoly.aCoords.bl.y - tempPoly.aCoords.tl.y)
// 									});
// 									evt.target.scaleX = tempPoly.width / evt.target.width;
// 									evt.target.scaleY = tempPoly.height / evt.target.height;
// 									break;
// 								case "mb":
// 									tempPoly.set({
// 										width : Math.abs(tempPoly.aCoords.tr.x - tempPoly.aCoords.tl.x),
// 										height : Math.abs(tempPoly.aCoords.tr.y - pointer.y)
// 									});
// 									evt.target.scaleX = tempPoly.width / evt.target.width;
// 									evt.target.scaleY = tempPoly.height / evt.target.height;
// 									break;
// 								case "mr":
// 									tempPoly.set({height : Math.abs(tempPoly.aCoords.bl.y - tempPoly.aCoords.tl.y)});
// 									evt.target.scaleY = tempPoly.height / evt.target.height;
// 									break;
// 							}
							
// 							if(tempPoly.left < 0){
// 								tempPoly.left = 0;
// 								evt.target.left = tempPoly.left;
// 								tempPoly.width = evt.target.aCoords.br.x-0;
// 								evt.target.scaleX = tempPoly.width / evt.target.width;
// 							}
							
// 							if(tempPoly.top < 0){
// 								tempPoly.top = 0;
// 								evt.target.top = tempPoly.top;
// 								tempPoly.height = evt.target.aCoords.br.y-0;
// 								evt.target.scaleY = tempPoly.height / evt.target.height;
// 							}
							
// 							if(tempPoly.left+tempPoly.width > canvas.getWidth() && tempPoly.width < 40) {
// 								tempPoly.left = canvas.getWidth()-40;
// 								evt.target.left = tempPoly.left;
// 								tempPoly.width = evt.target.aCoords.tl.x+40;
// 								evt.target.scaleX = tempPoly.width / evt.target.width;
// 							}
// 							if(tempPoly.top+tempPoly.height > canvas.getHeight() && tempPoly.height < 40) {
// 								tempPoly.top = canvas.getHeight()-40;
// 								evt.target.top = tempPoly.top;
// 								tempPoly.height = evt.target.aCoords.tl.y+40;
// 								evt.target.scaleY = tempPoly.height / evt.target.height;
// 							}
							
// 							if(tempPoly.left+tempPoly.width > canvas.getWidth()) {
// 								tempPoly.width = canvas.getWidth() - tempPoly.left;
// 								evt.target.scaleX = tempPoly.width / evt.target.width;
// 							}
							
// 							if(tempPoly.top + tempPoly.height > canvas.getHeight()) {
// 								tempPoly.height = canvas.getHeight() - tempPoly.top;
// 								evt.target.scaleY = tempPoly.height / evt.target.height;
// 							}
							
// 							if(tempPoly.width < 40){
// 								tempPoly.set({width : 40});
// 								evt.target.scaleX = tempPoly.width / evt.target.width;
// 								tempPoly.lockScalingX = true;
// 							}
							
// 							if(tempPoly.height < 40){
// 								tempPoly.set({height : 40});
// 								evt.target.scaleY = tempPoly.height / evt.target.height;
// 								tempPoly.lockScalingY = true;
// 							}
							
							
// 						});
						
// 					},
					keydownEvt : () => {
						const that = imgLine;
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
								var total_size = $("#imgLine .position_wrap .total_count span").html()*1;
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
						
						$(document).off("keydown").on("keydown",function(evt){
							// del evt
							if(evt.keyCode == "46" || evt.keyCode == "68" && evt.ctrlKey == true){
								
								evt.preventDefault();
// 								if(canvas.getActiveObject() == null){
// 									alert("바운딩 박스를 선택해 주세요.");
// 									return
// 								}
// 								var tmp = confirm("삭제하시면 이후 프레임에 대한 데이터는 삭제됩니다. 그래도 삭제하시겠습니까?");
// 								if(tmp == true && canvas.getActiveObject() != null){
// 									var uuid = canvas.getActiveObject().uuid;
// 									delete that.data.meta[uuid];
									
// // 									that.bind.keydownEvt2();
// 								}

								if(canvas.getActiveObject() == null){
									alert("라벨을 선택해 주세요.");
									return
								}
								var tmp = confirm("데이터를 삭제하시겠습니까?");
								if(tmp == true && canvas.getActiveObject() != null){
									var uuid = canvas.getActiveObject().uuid;
									var dataId = $("#imgLine .c_wrap .path.active").parent("li").attr("data-id");
//		 							var labelBox = $(this).parent().parent().attr("id",uuid);
									var labelBox = $("#imgLine .category_wrap .cate_wp#"+uuid);
									if(uuid.indexOf("-") == -1){
										// call ajax
										that.computed.deleteMetaById(uuid, labelBox[0]);
									} else {
										// not call ajax
										that.computed.deleteMetaData(uuid, labelBox[0],false);
									}					
//		 							delete that.data.meta[uuid];
									//
// 									labeller.bind.evtAll();							
									that.bind.keydownEvt();
								}	
							}
							
							// jh.sa 210318 라벨박스, 메타 복사
							// ctrl + shift + c evt 복사
						    if(evt.ctrlKey == true && evt.shiftKey == true && evt.keyCode == "67"){
						    	console.log("ctrl + shift + c == copy");
						    	evt.preventDefault();
// 								var canv = that.data.canvas.getActiveObject();
								var selected_uuid = that.pt.find(".category_wrap .cate_wp.selected")[0].id;
								var canv = that.data.canvas.getObjects();
								var arr = [];
								for(var i=0; i<canv.length; i++){
									if(canv[i].uuid == selected_uuid){
										arr.push(canv[i]);
									}
								}
								if(canv == null || canv.length == 0 || arr.length == 0){
									alert("세그멘테이션을 선택해 주세요.");
									return;
								} else {
									var copy_id = selected_uuid;
									if(!copy_id){
										alert("복사할 라벨을 선택해 주세요.");
										return;
									}			
									// 라벨박스, 메타 복사
									that.computed.copyMetaData(copy_id);									
								}
						    }
							
						 	// h.lee
							// ctrl + shift + s : 저장
						    if(evt.shiftKey == true && evt.keyCode == "83"){
						    	console.log("ctrl + shift + s == save");
						    	evt.preventDefault();
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
						    // 라벨클릭 + shift + n : 바운딩박스 생성 
						    if(evt.shiftKey == true && evt.keyCode == "78"){
						    	
								var uuid = that.computed.generateUUID();
								var keys = Object.keys(that.data.meta);
								var canvas = that.data.canvas;
								that.data.canvasObj.freeDrawing = true;
								
								// jh.sa 210122 
								if($("#imgLine .category_wrap .cate_wp").length == 0){
									$("#imgLine .label_wrap .category_wrap .no_label").remove();
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
								
								that.data.canvasObj['isModified'] = 1;
								that.computed.initMetaData(uuid,labelNo);
								that.bind.sideEvtCollision();
						    }
						    
						 // jh.sa 210325 
// 						    // ctrl + z evt undo
						    if(evt.ctrlKey == true && evt.shiftKey == false && evt.keyCode == "90"){
// 						    	console.log("ctrl + z == undo");
						    	evt.preventDefault();				
								
								that.computed.history("undo");
								//console.log("undo canvasObj.freeDrawing::", that.data.canvasObj.freeDrawing);
						    }
						    
// 						    // ctrl + shift + z evt redo
						    if(evt.ctrlKey == true && evt.shiftKey == true && evt.keyCode == "90"){
// 						    	console.log("ctrl + shift + z == redo");
						    	evt.preventDefault();	
						    	
								that.computed.history("redo");
						    }	
						    
							// jh.sa 210406
							// shift + p evt line freeDrawing on/off
							/*if(evt.shiftKey == true && evt.keyCode == "80"){
								evt.preventDefault();
								var cate_wp = that.pt.find(".category_wrap .cate_wp.selected");
								var activeObj = that.data.canvas.getActiveObject();
								var uuid;
								if(cate_wp.length > 0){
									uuid = cate_wp[0].id;
								} else if(cate_wp.length == 0 && activeObj != null){
									uuid = activeObj.uuid;
								} else if(cate_wp.length == 0 && activeObj == null){
									alert("라벨 또는 세그멘테이션을 선택해주세요.");
									return;
								}
								if(that.data.canvasObj.freeDrawing == true){
									that.data.canvasObj.freeDrawing = false;
									that.computed.deletePoint(uuid);
									that.computed.generatePoly(uuid);
									var newPoly = that.computed.resetPolyPosition(that.data.canvas.getObjects(),uuid);
									that.render.renderCropImgIntoLabel(newPoly,uuid);
									//that.computed.generatePoly(uuid);
								} else {
									that.data.canvasObj.freeDrawing = true;
									//that.data.canvas.setActiveObject();
									/* var canv = that.computed.getCanvasObject(uuid);
									let length = canv[0].points.length;
									for(let i = 0; i < length; i++) {
										that.computed.createPoint(uuid, canv[0].points[i], i);
									} 
									//that.computed.deletePoint(uuid);
									//that.computed.generatePoly(uuid);
									//that.computed.generatePoly(uuid);
								}
								console.log("shift+p freeDrawing is", that.data.canvasObj.freeDrawing);
							}*/
							
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
					
					keydownEvt2 : function(){
						const that = imgLine;
						var canvas = that.data.canvas;
						
						$(document).off("keydown").on("keydown",function(evt){
							if(evt.keyCode == "46" || evt.keyCode == "68" && evt.ctrlKey == true){
// 								evt.preventDefault();
								var uuid = $("#imgLine .category_wrap .cate_wp").attr("id");
								if(uuid == undefined){
									alert("라벨을 선택해 주세요.");
									return false;
								}
								var tmp = confirm("데이터를 삭제하시겠습니까?");
								if(tmp == true && uuid != undefined){
		// 							var uuid = canvas.getActiveObject().uuid;
		// 							var uuid = canvas.getObjects()[0].uuid;
									
									var dataId = $("#imgLine .c_wrap .path.active").parent("li").attr("data-id");
		// 							var labelBox = $(this).parent().parent().attr("id",uuid);
									var labelBox = $("#imgLine .category_wrap .cate_wp#"+uuid);
									if(uuid.indexOf("-") == -1){
										// call ajax
										that.computed.deleteMetaById(uuid, labelBox[0]);
									} else {
										// not call ajax
										that.computed.deleteMetaData(uuid, labelBox[0],false);
									}					
		// 							delete that.data.meta[uuid];
									//
									labeller.bind.evtAll();							
// 									that.bind.keydownEvt2();
								}						
							}
						});
					},
					
					sideEvtCollision : function(evt) {
						const that = imgLine;
						// 임시
// 						$("#imgLine .quick_btn").off("click").on("click", function(){
// 							alert("서비스 준비중 입니다.");
// 						});						
						
						// DOM Event
						$("#imgLine .label_wrap input[name=label_name]").on("propertychange change keyup paste input", function(e) {
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
						
						$("#imgLine .position-value").off("input").on("input", function(e){
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

						$("#imgLine .label_wrap .btn_wrap .add").off("click").on("click",function(evt){
							$(this).blur();
							var uuid = that.computed.generateUUID();
							var keys = Object.keys(that.data.meta);
							var canvas = that.data.canvas;
							that.data.canvasObj.freeDrawing = true;
							
							// jh.sa 210122 
							if($("#imgLine .category_wrap .cate_wp").length == 0){
								$("#imgLine .label_wrap .category_wrap .no_label").remove();
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
							
							var labelNo = eval($("#imgLine .label_wrap .category_wrap").find(".cate_wp").length+1);
							
							var html = that.render.tempInitCategory(uuid);
							$("#imgLine .label_wrap .category_wrap").append(html);
							
							let color = that.data.colorHash.rgb(uuid);
							$("#imgLine .label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
							
							$("#imgLine .label_wrap .category_wrap .cate_wp").removeClass("selected");
							$("#imgLine .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
							$("#imgLine .label_wrap .category_wrap .cate_wp").last().addClass("selected");
							$("#imgLine .label_wrap .category_wrap .cate_wp[id='"+uuid+"'].selected ").css("border-color","rgb("+color+")");
							
							that.data.canvasObj['isModified'] = 1;
// 							that.computed.initMetaData(uuid,labelNo);
							that.computed.initMetaData(uuid);
							// jh.sa 210325
							that.computed.stackHistory(uuid,"created");
							that.bind.sideEvtCollision();
							
							///////////201031
							var canvs = canvas.getObjects();
							for(var i=0; i<canvs.length; i++){
								var canv_uuid = canvs[i].uuid;
								if(canvs[i].type == "point" && canvs[i].fill == "red"){
// 									delete canvs[i];
// 									that.computed.createPoint(canv_uuid,canvs[i],canvs[i].index);
									canvs[i].fill = "green";
								} else if(canvs[i].type == "polyline" && canvs[i].fill == "#cccccc"){
// 									delete canvs[i];
									that.computed.generatePoly(canv_uuid, false);
								};
							}
							
						});
						
						// alert and meta data delete!!
						$("#imgLine .label_wrap .category_wrap .cate_wp .delete").off("click").on("click",function(evt){
						
							var check = confirm("데이터를 삭제하시겠습니까?");
							if(check == true){
								let uuid = $(this).parent().parent().attr("id");
// 								var dataId = $(".data_item .collapse-item.active").attr("data-id");
								var dataId = $("#imgLine .c_wrap .path.active").parent("li").attr("data-id");
								var labelBox = $(this).parent().parent().attr("id",uuid);
								if(uuid.indexOf("-") == -1){
									// call ajax
									that.computed.deleteMetaById(uuid, labelBox[0]);
								} else {
									// not call ajax
									that.computed.deleteMetaData(uuid, labelBox[0],false);
								}						
							}
						});
						
						$("#imgLine .category_wrap .cate_wp .category").off('keypress').on('keypress',function(evt){
							if(evt.keyCode == 13){
								var uuid = $(this).parent().parent().attr("id");
								that.data.meta[uuid]['category'] = $(this).val();
							}
						});
						
						
						$("#imgLine .category_wrap .cate_wp").off("click").on("click",function(){
							var uuid = $(this).attr("id");
							var color = that.data.colorHash.rgb(uuid);
							$("#imgLine .label_wrap .category_wrap .cate_wp").removeClass("selected");
							$("#imgLine .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
							$(this).addClass("selected");
							$(this).css("border-color","rgb("+color+")");
							
							that.data.canvas.discardActiveObject();
							var canvArr = that.data.canvas.getObjects();
							for(var i=0; i<canvArr.length; i++){
								if(canvArr[i]['uuid'] == uuid){
									if(canvArr[i]['type'] == "point" && canvArr[i]['index'] == 0){
										that.data.canvas.bringToFront(canvArr[i]);
										that.data.canvas.setActiveObject(canvArr[i]);
									}
									// jh.sa 201031
									that.data.canvasObj.freeDrawing = false;
								} else {
									var canvs = that.data.canvas.getObjects();
									for(var j=0; j<canvs.length; j++){
										var canv_uuid = canvs[j].uuid;
										if(canvs[j].type == "point" && canvs[j].fill == "red"){
//		 									delete canvs[i];
//		 									that.computed.createPoint(canv_uuid,canvs[i],canvs[i].index);
											canvs[j].fill = "green";
										} else if(canvs[j].type == "polyline" && canvs[j].fill == "#cccccc"){
//		 									delete canvs[i];
											that.computed.generatePoly(canv_uuid, false);
										};
									}									
								}
							}
							that.data.canvas.fire("mouse:up");
							that.computed.modifyPolyLine(uuid);
						});
						
						// jh.sa test 
						$("#imgLine .save_btn_wrap .save").off("click").on("click",function(){
							$(this).blur();
							if(that.data.canvasObj.freeDrawing) {
								alert("점을 클릭해 폴리 라인을 완성해주세요.");
								return false;
							}
							that.computed.insertMetaData();
						});						
						
						//paging evt
						$(".data_item .prev_page").off("click").on("click",function(){
							var page_num =  $(".data_item.show .current_page .page-link").attr("tabindex")*1-2;
							if(page_num < 0 ){
								page_num = 0;
							}
// 							var dtCate = $(".data_item.show").attr("data-cate");
// 							var isInit = true;
							that.computed.clearAllData();
							that.computed.getVideoDataList(page_num);							
						});
						
						$(".data_item .next_page").off("click").on("click",function(){
					
							var page_num =  $(".data_item.show .current_page .page-link").attr("tabindex")*1;
// 							var dtCate = $(".data_item.show").attr("data-cate");
// 							var isInit = true;
							that.computed.clearAllData();
							that.computed.getVideoDataList(page_num);
						});
						
						$(".pagination .page-item input.page-link").off("keypress").on("keypress",function(evt){
							
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
						
						// jh.sa : data list popup 
						$("#imgLine .data_list_btn").off("click").on("click", function(){
							var data_list_wrap = $("#imgLine .data_list_wrap");
							if(data_list_wrap.hasClass("active")){
								data_list_wrap.removeClass("active");
								data_list_wrap.css("display", "none");	
							} else {
								data_list_wrap.addClass("active");
								data_list_wrap.css("display", "block");	
								data_list_wrap.attr("state", true);
							}
						});				
						
						$("#imgLine .data_list_wrap .close_btn").off("click").on("click", function(){
							var data_list_wrap = $("#imgLine .data_list_wrap");
							data_list_wrap.removeClass("active");
							data_list_wrap.css("display", "none");	
						});						
						
						// jh.sa 210121 데이터 리스트 이외 영역 클릭 시 데이터리스트 닫기
						$("#imgLine .data_list_wrap").off("click").on("click", function(){
							var data_list_wrap = $("#imgLine .data_list_wrap");
							data_list_wrap.attr("state", true);
						});
						
						$(".section.imgLine.selected #wrapper").off("click").on("click", function(){
							//console.log("click");
							var data_list_wrap = $("#imgLine .data_list_wrap");
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
						
						// jh.sa : meta data visibility
						$("#imgLine .label_wrap .category_wrap .cate_wp .visible").off("click").on("click",function(evt){
							let uuid = $(this).parent().parent().attr("id");
							var canv = that.computed.getCanvasObject(uuid);
							var meta = that.data.meta;
							var l_all = $("#imgLine .label_wrap .category_wrap .cate_wp .visible");
							var b_all = $("#imgLine .label_wrap .btn_wrap .visible");
							
							if($(this).hasClass("on")){
								$(this).removeClass("on");
								$(this).addClass("off");
								
								var poly = that.data.canvas.getObjects("polyline");
								for(var i=0; i < poly.length; i++){
									if(poly[i].uuid === uuid){
										for(var j=0; j < poly[i].points.length; j++){
											var rmObj = that.computed.getCanvasObject(uuid);
											that.data.canvas.remove(rmObj);
										}
									}
								}		
								
								that.data.canvas.remove(canv);
								
								var off = $("#imgLine .label_wrap .category_wrap .cate_wp .visible.off");
								if(off.length === l_all.length){
									b_all.removeClass("on");
									b_all.addClass("off");
								}								
								
							} else {
								$(this).removeClass("off");
								$(this).addClass("on");
								
								var polyObj = that.computed.getPolyObject(meta[uuid]);
								var tempPoly = new fabric.Polygon(polyObj);
								
								that.data.canvas.add(tempPoly);
								
								var isSelected = $(this).parent().parent().hasClass("selected");
								var canvArr = that.data.canvas.getObjects();
								for(var i=0; i<canvArr.length; i++){
									if(canvArr[i]['uuid'] == uuid && isSelected){
										that.data.canvas.bringToFront(canvArr[i]);
										that.data.canvas.setActiveObject(canvArr[i]);
									}
								}
								
								var on = $("#imgLine .label_wrap .category_wrap .cate_wp .visible.on");
								if(on.length === l_all.length){
									b_all.removeClass("off");
									b_all.addClass("on");
								}
								
							}
						});		
						
						$("#imgLine .label_wrap .btn_wrap .visible").off("click").on("click",function(evt){
							var label_visible = $("#imgLine .cate_wp .visible");
							
							
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
						
						// jh.sa : data list image preview
						$("#imgLine .c_wrap .preview .img_preview").off("mouseenter").on("mouseenter", function(){
							const x = $(this).offset().left + $(this).outerWidth() + 10;
					        const y = $(this).offset().top + $(this).outerHeight() - 59;
							const html = "<div class='show_img_wrap' style='position: fixed; top: "+ y +"px; left: "+ x +"px;'>"
								+ "<div class='title_wrap flex'><div class='image'></div><span class='title'></span></div>"
								+ "<div class='frame_container'>"
								+ 	"<canvas id='imgLine-cc' width='270px' height='182px'>"
								+ "</div>"
								+ "</div>";
					        $(this).append(html);
					        
					        //img load
// 					        showLoading(".show_img_wrap");
// 					        const id = $(this).parents("li").find(".id").text();
// 					        const path = $(this).parents("li").find(".path").text();
					        
// 					        $(".show_img_wrap .title").text(id);
// 					        that.data.canvasPreview = new fabric.Canvas("imgLine-cc");
// 				 			const imgObj = new Image();
// 							imgObj.src = "/uploadFile/xlabeller/" + path; 
// 							imgObj.onload = function(){ 
// 								that.computed.rescalePreview(this);
								
// 								that.data.canvasPreview.setBackgroundImage(imgObj.src, that.data.canvasPreview.renderAll.bind(that.data.canvasPreview), {
// 									scaleX: that.data.canvasPreview.scaleFactor,
// 									scaleY: that.data.canvasPreview.scaleFactor 
// 							    });
								
// // 								that.clearCanvas();
// // 								that.getMetaList(id);
// 								hideLoading(".show_img_wrap");
// 							}
// 							imgObj.onerror = function(){
// 								hideLoading(".show_img_wrap");
// 							}		

					        showLoading(".show_img_wrap");
					        const id = $(this).parents("li").find(".id").text();
					        const path = $(this).parents("li").find(".path").data("path");
					        const filename = $(this).parents("li").find(".path").text();
					        
					        $(".show_img_wrap .title").text(filename);
					        var canvasPreview = new fabric.Canvas("imgLine-cc");
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
						
						$("#imgLine .c_wrap .preview .img_preview").off("mouseleave").on("mouseleave", function(){
							that.pt.find(".show_img_wrap").remove();
						});							
						
						// k.park 201015
						$("#imgLine .img_list_wrap .data_list_wrap .list_table ul li .path").off("click").on("click",function(){
							var data_num = $(this).parent().attr("data-index")*1-1;
							var page_size=50;
							var currPage = $("#imgLine #pagination .page-item.active .page-link").html()*1-1;
							var currDataNum = currPage*page_size + data_num;
							that.computed.initImgData(currDataNum);
						});
						

						$("#imgLine #pagination .first").off("click").on("click",function(){
							that.computed.clearAllData();
							var page_num = 0;
							that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
						});
						$("#imgLine #pagination .prev").off("click").on("click",function(){
							var page_size = 50;
							var page_num = $("#imgLine #pagination .page-item.active .page-link").html()-2;
							if(page_num<0){
								alert("첫 페이지 입니다.");
								return false;
							}
							that.computed.clearAllData();
							that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
						});
						$("#imgLine #pagination .page-link").off("click").on("click",function(){
							if( isNaN($(this).html()) == false){
								var page_num = $(this).html()*1-1;
								that.computed.clearAllData();
								that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
							}
						});
						$("#imgLine #pagination .next").off("click").on("click",function(){
							var page_size = 50;
							var page_num = $("#imgLine #pagination .page-item.active .page-link").html()*1;
							var lastPage = Math.floor($("#imgLine .position_wrap .total_count span").html()*1/page_size);
							if(page_num>lastPage){
								alert("마지막 페이지 입니다.");
								return false;
							}
							
							var page = $("#imgLine .position_wrap .total_count span").html()*1/page_size;
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
						$("#imgLine #pagination .last").off("click").on("click",function(){
							var page_size = 50;
							that.computed.clearAllData();
							var page_num = Math.floor($("#imgLine .position_wrap .total_count span").html()*1/page_size);
							
							var page = $("#imgLine .position_wrap .total_count span").html()*1/page_size;
							if(page == page_num){
								that.computed.getVideoDataList(page_num-1,that.data.canvasObj['datasetId']);
							} else {
								that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
							}	
							
// 							that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
						});
						
						$("#imgLine .prev_data_wrap").off("click").on("click",function(){
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
						$("#imgLine .next_data_wrap").off("click").on("click",function(){
							var currDataNum = that.data.canvasObj['currDataNum']*1;
							var page_size = 50;
							var total_size = $("#imgLine .position_wrap .total_count span").html()*1;
							if(currDataNum>=total_size){
								alert("마지막 데이터입니다.");
								return;
							}
// 							if(currDataNum%page_size == 0){
// 								var page_num = Math.floor(currDataNum/page_size);
// 								that.computed.clearAllData();
// 								that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
// 								return;
// 							}else{
// 								that.computed.initImgData(currDataNum);	
// 							}
							if(currDataNum%page_size == 0){
								var page_num = Math.floor(currDataNum/page_size);
								that.computed.clearAllData();
								that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
								return;
							}
							that.computed.initImgData(currDataNum);	
							
						});
						
						$("#imgLine .img_list_wrap .name_wrap .prev_btn").off("click").on("click",function(){
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
						$("#imgLine .img_list_wrap .name_wrap .next_btn").off("click").on("click",function(){
							var currDataNum = that.data.canvasObj['currDataNum']*1;
							var page_size = 50;
							var total_size = $("#imgLine .position_wrap .total_count span").html()*1;
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
						
						$("#imgLine .position-value").off("keypress").on("keypress",function(evt){
							if(evt.keyCode == "13"){
								var page_size = 50;
								var targetDataNum = $(this).val()*1-1;
								var targetPageNum = Math.floor(targetDataNum*1/page_size*1)+1;
								var currPageNum = $("#imgLine #pagination .page-item.active .page-link").html();
								var total_size = $("#imgLine .position_wrap .total_count span").html()*1;
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
							            //o[i].hasBorders = false;
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
						                that.computed.modifyPolyLine(uuid);
						                //o[i].hasBorders = true;
										canvas.bringToFront(o[i]);
										canvas.setActiveObject(o[i]);
						            }
								}			
								canvas.renderAll();									
							}							
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
// 								    for(var j=0; j<settingTargets.length; j++){
// 							            if($(settingTargets[j]).hasClass("selected")){
// 							                o[i].selectable = true;
// 											canvas.bringToFront(o[i]);
// 											canvas.setActiveObject(o[i]);
// 							            }
// 								    }
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
                        const that = imgLine;
                        var no_label = '<div class="no_label"><div></div><div>생성된 라벨이 없습니다.</div><div>라벨을 추가해주세요.</div></div>';
						$("#imgLine .category_wrap").html(no_label);                           
//                         $("#imgLine .category_wrap").html("");
                        $("#imgLine .img_list_wrap .name_wrap .file_name").html("");
                        $("#imgLine .total_count span").html("")
                        $("#imgLine .empty_wrap").remove();
                        const html = '<div class="empty_wrap"><div class="no_image"></div><div class="eng_text">선택된 데이터가 없습니다.</div><div class="kor_text">데이터를 선택해주세요.</div></div>';
                        that.pt.find("section.enrichment .canvas-container").hide();
                        that.pt.find("section.enrichment .video_wrap").append(html);
                    },					
					
				},// bind end
				computed : {
					root : null,
					getPrevPolyData(target){
						const that = imgLine;
						console.log("getPrevPoly!");
						//console.log("getPrevPolyData target::", target);
						//console.log("that.data.meta[target.uuid].polyData::", that.data.meta[target.uuid].polyData);
						
						if(!target) {
							return false;
						}
						let prevPoly = null;
						var undoStack = that.data.undoStack;
						//prevPoly = JSON.parse( JSON.stringify(that.data.meta[target.uuid].polyData));
						for(var i=undoStack.length-1; i>=0; i--){
							if(undoStack[i].id == target.uuid){
								prevPoly = JSON.parse( JSON.stringify(undoStack[i].polyData) );
								break;
							}
						} 
						return prevPoly;
					},
					getMatrixPosition : function(target) {
						let that = imgLine;
						let canvas = that.data.canvas;
						let matrix = target.calcTransformMatrix();
						console.log("target.get('points')::", target.get('points'));
						var translatedPoints = target.get("points").map(function(p){
						    return new fabric.Point(
						    	p.x - target.pathOffset.x,
								p.y - target.pathOffset.y);
						    	}).map(function(p){
						    	return fabric.util.transformPoint(p, matrix);
						  	});
			            for (var i = 0; i < translatedPoints.length; i++) {	
			               	if(translatedPoints[i].x <= 0) {
			                    translatedPoints[i].x = 1;
			                }
							if(translatedPoints[i].y <= 0) {
			                  	translatedPoints[i].y = 1;
			                }
			                if(translatedPoints[i].x >= canvas.getWidth()) {
			                   	translatedPoints[i].x = canvas.getWidth() - 1;
			                }
							if(translatedPoints[i].y >= canvas.getHeight()) {
								translatedPoints[i].y = canvas.getHeight() - 1;
			               	}
			            }
			            
			            return translatedPoints;
					},
					// jh.sa 210318 라벨박스, 메타 복사
					copyMetaData : function(copyId){
						const that = imgLine;	
						var meta = that.data.meta;
						var uuid = that.computed.generateUUID();
						that.data.canvasObj['isModified'] = 1;
						console.log("copyMetaData copy data : ", meta[copyId]);
						
						that.data.meta[uuid] = JSON.parse(JSON.stringify(meta[copyId]));
						that.data.meta[uuid]["id"] =  uuid;
						that.data.meta[uuid]["confirmStatus"] =  "0";
						that.data.meta[uuid]["rejectedInfo"] =  null;						
						
						var metaData = meta[uuid]['polyData'];
						
						/* for(var j=0; j<metaData.length; j++){
							that.computed.createPoint(uuid,metaData[j],j);	// jh.sa 201021 수정 
						} */
						that.computed.generatePoly(uuid);
						//that.computed.deletePoint(uuid);
						that.render.renderCopyMeta(uuid);
					},
					createPoint(uuid,pointObj,index) { //create new point
						const that = imgLine;
						var meta = that.data.meta;
// 						var tmpObj = that.computed.getPointObject(uuid,pointObj,meta[uuid]['polyData'].length-1);
						// jh.sa 201021 수정
						var tmpObj;
						if(index == undefined || index == null){
							tmpObj = that.computed.getPointObject(uuid,pointObj,meta[uuid]['polyData'].length-1);
						} else {
							tmpObj = that.computed.getPointObject(uuid,pointObj,index);
						}
						var tempPoint = new fabric.Circle( tmpObj );
						
						if(that.data.meta[uuid]['polyData'].length == 1){
							tempPoint.set({
								fill:'red'
							});
						}
						
						that.data.canvas.add(tempPoint);
						that.data.canvas.setActiveObject(tempPoint);
						that.data.canvas.renderAll();
					},
					checkHistory : function(uuid){
						const that = imgLine;
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
					deletePoint : function(uuid) { //create new point
						const that = imgLine;
						var meta = that.data.meta;
						let canvas = that.data.canvas;
// 					
						canvas.getObjects().forEach(function(canv,index){							
							if(canv['type'] == 'point' && canv['uuid'] == uuid){
								canvas.remove(canv);
							}
							
						});
						
					},
					
					initPolyFromMeta(uuid) { // from Server Data, initiate meta poly data
						const that = imgLine;
						var meta = that.data.meta;
						
						var polyObj = this.getPointObject(meta[uuid]);
						var tempPoly = new fabric.Circle( polyObj );
						
						that.data.canvas.add(tempPoly);
						
					
					}, //init Poly data end
					
					addLine : function(uuid){ //create new line
						const that = imgLine;
						var canvas = that.data.canvas;
						var points = [];
						
						var tmpObj = that.computed.getLineObject(uuid);
						var tmpArr = that.data.meta[uuid]['polyData'].slice(-2);
						console.log("tmpArr::", tmpArr);
						for(var i=0; i<tmpArr.length; i++){
							points.push(tmpArr[i]['x']);
							points.push(tmpArr[i]['y']);
						};
						
						var tempLine = new fabric.Line(points,tmpObj);
// 						var tempLine = new fabric.Polyline(points,tmpObj);
//						canvas.sendBackwards(tempLine)
						canvas.add(tempLine);
						canvas.setActiveObject(tempLine);
						canvas.renderAll();
					},
					// create new poly
					generatePoly : function(uuid){ 
						const that = imgLine;
						var canvas = that.data.canvas;
						var canvasObj = that.data.canvasObj;
						
						var tmpObj = that.computed.getPolyObject(uuid,canvasObj.freeDrawing);
						
						var points = that.data.meta[uuid]['polyData'];
						var tempPoly = new fabric.Polyline(points,tmpObj);
						//console.log("tempPoly::", tempPoly);	
						var polyTransform = tempPoly.calcTransformMatrix();
						var invertPolyTransform = fabric.util.invertTransform(polyTransform);
						
						//console.log("invertPolyTransform::", invertPolyTransform);
						
						$.each(canvas.getObjects(),function(index,obj){
							if(typeof obj.uuid != "undefined" && obj.uuid == uuid && obj.type == "polyline"){
								canvas.remove(obj);
							}
							if(typeof obj.uuid != "undefined" && obj.uuid == uuid && obj.type == "line"){
								canvas.remove(obj);
							}
							/* if(typeof obj.uuid != "undefined" && obj.uuid == uuid && obj.type == "polyline"){
								console.log("remove obj2::", obj);
								canvas.remove(obj);
							} */
							/* if(typeof obj.uuid != "undefined" && obj.uuid == uuid){
								canvas.remove(obj);
							} */
						}); 
						
						var pointsObj = canvas.getObjects().filter(o => o['uuid'] == tempPoly['uuid']);
						pointsObj.forEach(obj => {
							var deisredTransform = fabric.util.multiplyTransformMatrices(invertPolyTransform,obj.calcTransformMatrix());
							obj.relationship = deisredTransform;
						});
						
						canvas.add(tempPoly);
						//canvas.moveTo(tempPoly, 0);
// 						canvas.setActiveObject(tempPoly);
						canvas.renderAll();
						
						that.data.meta[uuid]['polyData']['box'] = {
							left:tempPoly.left,
							top:tempPoly.top,
							width:tempPoly.width,
							height:tempPoly.height,
						}
// 						that.bind.evtHandlers.editPolyline();
					},
					
					// modify polyline
					modifyPolyLine : function(uuid){
						const that = imgLine;
						var canvas = that.data.canvas;
						var handler = that.bind.evtHandlers;
						//console.log("uuid::" + uuid);
						var polyline = null; 
// 						var uuid = canvas.getActiveObject()['uuid'];
						var canvs = canvas.getObjects();
						for(var i=0; i<canvs.length; i++){
							//console.log("canvs[i]::", canvs[i]);
							if(canvs[i]['type'] == 'polyline' && uuid == canvs[i]['uuid']){
								polyline = canvs[i];
								break;
							}
						}
						
						console.log("modify polyLine::", polyline); 
						polyline.edit = true;
						//polyline.hasControls = true;
						polyline.hasBorders = false;
						polyline.cornerStyle = "circle";
 						polyline.cornerColor = "rgba(0,0,255)";
 						polyline.cornerSize = 8;
 						//polyline.radius = 10;
 						//polyline.lockMovementX = true;
 						//polyline.lockMovementY = true;
 						
						var lastControl = polyline.points.length - 1;
						polyline.controls = polyline.points.reduce(function(acc, point, index){
							acc["p"+index] = new fabric.Control({ 
								positionHandler : handler.polyLinePositionHandler,
								actionHandler : handler.anchorWrapper( index > 0 ? index - 1 : lastControl, handler.actionHandler),
								actionName : "modifyPolyline",
								pointIndex : index, 
							});
							return acc;
						}, {});
						
// 						if(!polyline.edit){
// 							polyline.edit = true;
// 							polyline.hasBorders = false;
// 							polyline.cornerStyle = "circle";
// 	 						polyline.cornerColor = "rgba(0,0,255,0.5)";
// 	 						polyline.cornerSize = 8;
// 	 						polyline.lockMovementX = true;
// 	 						polyline.lockMovementY = true;
	 						
// 							var lastControl = polyline.points.length - 1;
// 							polyline.controls = polyline.points.reduce(function(acc, point, index){
// 								acc["p"+index] = new fabric.Control({
// 									positionHandler : handler.polyLinePositionHandler,
// 									actionHandler : handler.anchorWrapper( index > 0 ? index - 1 : lastControl, handler.actionHandler),
// 									actionName : "modifyPolyline",
// 									pointIndex : index,
// 								});
// 								return acc;
// 							}, {});
// // 							canvas.requestRenderAll();
// 						} else {
// 							polyline.edit = false;
// 							polyline.cornerStyle = "circle";
// 	 						polyline.cornerColor = "rgba(0,0,255,0.5)";
// 	 						polyline.controls = fabric.Object.prototype.controls;

// 	 						polyline.hasBorders = true;
// 	 						polyline.lockMovementX = false;
// 	 						polyline.lockMovementY = false;
// 						};
						canvas.setActiveObject(polyline);
						canvas.requestRenderAll();
					},
					
					// get CIRCLE object for initialisation
					getPointObject(uuid,points,index) {
						const that = imgLine;
						var object = {};
						object = {
								type : "point",
								radius: 3,
								fill: 'green',
								left: points.x,
								top: points.y,
								originX: 'center',
								originY: 'center',
								// hasBorders: false,
								objectCaching: false,
								hasControls: false,
								selectable: true,
								index: index,
								uuid : uuid,
						}
						
						return object;	
					},
					// get LINE object for initialisation
					getLineObject(uuid){
						const that = imgLine;
						var object = {
								strokeWidth: 2,
//	 				            fill: '#999999',
//	 				            stroke: '#999999',
					            //stroke : 'rgb('+that.data.colorHash.rgb(uuid)+',0.5)',
					            //stroke : 'rgb('+that.data.colorHash.rgb(uuid)+',0.5)',
					            stroke : 'yellow',
					            type:'line',
					            originX:'center',
					            originY:'center',
					            selectable: false,
					            hasBorders: false,
					            hasControls: false,
					            evented: false,
				                objectCaching:false,
				                uuid:uuid,
							};
						return object;
					},
					
					// get POLYLINE object for initialisation
					getPolyObject : function(uuid,freeDrawing){
						const that = imgLine;
						var meta = that.data.meta;
						var object = {};
						if(freeDrawing == true){
							object = {
								//stroke:'#333333',
								//stroke : 'red',
				                //strokeWidth:3,
				                stroke : 'yellow',
				                strokeWidth:2,
				                type:'polyline',
				                fill: 'transparent',
				                cornerStyle : 'circle',
		 						cornerColor : "rgba(0,0,255,0.5)",
		 						cornerSize : 8,
				                //opacity: 0.3,
				                //
				                selectable: false,
				                hasBorders: false,
				                hasControls: false,
				                //
				                objectCaching:false,
				                lockMovementX: false,
								lockMovementY: false,
								lockScalingFlip : true,
					            lockUniScaling : false,
					            strokeUniform : true,
					            freeDrawing : true,
// 				                evented: false,
				                uuid : uuid,
							};	
						}else{
							object = {
							//	stroke:'rgb('+that.data.colorHash.rgb(uuid)+',0.5)',
// 					            strokeWidth:0.5,
								stroke : 'yellow',
					            strokeWidth:2,
					            type:'polyline',
					            fill: 'transparent',
								//cornerStyle : 'circle',
		 						//cornerColor : "rgba(0,0,255,0.5)",
		 						cornerSize : 8,
		 						//
								selectable: true,
					            hasBorders: false,
					            hasControls: true,
					            //
					            objectCaching:false,
					            noScaleCache : false,
					            lockMovementX: false,
								lockMovementY: false,
								lockScalingFlip : true,
					            lockUniScaling : false,
					            strokeUniform : true,
					            freeDrawing : false ,
					            uuid : uuid,
							}
						}
						return object;
					},
					
					resetPolyPosition(canvObjs,uuid){
						const that = imgLine;
						var scaledRatio = that.data.scaleFactor.ratio;
						var newPoly = null;
						
						for(var i=0; i<canvObjs.length; i++){
							if(canvObjs[i]['uuid'] == uuid && canvObjs[i]['type'] == "polyline"){
								newPoly = canvObjs[i];
							}
						}
						
						if(newPoly == null){
							return;
						}
// 						var tempPoly = {
// 							left : newPoly.aCoords.tl.x/scaledRatio,
// 							top : newPoly.aCoords.tl.y/scaledRatio,
// 							width : (newPoly.aCoords.br.x - newPoly.aCoords.tl.x)/scaledRatio,
// 							height : (newPoly.aCoords.br.y - newPoly.aCoords.tl.y)/scaledRatio,
// 						};
						var tempPoly = {
							left : newPoly.left/scaledRatio,
							top : newPoly.top/scaledRatio,
							width : newPoly.width/scaledRatio,
							height : newPoly.height/scaledRatio,
						}
						
						return tempPoly;
						
					},
					
					initImgData : function(dataNum){
						const that = imgLine;
						let canvas = that.data.canvas;
						var isModified = that.data.canvasObj['isModified'];
						var msg = "데이터 이동 시 저장되지 않은 라벨은 손실됩니다. 계속하시겠습니까?";						
						
						if(isModified == 1){
							if(!confirm(msg)){
								return false;
							}
						}						
						$("#imgLine .category_wrap").html("");
						that.computed.clearAllData();
						that.computed.getDataByNum(dataNum);
						
						// s.kim 210506
						// zoom,undo, redo 초기화
						that.data.undoStack = [];
						that.data.redoStack = [];
						canvas.setZoom(1);
						canvas.viewportTransform[4] = 0;
						canvas.viewportTransform[5] = 0;
						canvas.renderAll();
					},					
					
					// create meta data
					initMetaData(uuid) {
						const that = imgLine;
						
						that.data.meta[uuid] = {
// 							labelNo : labelNo,
							id : uuid,
							polyData : [],
							category : null,
						};
						
					},// create meta data end
					
					clearAllData(){
						const that = imgLine;
						that.data.scaleFactor = {origWidth:0, origHeight:0, ratio:1};
						that.data.canvasObj.isModified = 0;
						this.clearCanvas();
						this.clearMeta();
						this.clearPoly();
					},
					
					clearCanvas(){
						const that = imgLine;
						that.data.canvasObj['currDataNum'] = null;
						that.data.canvas.clear();
					},
					
					clearMeta(){
						const that = imgLine;
						that.data.meta = {};
					},
					
					clearPoly(){
						const that = imgLine;
						that.data.poly = {};
					},					
					
					// jh.sa 201028 추가 
					getDatasetById : function(id){
						var that = imgLine;
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
									//$("#loader").hide();
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
					
					
// 					/*
// 					*  get Video Data List
// 					*/
					getVideoDataList(page,dataSet,currDataNum){
						const that = imgLine;
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
						const that = imgLine;
						$("#loader").show();
						$.ajax({
							url : baseUrl + "data/getDataByNum.json",
							data : {dataset_id:that.data.canvasObj['datasetId'],data_num : dataNum},
							type : "POST",
							traditional : true,
							success : function(res){
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
					
					getMetaByDataId(dataId){
						const that = imgLine;
						var meta = that.data.meta;
						$("#loader").show();
						var deferred = $.ajax({
							url : baseUrl + "meta/getMetaByDataId.json",
							data : {data_id : dataId},
							type : "POST",
							traditional : true,
							success : function(res){
								console.log(":SUCCESS: getMetaByDataId",res);
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
							var temp = [];
							var result = data.result.data;
							$("#imgLine .label_wrap .label_title span").html(result.length);
							
							// jh.sa 210122
							if(result.length > 0){
								that.render.initMetaFromData(result);
							} else {
								var no_label = '<div class="no_label"><div></div><div>생성된 라벨이 없습니다.</div><div>라벨을 추가해주세요.</div></div>';
								$("#imgLine .category_wrap").html(no_label); 	
								$("#loader").hide();
								$("#imgLine .label_wrap .btn_wrap .add").show();
							}
							
// 							that.computed.checkMetaFrame(0);
						});
						
					},
					
					
					getDataDetail(dataId){
						const that = imgLine;
						var meta = that.data.meta;
						$("#loader").show();
						var deferred = $.ajax({
							url : baseUrl + "data/getDataDetail.json",
							data : {data_id : dataId},
							type : "POST",
							traditional : true,
							success : function(res){
// 								console.log(":SUCCESS: getVideoDataById");
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
							var temp = [];
							
							var result = data.result.meta_result;
							
							that.render.initMetaFromData(result);
// 							that.computed.checkMetaFrame(0);
						});
						
					},
					
					searchCategoryInCateTab(name,category_0,pt){
						const that = imgLine;
						$("#loader").show();
						$.ajax({
							url : baseUrl + "category/getSearchCategory.json",
							data : {name:name, category_0:category_0},
							type : "POST",
							traditional : true,
							success : function(res){
// 								console.log("::getSearchCategory::",res);
								that.render.renderSearchCate(res,pt);
								that.bind.sideEvtCollision();
							},
							error : function(err){
								$("#loader").hide();
								console.log("ERROR:",err)
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
					info : startFm, endFm, uuid, polyData Array
					 */
					insertMetaData(){
						const that = imgLine;
						var meta = that.data.meta;
						var keys = Object.keys(meta);
						var data = [];
					
						// 수정!
// 						var dataId = $(".data_item .collapse-item.active").attr("data-id");
						var dataId = that.data.canvas.dataId;
						if(!dataId){
							alert("데이터를 선택해 주세요.");
							return false;
						}
						$("#loader").show();
						for(var i=0; i<keys.length; i++){
							var temp = that.computed.rescale(meta[keys[i]]['polyData'],true);
                            // jh.sa 201022
							var segmentation = [];
							for(var j = 0; j<temp.length; j++){
								segmentation.push(temp[j]);
							}
							var boxInfo = temp.box;
							var box = boxInfo.left + "," + boxInfo.top + "," + boxInfo.width + "," + boxInfo.height; 							
							
							if(meta[keys[i]]['category'] == ""){
								alert("라벨명을 입력해주세요.");
								$("#loader").hide();
								return false;
							}
							
							console.log("temp!!!!",temp);

// 							var tempPoly = {
// 								meta_id : keys[i],
// 								label : meta[keys[i]]['category'],
// 								info : JSON.stringify(temp)
// 							}
							
							var tempPoly = {
									meta_id : keys[i],
									label : meta[keys[i]]['category'],
									info : [],
								}

// 							tempPoly.info.push({
// 								segmentation : JSON.stringify(segmentation) + "",
// 								box : boxInfo,
// 							})
							tempPoly.info.push({
								segmentation,
								box : box,
							})
							tempPoly.info = JSON.stringify(tempPoly.info);
							data.push(tempPoly);
							
						}
						
// 						var ajaxData = {
// 								label_type : "IMAGE_SEGMENTATION",
// 								data_id : dataId,
// 								data : data
// 						}
						
						var ajaxData = {
								label_type : "IMAGE_LINE",
								data_id : dataId,
								data : JSON.stringify(data)
						}						
						
						console.log("ajaxData imgLine: ", ajaxData);
						
						if(data.length <=0){
							alert("저장할 데이터가 없습니다.");
							$("#loader").hide();
							return false;
						}
						
						$.ajax({
							url : baseUrl + "meta/insertMeta.json",
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
									$("#imgLine .category_wrap").html("");
									that.data.canvasObj.isModified = 0;
									that.computed.initImgData(that.data.canvasObj['currDataNum']*1-1);
									that.computed.updateDataset(that.data.canvasObj['datasetId'], ajaxData['data_id']);
									return false;
								}else{
									alert(res.result.data);
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
	 					const that = imgLine;
	 					let result;
	 					$("#loader").show();
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
					// k.park 20201013
					deleteMetaById(uuid, labelBox){
						const that = imgLine;
						$("#loader").show();
						$.ajax({
							url : baseUrl + "meta/deleteMetaById.json",
							data : {meta_id:uuid},
							type : "POST",
							traditional : true,
							success : function(res){
								console.log("=====deleteMetaById=====", res);
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
					
					// load image with getting img info and modifying scale factor
					loadImage : function(dataAddr){
						const that = imgLine;
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
							// jh.sa : getMetaList() 추가 
// 							that.computed.getMetaList()							
						}
					},
					
					// jh.sa 210226 tag
					getLabelGroup : function(dataId){
						const that = imgLine;
						
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
									$("#imgLine .label_wrap .label_title span").html(tagset.length);
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
						const that = imgLine;
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
						const that = imgLine;
// 						var imgObj = this.checkImageSize(dataAddr);
						// 실제 비디오 크기 기준
						// scaleFactor > 1 : 실제 비디오가 캔버스 크기보다 큼
						// scaleFactor < 1 : 실제 비디오가 캔버스 크기보다 작음
						that.data.scaleFactor.origWidth = imgObj['width'];
						that.data.scaleFactor.origHeight = imgObj['height'];
						that.data.scaleFactor.ratio = $("#imgLine-canvas").width() / that.data.scaleFactor.origWidth;
						
					}, // scalefactor end
					
					// re-size poly on canvas
					rescale : function(polyData,isSave){
						const that = imgLine;
						var scaledRatio = that.data.scaleFactor.ratio;
						var tempData = [];
						
						if(!isSave){
							
							for(var i=0; i<polyData.length; i++){
								tempData[i] = {};
								tempData[i].y = polyData[i].y*scaledRatio;
								tempData[i].x = polyData[i].x*scaledRatio;
							}
							// jh.sa 201022 수정
							if(polyData["box"]){
								tempData["box"] = {
										left : polyData["box"].left*scaledRatio,
										top : polyData["box"].top*scaledRatio,
										width : polyData["box"].width*scaledRatio,
										height : polyData["box"].height*scaledRatio,
								}
							}
							
						}else{
							
							for(var i=0; i<polyData.length; i++){
								tempData[i] = {};
								tempData[i].y = polyData[i].y/scaledRatio;
								tempData[i].x = polyData[i].x/scaledRatio;
							}
							
							if(polyData["box"]){
								tempData["box"] = {
										left : polyData["box"].left/scaledRatio,
										top : polyData["box"].top/scaledRatio,
										width : polyData["box"].width/scaledRatio,
										height : polyData["box"].height/scaledRatio,
								}
							}							
							
						}
						
						return tempData;
						
					}, // re-size poly on canvas end
					
					// jh.sa : rescale temp base image
					
					rescaleTempImg(img,w,h){
						const that = imgLine;
						
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
// 						$("#imgLine #imgLine-labeller").height(img.naturalHeight*scaleFactor);						
					},							
					
					
					// save poly all data
					saveMetaData : function(uuid,newPoly){
						window.getSession();
						const that = imgLine;
						var meta = that.data.meta;
						
						var tempPoly = {
							x : newPoly.x,
							y : newPoly.y,
						}
						
						meta[uuid]['id'] = uuid;
						meta[uuid]['polyData'].push(tempPoly);
// 						category : $("#imgLine .category_wrap [id='"+uuid+"'] .category").val();
						meta[uuid]['category'] = $("#imgLine .category_wrap [id="+uuid+"] .category").val();
					},
					
					// k.park 201015
					deleteMetaData(uuid,labelBox,isAjax){
						const that = imgLine;
						var label_name = $(labelBox).find("input").val();
						if(!uuid){
							return false;
						}
						labelBox.remove();
						
						// jh.sa 210122
						if($("#imgLine .category_wrap .cate_wp").length == 0){
							var no_label = '<div class="no_label"><div></div><div>생성된 라벨이 없습니다.</div><div>라벨을 추가해주세요.</div></div>';
							$("#imgLine .label_wrap .category_wrap ").html(no_label);
							that.data.canvasObj.isModified = 0;
						}							
						
						delete that.data.meta[uuid];
						var canv = that.computed.getCanvasObject(uuid);
						// jh.sa 201021
						for(var i = 0; i < canv.length; i++){
							that.data.canvas.remove(canv[i]);
						}
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
						const that = imgLine;
						var canvasObjs = that.data.canvas.getObjects();
						var tempPoly = [];
						
						for(var i=0; i<canvasObjs.length; i++){
							if(canvasObjs[i].uuid == uuid){
// 								tempPoly = canvasObjs[i];
								tempPoly.push(canvasObjs[i]);
							}
						}
						return tempPoly
					},
					history : function(mode){
						const that = imgLine;
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
								//console.log("state::", state);
								if(state != null){
									that.data.redoStack.push(state);
									console.log("undo state", state,"\n","undo stack",that.data.undoStack,"\n","redo stack",that.data.redoStack);
									if(state.action == "label"){
										that.computed.modifyLabel(state, "undo");
										that.data.pauseSaving = false;
										return;
									}
									if(state.action == "created"){
										if(state.polyData == undefined || state.polyData == null || state.polyData.length == 0){
											that.computed.historyBox(state, "undo");
											that.data.pauseSaving = false;
											return;
										}
										that.computed.historyBox(state, "undo");
									}
									if(state.action == "modified"){
// 										that.computed.updateCanvasObj(prev,"undo");			// 수정 필요 서로 다른 객체 병행 작업 시 충돌 발생
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
						    	//var prev = that.data.undoStack[that.data.undoStack.length-1];
						    	if(state != null){
							    	that.data.undoStack.push(state);
							    	console.log("redo state", state,"\n","undo stack",that.data.undoStack,"\n","redo stack",that.data.redoStack);
									if(state.action == "label"){
										that.computed.modifyLabel(state, "redo");
										that.data.pauseSaving = false;
										return;
									}
									if(state.action == "created"){
										if(state.polyData == undefined || state.polyData == null || state.polyData.length == 0){
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
						const that = imgLine;
						var canvas = that.data.canvas;
						
						switch (mode){
						case "undo":
							that.computed.setHistoryCanvasObj(state,null,"undo");	
							break;
						case "redo":
							that.computed.setHistoryCanvasObj(state,null,"redo");
							break;
						}
// 						switch (mode){
// 							case "undo":
// 								if(state.action == "removed"){
// 									that.computed.setHistoryCanvasObj(state);								
// 								} else {
// // 									that.computed.setHistoryCanvasObj(state);
// 					    			var canv = that.computed.getCanvasObject(state.id);
// 					    			for(var i=0; i<canv.length; i++){
// 					    				if(canv[i].uuid == state.id && canv[i].type == "polygon"){
// 					    					that.computed.setHistoryCanvasObj(state,canv[i]);
// 					    					break;
// 					    				}
// 					    			}									
// 								}
// 								break;
// 							case "redo":
// 								if(that.data.meta[state.id] != null){
// 									if(state.action == "created" || state.action == "copied"){
// 										that.computed.setHistoryCanvasObj(state);
// 									} else {
// // 										that.computed.setHistoryCanvasObj(state);
// 						    			var canv = that.computed.getCanvasObject(state.id);
// 						    			for(var i=0; i<canv.length; i++){
// 						    				if(canv[i].uuid == state.id && canv[i].type == "polygon"){
// 						    					that.computed.setHistoryCanvasObj(state,canv[i]);
// 						    					break;
// 						    				}
// 						    			}
										
// 									}
// 								} 
// 								break;
// 						}
					},
					
					// jh.sa 210405
					setHistoryCanvasObj : function(state, canvObj, mode){
						const that = imgLine;
						var canvas = that.data.canvas;
						
						// 분기 삭제 예정
// 						if(canvObj != null){
// 			    			var canv = that.computed.getCanvasObject(state.id);
// 			    			for(var i=0; i<canv.length; i++){
// 			    				if(canv[i].uuid == state.id){
// // 			    				if(canv[i].uuid == state.id && canv[i].type == "point"){
// // 			    					if(state.point.index != null && state.point.index == canv[i].index){
// // // 				    					that.data.meta[state.id].polyData[state.point.index] = null;
// // 			    						that.data.canvas.remove(canv[i]);
// // 				    					that.data.canvas.renderAll();	
// // 				    					break;
// // 			    					}
// // 			    					that.data.meta[state.id].polyData = [];
// // 			    					that.data.canvas.remove(canv[i]);
// // 			    					that.data.canvas.renderAll();
// 			    				}
// 			    			}
// 	    					console.log("canvObj != null => state.point: ", state.point);
// 							var polyData = state["polyData"];
							
// 							for(var j=0; j<polyData.length; j++){
// 								if(state.point.index == j){
// 									that.data.meta[state.id].polyData[state.point.index].x = state.point.left;
// 									that.data.meta[state.id].polyData[state.point.index].y = state.point.top;
// // 									that.computed.saveMetaData(state.id,polyData[j]);
// 									that.computed.createPoint(state.id,polyData[j],j); // 마지막 인덱스 j를 넣지 않으면 점만 움직이는 문제 발생 	
// 								} else {
// 									that.computed.saveMetaData(state.id,polyData[j]);
// 									that.computed.createPoint(state.id,polyData[j],j); // 마지막 인덱스 j를 넣지 않으면 점만 움직이는 문제 발생 										
// 								}
// 							}
// 							var canvs = canvas.getObjects();
// 							for(var j=0; j<canvs.length; j++){
// 								if(canvs[j].type == "point" && canvs[j].fill == "red"){
// 									canvs[j].fill = "gold";
// 								}
// 							}		
							
// 							that.computed.addLine(state.id);
// 							that.computed.generatePoly(state.id);					    			
			    			
// 							that.data.canvasObj.freeDrawing = true;			// undo 과정에서 새로운 point 추가 허용
							
// 							var newPoly = that.computed.resetPolyPosition(that.data.canvas.getObjects(),state.id);
// 							that.render.renderCropImgIntoLabel(newPoly,state.id);			    				
// 							canvas.renderAll();								
// 						} else {
							var polyData;
							if(state.action == "modified" && state.prevPoly != null && mode == "undo"){
								polyData = state.prevPoly;
							} else {
								polyData = state['polyData'];
							}
							
							//console.log("polyData::", polyData);
			    			var uuid = state["id"];
			    			
			    			var canv = that.computed.getCanvasObject(uuid);
			    			for(var i=0; i<canv.length; i++){
			    				//that.data.canvas.remove(canv[i]);
			    				if(canv[i].uuid == state.id){
			    					that.data.meta[uuid].polyData = [];
			    					that.data.canvas.remove(canv[i]);
			    					that.data.canvas.renderAll();
			    				}
			    			}
			    			
							for(var j=0; j<polyData.length; j++){
								that.computed.saveMetaData(uuid,polyData[j]);
								//that.computed.createPoint(uuid,polyData[j],j);
								if(state.action == "created" && mode == "redo" || (that.data.undoStack.length > 0 && that.data.undoStack[that.data.undoStack.length - 1].freeDrawing == true)) {
									console.log("created!");
									that.computed.createPoint(uuid,polyData[j],j);
									that.computed.addLine(uuid);
									that.data.canvasObj.freeDrawing = true;
								}
							}
							
							console.log("state.action:", state.action);
							console.log("mode:", mode);
							if(state.action == "modified" && mode == "redo") {
								console.log("that.data.canvasObj.freeDrawing is false");
								that.data.canvasObj.freeDrawing = false;
							}
							
							var canvs = canvas.getObjects();
							for(var j=0; j<canvs.length; j++){
								if(canvs[j].type == "point" && canvs[j].fill == "red"){
									canvs[j].fill = "gold";
								}
							}	
							
							if(that.data.canvasObj.freeDrawing == false) {
								console.log("generatePoly!");
								//that.computed.addLine(uuid);
								that.computed.generatePoly(uuid);
								var newPoly = that.computed.resetPolyPosition(that.data.canvas.getObjects(),state.id);
								that.render.renderCropImgIntoLabel(newPoly,state.id);
							}
							
							//that.data.canvasObj.freeDrawing = true;			// undo 과정에서 새로운 point 추가 허용
										    				
							canvas.renderAll();										
// 						}
					},
					
					// jh.sa 210402 
					modifyLabel : function(state, mode){
						const that = imgLine;
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
						const that = imgLine;
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
						const that = imgLine;
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
						
						that.bind.sideEvtCollision();							
					},
					
					// jh.sa 210405
					removeHistoryBox : function(state){
						const that = imgLine;
						var canvas = that.data.canvas;
						var canv = canvas.getObjects();
						var arr = [];
					
						//canvas.freeDrawing = true;
						//console.log("that.data.meta[state.id].polyData::", that.data.meta[state.id].polyData);
						for(var i=canv.length; i>0; i--){
							// 캔버스에서 객체 지우고 우측 라벨박스 미리보기도 지우기
							if(canv[i - 1].uuid == state.id){
									arr.push(canv[i-1]);
									canvas.remove(canv[i-1]);
									canvas.renderAll();
									var crop = that.pt.find(".cate_wp#"+state.id).find(".crop_img");
									var ctx = crop[0].getContext('2d');
									var panelW = 200;
									var panelH = 200;
									ctx.clearRect(0,0,panelW,panelH);
									//if(canv[i-1].type == "")
									if(canv[i-1].type == "point") {
										//canvas.remove(canv[i]);
										that.data.meta[state.id].polyData.pop();
										break;
									}
							}
						}
						console.log("canv::", canv);
						//console.log("canv.getActive::", canvas.getActiveObject());
						if(canvas.getActiveObject() == null) {
							that.data.canvasObj.freeDrawing = true;
						}
						// 라벨박스만 남아있을 때 라벨박스, 메타 삭제
						if(arr.length == 0 || state.action == "copied" || state.action == "removed"){
							that.pt.find(".cate_wp#"+state.id).remove();
							delete that.data.meta[state.id];
							that.data.canvasObj.freeDrawing = false;
						}	
						
						console.log("state.polyData::", state.polyData);
						if(state.polyData.length == 0) {
							console.log("delete meta!");
							console.log("state.id::", state.id);
							that.pt.find(".cate_wp#"+state.id).remove();
							that.data.canvasObj.freeDrawing = false;
							delete that.data.meta[state.id];
						}
						
						if(that.pt.find(".category_wrap .cate_wp").length == 0){
							var no_label = '<div class="no_label"><div></div><div>라벨 없음</div><div>라벨을 추가해주세요.</div></div>';
							that.pt.find(".label_wrap .category_wrap ").html(no_label);							
						}
					},					
                    
                    stackHistory : function(uuid, action, point, prevPoly){
                    	const that = imgLine;
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
					        	if(point != null){
					        		data.point = point;
					        	}
					        } else if(action == "modified"){
					        	data.action = "modified";	
					        	if(point != null){
					        		data.point = point;
					        	}					
					        	if(prevPoly != null){
					        		data.prevPoly = prevPoly;
					        	}
					        } else if(action == "removed"){
					        	data.action = "removed";	
					        	if(point != null){
					        		data.point = point;
					        	}					        	
					        } else if(action == "label"){
					        	data.action = "label";
					        } else if(action == "loaded"){
					        	data.action = "loaded";
					        	if(point != null){
					        		data.point = point;
					        	}						        	
					        } else if(action == "copied"){
					        	data.action = "copied";
					        	if(point != null){
					        		data.point = point;
					        	}					        	
					        }
					        undo_stack.push(data);
					        console.log("undoStack from stackHistory: ", undo_stack);
					       	console.log("redoStack from stackHistory: ", redo_stack);
						}						
											
                    },
                    
                    // jh.sa 210521 라벨별 visibility 버튼 클릭 시 캔버스 객체 존재하는지 검사
                    checkExistMeta: function(uuid){
                    	const that = imgLine;
                    	var canvas = that.data.canvas;
                    	var o = canvas.getObjects();
                    	var correct = [];
                    	var incorrect = [];
                    	var isExist = false;
                    	
                    	if(o.length == 0){
                    		isExist = false;
                    	} else {
                    		for(var i=0; i<o.length; i++){
                    		    if(o[i].uuid != uuid){
                    		        incorrect.push(o[i]);
                    		    } else {
                    		        correct.push(o[i]);
                    		    }
                    		}
                    		
                    		if(incorrect.length == o.length && correct.length == 0){
                    			isExist = false;
                    		} else if(correct.length > 0){
                    			isExist = true;
                    		}
                    	}
                    	
                    	return isExist
                    },            
					
				}, // computed end
				
				// draw something
				render : {
					renderCopyMeta : function(uuid){
						const that = imgLine;
						var meta = that.data.meta;
						
						let html = that.render.tempInitCategory(uuid);
						that.pt.find(".label_wrap .category_wrap ").append(html);
						
						var newPoly = that.computed.resetPolyPosition(that.data.canvas.getObjects(),uuid);
						that.render.renderCropImgIntoLabel(newPoly,uuid);
						
						let color = that.data.colorHash.rgb(uuid);
						that.pt.find(".label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
						
						that.pt.find(".label_wrap .category_wrap [id='"+uuid+"'] .category").val(meta[uuid]['category']);
						
						that.computed.stackHistory(uuid,"copied")
						that.bind.sideEvtCollision();
					},	
					updateListPage(temp,startPage,page_size,total_size){
						const that = imgLine;
						var totalPage = Math.ceil(total_size * 1 / page_size);
						
						if($("#imgLine #pagination").data("twbs-pagination")){
							$("#imgLine #pagination").twbsPagination('destroy');
						}
						$("#imgLine #pagination").twbsPagination({
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
					*  jh.sa 201015 : drawDataList
					*/
					drawDataList(data, totalSize, pageNum, pageSize){
						const that = imgLine;
						
						var total = $("#imgLine .data_list_wrap .data_total span");
						var target = $("#imgLine .list_table .c_wrap");
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
					
					renderImageByData(data,total_size){
						const that = imgLine;
						
						
						that.data.canvas['dataId'] = data['data_id'];
						var dataAddr = '/uploadFile/xlabeller/'+data.path;
						
// 						$("#imgLine .prog_bar .name_wrap .video_name").html(data['filename']);
						$("#imgLine .img_list_wrap .name_wrap .file_name").html(data['filename']);
						$("#imgLine .img_list_wrap .name_wrap .file_name").attr("title",data['filename']);
						$("#imgLine .list_table .c_wrap .path").removeClass("active");
						$("#imgLine .list_table .c_wrap [data-id='"+data['data_id']+"'] .path").addClass("active");
						$("#imgLine .list_table .c_wrap [data-id='"+data['data_id']+"'] .label_cnt").html(data['meta_cnt']);
						$("#imgLine .position_wrap .position-value").val(that.data.canvasObj['currDataNum']);
						
						if(total_size){
							$("#imgLine .position_wrap .total_count span").html(total_size);
						}
						
//							that.computed.adjustVideoSrc(dataAddr,fps);
						that.pt.find(".empty_wrap").remove();
						that.pt.find("section.enrichment .canvas-container").show();
						that.render.adjustArea();		// 201103
						
						that.computed.loadImage(dataAddr);
						that.render.checkWindowWidth();
						that.bind.sideEvtCollision();
						
					},							
					
					// function move poly
					movePolyOnCanvas(uuid,arrNum){
						const that = imgLine;
						
						var meta = that.data.meta[uuid].polyData[arrNum];
						var tempPoly = that.computed.getCanvasObject(uuid);
						 
						tempPoly.set({ 
							scaleX : 1,
							scaleY : 1,
							top: Math.abs(meta.top),
							left: Math.abs(meta.left),
							width: Math.abs(meta.width),
							height: Math.abs(meta.height),
						});
						
						tempPoly.setCoords();
						that.data.canvas.renderAll();
						
					},
					initMetaFromData(result){
						const that = imgLine;
						var meta = that.data.meta;
						var keys = [];
						
						$("#imgLine .label_wrap .category_wrap").empty();
						that.data.canvasObj.freeDrawing = false;
						
						for(let i=0; i<result.length; i++){
							var temp = JSON.parse(result[i].info);
							var seg = temp[0].segmentation;
// 							var temp = result[i].info;
							var polyData = that.computed.rescale(seg);
							
							meta[result[i]['meta_id']] = {
									id : result[i]['meta_id'],
									polyData : polyData,
									category : result[i]['label'],
							}							
							keys.push(result[i]['meta_id']);
// 							temp.polyData = that.computed.rescale(temp.polyData);
							
// 							meta[temp.id] = temp;
// 							meta[temp.id]["data_id"] = result[i].data_id;
// 							meta[temp.id]["category"] = result[i]["category"];
						
						};
						
						for(var i=0; i<keys.length; i++){
// 							that.computed.initMetaPoly(keys[i]);
							var metaData = meta[keys[i]]['polyData'];
							
							for(var j=0; j<metaData.length; j++){
								//that.computed.createPoint(keys[i],metaData[j],j);	// jh.sa 201021 수정 
							}
							that.computed.generatePoly(keys[i]);
						}						
						
						that.render.renderCate();
						$("#imgLine .label_wrap .btn_wrap .add").show();
						$("#imgLine .label_wrap .category_wrap .cate").removeClass("selected");
						$("#imgLine .label_wrap .category_wrap .cate").last().addClass("selected");
						$("#loader").hide();
					},
					// in labeller tab
					tempInitCategory(uuid){
						const that = imgLine;
						
						var html = '<div class=" cate_wp  " id="'+uuid+'">';
						html += '	<div class="cate_header col-12 flex sb p-1">';
						html += '		<div class="color  "><div class="visibility"></div></div>';
// 						html += '		<button  class="start_frm btn btn-info">첫점</button>';
// 						html += '		<button class="end_frm btn btn-info">끝점</button>';
// 						html += '       <div class="visible on"></div>';							// jh.sa
						html += '		<button class="delete btn btn-danger ">삭제</button>';
						html += '	</div>';
						html += '	<div class="w-100"></div>';
						html += '	<div class="col-12 text-center p-1">';
						html += '		<input type="text" class="form-control category" name="label_name" onkeyUp="noKor(event);noSpaceForm(this);" onchange="noSpaceForm(this);/>';
						html += '	</div>';
						html += '	<div class="col-12 text-center p-1 crop_wrap"><canvas class="crop_img"></canvas></div>';
						
						html += '</div>';
						
						return html;
					},
					
					// render crop Image from canvas into the Label Box(category_wrap)
					renderCropImgIntoLabel(newPoly,uuid){
						const that = imgLine;
						var scaleRatio = that.data.scaleFactor.ratio;

						if(newPoly == undefined || newPoly == null){
							return;
						}
						var pt = $("#imgLine .label_wrap .category_wrap .cate_wp[id="+uuid+"]").find(".crop_img");
						var ctx = pt[0].getContext('2d');
						
						var panelW = 180;
						var panelH = 105;
						
						var newWidth = 0;
						var newHeight = 0;
						
						var scaleW = newPoly.width/panelW;
						var scaleH = newPoly.height/panelH;
						
						if(scaleW>=scaleH){
							newWidth = newPoly.width/scaleW;
							newHeight = newPoly.height/scaleW;
						}else{
							newWidth = newPoly.width/scaleH;
							newHeight = newPoly.height/scaleH;
						}
						
						pt[0].width = newWidth;
						pt[0].height = newHeight;
						
						ctx.clearRect(0, 0, panelW, panelH);
						ctx.drawImage(that.data.canvas.imgInfo,newPoly.left,newPoly.top,newPoly.width,newPoly.height,0,0,newWidth,newHeight);
						
					},
					
					renderCate() { //drawing category from meta in labeller tab
						const that = imgLine;
						var meta = that.data.meta;
						var metaKeys = Object.keys(meta);
						
						for(var i=0; i<metaKeys.length; i++){
							
							var uuid = meta[metaKeys[i]]['id'];
							var labelNo = meta[metaKeys[i]]['labelNo'];
							
							let html = that.render.tempInitCategory(uuid);
							$("#imgLine .label_wrap .category_wrap ").append(html);
							
							var newPoly = that.computed.resetPolyPosition(that.data.canvas.getObjects(),uuid);
							that.render.renderCropImgIntoLabel(newPoly,uuid);							
							
							let color = that.data.colorHash.rgb(uuid);
							$("#imgLine .label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
							
							$("#imgLine .label_wrap .category_wrap [id='"+uuid+"'] .category").val(meta[metaKeys[i]]['category']);
						}
						that.bind.sideEvtCollision();
					
					}, // drawing category from meta end in Labeller tab
					
					
					adjustArea(){
						const that = imgLine;
						var scaleFactor = that.data.scaleFactor;
						
						var scaledHeight = scaleFactor.origHeight * scaleFactor.ratio;
// 						var progBarHeight = $(".prog_bar").height();
						
						var progBarHeight = 157;
						var headerHeight = 67*1;
						// video area height
// 						$("#labeller-video").css("height",scaledHeight);
						$("#imgLine .enrichment").css("height",scaledHeight*1+progBarHeight+headerHeight);						
						
						// video area height
// 						$("#labeller-video").css("height",scaledHeight);
						// canvas init and adjust height
// 						that.data.canvas.setHeight(scaledHeight-progBarHeight);
// 						that.data.canvas.setHeight(scaledHeight);
// 						// search area height
// 						$(".cate_search_wrap .content_wp").css("height",scaledHeight-progBarHeight);
						
		 				// category area height
// 						$("#imgLine .label_wrap ").css("height",$("#labeller-video")[0].clientHeight);
// 						$("#imgLine .label_wrap .category_wrap").css("height",$("#labeller-video")[0].clientHeight-progBarHeight-10);
						
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
					
					// jh.sa 210226 tag
					drawTagset : function(tags,isDel){
						const that = imgLine;
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
						const that = imgLine;

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
						const that = imgLine;
						elem.find(".hover_box").remove();
					},							
					
				},// draw something end
				
				
		};
		
		const imgLineQuick = {
				data : {
					taskName : null,
					annotationName : null,
					inferenceName : null,		
				},
				init : function(){
					const that = imgLineQuick;
					
					that.bind.quickTraining();
					that.bind.quickInference();
				},
				bind : {
					// Quick Training & Inference
					quickTraining() {
						const that = imgLineQuick;
						
						// quick training 팝업창 띄우기
						$("#imgLine #quick_training_btn").off("click").on("click", function(){
							$("#imgLine .quick_training").toggleClass("active");
							$("#imgLine .quick_training").draggable({containment: "document"});
							$("#imgLine .add_project").removeClass("active");
							$("#imgLine .checkpoint_list").removeClass("active");
							$("#imgLine .quick_training .radioBtn.selected").removeClass("selected");	
							$("#imgLine .training_config").removeClass("active");
							$("#imgLine .add_project_btn")[0].textContent = "+";
							$("#imgLine .training_config_btn")[0].textContent = "+";
							$("#imgLine #quick_training .checkpoint_list_btn")[0].textContent = "+";
							$("#imgLine .description_wrap").removeClass("border");
							$("#imgLine .checkpoint_view").removeClass("active");
							$("#imgLine .algorithm_result").removeAttr("disabled");
							$("#imgLine #training_config .config_wrap").html("");
							$("#imgLine #training_config .description_wrap").html("");	
							$("#imgLine .empty_wrap").remove();
							// j.seo 수정
							/* that.root.computed.getDatasetList(); */
							that.computed.setAnnoTaskName();
							that.computed.getTaskList(null, "0");
							that.computed.getAlgorithmList();
						});
						// 새 project 생성 창 띄우기 버튼 
						$("#imgLine .add_project_btn").off("click").on("click", function() {
							let add_project_zIndex = parseInt($("#imgLine #quick_training .add_project").css("zIndex"));
							let checkpoint_list_zIndex = parseInt($("#imgLine #quick_training .checkpoint_list").css("zIndex"));
							let train_config_zIndex = parseInt($("#imgLine #quick_training .training_config").css("zIndex"));	
							
							$("#imgLine .add_project").toggleClass("active");
							$("#imgLine .add_project input").val("");
							$("#imgLine .add_project textarea").val("");
							if($("#imgLine .add_project").hasClass("active")){
								$("#imgLine .add_project_btn")[0].textContent = "-";
							} else {
								$("#imgLine .add_project_btn")[0].textContent = "+";
							}
							
							// z-index 우선순위 제어
							if(add_project_zIndex <= checkpoint_list_zIndex){
								$("#imgLine #quick_training .add_project").css({"zIndex":checkpoint_list_zIndex + 1});
							} else if(add_project_zIndex <= train_config_zIndex) {
								$("#imgLine #quick_training .add_project").css({"zIndex":train_config_zIndex + 1});
							}					
						});
						// Checkpoint list 창 띄우기 버튼
						$("#imgLine #quick_training .checkpoint_list_btn").off("click").on("click", function() {
							let add_project_zIndex = parseInt($("#imgLine #quick_training .add_project").css("zIndex"));
							let checkpoint_list_zIndex = parseInt($("#imgLine #quick_training .checkpoint_list").css("zIndex"));
							let train_config_zIndex = parseInt($("#imgLine #quick_training .training_config").css("zIndex"));
							
							if($("#imgLine .task_result").val() != ""){
								$("#imgLine #quick_training .checkpoint_list").toggleClass("active");
//		 						$("#imgLine .empty_wrap").remove();
//		 						$(".quick_training .radioBtn.selected").removeClass("selected");	// 수정 창 띄울때 없애는것이 아니라 옵션이 바뀔때 없애야함
								if($("#imgLine #quick_training .checkpoint_list").hasClass("active")){
									$("#imgLine #quick_training .checkpoint_list_btn")[0].textContent = "-";
								} else {
									$("#imgLine #quick_training .checkpoint_list_btn")[0].textContent = "+";
								}					
							} else {
								alert("Inheritance에 사용할 task를 선택해주세요");	
							}
							
							// z-index 우선순위 제어
							if(checkpoint_list_zIndex <= add_project_zIndex){
								$("#imgLine #quick_training .checkpoint_list").css({"zIndex":add_project_zIndex + 1});
							} else if(checkpoint_list_zIndex <= train_config_zIndex) {
								$("#imgLine #quick_training .checkpoint_list").css({"zIndex":train_config_zIndex + 1});
							}					
						});
						// Training config 입력 영역 띄우기 버튼
						$("#imgLine .training_config_btn").off("click").on("click", function() {
							let add_project_zIndex = parseInt($("#imgLine #quick_training .add_project").css("zIndex"));
							let checkpoint_list_zIndex = parseInt($("#imgLine #quick_training .checkpoint_list").css("zIndex"));
							let train_config_zIndex = parseInt($("#imgLine #quick_training .training_config").css("zIndex"));
							
							$("#imgLine .training_config").toggleClass("active");
//		 					$("#imgLine .description_wrap").html("");
							if($("#imgLine .training_config").hasClass("active")){
								$("#imgLine .training_config_btn")[0].textContent = "-";
							} else {
								$("#imgLine .training_config_btn")[0].textContent = "+";
							}
							
							// z-index 우선순위 제어
							if(train_config_zIndex <= add_project_zIndex){
								$("#imgLine #quick_training .training_config").css({"zIndex":add_project_zIndex + 1});
							} else if(train_config_zIndex <= checkpoint_list_zIndex) {
								$("#imgLine #quick_training .training_config").css({"zIndex":checkpoint_list_zIndex + 1});
							}					
						});					
						// 팝업창 닫기
						$("#imgLine #quick_training .quick_close").off("click").on("click", function() {
							$("#imgLine .quick_training").removeClass("active");
							$("#imgLine .checkpoint_list .selected_task_name").html("");					
						});
						$("#imgLine #quick_training .add_project .side_btn_wrap .cancel_btn").off("click").on("click", function() {
							$("#imgLine .add_project").removeClass("active");
							$("#imgLine .add_project_btn")[0].textContent = "+";
						});
						$("#imgLine #quick_training .training_config .side_btn_wrap .cancel_btn").off("click").on("click", function() {
							$("#imgLine .training_config").removeClass("active");
							$("#imgLine .training_config_btn")[0].textContent = "+";
							let temp_id = $("#imgLine .quick_training .algorithm_result option:selected").data("id");
							that.computed.getAlgorithmById(temp_id, "0");
						});		
						$("#imgLine #quick_training .training_config .side_btn_wrap .save_btn").off("click").on("click", function() {
							$("#imgLine .training_config").removeClass("active");
							$("#imgLine .training_config_btn")[0].textContent = "+";
						});						
						
						$("#imgLine #quick_training .checkpoint_list .side_btn_wrap .cancel_btn").off("click").on("click", function() {
							$("#imgLine #quick_training .checkpoint_list").removeClass("active");
							$("#imgLine #quick_training .checkpoint_list_btn")[0].textContent = "+";					
//		 					$(".quick_training .radioBtn.selected").removeClass("selected");
							if($("#imgLine .quick_training .radioBtn.selected").length == 0){
								$("#imgLine .checkpoint_view").removeClass("active");
							}
							let temp_id = $("#imgLine .quick_training .task_result option:selected").data("id");
							that.computed.getCheckpointList(temp_id, "0");
						});		
						$("#imgLine #quick_training .checkpoint_list .side_btn_wrap .save_btn").off("click").on("click", function() {
							$("#imgLine #quick_training .checkpoint_list").removeClass("active");
							$("#imgLine #quick_training .checkpoint_list_btn")[0].textContent = "+";
						});
						// project 생성 버튼
						$("#imgLine .quick_training .add_btn").off("click").on("click", function() {
							that.computed.getProjectData();
							$("#imgLine .add_project").removeClass("active");
							$("#imgLine .add_project_btn")[0].textContent = "+";					
						});
						// start training 버튼 			
						$("#imgLine .quick_training_btn").off("click").on("click", function() {
							$("#imgLine .algorithm_result").removeAttr("disabled");
							that.computed.createJsonQuickTrain();
						});
					
					},
					
					quickInference() {
						const that = imgLineQuick;
						
						// 팝업창 띄우기
						$("#imgLine #quick_inference_btn").off("click").on("click", function(){
							$("#imgLine .quick_inference").toggleClass("active");
							$("#imgLine .quick_inference").draggable({containment: "document"});
							$("#imgLine .quick_inference .radioBtn.selected").removeClass("selected");					
							$("#imgLine .inference_config").removeClass("active");
							$("#imgLine .inference_config_btn")[0].textContent = "+";			
							$("#imgLine .description_wrap").removeClass("border");						
							$("#imgLine #inference_config .config_wrap").html("");
							$("#imgLine #inference_config .description_wrap").html("");
							$("#imgLine .quick_task_list .table_body tbody").html("");
							that.computed.getTaskList(null, "1");
							that.computed.setAnnoTaskName();
						});				
						// Inference config 입력 영역 띄우기 버튼
						$("#imgLine .inference_config_btn").off("click").on("click", function() {
							if($("#imgLine #quick_inference .radioBtn.selected").length == 0){
								alert("Task를 선택해주세요");
								return
							} else {
								$("#imgLine .inference_config").toggleClass("active");
//			 					$("#imgLine .description_wrap").html("");
								if($("#imgLine .inference_config").hasClass("active")){
									$("#imgLine .inference_config_btn")[0].textContent = "-";
								} else {
									$("#imgLine .inference_config_btn")[0].textContent = "+";
								}
							}
						});				
						// 팝업창 닫기
						$("#imgLine #quick_inference .quick_close").off("click").on("click", function() {
							$("#imgLine .quick_inference").removeClass("active");
							$("#imgLine .quick_inference input[name='csv_title']").val("");
						});	
						$("#imgLine #quick_inference .side_btn_wrap .cancel_btn").off("click").on("click", function() {
							$("#imgLine .inference_config").removeClass("active");
							$("#imgLine .inference_config_btn")[0].textContent = "+";
							let temp_id = $("#imgLine .quick_inference .quick_task_list .radioBtn.selected").parent().next().data("id");
							that.computed.getTaskById(temp_id);
						});		
						$("#imgLine #quick_inference .side_btn_wrap .save_btn").off("click").on("click", function() {
							$("#imgLine .inference_config").removeClass("active");
							$("#imgLine .inference_config_btn")[0].textContent = "+";
						});							
						// run inference 버튼 			
						$("#imgLine .quick_inference_btn").off("click").on("click", function() {
							that.computed.createJsonQuickInference();
						});				
					},		
					
					checkPointListener() {
						const that = imgLineQuick;
						 
						let chk_radio_obj;
						let row_click = $("#imgLine .checkpoint_list .list_wrap .checkpoint_table tbody tr")
						row_click.off("click").on("click",function() {
							let tr = $(this);
							let btn = tr.children().children(".radioBtn");
							let chkpoint_name = tr.children(".checkPoint_name").val();
							let checkpoint_view = $("#imgLine .checkpoint_view");
							btn.toggleClass("selected");
							if(btn.hasClass("selected")){
								chk_radio_obj = {};
								$("#imgLine .checkpoint_list .list_wrap .checkpoint_table tbody tr .radioBtn").removeClass("selected");
								btn.addClass("selected");
								chk_radio_obj[chkpoint_name] = chkpoint_name;
//		 						that.selectCheckpointAlgorithm();
								
								let selected_id = $("#imgLine .task_result option:selected").data("id");
								that.render.getSelectedTaskById(selected_id);
								
								let selected_cp_name = $("#imgLine .checkpoint_list .radioBtn.selected").parent().next().text();
								console.log("chkpoint_name: ", selected_cp_name);
								checkpoint_view.addClass("active");
								checkpoint_view.html("Selected Checkpoint :" + selected_cp_name);
								
								$("#imgLine .algorithm_result").attr("disabled","disabled");		// 체크포인트 선택 시 algorithm select 비활성화 
							} else {
								chk_radio_obj = {};
								$("#imgLine .algorithm_result").removeAttr("disabled");
								checkpoint_view.removeClass("active");
								checkpoint_view.html("");
								// 초기화시 SOLO 기본값 적용 
								let options = $("#imgLine .algorithm_result").children("option");
								let selected_option_id;
								for(var i=1; i < options.length; i++){
								    if(options[i].label == "SOLO"){
								    	options[i].selected = true;
								    	selected_option_id = options[i].attributes["data-id"].value
								    }
								}
								that.computed.getAlgorithmById(selected_option_id, "0", null);				// SOLO algorithm_id
							}
							
						});	
					},
					
					inferenceCheckPointListener() {
						const that = imgLineQuick;
						 
						let chk_radio_obj;
						let row_click = $("#imgLine .inference_checkpoint .list_wrap .checkpoint_table tbody tr")
						row_click.off("click").on("click",function() {
							let tr = $(this);
							let btn = tr.children().children(".radioBtn");
							let chkpoint_name = tr.children(".checkPoint_name").val();
							let checkpoint_view = $("#imgLine .checkpoint_view");
							btn.toggleClass("selected");
							if(btn.hasClass("selected")){
								chk_radio_obj = {};
								$("#imgLine .inference_checkpoint .list_wrap .checkpoint_table tbody tr .radioBtn").removeClass("selected");
								btn.addClass("selected");
								chk_radio_obj[chkpoint_name] = chkpoint_name;
								
//		 						let selected_cp_name = $("#imgLine .inference_checkpoint .radioBtn.selected").parent().next().text();
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
						const that = imgLineQuick;
						 
						let chk_radio_obj_inf;
						let row_click_inf = $("#imgLine #quick_inference .list_wrap .table_body .task_table tbody tr")
						row_click_inf.off("click").on("click",function() {
							let tr = $(this);
							let btn = tr.children().children(".radioBtn");
							let task_name = tr.children(".task_name").val();
							let task_id = tr.children(".task_name")[0].attributes["data-id"].value;
							btn.toggleClass("selected");
							if(btn.hasClass("selected")){
								chk_radio_obj_inf = {};
								$("#imgLine #quick_inference .list_wrap .table_body .task_table tbody tr .radioBtn").removeClass("selected");
								btn.addClass("selected");
								chk_radio_obj_inf[task_name] = task_name;
							} else {
								chk_radio_obj_inf = {};
								$("#imgLine .inference_checkpoint .list_wrap .checkpoint_table tbody").html("");
								$("#imgLine .inference_config").removeClass("active");
								$("#imgLine .inference_config_btn")[0].textContent = "+";
							}
							$("#imgLine .inference_checkpoint .list_wrap .checkpoint_table tbody").html("");
							that.computed.getTaskById(task_id);
							$("#imgLine #inference_config .description_wrap").addClass("border");	
						});	
						
						let chk_radio_obj_train;
						let row_click_train = $("#imgLine #quick_training .list_wrap .table_body .task_table tbody tr")
						row_click_train.off("click").on("click",function() {
							let tr = $(this);
							let btn = tr.children().children(".radioBtn");
							let task_name = tr.children(".task_name").val();
							let task_id = tr.children(".task_name")[0].attributes["data-id"].value;
							btn.toggleClass("selected");
							if(btn.hasClass("selected")){
								chk_radio_obj_train = {};
								$("#imgLine #quick_training .list_wrap .table_body .task_table tbody tr .radioBtn").removeClass("selected");
								btn.addClass("selected");
								chk_radio_obj_train[task_name] = task_name;
							} else {
								chk_radio_obj_train = {};
							}
							that.computed.getTaskById(task_id);
							$("#imgLine #training_config .description_wrap").addClass("border");	
						});					
					},				
					
					selectCheckpointAlgorithm(algorithm_id){
						const that = imgLineQuick;
						
						console.log("algorithm_id???? ", algorithm_id);
						let options = $("#imgLine .algorithm_result").children("option");
						for(var i=1; i < options.length; i++){
						    if(options[i].attributes["data-id"].value == algorithm_id){
						    	options[i].selected = true;
						    }
						}
					},				
					
				},
				computed : {
					
					setAnnoTaskName() {
						const that = imgLineQuick;
						$("#loader").show();
						const deffered = $.ajax({
							url : baseUrl + "task/setAnnoTaskName.json",
							data : {dataset_id : imgLine.data.canvasObj.datasetId},
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
						const that = imgLineQuick;
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
						const that = imgLineQuick;
						$("#loader").show();
						const deffered = $.ajax({
							url : baseUrl + "task/getQuickInferenceTaskList.json",
							data : {project_id : null, dataset_id : imgLine.data.canvasObj.datasetId},
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
						const that = imgLineQuick;
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
								console.log("ERROR!!", err);
							}
						});
						return deffered;								
					},				
					
					getAlgorithmList(){
						const that = imgLineQuick;
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
						const that = imgLineQuick;
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
						const that = imgLineQuick;
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
						const that = imgLineQuick;
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
						const that = imgLineQuick;
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
						const that = imgLineQuick;
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
						const that = imgLineQuick;
						
						let title = $("#imgLine .add_project input[name='title']").val();
						let contents = $("#imgLine .add_project textarea[name='contents']").val();

						if(title == ""){
						 	alert("제목을 입력해주세요");
						 	$("#imgLine input[name='title']").focus();
						 	return;
						}
						
						if(contents == ""){
						 	alert("내용을 입력해주세요");
						 	$("#imgLine textarea[name='contents']").focus();
						 	return;
						} 
						

						$("#loader").show();
						console.log("title, contents : ", title, contents);
						that.computed.insertProject(title, contents);				
					},			
					
					insertProject(t, c){
						const that = imgLineQuick;
						
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
//			 						that.drawTaskList(task_list_data, res.result.data);
									that.computed.getTaskList(res.result.data,"0");
									$("#imgLine .quick_training .add_project").removeClass("active");
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
						const that = imgLineQuick;
						let annotation_title = $("#imgLine input[name='annotation_name']");
						let task_title = $("#imgLine input[name='task_name']");
						let task_contents = $("#imgLine input[name='task_contents']");
						let training_arr = {};
						let project_id = $("#imgLine select[name='project_result'] option:selected").attr("data-id");
		 				let algorithm_id = $("#imgLine select[name='algorithm_result'] option:selected").attr("data-id");
		 				let base_task_id = $("#imgLine select[name='task_result'] option:selected").attr("data-id");
		 				let selected_checkpoint_name = null;
		 				// config변수
		 				let train_string = $("#imgLine .training_config .config_wrap").children(".light").children("input[type='text']");
		 				let train_number = $("#imgLine .training_config .config_wrap").children(".light").children("input[type='number']");
		 				let train_chk = $("#imgLine .training_config .config_wrap").children(".check").children(".check_box_wrap").children(".check_box").children(".first");
		 				console.log("train_chk::", train_chk);
		 				console.log("train_string::", train_string);
		 				console.log("train_number::", train_number);
		 	 			let train_arr = {};
		 	 			
		 				/* let selected_checkpoint_name = $("#imgLine .radioBtn.selected").parent().parent("tr").children(".checkPoint_name"); */
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
		 					selected_checkpoint_name = $("#imgLine .checkpoint_list .radioBtn.selected").parent().parent("tr").children(".checkPoint_name").text();
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
						training_arr["dataset_id"] = imgLine.data.canvasObj.datasetId;
		 				training_arr["project_id"] = project_id;
		 				training_arr["algorithm_id"] = algorithm_id;
		 				training_arr["config"] = result_string;
		 				training_arr["base_task_id"] = base_task_id;
		 				training_arr["selected_checkpoint_name"] = selected_checkpoint_name;
						
						var quick_training_data = JSON.stringify(training_arr);
						console.log("quick_training_data : ", quick_training_data);
//		 				$("#imgLine #quick_training").removeClass("active");		// training confirm 에서 확인 시 200일 때 닫기 
//		 				annotation_title.val("");										// training confirm 에서 확인 시 200일 때 초기화 
//		 				task_title.val("");												// training confirm 에서 확인 시 200일 때 초기화
						that.computed.ajaxQuickTrain(training_arr, quick_training_data);
					},
					
					createJsonQuickInference(){
						const that = imgLineQuick;
						
						let select_task_btn = $("#imgLine #quick_inference .radioBtn");
						let selected_task = $("#imgLine #quick_inference .radioBtn.selected").parent().parent("tr").children(".task_name");
						let csv_title = $("#imgLine input[name='csv_title']").val();
						let check_box = $("#imgLine #quick_inference .checkBox");
					    let inf_string = $("#imgLine #quick_inference .config_wrap").children(".light").children("input[type='text']");
					    let inf_number = $("#imgLine #quick_inference .config_wrap").children(".light").children("input[type='number']");
					    let inf_chk = $("#imgLine #quick_inference .config_wrap").children(".check").children(".check_box_wrap").children(".check_box").children(".first");
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
						
						selected_checkpoint_name = $("#imgLine .inference_checkpoint .radioBtn.selected").parent().next().text();
						if(selected_checkpoint_name == null || selected_checkpoint_name == "" || selected_checkpoint_name == undefined) {
							alert("CheckPoint를 선택해주세요.");
							return ;
						}
						
						inference_arr["selected_task_id"] = selected_task_id;
						inference_arr["dataset_id"] = imgLine.data.canvasObj.datasetId;
						inference_arr["csv_title"] = csv_title;
						inference_arr["config"] = config_string;
						inference_arr["selected_checkpoint_name"] = selected_checkpoint_name;
						
						var quick_inference_data = JSON.stringify(inference_arr);
						console.log("selected_task_id: ", selected_task_id);
						console.log("current dataset_id : ", that.data.dataset_id);
						console.log("quick_project_id dataset_id : ", quick_project_id);
						console.log("quick_inference_data : ", quick_inference_data);
						that.computed.ajaxQuickInference(inference_arr, quick_project_id, quick_inference_data);
					},
					
					ajaxQuickTrain(arr, data){
						const that = imgLineQuick;
						//let ajaxData = data;
						let annotation_title = $("#imgLine input[name='annotation_name']");
						let task_title = $("#imgLine input[name='task_name']");
						let ajaxData = {
		 						annotation_title : arr.annotation_title,
		 						task_title : arr.task_title,
		 						contents : arr.task_contents,
		 						dataset_id : imgLine.data.canvasObj.datasetId * 1,
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
										$("#imgLine #quick_training").removeClass("active");
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
						const that = imgLineQuick;
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
										$("#imgLine #quick_inference").removeClass("active");
										// 세션에 task_id, project_id 저장 후 inference list 확인을 위해 trainer 페이지로 이동 
										if(window.sessionStorage){
											sessionStorage.setItem("selected_task_id", arr.selected_task_id);
											sessionStorage.setItem("selected_pId", quick_project_id);
											let position = sessionStorage.getItem("selected_task_id");
											let position2 = sessionStorage.getItem("selected_pId");
											console.log("position: ", position, position2);
										}
										imgLine.init(imgLine.data.canvasObj["datasetId"]);
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
						const that = imgLineQuick;
						elem.append("<div class='empty_wrap'><div class='no_image'></div><div class='eng_text'>"+data1+"</div><div class='kor_text'>"+data2+"</div></div>")
					},
					
					removeEmptyData(elem){
						const that = imgLineQuick;
						elem.find(".empty_wrap").remove();
					},
					
					drawDefaultQuickInfo(datasetData){
						const that = imgLineQuick;
						
						let dataset_data = datasetData;
						let annotation_title_input = $("#imgLine input[name='annotation_name']");
						let task_title_input = $("#imgLine input[name='task_name']");
						let task_contents_input = $("#imgLine input[name='task_contents']");
					
						console.log("dataset_data : ", dataset_data);
						console.log("taskName3 : " + that.data.taskName);
						console.log("annoName3 : " + that.data.annotationName);
						for(let i = 0; i < dataset_data.length; i++){
							if(dataset_data[i].dataset_id === imgLine.data.canvasObj.datasetId){
								$(annotation_title_input).val(that.data.annotationName);			// jh.sa default name  
								$(task_title_input).val(that.data.taskName); 
								$(task_contents_input).val("Quick training model");
							} else {
								continue;
							}
						};
					},					
					
					drawDefaultCsvInfo(datasetData){
						const that = imgLineQuick;
					
						let dataset_data = datasetData;
						let csv_title = $("#imgLine input[name='csv_title']");
					
						console.log("dataset_data : ", dataset_data);
						for(let i = 0; i < dataset_data.length; i++){
							if(dataset_data[i].dataset_id === imgLine.data.canvasObj.datasetId){
								csv_title.val(that.data.inferenceName);			// jh.sa default name  
							} else {
								continue;
							}
						};				
					},					
					
					drawAlgorithmList(data){
						const that = imgLineQuick;
						
						console.log("algorithmListData : ", data);
						let selectTarget = $("#imgLine .quick_training .algorithm_result");
						$(selectTarget).html("");
						
						let html = "<option value=''>Please select the algorithm</option>"; 
						for(let i=0, len = data.length; i<len; i++){
							if(data[i].label_type == "IMAGE_SEGMENTATION"){
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
						const that = imgLineQuick;
						
						console.log("projectListData : ", data);
						let selectTarget = $("#imgLine .quick_training .project_result");
						$(selectTarget).html("");
						
						let html = "<option value=''>프로젝트를 선택해주세요.</option>";
						for(let i=0, len = data.length; i<len; i++){
							html += "<option data-id='"+data[i]["id"]+"' value='"+data[i]["title"]+"'>";
							html += data[i]["title"];
							html += "</option>";
				
						}
						$(selectTarget).append(html);
						
						// 기본값으로 첫번째 프로젝트 지정 
						let options = $("#imgLine .project_result").children("option");
						options[1].selected = true;
						
					},
					
					// inheritance 대상이 될 task list를 select box으로 보여줌 
					drawInheritTaskList(task_list_data, project_data){
						const that = imgLineQuick;
						console.log("inheritTaskListData : ", task_list_data);
						console.log("inheritProjectData : ", project_data);
						let selectTarget = $("#imgLine .quick_training .task_result");
						$(selectTarget).html("");
						
						let html = "<option value=''>태스크를 선택해주세요.</option>";
						for(let i=0; i < task_list_data.length; i++){
							for(let j=0; j < project_data.length; j++){
								if(task_list_data[i].label_type == "IMAGE_SEGMENTATION"){
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
						const that = imgLineQuick;
						
						if(data != null && data.length > 0){
							let checkPoints = data.reverse();
							let target = $("#imgLine #quick_training .checkpoint_table tbody");
							
							let html = "";
							$(target).html("");
							$("#imgLine .empty_wrap").remove();
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
							that.render.removeEmptyData($("#imgLine #quick_training .checkpoint_list .list_wrap"));
							
							//jh.sa
							let checkpoint_view = $("#imgLine .checkpoint_view");
							let selected_cp_name = $("#imgLine .checkpoint_list .radioBtn.selected").parent().next().text();
							console.log("chkpoint_name: ", selected_cp_name);
							checkpoint_view.addClass("active");
							checkpoint_view.html("Selected Model :" + selected_cp_name);
							let selected_id = $("#imgLine .task_result option:selected").data("id");
							that.computed.getSelectedTaskById(selected_id);
							$("#imgLine .algorithm_result").attr("disabled","disabled");
							
							that.computed.checkPointListener();					
						} else if(data != null && data.length == 0) {
//		 					that.root.bind.removeEmptyData($("#imgLine #quick_training .checkpoint_list .list_wrap"));					
							if($("#imgLine #quick_training .checkpoint_list .empty_wrap").length == 0){
								that.render.addEmptyData($("#imgLine #quick_training .checkpoint_list .list_wrap"), "No Model", "please train your task first");
							}
						} else {
//		 					that.root.bind.removeEmptyData($("#imgLine #quick_training .checkpoint_list .list_wrap"));					
							if($("#imgLine #quick_training .checkpoint_list .empty_wrap").length == 0){
								that.render.addEmptyData($("#imgLine #quick_training .checkpoint_list .list_wrap"), "No Model", "please train your task first");				
							}
						}

					},
					
					// quick inference checkpoint
					drawInferenceCheckpointList(data){
						const that = imgLineQuick;
						
						if(data != null && data.length > 0){
							let checkPoints = data.reverse();
							let target = $("#imgLine #quick_inference .inference_checkpoint .checkpoint_table tbody");
							
							let html = "";
							
							$(target).html("");
							$("#imgLine .empty_wrap").remove();
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
							that.render.removeEmptyData($("#imgLine #quick_inference .inference_checkpoint .list_wrap"));
							that.bind.inferenceCheckPointListener();					
						} else if(data != null && data.length == 0) {
//		 					that.root.bind.removeEmptyData($("#imgLine #quick_inference .inference_checkpoint .list_wrap"));					
							if($("#imgLine #quick_inference .inference_checkpoint .empty_wrap").length == 0){
								that.render.addEmptyData($("#imgLine #quick_inference .inference_checkpoint .list_wrap"), "No Model", "please train your task first");
							}
						} else {
//		 					that.root.bind.removeEmptyData($("#imgLine #quick_inference .inference_checkpoint .list_wrap"));					
							if($("#imgLine #quick_inference .inference_checkpoint .empty_wrap").length == 0){
								that.render.addEmptyData($("#imgLine #quick_inference .inference_checkpoint .list_wrap"), "No Model", "please train your task first");
							}
						}
					},			
					
					// quick inference 팝업의 task list 그리기 
					drawTaskList(task_list_data, project_data){
						const that = imgLineQuick;
						

						console.log("taskDataa:: " , task_list_data);
						console.log("project_data :: ", project_data);
						let target = $("#imgLine .quick_task_list .list_wrap .table_body .task_table tbody");
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
								if(task_list_data[i].label_type == "IMAGE_SEGMENTATION"){
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
						const that = imgLineQuick;
						
						let configData;
						let description;
						let target = $("#imgLine #training_config .config_wrap");
						let description_target = $("#imgLine #training_config .description_wrap");
						$("#imgLine #training_config .description_wrap").addClass("border");	
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
							let tooltip_wrap = $("#imgLine #training_config .tooltip_wrap");
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
							let check_first = $("#imgLine #training_config .checkBox");

							check_first.off("click").on("click", function() {
								$(this).toggleClass("selected");
							});					
						}
						
					},
					
					// quick inference 에서 task 선택 시 config 셋팅 
					setInferenceConfig(data, taskId){
						const that = imgLineQuick;
						
						let task_id = taskId;
						let configData;
						let description;
						let algorithm_name;
						let target = $("#imgLine #inference_config .config_wrap");
						let description_target = $("#imgLine #inference_config .description_wrap");
						let algorithm_target = $("#imgLine .inference_algorithm");
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
							let tooltip_wrap = $("#imgLine #inference_config .tooltip_wrap");
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
							let check_first = $("#imgLine #inference_config .checkBox");

							check_first.off("click").on("click", function() {
								$(this).toggleClass("selected");
							});					
						}
							
						
						if($("#imgLine #quick_inference .radioBtn.selected").length == 0){
							$(target).html("");
							$(description_target).html("Please select task data");
						};
						

						
					},			
					
					// quick training의 algorithm select box 
					selectAlgorithm(data){
						const that = imgLineQuick;
						
						// 초기화시 SOLO 기본값 적용 
						let options = $(".algorithm_result").children("option");
						let selected_option_id;
						for(var i=1; i < options.length; i++){
						    if(options[i].label == "SOLO"){
						    	options[i].selected = true;
						    	selected_option_id = options[i].attributes["data-id"].value
						    }
						}
						that.computed.getAlgorithmById(selected_option_id, "0", null);				// SOLO algorithm_id
						
						$("#imgLine #quick_training .algorithm_result").on("change", function(){
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
						const that = imgLineQuick;
						
						$("#imgLine #quick_training .task_result").on("change", function(){
							let selected_task = $(this).val();
							if(selected_task != ""){
								$("#imgLine .empty_wrap").remove();
//		 						that.root.bind.removeEmptyData($("#imgLine .checkpoint_list .list_wrap"));
								$("#imgLine .checkpoint_list .list_wrap .checkpoint_table tbody").html("");
								if($("#imgLine .quick_training .radioBtn.selected").length == 0){
									$("#imgLine .checkpoint_view").removeClass("active");
									$("#imgLine .algorithm_result").removeAttr("disabled");
								} else if ($("#imgLine .quick_training .radioBtn.selected").length > 0){
									$("#imgLine .quick_training .radioBtn.selected").removeClass("selected");			//추가 
								}

								for(let i=0; i < data.length; i++){
									if(selected_task == data[i]["title"]){
										that.computed.getCheckpointList(data[i]["task_id"], "0");
										that.render.drawTaskName(data[i]["title"]);
										break;
									};
								};						
							} else if(selected_task == "") {
								$("#imgLine .checkpoint_view").removeClass("active");
								$("#imgLine .algorithm_result").removeAttr("disabled");
								that.render.removeEmptyData($("#imgLine .checkpoint_list .list_wrap"));
								that.render.addEmptyData($("#imgLine .checkpoint_list .list_wrap"), "No Model", "please train your task first");				
								// 						that.root.bind.removeEmptyData($("#imgLine .checkpoint_list .list_wrap"));
								$("#imgLine .checkpoint_list .list_wrap .checkpoint_table tbody").html("");
								$("#imgLine .checkpoint_list .selected_task_name").html("");
								$("#imgLine #quick_training .checkpoint_list").removeClass("active");
								$("#imgLine #quick_training .checkpoint_list_btn")[0].textContent = "+";					
								$("#imgLine .quick_training .radioBtn.selected").removeClass("selected");
							}

						});
					},
					
					// quick training 의 inheritance task 선택 시 checkpoint list 상단에 선택한 task 이름 표시 
					drawTaskName(data){
						const that = imgLineQuick;
						
						let taskName_data = data;
						let target_title = $("#imgLine .checkpoint_list .selected_task_name");
						let select_task_name = "( 선택된 태스크 : " + taskName_data + " )";
						$(target_title).html(select_task_name);
						console.log("taskName_data : ", taskName_data);

					},				
				},
			};		
		
	  </script>		
   </body>
</html>
