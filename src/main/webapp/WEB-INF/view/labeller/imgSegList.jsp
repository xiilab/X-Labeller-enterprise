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
	   #imgSegList .canvas-container {
			margin: 0px auto;
/* 			height: 100% !important; */
	   }  	   
	   #imgSegList a.next_page,a.prev_page { cursor:pointer; }
	   #imgSegList .pagination input.page-link { height:30px; width:30px; padding:0 0 0 8px; }
       #imgSegList .tab_wrap { width:180px; }
       #imgSegList a.disabled { color:#e74a3b !important; pointer-events: none; } 
	   #imgSegList .labeller_container { 
/* 	    	overflow:scroll;  */
			overflow: hidden; 
	    	display:flex; 
	    	flex-wrap:nowrap;  
	    	margin-top: 20px; 
	    	border-left: 0; border-right: 0; 
	    	min-height: 840px; max-height: 840px;
	    }
      	
      	#imgSegList .tab-pane{
      		position:relative;  
/*       		width:1024px;  */
/* 			width: 1219px;  */
			width: 100%;
			min-height: 600px; 
/*       		height:auto;  */
/* 			height: calc(100% - 198px); */
      		flex-shrink:0;
      		border: 1px solid #eee;
      		border-bottom: 0;
/*       		border-radius: 0.35rem; */
      	}
      	
      	#imgSegList .header_wrap { margin-bottom: 42px; }
      	
      	#imgSegList .tab-pane.cate_search_wrap {
/*       		border:1px solid #eeeeee; */
/*       		border-radius : 10px; */
      	}
/*       	.cate_search_wrap { border:1px solid #eeeeee; } */
/*       	.cate_search_wrap .content_wp .content_header .content_title { cursor:pointer; } */
/*       	.cate_search_wrap .search_cate { width:50%; } */
      	
/*       	.cate_search_wrap .search_wp .search_wrap .search_cate_list { cursor:pointer; } */
/*       	.cate_search_wrap .search_wp .search_wrap .search_cate_list:hover { color:red; } */
/*       	.cate_search_wrap .search_wp .search_wrap { position:absolute; width:50%; max-height:500px; overflow:scroll; background-color:#f8f9fc; z-index:100;  } */
      	
      	#imgSegList .search_all_wp .search_all_wrap { position:absolute; /* width:50%; */ max-height:500px; overflow:scroll; background-color:#f8f9fc; z-index:100;  }
      	#imgSegList .search_all_wp .search_all_wrap .search_cate_list { cursor:pointer; }
      	#imgSegList .search_all_wp .search_all_wrap .search_cate_list:hover { color:red; }
      	
/*       	.cate_search_wrap .content_wp { overflow:scroll; } */
/*       	.cate_search_wrap .content_wp.active { height:auto; } */
/*       	.cate_search_wrap .content_wp .content .cate_2,.cate_3 { cursor:pointer; } */
/*       	.cate_search_wrap .content_wp .content .cate_2.active,.cate_3.active { font-weight:bold; } */
/*       	.cate_search_wrap .content_wp .content .cate_2:hover,.cate_3:hover { color:red; } */

/* 		.cate_search_wrap .content_wp .content .cate_2.active,.cate_3.active { font-weight:bold; background-color:#eeeeee !important; color:black !important; } */
/* 		.cate_search_wrap .content_wp .content .cate_2:hover,.cate_3:hover { color:red !important; } */
/* 		.cate_search_wrap .content_wp .content .cate_wrap_3 { background-color:#eeeeee; } */
      	
      	#imgSegList .label_wrap { 
       		position:relative;  
      		width:100%; 
      		height:auto; 
/*       		border: 1px solid #eeeeee;  */
/*       		margin-left:20px;  */
/*       		border-radius:0.35rem;  */
      		flex-shrink:0;
      	}
      	
       	#imgSegList .video_wrap .canvas { width:800px; height:400px; position:absolute !important; }  
/*        	.video_wrap .video { width:1024px;  height:auto; position:absolute !important; }   */
       	
/*       	.video_wrap .video .video_js { position:absolute; } */
/*       	.video_wrap .video .vjs-control-bar { display: flex; height:40px; bottom:-40px;} */
/*       	.video_wrap .video .vjs-big-play-button { display:none; } */
      	#imgSegList .video_wrap .prog_bar { border:1px solid #eeeeee; width:100%; height:40px; position:relative; }
      	#imgSegList .video_wrap .prog_bar > div { color:#020b44; }
		#imgSegList .video_wrap .prog_bar .btn_wrap { width:400px; margin-top:0; }
/*       	.video_wrap .prog_bar .btn { color:#020b44; border-radius:50%; } */
      	#imgSegList .video_wrap .prog_bar input.curr_frame { width:50px; height:15px; margin-right:0px; }
      	#imgSegList .video_wrap .prog_bar .save_btn_wrap { width:260px; }
      	
      	#imgSegList .label_wrap .btn_wrap { margin:0; padding-bottom: 1px; border-bottom: 1px solid #eee;}
/*       	.label_wrap .btn_wrap > div { width:100%; margin:0;  cursor:pointer; } */
      	@media (min-height:960px){
/*       		#imgSegList .label_wrap .category_wrap { max-height: 880px; }  */
			#imgSegList .label_wrap .category_wrap { max-height: 775px; } 
      	}
      	@media (min-height: 730px) and (max-height:959px){
/*       		#imgSegList .label_wrap .category_wrap { max-height: 665px; }  */
			#imgSegList .label_wrap .category_wrap { max-height: 560px; } 
      	}      	
      	@media (min-height: 500px) and (max-height:729px){
/*       		#imgSegList .label_wrap .category_wrap { max-height: 500px; }  */
			#imgSegList .label_wrap .category_wrap { max-height: 395px; } 
      	} 
      	@media (min-height: 1px) and (max-height:499px){
/*       		#imgSegList .label_wrap .category_wrap { max-height: 400px; }  */
			#imgSegList .label_wrap .category_wrap { max-height: 295px; } 
      	}  	      	
      	#imgSegList .label_wrap .category_wrap { width:100%; height:auto; overflow-y: scroll; overflow-x: hidden; flex-wrap: wrap; padding: 0 18px; }
      	#imgSegList .label_wrap .category_wrap .cate_wp { width:190px; /* height:90px; */height:200px; padding: 5px; margin: 5px 10px; border:1px solid #eeeeee; text-align: center; }
      	#imgSegList .label_wrap .category_wrap .cate_wp .crop_wrap{ width:180px; height:105px; align-items:center; display:flex; justify-content:center; padding: 0.25rem; padding-top: 0.9rem; }
      	#imgSegList .label_wrap .category_wrap .cate_wp .crop_img {position:relative; margin-top: 15px;  /* width:180px; height:105px; */ }
      	#imgSegList .label_wrap .category_wrap .cate_wp.selected { border-width:2px !important; }
/*       	.label_wrap .category_wrap .cate_wp .delete { margin-left:10px; } */
      	#imgSegList .label_wrap .category_wrap .cate_wp .color {     
      		width: 20px;
		    height: 20px;
		    margin-left: 2px;
	    }
	    
      	#imgSegList .label_wrap .category_wrap .cate { /*width:5em;*/ /* width:60px; */ border:1px solid #eeeeee; text-align:center; text-align-last:center; }
/*       	.label_wrap .category_wrap .cate option { text-align:center; text-align-last:center; } */
      	
      	#imgSegList .page_title_wrap { position: relative; top: 20px; left: 90px; display: inline; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; }
      	#imgSegList .page_title_wrap span:first-child { font-size: 13px; }
		#imgSegList .page_title_wrap span:nth-child(2) { color: #4c84ff; font-size: 14px;}
		#imgSegList .add { width: 90px; margin-right: 10px; position: relative; color: #fff; font-size: 11px; background-color: #4c84ff; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; }
		#imgSegList .add:hover { background-color: #3A71E9; }
		#imgSegList .delete { width: 55px; color: #343434; font-size: 11px; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; margin-left: 10px;  }
      	#imgSegList .label_title { color: #777; font-weight: 400; padding: 20px; }
      	#imgSegList .cate_wp input { width: 165px; padding: 10px; margin-top: 3px; }
/*       	#imgSegList .save_btn_wrap { justify-content: center; position: absolute; bottom: 0; padding: 18px 0; background-color: #fff; } */
      	#imgSegList .save_btn_wrap { justify-content: center; bottom: 0; padding: 30px 0; background-color: #fff; }

      	#imgSegList .save_btn_wrap .save { width: 240px; line-height: 36px; margin: 0 auto; border-radius: 23px; box-shadow: 0 4px 8px 0 #b4d7ff; font-size: 13px; font-weight: 300; color: #fff; cursor: pointer; background-color: #4c84ff;}
		#imgSegList .save_btn_wrap .save:hover { background-color: #3A71E9; }
