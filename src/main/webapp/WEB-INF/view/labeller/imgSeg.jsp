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
	   #imgSeg .canvas-container {
			margin: 0px auto;
/* 			height: 100% !important; */
	   }  	    
	   #imgSeg a.next_page,a.prev_page { cursor:pointer; }
	   #imgSeg .pagination input.page-link { height:30px; width:30px; padding:0 0 0 8px; }
       #imgSeg .tab_wrap { width:180px; }
       #imgSeg a.disabled { color:#e74a3b !important; pointer-events: none; } 
	   #imgSeg .labeller_container { 
/* 	    	overflow:scroll;  */
			overflow: hidden; 
	    	display:flex; 
	    	flex-wrap:nowrap;  
	    	margin-top: 20px; 
	    	border-left: 0; border-right: 0; 
	    	min-height: 840px; max-height: 840px;
	    }
      	
      	#imgSeg .tab-pane{
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
      	
      	#imgSeg .header_wrap { margin-bottom: 42px; }
      	#imgSeg .tab-pane.cate_search_wrap {
/*       		border:1px solid #eeeeee; */
/*       		border-radius : 10px; */
      	}
/*       	.cate_search_wrap { border:1px solid #eeeeee; } */
/*       	.cate_search_wrap .content_wp .content_header .content_title { cursor:pointer; } */
/*       	.cate_search_wrap .search_cate { width:50%; } */
      	
/*       	.cate_search_wrap .search_wp .search_wrap .search_cate_list { cursor:pointer; } */
/*       	.cate_search_wrap .search_wp .search_wrap .search_cate_list:hover { color:red; } */
/*       	.cate_search_wrap .search_wp .search_wrap { position:absolute; width:50%; max-height:500px; overflow:scroll; background-color:#f8f9fc; z-index:100;  } */
      	
      	#imgSeg .search_all_wp .search_all_wrap { position:absolute; /* width:50%; */ max-height:500px; overflow:scroll; background-color:#f8f9fc; z-index:100;  }
      	#imgSeg .search_all_wp .search_all_wrap .search_cate_list { cursor:pointer; }
      	#imgSeg .search_all_wp .search_all_wrap .search_cate_list:hover { color:red; }
      	
      	/* jh.sa 210520 */
		#imgSeg .label_wrap .cate_wp .visibility { width: 20px; height: 20px; display: inline-block; position: relative; top: 0px; background: url('${pageContext.request.contextPath}/resources/images/labeller/ico-eye-on-light.png') center no-repeat; }
		#imgSeg .label_wrap .cate_wp .visibility.off,	
		#imgSeg .label_wrap .cate_wp .visibility:hover { opacity: 1; background: url('${pageContext.request.contextPath}/resources/images/labeller/ico-eye-off-light.png') center no-repeat; cursor: pointer; }
/*       	.cate_search_wrap .content_wp { overflow:scroll; } */
/*       	.cate_search_wrap .content_wp.active { height:auto; } */
/*       	.cate_search_wrap .content_wp .content .cate_2,.cate_3 { cursor:pointer; } */
/*       	.cate_search_wrap .content_wp .content .cate_2.active,.cate_3.active { font-weight:bold; } */
/*       	.cate_search_wrap .content_wp .content .cate_2:hover,.cate_3:hover { color:red; } */

/* 		.cate_search_wrap .content_wp .content .cate_2.active,.cate_3.active { font-weight:bold; background-color:#eeeeee !important; color:black !important; } */
/* 		.cate_search_wrap .content_wp .content .cate_2:hover,.cate_3:hover { color:red !important; } */
/* 		.cate_search_wrap .content_wp .content .cate_wrap_3 { background-color:#eeeeee; } */
      	
      	#imgSeg .label_wrap { 
       		position:relative;  
      		width:100%; 
      		height:auto; 
/*       		border: 1px solid #eeeeee;  */
/*       		margin-left:20px;  */
/*       		border-radius:0.35rem;  */
      		flex-shrink:0;
      	}
      	
       	#imgSeg .video_wrap .canvas { width:800px; height:400px; position:absolute !important; }  
/*        	.video_wrap .video { width:1024px;  height:auto; position:absolute !important; }   */
       	
/*       	.video_wrap .video .video_js { position:absolute; } */
/*       	.video_wrap .video .vjs-control-bar { display: flex; height:40px; bottom:-40px;} */
/*       	.video_wrap .video .vjs-big-play-button { display:none; } */
      	#imgSeg .video_wrap .prog_bar { border:1px solid #eeeeee; width:100%; height:40px; position:relative; }
      	#imgSeg .video_wrap .prog_bar > div { color:#020b44; }
		#imgSeg .video_wrap .prog_bar .btn_wrap { width:400px; margin-top:0; }
/*       	.video_wrap .prog_bar .btn { color:#020b44; border-radius:50%; } */
      	#imgSeg .video_wrap .prog_bar input.curr_frame { width:50px; height:15px; margin-right:0px; }
      	#imgSeg .video_wrap .prog_bar .save_btn_wrap { width:260px; }
      	
      	#imgSeg .label_wrap .btn_wrap { margin:0; padding-bottom: 1px; border-bottom: 1px solid #eee;}
/*       	.label_wrap .btn_wrap > div { width:100%; margin:0;  cursor:pointer; } */
      	@media (min-height:960px){
/*       		#imgSeg .label_wrap .category_wrap { max-height: 880px; }  */
			#imgSeg .label_wrap .category_wrap { max-height: 785px; } 
      	}
      	@media (min-height: 730px) and (max-height:959px){
/*       		#imgSeg .label_wrap .category_wrap { max-height: 665px; }  */
			#imgSeg .label_wrap .category_wrap { max-height: 570px; } 
      	}      	
      	@media (min-height: 500px) and (max-height:729px){
/*       		#imgSeg .label_wrap .category_wrap { max-height: 500px; }  */
			#imgSeg .label_wrap .category_wrap { max-height: 405px; } 
      	} 
      	@media (min-height: 1px) and (max-height:499px){
/*       		#imgSeg .label_wrap .category_wrap { max-height: 400px; }  */
			#imgSeg .label_wrap .category_wrap { max-height: 305px; } 
      	}     	      	
      	#imgSeg .label_wrap .category_wrap { width:100%; height:auto; overflow-y: scroll; overflow-x: hidden; flex-wrap: wrap; padding: 0 18px; }
      	#imgSeg .label_wrap .category_wrap .cate_wp { width:190px; /* height:90px; */height:200px; padding: 5px; margin: 5px 10px; border:1px solid #eeeeee; text-align: center; }
      	#imgSeg .label_wrap .category_wrap .cate_wp .crop_wrap{ width:180px; height:105px; align-items:center; display:flex; justify-content:center; padding: 0.25rem; padding-top: 0.9rem; }
      	#imgSeg .label_wrap .category_wrap .cate_wp .crop_img {position:relative; margin-top: 15px;/* width:180px; height:105px; */ }
      	#imgSeg .label_wrap .category_wrap .cate_wp.selected { border-width:2px !important; }
/*       	.label_wrap .category_wrap .cate_wp .delete { margin-left:10px; } */
      	#imgSeg .label_wrap .category_wrap .cate_wp .color {     
      		width: 20px;
		    height: 20px;
		    margin-left: 2px;
	    }
	    
      	#imgSeg .label_wrap .category_wrap .cate { /*width:5em;*/ /* width:60px; */ border:1px solid #eeeeee; text-align:center; text-align-last:center; }
/*       	.label_wrap .category_wrap .cate option { text-align:center; text-align-last:center; } */
      	
      	/*       	#edit h.lee */
      	#imgSeg .prev_data_wrap { border: 1px solid white; width: 35px; height: 598px;}
		
		/* 		#edit h.lee */
		#imgSeg .next_data_wrap { border: 1px solid white; width: 35px; height: 598px;}
		
		#imgSeg .prev_data_wrap:hover { cursor: pointer; background-color: #eee; opacity: 0.3; }
		
		#imgSeg .next_data_wrap:hover { cursor: pointer; background-color: #eee; opacity: 0.3; }
		
      	#imgSeg .page_title_wrap { position: relative; top: 20px; left: 90px; display: inline; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; }
      	#imgSeg .page_title_wrap span:first-child { font-size: 13px; }
		#imgSeg .page_title_wrap span:nth-child(2) { color: #4c84ff; font-size: 14px;}
		#imgSeg .add { width: 90px; margin-right: 10px; position: relative; color: #fff; font-size: 11px; background-color: #4c84ff; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; }
		#imgSeg .add:hover { background-color: #3A71E9; }
		#imgSeg .delete { width: 55px; color: #343434; font-size: 11px; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; margin-left: 10px;  }
      	#imgSeg .label_title { color: #777; font-weight: 400; padding: 20px; }
      	#imgSeg .cate_wp input { width: 165px; padding: 10px; margin-top: 3px; }
      	#imgSeg .save_btn_wrap { justify-content: center; position: absolute; bottom: 0; padding: 26px 0;  background-color: #fff; border-top: 1px solid #eee; }
      	#imgSeg .save_btn_wrap .save { width: 240px; line-height: 36px; margin: 0 auto; border-radius: 23px; box-shadow: 0 4px 8px 0 #b4d7ff; font-size: 13px; font-weight: 300; color: #fff; cursor: pointer; background-color: #4c84ff;}
		#imgSeg .save_btn_wrap .save:hover { background-color: #3A71E9; }
/* 		#imgSeg .img_list_wrap { width: calc(100% - 699px); position: absolute; bottom: 92px; border: 1px solid #e0e0e0; border-left: 0; border-right: 0; padding: 15px 0; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; background-color: #f8f8f8; }       */
		#imgSeg .img_list_wrap { width: 100%; position: relative; border: 1px solid #e0e0e0; border-left: 0; border-right: 0; padding: 15px 0; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; background-color: #f8f8f8; }      
/*       	#imgSeg .data_list_wrap { height: 637px !important; max-height: 637px !important; position: absolute; top: calc(100% - 740px); } */

		@media (min-height: 905px){
			#imgSeg .data_list_wrap { height: 448px; max-height: 448px; top: calc(100% - 550px); left: -1px; font-family: 'Open_Sans', sans-serif; font-size: 11px; font-weight: 300; color: #343434; z-index: 98; }  			
		}
		@media (max-height: 904px){
			#imgSeg .data_list_wrap { height: 448px; max-height: 448px; top: calc(100% - 550px); left: -1px; font-family: 'Open_Sans', sans-serif; font-size: 11px; font-weight: 300; color: #343434; z-index: 98; }  			
		}
		
		#imgSeg .position_wrap { width: 100px; margin-right: 20px; }
		#imgSeg .position_wrap .position-value { width: 40px; padding: 5px; }
		#imgSeg .position_wrap .total_count { display: inline-block; }
		
		#imgSeg .video_wrap .prev_btn {
			position: absolute;
			background: url(images/btn_image_arrow_left_normal.png) left;
			width: 16px;
			height: 25px;
 			top: calc(50% - 25px); 
/* 			top: 300px; */
			left: 5px;
			z-index: 97;
		}
		
		#imgSeg .video_wrap .next_btn {
			position: absolute;
			background: url(images/btn_image_arrow_right_normal.png) right;
			width: 16px;
			height: 25px;
 			top: calc(50% - 25px); 
/* 			top: 300px; */
			right: 5px;
			z-index: 97;
		}      	
		
		#imgSeg .video_wrap .prev_btn:hover {
			background: url(images/btn_image_arrow_left_hover.png) left;
			cursor: pointer;
		}
		
		#imgSeg .video_wrap .next_btn:hover {
			background: url(images/btn_image_arrow_right_hover.png) right;
			cursor: pointer;
		}		
		
		#imgSeg .name_wrap { width: 600px; text-align: center; margin: 0 auto; }
		#imgSeg .name_wrap .file_name { max-width: 380px; text-overflow: ellipsis; overflow: hidden; }
		#imgSeg .name_wrap .prev_btn {
			background: url(images/btn_image_arrow_left_normal.png) left;
			width: 16px;
			height: 25px;
/* 			top: calc(50% - 25px); */
			top: 300px;
			left: 5px;
			z-index: 97;
		}
		
		#imgSeg .name_wrap .next_btn {
			background: url(images/btn_image_arrow_right_normal.png) right;
			width: 16px;
			height: 25px;
/* 			top: calc(50% - 25px); */
			top: 300px;
			right: 5px;
			z-index: 97;
		}    	
		
		#imgSeg .name_wrap .prev_btn:hover {
			background: url(images/btn_image_arrow_left_hover.png) left;
			cursor: pointer;
		}
		
		#imgSeg .name_wrap .next_btn:hover {
			background: url(images/btn_image_arrow_right_hover.png) right;
			cursor: pointer;
		}		
		
      	#imgSeg .list_btn_wrap { width: 100px; margin-left: 20px; }
      	#imgSeg .list_btn_wrap .data_list_btn { width: 30px; height: 30px; margin-right: 30px; background: url(images/icon_filter_normal.png) right; cursor: pointer; }
 		
/*  		#imgSeg .quick_wrap { width: 100%; position: absolute; bottom: 0px; padding: 26.5px 0; background-color: #fff; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }        */
 		#imgSeg .quick_wrap { width: 100%; bottom: 0px; padding: 26.5px 0; background-color: #fff; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; align-items : flex-end; }       

/*  		#imgSeg .quick_wrap { width: calc(100% - 699px); position: absolute; bottom: 0px; padding: 25px 0; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }        */
/* 		#imgSeg .quick_wrap { width: 488px; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; position: absolute; top: -8px; left: 609px;}     */
      
		#imgSeg .quick_btn {
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
		
		#imgSeg .quick_btn:hover {
			background-color: #3A71E9;
		}      
		
		/* panel label */
		#imgSeg .btn_wrap .visible { width: 18px; height: 18px; position: relative; left: -145px; }
		#imgSeg .btn_wrap .visible.on { background: url('images/btn_layer_view.png') no-repeat center; }
		#imgSeg .btn_wrap .visible.off { background: url('images/btn_checkbox_normal.png') no-repeat center; }		
		
		#imgSeg section.enrichment {
			width: calc(100% - 486px);
			height: 100%;
			position: relative;
