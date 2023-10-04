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
      
		#imgBBoxList .canvas-container {
			margin: 0px auto;
/* 			height: 100% !important; */
		}      
      
      	#accordionSidebar a.nav-link span { width:168px; display:block; }
	    #accordionSidebar .collapse-inner { height:300px; overflow:scroll; }
	    #accordionSidebar .video_name { 
	    	padding-left:0;
	    }
	    
	   #imgBBoxList a.next_page,a.prev_page { cursor:pointer; }
	   #imgBBoxList .pagination input.page-link { height:30px; width:30px; padding:0 0 0 8px; }
       #imgBBoxList .tab_wrap { width:180px; }
       #imgBBoxList a.disabled { color:#e74a3b !important; pointer-events: none; } 
	   #imgBBoxList .labeller_container { 
/* 	    	overflow:scroll;  */
			overflow: hidden; 
	    	display:flex; 
	    	flex-wrap:nowrap;  
	    	margin-top: 20px; 
	    	border-left: 0; border-right: 0; 
	    	min-height: 840px; max-height: 840px;
	    }
      	
      	#imgBBoxList .tab-pane{
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
      	
      	#imgBBoxList .header_wrap { margin-bottom: 42px; }
      	#imgBBoxList .tab-pane.cate_search_wrap {
/*       		border:1px solid #eeeeee; */
/*       		border-radius : 10px; */
      	}
/*       	.cate_search_wrap { border:1px solid #eeeeee; } */
/*       	.cate_search_wrap .content_wp .content_header .content_title { cursor:pointer; } */
/*       	.cate_search_wrap .search_cate { width:50%; } */
      	
/*       	.cate_search_wrap .search_wp .search_wrap .search_cate_list { cursor:pointer; } */
/*       	.cate_search_wrap .search_wp .search_wrap .search_cate_list:hover { color:red; } */
/*       	.cate_search_wrap .search_wp .search_wrap { position:absolute; width:50%; max-height:500px; overflow:scroll; background-color:#f8f9fc; z-index:100;  } */
      	
      	#imgBBoxList .search_all_wp .search_all_wrap { position:absolute; /* width:50%; */ max-height:500px; overflow:scroll; background-color:#f8f9fc; z-index:100;  }
      	#imgBBoxList .search_all_wp .search_all_wrap .search_cate_list { cursor:pointer; }
      	#imgBBoxList .search_all_wp .search_all_wrap .search_cate_list:hover { color:red; }
      	
      	#imgBBoxList .label_wrap { 
       		position:relative;  
      		width:100%; 
      		height:auto; 
/*       		border: 1px solid #eeeeee;  */
/*       		margin-left:20px;  */
/*       		border-radius:0.35rem;  */
      		flex-shrink:0;
      	}
      	
       	#imgBBoxList .video_wrap .canvas { width:800px; height:400px; position:absolute !important; }  
/*        	.video_wrap .video { width:1024px;  height:auto; position:absolute !important; }   */
       	
/*       	.video_wrap .video .video_js { position:absolute; } */
/*       	.video_wrap .video .vjs-control-bar { display: flex; height:40px; bottom:-40px;} */
/*       	.video_wrap .video .vjs-big-play-button { display:none; } */
      	#imgBBoxList .video_wrap .prog_bar { border:1px solid #eeeeee; width:100%; height:40px; position:relative; }
      	#imgBBoxList .video_wrap .prog_bar > div { color:#020b44; }
		#imgBBoxList .video_wrap .prog_bar .btn_wrap { width:400px; margin-top:0; }
/*       	.video_wrap .prog_bar .btn { color:#020b44; border-radius:50%; } */
      	#imgBBoxList .video_wrap .prog_bar input.curr_frame { width:50px; height:15px; margin-right:0px; }
      	#imgBBoxList .video_wrap .prog_bar .save_btn_wrap { width:260px; }
      	
      	#imgBBoxList .label_wrap .btn_wrap { margin:0; padding-bottom: 1px; border-bottom: 1px solid #eee;}
/*       	.label_wrap .btn_wrap > div { width:100%; margin:0;  cursor:pointer; } */
      	@media (min-height:960px){
/*       		#imgBBoxList .label_wrap .category_wrap { max-height: 880px; }  */
			#imgBBoxList .label_wrap .category_wrap { max-height: 775px; } 
      	}
      	@media (min-height: 730px) and (max-height:959px){
/*       		#imgBBoxList .label_wrap .category_wrap { max-height: 665px; }  */
			#imgBBoxList .label_wrap .category_wrap { max-height: 560px; } 
      	}      	
      	@media (min-height: 500px) and (max-height:729px){
/*       		#imgBBoxList .label_wrap .category_wrap { max-height: 500px; }  */
			#imgBBoxList .label_wrap .category_wrap { max-height: 395px; } 
      	} 
      	@media (min-height: 1px) and (max-height:499px){
/*       		#imgBBoxList .label_wrap .category_wrap { max-height: 400px; }  */
			#imgBBoxList .label_wrap .category_wrap { max-height: 295px; } 
      	} 
/*       	#imgBBoxList .label_wrap .category_wrap { width:100%; height:auto; max-height: 690px; overflow-y: scroll; overflow-x: hidden; flex-wrap: wrap; padding: 0 18px; } */
      	#imgBBoxList .label_wrap .category_wrap { width:100%; height:auto; overflow-y: scroll; overflow-x: hidden; flex-wrap: wrap; padding: 0 18px; }
      	#imgBBoxList .label_wrap .category_wrap .cate_wp { width:190px; /* height:90px; */height:200px; padding: 5px; margin: 5px 10px; border:1px solid #eeeeee; text-align: center; }
      	#imgBBoxList .label_wrap .category_wrap .cate_wp .crop_wrap{ width:180px; height:105px; align-items:center; display:flex; justify-content:center; padding: 0.25rem; padding-top: 0.9rem; }
      	#imgBBoxList .label_wrap .category_wrap .cate_wp .crop_img {position:relative; margin-top: 15px; /* width:180px; height:105px; */ }
      	#imgBBoxList .label_wrap .category_wrap .cate_wp.selected { border-width:2px !important; }
/*       	.label_wrap .category_wrap .cate_wp .delete { margin-left:10px; } */
      	#imgBBoxList .label_wrap .category_wrap .cate_wp .color {     
      		width: 20px;
		    height: 20px;
		    margin-left: 2px;
	    }
	    
      	#imgBBoxList .label_wrap .category_wrap .cate { /*width:5em;*/ /* width:60px; */ border:1px solid #eeeeee; text-align:center; text-align-last:center; }
/*       	.label_wrap .category_wrap .cate option { text-align:center; text-align-last:center; } */
      	
      	#imgBBoxList .page_title_wrap { position: relative; top: 20px; left: 90px; display: inline; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; }
      	#imgBBoxList .page_title_wrap span:first-child { font-size: 13px; }
		#imgBBoxList .page_title_wrap span:nth-child(2) { color: #4c84ff; font-size: 14px;}
		#imgBBoxList .add { width: 90px; margin-right: 10px; position: relative; color: #fff; font-size: 11px; background-color: #4c84ff; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; }
		#imgBBoxList .add:hover { background-color: #3A71E9; }
		#imgBBoxList .delete { width: 55px; color: #343434; font-size: 11px; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; margin-left: 10px;  }
      	#imgBBoxList .label_title { color: #777; font-weight: 400; padding: 20px; }
      	#imgBBoxList .cate_wp input { width: 165px; padding: 10px; margin-top: 3px; }
/*       	#imgBBoxList .save_btn_wrap { justify-content: center; position: absolute; bottom: 0; padding: 18px 0; background-color: #fff; } */
      	#imgBBoxList .save_btn_wrap { justify-content: center; bottom: 0; padding: 30px 0; background-color: #fff; }
      	
      	#imgBBoxList .save_btn_wrap .save { width: 240px; line-height: 36px; margin: 0 auto; border-radius: 23px; box-shadow: 0 4px 8px 0 #b4d7ff; font-size: 13px; font-weight: 300; color: #fff; cursor: pointer; background-color: #4c84ff;}
		#imgBBoxList .save_btn_wrap .save:hover { background-color: #3A71E9; }