/* 		#imgSegList .img_list_wrap { width: calc(100% - 699px); position: absolute; bottom: 92px; border: 1px solid #e0e0e0; border-left: 0; border-right: 0; padding: 15px 0; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; background-color: #f8f8f8; }       */
		#imgSegList .img_list_wrap { width: 100%; min-height: 30px; position: relative; border: 1px solid #e0e0e0; border-left: 0; border-right: 0; padding: 15px 0; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; background-color: #f8f8f8; }      
      	#imgSegList .data_list_wrap { height: 637px !important; max-height: 637px !important; position: absolute; top: calc(100% - 740px); }
		
		#imgSegList .position_wrap { width: 100px; margin-right: 20px; }
		#imgSegList .position_wrap .position-value { width: 40px; padding: 5px; }
		#imgSegList .position_wrap .total_count { display: inline-block; }
		
		#imgSegList .video_wrap .prev_btn {
			position: absolute;
			background: url(images/btn_image_arrow_left_normal.png) left;
			width: 16px;
			height: 25px;
 			top: calc(50% - 25px); 
/* 			top: 300px; */
			left: 5px
		}
		
		#imgSegList .video_wrap .next_btn {
			position: absolute;
			background: url(images/btn_image_arrow_right_normal.png) right;
			width: 16px;
			height: 25px;
 			top: calc(50% - 25px); 
/* 			top: 300px; */
			right: 5px
		}      	
		
		#imgSegList .video_wrap .prev_btn:hover {
			background: url(images/btn_image_arrow_left_hover.png) left;
			cursor: pointer;
		}
		
		#imgSegList .video_wrap .next_btn:hover {
			background: url(images/btn_image_arrow_right_hover.png) right;
			cursor: pointer;
		}		
		
		#imgSegList .name_wrap { width: 600px; text-align: center; margin: 0 auto; }
		#imgSegList .name_wrap .file_name { width: 600px; text-overflow: ellipsis; overflow: hidden; }
		#imgSegList .name_wrap .prev_btn {
			background: url(images/btn_image_arrow_left_normal.png) left;
			width: 16px;
			height: 25px;
/* 			top: calc(50% - 25px); */
			top: 300px;
			left: 5px
		}
		
		#imgSegList .name_wrap .next_btn {
			background: url(images/btn_image_arrow_right_normal.png) right;
			width: 16px;
			height: 25px;
/* 			top: calc(50% - 25px); */
			top: 300px;
			right: 5px
		}    	
		
		#imgSegList .name_wrap .prev_btn:hover {
			background: url(images/btn_image_arrow_left_hover.png) left;
			cursor: pointer;
		}
		
		#imgSegList .name_wrap .next_btn:hover {
			background: url(images/btn_image_arrow_right_hover.png) right;
			cursor: pointer;
		}		
		
      	#imgSegList .list_btn_wrap { width: 100px; margin-left: 20px; }
      	#imgSegList .list_btn_wrap .data_list_btn { width: 30px; height: 30px; margin-right: 30px; background: url(images/icon_filter_normal.png) right; cursor: pointer; }
 		
 		#imgSegList .quick_wrap { width: 100%; position: absolute; bottom: 0px; padding: 25px 0; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }       
/*  		#imgSegList .quick_wrap { width: calc(100% - 699px); position: absolute; bottom: 0px; padding: 25px 0; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }        */
/* 		#imgSegList .quick_wrap { width: 488px; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; position: absolute; top: -8px; left: 609px;}     */
      
		#imgSegList .quick_btn {
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
		
		#imgSegList .quick_btn:hover {
			background-color: #3A71E9;
		}      
		
		/* panel label */
		#imgSegList .btn_wrap .visible { width: 18px; height: 18px; position: relative; left: -395px; }
		#imgSegList .btn_wrap .visible.on { background: url('images/btn_layer_view.png') no-repeat center; }
		#imgSegList .btn_wrap .visible.off { background: url('images/btn_checkbox_normal.png') no-repeat center; }		
		
		#imgSegList section.enrichment {
			width: calc(100% - 486px);
			height: 100%;
			position: relative;
/* 			border: 1px solid #e5e5e5; */
		}      
		
		#imgSegList section.label {
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
		
		#imgSegList section.enrichment .empty_wrap { margin: 255px auto; text-align: center; margin-top: 300px; color: #777777; }
		#imgSegList section.enrichment .empty_wrap .no_image { margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; height: 37px; background-image: url(./images/icon_nodata_list.png); }
		#imgSegList section.enrichment .empty_wrap .eng_text { margin-bottom: 3px; font-size: 16px; }
		#imgSegList section.enrichment .empty_wrap .kor_text { font-size: 12px; }		
		#imgSegList section.label .paging_wrap { justify-content: center; position: absolute; bottom: 0; padding: 26px 0; background-color: #fff; border-top: 1px solid #eee; }
    
		#imgSegList section.tag { width: 486px; height: 100%; position: relative; background-color: #fff; border: 1px solid #e5e5e5; border-bottom: 0; -ms-user-select: none; -moz-user-select: none; -webkit-user-select: none; -khtml-user-select: none; user-select: none; }
		#imgSegList section.tag .tag_margin { margin: 0 auto; padding: 10px; }
 		#imgSegList section.tag .tag_total { color: #777; font-weight: 400; padding: 20px; }
 		#imgSegList section.tag .tag_wrap { width: 100%; height: 90px; margin-top: 1px; border-top: 1px solid #e5e5e5; font-size: 11px; justify-content: center; } 
		#imgSegList section.tag .tag_wrap .content { width: 100%; height: auto; max-height: 75px; overflow-y: scroll; overflow-x: hidden; flex-wrap: wrap; -ms-overflow-style: none; }
		#imgSegList section.tag .tag_wrap .content::-webkit-scrollbar { display: none; }		
		#imgSegList section.tag .tag_wrap .tag { width: 81px; margin: 10px 5px; line-height: 32px; background: #f4f7fc; border: 1px solid #d9d9d9; border-radius: 4px; text-align: center; font-size: 14px; font-weight: 300; color: #555; cursor: pointer; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; }
		#imgSegList section.tag .tag_wrap .tag.selected { background-color: #4c84ff; border-color: #2b65e6; color: #fff; box-shadow: 0 3px 4px 0 rgba(159, 189, 255, 0.7); }
		#imgSegList .hover_box {border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
		#imgSegList .hover_box div {font-family: Open_Sans; font-size: 13px; color: #555555;}
		#imgSegList .hover_div div {word-break: break-word; margin: 2px 5px; white-space: normal; font-weight: 300; font-family: Open_Sans;}    
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
               <div id="imgSegList" class="container-fluid">
                  <!-- Page Heading -->
                  


                  <div class="card shadow mb-4 flex fs">
                  
                  	<section class="enrichment">
	                  	<div class="header_wrap flex sb">
		                  	<div class="page_title_wrap">
		                  		<span>Label List</span> <span>|</span> Image Segmentation
	                  		</div>
	                  	</div>      
                  		<div class="video_wrap flex tab-pane active" id="imgSegList-labeller" role="tabpanel" >
<!--                    			<div class="prev_btn prev_data"></div> -->
<!-- 							<div class="next_btn next_data"></div> -->
							
                   			<canvas class="canvas" id="imgSegList-canvas"></canvas>
                   			<!-- prog_bar start -->
                   			<div class="prog_bar flex justify-content-between hide">
                   				<div class="name_wrap ml-2">
                   					<div class="video_name font-weight-bold"></div>
                   				</div>
<!--                    				<div class="save_btn_wrap flex justify-content-end"> -->
<!--                    					<button type="button" class="btn btn-primary  save">저장</button> -->
<!--                    				</div> -->
                   				
                   			</div><!-- prog_bar end -->
						</div>	
                 		<div class="img_list_wrap flex sb"> <!-- Image Slide area start -->
<!--                  			<div>Image Slide Section</div> -->
<!-- 							<div class="list_btn_wrap"> -->
<!-- 								<div class="data_list_btn"></div> -->
<!-- 							</div> -->

							<div class="name_wrap flex sb">
<!--                    				<div class="prev_btn prev_data"></div> -->
								<div class="file_name"></div>
<!-- 								<div class="next_btn next_data"></div>	 -->
							</div>							

<!-- 							<div class="position_wrap"> -->
<!-- 	                 			<input type="text" class="position-value" value="1" onKeyPress="return checkNum2(event);" /> -->
<!-- 	                 			<div class="total_count"> / <span></span></div>							 -->
<!-- 							</div> -->
<!-- 	                 		<div class="data_list_wrap">		Data List Popup area start -->
<!-- 	                 			<div class="data_total">Total <span>0</span></div> -->
<!-- 								<div class="list_table"> -->
<!-- 									<div class="h_wrap flex"> -->
 	<!-- 									<div class="checkBox all" ></div> -->
