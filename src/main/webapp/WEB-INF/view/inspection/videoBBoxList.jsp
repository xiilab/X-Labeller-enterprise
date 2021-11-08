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
	    
	    #videoBBoxList a.next_page,a.prev_page { cursor:pointer; }
	    #videoBBoxList .pagination input.page-link { height:30px; width:30px; padding:0 0 0 8px; }
      	#videoBBoxList .tab_wrap { width:180px; }
       	#videoBBoxList a.disabled { color:#e74a3b !important; pointer-events: none; } 
	    #videoBBoxList .labeller_container { 
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
      	
/*       	#videoBBoxList .tab-pane{ */
/*       		position:relative;   */
/* 			width: calc(100% - 200px); */
/* 			height: calc(100% - 198px); */
/*       		flex-shrink:0; */
/*       		border-bottom: 0; */
/*       		margin: 0 auto; */
/*       		margin-top: 25px; */
/*       	} */
      	
/* 		#videoBBoxList .tab-pane { */
/* 		    position: relative; */
/* 		    width: 1024px; */
/* 		    height: auto; */
/* 		    flex-shrink: 0; */
/* 		    margin: 0 auto; */
/* 		}   	 */
		#videoBBoxList .tab-pane {
		    position: relative;
		    width: 800px;
		    height: auto;
		    flex-shrink: 0;
		    margin: 0 auto;
/* 		    min-height: 600px; */
		}   	
      	#videoBBoxList .header_wrap { margin-bottom: 42px; }
      	#videoBBoxList .tab-pane.cate_search_wrap {
/*       		border:1px solid #eeeeee; */
/*       		border-radius : 10px; */
      	}
      	#videoBBoxList .cate_search_wrap { border:1px solid #eeeeee; }
      	#videoBBoxList .cate_search_wrap .content_wp .content_header .content_title { cursor:pointer; }
      	#videoBBoxList .cate_search_wrap .search_cate { width:50%; }
      	
      	#videoBBoxList .cate_search_wrap .search_wp .search_wrap .search_cate_list { cursor:pointer; }
      	#videoBBoxList .cate_search_wrap .search_wp .search_wrap .search_cate_list:hover { color:red; }
      	#videoBBoxList .cate_search_wrap .search_wp .search_wrap { position:absolute; width:50%; max-height:500px; overflow:scroll; background-color:#f8f9fc; z-index:100;  }
      	
      	#videoBBoxList .search_all_wp .search_all_wrap { position:absolute; /* width:50%; */ max-height:500px; overflow:scroll; background-color:#f8f9fc; z-index:100;  }
      	#videoBBoxList .search_all_wp .search_all_wrap .search_cate_list { cursor:pointer; }
      	#videoBBoxList .search_all_wp .search_all_wrap .search_cate_list:hover { color:red; }
      	
      	#videoBBoxList .cate_search_wrap .content_wp { overflow:scroll; }
      	#videoBBoxList .cate_search_wrap .content_wp.active { height:auto; }
      	#videoBBoxList .cate_search_wrap .content_wp .content .cate_2,.cate_3 { cursor:pointer; }
/*       	.cate_search_wrap .content_wp .content .cate_2.active,.cate_3.active { font-weight:bold; } */
/*       	.cate_search_wrap .content_wp .content .cate_2:hover,.cate_3:hover { color:red; } */

		#videoBBoxList .cate_search_wrap .content_wp .content .cate_2.active,.cate_3.active { font-weight:bold; background-color:#eeeeee !important; color:black !important; }
		#videoBBoxList .cate_search_wrap .content_wp .content .cate_2:hover,.cate_3:hover { color:red !important; }
		#videoBBoxList .cate_search_wrap .content_wp .content .cate_wrap_3 { background-color:#eeeeee; }
		
      	
      	#videoBBoxList .label_wrap { 
       		position:relative;  
/*       		width:420px;  */
			width: 100%;
      		height:auto; 
/*       		border: 1px solid #eeeeee;  */
/*       		margin-left:20px;  */
/*       		border-radius:0.35rem;  */
      		flex-shrink:0;
      	}
    	#videoBBoxList .video_wrap .canvas { width: 800px; height:auto; position:absolute !important; }  
/*        	#videoBBoxList .video_wrap .canvas { width:1024px; height:auto; position:absolute !important; }   */
       	#videoBBoxList .video_wrap .video { /* width:1024px; */  /*height:auto;*/ width: 100%;  position:absolute !important; }  
       	
      	#videoBBoxList .video_wrap .video .video_js { position:absolute; }
      	#videoBBoxList .video_wrap .video .vjs-control-bar { display: flex; height:40px; bottom:-40px;}
      	#videoBBoxList .video_wrap .video .vjs-big-play-button { display:none; }
      	#videoBBoxList .video_wrap .prog_bar { border:1px solid #eeeeee; width:100%; height: 60px; position: absolute; margin-top:40px; bottom: -62px; background-color: #f8f8f8; }
      	#videoBBoxList .video_wrap .prog_bar > div { color:#020b44; }
		#videoBBoxList .video_wrap .prog_bar .btn_wrap { width: 40%; margin-top:0; }
/*       	.video_wrap .prog_bar .btn { color:#020b44; border-radius:50%; } */
      	#videoBBoxList .video_wrap .prog_bar input.curr_frame { width:70px; height:15px; margin-right:0px; padding: 11px 10px; box-sizing: border-box; }
      	#videoBBoxList .video_wrap .prog_bar .save_btn_wrap { width:260px; }
      	#videoBBoxList .video_wrap .frame_wrap { justify-content: center; font-size: 12px; }
      	
		#videoBBoxList .img_list_wrap .btn_wrap { width: 40%; margin-top:0; }
/*       	.video_wrap .prog_bar .btn { color:#020b44; border-radius:50%; } */
      	#videoBBoxList .img_list_wrap input.curr_frame { width:70px; height:15px; margin-right:0px; padding: 11px 10px; box-sizing: border-box; }
      	#videoBBoxList .img_list_wrap .frame_wrap { justify-content: center; font-size: 12px; }      	
      	
      	#videoBBoxList .btn-outline-primary { display: inline-block; font-weight: 400; text-align: center; cursor: pointer; vertical-align: middle; border: 1px solid #e0e0e0; border-radius: 0.35rem; width: 70px; margin: 0 4px; }
      	#videoBBoxList i.fa { margin-right: 0; }
      	
      	#videoBBoxList .label_wrap .btn_wrap { margin:0; padding-bottom: 1px; border-bottom: 1px solid #eee; }
/*       	.label_wrap .btn_wrap > div { width:100%; margin:0;  cursor:pointer; } */
      	@media (min-height:960px){
      		#videoBBoxList .label_wrap .category_wrap { max-height: 880px; } 
      	}
      	@media (min-height: 730px) and (max-height:959px){
      		#videoBBoxList .label_wrap .category_wrap { max-height: 662px; } 
      	}      	
      	@media (min-height: 500px) and (max-height:729px){
      		#videoBBoxList .label_wrap .category_wrap { max-height: 500px; } 
      	} 
      	@media (min-height: 1px) and (max-height:499px){
      		#videoBBoxList .label_wrap .category_wrap { max-height: 400px; } 
      	}       	
      	#videoBBoxList .label_wrap .category_wrap { width:100%; height:auto; /* overflow:scroll; */ overflow-y: scroll; overflow-x: hidden; flex-wrap: wrap; padding: 0 18px; }
/*       	#videoBBoxList .label_wrap .category_wrap .cate_wp { width:190px; height:90px; border:1px solid #eeeeee; margin: 5px 10px; padding: 7px; } */
      	#videoBBoxList .label_wrap .category_wrap .cate_wp { width: 414px; height: 75px; border:1px solid #eeeeee; margin: 5px 10px; padding: 7px; }
      	#videoBBoxList .label_wrap .category_wrap .cate_wp.selected { border-width:2px !important; }
/*       	.label_wrap .category_wrap .cate_wp .delete { margin-left:10px; } */
      	#videoBBoxList .label_wrap .category_wrap .cate_wp .color {     
      		width: 20px;
		    height: 20px;
	    }
	    #videoBBoxList .label_wrap .category_wrap .cate_wp input { width: 390px; padding: 10px; margin-top: 3px; }