/* 		#imgBBoxList .img_list_wrap { width: calc(100% - 699px); position: absolute; bottom: 92px; border: 1px solid #e0e0e0; border-left: 0; border-right: 0; padding: 15px 0; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; background-color: #f8f8f8; }       */
		#imgBBoxList .img_list_wrap { width: 100%; min-height: 30px; position: relative; border: 1px solid #e0e0e0; border-left: 0; border-right: 0; padding: 15px 0; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; background-color: #f8f8f8; }      
      	#imgBBoxList .data_list_wrap { height: 682px !important; max-height: 682px !important; position: absolute; top: calc(100% - 785px); }
		
		#imgBBoxList .position_wrap { width: 100px; margin-right: 20px; }
		#imgBBoxList .position_wrap .position-value { width: 40px; padding: 5px; }
		#imgBBoxList .position_wrap .total_count { display: inline-block; }
		
		#imgBBoxList .video_wrap .prev_btn {
			position: absolute;
			background: url(images/btn_image_arrow_left_normal.png) left;
			width: 16px;
			height: 25px;
 			top: calc(50% - 25px); 
/* 			top: 300px; */
			left: 5px
		}
		
		#imgBBoxList .video_wrap .next_btn {
			position: absolute;
			background: url(images/btn_image_arrow_right_normal.png) right;
			width: 16px;
			height: 25px;
 			top: calc(50% - 25px); 
/* 			top: 300px; */
			right: 5px
		}      	
		
		#imgBBoxList .video_wrap .prev_btn:hover {
			background: url(images/btn_image_arrow_left_hover.png) left;
			cursor: pointer;
		}
		
		#imgBBoxList .video_wrap .next_btn:hover {
			background: url(images/btn_image_arrow_right_hover.png) right;
			cursor: pointer;
		}		
		
		#imgBBoxList .name_wrap { width: 600px; text-align: center; margin: 0 auto; }
		#imgBBoxList .name_wrap .file_name { width: 600px; }
		#imgBBoxList .name_wrap .prev_btn {
			background: url(images/btn_image_arrow_left_normal.png) left;
			width: 16px;
			height: 25px;
/* 			top: calc(50% - 25px); */
			top: 300px;
			left: 5px
		}
		
		#imgBBoxList .name_wrap .next_btn {
			background: url(images/btn_image_arrow_right_normal.png) right;
			width: 16px;
			height: 25px;
/* 			top: calc(50% - 25px); */
			top: 300px;
			right: 5px
		}    	
		
		#imgBBoxList .name_wrap .prev_btn:hover {
			background: url(images/btn_image_arrow_left_hover.png) left;
			cursor: pointer;
		}
		
		#imgBBoxList .name_wrap .next_btn:hover {
			background: url(images/btn_image_arrow_right_hover.png) right;
			cursor: pointer;
		}		
		
      	#imgBBoxList .list_btn_wrap { width: 100px; margin-left: 20px; }
      	#imgBBoxList .list_btn_wrap .data_list_btn { width: 30px; height: 30px; margin-right: 30px; background: url(images/icon_filter_normal.png) right; cursor: pointer; }

/*  		#imgBBoxList .quick_wrap { width: 100%; position: absolute; bottom: 0px; padding: 25px 0; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }        */
 		#imgBBoxList .quick_wrap { width: 100%; bottom: 0px; padding: 25px 0; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }       

/*  		#imgBBoxList .quick_wrap { width: calc(100% - 699px); position: absolute; bottom: 0px; padding: 25px 0; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }        */
/* 		#imgBBoxList .quick_wrap { width: 488px; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; position: absolute; top: -8px; left: 609px;}     */
      
		#imgBBoxList .quick_btn {
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
		
		#imgBBoxList .quick_btn:hover {
			background-color: #3A71E9;
		}      
		
		/* panel label */
		#imgBBoxList .btn_wrap .visible { width: 18px; height: 18px; position: relative; left: -395px; }
		#imgBBoxList .btn_wrap .visible.on { background: url('images/btn_layer_view.png') no-repeat center; }
		#imgBBoxList .btn_wrap .visible.off { background: url('images/btn_checkbox_normal.png') no-repeat center; }		
		
/* 		#imgBBoxList .tag_wrap { width: 100%; height: 60px; position: absolute; bottom: 91px;  border-top: 1px solid #f8f8f8; font-size: 11px; justify-content: center; } */
      
		#imgBBoxList section.enrichment {
			width: calc(100% - 486px);
			height: 100%;
			position: relative;
/* 			border: 1px solid #e5e5e5; */
		}      
		
		#imgBBoxList section.label {
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
		
		#imgBBoxList section.enrichment .empty_wrap { margin: 255px auto; text-align: center; margin-top: 300px; color: #777777; }
		#imgBBoxList section.enrichment .empty_wrap .no_image { margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; height: 37px; background-image: url(./images/icon_nodata_list.png); }
		#imgBBoxList section.enrichment .empty_wrap .eng_text { margin-bottom: 3px; font-size: 16px; }
		#imgBBoxList section.enrichment .empty_wrap .kor_text { font-size: 12px; }		
		#imgBBoxList section.label .paging_wrap { justify-content: center; position: absolute; bottom: 0; padding: 26px 0; background-color: #fff; border-top: 1px solid #eee; }
		
		#imgBBoxList section.tag { width: 486px; height: 100%; position: relative; background-color: #fff; border: 1px solid #e5e5e5; border-bottom: 0; -ms-user-select: none; -moz-user-select: none; -webkit-user-select: none; -khtml-user-select: none; user-select: none; }
		#imgBBoxList section.tag .tag_margin { margin: 0 auto; padding: 10px; }
 		#imgBBoxList section.tag .tag_total { color: #777; font-weight: 400; padding: 20px; }
 		#imgBBoxList section.tag .tag_wrap { width: 100%; height: 90px; margin-top: 1px; border-top: 1px solid #e5e5e5; font-size: 11px; justify-content: center; } 
		#imgBBoxList section.tag .tag_wrap .content { width: 100%; height: auto; max-height: 75px; overflow-y: scroll; overflow-x: hidden; flex-wrap: wrap; -ms-overflow-style: none; }
		#imgBBoxList section.tag .tag_wrap .content::-webkit-scrollbar { display: none; }		
		#imgBBoxList section.tag .tag_wrap .tag { width: 81px; margin: 10px 5px; line-height: 32px; background: #f4f7fc; border: 1px solid #d9d9d9; border-radius: 4px; text-align: center; font-size: 14px; font-weight: 300; color: #555; cursor: pointer; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; }
		#imgBBoxList section.tag .tag_wrap .tag.selected { background-color: #4c84ff; border-color: #2b65e6; color: #fff; box-shadow: 0 3px 4px 0 rgba(159, 189, 255, 0.7); }
		#imgBBoxList .hover_box {border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
		#imgBBoxList .hover_box div {font-family: Open_Sans; font-size: 13px; color: #555555;}
		#imgBBoxList .hover_div div {word-break: break-word; margin: 2px 5px; white-space: normal; font-weight: 300; font-family: Open_Sans;}			
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
               <div id="imgBBoxList" class="container-fluid">
                  <!-- Page Heading -->


                  <div class="card shadow mb-4 flex fs">

                <!-- Quick Training & Inference Btn area end -->                     
                     
                     <section class="enrichment">
	                  	<div class="header_wrap flex sb">
		                  	<div class="page_title_wrap">
		                  		<span>라벨 목록</span> <span>|</span>바운딩박스
	                  		</div>
	                  	</div>                     
                   		<div class="video_wrap flex tab-pane active" id="imgBBoxList-labeller" role="tabpanel" >
<!--                    			<div class="prev_btn prev_data"></div> -->
<!-- 							<div class="next_btn next_data"></div> -->
							
                   			<canvas class="canvas" id="imgBBoxList-canvas"></canvas>
                   			<!-- prog_bar start -->
                   			<div class="prog_bar flex justify-content-between hide">
                   				<div class="name_wrap ml-2">
                   					<div class="video_name font-weight-bold"></div>
                   				</div>
                   				
                   			</div><!-- prog_bar end -->
						</div> 
						
                 		<div class="img_list_wrap flex sb"> <!-- Image Slide area start -->
<!--                  			<div>Image Slide Section</div> -->
<!-- 							<div class="list_btn_wrap"> -->
<!--  								<div class="data_list_btn"></div>  -->
<!-- 							</div> -->

							<div class="name_wrap flex sb">
<!--                    				<div class="prev_btn prev_data"></div> -->
								<div class="file_name"></div>
<!-- 								<div class="next_btn next_data"></div>	 -->
							</div>
							