<!-- 										<div class="preview">PREVIEW</div> -->
<!-- 										<div class="id">ID</div> -->
<!-- 										<div class="path">PATH</div> -->
<!-- 										<div class="label_cnt">LABELS</div> -->
<!-- 									</div> -->
<!-- 									<ul class="c_wrap"> -->
<!-- 									</ul> -->
<!-- 									<div class="f_wrap flex"> -->
<!-- 										<div id="pagination" class="tui-pagination"></div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 	                 		</div>            		Data List Popup area end    							 -->
                 		</div>              <!-- Image Slide area end -->   
		                <div class="save_btn_wrap flex">
                 			<button type="button" class="btn btn-primary save filter_color" >Save</button>
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
										<div class="label_title" data-cnt="0">Label (<span></span>)</div>
	<!--                					<div class="visible on"></div> -->
	<!-- 								<button type="button" class="btn btn-primary add">+ Add Label</button> -->
	                   			</div>
	                   			<div class="category_wrap flex fs"></div>
	                   		</div><!-- label area end -->   
	                		<div class="paging_wrap flex filter_color">
	                			<div id="pagination" class="tui-pagination"></div>
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
			var that = imgSegList;

			// canvas init
			that.data.canvas = new fabric.Canvas('imgSegList-canvas',{
				selection : false,
				width : 800,
				height : 600,
				uniScaleTransform : true,
			});
			
			that.bind.evtOnceInit();
// 			imgSeg.init();
		    
		});
		
		const imgSegList = {
				pt: $("#imgSegList"),
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
						isModified : 0,
					},
					
					scaleFactor : {origWidth:0, origHeight:0, ratio:1},
					
					meta : {},
					