/* 	    #videoBBoxList .label_wrap .category_wrap .cate_wp input { width: 165px; padding: 10px; margin-top: 3px; } */
      	#videoBBoxList .label_wrap .category_wrap .cate { /*width:5em;*/ /* width:60px; */ border:1px solid #eeeeee; text-align:center; text-align-last:center; }
      	#videoBBoxList .label_wrap .category_wrap .cate option { text-align:center; text-align-last:center; }
      	
      	#videoBBoxList .page_title_wrap { position: relative; top: 20px; left: 90px; display: inline; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; }
      	#videoBBoxList .page_title_wrap span:first-child { font-size: 13px; }
		#videoBBoxList .page_title_wrap span:nth-child(2) { color: #4c84ff; font-size: 14px;}
		#videoBBoxList .add { width: 90px; margin-right: 10px; position: relative; color: #fff; font-size: 11px; background-color: #4c84ff; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; }
		#videoBBoxList .add:hover { background-color: #3A71E9; }
		#videoBBoxList .delete { width: 55px; color: #343434; font-size: 11px; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; margin-left: 10px;  }
		#videoBBoxList .delete_frm { width: auto; color: #343434; font-size: 11px; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; margin-left: 10px;  }
		#videoBBoxList .delete:hover,
		#videoBBoxList .delete_frm:hover { background-color: red; color: #fff; }
		#videoBBoxList .start_frm, .end_frm { width: 55px; color: #4c84ff; font-size: 11px; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; margin-left: 10px;  }
		#videoBBoxList .start_frm:hover, 
		#videoBBoxList .end_frm:hover { width: 55px; color: #fff; background-color: #4c84ff; font-size: 11px; border: 1px solid #e9e9e9; border-radius: 5px; text-align: center; cursor: pointer; margin-left: 10px;  }
		
      	#videoBBoxList .label_title { color: #777; font-weight: 400; padding: 20px; }
      	
      	#videoBBoxList .save_btn_wrap { justify-content: center; position: absolute; bottom: 0; padding: 18px 0; background-color: #fff; margin-bottom: 12px; }
      	#videoBBoxList .save_btn_wrap .save { width: 240px; line-height: 36px; margin: 0 auto; border-radius: 23px; box-shadow: 0 4px 8px 0 #b4d7ff; font-size: 13px; font-weight: 300; color: #fff; cursor: pointer; background-color: #4c84ff;}
		#videoBBoxList .save_btn_wrap .save:hover { background-color: #3A71E9; }
		#videoBBoxList .img_list_wrap { width: 100%; min-height: 30px; position: absolute; bottom: 92px; border: 1px solid #e0e0e0; border-left: 0; border-right: 0; padding: 15px 0; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; background-color: #f8f8f8; }      
		      		
		#videoBBoxList .position_wrap { width: 100px; margin-right: 20px; }
		#videoBBoxList .position_wrap .position-value { width: 40px; padding: 5px; }
		#videoBBoxList .position_wrap .total_count { display: inline-block; }
		
		
		#videoBBoxList .name_wrap { width: 30%; text-align: center; margin-left: -120px; overflow-wrap: break-word; }
		#videoBBoxList .name_wrap .file_name { max-width: 280px; text-overflow: ellipsis; overflow: hidden; }
	
		
      	#videoBBoxList .list_btn_wrap { width: 60px; margin-left: 20px; }
      	#videoBBoxList .list_btn_wrap .data_list_btn { width: 30px; height: 30px; margin-right: 30px; background: url(images/icon_filter_normal.png) right; cursor: pointer; }

 		#videoBBoxList .quick_wrap { width: 100%; position: absolute; bottom: 0px; padding: 25px 0; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }       

/*  		#videoBBoxList .quick_wrap { width: calc(100% - 699px); position: absolute; bottom: 0px; padding: 25px 0; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; justify-content: center; }        */
/* 		#videoBBoxList .quick_wrap { width: 488px; text-align: center; font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434; position: absolute; top: -8px; left: 609px;}     */
      
		#videoBBoxList .quick_btn {
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
		
		#videoBBoxList .quick_btn:hover {
			background-color: #3A71E9;
		}      
		
		/* panel label */
		#videoBBoxList .btn_wrap .visible { width: 18px; height: 18px; position: relative; left: -145px; }
		#videoBBoxList .btn_wrap .visible.on { background: url('images/btn_layer_view.png') no-repeat center; }
		#videoBBoxList .btn_wrap .visible.off { background: url('images/btn_checkbox_normal.png') no-repeat center; }		
		
		#videoBBoxList .tag_wrap { width: 100%; height: 60px; position: absolute; bottom: 91px;  border-top: 1px solid #f8f8f8; font-size: 11px; justify-content: center; }      	
      	#videoBBoxList .video_name { font-family: 'Open_Sans', sans-serif; font-size: 13px; font-weight: 400; color: #343434;}
      	
		#videoBBoxList section.enrichment {
			width: calc(100% - 486px);
			height: 100%;
			position: relative;
/* 			border: 1px solid #e5e5e5; */
		}      
		
		#videoBBoxList section.label {
			width: 486px;
			height: 100%;
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
		#videoBBoxList .data_list_wrap { height: 635px; max-height: 635px; top: calc(100% - 740px); left: -1px; font-family: 'Open_Sans', sans-serif; font-size: 11px; font-weight: 400; color: #343434; }  	
		
		#videoBBoxList .enrichment .prev_btn {
			position: absolute;
			background: url(images/btn_image_arrow_left_normal.png) left;
			width: 16px;
			height: 25px;
 			top: calc(50% - 78px); 
/* 			top: 300px; */
			left: 5px
		}
		
		#videoBBoxList .enrichment .next_btn {
			position: absolute;
			background: url(images/btn_image_arrow_right_normal.png) right;
			width: 16px;
			height: 25px;
 			top: calc(50% - 78px); 
/* 			top: 300px; */
			right: 5px
		}      	
		
		#videoBBoxList .enrichment .prev_btn:hover {
			background: url(images/btn_image_arrow_left_hover.png) left;
			cursor: pointer;
		}
		
		#videoBBoxList .enrichment .next_btn:hover {
			background: url(images/btn_image_arrow_right_hover.png) right;
			cursor: pointer;
		}			
		
		#videoBBoxList #pre_video { z-index: 99; }
		
		#videoBBoxList section.enrichment .empty_wrap { margin: 300px auto; text-align: center; margin-top: 300px; color: #777777; }
		#videoBBoxList section.enrichment .empty_wrap .no_image { margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; height: 37px; background-image: url(./images/icon_nodata_list.png); }
		#videoBBoxList section.enrichment .empty_wrap .eng_text { margin-bottom: 3px; font-size: 16px; }
		#videoBBoxList section.enrichment .empty_wrap .kor_text { font-size: 12px; }
		#videoBBoxList section.label .paging_wrap { justify-content: center; position: absolute; bottom: 0; padding: 19px 0; background-color: #fff; border-top: 1px solid #eee; }
		#videoBBoxList .video_pwrap { height: calc(100% - 250px); border-top: 1px solid #eee; }	
		
		#videoBBoxList input.category::placeholder { font-size: 11px; }	
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
               <div id="videoBBoxList" class="container-fluid">
                  <!-- Page Heading -->


                  <div class="card shadow mb-4 flex fs">
                  
                  	<section class="enrichment">
	                     <div class="header_wrap flex sb">
		                  	<div class="page_title_wrap">
		                  		<span>Label List</span> <span>|</span> Video Bounding Box
	                  		</div>
	                  	</div>
<!--                  		<div class="prev_btn prev_data"></div> -->
<!-- 						<div class="next_btn next_data"></div>	                  	 -->
						<div class="video_pwrap flex">
	                   		<div class="video_wrap tab-pane active" id="videoBBoxList-labeller" role="tabpanel" >
	                   			<video class="video video-js vjs-default-skin" id="videoBBoxList-video"></video>
	                   			<canvas class="canvas" id="videoBBoxList-canvas"></canvas>
							</div>						
						</div>
	               		<div class="img_list_wrap flex sb"> <!-- Image Slide area start -->
	<!--                  			<div>Image Slide Section</div> -->
							<div class="list_btn_wrap">
<!-- 								<div class="data_list_btn"></div> -->
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
<!-- 							<div class="position_wrap"> -->
<!-- 		                			<input type="text" class="position-value" value="1" /> -->
<!-- 		                			<div class="total_count"> / <span></span></div>							 -->
<!-- 							</div>							 -->
<!-- 			                <div class="data_list_wrap"> -->
<!-- 			                 	<div class="data_total">Total <span>0</span></div> -->
<!-- 								<div class="list_table"> -->
<!-- 									<div class="h_wrap flex"> -->
<!-- 										<div class="preview">PREVIEW</div> -->
<!-- 										<div class="id">ID</div> -->
<!-- 										<div class="path">PATH</div> -->
<!-- 										<div class="label_cnt">LABELS</div> -->
<!-- 									</div> -->
<!-- 										<ul class="c_wrap"> -->
<!-- 										</ul> -->
<!-- 									<div class="f_wrap flex"> -->
<!-- 										<div id="pagination" class="tui-pagination"></div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 			                 </div> 	 -->
	               		</div>              <!-- Image Slide area end -->  
		                <div class="save_btn_wrap flex">
                 				<button type="button" class="btn btn-primary save filter_color">Save</button>
                 		</div>	               									                  	                 	
                  	</section>
                  	<section class="label">
						<!-- label area start -->
                   		<div class="label_wrap ">
                   			<div class="btn_wrap flex sb">