<!-- 							<div class="position_wrap"> -->
<!-- 	                 			<input type="text" class="position-value" value="1" onKeyPress="return checkNum2(event);" /> -->
<!-- 	                 			<div class="total_count"> / <span></span></div>							 -->
<!-- 							</div>							 -->
<!-- 	                 		<div class="data_list_wrap"> -->
<!-- 	                 			<div class="data_total">Total <span>0</span></div> -->
<!-- 								<div class="list_table"> -->
<!-- 									<div class="h_wrap flex"> -->
 	<!-- 									<div class="checkBox all" ></div> --> 
<!-- 										<div class="preview">미리보기</div> -->
<!-- 										<div class="id">ID</div> -->
<!-- 										<div class="path">PATH</div> -->
<!-- 										<div class="label_cnt">라벨S</div> -->
<!-- 									</div> -->
<!-- 									<ul class="c_wrap"> -->
<!-- 									</ul> -->
<!-- 									<div class="f_wrap flex"> -->
<!-- 										<div id="pagination" class="tui-pagination"></div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 	                 		</div>  -->
                 		</div>              <!-- Image Slide area end -->    						
		                <div class="save_btn_wrap flex">
                 			<button type="button" class="btn btn-primary save btn btn-primary">저장하기</button>
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
									<div class="label_title" data-cnt="0">라벨 (<span></span>)</div>
	<!--                					<div class="visible on"></div> -->
	<!-- 								<button type="button" class="btn btn-primary add">+ Add Label</button> -->
	                   			</div>
	                   			<div class="category_wrap flex fs"></div>
	<!--                    			<div class="tag_wrap flex">Label Group Tag Area (#label)</div> -->
	                   		</div><!-- label area end -->     
	                		<div class="paging_wrap flex filter_color">
	                			<div id="pagination" class="tui-pagination"></div>
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
			var that = imgBBoxList;

			// canvas init
			that.data.canvas = new fabric.Canvas('imgBBoxList-canvas',{
				selection : false,
				width : 800,
				height : 600,
				uniScaleTransform : true,
			});
			
			that.bind.evtOnceInit();
// 			imgBBox.init();
		    
		});
		
		const imgBBoxList = {
				pt: $("#imgBBoxList"),
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
						isModified : 0,
					},
					scaleFactor : {origWidth:0, origHeight:0, ratio:1, minBboxSize:0},
					
					meta : {},
					