// 					modifiedObj : {},					
					
					colorHash : null,
					// initial canvas and canvas var end
					
					tag : [],
					
				}, // data end
			
				//init start
				datasetInit : function(dataset_id){
					const that = imgSegList;
					
					that.data.canvasObj['datasetId'] = null;
					that.data.canvasObj['datasetId'] = dataset_id;
					that.init(dataset_id);
				},					
				
				init : function(dataset_id,index) {
					const that = imgSegList;
// 					that.bind.evtOnceInit();
					that.computed.clearAllData();
					that.data.colorHash = new ColorHash();
					that.data.canvasObj['currDataNum'] = 1;
					
					var page_num;
					if(index == undefined || index == null){
						page_num = 0;
					} else {
						page_num = index;
					}
					
					that.bind.resetView();
					that.computed.getLabelDataByDatasetId(page_num, that.data.canvasObj['datasetId']);
					that.computed.getLabelGroup(that.data.canvasObj['datasetId']);
// 					that.computed.getVideoDataList(page_num, that.data.canvasObj['datasetId']);
					that.bind.sideEvtCollision();
// 					labeller.bind.evtAll();
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
					},
					collision : function(player,canvas) {
						const that = imgSegList;
						
						
					}, //collision end
					
					downEvt : function() { // canvas poly mouse down event
						const that = imgSegList;
						var canvas = that.data.canvas;
						var canvasObj = that.data.canvasObj;
// 						var meta = that.data.meta;
						that.data.canvas.on('mouse:down',function(o){
							var meta = that.data.meta;
							canvasObj.isDown = true;
							/// jh.sa 201023
							if(o.target){
								canvasObj.freeDrawing = true;
							}

							if(canvasObj.freeDrawing == true){
								var pointer = canvas.getPointer(o.e);
								if($("#imgSegList .label_wrap .category_wrap .cate_wp.selected").length == 0){
									return;
								}								
								var uuid = $("#imgSegList .label_wrap .category_wrap .cate_wp.selected")[0].id;
								
							    canvasObj.origX = pointer.x;
							    canvasObj.origY = pointer.y;
							    
								var temp = {
							    	x : canvasObj.origX,
							    	y : canvasObj.origY,
								}
								    
								// segmentation 종료 부분 start
								var canvs = canvas.getObjects();
								for(var i=0; i<canvs.length; i++){
									if(o.target && o.target['uuid'] == canvs[i]['uuid'] && o.target['index'] == canvs[i]['index']){
										canvasObj.freeDrawing = false;
										that.computed.addLine(uuid);
										that.computed.generatePoly(uuid);
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
								}
							}
							
						});
					},// canvas poly mouse down event end
					
					moveEvt : function() { // canvas poly mouse move event
						const that = imgSegList;
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
								if(evt.target){
									objType = evt.target.type;
									target = evt.target;
									canvas.getObjects().forEach(function(canv,index){
										if(canv['type'] == 'polygon' && canv['uuid'] == target['uuid']){
											polygon = canv;
										}
									});
									polygon.points[target.index] = {x: target.getCenterPoint().x, y: target.getCenterPoint().y}
								}
							} 
							
						});
					},// canvas poly mouse move event end
					
					upEvt : function() { // canvas poly mouse up event
						const that = imgSegList;
						var data = that.data;
						var meta = that.data.meta;
						var canvas = that.data.canvas;
						var canvasObj = that.data.canvasObj;
						
						canvas.on('mouse:up', function(e) {
							data.canvasObj.isDown = false;
							
							if($("#imgSegList .label_wrap .category_wrap .cate_wp.selected").length == 0){
								return;
							}							
							
							var uuid = $("#imgSegList .label_wrap .category_wrap .cate_wp.selected")[0].id;
							
							// jh.sa 201022
// 							if(uuid == e.target.uuid){
// 								that.data.modifiedObj[e.target.uuid] = that.data.meta[e.target.uuid];
// 								that.data.modifiedObj[e.target.uuid]["polyData"][e.target.index] = {
// 										y : e.target.getCenterPoint().y / that.data.scaleFactor.ratio,
// 										x : e.target.getCenterPoint().x / that.data.scaleFactor.ratio,
// 								};
// 								console.log("modifiedObj: ", that.data.modifiedObj[e.target.uuid]);								
// 							}
							
							// jh.sa 201023
							var scaleRatio = that.data.scaleFactor.ratio;
							if(e.target.uuid == uuid){
								console.log("e.target.index: ", e.target.index, "e.target.left: ", e.target.left, "e.target.top: ", e.target.top);
								console.log("meta.index info: ", that.data.meta[uuid]["polyData"][e.target.index]);
								that.data.meta[uuid]["polyData"][e.target.index] = {
										x : e.target.left / scaleRatio,
										y : e.target.top / scaleRatio
								}
								console.log("meta.index info: ", that.data.meta[uuid]["polyData"][e.target.index]);
							}

							/// jh.sa 201023
							if(e.target){
								canvasObj.freeDrawing = false;
								that.computed.generatePoly(uuid);
							}
							
							var newPoly = that.computed.resetPolyPosition(that.data.canvas.getObjects(),uuid);
							
// 							that.data.meta[uuid]['polyData'] = newPoly;
							
							that.render.renderCropImgIntoLabel(newPoly,uuid);
							that.data.canvasObj['isModified'] = 1;
							
						});
					},// canvas poly mouse up event end
					
					wheelEvt : function() {
						const that = imgSegList;
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
					
					objMovingEvt : function() {
						const that = imgSegList;
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
					
// 					objModifiedEvt : function() {
// 						const that = imgSegList;
// 						var canvas = that.data.canvas;
// 						canvas.on("object:modified",function(evt){
// 							that.data.canvas.getActiveObject().lockScalingX = false;
// 							that.data.canvas.getActiveObject().lockScalingY = false;	
// 							that.data.canvas.getActiveObject().lockMovementX = false;
// 							that.data.canvas.getActiveObject().lockMovementY = false;
// 						});
// 					},
					
// 					objScalingEvt : function() {
// 						const that = imgSegList;
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
					
					keydownEvt : function() {
						const that = imgSegList;
						var canvas = that.data.canvas;
						var uuid = $("#imgSegList .category_wrap .cate_wp.selected").attr("id");
						
						$(document).off("keyup").on("keyup", function(evt){
// 							if (evt.keyCode == "17") isCtrl = false;
							if(evt.keyCode == "83" && evt.ctrlKey == true){
								that.computed.submitMeta(uuid);
							}
						});						
						
						$(document).off("keydown").on("keydown",function(evt){
							// del evt
							if(evt.keyCode == "46" || evt.keyCode == "68" && evt.ctrlKey == true){
// 								evt.preventDefault();
// 								if(canvas.getActiveObject() == null){
// 									alert("라벨을 선택해 주세요.");
// 									return
// 								}
// 								var tmp = confirm("데이터를 삭제하시겠습니까?");
// 								if(tmp == true && canvas.getActiveObject() != null){
// 									var uuid = canvas.getActiveObject().uuid;
// 									delete that.data.meta[uuid];
									
// 									that.bind.keydownEvt();
// 								}

								if(canvas.getActiveObject() == null){
									alert("라벨을 선택해 주세요.");
									return
								}
								var tmp = confirm("데이터를 삭제하시겠습니까?");
								if(tmp == true && canvas.getActiveObject() != null){
									var uuid = canvas.getActiveObject().uuid;
									var dataId = $("#imgSegList .c_wrap .path.active").parent("li").attr("data-id");
//		 							var labelBox = $(this).parent().parent().attr("id",uuid);
									var labelBox = $("#imgSegList .category_wrap .cate_wp#"+uuid);
									if(uuid.indexOf("-") == -1){
										// call ajax
										that.computed.deleteMetaById(uuid, labelBox[0]);
									} else {
										// not call ajax
										that.computed.deleteMetaData(uuid, labelBox[0]);
									}					
//		 							delete that.data.meta[uuid];
									//
									labeller.bind.evtAll();							
									that.bind.keydownEvt2();
								}	
							}
						});
						
					},
					
					keydownEvt2 : function(evt){
						const that = imgSegList;
						var canvas = that.data.canvas;
						
						evt.preventDefault();
						if(canvas.getActiveObject() == null){
							alert("라벨을 선택해 주세요.");
							return
						}
						var tmp = confirm("데이터를 삭제하시겠습니까?");
						if(tmp == true && canvas.getActiveObject() != null){
							var uuid = canvas.getActiveObject().uuid;
							var dataId = $("#imgSegList .c_wrap .path.active").parent("li").attr("data-id");
// 							var labelBox = $(this).parent().parent().attr("id",uuid);
							var labelBox = $("#imgSegList .category_wrap .cate_wp#"+uuid);
							if(uuid.indexOf("-") == -1){
								// call ajax
								that.computed.deleteMetaById(uuid, labelBox[0]);
							} else {
								// not call ajax
								that.computed.deleteMetaData(uuid, labelBox[0]);
							}					
// 							delete that.data.meta[uuid];
							//
							labeller.bind.evtAll();							
							that.bind.keydownEvt2();
						}								
						
					},					
					
					sideEvtCollision : function(evt) {
						const that = imgSegList;
						// DOM Event
						$("#imgSegList .label_wrap input[name=label_name]").on("propertychange change keyup paste input", function(e) {
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
						
						$("#imgSegList .position-value").off("input").on("input", function(e){
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

						$("#imgSegList .label_wrap .btn_wrap .add").off("click").on("click",function(evt){
							var uuid = that.computed.generateUUID();
							var keys = Object.keys(that.data.meta);
							that.data.canvasObj.freeDrawing = true;
							
							if(keys.length > 0){
								for(var i=0; i<keys.length; i++){
									if(keys[i] == uuid){
										uuid = that.computed.generateUUID();
									}
								}
							}
							
							var labelNo = eval($("#imgSegList .label_wrap .category_wrap").find(".cate_wp").length+1);
							
							var html = that.render.tempInitCategory(uuid);
							$("#imgSegList .label_wrap .category_wrap").append(html);
							
							let color = that.data.colorHash.rgb(uuid);
							$("#imgSegList .label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
							
							$("#imgSegList .label_wrap .category_wrap .cate_wp").removeClass("selected");
							$("#imgSegList .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
							$("#imgSegList .label_wrap .category_wrap .cate_wp").last().addClass("selected");
							$("#imgSegList .label_wrap .category_wrap .cate_wp[id='"+uuid+"'].selected ").css("border-color","rgb("+color+")");
							
							that.computed.initMetaData(uuid,labelNo);
							that.computed.initMetaData(uuid);
							that.bind.sideEvtCollision();
						});
						
						// alert and meta data delete!!
						$("#imgSegList .label_wrap .category_wrap .cate_wp .delete").off("click").on("click",function(evt){
						
							var check = confirm("데이터를 삭제하시겠습니까?");
							if(check == true){
								let uuid = $(this).parent().parent().attr("id");
// 								var dataId = $(".data_item .collapse-item.active").attr("data-id");
								var dataId = $("#imgSegList .c_wrap .path.active").parent("li").attr("data-id");
								var labelBox = $(this).parent().parent().attr("id",uuid);
								if(uuid.indexOf("-") == -1){
									// call ajax
									that.computed.deleteMetaById(uuid, labelBox[0]);
								} else {
									// not call ajax
									that.computed.deleteMetaData(uuid, labelBox[0]);
								}						
							}
						});
						
						$("#imgSegList .category_wrap .cate_wp .category").off('keypress').on('keypress',function(evt){
							if(evt.keyCode == 13){
								var uuid = $(this).parent().parent().attr("id");
								that.data.meta[uuid]['category'] = $(this).val();
							}
						});
						
						// jh.sa add
						$("#imgSegList .category_wrap .cate_wp .category").off('blur').on('blur',function(evt){
							var uuid = $(this).parent().parent().attr("id");
							that.data.meta[uuid]['category'] = $(this).val();
						});							
						
						///////////////
						$("#imgSegList .category_wrap .cate_wp").off("click").on("click",function(){
							var uuid = $(this).attr("id");
							var color = that.data.colorHash.rgb(uuid);
							var path = $(this).data("path");
							var dataAddr = '/uploadFile/xlabeller/'+path;	
							
							that.pt.find(".empty_wrap").remove();
							that.pt.find("section.enrichment .canvas-container").show();
							$("#imgSegList .label_wrap .category_wrap .cate_wp").removeClass("selected");
							$("#imgSegList .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
							$("#imgSegList .img_list_wrap .name_wrap .file_name").html(path.split("/")[1]);
							$("#imgSegList .img_list_wrap .name_wrap .file_name").attr("title",path.split("/")[1]);
							$(this).addClass("selected");
							$(this).css("border-color","rgb("+color+")");
							
							if($(this).hasClass("selected")){
								var canvArr = that.data.canvas.getObjects();
								for(var i=0; i<canvArr.length; i++){
									that.data.canvas.remove(canvArr[i]);
								}
								$("#loader").show();
								that.render.adjustArea();
								that.computed.loadImage(dataAddr,uuid);
								that.data.canvas.discardActiveObject();
							}				
							
// 							that.data.canvas.discardActiveObject();
// 							var canvArr = that.data.canvas.getObjects();
// 							for(var i=0; i<canvArr.length; i++){
// 								if(canvArr[i]['uuid'] == uuid){
// 									that.data.canvas.bringToFront(canvArr[i]);
// 									that.data.canvas.setActiveObject(canvArr[i]);
// 								}
// 							}
						});
						
						// jh.sa test 
						$("#imgSegList .save_btn_wrap .save").off("click").on("click",function(){
							$(this).blur();
							var uuid = $("#imgSegList .category_wrap .cate_wp.selected").attr("id");
// 							that.computed.insertMetaData();
							that.computed.submitMeta(uuid);
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
						$("#imgSegList .data_list_btn").off("click").on("click", function(){
							var data_list_wrap = $("#imgSegList .data_list_wrap");
							if(data_list_wrap.hasClass("active")){
								data_list_wrap.removeClass("active");
								data_list_wrap.css("display", "none");	
							} else {
								data_list_wrap.addClass("active");
								data_list_wrap.css("display", "block");								
							}
						});						
						
						// jh.sa : meta data visibility
						$("#imgSegList .label_wrap .category_wrap .cate_wp .visible").off("click").on("click",function(evt){
							let uuid = $(this).parent().parent().attr("id");
							var canv = that.computed.getCanvasObject(uuid);
							var meta = that.data.meta;
							var l_all = $("#imgSegList .label_wrap .category_wrap .cate_wp .visible");
							var b_all = $("#imgSegList .label_wrap .btn_wrap .visible");
							
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
								
								var off = $("#imgSegList .label_wrap .category_wrap .cate_wp .visible.off");
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
								
								var on = $("#imgSegList .label_wrap .category_wrap .cate_wp .visible.on");
								if(on.length === l_all.length){
									b_all.removeClass("off");
									b_all.addClass("on");
								}
								
							}
						});		
						
						$("#imgSegList .label_wrap .btn_wrap .visible").off("click").on("click",function(evt){
							var label_visible = $("#imgSegList .cate_wp .visible");
							
							
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
						$("#imgSegList .c_wrap .preview .img_preview").off("mouseenter").on("mouseenter", function(){
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
					        const path = $(this).parents("li").find(".path").text();
					        
					        $(".show_img_wrap .title").text(id);
					        var canvasPreview = new fabric.Canvas("imgSeg-cc");
				 			const imgObj = new Image();
							imgObj.src = "/uploadFile/xlabeller/" + path; 
							imgObj.onload = function(){ 
// 								that.computed.rescalePreview(this);
								
							    const canvas_max_width = 270;
							    const canvas_max_height = 182;
							    
							    let scaleFactor=0;
							    if((canvas_max_height/canvas_max_width) >= (this.naturalHeight/this.naturalWidth)){	/// jh
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
						
						$("#imgSegList .c_wrap .preview .img_preview").off("mouseleave").on("mouseleave", function(){
							that.pt.find(".show_img_wrap").remove();
						});							
						
						// k.park 201015
						$("#imgSegList .img_list_wrap .data_list_wrap .list_table ul li .path").off("click").on("click",function(){
							var data_num = $(this).parent().attr("data-index")*1-1;
							var page_size=50;
							var currPage = $("#imgSegList #pagination .page-item.active .page-link").html()*1-1;
							var currDataNum = currPage*page_size + data_num;
							that.computed.initImgData(currDataNum);
						});
						

						$("#imgSegList #pagination .first").off("click").on("click",function(){
							that.computed.clearAllData();
							var page_num = 0;
// 							that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
							that.computed.getLabelDataByDatasetId(page_num, that.data.canvasObj['datasetId']);
						});
						$("#imgSegList #pagination .prev").off("click").on("click",function(){
							var page_size = 50;
							var page_num = $("#imgSegList #pagination .page-item.active .page-link").html()-2;
							if(page_num<0){
								alert("첫 페이지 입니다.");
								return false;
							}
							that.computed.clearAllData();
// 							that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
							that.computed.getLabelDataByDatasetId(page_num, that.data.canvasObj['datasetId']);
						});
						$("#imgSegList #pagination .page-link").off("click").on("click",function(){
							if( isNaN($(this).html()) == false){
								var page_num = $(this).html()*1-1;
								that.computed.clearAllData();
// 								that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
								that.computed.getLabelDataByDatasetId(page_num, that.data.canvasObj['datasetId']);
							}
						});
						$("#imgSegList #pagination .next").off("click").on("click",function(){
							var page_size = 50;
							var page_num = $("#imgSegList #pagination .page-item.active .page-link").html();
// 							var lastPage = Math.floor($("#imgSegList .label_title span").html()*1/page_size);
							var lastPage = Math.floor($("#imgSegList .label_wrap .label_title").data("cnt")*1/page_size);
							if(page_num>lastPage){
								alert("마지막 페이지 입니다.");
								return false;
							}
							
							var page = $("#imgSegList .label_wrap .label_title").data("cnt")*1/page_size;
							if(page == page_num){
								alert("마지막 페이지 입니다.");
								return false;
							} else {
								that.computed.clearAllData();
								that.computed.getLabelDataByDatasetId(page_num, that.data.canvasObj['datasetId']);
							}							
// 							that.computed.clearAllData();
// 							that.computed.getLabelDataByDatasetId(page_num, that.data.canvasObj['datasetId']);
						});
						$("#imgSegList #pagination .last").off("click").on("click",function(){
							var page_size = 50;
							
// 							var page_num = Math.floor($("#imgSegList .label_title span").html()*1/page_size);
							var page_num = Math.floor($("#imgSegList .label_wrap .label_title").data("cnt")*1/page_size);
// 							that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
// 							that.computed.clearAllData();
// 							that.computed.getLabelDataByDatasetId(page_num, that.data.canvasObj['datasetId']);
							
							var page = $("#imgSegList .label_wrap .label_title").data("cnt")*1/page_size;
							if(page == page_num){
								that.computed.clearAllData();
								that.computed.getLabelDataByDatasetId(page_num-1, that.data.canvasObj['datasetId']);
							} else {
								that.computed.clearAllData();
								that.computed.getLabelDataByDatasetId(page_num, that.data.canvasObj['datasetId']);
							}							
						});
						
						$("#imgSegList .prev_data").off("click").on("click",function(){
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
						$("#imgSegList .next_data").off("click").on("click",function(){
							var currDataNum = that.data.canvasObj['currDataNum']*1;
							var page_size = 50;
							var total_size = $("#imgSegList .position_wrap .total_count span").html()*1;
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
						});
						
						$("#imgSegList .img_list_wrap .name_wrap .prev_btn").off("click").on("click",function(){
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
						$("#imgSegList .img_list_wrap .name_wrap .next_btn").off("click").on("click",function(){
							var currDataNum = that.data.canvasObj['currDataNum']*1;
							var page_size = 50;
							var total_size = $("#imgSegList .position_wrap .total_count span").html()*1;
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
						
						$("#imgSegList .position-value").off("keypress").on("keypress",function(evt){
							if(evt.keyCode == "13"){
								var page_size = 50;
								var targetDataNum = $(this).val()*1-1;
								var targetPageNum = Math.floor(targetDataNum*1/page_size*1)+1;
								var currPageNum = $("#imgSegList #pagination .page-item.active .page-link").html();
								var total_size = $("#imgSegList .position_wrap .total_count span").html()*1;
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
							
							
							if($(".tag_wrap .tag.selected").length > 0){
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

							} else {
								that.pt.find(".category_wrap .cate_wp").show();
								var settingTargets = that.pt.find(".category_wrap .cate_wp");
								settingTargets.removeClass("selected");
								settingTargets.css("border-color","#eeeeee");
// 								that.computed.tagSetting(targets);
								that.pt.find(".label_wrap .label_title span").html(settingTargets.length);
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
                        const that = imgSegList;
                        $("#imgSegList .category_wrap").html("");
                        $("#imgSegList .img_list_wrap .name_wrap .file_name").html("");
                        $("#imgSegList .empty_wrap").remove();
                        const html = '<div class="empty_wrap"><div class="no_image"></div><div class="eng_text">No Data</div><div class="kor_text">you have not selected any data yet</div></div>';
                        that.pt.find("section.enrichment .canvas-container").hide();
                        that.pt.find("section.enrichment .video_wrap").append(html);
                    },						
                    
                    resetEnrichView : function(){
                    	const that = imgSegList;
                    	
                        $("#imgSegList .img_list_wrap .name_wrap .file_name").html("");
                        $("#imgSegList .empty_wrap").remove();
                        const html = '<div class="empty_wrap"><div class="no_image"></div><div class="eng_text">No Data</div><div class="kor_text">you have not selected any data yet</div></div>';
                        that.pt.find("section.enrichment .canvas-container").hide();
                        that.pt.find("section.enrichment .video_wrap").append(html);                    	
                    },
					
				},// bind end
				computed : {
					root : null,
					createPoint : function(uuid,pointObj,index) { //create new point
						const that = imgSegList;
						var meta = that.data.meta;
// 						var tmpObj = that.computed.getPointObject(uuid,pointObj,meta[uuid]['polyData'].length-1);
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
					
					initPolyFromMeta : function(uuid) { // from Server Data, initiate meta poly data
						const that = imgSegList;
						var meta = that.data.meta;
						
						var polyObj = this.getPointObject(meta[uuid]);
						var tempPoly = new fabric.Circle( polyObj );
						
						that.data.canvas.add(tempPoly);
						
						
					}, //init Poly data end
					
					// k.park 201015
					deleteMetaData : function(uuid,labelBox){
						const that = imgSegList;
						if(!uuid){
							return false;
						}
						labelBox.remove();
						delete that.data.meta[uuid];
						var canv = that.computed.getCanvasObject(uuid);
						that.data.canvas.remove(canv);
					},	
					
					addLine : function(uuid){ //create new line
						const that = imgSegList;
						var tmpObj = that.computed.getLineObject(uuid);
						var points = that.data.meta[uuid]['polyData'];
						
						var tempLine = new fabric.Line(points,tmpObj);
						that.data.canvas.add(tempLine);
						that.data.canvas.setActiveObject(tempLine);
						that.data.canvas.renderAll();
					},
					generatePoly : function(uuid,isFromData){ //create new poly
						const that = imgSegList;
						var canvas = that.data.canvas;
						var canvasObj = that.data.canvasObj;
						
						var tmpObj = that.computed.getPolyObject(uuid,canvasObj.freeDrawing);
						var points;
// 						if(!isFromData){
// 							points = that.data.meta[uuid]['polyData'];
// 						} else {
// 							points = that.computed.rescale(that.data.meta[uuid]['polyData']);
							points = that.computed.rescale(that.data.meta[uuid]['polyData'],"0");
// 						}
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
						
						var scaleRatio = that.data.scaleFactor.ratio;
// 						if(!isFromData){
// 							that.data.meta[uuid]['polyData']['box'] = {
// 									left:tempPoly.left/scaleRatio,
// 									top:tempPoly.top/scaleRatio,
// 									width:tempPoly.width/scaleRatio,
// 									height:tempPoly.height/scaleRatio,
// 							}							
// 						} else {
// 							that.data.meta[uuid]['polyData']['box'] = {
// 									left:tempPoly.left,
// 									top:tempPoly.top,
// 									width:tempPoly.width,
// 									height:tempPoly.height,
// 							}
// 						}
						that.data.meta[uuid]['polyData']['box'] = {
								left:tempPoly.left,
								top:tempPoly.top,
								width:tempPoly.width,
								height:tempPoly.height,
						}
						
					},
					
					// get CIRCLE object for initialisation
					getPointObject : function(uuid,points,index) {
						const that = imgSegList;
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
					getLineObject : function(uuid){
						const that = imgSegList;
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
					getPolyObject : function(uuid,freeDrawing){
						const that = imgSegList;
						var meta = that.data.meta;
						var object = {};
						if(freeDrawing == true){
							object = {
								stroke:'#333333',
				                strokeWidth:1,
				                type:'polygon',
				                fill: '#cccccc',
				                opacity: 0.3,
				                selectable: false,
				                hasBorders: false,
				                hasControls: false,
				                evented: false,
				                objectCaching:false,
				                uuid : uuid,
							};	
						}else{
							object = {
								stroke:'#333333',
					            strokeWidth:0.5,
					            type:'polygon',
					            fill: 'rgb('+that.data.colorHash.rgb(uuid)+',0.5)',
								selectable: false,
					            hasBorders: true,
					            hasControls: false,
					            objectCaching:false,
					            lockMovementX: true,
								lockMovementY: true,
					            lockUniScaling : true,
					            uuid : uuid,
							}
						}
						return object;
					},
					
					resetPolyPosition : function(canvObjs,uuid){
						const that = imgSegList;
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
						const that = imgSegList;
						
						var isModified = that.data.canvasObj['isModified'];
						var msg = "데이터 이동 시 저장되지 않은 라벨은 손실됩니다. 계속하시겠습니까?";						
						
						if(isModified == 1){
							if(!confirm(msg)){
								return false;
							}
						}
						
						that.computed.clearAllData();
						that.computed.getDataByNum(dataNum);
					},					
					
					// create meta data
					initMetaData : function(uuid) {
						const that = imgSegList;
						
						that.data.meta[uuid] = {
// 							labelNo : labelNo,
							id : uuid,
							polyData : [],
							category : null,
						};
						
					},// create meta data end
					
					clearAllData : function(){
						const that = imgSegList;
						that.data.scaleFactor = {origWidth:0, origHeight:0, ratio:1};
						that.data.canvasObj.isModified = 0;
						this.clearCanvas();
						this.clearMeta();
						this.clearPoly();
					},
					
					clearCanvas : function(){
						const that = imgSegList;
						that.data.canvasObj['currDataNum'] = null;
						that.data.canvas.clear();
					},
					
					clearMeta : function(){
						const that = imgSegList;
						that.data.meta = {};
					},
					
					clearPoly : function(){
						const that = imgSegList;
						that.data.poly = {};
					},					
					
// 					/*
// 					*  get Video Data List
// 					*/
					getVideoDataList : function(page,dataSet,currDataNum){
						const that = imgSegList;
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
									alert("현재 데이터가 없습니다.");
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
					
					// jh.sa 201020
					getLabelDataByDatasetId : function(page, datasetId, currDataNum){
						const that = imgSegList;
						$("#loader").show();
						return $.ajax({
							url : baseUrl + "data/getSearchVisionList.json",
							data : { page_num : page, dataset_id : datasetId },
							type : "POST",
							success : function(res) {
								$("#loader").hide();
								console.log("=====getSearchVisionList=====", res);
								if (res.result.code == "200") {
									if(res.result.data.length == 0){
										alert("사용 가능한 데이터가 없습니다");
										labeller.event.labelling();								
									} else {
										if(!currDataNum){
											that.data.canvasObj['currDataNum'] = res.metaVO.page_num*1+1;
										}else{
											that.data.canvasObj['currDataNum'] = currDataNum*1+1;
										}
										
										var startPage = Math.floor(res.metaVO.page_num*1/res.metaVO.page_size*1)+1;
										var total_size = res.metaVO.total_size;
										var page_size = res.metaVO.page_size;										
										
										// jh.sa 201019
		 								var result = res.result.data;
										
										$("#imgSegList .label_wrap .label_title span").html(total_size);
										$("#imgSegList .label_wrap .label_title").data("cnt",total_size);
										that.bind.resetView();
		 								that.render.updateListPage(result,startPage,page_size,total_size);										
										
// 										that.render.initMetaFromData(result);
									}
								} else if(res.result.code == "2001"){
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
					
					getDataByNum : function(dataNum){
						const that = imgSegList;
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
					
					getMetaByDataId : function(dataId){
						const that = imgSegList;
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
							$("#loader").hide();
							if(data.result.code == "3301"){
								alert(data.result.data);
								location.href = baseUrl + "login";
								return false;
							}
							var temp = [];
							var result = data.result.data;
							
							that.render.initMetaFromData(result);
// 							that.computed.checkMetaFrame(0);
						});
						
					},					
					
					
					searchCategoryInCateTab : function(name,category_0,pt){
						const that = imgSegList;
						$("#loader").show();
						$.ajax({
							url : baseUrl + "category/getSearchCategory.json",
							data : {name:name, category_0:category_0},
							type : "POST",
							traditional : true,
							success : function(res){
								$("#loader").hide();
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
					insertMetaData : function(){
						const that = imgSegList;
						var meta = that.data.meta;
						var keys = Object.keys(meta);
						var data = [];
						
						// 수정!
// 						var dataId = $(".data_item .collapse-item.active").attr("data-id");
// 						var dataId = that.data.canvas.dataId;
// 						if(!dataId){
// 							alert("데이터를 선택해 주세요.");
// 							return false;
// 						}
						$("#loader").show();
						for(var i=0; i<keys.length; i++){
							var temp = that.computed.rescale(modifiedObj[keys[i]]['polyData'],true);
							var dataId = $("#imgSegList .cate_wp#"+keys[i]).data("id");
							var labelType = $("#imgSegList .cate_wp#"+keys[i]).data("type");
							
							if(meta[keys[i]]['category'] == ""){
								alert("라벨명을 입력해주세요.");
								$("#loader").hide();
								return false;
							}
							
							console.log("temp!!!!",temp);

							var tempPoly = {
								meta_id : keys[i],
								label : meta[keys[i]]['category'],
								info : JSON.stringify(temp)
							}
							
							data.push(tempPoly);
							
						}
						
						var ajaxData = {
								label_type : "IMAGE_SEGMENTATION",
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
							data : ajaxData,
							type : "POST",
							traditional : true,
							timeout : 5000,
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
									that.computed.initImgData(that.data.canvasObj['currDataNum']*1-1);
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
					
					// jh.sa 201022
					submitMeta : function(uuid) {
						const that = imgSegList;
// 						var mObj = that.data.modifiedObj;
						var meta = that.data.meta;
// 						var keys = Object.keys(mObj);
						var data = [];
						
						
						const ajaxData = {
								data_id : 2,
								stay_flag : 2,
								info : [],
							}						
// 						for(var i=0; i<keys.length; i++){
// // 							var temp = that.computed.rescale(mObj[keys[i]]['polyData'],true);
// 							var segmentation = that.computed.rescale(mObj[keys[i]]['polyData'],"2");
// 							var box = mObj[keys[i]]['polyData']["box"];
// 							var boxInfo = box.width + "," + box.height + "," + box.left + "," + box.top; 
// 							var dataId = $("#imgSegList .cate_wp#"+keys[i]).data("id");
// 							var labelType = $("#imgSegList .cate_wp#"+keys[i]).data("type");
							
// 							ajaxData.info.push({
// 								segmentation,
// 								data_id : dataId+"",
// 								box : boxInfo+"",
// // 								width: box.width +"",
// // 								height: box.height +"",
// // 								left: box.left +"",
// // 								top: box.top +"",
// 								label: mObj[keys[i]]["category"] +"",
// 								label_type : labelType +"",
// 								meta_id : mObj[keys[i]]["id"],
// 							});							

// 						}		
						$("#loader").show();
						
						
// 						var temp = that.computed.rescale(mObj[keys[i]]['polyData'],true);
// 						var segmentation = that.computed.rescale(meta[uuid]['polyData'],"2");
// 						var box = meta[uuid]['polyData']["box"];
// 						var boxInfo = box.width + "," + box.height + "," + box.left + "," + box.top; 
						var scaleRatio = that.data.scaleFactor.ratio;
						var temp = that.computed.rescale(meta[uuid]['polyData'],"2");
                        // jh.sa 201022
						var segmentation = [];
						for(var j = 0; j<temp.length; j++){
							segmentation.push(temp[j]);
						}
						var boxInfo = temp.box;
						var box =  boxInfo.left/scaleRatio + "," + boxInfo.top/scaleRatio + "," + boxInfo.width/scaleRatio + "," + boxInfo.height/scaleRatio; 	
						
						
						var dataId = $("#imgSegList .cate_wp#"+uuid).data("id");
						var labelType = $("#imgSegList .cate_wp#"+uuid).data("type");
						
						ajaxData.info.push({
							segmentation,
							data_id : dataId+"",
							box : box+"",
							label: meta[uuid]["category"] +"",
							label_type : labelType +"",
							meta_id : meta[uuid]["id"],
						});	
						
						if(ajaxData.length <=0){
							alert("저장할 데이터가 없습니다.");
							$("#loader").hide();
							return false;
						}
						ajaxData.info = JSON.stringify(ajaxData.info); 
						console.log("==ajaxdata==",ajaxData);
						$.ajax({
							url :  baseUrl + "data/updateMeta.json",
							data : ajaxData,
							type : "POST",
							traditional: true,
							success : function(res){

								//j.park 초기화 추가 및 화면 프레시 제거
								console.log("====updateMeta====", res);						
								$("#loader").hide();
								if(res.result.code == "200"){
									alert("저장이 완료되었습니다");
// 									that.data.modifiedObj = {};
									that.data.canvasObj.isModified = 0;
									var page_num = $("#imgSegList #pagination .page-item.active .page-link").html()*1-1;
		 							that.init(that.data.canvasObj["datasetId"],page_num);						
								} else if (res.result.code == "2001") {
									alert(res.result.data);
									location.href = baseUrl + 'login';
								} else {
									alert(res.result.data);
								}							
							},
							error : function(err){
								$("#loader").hide();
								alert(err);
								console.log("ERROR!!", err);
							}
						});
						
					},					
					
					// k.park 20201013
					deleteMetaById : function(uuid, labelBox){
						const that = imgSegList;
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
									that.computed.deleteMetaData(uuid,labelBox);
									that.computed.clearCanvas();
									that.bind.resetEnrichView();
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
					loadImage : function(dataAddr,uuid){
						const that = imgSegList;
						var canvas = that.data.canvas;
						var meta = that.data.meta;
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
								
// 								var metaData = that.computed.rescale(meta[uuid]['polyData']);
								// jh.sa 201022
								var metaData = that.computed.rescale(meta[uuid]['polyData'],"0");

									
								for(var i=0; i<metaData.length; i++){
										that.computed.createPoint(uuid,metaData[i],i);
								}
								that.computed.generatePoly(uuid, true);
								
								var canvArr = that.data.canvas.getObjects();
								for(var i=0; i<canvArr.length; i++){
									if(canvArr[i]['uuid'] == uuid){
										that.data.canvas.bringToFront(canvArr[i]);
										that.data.canvas.setActiveObject(canvArr[i]);
									} else {
										that.data.canvas.remove(canvArr[i]);
									}
								}								
								$("#loader").hide();
								// k.park 20201013
// 								that.computed.getMetaByDataId(canvas.dataId);								
								
							});
							canvas.imgInfo = tmpImage;	
						}
					},
					
					// gap between real video size and web page
					getScaleFactor : function(imgObj){
						const that = imgSegList;
// 						var imgObj = this.checkImageSize(dataAddr);
						// 실제 비디오 크기 기준
						// scaleFactor > 1 : 실제 비디오가 캔버스 크기보다 큼
						// scaleFactor < 1 : 실제 비디오가 캔버스 크기보다 작음
						that.data.scaleFactor.origWidth = imgObj['width'];
						that.data.scaleFactor.origHeight = imgObj['height'];
						that.data.scaleFactor.ratio = $("#imgSegList-canvas").width() / that.data.scaleFactor.origWidth;
						
					}, // scalefactor end
					
					// re-size poly on canvas
					rescale : function(polyData,isSave){
						const that = imgSegList;
						var scaledRatio = that.data.scaleFactor.ratio;
						var tempData = [];
						
						if(isSave == "0"){
							
							for(var i=0; i<polyData.length; i++){
								tempData[i] = {};
								tempData[i].x = polyData[i].x*scaledRatio;
								tempData[i].y = polyData[i].y*scaledRatio;
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
							
						}else if(isSave == "1"){
							
							for(var i=0; i<polyData.length; i++){
								tempData[i] = {};
								tempData[i].x = polyData[i].x/scaledRatio;
								tempData[i].y = polyData[i].y/scaledRatio;
							}
							
							if(polyData["box"]){
								tempData["box"] = {
										left : polyData["box"].left/scaledRatio,
										top : polyData["box"].top/scaledRatio,
										width : polyData["box"].width/scaledRatio,
										height : polyData["box"].height/scaledRatio,
								}
							}							
							
						} else {
							// jh.sa 201022
							for(var i=0; i<polyData.length; i++){
								tempData[i] = {};
								tempData[i].x = polyData[i].x;
								tempData[i].y = polyData[i].y;
							}	
							
							if(polyData["box"]){
								tempData["box"] = {
										left : polyData["box"].left,
										top : polyData["box"].top,
										width : polyData["box"].width,
										height : polyData["box"].height,
								}
							}							
							
						}
						
						return tempData;
						
					}, // re-size poly on canvas end
					
					// jh.sa : rescale temp base image
					
					rescaleTempImg : function(img,w,h){
						const that = imgSegList;
						
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
// 						$("#imgSegList #imgSegList-labeller").height(img.naturalHeight*scaleFactor);						
					},							
					
					
					// save poly all data
					saveMetaData : function(uuid,newPoly){
						window.getSession();
						const that = imgSegList;
						var meta = that.data.meta;
						
						var tempPoly = {
							x : newPoly.x,
							y : newPoly.y,
						}
						
						meta[uuid]['id'] = uuid;
						meta[uuid]['polyData'].push(tempPoly);
// 						category : $("#imgSegList .category_wrap [id='"+uuid+"'] .category").val();
						meta[uuid]['category'] = $("#imgSegList .category_wrap [id="+uuid+"] .category").val();
					},
					
					// k.park 201015
					deleteMetaData : function(uuid,labelBox){
						const that = imgSegList;
						if(!uuid){
							return false;
						}
						
						labelBox.remove();
						delete that.data.meta[uuid];
						
						var canv = that.computed.getCanvasObject(uuid);
						// jh.sa 201021
						for(var i = 0; i < canv.length; i++){
							that.data.canvas.remove(canv[i]);
						}						
						
						// jh.sa 210129 length 0 일때 처리 필요
						if($("#imgSegList .category_wrap .cate_wp").length == 0){
							alert("사용 가능한 데이터가 없습니다");
							labeller.event.labelling();	
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
					
					getCanvasObject : function(uuid){
						const that = imgSegList;
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
					
					// jh.sa 210226 tag
					getLabelGroup : function(datasetId){
						const that = imgSegList;
						
						var tagset = [];
						var ajaxData = {
							dataset_id : datasetId		
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
									console.log("이 데이터셋의 라벨 태그: ",tagset);
									that.render.drawTagset(tagset);
									$("#imgSegList .label_wrap .label_title span").html(tagset.length);
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
						const that = imgSegList;
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
					updateListPage : function(data,startPage,page_size,total_size){
						const that = imgSegList;
						var totalPage = Math.ceil(total_size * 1 / page_size);
						
						if($("#imgSegList #pagination").data("twbs-pagination")){
							$("#imgSegList #pagination").twbsPagination('destroy');
						}
						$("#imgSegList #pagination").twbsPagination({
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
// 						that.render.drawDataList(temp,total_size);
						that.render.initMetaFromData(data);
					},						
					
					/*
					*  jh.sa 201015 : drawDataList
					*/
					drawDataList : function(data, totalSize, pageNum, pageSize){
						const that = imgSegList;
						
						var total = $("#imgSegList .data_list_wrap .data_total span");
						var target = $("#imgSegList .list_table .c_wrap");
						var html = "";
						
						total.html(totalSize);
						target.html("");
						for(var i=0; i < data.length; i++){
							html += "<li class='flex' data-id='" + data[i].data_id + "' data-index='" + (i+1) + "'>";	// (i+1) 부분은 수정필요
							html += " <div class='preview'><div class='img_preview'></div></div>";
							html += " <div class='id'>" + data[i].data_id + "</div>";
							html += " <div class='path'>" + data[i].path + "</div>";
							html += " <div class='label_cnt'>" + data[i]['meta_cnt'] + "</div>";
							html += "</li>";
						}
						
						target.append(html);
					},
					
					renderImageByData : function(data,total_size){
						const that = imgSegList;
						
						
						that.data.canvas['dataId'] = data['data_id'];
						var dataAddr = '/uploadFile/xlabeller/'+data.path;
						
// 						$("#imgSegList .prog_bar .name_wrap .video_name").html(data['filename']);
						$("#imgSegList .img_list_wrap .name_wrap .file_name").html(data['filename']);
						$("#imgSegList .img_list_wrap .name_wrap .file_name").attr("title",data['filename']);
						$("#imgSegList .list_table .c_wrap .path").removeClass("active");
						$("#imgSegList .list_table .c_wrap [data-id='"+data['data_id']+"'] .path").addClass("active");
						$("#imgSegList .list_table .c_wrap [data-id='"+data['data_id']+"'] .label_cnt").html(data['meta_cnt']);
						$("#imgSegList .position_wrap .position-value").val(that.data.canvasObj['currDataNum']);
						
						if(total_size){
							$("#imgSegList .position_wrap .total_count span").html(total_size);
						}
						
//							that.computed.adjustVideoSrc(dataAddr,fps);
						that.computed.loadImage(dataAddr);
						that.render.checkWindowWidth();
						that.bind.sideEvtCollision();
						
					},							
					
					// function move poly
					movePolyOnCanvas : function(uuid,arrNum){
						const that = imgSegList;
						
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
					initMetaFromData : function(result){
						const that = imgSegList;
						var meta = that.data.meta;
						var keys = [];
						var dataObj = {};
						
						$("#imgSegList .label_wrap .category_wrap").empty();
						that.data.canvasObj.freeDrawing = false;
						
						for(let i=0; i<result.length; i++){
							var temp = JSON.parse(result[i].info);
							// jh.sa 201022
							var seg = temp[0].segmentation;
// 							var temp = result[i].info;
// 							var polyData = that.computed.rescale(temp);
							// jh.sa 201022
							var polyData = that.computed.rescale(seg,"0");

							
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
						
							////
							/////
							dataObj[result[i]['meta_id']] = {
									id : result[i]['meta_id'],
									data_id : result[i]['data_id'],
									path : result[i]['path'],
									label_type : result[i]['label_type']
							};							
						};
						
						////
						for(var i=0; i<keys.length; i++){
// 							that.computed.initMetaPoly(keys[i]);
							var metaData = meta[keys[i]]['polyData'];
							
							for(var j=0; j<metaData.length; j++){
								that.computed.createPoint(keys[i],metaData[j],j);	// jh.sa 201021
							}
							that.computed.generatePoly(keys[i],true);
						}						
						
						that.render.renderCate(dataObj);
						$("#imgSegList .label_wrap .category_wrap .cate").removeClass("selected");
						$("#imgSegList .label_wrap .category_wrap .cate").last().addClass("selected");
						
					},
					// in labeller tab
					tempInitCategory : function(uuid, data){
						const that = imgSegList;
						var html;
						if(!data){
							html = '<div class=" cate_wp  " id="'+uuid+'">';
							html += '	<div class="cate_header col-12 flex sb p-1">';
							html += '		<div class="color  "></div>';
//	 						html += '		<button  class="start_frm btn btn-info">첫점</button>';
//	 						html += '		<button class="end_frm btn btn-info">끝점</button>';
//	 						html += '       <div class="visible on"></div>';							// jh.sa
							html += '		<button class="delete btn btn-danger ">Delete</button>';
							html += '	</div>';
							html += '	<div class="w-100"></div>';
							html += '	<div class="col-12 text-center p-1">';
							html += '		<input type="text" class="form-control category" name="label_name" onkeyUp="noKor(event);noSpaceForm(this);" onchange="noSpaceForm(this);/>';
							html += '	</div>';
							html += '	<div class="col-12 text-center p-1 crop_wrap"><canvas class="crop_img"></canvas></div>';
							
							html += '</div>';							
						} else {
							html = '<div class=" cate_wp  " id="'+uuid+'" data-id="'+data.data_id+'" data-type="'+data.label_type+'" data-path="'+data.path+'">';
							html += '	<div class="cate_header col-12 flex sb p-1">';
							html += '		<div class="color  "></div>';
//	 						html += '		<button  class="start_frm btn btn-info">첫점</button>';
//	 						html += '		<button class="end_frm btn btn-info">끝점</button>';
//	 						html += '       <div class="visible on"></div>';							// jh.sa
							html += '		<button class="delete btn btn-danger ">Delete</button>';
							html += '	</div>';
							html += '	<div class="w-100"></div>';
							html += '	<div class="col-12 text-center p-1">';
							html += '		<input type="text" class="form-control category" name="label_name" onkeyUp="noKor(event);noSpaceForm(this);" onchange="noSpaceForm(this);/>';
							html += '	</div>';
							html += '	<div class="col-12 text-center p-1 crop_wrap"><canvas class="crop_img"></canvas></div>';
							
							html += '</div>';							
						}

						
						return html;
					},
					
					// render crop Image from canvas into the Label Box(category_wrap)
					renderCropImgIntoLabel : function(newPoly,uuid,imgObj){
						const that = imgSegList;
						var scaleRatio = that.data.scaleFactor.ratio;

						if(newPoly == undefined || newPoly == null){
							return;
						}
						var pt = $("#imgSegList .label_wrap .category_wrap .cate_wp[id="+uuid+"]").find(".crop_img");
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
						
						////
						if(!imgObj){
							ctx.drawImage(that.data.canvas.imgInfo,newPoly.left,newPoly.top,newPoly.width,newPoly.height,0,0,newWidth,newHeight);							
						} else {
							ctx.drawImage(imgObj,newPoly.left,newPoly.top,newPoly.width,newPoly.height,0,0,newWidth,newHeight);							
						}						
// 						ctx.drawImage(that.data.canvas.imgInfo,newPoly.left,newPoly.top,newPoly.width,newPoly.height,0,0,newWidth,newHeight);
						
					},
					
					renderCate : function(data) { //drawing category from meta in labeller tab
						const that = imgSegList;
						var meta = that.data.meta;
						var metaKeys = Object.keys(meta);
						var dataKeys = Object.keys(data);
						
						if(dataKeys.length == metaKeys.length){
							for(var i=0; i<metaKeys.length; i++){
								if(dataKeys[i] == metaKeys[i]){
									var uuid = meta[metaKeys[i]]['id'];
									var dataInfo = data[dataKeys[i]];
									
									let html = that.render.tempInitCategory(uuid, dataInfo);
									$("#imgSegList .label_wrap .category_wrap ").append(html);
									
									var newPoly = that.computed.resetPolyPosition(that.data.canvas.getObjects(),uuid);
									that.render.drawImageBox(newPoly, uuid);
									
//		 							that.render.renderCropImgIntoLabel(newPoly,uuid);			// jh.sa 임시로 막음				
									
									let color = that.data.colorHash.rgb(uuid);
									$("#imgSegList .label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
									
									$("#imgSegList .label_wrap .category_wrap [id='"+uuid+"'] .category").val(meta[metaKeys[i]]['category']);									
								}
							}
						}

						that.bind.sideEvtCollision();
					
					}, // drawing category from meta end in Labeller tab
					
					
					drawImageBox : function(newPoly, uuid) {
						const that = imgSegList;
						
						that.pt.find(".cate_wp#"+uuid).each(function(){
							var box = $(this);
							var cur_id = $(this).attr("id");
							var path = $(this).data("path");
							var imgObj = new Image();
							imgObj.src = "/uploadFile/xlabeller/" + path;
							imgObj.onload = function(){
								var canvas_hover = box.find("canvas")[0];
								canvas_hover.id = cur_id;
								that.render.renderCropImgIntoLabel(newPoly, cur_id, imgObj);
							}
						});
					},					
					
					adjustArea : function(){
						const that = imgSegList;
						var scaleFactor = that.data.scaleFactor;
						
						var scaledHeight = scaleFactor.origHeight * scaleFactor.ratio;
// 						var progBarHeight = $(".prog_bar").height();
						var progBarHeight = 157;
						var headerHeight = 67*1;
						// video area height
// 						$("#labeller-video").css("height",scaledHeight);
						$("#imgSegList .enrichment").css("height",scaledHeight*1+progBarHeight+headerHeight);
						
						// video area height
// 						$("#labeller-video").css("height",scaledHeight);
						// canvas init and adjust height
// 						that.data.canvas.setHeight(scaledHeight-progBarHeight);
// 						that.data.canvas.setHeight(scaledHeight);
// 						// search area height
// 						$(".cate_search_wrap .content_wp").css("height",scaledHeight-progBarHeight);
						
		 				// category area height
// 						$("#imgSegList .label_wrap ").css("height",$("#labeller-video")[0].clientHeight);
// 						$("#imgSegList .label_wrap .category_wrap").css("height",$("#labeller-video")[0].clientHeight-progBarHeight-10);
						
						// side bar list height
// 						$("#accordionSidebar li.nav-item").css("height",$(".labeller_container")[0].clientHeight+progBarHeight);
// 						$("#accordionSidebar .data_list .data_item.show").css("max-height",$(".labeller_container")[0].clientHeight-( $("#accordionSidebar a.nav-link")[0].clientHeight) );
					},
					
					checkWindowWidth : function(){
						var bodyWidth = $("body").width();
						if(bodyWidth <= 1440){
							$(".labeller_container .label_wrap").css("width","200px");
						}
					},
					
					// jh.sa 210226 tag
					drawTagset : function(tags,isDel){
						const that = imgSegList;
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
						const that = imgSegList;

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
						const that = imgSegList;
						elem.find(".hover_box").remove();
					},								
					
				},// draw something end
				
				
		}
		
	  </script>		
   </body>
</html>