/* 			border: 1px solid #e5e5e5; */
		}      
		
		#imgSeg section.label {
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
		
		#imgSeg section.enrichment .empty_wrap { margin: 0 auto; text-align: center; margin-top: 300px; color: #777777; }
		#imgSeg section.enrichment .empty_wrap .no_image { margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; height: 37px; background-image: url(./images/icon_nodata_list.png); }
		#imgSeg section.enrichment .empty_wrap .eng_text { margin-bottom: 3px; font-size: 16px; }
		#imgSeg section.enrichment .empty_wrap .kor_text { font-size: 12px; }	
		
		/* quick */
/*  		#imgSeg .quick_wrap { width: 100%; position: absolute; bottom: 0px; padding: 26.5px 0; background-color: #fff; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }        */

/*  		#imgSeg .quick_wrap { width: calc(100% - 699px); position: absolute; bottom: 0px; padding: 25px 0; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }        */
/* 		#imgSeg .quick_wrap { width: 488px; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; position: absolute; top: -8px; left: 609px;}     */
      
		#imgSeg .quick_btn {
			width: 100px;
 			line-height: 36px; 
 			margin-left: 0px;
			margin-right: 10px;
			margin-bottom: 2px;
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
		
		#imgSeg .quick_btn:hover {
			background-color: #3A71E9;
		}    
		
		#imgSeg .quick_btn_wrap {
			padding-top: 10px;
		}		
				
		#imgSeg .quick_training, 
		#imgSeg .quick_inference {
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
		
		#imgSeg .quick_training.active, 
		#imgSeg .quick_inference.active {
			display: block;
		}
		
		#imgSeg .quick_training_btn, 
		#imgSeg .quick_inference_btn {
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
		
		#imgSeg .input_wrap {
			margin: 15px 0;
		}
		
		#imgSeg .input_wrap label {
			width: 100px;
			font: 400 12px system-ui;
		}
		
		#imgSeg .input_wrap input[type="text"] {
			width: 210px;
			height: 0px;
			font: 300 12px system-ui;
		}
		
		#imgSeg .input_wrap input::placeholder {
			font: 400 11px system-ui;
			color: #777;
		}
		
		#imgSeg .quick_close, 
		#imgSeg .project_close, 
		#imgSeg .config_close,
		#imgSeg .checkpoint_close {
			width: 37px;
			height: 37px;
			margin-top: -10px;
			display: inline-block;
			cursor: pointer;
			background:
				url("${pageContext.request.contextPath}/resources/images/btn-popup-close-normal.png");
		}
		
		#imgSeg .quick_title {
			font: 400 12px 'Open_Sans';
			padding-bottom: 10px;
		}
		
		#imgSeg .checkBtn {
			display: inline-block;
			width: 16px;
			height: 16px;
			background:
				url("${pageContext.request.contextPath}/resources/images/icon_gpu_check.png")
				no-repeat center;
		}
		
		#imgSeg .list_wrap {
			height: calc(100% - 149px);
			position: relative;
			width: 100%;
		}
		
		#imgSeg table.task_table th {
			border-top: 2px #3a3b3d solid;
			background-color: #fafafa;
			height: 44px;
			font-size: 12px;
			font-weight: 400;
			color: #333333;
		}
		
		#imgSeg table.task_table th, 
		#imgSeg table.task_table tr, 
		#imgSeg table.task_table td
			{
			text-align: center;
			border-bottom: 1px solid #e5e5e5;
			border-collapse: collapse;
			border-spacing: 0;
		}
		
		#imgSeg .table_body table.task_table {
			font-family: Open_Sans;
			font-size: 12px;
			color: #343434;
			font-weight: 300;
			border-collapse: collapse;
			width: 100%;
		}
		
		#imgSeg .table_body table.task_table tr:hover {
			background-color: #f4fcfe;
		}
		
		#imgSeg .table_body table.task_table td {
			padding-top: 3px;
			padding-bottom: 3px;
			font-size: 11px;
			cursor: default;
		}
		
		#imgSeg .table_header table.task_table {
			margin-top: 15px;
			border-collapse: collapse;
			width: 100%;
		}
		/* #imgSeg .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
		#imgSeg .table_body {
			max-height: 340px;
			overflow-y: overlay;
			overflow-x: hidden;
			background-color: #fff;
			position: relative;
			margin-bottom: 17px;
		}
		
		#imgSeg table td {
			height: 48px;
		}
		
		#imgSeg .radioBtn {
			margin-left: 5px;
		}
		
		#imgSeg .csv_name_input_wrap {
			
		}
		
		#imgSeg .csv_name_input_wrap span {
			font: 400 11px system-ui;
		}
		
		#imgSeg .csv_name_input_wrap input {
			font: 400 11px system-ui;
			width: 90%;
			height: 0px;
		}
		
		#imgSeg select {
			height: 40px;
			width: 253px;
			border: 1px solid #dedcde;
			font: 400 11px system-ui;
			background:
				url("${pageContext.request.contextPath}/resources/images/select_arrow.png")
				#fff no-repeat 97% 50%/10px;
		}
		
		#imgSeg select:focus {
			outline: none;
		}
		
		#imgSeg .select_project_wrap {
			position: relative;
			left: -1.5%;
			top: 13px;
		}
		
		#imgSeg .add_project_btn, 
		#imgSeg .training_config_btn, 
		#imgSeg .checkpoint_list_btn
			{
			width: 20px;
			height: 20px;
			margin-left: 18px;
			text-align: center;
			border: 1px solid #dedcde;
			background-color: #fff;
			cursor: pointer;
		}
		
		#imgSeg .add_project {
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
		
		#imgSeg .training_config {
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
		
		#imgSeg .add_project.active, 
		#imgSeg .training_config.active,
		#imgSeg .checkpoint_list.active, 
		#imgSeg .inference_config.active {
			display: block !important;
		}
		
		#imgSeg .add_project input[type="text"] {
			width: 210px;
			height: 0px;
		}
		
		#imgSeg .add_project label {
			width: 100px;
			font: 400 12px system-ui;
		}
		
		#imgSeg .add_project textarea {
			width: 210px;
			height: 150px;
			margin: 10px 0;
			font: 400 13px Arial;
		}
		/* #imgSeg .add_project .add_btn { width: 70px; padding: 4px; margin: 0 auto; background-color: #fff; border: 1px solid #dedcde; text-align: center; cursor: pointer; font: 400 13px system-ui; } */
		#imgSeg .training_config input[type=number]::-webkit-inner-spin-button,
			.training_config input[type=number]::-webkit-outer-spin-button {
			-webkit-appearance: none;
			margin: 0;
		}
		
		#imgSeg .training_config input, 
		#imgSeg .inference_config input {
			height: 0px;
		}
		
		#imgSeg .training_config input[type="text"],
		#imgSeg .inference_config input[type="text"]
			{
			width: 145px !important;
		}
		
		#imgSeg .training_config label, 
		#imgSeg .inference_config label {
			width: 180px !important;
			font: 400 12px system-ui;
		}
		
		#imgSeg .inference_config input[type=number]::-webkit-inner-spin-button,
		#imgSeg .training_config input[type=number]::-webkit-outer-spin-button {
			-webkit-appearance: none;
			margin: 0;
		}
		
		#imgSeg .tooltip_wrap {
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
		
		#imgSeg .tooltip {
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
		
		#imgSeg .tooltip.on {
			visibility: visible;
			opacity: 1;
			transition: visibility 0s, opacity 0.3s ease;
		}
		
		#imgSeg .description_wrap {
			min-width: 340px;
			max-width: 340px;
			margin: 17px 0;
			padding: 15px;
		}
		
		#imgSeg .description_wrap.border {
			border: 1px solid #dedcde;
		}
		
		#imgSeg .description_wrap .description {
			font: 400 12px system-ui;
		}
		
		#imgSeg .inference_config_btn {
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
		
		#imgSeg .inference_config {
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
		
		#imgSeg .checkpoint_list {
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
		/* #imgSeg .checkBtn { display:inline-block; width: 16px; height: 16px; background: url("${pageContext.request.contextPath}/resources/images/icon_gpu_check.png") no-repeat center; } */
		#imgSeg .checkpoint_list .list_wrap {
			height: calc(100% - 149px);
			position: relative;
			width: 100%;
		}
		
		#imgSeg .checkpoint_list table.checkpoint_table th {
			border-top: 2px #3a3b3d solid;
			background-color: #fafafa;
			height: 44px;
			font-size: 11px;
			font-weight: 400;
			color: #333333;
		}
		
		#imgSeg .checkpoint_list table.checkpoint_table th, 
		#imgSeg .checkpoint_list table.checkpoint_table tr,
		#imgSeg .checkpoint_list table.checkpoint_table td {
			text-align: center;
			border-bottom: 1px solid #e5e5e5;
			border-collapse: collapse;
			border-spacing: 0;
		}
		
		#imgSeg .checkpoint_list .table_body table.checkpoint_table {
			font-family: Open_Sans;
			font-size: 12px;
			color: #343434;
			font-weight: 300;
			border-collapse: collapse;
			width: 100%;
		}
		
		#imgSeg .checkpoint_list .table_body table.checkpoint_table tr:hover
			{
			background-color: #f4fcfe;
		}
		
		#imgSeg .checkpoint_list .table_body table.checkpoint_table td {
			padding-top: 3px;
			padding-bottom: 3px;
		}
		
		#imgSeg .checkpoint_list .table_header table.checkpoint_table {
			margin-top: 15px;
			border-collapse: collapse;
			width: 100%;
		}
		/* #imgSeg .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
		#imgSeg .checkpoint_list .table_body {
			max-height: 340px;
			overflow-y: overlay;
			overflow-x: hidden;
			background-color: #fff;
			position: relative;
			margin-bottom: 17px;
		}
		
		#imgSeg .checkpoint_list table td {
			height: 48px;
		}
		
		#imgSeg .checkpoint_list .checkpoint_table .radioBtn {
			margin-left: 5px;
		}
		
		#imgSeg .checkpoint_list .selected_task_name {
			font: 400 11px system-ui !important;
			color: #777 !important;
		}
		
		#imgSeg .empty_wrap {
			text-align: center;
			margin-top: 120px;
		}
		
		#imgSeg .empty_wrap .no_image {
			margin-bottom: 17px;
			background-repeat: no-repeat;
			background-position-x: center;
		}
		
		#imgSeg .empty_wrap .eng_text {
			font-family: Open_Sans;
			margin-bottom: 3px;
			font-size: 16px;
			font-weight: 300;
			color: #777777;
		}
		
		#imgSeg .empty_wrap .kor_text {
			font-family: Open_Sans;
			font-size: 12px;
			color: #777777;
			font-weight: 200;
			margin-bottom: 120px;
		}
		
		#imgSeg .no_image {
			height: 37px;
			background-image: url('./images/icon_nodata_list.png');
		}
		
		#imgSeg .checkpoint_view {
			width: 270px;
			font: 400 10px system-ui;
			margin: -6px auto -6px 103px;
			display: none;
		}
		
		#imgSeg .checkpoint_view.active {
			display: block;
		}
		
		#imgSeg .inference_checkpoint {
			padding-top: 10px;
		}
		
		#imgSeg .inference_checkpoint .list_wrap {
			height: calc(100% - 149px);
			position: relative;
			width: 100%;
		}
		
		#imgSeg .inference_checkpoint table.checkpoint_table th {
			border-top: 2px #3a3b3d solid;
			background-color: #fafafa;
			height: 44px;
			font-size: 11px;
			font-weight: 400;
			color: #333333;
		}
		
		#imgSeg .inference_checkpoint table.checkpoint_table th, 
		#imgSeg .inference_checkpoint table.checkpoint_table tr,
		#imgSeg .inference_checkpoint table.checkpoint_table td {
			text-align: center;
			border-bottom: 1px solid #e5e5e5;
			border-collapse: collapse;
			border-spacing: 0;
		}
		
		#imgSeg .inference_checkpoint .table_body table.checkpoint_table {
			font-family: Open_Sans;
			font-size: 12px;
			color: #343434;
			font-weight: 300;
			border-collapse: collapse;
			width: 100%;
		}
		
		#imgSeg .inference_checkpoint .table_body table.checkpoint_table tr:hover
			{
			background-color: #f4fcfe;
		}
		
		#imgSeg .inference_checkpoint .table_body table.checkpoint_table td
			{
			padding-top: 3px;
			padding-bottom: 3px;
		}
		
		#imgSeg .inference_checkpoint .table_header table.checkpoint_table {
			margin-top: 15px;
			border-collapse: collapse;
			width: 100%;
		}
		/* #imgSeg .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
		#imgSeg .inference_checkpoint .table_body {
			max-height: 340px;
			overflow-y: overlay;
			overflow-x: hidden;
			background-color: #fff;
			position: relative;
			margin-bottom: 17px;
		}
		
		#imgSeg .inference_checkpoint table td {
			height: 48px;
		}
		
		#imgSeg .inference_algorithm {
			font: 400 10px system-ui;
		}
		
		#imgSeg .side_btn_wrap {
			margin: 0 auto;
			width: 60%;
		}
		
		#imgSeg .side_btn_wrap .cancel_btn {
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
		
		#imgSeg .side_btn_wrap .save_btn, 
		#imgSeg .side_btn_wrap .add_btn {
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
		
		#imgSeg .checkpoint_list .side_btn_wrap {
			margin-top: 60px;
			text-overflow: ellipsis;
		}
		
		#imgSeg .quick_wrap select { padding: 5px 20px; }		
		
		#imgSeg .data_list_header { margin-top: -10px; }
		#imgSeg .data_list_header .close_btn { font-size: 24px; cursor: pointer; position: relative; top: -5px; }	
		#imgSeg .data_list_header .close_btn:hover { color: #4c84ff; }	
		
		#imgSeg .no_label { width: 84%; padding: 180px 30px; text-align: center; color: #cdcdcd; }
		#imgSeg .no_label div:nth-of-type(1) { width: 53px; height: 53px; margin: 0 auto; margin-bottom: 11px; background: url('${pageContext.request.contextPath}/resources/images/img_nodata.png') no-repeat; opacity: 0.4; /*  */}
		#imgSeg .no_label div:nth-of-type(2) { font-size: 16px; font-weight: 300; margin-bottom: 3px; }
		#imgSeg .no_label div:nth-of-type(3) { font-size: 12px; font-weight: 300; }						
		
		#imgSeg section.tag { width: 486px; height: 100%; position: relative; background-color: #fff; border: 1px solid #e5e5e5; border-bottom: 0; -ms-user-select: none; -moz-user-select: none; -webkit-user-select: none; -khtml-user-select: none; user-select: none; }
		#imgSeg section.tag .tag_margin { margin: 0 auto; padding: 10px; }
 		#imgSeg section.tag .tag_total { color: #777; font-weight: 400; padding: 20px; }
 		#imgSeg section.tag .tag_wrap { width: 100%; height: 90px; margin-top: 1px; border-top: 1px solid #e5e5e5; font-size: 11px; justify-content: center; } 
		#imgSeg section.tag .tag_wrap .content { width: 100%; height: auto; max-height: 75px; overflow-y: scroll; overflow-x: hidden; flex-wrap: wrap; -ms-overflow-style: none; }
		#imgSeg section.tag .tag_wrap .content::-webkit-scrollbar { display: none; }		
		#imgSeg section.tag .tag_wrap .tag { width: 81px; margin: 10px 5px; line-height: 32px; background: #f4f7fc; border: 1px solid #d9d9d9; border-radius: 4px; text-align: center; font-size: 14px; font-weight: 300; color: #555; cursor: pointer; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; }
		#imgSeg section.tag .tag_wrap .tag.selected { background-color: #4c84ff; border-color: #2b65e6; color: #fff; box-shadow: 0 3px 4px 0 rgba(159, 189, 255, 0.7); }
		#imgSeg .hover_box {border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
		#imgSeg .hover_box div {font-family: Open_Sans; font-size: 13px; color: #555555;}
		#imgSeg .hover_div div {word-break: break-word; margin: 2px 5px; white-space: normal; font-weight: 300; font-family: Open_Sans;}
		
		/* military - autoLabelling */
		#imgSeg .semi_auto_labelling_wrap { display: flex; }							
		#imgSeg .semi_auto_labelling_wrap .wrap { display: flex; flex-direction: column; margin-right: 10px;}
		#imgSeg .semi_auto_labelling_wrap .wrap label { margin-bottom: 5px; }
		#imgSeg .semi_auto_labelling_wrap .wrap select { width: 150px; }
									
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
               <div id="imgSeg" class="container-fluid">
                  <!-- Page Heading -->
                  


                  <div class="card shadow mb-4 flex fs">
                  
                  	<section class="enrichment">
	                  	<div class="header_wrap flex sb">
		                  	<div class="page_title_wrap">
		                  		<span>Enrichment</span> <span>|</span> Image Segmentation
	                  		</div>
	                  	</div>      
                  		<div class="video_wrap flex tab-pane active" id="imgSeg-labeller" role="tabpanel" >
                  			<div class = "prev_data_wrap">
                		 			<div class="prev_btn prev_data"></div>
        		         	</div>
                   			<!-- <div class="prev_btn prev_data"></div> -->
							<!-- <div class="next_btn next_data"></div> -->
							
                   			<canvas class="canvas" id="imgSeg-canvas"></canvas>
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
	                 		</div>            		<!-- Data List Popup area end -->    							
                 		</div>              <!-- Image Slide area end -->     						
	               		<div class="quick_wrap flex"> <!-- Quick Training & Inference Btn area start -->
							<div id="quick_training_btn" class="quick_btn filter_color">Quick Training</div>
							<div id="quick_inference_btn" class="quick_btn filter_color">Quick Inference</div>
							
							<!--  military - autoLabelling -->
							<div class="semi_auto_labelling_wrap">
								<div class="wrap">
									<label>project</label>
									<select id="">
										<option value="">INSTANCE_SEGMENTATION_DATASET1_replica</option>
										<option value="">INSTANCE_SEGMENTATION_DATASET2_replica</option>
										<option value="">INSTANCE_SEGMENTATION_DATASET3_replica</option>
									</select>
								</div>
								<div class="wrap">
									<label>task</label>
									<select id="">
										<option value="">Quick_INSTANCE_SEGMENTATION_DATASET1_replica_Task1</option>
										<option value="">INSTANCE_SEGMENTATION_TASK1</option>
									</select>
								</div>
								<div class="wrap">
									<label>model</label>
									<select id="">
										<option value="">YOLO</option>
										<option value="">EFFICCIENTDET</option>
									</select>
								</div>
							</div>
							<div id="" class="quick_btn filter_color">Semi-auto</div>
							
							<!-- Quick Training -->
							<div id="quick_training" class="quick_training filter_color">
								<div class="quick_title flex sb">
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
								<div class="quick_title flex sb">
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
	<!--                					<div class="label_title">Label (<span></span>)</div> -->
	               					<div class="label_title">Label (<span></span>)</div>
	<!--                					<div class="visible on"></div> -->
									<button type="button" class="btn btn-primary add filter_color">+ Add Label</button>
	                   			</div>
	                   			<div class="category_wrap flex fs"></div>
	                   		</div><!-- label area end -->   
			                <div class="save_btn_wrap flex">
	                 			<button type="button" class="btn btn-primary save filter_color">Save</button>
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
			var that = imgSeg;

			// canvas init
			that.data.canvas = new fabric.Canvas('imgSeg-canvas',{
				selection : false,
				width : 800,
				height : 600,
				uniScaleTransform : true,
			});
			
			that.bind.evtOnceInit();