<!--                					<div class="label_title">Label (<span></span>)</div> -->
									<div class="label_title" data-cnt="0">Label</div>
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
			var that = videoBBoxList;
			
			// player init
			that.data.player = videojs('videoBBoxList-video', that.data.videoObj);
			
			that.data.canvas = new fabric.Canvas('videoBBoxList-canvas',{
				selection : false,
				width : 800,
				height : $("#videoBBoxList .video_wrap")[0].clientHeight-40,
				uniScaleTransform : true,
			});
			
			// video-frame plugin 설정
			that.data.playerFrame = VideoFrame({
				id : $("#videoBBoxList-video"),
// 				frameRate : 30,
// 				callback : function(frame,format){
// // 					console.log(frame);
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
			
			// 비디오 클립 로딩
			that.data.player.on('loadedmetadata',function(evt){
				var uuid = $("#videoBBoxList .cate_wp.selected").attr("id");
				
				that.computed.getScaleFactor();
				that.render.adjustArea();
				that.computed.getMetaByMetaId(that.data.player['dataId'],that.data.player['metaId']);
				return;
			});
			
			that.bind.evtOnceInit();
// 			videoBBox.init();
		    
		});
		
		const videoBBoxList = {
				pt : $("#videoBBoxList"),
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
					metaList : {},
					
					modifiedObj : {},
					
					colorHash : null,
					// initial canvas and canvas var end
					
					
				}, // data end

				datasetInit : function(dataset_id){
					const that = videoBBoxList;
					var data_list_wrap = $("#videoBBoxList .data_list_wrap");
					data_list_wrap.removeClass("active");
					data_list_wrap.css("display", "none");
					
					that.data.videoObj['datasetId'] = null;
					that.data.videoObj['datasetId'] = dataset_id;
					
					
					that.init(dataset_id);
				},
				
				init : function(datasetId,index) {
					const that = videoBBoxList;
// 					var isInit = true
// 					that.bind.evtOnceInit();
					that.computed.clearAllData();
					that.data.colorHash = new ColorHash();
					that.data.videoObj['currDataNum'] = 1;
// 					var dataSet = "5";
					var page_num;
					if(index == undefined || index == null){
						page_num = 0;
					} else {
						page_num = index;
					}
					
					that.bind.resetView();
					that.computed.getLabelDataByDatasetId(page_num, that.data.videoObj['datasetId']);
// 					that.computed.getVideoDataList(page_num,datasetId);
// 					that.computed.getVideoDataList("",isInit,page_num);
// 					that.bind.evtOnceInit();
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
						this.objMovingEvt();
						this.objModifiedEvt();
						this.objScalingEvt();
// 						this.keydownEvt();
					},
					collision : function(player,canvas) {
						const that = videoBBoxList;
						
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
							$("#videoBBoxList .vjs-play-control.vjs-control").removeClass("vjs-paused");
							$("#videoBBoxList .vjs-play-control.vjs-control").removeClass("vjs-ended");							
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
						const that = videoBBoxList;
						 
						that.data.canvas.on('mouse:down',function(o){
							if(that.data.player.paused()==false){
								that.data.player.pause();
							}							
							
							var uuid = "";
							if($("#videoBBoxList .label_wrap .category_wrap .cate_wp.selected").length == 0){
								return
							}else{
								uuid = $("#videoBBoxList .label_wrap .category_wrap .cate_wp.selected")[0].id;
							}
					    	
							var canv = that.data.canvas.getObjects();
					    	for(var i=0; i<canv.length; i++){
					    		if(canv[i]["uuid"] == uuid){
					    			return;
					    		}
					    	}

					    	$("#videoBBoxList-video .vjs-progress-control").hide();
					    	
							if (that.data.canvasObj.freeDrawing && o.target == null ) {
								var uuid = $("#videoBBoxList .label_wrap .category_wrap .cate_wp.selected")[0].id;
							    var pointer = that.data.canvas.getPointer(o.e);
							    
							    that.data.canvasObj.origX = pointer.x;
							    that.data.canvasObj.origY = pointer.y;
							    that.data.canvasObj.isDown = true;
							    
							    if(that.data.canvasObj.isRectActive && $("#videoBBoxList .label_wrap .category_wrap .cate_wp").length > 0) {

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
						const that = videoBBoxList;
						var data = that.data;
						var canvas = that.data.canvas;
						
						canvas.on('mouse:move', function(o) {
							
							
							var tempRect = canvas.getActiveObject();
							
						    if (data.canvasObj.isDown && data.canvasObj.freeDrawing) {
								var pointer = canvas.getPointer(o.e);
								var uuid = $("#videoBBoxList .label_wrap .category_wrap .cate_wp.selected")[0].id;
							    if( data.canvasObj.isRectActive && $("#videoBBoxList .label_wrap .category_wrap .cate_wp").length > 0 ) {
							    	
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
						const that = videoBBoxList;
						var data = that.data;
						var meta = that.data.meta;
						var canvas = that.data.canvas;
						
						canvas.on('mouse:up', function(e) {
					    	
							if(e.target && canvas.getActiveObject() == e.target){
							
								$("#videoBBoxList .label_wrap .category_wrap .cate_wp").removeClass("selected");
								$("#videoBBoxList .label_wrap .category_wrap .cate_wp[id='"+e.target.uuid+"']").addClass("selected");
								let color = that.data.colorHash.rgb(e.target.uuid);
								$("#videoBBoxList .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
								$("#videoBBoxList .label_wrap .category_wrap .cate_wp[id='"+e.target.uuid+"'].selected ").css("border-color","rgb("+color+")");
								
							}else if($("#videoBBoxList .label_wrap .category_wrap .cate_wp.selected").length == 0){
								alert("라벨을 추가해 주세요!");
								return false;
							}
							$("#videoBBoxList-video .vjs-progress-control").show();
							
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
							// jh.sa 201204
							var minBboxSize = that.data.scaleFactor.minBboxSize;
							if(tempRect.width < minBboxSize){
								tempRect.set({width : minBboxSize});
								canvas.renderAll();
							}
							if(tempRect.height < minBboxSize){
								tempRect.set({height : minBboxSize});
								canvas.renderAll();
							}
							
							var currFrame = data.playerFrame.get();
							
							if(data.canvasObj.freeDrawing) {
								data.canvasObj.isDown = false;
								data.canvasObj.isRectActive = !data.canvasObj.isRectActive;
								data.canvasObj.freeDrawing = !data.canvasObj.freeDrawing;
							}
							
							
							var uuid = $("#videoBBoxList .label_wrap .category_wrap .cate_wp.selected")[0].id;
							var panelObj=[];
							if(!e.target || e.target != tempRect){
								that.computed.saveMetaData(tempRect, currFrame, uuid);
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
								var labelBoxHeight = $("#videoBBoxList .label_wrap .category_wrap #"+uuid+"")[0].offsetTop;
								$("#videoBBoxList .label_wrap .category_wrap").animate({
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
						const that = videoBBoxList;
						var canvas = that.data.canvas;
						that.data.canvas.on("object:moving",function(evt){
							$("#videoBBoxList-video .vjs-progress-control").hide();
							
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
						const that = videoBBoxList;
						var canvas = that.data.canvas;
						canvas.on("object:modified",function(evt){
							that.data.canvas.getActiveObject().lockScalingX = false;
							that.data.canvas.getActiveObject().lockScalingY = false;	
							that.data.canvas.getActiveObject().lockMovementX = false;
							that.data.canvas.getActiveObject().lockMovementY = false;
							that.data.videoObj['isModified'] = 1;
						});
					},
					
					objScalingEvt : () => {
						const that = videoBBoxList;
						var canvas = that.data.canvas;
						
						canvas.on("object:scaling",function(evt){
							$("#videoBBoxList-video .vjs-progress-control").hide();
							
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
					
					keydownEvt : () => {
						const that = videoBBoxList;
						var canvas = that.data.canvas;
						
						$(document).off("keyup").on("keyup", function(evt){
// 							if (evt.keyCode == "17") isCtrl = false;
							if(evt.keyCode == "83" && evt.ctrlKey == true){
								that.computed.insertMetaData();
							}
						});						
						
						$(document).off("keydown").on("keydown",function(evt){
							// del evt
							if(evt.keyCode == "46" || evt.keyCode == "68" && evt.ctrlKey == true){
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
							}
							
							// jh.sa 210125
							var focus = $("#videoBBoxList .cate_wp.selected input:focus").length;
							var cate_selected = $("#videoBBoxList .cate_wp.selected").length;
							// space evt
							if(evt.keyCode == "32"){
								if(focus == 0 && cate_selected != 0){
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
								var curr_input = Number($("#videoBBoxList .frame_wrap input[name='curr_frame']").val());
								var curr_frame = that.data.playerFrame.get();
								var final_frame = that.data.player.finalFrame;								
								
								if(focus == 0 && cate_selected != 0){
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
								var curr_input = Number($("#videoBBoxList .frame_wrap input[name='curr_frame']").val());
								var curr_frame = that.data.playerFrame.get();
								
								if(focus == 0 && cate_selected != 0){
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
								var curr_input = Number($("#videoBBoxList .frame_wrap input[name='curr_frame']").val());
								var curr_frame = that.data.playerFrame.get();
								var final_frame = that.data.player.finalFrame;		
								
								if(focus == 0 && cate_selected != 0){
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
								var curr_input = Number($("#videoBBoxList .frame_wrap input[name='curr_frame']").val());
								var curr_frame = that.data.playerFrame.get();
								
								if(focus == 0 && cate_selected != 0){
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
					
					sideEvtCollision : function(evt) {
						const that = videoBBoxList;
						// DOM Event
						
						$("#videoBBoxList .label_wrap input").off("input").on("input", function(e){
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
						
						$("#videoBBoxList .position-value").off("input").on("input", function(e){
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
						
						$("#videoBBoxList .label_wrap .btn_wrap .add").off("click").on("click",function(evt){
							$(this).blur();
							var uuid = that.computed.generateUUID();
							var keys = Object.keys(that.data.meta);
							if(keys.length > 0){
								for(var i=0; i<keys.length; i++){
									if(keys[i] == uuid){
										uuid = that.computed.generateUUID();
									}
								}
							}
							
							var labelNo = eval($("#videoBBoxList .label_wrap .category_wrap").find(".cate_wp").length+1);
							
							var html = that.render.tempInitCategory(uuid,labelNo);
							$("#videoBBoxList .label_wrap .category_wrap").append(html);
							
							let color = that.data.colorHash.rgb(uuid);
							$("#videoBBoxList .label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
							
							$("#videoBBoxList .label_wrap .category_wrap .cate_wp").removeClass("selected");
							$("#videoBBoxList .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
							$("#videoBBoxList .label_wrap .category_wrap .cate_wp").last().addClass("selected");
							$("#videoBBoxList .label_wrap .category_wrap .cate_wp[id='"+uuid+"'].selected ").css("border-color","rgb("+color+")");
							
// 							that.computed.getCategoryData(data,uuid);
							that.computed.initMetaData(uuid,labelNo);
							that.bind.sideEvtCollision();
							
						});
						
						$("#videoBBoxList .label_wrap .category_wrap .cate_wp .start_frm").off("click").on("click",function(e){
							e.stopPropagation();
							if(!$(this).parents(".cate_wp").hasClass("selected")){
								$(this).parents(".cate_wp").trigger("click");
							}
							var uuid = $(this).parent().parent().attr("id");
							var startFrm = that.data.meta[uuid]['startFrame'];
							if(startFrm == 0){
								that.data.playerFrame.seekTo({seconds:0});
							}else{
								that.data.playerFrame.seekTo({frame:startFrm});
							}
							
							var frame = that.data.playerFrame.get();
							that.computed.checkMetaFrame(frame);
							that.render.inputCurrFrame(frame);
						});
						
						$("#videoBBoxList .label_wrap .category_wrap .cate_wp .end_frm").off("click").on("click",function(e){
							e.stopPropagation();
							if(!$(this).parents(".cate_wp").hasClass("selected")){
								$(this).parents(".cate_wp").trigger("click");
							}							
							var uuid = $(this).parent().parent().attr("id");
							var endFrm = that.data.meta[uuid]['endFrame'];
							that.data.playerFrame.seekTo({frame:endFrm});
							
							var frame = that.data.playerFrame.get();
							that.computed.checkMetaFrame(frame);
							that.render.inputCurrFrame(frame);
						});
						
						
						// alert and meta data delete!!
						$("#videoBBoxList .label_wrap .category_wrap .cate_wp .delete").off("click").on("click",function(evt){
						
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
									that.computed.deleteMetaData(uuid,labelBox[0]);
								}								
							}
						});
						
						$("#videoBBoxList .category_wrap .cate_wp .category").off('keypress').on('keypress',function(evt){
							if(evt.keyCode == 13){
								console.log("enter!");
								var uuid = $(this).parent().parent().attr("id");
								that.data.meta[uuid]['category'] = $(this).val();
							}
						});
						
						// jh.sa add
// 						$("#videoBBoxList .category_wrap .cate_wp .category").off('blur').on('blur',function(evt){
// 							var uuid = $(this).parent().parent().attr("id");
// 							that.data.meta[uuid]['category'] = $(this).val();
// 						});								
						
						$("#videoBBoxList .category_wrap .cate_wp").off("click").on("click",function(e){
							var uuid = $(this).attr("id");
							var color = that.data.colorHash.rgb(uuid);
							var path = $(this).data("path");
							var dataId = $(this).data("id");
							var fps = $(this).data("fps");
							var frame = $(this).data("frame");

							var dataAddr = '/uploadFile/xlabeller/'+path;
							var fps = $(this).data("fps")*1;
							
							that.pt.find(".empty_wrap").remove();
							that.pt.find("section.enrichment .canvas-container").show();	
							that.pt.find("section.enrichment #videoBBoxList-video").show();							
							$("#videoBBoxList .label_wrap .category_wrap .cate_wp").removeClass("selected");
							$("#videoBBoxList .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
							$("#videoBBoxList .img_list_wrap .name_wrap .video_name").html(path.split("/")[1]);
							$("#videoBBoxList .img_list_wrap .name_wrap .video_name").attr("title",path.split("/")[1]);
							$(this).addClass("selected");
							$(this).css("border-color","rgb("+color+")");
							
							if($(this).hasClass("selected")){
								// jh.sa 210125 => 다른 데이터셋 가져올 때만 검사하면 될 것 같음. data_id 기준이 아니라 DATASET_Id 기준 전체 meta list라서..
// 								var isModified = that.data.videoObj['isModified'];
// 								var msg = "영상 데이터 이동 시 저장되지 않은 라벨은 손실됩니다. 계속하시겠습니까?";		
								
// 								if(isModified == 1){
// 									if(!confirm(msg)){
// 										return false;
// 									}
// 								}									
								
								that.computed.clearCanvas();
								$("#loader").show();
								that.data.player['metaId'] = uuid;
								that.data.player['dataId'] = dataId;
								
								// jh.sa 210121
								that.data.player['finalFrame'] = frame;
								if(that.data.player['finalFrame']){
									$("#videoBBoxList .frame_wrap .total_frame span").html(that.data.player['finalFrame']);
								}					
								
								that.data.videoObj['isModified'] = 0;
								
								that.computed.adjustVideoSrc(dataAddr, fps);
								that.bind.collision();
								
								
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
						
						$("#videoBBoxList .save_btn_wrap .save").off("click").on("click",function(){
							$(this).blur();
							that.computed.insertMetaData();
						});						
						
						$("#videoBBoxList .btn_wrap .prev-5").off("click").on("click",function(){
							// jh.sa 210126
							var cate_selected = $("#videoBBoxList .category_wrap .cate_wp.selected").length;
							if(cate_selected != 0){
								var curr_input = Number($("#videoBBoxList .frame_wrap input[name='curr_frame']").val());
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
							}
						});
						
						$("#videoBBoxList .btn_wrap .prev").off("click").on("click",function(){
							// jh.sa 210126
							var cate_selected = $("#videoBBoxList .category_wrap .cate_wp.selected").length;
							if(cate_selected != 0){
								var curr_input = Number($("#videoBBoxList .frame_wrap input[name='curr_frame']").val());
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
							}
						});
						
						$("#videoBBoxList .btn_wrap .next-5").off("click").on("click",function(){
							// jh.sa 210126
							var cate_selected = $("#videoBBoxList .category_wrap .cate_wp.selected").length;
							if(cate_selected != 0){
								var curr_input = Number($("#videoBBoxList .frame_wrap input[name='curr_frame']").val());
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
							}
						});
						
						$("#videoBBoxList .btn_wrap .next").off("click").on("click",function(){
							// jh.sa 210126
							var cate_selected = $("#videoBBoxList .category_wrap .cate_wp.selected").length;
							if(cate_selected != 0){
								var curr_input = Number($("#videoBBoxList .frame_wrap input[name='curr_frame']").val());
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
							}
						});
						
						$("#videoBBoxList .btn_wrap input.curr_frame").off("keypress").on("keypress",function(e){
							if(e.keyCode == "13"){
								e.preventDefault();
								var frame = $(this).val();	
								that.data.playerFrame.seekTo({frame:frame});	
								that.computed.checkMetaFrame(frame);
							}
						});
						
						// play button toggle event wrap
						$("#videoBBoxList .btn_wrap .play_btn ").off("click").on("click",function(){
							// jh.sa 210126
							var cate_selected = $("#videoBBoxList .category_wrap .cate_wp.selected").length;
							if(cate_selected != 0){
								that.data.player.play();
								var isPaused = false;
								that.render.renderTogglePlayBtn(isPaused);								
							}							
						});
						$("#videoBBoxList .btn_wrap .pause_btn ").off("click").on("click",function(){
							that.data.player.pause();
							var isPaused = true;
							that.render.renderTogglePlayBtn(isPaused);
						});
						
						//paging evt
						$("#videoBBoxList .data_list_wrap .list_table ul li .path").off("click").on("click",function(){
							var data_num = $(this).parent().attr("data-index")*1-1;
							var page_size=50;
							var currPage = $("#videoBBoxList #pagination .page-item.active .page-link").html()*1-1;
							var currDataNum = currPage*page_size + data_num;
							that.computed.initVideoData(currDataNum);
						});

						$("#videoBBoxList #pagination .first").off("click").on("click",function(){
							that.computed.clearAllData();
							var page_num = 0;
// 							that.computed.getVideoDataList(page_num,that.data.videoObj['datasetId']);
							that.computed.getLabelDataByDatasetId(page_num, that.data.videoObj['datasetId']);
						});
						$("#videoBBoxList #pagination .prev").off("click").on("click",function(){
							var page_size=50;
							var page_num = $("#videoBBoxList #pagination .page-item.active .page-link").html()-2;
							if(page_num<0){
								alert("첫 페이지 입니다.");
								return false;
							}
							that.computed.clearAllData();
// 							that.computed.getVideoDataList(page_num,that.data.videoObj['datasetId']);
							that.computed.getLabelDataByDatasetId(page_num, that.data.videoObj['datasetId']);
						});
						$("#videoBBoxList #pagination .page-link").off("click").on("click",function(){
							if( isNaN($(this).html()) == false){
								var page_num = $(this).html()*1-1;
								that.computed.clearAllData();
// 								that.computed.getVideoDataList(page_num,that.data.videoObj['datasetId']);
								that.computed.getLabelDataByDatasetId(page_num, that.data.videoObj['datasetId']);
							}
						});
						$("#videoBBoxList #pagination .next").off("click").on("click",function(){
							var page_size=50;
							var page_num = $("#videoBBoxList #pagination .page-item.active .page-link").html();
// 							var lastPage = Math.floor($("#videoBBoxList .label_title span").html()*1/page_size);
							var lastPage = Math.floor($("#videoBBoxList .label_title").data("cnt")*1/page_size);
							if(page_num>lastPage){
								alert("마지막 페이지 입니다.");
								return false;
							}
							
							var page = $("#videoBBoxList .label_title").data("cnt")*1/page_size;
							if(page == page_num){
								alert("마지막 페이지 입니다.");
								return false;
							} else {
								that.computed.clearAllData();
								that.computed.getLabelDataByDatasetId(page_num, that.data.videoObj['datasetId']);
							}								
							
// 							that.computed.clearAllData();
// 							that.computed.getLabelDataByDatasetId(page_num, that.data.videoObj['datasetId']);
						});
						$("#videoBBoxList #pagination .last").off("click").on("click",function(){
							var page_size=50;
							var page_num = Math.floor($("#videoBBoxList .label_title").data("cnt")*1/page_size);
// 							that.computed.clearAllData();
// 							that.computed.getLabelDataByDatasetId(page_num, that.data.videoObj['datasetId']);
							
							var page = $("#videoBBoxList .label_title").data("cnt")*1/page_size
							if(page == page_num){
								that.computed.clearAllData();
								that.computed.getLabelDataByDatasetId(page_num-1, that.data.videoObj['datasetId']);
							} else {
								that.computed.clearAllData();
								that.computed.getLabelDataByDatasetId(page_num, that.data.videoObj['datasetId']);
							}								
							
						});
						
						$("#videoBBoxList .prev_data").off("click").on("click",function(){
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
						$("#videoBBoxList .next_data").off("click").on("click",function(){
							var currDataNum = that.data.videoObj['currDataNum']*1;
							var page_size=50;
							var total_size = $("#videoBBoxList .position_wrap .total_count span").html()*1;
							
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
						
// 						$("#videoBBoxList .img_list_wrap .name_wrap .prev_btn").off("click").on("click",function(){
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
// 						$("#videoBBoxList .img_list_wrap .name_wrap .next_btn").off("click").on("click",function(){
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
						
						$("#videoBBoxList .position-value").off("keypress").on("keypress",function(evt){
							if(evt.keyCode == "13"){
								var page_size = 50;
								var targetDataNum = $(this).val()*1-1;
								var targetPageNum = Math.floor(targetDataNum*1/page_size*1)+1;
								var currPageNum = $("#videoBBoxList #pagination .page-item.active .page-link").html();
								var total_size = $("#videoBBoxList .position_wrap .total_count span").html()*1;
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
						$("#videoBBoxList .list_btn_wrap .data_list_btn").off("click").on("click", function(){
							var data_list_wrap = $("#videoBBoxList .data_list_wrap");
							if(data_list_wrap.hasClass("active")){
								data_list_wrap.removeClass("active");
								data_list_wrap.css("display", "none");	
							} else {
								data_list_wrap.addClass("active");
								data_list_wrap.css("display", "block");								
							}							
						});						
						
						// jh.sa 201019
						// data list preview
						$("#videoBBoxList .preview .img_preview").off("mouseenter").on("mouseenter", function(){
							const x = $(this).offset().left + $(this).outerWidth();
					        const y = $(this).offset().top + $(this).outerHeight() - 59 - $(window).scrollTop();
					        
					        const video_html = "<video id ='pre_video' style='position: fixed; top: "+ y +"px; left: "+ x +"px; width : 320px; height : 320px' ></video>"; 

					        $(this).append(video_html);
					        
					        const id = $(this).parents("li").find(".id").text();
					        const path = $(this).parents("li").find(".path").text();
					 
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
					        
			
					        
						});
						
						$("#videoBBoxList .preview .img_preview").off("mouseleave").on("mouseleave", function(){
							that.data.player.dispose();
						});
						
						// jh.sa 201204 input 유효성 검사 		                
						$("#videoBBoxList input[name='label_name']").on("propertychange change keyup paste input", function(e) {
							var uuid = $(this).parent().parent().attr("id");
							that.data.meta[uuid]['category'] = $(this).val();			
							that.data.videoObj['isModified'] = 1;
// 							if(!checkInput($(this).val(),"ko-en-num")){
// 								const str = $(this).val().replace(/[^a-zA-Zㄱ-ㅎ가-힣0-9 ]/gi,"");
// 			                    if(str.match(/[^a-zA-Zㄱ-ㅎ가-힣0-9 ]/)){
// 										$(this).val(str.slice(0, -1));						
// 								} else {
// 										$(this).val(str);						
// 								}								
// 							}
// 							if($(this).data("length") == 250 && $(this).val().length > 250){
// 								var string = $(this).val();
// 								alert("입력 가능한 텍스트 개수를 초과하였습니다.\n중간에 입력하신 경우 기존 텍스트의 마지막 글자를 삭제합니다.");
// 								$(this).val(string.slice(0,250));
// 								return false;
// 							}
							if($(this).val().length > 250){
								var string = $(this).val();
								$(this).val(string.slice(0,250));
								return false;
							};
						});			
						
						
						// 이후 프레임 삭제 버튼
						$("#videoBBoxList .cate_wp .delete_frm").off("click").on("click", function(e){
							e.stopPropagation();
							var canvas = that.data.canvas;
							var this_uuid = $(this).parents(".cate_wp")[0].id;
							var select_uuid = null;

							if($("#videoBBoxList .label_wrap .category_wrap .cate_wp.selected")[0]){
								select_uuid = $("#videoBBoxList .label_wrap .category_wrap .cate_wp.selected")[0].id;
							}
							if(select_uuid != null && this_uuid != select_uuid) {
								$("#videoBBoxList .label_wrap .category_wrap .cate_wp").removeClass("selected");
								$("#videoBBoxList .label_wrap .category_wrap .cate_wp").css("border-color","#eeeeee");
								let color = that.data.colorHash.rgb(this_uuid);
								$("#videoBBoxList .label_wrap .category_wrap .cate_wp[id='"+this_uuid+"']").addClass("selected");
								$("#videoBBoxList .label_wrap .category_wrap .cate_wp[id='"+this_uuid+"'].selected ").css("border-color","rgb("+color+")");								
								
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
							} else if(tmp == false) {
								return;
							}
						});							
						
						
					},// DOM Event end
					
                    resetView : function(){
                        const that = videoBBoxList;	
                        $("#videoBBoxList input.curr_frame").val(0);					// jh.sa 201103
                        $("#videoBBoxList .category_wrap").html("");
    					$("#videoBBoxList .img_list_wrap .name_wrap .video_name").html("");
    					$("#videoBBoxList .empty_wrap").remove();
    					const html = '<div class="empty_wrap"><div class="no_image"></div><div class="eng_text">No Data</div><div class="kor_text">you have not selected any data yet</div></div>';
    					$("#videoBBoxList section.enrichment #videoBBoxList-video").hide();
    					$("#videoBBoxList section.enrichment .canvas-container").hide();
    					$("#videoBBoxList .frame_wrap .total_frame span").html(""); // jh.sa 201217
    					$("#videoBBoxList section.enrichment .video_wrap").append(html);	                        
                    },
                    
                    resetEnrichView : function(){
                    	const that = videoBBoxList;
    					$("#videoBBoxList .img_list_wrap .name_wrap .video_name").html("");
    					$("#videoBBoxList .empty_wrap").remove();
    					const html = '<div class="empty_wrap"><div class="no_image"></div><div class="eng_text">No Data</div><div class="kor_text">you have not selected any data yet</div></div>';
    					$("#videoBBoxList section.enrichment #videoBBoxList-video").hide();
    					$("#videoBBoxList section.enrichment .canvas-container").hide();
    					$("#videoBBoxList section.enrichment .video_wrap").append(html);                    	
                    },				
				},// bind end
				computed : {
					root : null,
					initRect(uuid,obj) { //create new rect data
						// obj => {top/left/width/height}
						const that = videoBBoxList;
						var tempRect = {};
						tempRect = new fabric.Rect( obj );
						
						that.data.canvas.add(tempRect);
						that.data.canvas.setActiveObject(tempRect);
						that.data.canvas.renderAll();
					},
					
					initMetaRect(uuid,arrNum) { // from Server Data, initiate meta rect data
						const that = videoBBoxList;
						var meta = that.data.meta;
						
						var rectObj = this.getRectObject(meta[uuid],arrNum);
// 						var rectObj = this.getRectObject(newMeta,arrNum);
						var tempRect = new fabric.Rect( rectObj );
						
						that.data.canvas.add(tempRect);
						
						
					}, //init Rect data end		
					
					// get/init rectangle object
					getRectObject(meta,arrNum) {
						const that = videoBBoxList;
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
						const that = videoBBoxList;
						
						that.computed.clearAllData();
						that.computed.getDataByNum(dataNum);
					},					
					
					// create meta data
					initMetaData(uuid,labelNo) {
						const that = videoBBoxList;
						
						that.data.meta[uuid] = {
							labelNo : labelNo,
							id : uuid,
							category : null,
						};
						
					},// create meta data end
					
					getScaledMetaData(uuid){
						const that = videoBBoxList;
						var id = uuid;
						var newMeta = {};
						newMeta = that.data.meta[uuid];
						newMeta['rectData'] = that.computed.rescale(newMeta['rectData'],"1");
						
						return newMeta; 
					},
					
					clearAllData(){
						const that = videoBBoxList;
// 						that.data.scaleFactor = {origWidth:0, origHeight:0, ratio:1};
// 						that.data.player.dataId = null;
						this.clearCanvas();
// 						this.clearMeta();
						this.clearRect();
						that.data.videoObj['isModified'] = 0;
					},
					clearCanvas(){
						const that = videoBBoxList;
						that.data.videoObj['currDataNum'] = null;
						that.data.canvas.clear();
					},
					clearMeta(){
						const that = videoBBoxList;
						that.data.metaList = {};
						that.data.meta = {};
					},
					clearRect(){
						const that = videoBBoxList;
						that.data.rect = {};
					},
					
					
					/*
					*  get Video Data List
					*/
					getVideoDataList(page,dataSet,currDataNum){
						const that = videoBBoxList;
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
								alert("현재 데이터가 없습니다.");
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
					
					// jh.sa 201022
					getLabelDataByDatasetId : (page, datasetId, currDataNum) =>{
						const that = videoBBoxList;
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
											that.data.videoObj['currDataNum'] = res.metaVO.page_num*1+1;
										}else{
											that.data.videoObj['currDataNum'] = currDataNum*1+1;
										}					
										that.data.metaList = {};
										var startPage = Math.floor(res.metaVO.page_num*1/res.metaVO.page_size*1)+1;
										var total_size = res.metaVO.total_size;
										var page_size = res.metaVO.page_size;										
										
		 								var result = res.result.data;
// 										that.render.initMetaFromData(result);
// 		 								that.render.initMetaListFromData(result);

										$("#videoBBoxList .label_title span").html(total_size);
										$("#videoBBoxList .label_title").data("cnt",total_size);
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
					
					getDataByNum(dataNum){
						const that = videoBBoxList;
						$("#loader").show();
						$.ajax({
							url : baseUrl + "data/getDataByNum.json",
							data : {dataset_id:that.data.videoObj['datasetId'],data_num : dataNum},
							type : "POST",
							traditional : true,
							success : function(res){
// 								console.log(":SUCCESS: getDataByNum",res);
								$("#loader").hide();
								that.data.videoObj['currDataNum'] = res.dataVO.data_num*1+1;
								that.render.renderVideoByData(res.result.data);
							},
							error : function(err){
								$("#loader").hide();
								console.log(":ERROR:",err);
							}
						});
					},				
					
					
					getMetaByMetaId(dataId,metaId){
						console.log(":getMetaByMetaId:",dataId);
						const that = videoBBoxList;
						var meta = that.data.meta;
						$("#loader").show();
						var deferred = $.ajax({
							url : baseUrl + "meta/getMetaByMetaId.json",
							data : {data_id:dataId, meta_id : metaId},
							type : "POST",
							traditional : true,
							success : function(res){
								console.log(":SUCCESS: getMetaByMetaId",res);
							},
							error : function(err){
								$("#loader").hide();
								console.log(":ERROR:",err);
							}
						});
						
						Promise.resolve(deferred).then(function(data){
							$("#loader").hide();
							if(data.result.code == "3301"){
								$("#loader").hide();
								alert(data.result.data);
								location.href = baseUrl + "login";
								return false;
							}else if(data.result.code == "200"){
								var result = data.result.data;
								that.render.initMetaFromData(result);
								that.computed.checkMetaFrame(0);	
								
								// jh.sa 210127 test
								that.data.canvas.discardActiveObject();
								var canvArr = that.data.canvas.getObjects();
								for(var i=0; i<canvArr.length; i++){
									if(canvArr[i]['uuid'] == metaId){
										that.data.canvas.bringToFront(canvArr[i]);
										that.data.canvas.setActiveObject(canvArr[i]);
									}
								}									
							}
							
						});
						
					},		
					
// 					getMetaByDataId(dataId){
// 						console.log(":getMetaByDataId:",dataId);
// 						const that = videoBBoxList;
// 						var meta = that.data.meta;
// 						var deferred = $.ajax({
// 							url : baseUrl + "meta/getMetaByDataId.json",
// 							data : {data_id : dataId},
// 							type : "POST",
// 							traditional : true,
// 							success : function(res){
// 								console.log(":SUCCESS: getMetaByDataId",res);
// 							},
// 							error : function(err){
// 								console.log(":ERROR:",err);
// 							}
// 						});
						
// 						Promise.resolve(deferred).then(function(data){
// 							if(data.result.code == "3301"){
// 								alert(data.result.data);
// 								location.href = baseUrl + "login";
// 								return false;
// 							}else if(data.result.code == "200"){
// 								var result = data.result.data;
// 								that.render.initMetaFromData(result);
// 								that.computed.checkMetaFrame(0);	
// 							}
							
// 						});
						
// 					},					
					
					adjustVideoSrc(dataAddr,fps){
						const that = videoBBoxList;
						
						that.data.player.src({
							type : "video/mp4",
							src : dataAddr,
						});
						that.data.playerFrame.frameRate = fps*1;
					},
					
					getSelectedCategoryDetail(data,uuid){
						const that = videoBBoxList;
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
							$("#videoBBoxList .label_wrap .category_wrap .cate_wp[id='"+uuid+"'] select[name='category_0'] option[value='"+res.metaVO.category_0+"']").prop("selected",true);
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
					insertMetaData(){
						const that = videoBBoxList;
						var meta = that.data.meta;
// 						var keys = Object.keys(meta);
						var uuid = that.data.player['metaId'];
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
						if((meta[uuid]['startFrame'] == meta[uuid]['endFrame']) || !meta[uuid]['endFrame'] ){
							var frame = that.data.playerFrame.get();
							that.computed.checkMetaFrame(frame);
							alert("끝점을 정해주세요.");
							$("#loader").hide();
							return false;
						}
						if(meta[uuid]['category'] == ""){
							alert("라벨명을 입력해주세요.");
							$("#loader").hide();
							return false;
						}						
						
						// jh.sa 201127 : 가장자리 쪽에 바운딩 박스를 그린 경우 width, height 값의 오차 조정 
						that.computed.checkRectData(meta[uuid].rectData);						
						
						// jh.sa 201022
						var temp = that.computed.rescale(meta[uuid].rectData,"1");
						
						var tmpObj = {
							startFrame : meta[uuid]["startFrame"],
							endFrame : meta[uuid]["endFrame"],
							rectData : temp,
						}
						var tmpRect = {
							meta_id : uuid,
							label : meta[uuid]['category'],
							info : JSON.stringify(tmpObj),
						}
						data.push(tmpRect);
						
						
						
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
						console.log("ajaxData videoBBoxList : ", ajaxData);
						$.ajax({
							url : baseUrl + "meta/insertMeta.json",
// 							data : { data : JSON.stringify(data) },
							data : ajaxData,
							type : "POST",
							traditional : true,
							timeout : 5000,
							success : function(res){
// 								console.log("===insertMeta===",res);
								$("#loader").hide();
								if(res.result.code == "3301"){
									alert(res.result.data);
									location.href = baseUrl + "login";
									return false;
								}
								if(res.result.code == "200"){
									alert(res.result.data);
// 									that.computed.initVideoData(that.data.videoObj['currDataNum']*1-1);
									var page_num = $("#videoBBoxList #pagination .page-item.active .page-link").html()*1-1;
									that.data.videoObj.isModified = 0;
									that.init(that.data.videoObj["datasetId"],page_num);
		 							
// 									return false;
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
					
					deleteMetaById(uuid,labelBox){
						const that = videoBBoxList;
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
					
					// gap between real video size and web page
					getScaleFactor : function(){
						const that = videoBBoxList;
						var minBboxSize = 10;
						// 실제 비디오 크기 기준
						// scaleFactor > 1 : 실제 비디오가 캔버스 크기보다 큼
						// scaleFactor < 1 : 실제 비디오가 캔버스 크기보다 작음
						that.data.scaleFactor.origWidth = that.data.player.videoWidth();
						that.data.scaleFactor.origHeight = that.data.player.videoHeight();
						that.data.scaleFactor.ratio = $("#videoBBoxList-video").width() / that.data.scaleFactor.origWidth;
						that.data.scaleFactor.minBboxSize = that.data.scaleFactor.ratio * minBboxSize;
					}, // scalefactor end
					
					// re-size rect on canvas
					rescale : function(rectData,isSave){
						const that = videoBBoxList;
						var scaledRatio = that.data.scaleFactor.ratio;
						var tempData = [];
						
						if(isSave == "0"){
							for(var i=0; i<rectData.length; i++){
								tempData[i] = {};
								tempData[i].top = rectData[i].top*scaledRatio;
								tempData[i].left = rectData[i].left*scaledRatio;
								tempData[i].width = rectData[i].width*scaledRatio;
								tempData[i].height = rectData[i].height*scaledRatio;
								tempData[i].status = rectData[i].status;
							}
						}else if(isSave == "1"){
							for(var i=0; i<rectData.length; i++){
								tempData[i] = {};
								tempData[i].top = rectData[i].top/scaledRatio;
								tempData[i].left = rectData[i].left/scaledRatio;
								tempData[i].width = rectData[i].width/scaledRatio;
								tempData[i].height = rectData[i].height/scaledRatio;
								tempData[i].status = rectData[i].status;
							}
						} else{
							for(var i=0; i<rectData.length; i++){
								tempData[i] = {};
								tempData[i].top = rectData[i].top;
								tempData[i].left = rectData[i].left;
								tempData[i].width = rectData[i].width;
								tempData[i].height = rectData[i].height;
								tempData[i].status = rectData[i].status;
							}							
						}
						
						
						return tempData;
						
					}, // re-size rect on canvas end
					
					checkMetaFrame : function(frame, targetId, newMeta){
						const that = videoBBoxList;
						
						var data = that.data;
						var meta = that.data.meta;
						var keys = Object.keys(meta);
						var cur_id = that.data.player['metaId'];
						var canvas = that.data.canvas;
						var candidateMetaList = [];
						
						// 없음
						if(keys.length == 0 ){
							return;
						}
// 						// 메타 접근. 후보리스트 가져옴
// 						for(var i=0; i<keys.length; i++){
// 							// 메타에 프레임수를 통해 객체 있는거 가져옴(시작 끝 비교)
// 							var sf = meta[keys[i]].startFrame;
// 							var ef = meta[keys[i]].endFrame;
							
// 							if(frame >= sf && frame <= ef){
// 								// 후보리스트로 갖고있음
// 								candidateMetaList.push(meta[keys[i]]);
								
// 							}
// 						}

						// 메타 접근. 후보리스트 가져옴
						// 메타에 프레임수를 통해 객체 있는거 가져옴(시작 끝 비교)
						var sf = meta[cur_id].startFrame;
						var ef = meta[cur_id].endFrame;
						
// 						if(frame >= sf && frame <= ef){
// 							// 후보리스트로 갖고있음
// 							candidateMetaList.push(meta[keys[i]]);
							
// 						}
						if(frame >= sf && frame <= ef){
							// 후보리스트로 갖고있음
							candidateMetaList.push(meta[cur_id]);
							
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
						$("#loader").hide();
					},
					
					//get array Number
					checkMetaDataStatus : function(uuid,currFrm){ 
						const that = videoBBoxList;
						
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
						const that = videoBBoxList;
						var meta = that.data.meta;
						
						var emptyGap = meta[uuid].startFrame - currFrm;
						
						var tempArr = []; 
						for(var i=0; i< meta[uuid].rectData.length; i++){
							tempArr[i+emptyGap] = meta[uuid].rectData[i];
						}
						meta[uuid].rectData = tempArr;
					},
					
					generateMetaTempData : function(uuid,currFrm){
						const that = videoBBoxList;
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
						const that = videoBBoxList;
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
						const that = videoBBoxList;
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
							
							meta[uuid].category = $("#videoBBoxList .category_wrap [id="+uuid+"] .category").val();
							
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
							meta[uuid].category = $("#videoBBoxList .category_wrap [id="+uuid+"] .category").val();
							
							return;
						}
			   	    	
					},
					
					deleteMetaData(uuid,labelBox){
						const that = videoBBoxList;
						if(!uuid){
							return false;
						}
						labelBox.remove();
						delete that.data.meta[uuid];
						var canv = that.computed.getCanvasObject(uuid);
						that.data.canvas.remove(canv);
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
						const that = videoBBoxList;
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
						const that = videoBBoxList;               	
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
					
				}, // computed end
				
				// draw something
				render : {
					
					updateListPage(data,startPage,page_size,total_size){
						const that = videoBBoxList;
						var pt = that.pt;
						var totalPage = Math.ceil(total_size * 1 / page_size);
						
						if($("#videoBBoxList #pagination").data("twbs-pagination")){
							$("#videoBBoxList #pagination").twbsPagination('destroy');
						}
						
						$("#videoBBoxList #pagination").twbsPagination({
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
// 						that.render.drawDataList(temp,total_size);
						that.render.initMetaListFromData(data);
// 						that.render.initMetaFromData(data);
// 						that.bind.sideEvtCollision();
					},					
					
					/*
					*  jh.sa 201015 : drawDataList
					*/
					drawDataList(data, totalSize, pageNum, pageSize){
						const that = videoBBoxList;
						
						var total = $("#videoBBoxList .data_list_wrap .data_total span");
						var target = $("#videoBBoxList .list_table .c_wrap");
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
					
					renderVideoByData(data,total_size){
						const that = videoBBoxList;
						
						that.data.player['dataId'] = data['data_id'];
						// jh.sa 210121
						that.data.player['finalFrame'] = data['frame'];
						var dataAddr = '/uploadFile/xlabeller/'+data.path;
						
						$("#videoBBoxList .prog_bar .name_wrap .video_name").html(data['filename']);
						$("#videoBBoxList .img_list_wrap .name_wrap .video_name").html(data['filename']);
						$("#videoBBoxList .img_list_wrap .name_wrap .video_name").attr("title",data['filename']);
						$("#videoBBoxList .list_table .c_wrap .path").removeClass("active");
						$("#videoBBoxList .list_table .c_wrap [data-id='"+data['data_id']+"'] .path").addClass("active");
						$("#videoBBoxList .list_table .c_wrap [data-id='"+data['data_id']+"'] .label_cnt").html(data['meta_cnt']);
						$("#videoBBoxList .position_wrap .position-value").val(that.data.videoObj['currDataNum']);
						
						if(total_size){
							$("#videoBBoxList .position_wrap .total_count span").html(total_size);
						}
						
						// jh.sa 210121
						if(that.data.player['finalFrame']){
							$("#videoBBoxList .frame_wrap .total_frame span").html(that.data.player['finalFrame']);
						}									
						
						that.computed.adjustVideoSrc(dataAddr,data['fps']);
// 						that.computed.loadImage(dataAddr);
						that.render.checkWindowWidth();
						that.bind.sideEvtCollision();
						
					},					
					
					// function move rectangle
					moveRectOnCanvas(uuid,arrNum){
						const that = videoBBoxList;
						
						var meta = that.data.meta[uuid].rectData[arrNum];
// 						var meta = newMeta.rectData[arrNum];
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
					initMetaListFromData(result){
						const that = videoBBoxList;
						var metaList = that.data.metaList;
						
						var cateArr = [];
						var dataObj = {};
						
						$("#videoBBoxList .label_wrap .category_wrap").empty();
						if(!result){
							return false;
						}
						for(let i=0; i<result.length; i++){
							var temp = JSON.parse(result[i].info);
							
// 							var rectData = that.computed.rescale(temp['rectData']);
							// jh.sa 201022
							var rectData = that.computed.rescale(temp['rectData'],"0");
							metaList[result[i]['meta_id']] = {
								id : result[i]['meta_id'],
								rectData : rectData,
								category : result[i]['label'],
								startFrame : temp['startFrame'],
								endFrame : temp['endFrame'],
							}
							
							///// jh.sa 201022
							dataObj[result[i]['meta_id']] = {
									id : result[i]['meta_id'],
									data_id : result[i]['data_id'],
									path : result[i]['path'],
									label_type : result[i]['label_type'],
									fps : result[i]['fps'],
									frame : result[i]['frame'],	// jh.sa 210121
							};
						};
						
						that.render.renderCate(dataObj);
						$("#videoBBoxList .label_wrap .category_wrap .cate").removeClass("selected");
						$("#videoBBoxList .label_wrap .category_wrap .cate").last().addClass("selected");
					},
					initMetaFromData(result){
						const that = videoBBoxList;
						var meta = that.data.meta;
						var uuid = that.data.player['metaId'];
						var cateArr = [];
						var dataObj = {};
						
// 						$("#videoBBoxList .label_wrap .category_wrap").empty();
						if(!result){
							return false;
						}
						for(let i=0; i<result.length; i++){
							if(result[i]['meta_id'] == uuid){
								var temp = JSON.parse(result[i].info);
								
//	 							var rectData = that.computed.rescale(temp['rectData']);
								// jh.sa 201022
								var rectData = that.computed.rescale(temp['rectData'],"0");
								meta[result[i]['meta_id']] = {
									id : result[i]['meta_id'],
									rectData : rectData,
									category : result[i]['label'],
									startFrame : temp['startFrame'],
									endFrame : temp['endFrame'],
								}								
							}
// 							var temp = JSON.parse(result[i].info);
							
// // 							var rectData = that.computed.rescale(temp['rectData']);
// 							// jh.sa 201022
// 							var rectData = that.computed.rescale(temp['rectData'],"0");
// 							meta[result[i]['meta_id']] = {
// 								id : result[i]['meta_id'],
// 								rectData : rectData,
// 								category : result[i]['label'],
// 								startFrame : temp['startFrame'],
// 								endFrame : temp['endFrame'],
// 							}
// 							metaList[result[i]['meta_id']] = {
// 								id : result[i]['meta_id'],
// 								rectData : rectData,
// 								category : result[i]['label'],
// 								startFrame : temp['startFrame'],
// 								endFrame : temp['endFrame'],
// 							}
							
							///// jh.sa 201022
// 							dataObj[result[i]['meta_id']] = {
// 									id : result[i]['meta_id'],
// 									data_id : result[i]['data_id'],
// 									path : result[i]['path'],
// 									label_type : result[i]['label_type'],
// 									fps : result[i]['fps'],
// 							};
						};
						
// 						that.render.renderCate(dataObj);
// 						$("#videoBBoxList .label_wrap .category_wrap .cate").removeClass("selected");
// 						$("#videoBBoxList .label_wrap .category_wrap .cate").last().addClass("selected");
						
					},
					// in labeller tab
					tempInitCategory(uuid,data){
						const that = videoBBoxList;
						
						var html = "";
						
						if(!data){
							html = '<div class=" cate_wp  " id="'+uuid+'">';
							html += '	<div class="cate_header col-12 flex justify-content-between p-1">';
							html += '		<div class="color  "></div>';
							html += '		<button  class="start_frm btn btn-info">Start</button>';
							html += '		<button class="end_frm btn btn-info">End</button>';
							html += '       <button class="delete_frm btn btn-danger">Delete subsequent frames</button>';
							html += '		<button class="delete btn btn-danger ">Delete</button>';
							html += '	</div>';
							html += '	<div class="w-100"></div>';
							html += '	<div class="col-12 text-center p-1">';
							html += '		<input type="text" class="form-control category" name="label_name" onkeyUp="noKor(event);noSpaceForm(this);" onchange="noSpaceForm(this);"/>';
							html += '	</div>';
							
							html += '</div>';							
						} else {
							html = '<div class=" cate_wp  " id="'+uuid+'" data-id="'+data.data_id+'" data-type="'+data.label_type+'" data-path="'+data.path+'" data-fps="'+data.fps+'" data-frame="'+data.frame+'">';
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
						}

						
						return html;
					},
					
					renderCate(data) { //drawing category from meta in labeller tab
						const that = videoBBoxList;
						var metaList = that.data.metaList;
						var metaKeys = Object.keys(metaList);
						var dataKeys = Object.keys(data);
						
						if(dataKeys.length == metaKeys.length){
							for(var i=0; i<metaKeys.length; i++){
								if(dataKeys[i] == metaKeys[i]){
									var uuid = metaList[metaKeys[i]]['id'];
									var dataInfo = data[dataKeys[i]];
									
									let html = that.render.tempInitCategory(uuid,dataInfo);
									$("#videoBBoxList .label_wrap .category_wrap ").append(html);
									
									let color = that.data.colorHash.rgb(uuid);
									$("#videoBBoxList .label_wrap .category_wrap [id='"+uuid+"'] .color").css("background-color","rgb("+color+")");
									
									$("#videoBBoxList .label_wrap .category_wrap [id='"+uuid+"'] .category").val(metaList[metaKeys[i]]['category']);									
								}	
							}							
						}
						
						that.bind.sideEvtCollision();
					
					}, // drawing category from meta end in Labeller tab
					
					// input current Frame info on the progress bar
					inputCurrFrame(frame){
						$("#videoBBoxList .btn_wrap input.curr_frame").val(frame);
					}, //  input curr frame end
					
					adjustArea(){
						const that = videoBBoxList;
						var scaleFactor = that.data.scaleFactor;
						
						var scaledHeight = scaleFactor.origHeight * scaleFactor.ratio;
						var progBarHeight = 157;
// 						var headerHeight = 67*1;	
						var headerHeight = 102*1;
// 						var progBarHeight = $("#videoBBoxList .prog_bar").height();
						
						// video area height
						$("#videoBBoxList .enrichment").css("height",scaledHeight*1+progBarHeight+headerHeight);
						$("#videoBBoxList-video").css("height",scaledHeight);
						$("#videoBBoxList .video_pwrap ").css("height",scaledHeight);
						// canvas init and adjust height
// 						that.data.canvas.setHeight(scaledHeight-progBarHeight);
						that.data.canvas.setHeight(scaledHeight);
// 						// search area height
// 						$(".cate_search_wrap .content_wp").css("height",scaledHeight-progBarHeight);
						
		 				// category area height
// 						$("#videoBBoxList .label_wrap ").css("height",$("#labeller-video")[0].clientHeight); //jh.sa
// 						$("#videoBBoxList .label_wrap .category_wrap").css("height",$("#labeller-video")[0].clientHeight-progBarHeight-10); //jh.sa
						
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
						const that = videoBBoxList;
					
						if(isPaused == false){
							$("#videoBBoxList .img_list_wrap .btn_wrap .play_btn").find("i").removeClass("fa-play");
							$("#videoBBoxList .img_list_wrap .btn_wrap .play_btn").find("i").addClass("fa-pause");
							$("#videoBBoxList .img_list_wrap .btn_wrap .play_btn").addClass("pause_btn");
							$("#videoBBoxList .img_list_wrap .btn_wrap .play_btn").removeClass("play_btn");
						}else{
							$("#videoBBoxList .img_list_wrap .btn_wrap .pause_btn").find("i").removeClass("fa-pause");
							$("#videoBBoxList .img_list_wrap .btn_wrap .pause_btn").find("i").addClass("fa-play");
							$("#videoBBoxList .img_list_wrap .btn_wrap .pause_btn").addClass("play_btn");
							$("#videoBBoxList .img_list_wrap .btn_wrap .pause_btn").removeClass("pause_btn");
							
						}
						that.bind.sideEvtCollision();
					},
					
				},// draw something end
				
				
		}
		
	  </script>		
   </body>
</html>