// 					modifiedObj : {},
					
					colorHash : null,
					// initial canvas and canvas var end
					
					tag : [],
					
				}, // data end
				
				//init start
				datasetInit : function(dataset_id){
					const that = imgBBoxList;
					
					that.data.canvasObj['datasetId'] = null;
					that.data.canvasObj['datasetId'] = dataset_id;
					that.init(dataset_id);
				},				
				
				init : function(dataset_id,index) {
					const that = imgBBoxList;
// 					that.bind.evtOnceInit();
					that.computed.clearAllData();
					that.data.colorHash = new ColorHash();
					that.data.canvasObj['currDataNum'] = 1;
					
					// jh.sa 201015 : pagination
// 					that.pageKey = "imgBBox";
// 					sessionStorage.setItem(that.pageKey, 1);	
// 					$("#imgBBoxList .c_wrap .path").removeClass("active");
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
						this.objModifiedEvt();
						this.objScalingEvt();
// 						this.keydownEvt();
					},
					collision : function(player,canvas) {
						const that = imgBBoxList;
						
						
					}, //collision end
					
					downEvt : function() { // canvas rect mouse down event
						const that = imgBBoxList;
						that.data.canvas.on('mouse:down',function(o){
							var uuid = "";
							that.data.canvasObj.isDown = true;

							if($("#imgBBoxList .label_wrap .category_wrap .cate_wp.selected").length > 0){
								uuid = $("#imgBBoxList .label_wrap .category_wrap .cate_wp.selected")[0].id;
								that.data.canvasObj.freeDrawing = true;
							}
							
							var canv = that.data.canvas.getObjects();
					    	for(var i=0; i<canv.length; i++){
					    		if(canv[i]["uuid"] == uuid){
					    			$("#imgBBoxList .label_wrap .category_wrap .cate_wp").removeClass("selected");
					    			that.data.canvasObj.freeDrawing = false;
					    			return;
					    		}
					    	}
					    	
							if (that.data.canvasObj.freeDrawing == true && uuid != "" ) {
// 								var uuid = $("#imgBBoxList .label_wrap .category_wrap .cate_wp.selected")[0].id;
							    var pointer = that.data.canvas.getPointer(o.e);
							    
							    that.data.canvasObj.origX = pointer.x;
							    that.data.canvasObj.origY = pointer.y;
// 							    that.data.canvasObj.isDown = true;
							    if(that.data.canvasObj.isDown && $("#imgBBoxList .label_wrap .category_wrap .cate_wp.selected").length > 0) {

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
					
					moveEvt : function() { // canvas rect mouse move event
						const that = imgBBoxList;
						var data = that.data;
						var canvas = that.data.canvas;
						
						canvas.on('mouse:move', function(evt) {
							var tempRect = canvas.getActiveObject();
							
						    if (data.canvasObj.isDown == true && data.canvasObj.freeDrawing == true){
						    
								var pointer = canvas.getPointer(evt.e);
								var uuid = $("#imgBBoxList .label_wrap .category_wrap .cate_wp.selected")[0].id;
							    	
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
					
					upEvt : function() { // canvas rect mouse up event
						const that = imgBBoxList;
						var data = that.data;
						var meta = that.data.meta;
						var canvas = that.data.canvas;
						
						canvas.on('mouse:up', function(e) {
					    	
							if(e.target && canvas.getActiveObject() == e.target){
								$("#imgBBoxList .label_wrap .category_wrap .cate_wp").removeClass("selected");
								$("#imgBBoxList .label_wrap .category_wrap .cate_wp[id='"+e.target.uuid+"']").addClass("selected");
								let color = that.data.colorHash.rgb(e.target.uuid);
								$("#imgBBoxList .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
								$("#imgBBoxList .label_wrap .category_wrap .cate_wp[id='"+e.target.uuid+"'].selected ").css("border-color","rgb("+color+")");
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
							var minBboxSize = that.data.scaleFactor.minBboxSize;
							if(tempRect.width < minBboxSize){
								tempRect.set({width : minBboxSize});
								canvas.renderAll();
							}
							if(tempRect.height < minBboxSize){
								tempRect.set({height : minBboxSize});
								canvas.renderAll();
							}
							
							
							var uuid = $("#imgBBoxList .label_wrap .category_wrap .cate_wp.selected")[0].id;
							
							if(!e.target || e.target != tempRect){
								that.computed.saveMetaData(tempRect, uuid);
							}else{
								// jh.sa 201127 
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
								var labelBoxHeight = $("#imgBBoxList .label_wrap .category_wrap #"+uuid+"")[0].offsetTop;
								$("#imgBBoxList .label_wrap .category_wrap").animate({
									scrollTop:labelBoxHeight-60
								},500);
								
								// save meta
								that.computed.saveMetaData(tempRect, uuid);
						
								// draw crop img into label box
								
								// jh.sa 201021
// 								if(uuid == e.target.uuid){
// // 									console.log("modified target: ", e.target);
// 	 								that.data.modifiedObj[e.target.uuid] = that.data.meta[e.target.uuid];
// 	 								that.data.modifiedObj[e.target.uuid]["rectData"] = {
// 	 										top : e.target.top,
// 	 										left : e.target.left,
// 	 										width : e.target.width,
// 	 										height : e.target.height
// 	 								};
// 	 								console.log("modifiedObj: ", that.data.modifiedObj[e.target.uuid]);											
// 								}								
								
								
							}
// 							var newRect = that.computed.rescale(that.data.meta[uuid]['rectData'],true);
							// jh.sa 201022
							var newRect = that.computed.rescale(that.data.meta[uuid]['rectData'],"1");
							
							///////jh.sa 201021 추가추가//////
							that.data.meta[uuid]['rectData'] = newRect;
// 							that.render.renderCropImgIntoLabel(uuid,newRect[0]);
							that.render.renderCropImgIntoLabel(uuid,newRect);		// jh.sa 
							
							tempRect.setCoords();
						});
					},// canvas rect mouse up event end
					
					wheelEvt : function() {
						const that = imgBBoxList;
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
					
					objMovingEvt : function() {
						const that = imgBBoxList;
						var canvas = that.data.canvas;
						that.data.canvas.on("object:moving",function(evt){
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
					
					objModifiedEvt : function() {
						const that = imgBBoxList;
						var canvas = that.data.canvas;
						canvas.on("object:modified",function(evt){
							that.data.canvas.getActiveObject().lockScalingX = false;
							that.data.canvas.getActiveObject().lockScalingY = false;	
							that.data.canvas.getActiveObject().lockMovementX = false;
							that.data.canvas.getActiveObject().lockMovementY = false;
							
							/////////
// 							console.log("modified target: ", evt.target);
// 							that.data.modifiedObj[evt.target.uuid] = that.data.meta[evt.target.uuid];
// 							that.data.modifiedObj[evt.target.uuid]["rectData"] = {
// 									top : evt.target.top,
// 									left : evt.target.left,
// 									width : evt.target.width,
// 									height : evt.target.height
// 							};
// 							console.log("modifiedObj: ", that.data.modifiedObj[evt.target.uuid]);
							that.data.canvasObj['isModified'] = 1;
						});
					},
					
					objScalingEvt : function() {
						const that = imgBBoxList;
						var canvas = that.data.canvas;
						
						canvas.on("object:scaling",function(evt){
// 							$("#labeller-video .vjs-progress-control").hide();
							
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
									tempRect.set({
										width : Math.abs(tempRect.aCoords.tr.x - pointer.x),
										height : Math.abs(tempRect.aCoords.bl.y - pointer.y) 
									});
									evt.target.scaleX = tempRect.width / evt.target.width;
									evt.target.scaleY = tempRect.height / evt.target.height;
									break;
								case "mt":
									tempRect.set({
										width : Math.abs(tempRect.aCoords.tr.x - tempRect.aCoords.tl.x),
										height : Math.abs(tempRect.aCoords.br.y - pointer.y)
									});
									evt.target.scaleX = tempRect.width / evt.target.width;
									evt.target.scaleY = tempRect.height / evt.target.height;
									break;
								case "tr":
									tempRect.set({
										width : Math.abs(tempRect.aCoords.tl.x - pointer.x),
										height : Math.abs(tempRect.aCoords.br.y - pointer.y) 
									});
									evt.target.scaleX = tempRect.width / evt.target.width;
									evt.target.scaleY = tempRect.height / evt.target.height;
									break;
								case "bl":
									tempRect.set({
										width : Math.abs(tempRect.aCoords.br.x - pointer.x),
										height : Math.abs(tempRect.aCoords.tl.y - pointer.y) 
									});
									evt.target.scaleX = tempRect.width / evt.target.width;
									evt.target.scaleY = tempRect.height / evt.target.height;
									break;
								case "ml":
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
							
// 							if(tempRect.width < 40){
// 								tempRect.set({width : 40});
// 								evt.target.scaleX = tempRect.width / evt.target.width;
// 								tempRect.lockScalingX = true;
// 							}
							
// 							if(tempRect.height < 40){
// 								tempRect.set({height : 40});
// 								evt.target.scaleY = tempRect.height / evt.target.height;
// 								tempRect.lockScalingY = true;
// 							}
							if(tempRect.width < minBboxSize){
								tempRect.set({width : minBboxSize});
								evt.target.scaleX = tempRect.width / evt.target.width;
								tempRect.lockScalingX = true;
							}
							
							if(tempRect.height < minBboxSize){
								tempRect.set({height : minBboxSize});
								evt.target.scaleY = tempRect.height / evt.target.height;
								tempRect.lockScalingY = true;
							}
							
							
						});
						
					},
					
					keydownEvt : function() {
						const that = imgBBoxList;
						var canvas = that.data.canvas;
						var uuid = $("#imgBBoxList .category_wrap .cate_wp.selected").attr("id");
						
						// jh.sa save 버튼 단축키
						var isCtrl;		// ctrl, s 눌림 여부 확인
						$(document).off("keyup").on("keyup", function(evt){
							if(evt.keyCode == "83" && evt.ctrlKey == true){
				 				that.computed.submitMeta(uuid);
							}
						});						
						
						$(document).off("keydown").on("keydown",function(evt){
							// del evt
// 							if(evt.keyCode == "46"){
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
// 							// jh.sa save 버튼 단축키
// 							if (evt.keyCode == "17") isCtrl = true;
// 							if (evt.keyCode == "83" && isCtrl == true) {
// 								that.computed.insertMetaData();
// 							};				
							if(evt.keyCode == "46" || evt.keyCode == "68" && evt.ctrlKey == true){
								if(canvas.getObjects() == null){
									alert("바운딩 박스를 선택해 주세요.");
									return
								}
								var tmp = confirm("데이터를 삭제하시겠습니까?");
//		 						if(tmp == true && canvas.getActiveObject() != null){
								if(tmp == true && canvas.getObjects() != null){
//		 							var uuid = canvas.getActiveObject().uuid;
									var uuid = canvas.getObjects()[0].uuid;
									
									var dataId = $("#imgBBoxList .c_wrap .path.active").parent("li").attr("data-id");
//		 							var labelBox = $(this).parent().parent().attr("id",uuid);
									var labelBox = $("#imgBBoxList .category_wrap .cate_wp#"+uuid);
									if(uuid.indexOf("-") == -1){
										// call ajax
										that.computed.deleteMetaById(uuid, labelBox[0]);
									} else {
										// not call ajax
										that.computed.deleteMetaData(uuid, labelBox[0]);	
									}
//		 							delete that.data.meta[uuid];
									
									that.bind.keydownEvt();
									//
									labeller.bind.evtAll();							
								}								
							}
						});
						
					},
					
					keydownEvt2 : function(evt){
						const that = imgBBoxList;
						var canvas = that.data.canvas;
						
						evt.preventDefault();
// 						if(canvas.getActiveObject() == null){
						if(canvas.getObjects() == null){
							alert("바운딩 박스를 선택해 주세요.");
							return
						}
						var tmp = confirm("데이터를 삭제하시겠습니까?");
// 						if(tmp == true && canvas.getActiveObject() != null){
						if(tmp == true && canvas.getObjects() != null){
// 							var uuid = canvas.getActiveObject().uuid;
							var uuid = canvas.getObjects()[0].uuid;
							
							var dataId = $("#imgBBoxList .c_wrap .path.active").parent("li").attr("data-id");
// 							var labelBox = $(this).parent().parent().attr("id",uuid);
							var labelBox = $("#imgBBoxList .category_wrap .cate_wp#"+uuid);
							if(uuid.indexOf("-") == -1){
								// call ajax
								that.computed.deleteMetaById(uuid, labelBox[0]);
							} else {
								// not call ajax
								that.computed.deleteMetaData(uuid, labelBox[0]);	
							}
// 							delete that.data.meta[uuid];
							
							that.bind.keydownEvt();
							//
							labeller.bind.evtAll();							
						}							
						
					},
					
					sideEvtCollision : function(evt) {
						const that = imgBBoxList;
						// DOM Event
						$("#imgBBoxList .label_wrap input[name=label_name]").on("propertychange change keyup paste input", function(e) {
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
						
						$("#imgBBoxList .position-value").off("input").on("input", function(e){
							// 숫자
							if($(this).val().match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
								alert("영문과 특수문자 및 숫자만 입력 가능합니다");
							}
							
							const str = $(this).val().replace(/[^0-9 ]/gi,"");
		                    if(str.match(/[^0-9 ]/)){
									$(this).val(str.slice(0, -1));						
							} else {
									$(this).val(str);						
							}							
						});
						
						$("#imgBBoxList .label_wrap .btn_wrap .add").off("click").on("click",function(evt){
							var uuid = that.computed.generateUUID();
							var keys = Object.keys(that.data.meta);
							if(keys.length > 0){
								for(var i=0; i<keys.length; i++){
									if(keys[i] == uuid){
										uuid = that.computed.generateUUID();
									}
								}
							}
							
// 							var labelNo = eval($("#imgBBoxList .label_wrap .category_wrap").find(".cate_wp").length+1);
							
							var html = that.render.tempInitCategory(uuid);
							$("#imgBBoxList .label_wrap .category_wrap").append(html);
							
							let color = that.data.colorHash.rgb(uuid);
							$("#imgBBoxList .label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
							
							$("#imgBBoxList .label_wrap .category_wrap .cate_wp").removeClass("selected");
							$("#imgBBoxList .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
							$("#imgBBoxList .label_wrap .category_wrap .cate_wp").last().addClass("selected");
							$("#imgBBoxList .label_wrap .category_wrap .cate_wp[id='"+uuid+"'].selected ").css("border-color","rgb("+color+")");
							
							that.computed.initMetaData(uuid,labelNo);
							that.bind.sideEvtCollision();
						});
						
						// alert and meta data delete!!
						$("#imgBBoxList .label_wrap .category_wrap .cate_wp .delete").off("click").on("click",function(evt){
						
							var check = confirm("데이터를 삭제하시겠습니까?");
							if(check == true){
								let uuid = $(this).parent().parent().attr("id");
// 								var dataId = $(".data_item .collapse-item.active").attr("data-id");
								var dataId = $("#imgBBoxList .c_wrap .path.active").parent("li").attr("data-id");
								var labelBox = $(this).parent().parent().attr("id",uuid);
// 								that.computed.deleteMetaDataById(uuid,dataId);
								if(uuid.indexOf("-") == -1){
									// call ajax
									that.computed.deleteMetaById(uuid, labelBox[0]);
								} else {
									// not call ajax
									that.computed.deleteMetaData(uuid, labelBox[0]);
								}
							}
						});
						
						// jh.sa : meta data visibility
						$("#imgBBoxList .label_wrap .category_wrap .cate_wp .visible").off("click").on("click",function(evt){
							let uuid = $(this).parent().parent().attr("id");
							var canv = that.computed.getCanvasObject(uuid);
							var meta = that.data.meta;
							var l_all = $("#imgBBoxList .label_wrap .category_wrap .cate_wp .visible");
							var b_all = $("#imgBBoxList .label_wrap .btn_wrap .visible");
							
							if($(this).hasClass("on")){
								$(this).removeClass("on");
								$(this).addClass("off");
								that.data.canvas.remove(canv);
								
								var off = $("#imgBBoxList .label_wrap .category_wrap .cate_wp .visible.off");
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
								
								var on = $("#imgBBoxList .label_wrap .category_wrap .cate_wp .visible.on");
								if(on.length === l_all.length){
									b_all.removeClass("off");
									b_all.addClass("on");
								}
								
							}
						});		
						
						$("#imgBBoxList .label_wrap .btn_wrap .visible").off("click").on("click",function(evt){
							var label_visible = $("#imgBBoxList .cate_wp .visible");
							
							
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
						
						$("#imgBBoxList .category_wrap .cate_wp .category").off('keypress').on('keypress',function(evt){
							if(evt.keyCode == 13){
								var uuid = $(this).parent().parent().attr("id");
								that.data.meta[uuid]['category'] = $(this).val();
							}
						});
						
						// jh.sa add
						$("#imgBBoxList .category_wrap .cate_wp .category").off('input').on('input',function(evt){
							var uuid = $(this).parent().parent().attr("id");
							that.data.meta[uuid]['category'] = $(this).val();
						});						
						
						///////////////
						$("#imgBBoxList .category_wrap .cate_wp").off("click").on("click",function(){
							var uuid = $(this).attr("id");
							var color = that.data.colorHash.rgb(uuid);
							var path = $(this).data("path");
							var dataAddr = '/uploadFile/xlabeller/'+path;	
							
							that.pt.find(".empty_wrap").remove();
							that.pt.find("section.enrichment .canvas-container").show();
							$("#imgBBoxList .label_wrap .category_wrap .cate_wp").removeClass("selected");
							$("#imgBBoxList .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
							$("#imgBBoxList .img_list_wrap .name_wrap .file_name").html(path.split("/")[1]);
							$("#imgBBoxList .img_list_wrap .name_wrap .file_name").attr("title",path.split("/")[1]);
							$(this).addClass("selected");
							$(this).css("border-color","rgb("+color+")");
							
							if($(this).hasClass("selected")){
								that.computed.clearCanvas();
								$("#loader").show();
								that.computed.loadImage(dataAddr,uuid);
								that.data.canvas.discardActiveObject();
								var canvArr = that.data.canvas.getObjects();
								for(var i=0; i<canvArr.length; i++){
									if(canvArr[i]['uuid'] == uuid){
										that.data.canvas.bringToFront(canvArr[i]);
										that.data.canvas.setActiveObject(canvArr[i]);
									}
								}
							}
							

						});
						
						// jh.sa test 
						$("#imgBBoxList .save_btn_wrap .save").off("click").on("click",function(){	
							$(this).blur();
							///////////////////		
							var uuid = $("#imgBBoxList .category_wrap .cate_wp.selected").attr("id");
// 							that.computed.insertMetaData();
							that.computed.submitMeta(uuid);
						});
						
						
						//paging evt
						$("#imgBBoxList .data_item .prev_page").off("click").on("click",function(){
							var page_num =  $(".data_item.show .current_page .page-link").attr("tabindex")*1-2;
							if(page_num < 0 ){
								page_num = 0;
							}
// 							var dtCate = $(".data_item.show").attr("data-cate");
// 							var isInit = true;
							that.computed.clearAllData();
							that.computed.getVideoDataList(page_num);							
						});
						
						$("#imgBBoxList .data_item .next_page").off("click").on("click",function(){
							var page_num =  $(".data_item.show .current_page .page-link").attr("tabindex")*1;
// 							var dtCate = $(".data_item.show").attr("data-cate");
// 							var isInit = true;
							that.computed.clearAllData();
							that.computed.getVideoDataList(page_num);
						});
						
						$("#imgBBoxList .pagination .page-item input.page-link").off("keypress").on("keypress",function(evt){
							
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
						
						$("#imgBBoxList .data_list_btn").off("click").on("click", function(){
							var data_list_wrap = $("#imgBBoxList .data_list_wrap");
							if(data_list_wrap.hasClass("active")){
								data_list_wrap.removeClass("active");
								data_list_wrap.css("display", "none");	
							} else {
								data_list_wrap.addClass("active");
								data_list_wrap.css("display", "block");								
							}
						});
						
						// jh.sa : data list image preview
						$("#imgBBoxList .c_wrap .preview .img_preview").off("mouseenter").on("mouseenter", function(){
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
					        const path = $(this).parents("li").find(".path").text();
					        
					        $("#imgBBoxList .show_img_wrap .title").text(id);
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
							};
							imgObj.onerror = function(){
								hideLoading(".show_img_wrap");
							};	
					        
						});
						
						$("#imgBBoxList .c_wrap .preview .img_preview").off("mouseleave").on("mouseleave", function(){
							that.pt.find(".show_img_wrap").remove();
						});						

						// k.park 201015
						$("#imgBBoxList .img_list_wrap .data_list_wrap .list_table ul li .path").off("click").on("click",function(){
							var data_num = $(this).parent().attr("data-index")*1-1;
							var page_size=50;
							var currPage = $("#imgBBoxList #pagination .page-item.active .page-link").html()*1-1;
							var currDataNum = currPage*page_size + data_num;
							that.computed.initImgData(currDataNum);
						});
						

						$("#imgBBoxList #pagination .first").off("click").on("click",function(){
							that.computed.clearAllData();
							var page_num = 0;
// 							that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
							that.computed.getLabelDataByDatasetId(page_num, that.data.canvasObj['datasetId']);
						});
						$("#imgBBoxList #pagination .prev").off("click").on("click",function(){
							var page_size = 50;
							var page_num = $("#imgBBoxList #pagination .page-item.active .page-link").html()-2;
							if(page_num<0){
								alert("첫 페이지 입니다.");
								return false;
							}
							that.computed.clearAllData();
// 							that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
							that.computed.getLabelDataByDatasetId(page_num, that.data.canvasObj['datasetId']);
						});
						$("#imgBBoxList #pagination .page-link").off("click").on("click",function(){
							if( isNaN($(this).html()) == false){
								var page_num = $(this).html()*1-1;
								that.computed.clearAllData();
// 								that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
								that.computed.getLabelDataByDatasetId(page_num, that.data.canvasObj['datasetId']);
							}
						});
						$("#imgBBoxList #pagination .next").off("click").on("click",function(){
							var page_size = 50;
							var page_num = $("#imgBBoxList #pagination .page-item.active .page-link").html();
// 							var lastPage = Math.floor($("#imgBBoxList .label_title span").html()*1/page_size);
							var lastPage = Math.floor($("#imgBBoxList .label_wrap .label_title").data("cnt")*1/page_size);
							if(page_num>lastPage){
								alert("마지막 페이지 입니다.");
								return false;
							}
							
							var page = $("#imgBBoxList .label_wrap .label_title").data("cnt")*1/page_size;
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
						$("#imgBBoxList #pagination .last").off("click").on("click",function(){
							var page_size = 50;
							
// 							var page_num = Math.floor($("#imgBBoxList .label_title span").html()*1/page_size);
							var page_num = Math.floor($("#imgBBoxList .label_wrap .label_title").data("cnt")*1/page_size);
// 							that.computed.getVideoDataList(page_num,that.data.canvasObj['datasetId']);
// 							that.computed.clearAllData();
// 							that.computed.getLabelDataByDatasetId(page_num, that.data.canvasObj['datasetId']);
							
							var page = $("#imgBBoxList .label_wrap .label_title").data("cnt")*1/page_size;
							if(page == page_num){
								that.computed.clearAllData();
								that.computed.getLabelDataByDatasetId(page_num-1, that.data.canvasObj['datasetId']);
							} else {
								that.computed.clearAllData();
								that.computed.getLabelDataByDatasetId(page_num, that.data.canvasObj['datasetId']);
							}							
							
						});
						
						$("#imgBBoxList .prev_data").off("click").on("click",function(){
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
						$("#imgBBoxList .next_data").off("click").on("click",function(){
							var currDataNum = that.data.canvasObj['currDataNum']*1;
							var page_size = 50;
							var total_size = $("#imgBBoxList .position_wrap .total_count span").html()*1;
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
						
						$("#imgBBoxList .img_list_wrap .name_wrap .prev_btn").off("click").on("click",function(){
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
						$("#imgBBoxList .img_list_wrap .name_wrap .next_btn").off("click").on("click",function(){
							var currDataNum = that.data.canvasObj['currDataNum']*1;
							var page_size = 50;
							var total_size = $("#imgBBoxList .position_wrap .total_count span").html()*1;
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
						
						$("#imgBBoxList .position-value").off("keypress").on("keypress",function(evt){
							if(evt.keyCode == "13"){
								var page_size = 50;
								var targetDataNum = $(this).val()*1-1;
								var targetPageNum = Math.floor(targetDataNum*1/page_size*1)+1;
								var currPageNum = $("#imgBBoxList #pagination .page-item.active .page-link").html();
								var total_size = $("#imgBBoxList .position_wrap .total_count span").html()*1;
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
                        const that = imgBBoxList;
                        $("#imgBBoxList .category_wrap").html("");
                        $("#imgBBoxList .img_list_wrap .name_wrap .file_name").html("");
                        $("#imgBBoxList .empty_wrap").remove();
                        const html = '<div class="empty_wrap"><div class="no_image"></div><div class="eng_text">선택된 데이터가 없습니다.</div><div class="kor_text">데이터를 선택해주세요.</div></div>';
                        that.pt.find("section.enrichment .canvas-container").hide();
                        that.pt.find("section.enrichment .video_wrap").append(html);
                    },					
					
                    resetEnrichView : function(){
                    	const that = imgBBoxList;
                    	
                        $("#imgBBoxList .img_list_wrap .name_wrap .file_name").html("");
                        $("#imgBBoxList .empty_wrap").remove();
                        const html = '<div class="empty_wrap"><div class="no_image"></div><div class="eng_text">선택된 데이터가 없습니다.</div><div class="kor_text">데이터를 선택해주세요.</div></div>';
                        that.pt.find("section.enrichment .canvas-container").hide();
                        that.pt.find("section.enrichment .video_wrap").append(html);                    	
                    },
					
				},// bind end
				computed : {
					root : null,
					initRect : function(uuid,obj) { //create new rect data
						// obj => {top/left/width/height}
						const that = imgBBoxList;
						var tempRect = {};
						tempRect = new fabric.Rect( obj );
						
						that.data.canvas.add(tempRect);
						that.data.canvas.setActiveObject(tempRect);
						that.data.canvas.renderAll();
					},
					
					// k.park 20201013
					initMetaRect : function(uuid,newRect) { // from Server Data, initiate meta rect data
						const that = imgBBoxList;
						var meta = that.data.meta;
						var rectObj;
						
						if(!uuid){
							return false;
						}
						
						if(!newRect){
							rectObj = this.getRectObject(uuid,meta[uuid]['rectData']);
						} else {
							rectObj = this.getRectObject(uuid,newRect);
						}
						
						var tempRect = new fabric.Rect( rectObj );	
						that.data.canvas.add(tempRect);
						
					}, //init rect data end
					
					deleteMetaObject : function(uuid, btn){
						const that = imgBBoxList;
						
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
					getRectObject : function(uuid,rectData) {
						const that = imgBBoxList;
						var scaleRatio = that.data.scaleFactor.ratio;
						var object = {};
							object = {
									left : rectData.left,
									top : rectData.top,
									width : rectData.width,
									height : rectData.height,
									uuid : uuid,
//	 								stroke : "rgb("+that.data.colorHash.rgb(meta.uuid)+")",
//	 						        fill: "rgb("+that.data.colorHash.rgb(meta.uuid)+",0.2)",
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
//	 						        cornerColor : "rgb("+that.data.colorHash.rgb(meta.uuid)+")",
							        cornerColor : "rgb("+that.data.colorHash.rgb(uuid)+")",
							        cornerSize : 10,
							}							

						
						return object;	
					},
					
					getRectObject2 : function(meta) {
						const that = imgBBoxList;
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
						const that = imgBBoxList;

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
					// k.park 20201013
					initMetaData : function(uuid,labelNo) {
						const that = imgBBoxList;
						
						that.data.meta[uuid] = {
							id : uuid,
							category : null,
						};
						
					},// create meta data end
					
					clearAllData : function(){
						const that = imgBBoxList;
						that.data.scaleFactor = {origWidth:0, origHeight:0, ratio:1};
						that.data.canvasObj.isModified = 0;
						this.clearCanvas();
						this.clearMeta();
						this.clearRect();
					},
					
					clearCanvas : function(){
						const that = imgBBoxList;
						that.data.canvasObj['currDataNum'] = null;
						that.data.canvas.clear();
					},
					
					clearMeta : function(){
						const that = imgBBoxList;
						that.data.meta = {};
					},
					
					clearRect : function(){
						const that = imgBBoxList;
						that.data.rect = {};
					},
						
					/*
					*  get Video Data List
					*/
					// k.park 20201013
					getVideoDataList : function(page,dataSet,currDataNum){
						const that = imgBBoxList;
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
						const that = imgBBoxList;
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
										$("#imgBBoxList .label_wrap .label_title span").html(total_size);
										$("#imgBBoxList .label_wrap .label_title").data("cnt",total_size);
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
						const that = imgBBoxList;
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
					getMetaByDataId : function(dataId){
						const that = imgBBoxList;
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
// 							var temp = [];
							var result = data.result.data;
							
// 							that.render.initMetaFromData(result);
							
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
					insertMetaData : function(){
						const that = imgBBoxList;
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
						
						for(var i=0; i<keys.length; i++){
							if(!meta[keys[i]]['rectData']){
								alert("바운딩박스를 그려주세요.");
								return false;
							}
							if(meta[keys[i]]['category'] == ""){
								alert("라벨명을 입력해주세요.")
								return false;
							}
							var temp = that.computed.rescale(meta[keys[i]]['rectData'],true);
							// 수정 예정 -> for문 확인
							var tmpRect = temp['left']+','+temp['top']+','+temp['width']+','+temp['height'];
							data.push({
								meta_id : meta[keys[i]]["id"],
								label : meta[keys[i]]['category'],
								info : tmpRect,	
							});
							
						}
						$("#loader").show();
						var ajaxData = {
							label_type : "IMAGE_BBOX",
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
					 
					
					submitMeta : function(uuid) {
						const that = imgBBoxList;
// 						var mObj = that.data.modifiedObj;
						var meta = that.data.meta;
// 						var keys = Object.keys(mObj);
						var data = [];
						
						const ajaxData = {
								data_id : 2,
								stay_flag : 2,
								info : [],
							}						
						$("#loader").show();
// 						for(var i=0; i<keys.length; i++){
// 							var temp = that.computed.rescale(meta[uuid]['rectData'],"2");
// 							var dataId = $("#imgBBoxList .cate_wp#"+uuid).data("id");
// 							var labelType = $("#imgBBoxList .cate_wp#"+uuid).data("type");
							
// 							ajaxData.info.push({
// 								data_id : dataId+"",
// 								width: temp['width']+"",
// 								height: temp['height']+"",
// 								left: temp['left']+"",
// 								top: temp['top']+"",
// 								label: meta[keys[i]]["category"]+"",
// 								label_type : labelType+"",
// 								meta_id : meta[uuid]["id"],
// 							});							
// 						}		
						that.computed.checkRectData(meta[uuid]['rectData']);
						
						var temp = that.computed.rescale(meta[uuid]['rectData'],"2");
						var dataId = $("#imgBBoxList .cate_wp#"+uuid).data("id");
						var labelType = $("#imgBBoxList .cate_wp#"+uuid).data("type");
						
						ajaxData.info.push({
							data_id : dataId+"",
							width: temp['width']+"",
							height: temp['height']+"",
							left: temp['left']+"",
							top: temp['top']+"",
							label: meta[uuid]["category"]+"",
							label_type : labelType+"",
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
									var page_num = $("#imgBBoxList #pagination .page-item.active .page-link").html()*1-1;
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
						const that = imgBBoxList;
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
						const that = imgBBoxList;
						var canvas = that.data.canvas;
						var tmpObj = {};
						var tmpImage = new Image();
						var meta = that.data.meta;
						
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
// 								var newRect = that.computed.rescale(meta[uuid]['rectData']);
								// jh.sa 201022
								var newRect = that.computed.rescale(meta[uuid]['rectData'],"0");

								
								that.computed.initMetaRect(uuid, newRect);
								$("#loader").hide();
								// k.park 20201013
// 								that.computed.getMetaByDataId(canvas.dataId);		// jh.sa 임시로 막아둠
							});
							
							canvas.imgInfo = tmpImage;
							
						}
					},				
					
					// gap between real video size and web page
					getScaleFactor : function(imgObj){
						const that = imgBBoxList;
						var minBboxSize = 10;
// 						var imgObj = this.checkImageSize(dataAddr);
						// 실제 비디오 크기 기준
						// scaleFactor > 1 : 실제 비디오가 캔버스 크기보다 큼
						// scaleFactor < 1 : 실제 비디오가 캔버스 크기보다 작음
						that.data.scaleFactor.origWidth = imgObj['width'];
						that.data.scaleFactor.origHeight = imgObj['height'];
						that.data.scaleFactor.ratio = $("#imgBBoxList-canvas").width() / that.data.scaleFactor.origWidth;
						that.data.scaleFactor.minBboxSize = that.data.scaleFactor.ratio * minBboxSize;
						
					}, // scalefactor end
					
					// re-size rect on canvas
					// jh.sa 201022 
					rescale : function(rectData,isSave){
						const that = imgBBoxList;
						var scaledRatio = that.data.scaleFactor.ratio;
						var tempData = [];
						
						if(isSave == "0"){
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
						}else if (isSave == "1"){
							tempData = {};
							tempData.top = rectData.top/scaledRatio;
							tempData.left = rectData.left/scaledRatio;
							tempData.width = rectData.width/scaledRatio;
							tempData.height = rectData.height/scaledRatio;

// 							tempData.top = rectData.top;
// 							tempData.left = rectData.left;
// 							tempData.width = rectData.width;
// 							tempData.height = rectData.height;
							
// 							for(var i=0; i<rectData.length; i++){
// 								tempData[i] = {};
// 								tempData[i].top = rectData[i].top/scaledRatio;
// 								tempData[i].left = rectData[i].left/scaledRatio;
// 								tempData[i].width = rectData[i].width/scaledRatio;
// 								tempData[i].height = rectData[i].height/scaledRatio;
// 								tempData[i].status = rectData[i].status;
// 							}
						} else {
							tempData = {};
							tempData.top = rectData.top;
							tempData.left = rectData.left;
							tempData.width = rectData.width;
							tempData.height = rectData.height;							
						}
						
						
						return tempData;
						
					}, // re-size rect on canvas end
					
					// jh.sa : rescale temp base image
					
					rescaleTempImg : function(img,w,h){
						const that = imgBBoxList;
						
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
// 						$("#imgBBoxList #imgBBoxList-labeller").height(img.naturalHeight*scaleFactor);						
					},					
					
					// save rect all data
					// k.park 20201013
					saveMetaData : function(newRect,uuid){
						window.getSession();
						const that = imgBBoxList;
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
						meta[uuid].category = $("#imgBBoxList .category_wrap [id="+uuid+"] .category").val();
						
					},	
					
					// k.park 201015
					deleteMetaData : function(uuid,labelBox){
						const that = imgBBoxList;
						if(!uuid){
							return false;
						}
						labelBox.remove();
						delete that.data.meta[uuid];
						var canv = that.computed.getCanvasObject(uuid);
						that.data.canvas.remove(canv);
						
						// jh.sa 210129 length 0 일때 처리 필요
						if($("#imgBBoxList .category_wrap .cate_wp").length == 0){
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
						const that = imgBBoxList;
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
                        const that = imgBBoxList;           
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
                    
                    
					// jh.sa 210226 tag
					getLabelGroup : function(datasetId){
						const that = imgBBoxList;
						
						var tagset = [];
						var ajaxData = {
							dataset_id : datasetId		
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
									console.log("이 데이터셋의 라벨 태그: ",tagset);
									that.render.drawTagset(tagset);
									$("#imgBBoxList .label_wrap .label_title span").html(tagset.length);
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
						const that = imgBBoxList;
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
						const that = imgBBoxList;
						var totalPage = Math.ceil(total_size * 1 / page_size);
						
						if($("#imgBBoxList #pagination").data("twbs-pagination")){
							$("#imgBBoxList #pagination").twbsPagination('destroy');
						}
						$("#imgBBoxList #pagination").twbsPagination({
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
// 						that.render.drawDataList(data,total_size);
						that.render.initMetaFromData(data);
					},					
					
					/*
					* drawDataList
					*/
					drawDataList : function(data, total_size){
						const that = imgBBoxList;
						
						var total = $("#imgBBoxList .data_list_wrap .data_total span");
						var target = $("#imgBBoxList .list_table .c_wrap");
						var html = "";
						
						total.html(total_size);
						target.html("");
						for(var i=0; i < data.length; i++){
							html += "<li class='flex' data-id='" + data[i].data_id + "' data-index='" + (i+1) + "'>";	// (i+1) 부분은 수정필요
							html += " <div class='preview'><div class='img_preview'></div></div>";
							html += " <div class='id'>" + data[i].data_id + "</div>";
							html += " <div class='path'>" + data[i].path + "</div>";
							// k.park 201015
							html += " <div class='label_cnt'>" + data[i]['meta_cnt'] + "</div>";
							html += "</li>";
						}
						
						target.append(html);
					},				
					
					renderImageByData : function(data,total_size){
						const that = imgBBoxList;
						
						
						that.data.canvas['dataId'] = data['data_id'];
						var dataAddr = '/uploadFile/xlabeller/'+data.path;
						
// 						$("#imgBBoxList .prog_bar .name_wrap .video_name").html(data['filename']);
						$("#imgBBoxList .img_list_wrap .name_wrap .file_name").html(data['filename']);
						$("#imgBBoxList .img_list_wrap .name_wrap .file_name").attr("title",data['filename']);
						$("#imgBBoxList .list_table .c_wrap .path").removeClass("active");
						$("#imgBBoxList .list_table .c_wrap [data-id='"+data['data_id']+"'] .path").addClass("active");
						$("#imgBBoxList .list_table .c_wrap [data-id='"+data['data_id']+"'] .label_cnt").html(data['meta_cnt']);
						$("#imgBBoxList .position_wrap .position-value").val(that.data.canvasObj['currDataNum']);
						
						if(total_size){
							$("#imgBBoxList .position_wrap .total_count span").html(total_size);
						}
						
//							that.computed.adjustVideoSrc(dataAddr,fps);
						that.render.adjustArea();
						that.computed.loadImage(dataAddr);
						that.render.checkWindowWidth();
						that.bind.sideEvtCollision();
						
					},					
			
					
					// function move rect
					moveRectOnCanvas : function(uuid,arrNum){
						const that = imgBBoxList;
						
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
					initMetaFromData : function(result){
						const that = imgBBoxList;
						var meta = that.data.meta;
						var keys = [];
						var dataObj = {};
						
						$("#imgBBoxList .label_wrap .category_wrap").empty();
						
						for(let i=0; i<result.length; i++){
							
							var tmpRectData = {
								left:result[i].info.split(",")[0],
								top:result[i].info.split(",")[1],
								width:result[i].info.split(",")[2],
								height:result[i].info.split(",")[3],
							}
// 							var rectData = that.computed.rescale(tmpRectData);
							// jh.sa 201022
							var rectData = that.computed.rescale(tmpRectData,"0");
							
							
							meta[result[i]['meta_id']] = {
								id : result[i]['meta_id'],
								rectData : rectData,
								category : result[i]['label']
							}
							keys.push(result[i]['meta_id']);
							
							
							/////
							dataObj[result[i]['meta_id']] = {
									id : result[i]['meta_id'],
									data_id : result[i]['data_id'],
									path : result[i]['path'],
									label_type : result[i]['label_type']
							};
							
						};
						
						for(var i=0; i<keys.length; i++){
// 							that.computed.initMetaRect(keys[i]);				// jh.sa 임시로 막아둠 
						}
						
						
						
						that.render.renderCate(dataObj);
						$("#imgBBoxList .label_wrap .category_wrap .cate").removeClass("selected");
						$("#imgBBoxList .label_wrap .category_wrap .cate").last().addClass("selected");
						
					},					
					
					// in labeller tab
					// k.park 20201013
					// jh.sa 201021 수정 
					tempInitCategory : function(uuid, data){
						const that = imgBBoxList;
						if(!data){
							var html = '<div class=" cate_wp  " id="'+uuid+'">';
							html += '	<div class="cate_header col-12 flex sb p-1">';
							html += '		<div class="color  "></div>';
//	 						html += '       <div class="visible on"></div>';							// jh.sa
							html += '		<button class="delete btn btn-danger ">삭제</button>';
							html += '	</div>';
							html += '	<div class="w-100"></div>';
							html += '	<div class="col-12 text-center p-1">';
							html += '		<input type="text" class="form-control category " name="label_name" onkeyUp="noKor(event);noSpaceForm(this);" onchange="noSpaceForm(this); />';
							html += '	</div>';
							html += '	<div class="col-12 text-center p-1 crop_wrap"><canvas class="crop_img"></canvas></div>';
							
							html += '</div>';							
						} else {
							var html = '<div class=" cate_wp  " id="'+uuid+'" data-id="'+data.data_id+'" data-type="'+data.label_type+'" data-path="'+data.path+'">';
							html += '	<div class="cate_header col-12 flex sb p-1">';
							html += '		<div class="color  "></div>';
//	 						html += '       <div class="visible on"></div>';							// jh.sa
							html += '		<button class="delete btn btn-danger ">삭제</button>';
							html += '	</div>';
							html += '	<div class="w-100"></div>';
							html += '	<div class="col-12 text-center p-1">';
							html += '		<input type="text" class="form-control category " name="label_name" onkeyUp="noKor(event);noSpaceForm(this);" onchange="noSpaceForm(this); />';
							html += '	</div>';
							html += '	<div class="col-12 text-center p-1 crop_wrap"><canvas class="crop_img"></canvas></div>';
							
							html += '</div>';							
						}

						
						return html;
					},					
					
					// render crop Image from canvas into the Label Box(category_wrap)
					renderCropImgIntoLabel : function(uuid,newRect, imgObj){		// 좌표값,
						const that = imgBBoxList;
						var scaleRatio = that.data.scaleFactor.ratio;

						var pt = $("#imgBBoxList .label_wrap .category_wrap .cate_wp[id="+uuid+"]").find(".crop_img");	// canvas
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
						if(!imgObj){
							ctx.drawImage(that.data.canvas.imgInfo,newRect.left,newRect.top,newRect.width,newRect.height,0,0,newWidth,newHeight);						
						} else {
							ctx.drawImage(imgObj,newRect.left,newRect.top,newRect.width,newRect.height,0,0,newWidth,newHeight);						
						}

					},
					
					// k.park 20201013
					renderCate : function(data) { //drawing category from meta in imgBbox tab
						const that = imgBBoxList;
						var meta = that.data.meta;
						var metaKeys = Object.keys(meta);
						var dataKeys = Object.keys(data);
						
						if(dataKeys.length == metaKeys.length){
							for(var i=0; i<metaKeys.length; i++){
								if(dataKeys[i] == metaKeys[i]){
									var uuid = meta[metaKeys[i]]['id'];
									var dataInfo = data[dataKeys[i]];
									
									let html = that.render.tempInitCategory(uuid, dataInfo);
									$("#imgBBoxList .label_wrap .category_wrap ").append(html);
									
// 									var newRect = that.computed.rescale(meta[uuid]['rectData'],true);	
									// jh.sa 201022
									var newRect = that.computed.rescale(meta[uuid]['rectData'],"1");							

									that.render.drawImageBox(newRect, uuid);

//		 							that.render.renderCropImgIntoLabel(uuid,newRect);			// jh.sa 임시로 막음
									
									let color = that.data.colorHash.rgb(uuid);
									$("#imgBBoxList .label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
									$("#imgBBoxList .label_wrap .category_wrap [id='"+uuid+"'] .category").val(meta[metaKeys[i]]['category']);									
								}
							}							
						}
						
						that.bind.sideEvtCollision();
					
					}, // drawing category from meta end in imgBbox tab
					
					drawImageBox : function(newRect, uuid) {
						const that = imgBBoxList;
						
						that.pt.find(".cate_wp#"+uuid).each(function(){
							var box = $(this);
							var cur_id = $(this).attr("id");
							var path = $(this).data("path");
							var imgObj = new Image();
							imgObj.src = "/uploadFile/xlabeller/" + path;
							imgObj.onload = function(){
								var canvas_hover = box.find("canvas")[0];
								canvas_hover.id = cur_id;
								that.render.renderCropImgIntoLabel(cur_id, newRect, imgObj);
							}
						});
					},
					
					crop : function(canvas_hover,imgObj, xx, yy, ww, hh, newRect) {
						let that = imgBBoxList;
						var ctx = canvas_hover.getContext("2d");			
//			 			hideLoading(".show_img");	    	
				    	var w = ww;
				    	var h = hh;
				    		
				    	var dw = 0;
				    	var dh = 0;
				    		
				    	var g_w = 180;
				    	var g_h = 105;
				    	
				    	var fw = w/g_w;
				    	var fh = h/g_h;
				    	
				    	if(fw >= fh){
				    		dw = w / fw;
				    		dh = h / fw;
				    	}else{
				    		dw = w / fh;
				    		dh = h / fh;
				    	}
				    	canvas_hover.width = dw;
				    	canvas_hover.height = dh;

						ctx.clearRect(0, 0, canvas_hover.width, canvas_hover.height);
						ctx.drawImage(imgObj, xx, yy, ww, hh,0,0, dw,dh);
			        },					
					
					adjustArea : function(){
						const that = imgBBoxList;
						var scaleFactor = that.data.scaleFactor;
						
						var scaledHeight = scaleFactor.origHeight * scaleFactor.ratio;
// 						var progBarHeight = $(".prog_bar").height();
						var progBarHeight = 157;
						var headerHeight = 67*1;
						// video area height
// 						$("#labeller-video").css("height",scaledHeight);
						$("#imgBBoxList .enrichment").css("height",scaledHeight*1+progBarHeight+headerHeight);
						
						// video area height
// 						$("#labeller-video").css("height",scaledHeight);
						// canvas init and adjust height
// 						that.data.canvas.setHeight(scaledHeight-progBarHeight);
// 						that.data.canvas.setHeight(scaledHeight);
// 						// search area height
// 						$(".cate_search_wrap .content_wp").css("height",scaledHeight-progBarHeight);
						
		 				// category area height
// 						$("#imgBBoxList .label_wrap ").css("height",$("#labeller-video")[0].clientHeight);
// 						$("#imgBBoxList .label_wrap .category_wrap").css("height",$("#labeller-video")[0].clientHeight-progBarHeight-10);
						
					},
					
					checkWindowWidth : function(){
						var bodyWidth = $("body").width();
						if(bodyWidth <= 1440){
							$(".labeller_container .label_wrap").css("width","200px");
						}
					},
					
					// jh.sa 210226 tag
					drawTagset : function(tags,isDel){
						const that = imgBBoxList;
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
						const that = imgBBoxList;

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
						const that = imgBBoxList;
						elem.find(".hover_box").remove();
					},										
					
				},// draw something end
				
		};
		
		
	  </script>		
   </body>
</html>