// 			imgSeg.init();
		    
		});
		
		const imgSeg = {
				pt: $("#imgSeg"),
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
					const that = imgSeg;
					var data_list_wrap = that.pt.find(".data_list_wrap");
					data_list_wrap.removeClass("active");
					data_list_wrap.css("display", "none");
					
					that.data.canvasObj['datasetId'] = null;
					that.data.canvasObj['datasetId'] = dataset_id;
					that.init(dataset_id);
				},					
				
				init : function(dataset_id) {
					const that = imgSeg;
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
					
					$("#imgSeg .label_wrap .btn_wrap .add").hide();
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
					$("#imgSeg .quick_training").removeClass("active");
					$("#imgSeg .quick_inference").removeClass("active");
					$("#imgSeg .quick_task_list .list_wrap .table_body .task_table tbody").html("");
					imgSegQuick.init();				
					
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
						const that = imgSeg;
						
						
					}, //collision end
					
					downEvt : () => { // canvas poly mouse down event
						const that = imgSeg;
						var canvas = that.data.canvas;
						var canvasObj = that.data.canvasObj;
// 						var meta = that.data.meta;
						that.data.canvas.on('mouse:down',function(o){
							var meta = that.data.meta;
							canvasObj.isDown = true;
							
							/// jh.sa 201023
// 							var polygonObj = canvas.getObjects("polygon");
// 							if(o.target && polygonObj){
// // 								canvasObj.freeDrawing = true;
// 								$("#imgSeg .label_wrap .category_wrap .cate_wp#"+o.target.uuid).trigger("click");
// 							} 
							
							if(canvasObj.freeDrawing == true){
								var pointer = canvas.getPointer(o.e);
								if($("#imgSeg .label_wrap .category_wrap .cate_wp.selected").length == 0){
									return;
								}
								
								let polygonArr = canvas.getObjects("polygon");
								for(let i = 0; i < polygonArr.length; i++) {
									polygonArr[i].selectable = false;  
								}
								
								var uuid = $("#imgSeg .label_wrap .category_wrap .cate_wp.selected")[0].id;
								
							    canvasObj.origX = pointer.x;
							    canvasObj.origY = pointer.y;
							    
								var temp = {
							    	x : canvasObj.origX,
							    	y : canvasObj.origY,
								}
								
								console.log("o.target::", o.target);
								// segmentation 종료 부분 start
								var canvs = canvas.getObjects();
								for(var i=0; i<canvs.length; i++){
									if(o.target && o.target['uuid'] == canvs[i]['uuid'] && canvs[i]['uuid'] == uuid && o.target['index'] == canvs[i]['index']){
										canvasObj.freeDrawing = false;
// 										o.target.fill = "green";			// jh.sa 201031
										that.computed.deletePoint(uuid);
										that.computed.addLine(uuid);
										that.computed.generatePoly(uuid);
										meta[uuid].freeDrawing = false;
										for(let i = 0; i < polygonArr.length; i++) {
											polygonArr[i].selectable = true;  
										}
										// jh.sa 201031
										for(var j=0; j<canvs.length; j++){
											if(canvs[j].type == "point" && canvs[j].fill == "red"){
												canvs[j].fill = "green";
											}
										}
										return;
									}
								}// segmentation 종료 부분 end
								
								// segmentation 시작 부분 -> save meta, create point, connect line, generate segmentation(polygon)
								// save & draw point
								that.computed.saveMetaData(uuid,temp);
								that.computed.createPoint(uuid,temp);
								
	// 							// if points over two
								if(meta[uuid] && meta[uuid]['polyData'].length > 1){
									that.computed.addLine(uuid);
									that.computed.generatePoly(uuid);
									meta[uuid].freeDrawing = true;
								}
							}
							else {				// jh.sa 201031
								var polygonObj = canvas.getObjects("polygon");
								if(canvas.getActiveObject()) {
									that.bind.evtHandlers.editPolygon(true);	
								}
								//that.bind.evtHandlers.editPolygon(true);
								if(o.target && polygonObj){
//	 								canvasObj.freeDrawing = true;
									//$("#imgSeg .label_wrap .category_wrap .cate_wp#"+o.target.uuid).trigger("click");
									that.pt.find(".label_wrap .category_wrap .cate_wp").removeClass("selected");
									that.pt.find(".label_wrap .category_wrap .cate_wp[id='"+o.target.uuid+"']").addClass("selected");
									let color = that.data.colorHash.rgb(o.target.uuid);
									that.pt.find(".label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
									that.pt.find(".label_wrap .category_wrap .cate_wp[id='"+o.target.uuid+"'].selected ").css("border-color","rgb("+color+")");
									if(o.target.type == "point"){
										var checked = that.computed.checkHistory(o.target.uuid);
										var point = that.computed.getPointObject(o.target.uuid, that.data.meta[o.target.uuid].polyData[o.target.index], o.target.index);
										/* if(checked){
											that.computed.stackHistory(o.target.uuid,"loaded",point);
										} */										
									}
								} 								
							}
							
							
							
						});
					},// canvas poly mouse down event end
					
					moveEvt : () => { // canvas poly mouse move event
						const that = imgSeg;
						var data = that.data;
						var canvas = that.data.canvas;
						
						canvas.on('mouse:move', function(evt) {
							var tempPoly = canvas.getActiveObject();
							
							if(data.canvasObj.isDown == true && data.canvasObj.freeDrawing == false){
								var objType = null;
								var target = null;
								var polygon = null;
								
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
						const that = imgSeg;
						var data = that.data;
						var meta = that.data.meta;
						var canvas = that.data.canvas;
						var canvasObj = that.data.canvasObj;
						
						canvas.on('mouse:up', function(e) {
							data.canvasObj.isDown = false;
							
							if($("#imgSeg .label_wrap .category_wrap .cate_wp.selected").length == 0){
								return;
							}							
							
							var uuid = $("#imgSeg .label_wrap .category_wrap .cate_wp.selected")[0].id;
							
							// jh.sa 201023
// 							var scaleRatio = that.data.scaleFactor.ratio;
// 							if(e.target.uuid == uuid){
// // 								console.log("e.target.index: ", e.target.index, "e.target.left: ", e.target.left, "e.target.top: ", e.target.top);
// // 								console.log("meta.index info: ", that.data.meta[uuid]["polyData"][e.target.index]);
// 								that.data.meta[uuid]["polyData"][e.target.index] = {
// 										x : e.target.left,
// 										y : e.target.top
// 								}
// // 								console.log("meta.index info: ", that.data.meta[uuid]["polyData"][e.target.index]);
// 							}							

// 							var polygonObj = canvas.getObjects("polygon");
// 							if(e.target && canvas.getObjects("polygon") && meta[uuid].polyData){
// 								canvasObj.freeDrawing = false;
// 								that.computed.addLine(uuid);
// 								that.computed.generatePoly(uuid);
// 							}

							var canv = that.data.canvas.getObjects();
							var target;
							
							for(var i=0; i<canv.length; i++){
								if(canv[i]['uuid']==uuid && canv[i]['type'] == 'polygon'){
									target = canv[i];
								}
							}
							
							if(target && target.freeDrawing == false){
								
								/* if(e.target != null && e.target.type == "point"){
								} */
								canvas.setActiveObject(target);
								
								if(canvas.getActiveObject()) {
									
									var path = that.pt.find(".list_table .path.active").attr("data-path");
									console.log(target);
									//test ai assitant
									var aiSeg = Object.assign(that.computed.rescale(target.points,true));
									
									var ajaxData = {
											path : path,
											left : aiSeg.left,
											top : aiSeg.top,
											width : aiSeg.width,
											height : aiSeg.height,
											type : "IMAGE_SEGMENTATION",
											distance : 1
									}
									
									
									$.ajax({
										url : baseUrl + "aiAssistant/runAiAssistant.json",
										data : ajaxData,
									   	type : "POST",
									   	success : function(res){
									   		console.log("=====runAiAssistant=====", res);
											if(res.result.code == "200"){
												var temp = that.computed.rescale(JSON.parse(res.result.data),false);
												
												that.data.meta[uuid]['polyData'] = temp;
												that.computed.generatePoly(uuid);
// 												that.bind.evtHandlers.editPolygon(true);
												canvas.renderAll();
											}
									   	},
									   	error : function(err){
									   		$("#loader").hide();
									   		 console.log("ERROR!!", err);
									   	}
									});
									
									
// 									that.bind.evtHandlers.editPolygon(true);
								}
								var checked = that.computed.checkHistory(uuid);
								if(checked){
									that.computed.stackHistory(uuid,"loaded");
								}
								
								
								var prevPoly = that.computed.getPrevPolyData(target);
								var newUpdatedPoints = JSON.parse(JSON.stringify(that.computed.getMatrixPosition(target)));
				                
				                
				                that.data.meta[uuid]['polyData'] = newUpdatedPoints;
								that.computed.stackHistory(uuid,"modified",e.target, prevPoly);
					
							} else {
								console.log("modified freeDrawing true e.target", e.target);
								that.computed.stackHistory(uuid,"created",e.target);
							}						
							
							var newPoly = that.computed.resetPolyPosition(that.data.canvas.getObjects(),uuid);
							that.data.meta[uuid]['polyData']['box'] = newPoly;
							that.render.renderCropImgIntoLabel(newPoly,uuid);
							
							that.data.canvasObj['isModified'] = 1;
							that.data.meta[uuid].confirmStatus = "0";
						});
					},// canvas poly mouse up event end
					
					wheelEvt : () => {
						const that = imgSeg;
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
						const that = imgSeg;
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
							const that = imgSeg;
							var canvas = that.data.canvas;
							return that, canvas; 
						},
						polygonPositionHandler : function(dim, finalMatrix, fabricObject) {
							var x = (fabricObject.points[this.pointIndex].x - fabricObject.pathOffset.x),
								y = (fabricObject.points[this.pointIndex].y - fabricObject.pathOffset.y);
							return fabric.util.transformPoint( { x: x, y: y },
						    	fabric.util.multiplyTransformMatrices(
						        fabricObject.canvas.viewportTransform,
						        fabricObject.calcTransformMatrix()
						      )
							);
						},
						actionHandler : function(eventData, transform, x, y) {
							let that = imgSeg;
							let canvas = that.data.canvas;
							if(x <= 0) {
								x = 0;
							}
							if(y <= 0) {
								y = 0;
							}
							if(x >= canvas.getWidth()) {
								x = canvas.getWidth();
							}
							if(y >= canvas.getHeight()) {
								y = canvas.getHeight();
							}
							var polygon = transform.target,
							    currentControl = polygon.controls[polygon.__corner],
							    mouseLocalPosition = polygon.toLocalPoint(new fabric.Point(x, y), 'center', 'center'),
					        polygonBaseSize = polygon._getNonTransformedDimensions(),
									size = polygon._getTransformedDimensions(0, 0),
									finalPointPosition = {
										x: mouseLocalPosition.x * polygonBaseSize.x / size.x + polygon.pathOffset.x,
										y: mouseLocalPosition.y * polygonBaseSize.y / size.y + polygon.pathOffset.y
									};
							polygon.points[currentControl.pointIndex] = finalPointPosition;
							return true;
						},
						anchorWrapper : function(anchorIndex, fn) {
						    return function(eventData, transform, x, y) {
						      var fabricObject = transform.target,
					          absolutePoint = fabric.util.transformPoint({
					              x: (fabricObject.points[anchorIndex].x - fabricObject.pathOffset.x),
					              y: (fabricObject.points[anchorIndex].y - fabricObject.pathOffset.y),
					          }, fabricObject.calcTransformMatrix()),
					          actionPerformed = fn(eventData, transform, x, y),
					          newDim = fabricObject._setPositionDimensions({}),
					          polygonBaseSize = fabricObject._getNonTransformedDimensions(),
					          newX = (fabricObject.points[anchorIndex].x - fabricObject.pathOffset.x) / polygonBaseSize.x,
					  		  newY = (fabricObject.points[anchorIndex].y - fabricObject.pathOffset.y) / polygonBaseSize.y;
						      fabricObject.setPositionByOrigin(absolutePoint, newX + 0.5, newY + 0.5);
						      return actionPerformed;
						  }
						},
						editPolygon : function(edit) {
							// clone what are you copying since you
							// may want copy and paste on different moment.
							// and you do not want the changes happened
							// later to reflect on the copy.
							//let that = imgSeg;
							//var handler = that.bind.evtHandlers;
							var handler = this;
							let that, canvas = handler.getRoot();
							var poly = canvas.getActiveObject();
							console.log("poly::", poly);
							//canvas.setActiveObject(poly);
							//console.log("check poly::", poly);
							//console.log("poly.edit::", poly.edit);
							//poly.edit = !poly.edit;
							if(poly) {
								if (edit) {
					      			var lastControl = poly.points.length - 1;
					      			poly.cornerStyle = 'circle';
					      			poly.cornerColor = 'gold';
					      			poly.cornerSize = '7';
						    		poly.controls = poly.points.reduce(function(acc, point, index) {
										acc['p' + index] = new fabric.Control({
											positionHandler: handler.polygonPositionHandler, 
											actionHandler: handler.anchorWrapper(index > 0 ? index - 1 : lastControl, handler.actionHandler),
											actionName: 'modifyPolygon',
											pointIndex: index
										});
										return acc;
									}, { });
								} else {
					      			poly.cornerColor = 'white';
					      			poly.cornerStyle = 'rect';
									poly.controls = fabric.Object.prototype.controls;
								}
							}
							//poly.hasBorders = !edit;
							canvas.requestRenderAll();
						},
		
					},
					
// 					objModifiedEvt : () => {
// 						const that = imgSeg;
// 						var canvas = that.data.canvas;
// 						canvas.on("object:modified",function(evt){
// 							that.data.canvas.getActiveObject().lockScalingX = false;
// 							that.data.canvas.getActiveObject().lockScalingY = false;	
// 							that.data.canvas.getActiveObject().lockMovementX = false;
// 							that.data.canvas.getActiveObject().lockMovementY = false;
// 						});
// 					},
					
// 					objScalingEvt : () => {
// 						const that = imgSeg;
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
						const that = imgSeg;
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
								var total_size = $("#imgSeg .position_wrap .total_count span").html()*1;
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
									var dataId = $("#imgSeg .c_wrap .path.active").parent("li").attr("data-id");
//		 							var labelBox = $(this).parent().parent().attr("id",uuid);
									var labelBox = $("#imgSeg .category_wrap .cate_wp#"+uuid);
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
								if($("#imgSeg .category_wrap .cate_wp").length == 0){
									$("#imgSeg .label_wrap .category_wrap .no_label").remove();
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
							// shift + p evt segmentation freeDrawing on/off
							if(evt.shiftKey == true && evt.keyCode == "80"){
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
								
								//console.log("canv::", canv);
								
								if(that.data.canvasObj.freeDrawing == true){
									that.data.canvasObj.freeDrawing = false;
									that.computed.deletePoint(uuid);
									that.computed.generatePoly(uuid);
								} else {
									that.data.canvasObj.freeDrawing = true;
									var canv = that.computed.getCanvasObject(uuid);
									let length = canv[0].points.length;
									for(let i = 0; i < length; i++) {
										that.computed.createPoint(uuid, canv[0].points[i], i);
									}
									//that.computed.deletePoint(uuid);

									//console.log("cate_wp::", cate_wp);
									that.computed.generatePoly(uuid);
								}
								console.log("shift+p freeDrawing is", that.data.canvasObj.freeDrawing);
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
					
					keydownEvt2 : function(){
						const that = imgSeg;
						var canvas = that.data.canvas;
						
						$(document).off("keydown").on("keydown",function(evt){
							if(evt.keyCode == "46" || evt.keyCode == "68" && evt.ctrlKey == true){
// 								evt.preventDefault();
								var uuid = $("#imgSeg .category_wrap .cate_wp").attr("id");
								if(uuid == undefined){
									alert("라벨을 선택해 주세요.");
									return false;
								}
								var tmp = confirm("데이터를 삭제하시겠습니까?");
								if(tmp == true && uuid != undefined){
		// 							var uuid = canvas.getActiveObject().uuid;
		// 							var uuid = canvas.getObjects()[0].uuid;
									
									var dataId = $("#imgSeg .c_wrap .path.active").parent("li").attr("data-id");
		// 							var labelBox = $(this).parent().parent().attr("id",uuid);
									var labelBox = $("#imgSeg .category_wrap .cate_wp#"+uuid);
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
						const that = imgSeg;
						// 임시
// 						$("#imgSeg .quick_btn").off("click").on("click", function(){
// 							alert("서비스 준비중 입니다.");
// 						});						
						
						// DOM Event
						$("#imgSeg .label_wrap input[name=label_name]").on("propertychange change keyup paste input", function(e) {
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
						
						$("#imgSeg .position-value").off("input").on("input", function(e){
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

						$("#imgSeg .label_wrap .btn_wrap .add").off("click").on("click",function(evt){
							$(this).blur();
							var uuid = that.computed.generateUUID();
							var keys = Object.keys(that.data.meta);
							var canvas = that.data.canvas;
							that.data.canvasObj.freeDrawing = true;
							
							// jh.sa 210122 
							if($("#imgSeg .category_wrap .cate_wp").length == 0){
								$("#imgSeg .label_wrap .category_wrap .no_label").remove();
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
							
							var labelNo = eval($("#imgSeg .label_wrap .category_wrap").find(".cate_wp").length+1);
							
							var html = that.render.tempInitCategory(uuid);
							$("#imgSeg .label_wrap .category_wrap").append(html);
							
							let color = that.data.colorHash.rgb(uuid);
							$("#imgSeg .label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
							
							$("#imgSeg .label_wrap .category_wrap .cate_wp").removeClass("selected");
							$("#imgSeg .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
							$("#imgSeg .label_wrap .category_wrap .cate_wp").last().addClass("selected");
							$("#imgSeg .label_wrap .category_wrap .cate_wp[id='"+uuid+"'].selected ").css("border-color","rgb("+color+")");
							
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
								} else if(canvs[i].type == "polygon" && canvs[i].fill == "#cccccc"){
// 									delete canvs[i];
									that.computed.generatePoly(canv_uuid, false);
								};
							}
							
						});
						
						// alert and meta data delete!!
						$("#imgSeg .label_wrap .category_wrap .cate_wp .delete").off("click").on("click",function(evt){
						
							var check = confirm("데이터를 삭제하시겠습니까?");
							if(check == true){
								let uuid = $(this).parent().parent().attr("id");
// 								var dataId = $(".data_item .collapse-item.active").attr("data-id");
								var dataId = $("#imgSeg .c_wrap .path.active").parent("li").attr("data-id");
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
						
						$("#imgSeg .category_wrap .cate_wp .category").off('keypress').on('keypress',function(evt){
							if(evt.keyCode == 13){
								var uuid = $(this).parent().parent().attr("id");
								that.data.meta[uuid]['category'] = $(this).val();
							}
						});
						
						
						$("#imgSeg .category_wrap .cate_wp").off("click").on("click",function(){
							var uuid = $(this).attr("id");
							var color = that.data.colorHash.rgb(uuid);
							$("#imgSeg .label_wrap .category_wrap .cate_wp").removeClass("selected");
							$("#imgSeg .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
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
										//that.data.canvas.setActiveObject(canvs[j]);
										if(canvs[j]['uuid'] == uuid){
											that.data.canvas.setActiveObject(canvs[j]);
										}
										/* if(canvs[j].type == "point" && canvs[j].fill == "red"){
//		 									delete canvs[i];
//		 									that.computed.createPoint(canv_uuid,canvs[i],canvs[i].index);
											canvs[j].fill = "green";
										} else if(canvs[j].type == "polygon" && canvs[j].fill == "#cccccc"){
//		 									delete canvs[i];
											that.computed.generatePoly(canv_uuid, false);
										}; */
									}									
								}
							}
							that.data.canvas.fire("mouse:up");
							that.bind.evtHandlers.editPolygon(true);
						});
						
						// jh.sa test 
						$("#imgSeg .save_btn_wrap .save").off("click").on("click",function(){
							$(this).blur();
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
						$("#imgSeg .data_list_btn").off("click").on("click", function(){
							var data_list_wrap = $("#imgSeg .data_list_wrap");
							if(data_list_wrap.hasClass("active")){
								data_list_wrap.removeClass("active");
								data_list_wrap.css("display", "none");	
							} else {
								data_list_wrap.addClass("active");
								data_list_wrap.css("display", "block");	
								data_list_wrap.attr("state", true);
							}
						});				
						
						$("#imgSeg .data_list_wrap .close_btn").off("click").on("click", function(){
							var data_list_wrap = $("#imgSeg .data_list_wrap");
							data_list_wrap.removeClass("active");
							data_list_wrap.css("display", "none");	
						});						
						
						// jh.sa 210121 데이터 리스트 이외 영역 클릭 시 데이터리스트 닫기
						$("#imgSeg .data_list_wrap").off("click").on("click", function(){
							var data_list_wrap = $("#imgSeg .data_list_wrap");
							data_list_wrap.attr("state", true);
						});
						
						$(".section.imgSeg.selected #wrapper").off("click").on("click", function(){
							//console.log("click");
							var data_list_wrap = $("#imgSeg .data_list_wrap");
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
						$("#imgSeg .label_wrap .category_wrap .cate_wp .visible").off("click").on("click",function(evt){
							let uuid = $(this).parent().parent().attr("id");
							var canv = that.computed.getCanvasObject(uuid);
							var meta = that.data.meta;
							var l_all = $("#imgSeg .label_wrap .category_wrap .cate_wp .visible");
							var b_all = $("#imgSeg .label_wrap .btn_wrap .visible");
							
							if($(this).hasClass("on")){
								$(this).removeClass("on");
								$(this).addClass("off");
								
								var poly = that.data.canvas.getObjects("polygon");
								for(var i=0; i < poly.length; i++){
									if(poly[i].uuid === uuid){
										for(var j=0; j < poly[i].points.length; j++){
											var rmObj = that.computed.getCanvasObject(uuid);
											that.data.canvas.remove(rmObj);
										}
									}
								}		
								
								that.data.canvas.remove(canv);
								
								var off = $("#imgSeg .label_wrap .category_wrap .cate_wp .visible.off");
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
								
								var on = $("#imgSeg .label_wrap .category_wrap .cate_wp .visible.on");
								if(on.length === l_all.length){
									b_all.removeClass("off");
									b_all.addClass("on");
								}
								
							}
						});		
						
						$("#imgSeg .label_wrap .btn_wrap .visible").off("click").on("click",function(evt){
							var label_visible = $("#imgSeg .cate_wp .visible");
							
							
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
						$("#imgSeg .c_wrap .preview .img_preview").off("mouseenter").on("mouseenter", function(){
							const x = $(this).offset().left + $(this).outerWidth() + 10;
					        const y = $(this).offset().top + $(this).outerHeight() - 59;
							const html = "<div class='show_img_wrap' style='position: fixed; top: "+ y +"px; left: "+ x +"px;'>"
								+ "<div class='title_wrap flex'><div class='image'></div><span class='title'></span></div>"
								+ "<div class='frame_container'>"
								+ 	"<canvas id='imgSeg-cc' width='270px' height='182px'>"
								+ "</div>"
								+ "</div>";
					        $(this).append(html);
					        
					        //img load
// 					        showLoading(".show_img_wrap");
// 					        const id = $(this).parents("li").find(".id").text();
// 					        const path = $(this).parents("li").find(".path").text();
					        
// 					        $(".show_img_wrap .title").text(id);
// 					        that.data.canvasPreview = new fabric.Canvas("imgSeg-cc");
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
					        var canvasPreview = new fabric.Canvas("imgSeg-cc");
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
						
						$("#imgSeg .c_wrap .preview .img_preview").off("mouseleave").on("mouseleave", function(){
							that.pt.find(".show_img_wrap").remove();
						});							
						
						// k.park 201015
						$("#imgSeg .img_list_wrap .data_list_wrap .list_table ul li .path").off("click").on("click",function(){
							var data_num = $(this).parent().attr("data-index")*1-1;
							var page_size=50;
							var currPage = $("#imgSeg #pagination .page-item.active .page-link").html()*1-1;
							var currDataNum = currPage*page_size + data_num;
							that.computed.initImgData(currDataNum);
						});
						

						$("#imgSeg #pagination .first").off("click").on("click",function(){
							that.computed.clearAllData();
							var page_num = 0;
							that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
						});
						$("#imgSeg #pagination .prev").off("click").on("click",function(){
							var page_size = 50;
							var page_num = $("#imgSeg #pagination .page-item.active .page-link").html()-2;
							if(page_num<0){
								alert("첫 페이지 입니다.");
								return false;
							}
							that.computed.clearAllData();
							that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
						});
						$("#imgSeg #pagination .page-link").off("click").on("click",function(){
							if( isNaN($(this).html()) == false){
								var page_num = $(this).html()*1-1;
								that.computed.clearAllData();
								that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
							}
						});
						$("#imgSeg #pagination .next").off("click").on("click",function(){
							var page_size = 50;
							var page_num = $("#imgSeg #pagination .page-item.active .page-link").html()*1;
							var lastPage = Math.floor($("#imgSeg .position_wrap .total_count span").html()*1/page_size);
							if(page_num>lastPage){
								alert("마지막 페이지 입니다.");
								return false;
							}
							
							var page = $("#imgSeg .position_wrap .total_count span").html()*1/page_size;
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
						$("#imgSeg #pagination .last").off("click").on("click",function(){
							var page_size = 50;
							that.computed.clearAllData();
							var page_num = Math.floor($("#imgSeg .position_wrap .total_count span").html()*1/page_size);
							
							var page = $("#imgSeg .position_wrap .total_count span").html()*1/page_size;
							if(page == page_num){
								that.computed.getVideoDataList(page_num-1,that.data.canvasObj['datasetId']);
							} else {
								that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
							}	
							
// 							that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
						});
						
						$("#imgSeg .prev_data_wrap").off("click").on("click",function(){
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
						$("#imgSeg .next_data_wrap").off("click").on("click",function(){
							var currDataNum = that.data.canvasObj['currDataNum']*1;
							var page_size = 50;
							var total_size = $("#imgSeg .position_wrap .total_count span").html()*1;
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
						
						$("#imgSeg .img_list_wrap .name_wrap .prev_btn").off("click").on("click",function(){
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
						$("#imgSeg .img_list_wrap .name_wrap .next_btn").off("click").on("click",function(){
							var currDataNum = that.data.canvasObj['currDataNum']*1;
							var page_size = 50;
							var total_size = $("#imgSeg .position_wrap .total_count span").html()*1;
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
						
						$("#imgSeg .position-value").off("keypress").on("keypress",function(evt){
							if(evt.keyCode == "13"){
								var page_size = 50;
								var targetDataNum = $(this).val()*1-1;
								var targetPageNum = Math.floor(targetDataNum*1/page_size*1)+1;
								var currPageNum = $("#imgSeg #pagination .page-item.active .page-link").html();
								var total_size = $("#imgSeg .position_wrap .total_count span").html()*1;
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
						                //o[i].hasBorders = true;
										canvas.bringToFront(o[i]);
										canvas.setActiveObject(o[i]);
										that.bind.evtHandlers.editPolygon(true);
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
                        const that = imgSeg;
                        var no_label = '<div class="no_label"><div></div><div>No Label</div><div>Please Add Label</div></div>';
						$("#imgSeg .category_wrap").html(no_label);                           
//                         $("#imgSeg .category_wrap").html("");
                        $("#imgSeg .img_list_wrap .name_wrap .file_name").html("");
                        $("#imgSeg .total_count span").html("")
                        $("#imgSeg .empty_wrap").remove();
                        const html = '<div class="empty_wrap"><div class="no_image"></div><div class="eng_text">No Data</div><div class="kor_text">you have not selected any data yet</div></div>';
                        that.pt.find("section.enrichment .canvas-container").hide();
                        that.pt.find("section.enrichment .video_wrap").append(html);
                    },					
					
				},// bind end
				computed : {
					root : null,
					getPrevPolyData(target){
						const that = imgSeg;
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
						let that = imgSeg;
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
						const that = imgSeg;	
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
						const that = imgSeg;
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
						const that = imgSeg;
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
						const that = imgSeg;
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
						const that = imgSeg;
						var meta = that.data.meta;
						
						var polyObj = this.getPointObject(meta[uuid]);
						var tempPoly = new fabric.Circle( polyObj );
						
						that.data.canvas.add(tempPoly);
						
						
					}, //init Poly data end
					
					addLine(uuid){ //create new line
						const that = imgSeg;
						var tmpObj = that.computed.getLineObject(uuid);
						var points = that.data.meta[uuid]['polyData'];
						
						var tempLine = new fabric.Line(points,tmpObj);
						that.data.canvas.add(tempLine);
						that.data.canvas.setActiveObject(tempLine);
						that.data.canvas.renderAll();
					},
					generatePoly(uuid, isCompleted){ //create new poly
						const that = imgSeg;
						var canvas = that.data.canvas;
						var canvasObj = that.data.canvasObj;
						var tmpObj;
						///////201031
						console.log("isCompleted!", isCompleted);
						if(isCompleted == false){
							tmpObj = that.computed.getPolyObject(uuid,false);
						} else {
							tmpObj = that.computed.getPolyObject(uuid,canvasObj.freeDrawing);
						}
// 						var tmpObj = that.computed.getPolyObject(uuid,canvasObj.freeDrawing);
						var points = that.data.meta[uuid]['polyData'];
						var tempPoly = new fabric.Polygon(points,tmpObj);
						
						$.each(canvas.getObjects(),function(index,obj){
							if(typeof obj.uuid != "undefined" && obj.uuid == uuid && obj.type != "point"){
								canvas.remove(obj);
							}
						});
						
// 						if(canvasObj.freeDrawing == false){
							
// 							$.each(canvas.getObjects(),function(index,obj){
// 								if(typeof obj.uuid != "undefined" && obj.uuid == uuid && obj.type != "point"){
// 									canvas.remove(obj);
// 								}
// 							});
// 						}
							
						canvas.add(tempPoly);
						canvas.sendToBack(tempPoly);
// 						canvas.setActiveObject(tempPoly);
						canvas.renderAll();
						that.data.meta[uuid]['polyData']['box'] = {
								left:tempPoly.left,
								top:tempPoly.top,
								width:tempPoly.width,
								height:tempPoly.height,
						}						
					},
					
					// get CIRCLE object for initialisation
					getPointObject(uuid,points,index) {
						const that = imgSeg;
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
						const that = imgSeg;
						var object = {
							strokeWidth: 2,
				            fill: '#999999',
				            stroke: '#999999',
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
					
					// get POLYGON object for initialisation
					getPolyObject(uuid,freeDrawing){
						const that = imgSeg;
						var meta = that.data.meta;
						var object = {};
						console.log("getPolyObject free::", freeDrawing);
						if(freeDrawing == true){
							object = {
								stroke:'#333333',
				                strokeWidth:1,
				                type:'polygon',
				                fill: '#cccccc',
				                opacity: 0.3,
				                selectable: true,
				                hasBorders: false,
				                hasControls: false,
				                evented: false,
				                objectCaching:false,
				                freeDrawing : true,
				                uuid : uuid,
							};	
						}else{
							object = {
								stroke:'#333333',
					            strokeWidth:0.5,
					            type:'polygon',
					            fill: 'rgb('+that.data.colorHash.rgb(uuid)+',0.5)',
								selectable: true,
					            hasBorders: false,
					            hasControls: true,
					            objectCaching:false,
					            lockMovementX: false,
								lockMovementY: false,
					            lockUniScaling : true,
					            lockScalingFlip : true,
					            freeDrawing : false,
					            uuid : uuid,
							}
						}
						return object;
					},
					
					resetPolyPosition(canvObjs,uuid){
						const that = imgSeg;
						var scaledRatio = that.data.scaleFactor.ratio;
						var newPoly = null;
						
						for(var i=0; i<canvObjs.length; i++){
							if(canvObjs[i]['uuid'] == uuid && canvObjs[i]['type'] == "polygon"){
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
						const that = imgSeg;
						let canvas = that.data.canvas;
						var isModified = that.data.canvasObj['isModified'];
						var msg = "데이터 이동 시 저장되지 않은 라벨은 손실됩니다. 계속하시겠습니까?";						
						
						if(isModified == 1){
							if(!confirm(msg)){
								return false;
							}
						}						
						$("#imgSeg .category_wrap").html("");
						that.computed.clearAllData();
						that.computed.getDataByNum(dataNum);
						
						// s.kim 210506
						// zoom, undo, redo 초기화 
						that.data.undoStack = [];
						that.data.redoStack = [];
						canvas.setZoom(1);
						canvas.viewportTransform[4] = 0;
						canvas.viewportTransform[5] = 0;
						canvas.renderAll();
					},					
					
					// create meta data
					initMetaData(uuid) {
						const that = imgSeg;
						
						that.data.meta[uuid] = {
// 							labelNo : labelNo,
							id : uuid,
							polyData : [],
							category : null,
						};
						
					},// create meta data end
					
					clearAllData(){
						const that = imgSeg;
						that.data.scaleFactor = {origWidth:0, origHeight:0, ratio:1};
						that.data.canvasObj.isModified = 0;
						this.clearCanvas();
						this.clearMeta();
						this.clearPoly();
					},
					
					clearCanvas(){
						const that = imgSeg;
						that.data.canvasObj['currDataNum'] = null;
						that.data.canvas.clear();
					},
					
					clearMeta(){
						const that = imgSeg;
						that.data.meta = {};
					},
					
					clearPoly(){
						const that = imgSeg;
						that.data.poly = {};
					},					
					
					// jh.sa 201028 추가 
					getDatasetById : function(id){
						var that = imgSeg;
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
						const that = imgSeg;
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
						const that = imgSeg;
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
						const that = imgSeg;
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
							$("#imgSeg .label_wrap .label_title span").html(result.length);
							
							// jh.sa 210122
							if(result.length > 0){
								that.render.initMetaFromData(result);
							} else {
								var no_label = '<div class="no_label"><div></div><div>No Label</div><div>Please Add Label</div></div>';
								$("#imgSeg .category_wrap").html(no_label); 	
								$("#loader").hide();
								$("#imgSeg .label_wrap .btn_wrap .add").show();
							}
							
// 							that.computed.checkMetaFrame(0);
						});
						
					},
					
					
					getDataDetail(dataId){
						const that = imgSeg;
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
						const that = imgSeg;
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
						const that = imgSeg;
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
								label_type : "IMAGE_SEGMENTATION",
								data_id : dataId,
								data : JSON.stringify(data)
						}						
						
						console.log("ajaxData imgSeg: ", ajaxData);
						
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
									$("#imgSeg .category_wrap").html("");
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
	 					const that = imgSeg;
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
						const that = imgSeg;
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
						const that = imgSeg;
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
						const that = imgSeg;
						
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
									$("#imgSeg .label_wrap .label_title span").html(tagset.length);
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
						const that = imgSeg;
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
						const that = imgSeg;
// 						var imgObj = this.checkImageSize(dataAddr);
						// 실제 비디오 크기 기준
						// scaleFactor > 1 : 실제 비디오가 캔버스 크기보다 큼
						// scaleFactor < 1 : 실제 비디오가 캔버스 크기보다 작음
						that.data.scaleFactor.origWidth = imgObj['width'];
						that.data.scaleFactor.origHeight = imgObj['height'];
						that.data.scaleFactor.ratio = $("#imgSeg-canvas").width() / that.data.scaleFactor.origWidth;
						
					}, // scalefactor end
					
					// re-size poly on canvas
					rescale : function(polyData,isSave){
						const that = imgSeg;
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
						const that = imgSeg;
						
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
// 						$("#imgSeg #imgSeg-labeller").height(img.naturalHeight*scaleFactor);						
					},							
					
					
					// save poly all data
					saveMetaData : function(uuid,newPoly){
						window.getSession();
						const that = imgSeg;
						var meta = that.data.meta;
						
						var tempPoly = {
							x : newPoly.x,
							y : newPoly.y,
						}
						
						meta[uuid]['id'] = uuid;
						meta[uuid]['polyData'].push(tempPoly);
// 						category : $("#imgSeg .category_wrap [id='"+uuid+"'] .category").val();
						meta[uuid]['category'] = $("#imgSeg .category_wrap [id="+uuid+"] .category").val();
					},
					
					// k.park 201015
					deleteMetaData(uuid,labelBox,isAjax){
						const that = imgSeg;
						var label_name = $(labelBox).find("input").val();
						if(!uuid){
							return false;
						}
						labelBox.remove();
						
						// jh.sa 210122
						if($("#imgSeg .category_wrap .cate_wp").length == 0){
							var no_label = '<div class="no_label"><div></div><div>No Label</div><div>Please Add Label</div></div>';
							$("#imgSeg .label_wrap .category_wrap ").html(no_label);
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
						const that = imgSeg;
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
					// undo, redo method
					history : function(mode){
						const that = imgSeg;
						var canvas = that.data.canvas;
						switch (mode){
							case "undo":
								if(that.data.undoStack.length == 0){
									console.log("불러올 undo history 없음");
									return;
								}
								that.data.pauseSaving = true;
								var state = that.data.undoStack.pop();
								//console.log("state::", state);
								//var prev = that.data.undoStack[that.data.undoStack.length-1];
								//console.log("history prev::", prev);   
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
										//console.log("true!");
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
						    	//var prev = that.data.redoStack[that.data.reddoStack.length-1];
						    	console.log("redo state::", state);
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
						const that = imgSeg;
						var canvas = that.data.canvas;
						
						switch (mode){
						case "undo":
							that.computed.setHistoryCanvasObj(state,null,"undo");	
							break;
						case "redo":
							that.computed.setHistoryCanvasObj(state, null, "redo");
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
						const that = imgSeg;
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
							//console.log("setHistoryCanvasObj state::", state);
							//console.log("mode::", mode);
							if(state.action == "modified" && mode == "undo"){
								//polyData = state.prevPoly;
								polyData = state['prevPoly'];
								//console.log("setHistoryCanvasObj undo polyData::", polyData);
							} else {
								//polyData = state['polyData'];
								polyData = state['polyData'];
								//console.log("setHistoryCanvasObj redo polyData::", polyData);
								//polyData = state.prevPoly;
								//console.log("polyData::", polyData);
							}
							//that.data.undoStack
							//console.log("polyData::", polyData);
			    			var uuid = state["id"];
			    			
			    			var canv = that.computed.getCanvasObject(uuid);
			    			//console.log("canv::", canv);
			    			for(var i=0; i<canv.length; i++){
			    				if(canv[i].uuid == state.id){
			    					//console.log("remove canv[i]", canv[i]);
			    					that.data.meta[uuid].polyData = [];
			    					that.data.canvas.remove(canv[i]);
			    					that.data.canvas.renderAll();
			    				}
			    			}
			    			
			    			//console.log("remove that.data.meta[uuid].polyData::", that.data.meta[uuid].polyData);
			    			//that.data.undoStack[that.data.undoStack.length - 1].freeDrawing = false;
							for(var j=0; j<polyData.length; j++){
								//console.log("polyData[j]", polyData[j]);
								that.computed.saveMetaData(uuid,polyData[j]);
								// undo할 인덱스의 freeDrawing이 true상태일 경우, 점을 생성해 폴리곤을 완성할 수 있도록 조건문 추가
								if(state.action == "created" && mode == "redo" || (that.data.undoStack.length > 0 && that.data.undoStack[that.data.undoStack.length - 1].freeDrawing == true)) {
									that.computed.createPoint(uuid,polyData[j],j);
									that.data.canvasObj.freeDrawing = true;
									//console.log("true!");
								}
							}
							
							if(state.action == "modified" && mode == "redo") {
								that.data.canvasObj.freeDrawing = false;
							}
							//that.data.undoStack
							var canvs = canvas.getObjects();
							for(var j=0; j<canvs.length; j++){
								if(canvs[j].type == "point" && canvs[j].fill == "red"){
									canvs[j].fill = "gold";
								}
							}
							
							that.computed.addLine(uuid);
							that.computed.generatePoly(uuid);	
							
							var newPoly = that.computed.resetPolyPosition(that.data.canvas.getObjects(),state.id);
							that.render.renderCropImgIntoLabel(newPoly,state.id);			    				
							canvas.renderAll();										
// 						}
					},
					
					// jh.sa 210402 
					modifyLabel : function(state, mode){
						const that = imgSeg;
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
						const that = imgSeg;
						var canvas = that.data.canvas;
						switch (mode){
							case "undo":
								if(state.action == "removed"){
									if(that.pt.find(".cate_wp#"+state.id).length == 0){
										that.computed.setHistoryBox(state);
									}									
								} else {
									console.log("removeHistoryBox::", state);
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
						const that = imgSeg;
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
						const that = imgSeg;
						var canvas = that.data.canvas;
						var canv = canvas.getObjects();
						var arr = [];
						console.log("removeHistoryBox!");
						//if(state.point) {
						//	that.data.canvas.remove(state.point);
						//}
						for(var i=canv.length; i>0; i--){
							// 캔버스에서 객체 지우고 우측 라벨박스 미리보기도 지우기
							//console.log("canv[i]::",canv[i]);
							if(canv[i - 1].uuid == state.id){
									//arr.push(canv[i-1]);
									//that.data.meta[state.id].polyData = [];
									//canvas.remove(canv[i - 1]);
									canvas.renderAll();
									/* var crop = that.pt.find(".cate_wp#"+state.id).find(".crop_img");
									var ctx = crop[0].getContext('2d');
									var panelW = 200;
									var panelH = 200;
									ctx.clearRect(0,0,panelW,panelH); */
									if(canv[i-1].type == "point") {
										canvas.remove(canv[i-1]);
										that.data.meta[state.id].polyData.pop();
										//that.data.meta[state.id].polyData.pop();
										that.computed.generatePoly(state.id);	
										var newPoly = that.computed.resetPolyPosition(that.data.canvas.getObjects(),state.id);
										//console.log("newPoly::", newPoly);
										that.data.meta[state.id]['polyData']['box'] = newPoly;
										that.render.renderCropImgIntoLabel(newPoly,state.id);
										break;
									}
//										console.log("ctx: ", ctx);
							}
						}
						/* if(canvas.getActiveObject() == null) {
							that.data.canvasObj.freeDrawing = true;
							console.log("tttrue!");
						} */
						//console.log("arr::", arr);
						//console.log("arr.length::", arr.length);
						// 라벨박스만 남아있을 때 라벨박스, 메타 삭제
						if(state.action == "copied" || state.action == "removed"){
							
							that.pt.find(".cate_wp#"+state.id).remove();
							that.data.canvasObj.freeDrawing = false;
							delete that.data.meta[state.id];
						}	
						
						console.log("state.polyData::", state.polyData);
						if(state.polyData.length == 0) {
							that.pt.find(".cate_wp#"+state.id).remove();
							that.data.canvasObj.freeDrawing = false;
							delete that.data.meta[state.id];
						}
						
						//console.log("state.polyData::", state.polyData);
						
						if(that.pt.find(".category_wrap .cate_wp").length == 0){
							var no_label = '<div class="no_label"><div></div><div>라벨 없음</div><div>라벨을 추가해주세요.</div></div>';
							that.pt.find(".label_wrap .category_wrap ").html(no_label);							
						}
					},					
                    
                    stackHistory : function(uuid, action, point, prevPoly){
                    	const that = imgSeg;
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
					        console.log("stackHistory data::", data);
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
                    	const that = imgSeg;
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
						const that = imgSeg;
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
						const that = imgSeg;
						var totalPage = Math.ceil(total_size * 1 / page_size);
						
						if($("#imgSeg #pagination").data("twbs-pagination")){
							$("#imgSeg #pagination").twbsPagination('destroy');
						}
						$("#imgSeg #pagination").twbsPagination({
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
						const that = imgSeg;
						
						var total = $("#imgSeg .data_list_wrap .data_total span");
						var target = $("#imgSeg .list_table .c_wrap");
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
						const that = imgSeg;
						
						
						that.data.canvas['dataId'] = data['data_id'];
						var dataAddr = '/uploadFile/xlabeller/'+data.path;
						
// 						$("#imgSeg .prog_bar .name_wrap .video_name").html(data['filename']);
						$("#imgSeg .img_list_wrap .name_wrap .file_name").html(data['filename']);
						$("#imgSeg .img_list_wrap .name_wrap .file_name").attr("title",data['filename']);
						$("#imgSeg .list_table .c_wrap .path").removeClass("active");
						$("#imgSeg .list_table .c_wrap [data-id='"+data['data_id']+"'] .path").addClass("active");
						$("#imgSeg .list_table .c_wrap [data-id='"+data['data_id']+"'] .label_cnt").html(data['meta_cnt']);
						$("#imgSeg .position_wrap .position-value").val(that.data.canvasObj['currDataNum']);
						
						if(total_size){
							$("#imgSeg .position_wrap .total_count span").html(total_size);
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
						const that = imgSeg;
						
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
						const that = imgSeg;
						var meta = that.data.meta;
						var keys = [];
						
						$("#imgSeg .label_wrap .category_wrap").empty();
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
						$("#imgSeg .label_wrap .btn_wrap .add").show();
						$("#imgSeg .label_wrap .category_wrap .cate").removeClass("selected");
						$("#imgSeg .label_wrap .category_wrap .cate").last().addClass("selected");
						$("#loader").hide();
					},
					// in labeller tab
					tempInitCategory(uuid){
						const that = imgSeg;
						
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
						html += '		<input type="text" class="form-control category" name="label_name" onkeyUp="noKor(event);noSpaceForm(this);" onchange="noSpaceForm(this);/>';
						html += '	</div>';
						html += '	<div class="col-12 text-center p-1 crop_wrap"><canvas class="crop_img"></canvas></div>';
						
						html += '</div>';
						
						return html;
					},
					
					// render crop Image from canvas into the Label Box(category_wrap)
					renderCropImgIntoLabel(newPoly,uuid){
						const that = imgSeg;
						var scaleRatio = that.data.scaleFactor.ratio;

						if(newPoly == undefined || newPoly == null){
							return;
						}
						var pt = $("#imgSeg .label_wrap .category_wrap .cate_wp[id="+uuid+"]").find(".crop_img");
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
						const that = imgSeg;
						var meta = that.data.meta;
						var metaKeys = Object.keys(meta);
						
						for(var i=0; i<metaKeys.length; i++){
							
							var uuid = meta[metaKeys[i]]['id'];
							var labelNo = meta[metaKeys[i]]['labelNo'];
							
							let html = that.render.tempInitCategory(uuid);
							$("#imgSeg .label_wrap .category_wrap ").append(html);
							
							var newPoly = that.computed.resetPolyPosition(that.data.canvas.getObjects(),uuid);
							that.render.renderCropImgIntoLabel(newPoly,uuid);							
							
							let color = that.data.colorHash.rgb(uuid);
							$("#imgSeg .label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
							
							$("#imgSeg .label_wrap .category_wrap [id='"+uuid+"'] .category").val(meta[metaKeys[i]]['category']);
						}
						that.bind.sideEvtCollision();
					
					}, // drawing category from meta end in Labeller tab
					
					
					adjustArea(){
						const that = imgSeg;
						var scaleFactor = that.data.scaleFactor;
						
						var scaledHeight = scaleFactor.origHeight * scaleFactor.ratio;
// 						var progBarHeight = $(".prog_bar").height();
						
						var progBarHeight = 157;
						var headerHeight = 67*1;
						// video area height
// 						$("#labeller-video").css("height",scaledHeight);
						$("#imgSeg .enrichment").css("height",scaledHeight*1+progBarHeight+headerHeight);						
						
						// video area height
// 						$("#labeller-video").css("height",scaledHeight);
						// canvas init and adjust height
// 						that.data.canvas.setHeight(scaledHeight-progBarHeight);
// 						that.data.canvas.setHeight(scaledHeight);
// 						// search area height
// 						$(".cate_search_wrap .content_wp").css("height",scaledHeight-progBarHeight);
						
		 				// category area height
// 						$("#imgSeg .label_wrap ").css("height",$("#labeller-video")[0].clientHeight);
// 						$("#imgSeg .label_wrap .category_wrap").css("height",$("#labeller-video")[0].clientHeight-progBarHeight-10);
						
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
						const that = imgSeg;
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
						const that = imgSeg;

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
						const that = imgSeg;
						elem.find(".hover_box").remove();
					},							
					
				},// draw something end
				
				
		};
		
		const imgSegQuick = {
				data : {
					taskName : null,
					annotationName : null,
					inferenceName : null,		
				},
				init : function(){
					const that = imgSegQuick;
					
					that.bind.quickTraining();
					that.bind.quickInference();
				},
				bind : {
					// Quick Training & Inference
					quickTraining() {
						const that = imgSegQuick;
						
						// quick training 팝업창 띄우기
						$("#imgSeg #quick_training_btn").off("click").on("click", function(){
							$("#imgSeg .quick_training").toggleClass("active");
							$("#imgSeg .quick_training").draggable({containment: "document"});
							$("#imgSeg .add_project").removeClass("active");
							$("#imgSeg .checkpoint_list").removeClass("active");
							$("#imgSeg .quick_training .radioBtn.selected").removeClass("selected");	
							$("#imgSeg .training_config").removeClass("active");
							$("#imgSeg .add_project_btn")[0].textContent = "+";
							$("#imgSeg .training_config_btn")[0].textContent = "+";
							$("#imgSeg #quick_training .checkpoint_list_btn")[0].textContent = "+";
							$("#imgSeg .description_wrap").removeClass("border");
							$("#imgSeg .checkpoint_view").removeClass("active");
							$("#imgSeg .algorithm_result").removeAttr("disabled");
							$("#imgSeg #training_config .config_wrap").html("");
							$("#imgSeg #training_config .description_wrap").html("");	
							$("#imgSeg .empty_wrap").remove();
							// j.seo 수정
							/* that.root.computed.getDatasetList(); */
							that.computed.setAnnoTaskName();
							that.computed.getTaskList(null, "0");
							that.computed.getAlgorithmList();
						});
						// 새 project 생성 창 띄우기 버튼 
						$("#imgSeg .add_project_btn").off("click").on("click", function() {
							let add_project_zIndex = parseInt($("#imgSeg #quick_training .add_project").css("zIndex"));
							let checkpoint_list_zIndex = parseInt($("#imgSeg #quick_training .checkpoint_list").css("zIndex"));
							let train_config_zIndex = parseInt($("#imgSeg #quick_training .training_config").css("zIndex"));	
							
							$("#imgSeg .add_project").toggleClass("active");
							$("#imgSeg .add_project input").val("");
							$("#imgSeg .add_project textarea").val("");
							if($("#imgSeg .add_project").hasClass("active")){
								$("#imgSeg .add_project_btn")[0].textContent = "-";
							} else {
								$("#imgSeg .add_project_btn")[0].textContent = "+";
							}
							
							// z-index 우선순위 제어
							if(add_project_zIndex <= checkpoint_list_zIndex){
								$("#imgSeg #quick_training .add_project").css({"zIndex":checkpoint_list_zIndex + 1});
							} else if(add_project_zIndex <= train_config_zIndex) {
								$("#imgSeg #quick_training .add_project").css({"zIndex":train_config_zIndex + 1});
							}					
						});
						// Checkpoint list 창 띄우기 버튼
						$("#imgSeg #quick_training .checkpoint_list_btn").off("click").on("click", function() {
							let add_project_zIndex = parseInt($("#imgSeg #quick_training .add_project").css("zIndex"));
							let checkpoint_list_zIndex = parseInt($("#imgSeg #quick_training .checkpoint_list").css("zIndex"));
							let train_config_zIndex = parseInt($("#imgSeg #quick_training .training_config").css("zIndex"));
							
							if($("#imgSeg .task_result").val() != ""){
								$("#imgSeg #quick_training .checkpoint_list").toggleClass("active");
//		 						$("#imgSeg .empty_wrap").remove();
//		 						$(".quick_training .radioBtn.selected").removeClass("selected");	// 수정 창 띄울때 없애는것이 아니라 옵션이 바뀔때 없애야함
								if($("#imgSeg #quick_training .checkpoint_list").hasClass("active")){
									$("#imgSeg #quick_training .checkpoint_list_btn")[0].textContent = "-";
								} else {
									$("#imgSeg #quick_training .checkpoint_list_btn")[0].textContent = "+";
								}					
							} else {
								alert("Inheritance에 사용할 task를 선택해주세요");	
							}
							
							// z-index 우선순위 제어
							if(checkpoint_list_zIndex <= add_project_zIndex){
								$("#imgSeg #quick_training .checkpoint_list").css({"zIndex":add_project_zIndex + 1});
							} else if(checkpoint_list_zIndex <= train_config_zIndex) {
								$("#imgSeg #quick_training .checkpoint_list").css({"zIndex":train_config_zIndex + 1});
							}					
						});
						// Training config 입력 영역 띄우기 버튼
						$("#imgSeg .training_config_btn").off("click").on("click", function() {
							let add_project_zIndex = parseInt($("#imgSeg #quick_training .add_project").css("zIndex"));
							let checkpoint_list_zIndex = parseInt($("#imgSeg #quick_training .checkpoint_list").css("zIndex"));
							let train_config_zIndex = parseInt($("#imgSeg #quick_training .training_config").css("zIndex"));
							
							$("#imgSeg .training_config").toggleClass("active");
//		 					$("#imgSeg .description_wrap").html("");
							if($("#imgSeg .training_config").hasClass("active")){
								$("#imgSeg .training_config_btn")[0].textContent = "-";
							} else {
								$("#imgSeg .training_config_btn")[0].textContent = "+";
							}
							
							// z-index 우선순위 제어
							if(train_config_zIndex <= add_project_zIndex){
								$("#imgSeg #quick_training .training_config").css({"zIndex":add_project_zIndex + 1});
							} else if(train_config_zIndex <= checkpoint_list_zIndex) {
								$("#imgSeg #quick_training .training_config").css({"zIndex":checkpoint_list_zIndex + 1});
							}					
						});					
						// 팝업창 닫기
						$("#imgSeg #quick_training .quick_close").off("click").on("click", function() {
							$("#imgSeg .quick_training").removeClass("active");
							$("#imgSeg .checkpoint_list .selected_task_name").html("");					
						});
						$("#imgSeg #quick_training .add_project .side_btn_wrap .cancel_btn").off("click").on("click", function() {
							$("#imgSeg .add_project").removeClass("active");
							$("#imgSeg .add_project_btn")[0].textContent = "+";
						});
						$("#imgSeg #quick_training .training_config .side_btn_wrap .cancel_btn").off("click").on("click", function() {
							$("#imgSeg .training_config").removeClass("active");
							$("#imgSeg .training_config_btn")[0].textContent = "+";
							let temp_id = $("#imgSeg .quick_training .algorithm_result option:selected").data("id");
							that.computed.getAlgorithmById(temp_id, "0");
						});		
						$("#imgSeg #quick_training .training_config .side_btn_wrap .save_btn").off("click").on("click", function() {
							$("#imgSeg .training_config").removeClass("active");
							$("#imgSeg .training_config_btn")[0].textContent = "+";
						});						
						
						$("#imgSeg #quick_training .checkpoint_list .side_btn_wrap .cancel_btn").off("click").on("click", function() {
							$("#imgSeg #quick_training .checkpoint_list").removeClass("active");
							$("#imgSeg #quick_training .checkpoint_list_btn")[0].textContent = "+";					
//		 					$(".quick_training .radioBtn.selected").removeClass("selected");
							if($("#imgSeg .quick_training .radioBtn.selected").length == 0){
								$("#imgSeg .checkpoint_view").removeClass("active");
							}
							let temp_id = $("#imgSeg .quick_training .task_result option:selected").data("id");
							that.computed.getCheckpointList(temp_id, "0");
						});		
						$("#imgSeg #quick_training .checkpoint_list .side_btn_wrap .save_btn").off("click").on("click", function() {
							$("#imgSeg #quick_training .checkpoint_list").removeClass("active");
							$("#imgSeg #quick_training .checkpoint_list_btn")[0].textContent = "+";
						});
						// project 생성 버튼
						$("#imgSeg .quick_training .add_btn").off("click").on("click", function() {
							that.computed.getProjectData();
							$("#imgSeg .add_project").removeClass("active");
							$("#imgSeg .add_project_btn")[0].textContent = "+";					
						});
						// start training 버튼 			
						$("#imgSeg .quick_training_btn").off("click").on("click", function() {
							$("#imgSeg .algorithm_result").removeAttr("disabled");
							that.computed.createJsonQuickTrain();
						});
					
					},
					
					quickInference() {
						const that = imgSegQuick;
						
						// 팝업창 띄우기
						$("#imgSeg #quick_inference_btn").off("click").on("click", function(){
							$("#imgSeg .quick_inference").toggleClass("active");
							$("#imgSeg .quick_inference").draggable({containment: "document"});
							$("#imgSeg .quick_inference .radioBtn.selected").removeClass("selected");					
							$("#imgSeg .inference_config").removeClass("active");
							$("#imgSeg .inference_config_btn")[0].textContent = "+";			
							$("#imgSeg .description_wrap").removeClass("border");						
							$("#imgSeg #inference_config .config_wrap").html("");
							$("#imgSeg #inference_config .description_wrap").html("");
							$("#imgSeg .quick_task_list .table_body tbody").html("");
							that.computed.getTaskList(null, "1");
							that.computed.setAnnoTaskName();
						});				
						// Inference config 입력 영역 띄우기 버튼
						$("#imgSeg .inference_config_btn").off("click").on("click", function() {
							if($("#imgSeg #quick_inference .radioBtn.selected").length == 0){
								alert("Task를 선택해주세요");
								return
							} else {
								$("#imgSeg .inference_config").toggleClass("active");
//			 					$("#imgSeg .description_wrap").html("");
								if($("#imgSeg .inference_config").hasClass("active")){
									$("#imgSeg .inference_config_btn")[0].textContent = "-";
								} else {
									$("#imgSeg .inference_config_btn")[0].textContent = "+";
								}
							}
						});				
						// 팝업창 닫기
						$("#imgSeg #quick_inference .quick_close").off("click").on("click", function() {
							$("#imgSeg .quick_inference").removeClass("active");
							$("#imgSeg .quick_inference input[name='csv_title']").val("");
						});	
						$("#imgSeg #quick_inference .side_btn_wrap .cancel_btn").off("click").on("click", function() {
							$("#imgSeg .inference_config").removeClass("active");
							$("#imgSeg .inference_config_btn")[0].textContent = "+";
							let temp_id = $("#imgSeg .quick_inference .quick_task_list .radioBtn.selected").parent().next().data("id");
							that.computed.getTaskById(temp_id);
						});		
						$("#imgSeg #quick_inference .side_btn_wrap .save_btn").off("click").on("click", function() {
							$("#imgSeg .inference_config").removeClass("active");
							$("#imgSeg .inference_config_btn")[0].textContent = "+";
						});							
						// run inference 버튼 			
						$("#imgSeg .quick_inference_btn").off("click").on("click", function() {
							that.computed.createJsonQuickInference();
						});				
					},		
					
					checkPointListener() {
						const that = imgSegQuick;
						 
						let chk_radio_obj;
						let row_click = $("#imgSeg .checkpoint_list .list_wrap .checkpoint_table tbody tr")
						row_click.off("click").on("click",function() {
							let tr = $(this);
							let btn = tr.children().children(".radioBtn");
							let chkpoint_name = tr.children(".checkPoint_name").val();
							let checkpoint_view = $("#imgSeg .checkpoint_view");
							btn.toggleClass("selected");
							if(btn.hasClass("selected")){
								chk_radio_obj = {};
								$("#imgSeg .checkpoint_list .list_wrap .checkpoint_table tbody tr .radioBtn").removeClass("selected");
								btn.addClass("selected");
								chk_radio_obj[chkpoint_name] = chkpoint_name;
//		 						that.selectCheckpointAlgorithm();
								
								let selected_id = $("#imgSeg .task_result option:selected").data("id");
								that.render.getSelectedTaskById(selected_id);
								
								let selected_cp_name = $("#imgSeg .checkpoint_list .radioBtn.selected").parent().next().text();
								console.log("chkpoint_name: ", selected_cp_name);
								checkpoint_view.addClass("active");
								checkpoint_view.html("Selected Checkpoint :" + selected_cp_name);
								
								$("#imgSeg .algorithm_result").attr("disabled","disabled");		// 체크포인트 선택 시 algorithm select 비활성화 
							} else {
								chk_radio_obj = {};
								$("#imgSeg .algorithm_result").removeAttr("disabled");
								checkpoint_view.removeClass("active");
								checkpoint_view.html("");
								// 초기화시 SOLO 기본값 적용 
								let options = $("#imgSeg .algorithm_result").children("option");
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
						const that = imgSegQuick;
						 
						let chk_radio_obj;
						let row_click = $("#imgSeg .inference_checkpoint .list_wrap .checkpoint_table tbody tr")
						row_click.off("click").on("click",function() {
							let tr = $(this);
							let btn = tr.children().children(".radioBtn");
							let chkpoint_name = tr.children(".checkPoint_name").val();
							let checkpoint_view = $("#imgSeg .checkpoint_view");
							btn.toggleClass("selected");
							if(btn.hasClass("selected")){
								chk_radio_obj = {};
								$("#imgSeg .inference_checkpoint .list_wrap .checkpoint_table tbody tr .radioBtn").removeClass("selected");
								btn.addClass("selected");
								chk_radio_obj[chkpoint_name] = chkpoint_name;
								
//		 						let selected_cp_name = $("#imgSeg .inference_checkpoint .radioBtn.selected").parent().next().text();
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
						const that = imgSegQuick;
						 
						let chk_radio_obj_inf;
						let row_click_inf = $("#imgSeg #quick_inference .list_wrap .table_body .task_table tbody tr")
						row_click_inf.off("click").on("click",function() {
							let tr = $(this);
							let btn = tr.children().children(".radioBtn");
							let task_name = tr.children(".task_name").val();
							let task_id = tr.children(".task_name")[0].attributes["data-id"].value;
							btn.toggleClass("selected");
							if(btn.hasClass("selected")){
								chk_radio_obj_inf = {};
								$("#imgSeg #quick_inference .list_wrap .table_body .task_table tbody tr .radioBtn").removeClass("selected");
								btn.addClass("selected");
								chk_radio_obj_inf[task_name] = task_name;
							} else {
								chk_radio_obj_inf = {};
								$("#imgSeg .inference_checkpoint .list_wrap .checkpoint_table tbody").html("");
								$("#imgSeg .inference_config").removeClass("active");
								$("#imgSeg .inference_config_btn")[0].textContent = "+";
							}
							$("#imgSeg .inference_checkpoint .list_wrap .checkpoint_table tbody").html("");
							that.computed.getTaskById(task_id);
							$("#imgSeg #inference_config .description_wrap").addClass("border");	
						});	
						
						let chk_radio_obj_train;
						let row_click_train = $("#imgSeg #quick_training .list_wrap .table_body .task_table tbody tr")
						row_click_train.off("click").on("click",function() {
							let tr = $(this);
							let btn = tr.children().children(".radioBtn");
							let task_name = tr.children(".task_name").val();
							let task_id = tr.children(".task_name")[0].attributes["data-id"].value;
							btn.toggleClass("selected");
							if(btn.hasClass("selected")){
								chk_radio_obj_train = {};
								$("#imgSeg #quick_training .list_wrap .table_body .task_table tbody tr .radioBtn").removeClass("selected");
								btn.addClass("selected");
								chk_radio_obj_train[task_name] = task_name;
							} else {
								chk_radio_obj_train = {};
							}
							that.computed.getTaskById(task_id);
							$("#imgSeg #training_config .description_wrap").addClass("border");	
						});					
					},				
					
					selectCheckpointAlgorithm(algorithm_id){
						const that = imgSegQuick;
						
						console.log("algorithm_id???? ", algorithm_id);
						let options = $("#imgSeg .algorithm_result").children("option");
						for(var i=1; i < options.length; i++){
						    if(options[i].attributes["data-id"].value == algorithm_id){
						    	options[i].selected = true;
						    }
						}
					},				
					
				},
				computed : {
					
					setAnnoTaskName() {
						const that = imgSegQuick;
						$("#loader").show();
						const deffered = $.ajax({
							url : baseUrl + "task/setAnnoTaskName.json",
							data : {dataset_id : imgSeg.data.canvasObj.datasetId},
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
						const that = imgSegQuick;
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
						const that = imgSegQuick;
						$("#loader").show();
						const deffered = $.ajax({
							url : baseUrl + "task/getQuickInferenceTaskList.json",
							data : {project_id : null, dataset_id : imgSeg.data.canvasObj.datasetId},
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
						const that = imgSegQuick;
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
						const that = imgSegQuick;
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
						const that = imgSegQuick;
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
						const that = imgSegQuick;
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
						const that = imgSegQuick;
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
						const that = imgSegQuick;
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
						const that = imgSegQuick;
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
						const that = imgSegQuick;
						
						let title = $("#imgSeg .add_project input[name='title']").val();
						let contents = $("#imgSeg .add_project textarea[name='contents']").val();

						if(title == ""){
						 	alert("제목을 입력해주세요");
						 	$("#imgSeg input[name='title']").focus();
						 	return;
						}
						
						if(contents == ""){
						 	alert("내용을 입력해주세요");
						 	$("#imgSeg textarea[name='contents']").focus();
						 	return;
						} 
						

						$("#loader").show();
						console.log("title, contents : ", title, contents);
						that.computed.insertProject(title, contents);				
					},			
					
					insertProject(t, c){
						const that = imgSegQuick;
						
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
									$("#imgSeg .quick_training .add_project").removeClass("active");
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
						const that = imgSegQuick;
						let annotation_title = $("#imgSeg input[name='annotation_name']");
						let task_title = $("#imgSeg input[name='task_name']");
						let task_contents = $("#imgSeg input[name='task_contents']");
						let training_arr = {};
						let project_id = $("#imgSeg select[name='project_result'] option:selected").attr("data-id");
		 				let algorithm_id = $("#imgSeg select[name='algorithm_result'] option:selected").attr("data-id");
		 				let base_task_id = $("#imgSeg select[name='task_result'] option:selected").attr("data-id");
		 				let selected_checkpoint_name = null;
		 				// config변수
		 				let train_string = $("#imgSeg .training_config .config_wrap").children(".light").children("input[type='text']");
		 				let train_number = $("#imgSeg .training_config .config_wrap").children(".light").children("input[type='number']");
		 				let train_chk = $("#imgSeg .training_config .config_wrap").children(".check").children(".check_box_wrap").children(".check_box").children(".first");
		 				console.log("train_chk::", train_chk);
		 				console.log("train_string::", train_string);
		 				console.log("train_number::", train_number);
		 	 			let train_arr = {};
		 	 			
		 				/* let selected_checkpoint_name = $("#imgSeg .radioBtn.selected").parent().parent("tr").children(".checkPoint_name"); */
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
		 					selected_checkpoint_name = $("#imgSeg .checkpoint_list .radioBtn.selected").parent().parent("tr").children(".checkPoint_name").text();
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
						training_arr["dataset_id"] = imgSeg.data.canvasObj.datasetId;
		 				training_arr["project_id"] = project_id;
		 				training_arr["algorithm_id"] = algorithm_id;
		 				training_arr["config"] = result_string;
		 				training_arr["base_task_id"] = base_task_id;
		 				training_arr["selected_checkpoint_name"] = selected_checkpoint_name;
						
						var quick_training_data = JSON.stringify(training_arr);
						console.log("quick_training_data : ", quick_training_data);
//		 				$("#imgSeg #quick_training").removeClass("active");		// training confirm 에서 확인 시 200일 때 닫기 
//		 				annotation_title.val("");										// training confirm 에서 확인 시 200일 때 초기화 
//		 				task_title.val("");												// training confirm 에서 확인 시 200일 때 초기화
						that.computed.ajaxQuickTrain(training_arr, quick_training_data);
					},
					
					createJsonQuickInference(){
						const that = imgSegQuick;
						
						let select_task_btn = $("#imgSeg #quick_inference .radioBtn");
						let selected_task = $("#imgSeg #quick_inference .radioBtn.selected").parent().parent("tr").children(".task_name");
						let csv_title = $("#imgSeg input[name='csv_title']").val();
						let check_box = $("#imgSeg #quick_inference .checkBox");
					    let inf_string = $("#imgSeg #quick_inference .config_wrap").children(".light").children("input[type='text']");
					    let inf_number = $("#imgSeg #quick_inference .config_wrap").children(".light").children("input[type='number']");
					    let inf_chk = $("#imgSeg #quick_inference .config_wrap").children(".check").children(".check_box_wrap").children(".check_box").children(".first");
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
						
						selected_checkpoint_name = $("#imgSeg .inference_checkpoint .radioBtn.selected").parent().next().text();
						if(selected_checkpoint_name == null || selected_checkpoint_name == "" || selected_checkpoint_name == undefined) {
							alert("CheckPoint를 선택해주세요.");
							return ;
						}
						
						inference_arr["selected_task_id"] = selected_task_id;
						inference_arr["dataset_id"] = imgSeg.data.canvasObj.datasetId;
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
						const that = imgSegQuick;
						//let ajaxData = data;
						let annotation_title = $("#imgSeg input[name='annotation_name']");
						let task_title = $("#imgSeg input[name='task_name']");
						let ajaxData = {
		 						annotation_title : arr.annotation_title,
		 						task_title : arr.task_title,
		 						contents : arr.task_contents,
		 						dataset_id : imgSeg.data.canvasObj.datasetId * 1,
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
										$("#imgSeg #quick_training").removeClass("active");
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
						const that = imgSegQuick;
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
										$("#imgSeg #quick_inference").removeClass("active");
										// 세션에 task_id, project_id 저장 후 inference list 확인을 위해 trainer 페이지로 이동 
										if(window.sessionStorage){
											sessionStorage.setItem("selected_task_id", arr.selected_task_id);
											sessionStorage.setItem("selected_pId", quick_project_id);
											let position = sessionStorage.getItem("selected_task_id");
											let position2 = sessionStorage.getItem("selected_pId");
											console.log("position: ", position, position2);
										}
										imgSeg.init(imgSeg.data.canvasObj["datasetId"]);
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
						const that = imgSegQuick;
						elem.append("<div class='empty_wrap'><div class='no_image'></div><div class='eng_text'>"+data1+"</div><div class='kor_text'>"+data2+"</div></div>")
					},
					
					removeEmptyData(elem){
						const that = imgSegQuick;
						elem.find(".empty_wrap").remove();
					},
					
					drawDefaultQuickInfo(datasetData){
						const that = imgSegQuick;
						
						let dataset_data = datasetData;
						let annotation_title_input = $("#imgSeg input[name='annotation_name']");
						let task_title_input = $("#imgSeg input[name='task_name']");
						let task_contents_input = $("#imgSeg input[name='task_contents']");
					
						console.log("dataset_data : ", dataset_data);
						console.log("taskName3 : " + that.data.taskName);
						console.log("annoName3 : " + that.data.annotationName);
						for(let i = 0; i < dataset_data.length; i++){
							if(dataset_data[i].dataset_id === imgSeg.data.canvasObj.datasetId){
								$(annotation_title_input).val(that.data.annotationName);			// jh.sa default name  
								$(task_title_input).val(that.data.taskName); 
								$(task_contents_input).val("Quick training model");
							} else {
								continue;
							}
						};
					},					
					
					drawDefaultCsvInfo(datasetData){
						const that = imgSegQuick;
					
						let dataset_data = datasetData;
						let csv_title = $("#imgSeg input[name='csv_title']");
					
						console.log("dataset_data : ", dataset_data);
						for(let i = 0; i < dataset_data.length; i++){
							if(dataset_data[i].dataset_id === imgSeg.data.canvasObj.datasetId){
								csv_title.val(that.data.inferenceName);			// jh.sa default name  
							} else {
								continue;
							}
						};				
					},					
					
					drawAlgorithmList(data){
						const that = imgSegQuick;
						
						console.log("algorithmListData : ", data);
						let selectTarget = $("#imgSeg .quick_training .algorithm_result");
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
						const that = imgSegQuick;
						
						console.log("projectListData : ", data);
						let selectTarget = $("#imgSeg .quick_training .project_result");
						$(selectTarget).html("");
						
						let html = "<option value=''>Please select the project</option>"; 
						for(let i=0, len = data.length; i<len; i++){
							html += "<option data-id='"+data[i]["id"]+"' value='"+data[i]["title"]+"'>";
							html += data[i]["title"];
							html += "</option>";
				
						}
						$(selectTarget).append(html);
						
						// 기본값으로 첫번째 프로젝트 지정 
						let options = $("#imgSeg .project_result").children("option");
						options[1].selected = true;
						
					},
					
					// inheritance 대상이 될 task list를 select box으로 보여줌 
					drawInheritTaskList(task_list_data, project_data){
						const that = imgSegQuick;
						console.log("inheritTaskListData : ", task_list_data);
						console.log("inheritProjectData : ", project_data);
						let selectTarget = $("#imgSeg .quick_training .task_result");
						$(selectTarget).html("");
						
						let html = "<option value=''>Please select the task</option>"; 
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
						const that = imgSegQuick;
						
						if(data != null && data.length > 0){
							let checkPoints = data.reverse();
							let target = $("#imgSeg #quick_training .checkpoint_table tbody");
							
							let html = "";
							$(target).html("");
							$("#imgSeg .empty_wrap").remove();
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
							that.render.removeEmptyData($("#imgSeg #quick_training .checkpoint_list .list_wrap"));
							
							//jh.sa
							let checkpoint_view = $("#imgSeg .checkpoint_view");
							let selected_cp_name = $("#imgSeg .checkpoint_list .radioBtn.selected").parent().next().text();
							console.log("chkpoint_name: ", selected_cp_name);
							checkpoint_view.addClass("active");
							checkpoint_view.html("Selected Model :" + selected_cp_name);
							let selected_id = $("#imgSeg .task_result option:selected").data("id");
							that.computed.getSelectedTaskById(selected_id);
							$("#imgSeg .algorithm_result").attr("disabled","disabled");
							
							that.computed.checkPointListener();					
						} else if(data != null && data.length == 0) {
//		 					that.root.bind.removeEmptyData($("#imgSeg #quick_training .checkpoint_list .list_wrap"));					
							if($("#imgSeg #quick_training .checkpoint_list .empty_wrap").length == 0){
								that.render.addEmptyData($("#imgSeg #quick_training .checkpoint_list .list_wrap"), "No Model", "please train your task first");
							}
						} else {
//		 					that.root.bind.removeEmptyData($("#imgSeg #quick_training .checkpoint_list .list_wrap"));					
							if($("#imgSeg #quick_training .checkpoint_list .empty_wrap").length == 0){
								that.render.addEmptyData($("#imgSeg #quick_training .checkpoint_list .list_wrap"), "No Model", "please train your task first");				
							}
						}

					},
					
					// quick inference checkpoint
					drawInferenceCheckpointList(data){
						const that = imgSegQuick;
						
						if(data != null && data.length > 0){
							let checkPoints = data.reverse();
							let target = $("#imgSeg #quick_inference .inference_checkpoint .checkpoint_table tbody");
							
							let html = "";
							
							$(target).html("");
							$("#imgSeg .empty_wrap").remove();
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
							that.render.removeEmptyData($("#imgSeg #quick_inference .inference_checkpoint .list_wrap"));
							that.bind.inferenceCheckPointListener();					
						} else if(data != null && data.length == 0) {
//		 					that.root.bind.removeEmptyData($("#imgSeg #quick_inference .inference_checkpoint .list_wrap"));					
							if($("#imgSeg #quick_inference .inference_checkpoint .empty_wrap").length == 0){
								that.render.addEmptyData($("#imgSeg #quick_inference .inference_checkpoint .list_wrap"), "No Model", "please train your task first");
							}
						} else {
//		 					that.root.bind.removeEmptyData($("#imgSeg #quick_inference .inference_checkpoint .list_wrap"));					
							if($("#imgSeg #quick_inference .inference_checkpoint .empty_wrap").length == 0){
								that.render.addEmptyData($("#imgSeg #quick_inference .inference_checkpoint .list_wrap"), "No Model", "please train your task first");
							}
						}
					},			
					
					// quick inference 팝업의 task list 그리기 
					drawTaskList(task_list_data, project_data){
						const that = imgSegQuick;
						

						console.log("taskDataa:: " , task_list_data);
						console.log("project_data :: ", project_data);
						let target = $("#imgSeg .quick_task_list .list_wrap .table_body .task_table tbody");
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
						const that = imgSegQuick;
						
						let configData;
						let description;
						let target = $("#imgSeg #training_config .config_wrap");
						let description_target = $("#imgSeg #training_config .description_wrap");
						$("#imgSeg #training_config .description_wrap").addClass("border");	
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
							let tooltip_wrap = $("#imgSeg #training_config .tooltip_wrap");
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
							let check_first = $("#imgSeg #training_config .checkBox");

							check_first.off("click").on("click", function() {
								$(this).toggleClass("selected");
							});					
						}
						
					},
					
					// quick inference 에서 task 선택 시 config 셋팅 
					setInferenceConfig(data, taskId){
						const that = imgSegQuick;
						
						let task_id = taskId;
						let configData;
						let description;
						let algorithm_name;
						let target = $("#imgSeg #inference_config .config_wrap");
						let description_target = $("#imgSeg #inference_config .description_wrap");
						let algorithm_target = $("#imgSeg .inference_algorithm");
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
							let tooltip_wrap = $("#imgSeg #inference_config .tooltip_wrap");
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
							let check_first = $("#imgSeg #inference_config .checkBox");

							check_first.off("click").on("click", function() {
								$(this).toggleClass("selected");
							});					
						}
							
						
						if($("#imgSeg #quick_inference .radioBtn.selected").length == 0){
							$(target).html("");
							$(description_target).html("Please select task data");
						};
						

						
					},			
					
					// quick training의 algorithm select box 
					selectAlgorithm(data){
						const that = imgSegQuick;
						
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
						
						$("#imgSeg #quick_training .algorithm_result").on("change", function(){
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
						const that = imgSegQuick;
						
						$("#imgSeg #quick_training .task_result").on("change", function(){
							let selected_task = $(this).val();
							if(selected_task != ""){
								$("#imgSeg .empty_wrap").remove();
//		 						that.root.bind.removeEmptyData($("#imgSeg .checkpoint_list .list_wrap"));
								$("#imgSeg .checkpoint_list .list_wrap .checkpoint_table tbody").html("");
								if($("#imgSeg .quick_training .radioBtn.selected").length == 0){
									$("#imgSeg .checkpoint_view").removeClass("active");
									$("#imgSeg .algorithm_result").removeAttr("disabled");
								} else if ($("#imgSeg .quick_training .radioBtn.selected").length > 0){
									$("#imgSeg .quick_training .radioBtn.selected").removeClass("selected");			//추가 
								}

								for(let i=0; i < data.length; i++){
									if(selected_task == data[i]["title"]){
										that.computed.getCheckpointList(data[i]["task_id"], "0");
										that.render.drawTaskName(data[i]["title"]);
										break;
									};
								};						
							} else if(selected_task == "") {
								$("#imgSeg .checkpoint_view").removeClass("active");
								$("#imgSeg .algorithm_result").removeAttr("disabled");
								that.render.removeEmptyData($("#imgSeg .checkpoint_list .list_wrap"));
								that.render.addEmptyData($("#imgSeg .checkpoint_list .list_wrap"), "No Model", "please train your task first");				
								// 						that.root.bind.removeEmptyData($("#imgSeg .checkpoint_list .list_wrap"));
								$("#imgSeg .checkpoint_list .list_wrap .checkpoint_table tbody").html("");
								$("#imgSeg .checkpoint_list .selected_task_name").html("");
								$("#imgSeg #quick_training .checkpoint_list").removeClass("active");
								$("#imgSeg #quick_training .checkpoint_list_btn")[0].textContent = "+";					
								$("#imgSeg .quick_training .radioBtn.selected").removeClass("selected");
							}

						});
					},
					
					// quick training 의 inheritance task 선택 시 checkpoint list 상단에 선택한 task 이름 표시 
					drawTaskName(data){
						const that = imgSegQuick;
						
						let taskName_data = data;
						let target_title = $("#imgSeg .checkpoint_list .selected_task_name");
						let select_task_name = "( Selected Task : " + taskName_data + " )";
						$(target_title).html(select_task_name);
						console.log("taskName_data : ", taskName_data);

					},				
				},
			};		
		
	  </script>		
   </body>
</html>