<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
<title>X-labeller</title>

<style>


	@media screen and (min-width: 1920px){
		#annotation_upload .search_wrap .search_result_wrap .media_wrap .search_result { width : 536px; }
		#annotation_upload .tag_margin { width : 528px;}
		#annotation_upload .all_margin {width : 523px; }
		#annotation_upload .tag_box_wrap button {width: 78px;}
		#annotation_upload .all_margin .select_all_wrap .checkBox {padding-left: 0px;}

		#annotation_upload .tag_box_wrap {margin: 5px;}
		#annotation_upload .tag_wrap {max-height: 126px; min-height: 42px;}
	}

	@media screen and (max-width: 1920px){
		#annotation_upload .search_wrap .search_result_wrap .media_wrap .search_result { width : 536px; }
		#annotation_upload .tag_margin { width : 528px;}
		#annotation_upload .all_margin {width : 523px; }
		#annotation_upload .tag_box_wrap button {width: 78px;}
		#annotation_upload .all_margin .select_all_wrap .checkBox {padding-left: 0px;}

		#annotation_upload .tag_box_wrap {margin: 5px;}
		#annotation_upload .tag_wrap {max-height: 126px; min-height: 42px;}
	}
	
	@media screen and (max-width: 1600px){
		#annotation_upload .search_wrap .search_result_wrap .media_wrap .search_result { width : 402px; }
		#annotation_upload .tag_margin { width : 395px;}
		#annotation_upload .all_margin {width : 391px; }
		#annotation_upload .all_margin .select_all_wrap .checkBox {padding-left: 2px;}
		#annotation_upload .tag_box_wrap button {width: 71px;}
		#annotation_upload .tag_box_wrap {margin: 4px;}
		#annotation_upload .tag_wrap {max-height: 120px; min-height: 40px;}
	}

	@media screen and (max-width: 1440px){
		#annotation_upload .search_wrap .search_result_wrap .media_wrap .search_result { width : 402px; }
		#annotation_upload .tag_margin { width : 395px;}
		#annotation_upload .all_margin {width : 391px; }
		#annotation_upload .all_margin .select_all_wrap .checkBox {padding-left: 2px;}
		#annotation_upload .tag_box_wrap button {width: 69px;}
		#annotation_upload .tag_box_wrap {margin: 5px;}
		#annotation_upload .tag_wrap {max-height: 126px; min-height: 42px;}
	}

/* 공통 */

#annotation_upload {height: 100%; width: 100%;}
.section_wrap {background-color: #fff;}
#annotation_upload .ms_wrap {width: 100%; padding-top: 23px;}
#annotation_upload .anno_table tbody td {cursor:default;}
#annotation_upload .table_body{max-height: calc(100% - 212px); overflow-y: overlay; overflow-x:hidden;}
#annotation_upload .hover_box {border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
#annotation_upload .hover_box div {font-family: Open_Sans; font-size: 13px; color: #555555;}
#annotation_upload .hover_div div {word-break: break-word; margin: 2px 5px; white-space: normal; font-weight: 300; font-family: Open_Sans;}


#annotation_upload .empty_wrap {text-align: center;}
#annotation_upload .empty_wrap .no_image {margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; }
#annotation_upload .empty_wrap .eng_text {font-family: Open_Sans; margin-bottom: 3px; font-size: 16px; font-weight: 300; color: #777777;}
#annotation_upload .empty_wrap .kor_text {font-family: Open_Sans; font-size: 12px; color: #777777; font-weight: 200;}

/* main wrap 쪽 */
#annotation_upload .main_wrap {width: 60%; height: 100%; position:relative;}
#annotation_upload .main_title {display: block; height: 14px; font-family: Open_Sans; font-size: 12px;font-weight: 400; color: #343434;}
#annotation_upload .anno_title {margin-top : 20px;  display: block; font-family: Open_Sans; font-size: 20px; color: #343434;}
#annotation_upload .anno_contents {margin-top : 8px; display: block;  font-family: Open_Sans; font-size: 12px; color: #797a7c; width: 304px;}
#annotation_upload .anno_wrap > input { width: 900px; border-width: 0; padding: 0; font-weight: 300;}

#annotation_upload .main_wrap .list_wrap span {margin: 22px 0 24px; float: left; font-family: Open_Sans;font-size: 14px;font-weight: 400; color: #343434;}
#annotation_upload .main_wrap .list_wrap .list_total {float: right; }

#annotation_upload .main_wrap .list_wrap .btn_wrap > button {border-radius:2px; text-align:center ; padding: 0px; width: 68px; height: 28px; font-family: Open_Sans;font-size: 12px; font-weight: 300;}

#annotation_upload .main_wrap .del_btn {float:left; background-color: #f8f8f8; color: #343434;}
#annotation_upload .main_wrap .btn_wrap.del {left: 30px;}

#annotation_upload .main_wrap .save_btn {float:right; background-color: #4c84ff; color: #ffffff; }
#annotation_upload .main_wrap .btn_wrap.save {right: 30px;}

#annotation_upload .main_wrap .save_btn:hover {background-color: #3A71E9; }

#annotation_upload .main_wrap .list_wrap {height: calc(100% - 130px);}

#annotation_upload .main_wrap .empty_wrap { margin-top: 170px;  }
#annotation_upload .main_wrap .no_image {height: 37px; background-image: url('./images/icon_nodata_list.png'); }


#annotation_upload .main_wrap .list_wrap .btn_wrap {bottom: 0; position: absolute; margin-bottom: 41px; }
#annotation_upload .main_wrap .list_wrap .btn_wrap.del{ left: 30;}
#annotation_upload .main_wrap .list_wrap .btn_wrap.save{ right: 30;}

#annotation_upload .main_wrap .list_wrap table tbody {margin: 0 30px;}
#annotation_upload .main_wrap .list_wrap table tbody tr .preview .img_preview {cursor: pointer; border : 1px solid #979797; position: relative; margin: auto;  border-radius: 2px; background-size: 14px; width: 28px ; height: 28px; background-color: rgba(0, 0, 0, 0.1); background-image: url('./images/icon_preview_normal.png'); background-repeat: no-repeat; background-position: center; position: relative;}
#annotation_upload .main_wrap .list_wrap table tbody tr .preview .img_preview:hover { background-image: url('./images/icon_preview_hover.png'); border: 1px solid #4c84ff;}
#annotation_upload .main_wrap .list_wrap table tbody tr .preview .show_img{ z-index: 1; display: none; align-items: center; justify-content: center; flex-direction: column;  border-radius: 1px ; border : 1px solid #dadada;  top: -30px; left: 130%;  width: 120px;height: 90px;box-shadow: 0 5px 9px -1px rgba(0, 0, 0, 0.16); background-color: #ffffff;}
#annotation_upload .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap{ z-index: 99; display: none;   border-radius: 1px ; border : 1px solid #dadada;  top: -30px; left: 130%;  width: 294px;height: 248px; box-shadow: 0 5px 9px -1px rgba(0, 0, 0, 0.16); background-color: #ffffff}
#annotation_upload .main_wrap .list_wrap table tbody tr .preview .img_preview.selected .normal_img_wrap{display: block;}
#annotation_upload .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap .title_wrap {height: 28px; }
#annotation_upload .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap .title_wrap .image{margin-left: 12px; background-image: url('./images/icon_preview_hover.png'); background-repeat: no-repeat; width: 12px; height: 12px; }
#annotation_upload .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap .title_wrap .title{overflow: hidden; white-space: nowrap; text-overflow: ellipsis;max-width: 254px; margin-right:12px; margin-left: 4px; font-weight: 300; font-family: Open_Sans; font-size: 12px; color: #555555; }
#annotation_upload .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap .frame_container {display:flex; height:219px; align-items: center; justify-content: center; flex-direction: column; border-top: 1px solid #dadada; }

#annotation_upload .main_wrap .horizontal_line {width: 100%; height: 1px; background-color: #e7e7e7; margin-top: 18px; display:inline-block;}

#annotation_upload .main_wrap .hover_div {max-width: 264px; text-align: left; position: relative; }
#annotation_upload .main_wrap .hover_box {max-width: 264px; text-align: left; }

/* search wrap 쪽 */

#annotation_upload .search_wrap {width: 40%; height: 100%; border-left: 1px solid #e5e5e5; position: relative; overflow-y: hidden;}
#annotation_upload .tag_margin {margin: 0 auto;}

#annotation_upload .second_wrap {position: relative; height: 100%;}
#annotation_upload .search_wrap .empty_wrap { margin-top: 270px;  }
#annotation_upload .search_wrap .empty_wrap .no_image {height: 34px; background-image: url('./images/icon_nodata_research.png');} 

#annotation_upload .image_search {margin-top: 17px; position: relative; display: block; }
#annotation_upload .image_search input { border-radius: 2px; border-color: #dedcde; border-right: none; padding: 0 11px; margin-left: 177px; width: calc(100% - 200px); height: 40px; font-weight: 300; background-color: #ffffff; font-family: Open_Sans; font-size: 13px; color: #555555; box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1);}
/* #annotation_upload .image_search input { border-radius: 2px; border-color: #dedcde; border-right: none; padding: 0 11px; width: calc(100% - 23px); height: 40px; font-weight: 300; background-color: #ffffff; font-family: Open_Sans; font-size: 13px; color: #555555; box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1);} */
#annotation_upload .image_search select { width: 170px; height: 42px; padding: 0 11px; display: inline-block; position: absolute; color: #555; background-color: #fff; box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1); border-color: #dedcde; border-radius: 2px; outline: none; font-weight: 300; font-family: Open_Sans; }
#annotation_upload .image_search .search_btn {top: 0 ; background-repeat: no-repeat; background-position: center; background-image: url('./images/icon_filter_search_normal.png'); right: 0; position: absolute;  width: 41px; height: 41px; background-color: #4c84ff; border-radius: 4px;}
#annotation_upload .image_search .search_btn:hover {background-color: #3A71E9; }
#annotation_upload .search_wrap .add_btn {border-radius:2px; padding: 0 ; border: 1px solid #cbcbcb;  text-align: center; width: 88px; height: 28px;background-color: #f8f8f8; font-family: Open_Sans;font-size: 12px;font-weight: 300;color: #343434;}
#annotation_upload .search_wrap .arg_btn {margin-left:10px; border-radius:2px; padding: 0 ; border: 1px solid #cbcbcb;  text-align: center; width: 88px; height: 28px;background-color: #f8f8f8; font-family: Open_Sans;font-size: 12px;font-weight: 300;color: #343434;}

#annotation_upload .search_wrap .horizontal_line {width: 100%; height: 0; margin-top: 26px;}
#annotation_upload .search_wrap .select_all_wrap {margin-bottom : 20px; }
#annotation_upload .search_wrap .select_all_wrap span { line-height: 14px; font-family: Open_Sans; font-size: 12px; color: #343434; float:left; margin-left: 9px; width: calc(100% - 111px); font-weight: 300;}

#annotation_upload .search_title {display: inline-block;  font-family: Open_Sans; font-size: 12px;color: #343434; font-weight: 400;}
#annotation_upload span.list_total {float: right; font-family: Open_Sans; font-size: 12px;color: #343434; font-weight: 400;}

#annotation_upload .search_wrap .search_result_wrap { margin-top: 23px; width: 100%; position: relative; display: block; height: 100%}
#annotation_upload .search_wrap .search_result_wrap .media_wrap { overflow-y: overlay; height: calc(100% - 511px);}
#annotation_upload .search_wrap .search_result_wrap .media_wrap .search_result {margin: 0 auto; }
#annotation_upload .search_wrap .search_result_wrap #loading {background: 0;}
#annotation_upload .search_wrap .search_result_wrap .search_result .box_contain {float:left ; width:120px; margin: 7px;}
#annotation_upload .search_wrap .search_result_wrap .search_result .box { top: 13px; border-radius: 2px; width: 120px; height: 90px; text-align:center; border: solid 1px #d9d9d9; background-color: #ffffff;  display: flex; align-items: center; justify-content: center;position:relative;flex-direction: column; }
#annotation_upload .search_wrap .search_result_wrap .search_result  {flex-wrap: wrap;  align-items: flex-center;}
#annotation_upload .search_wrap .search_result_wrap .search_result .box .select_box { position: absolute; width: 14px; height: 14px; top: 10px; left: 10px; background-image: url('./images/btn_checkbox_normal.png'); background-repeat: no-repeat; }
#annotation_upload .search_wrap .search_result_wrap .search_result .box:hover .select_box {background-image: url('./images/btn_checkbox_hover.png');}
#annotation_upload .search_wrap .search_result_wrap .search_result .box:hover {cursor: pointer; border : 1px solid #4c84ff;}
#annotation_upload .search_wrap .search_result_wrap .search_result .box .select_box.selected {background-image: url('./images/btn_checkbox_selected.png');  }

#annotation_upload .search_wrap .box_contain .label_wrap {border-radius: 2px; margin-top: 12px; width: 120px; height: 24px; position:relative; border: 1px solid #dedcde; background-color: #ffffff; overflow: hidden;white-space: nowrap;text-overflow: ellipsis;}
#annotation_upload .search_wrap .box_contain .label_wrap span { line-height: 24px; margin-left: 9px;  font-family: Open_Sans; font-size: 13px; color: #555555; font-weight: 300;}

#annotation_upload .image_search .detail_btn {border : 0; background-image: url('./images/icon_filter_normal.png'); top :5px; right: 0; position: absolute; margin-right: 50px; width: 30px; height: 30px;}
#annotation_upload .image_search .detail_btn:hover {background-image: url('./images/icon_filter_hover.png');}

#annotation_upload .detail_tooltip {margin-top : 15px; z-index: 999999; right:0 ; top : 55; position: absolute; visibility: hidden; width: 245px;height: 433px;background: #ffffff; border-radius: 2px; border : 1px solid #dadada;} 
#annotation_upload .detail_tooltip:after, .detail_tooltip:before {bottom: 100%; left: 84.5%; border: solid transparent; content: " "; height: 0; width: 0; position: absolute; pointer-events: none;} 
#annotation_upload .detail_tooltip:after {border-color: rgba(136, 183, 213, 0); border-bottom-color: #ffffff; border-width: 10px; margin-left: -35px;}
#annotation_upload .detail_tooltip:before {border-color: rgba(194, 225, 245, 0); border-bottom-color: #dadada; border-width: 11px; margin-left: -36px;}

#annotation_upload .info_wrap {position:relative; width: 100% ; height: 97.3%;}
#annotation_upload .info_wrap .select_wrap {position: absolute; margin-top: 13px; max-height: 295px; width: 100%; overflow-y: overlay; border-bottom: 1px solid #dadada; border-top: 1px solid #dadada;}
#annotation_upload .info_wrap .set_wrap {width: 245px; height: 28px;  background-color: #ffffff; position:absolute; text-align:center; margin: 333px auto 0 auto;}
#annotation_upload .info_wrap .set_wrap button {border-radius:2px; width: 68px; height: 28px; font-family: Open_Sans; font-size: 12px; font-weight: 300; color: #343434; background-color: #f8f8f8; padding: 0px; border: 1px solid #cbcbcb ; border-radius: 1px;}

#annotation_upload .info_wrap .close_tooltip_btn {padding:0;  background-repeat: no-repeat; background-position: center; background-image: url('./images/icon_filter_arrow_normal.png'); color: #555555;  height: 20px; position: absolute; bottom: 0; width : 100%; background-color: #f8f8f8; text-align: center;  border-top: 1px solid #cbcbcb; border-radius: 1px; }
#annotation_upload .info_wrap .close_tooltip_btn:hover {background-image: url('./images/icon_filter_arrow_hover.png');}

#annotation_upload .select_wrap .dataset_wrap {cursor:pointer; width: 100%; height: 36px; border-bottom: 1px solid #dadada;}
#annotation_upload .select_wrap .dataset_wrap:hover { background-color: #e4f1ff;}

#annotation_upload .select_wrap .dataset_wrap .checkBox {margin-left: 21px;}

#annotation_upload .select_wrap .dataset_wrap .folder {background-image: url('./images/icon_filter_folder.png'); background-repeat: no-repeat; background-position: center; margin-left: 13px; width: 16px; height: 16px;}
#annotation_upload .select_wrap .dataset_wrap .title {margin-left: 10px;  font-family: Open_Sans; font-weight: 300; font-size: 13px; color: #616263; overflow: hidden;white-space: nowrap;text-overflow: ellipsis;max-width: 150px;}
#annotation_upload .select_wrap .dataset_wrap:last-child{border-bottom: 0;}

#annotation_upload .info_wrap .filter_wrap {margin-top : 14px; margin-left: 21px;}
#annotation_upload .info_wrap .filter_wrap span {margin-left: 13px; line-height: 14px; font-size: 12px; color: #343434; font-family: Open_Sans; font-weight: 400; }

#annotation_upload .search_wrap .first_wrap {background-color: #f5f5f5; border-bottom : 1px solid #e5e5e5;}


#annotation_upload .tagtp {padding: 20px 0 ; border-bottom: 1px solid #e5e5e5; }
#annotation_upload .tag_txt_wrap {height: 48px; border-bottom : 1px solid #e5e5e5;}
#annotation_upload .tag_txt_wrap span {line-height: 48px;font-size: 14px;font-family: Open_Sans;font-weight: 400; color: #555555; }
#annotation_upload .tag_margin {margin: 0 auto;}
#annotation_upload .tag_wrap {overflow: overlay; overflow-x:hidden;}
#annotation_upload .tag_wrap .tag_box_wrap { float : left; text-align: center; }
#annotation_upload .tag_wrap .tag_box_wrap button{ height: 32px; border: 1px solid #d9d9d9; border-radius: 4px; font-weight: 200; background-color: #f4f7fc;  font-family: Open_Sans; font-size: 14px; color: #555555; padding: 0px; overflow: hidden;white-space: nowrap;text-overflow: ellipsis;}
#annotation_upload .tag_wrap .tag_box_wrap button.selected {box-shadow: 0 3px 4px 0 rgba(159, 189, 255, 0.7); background-color: #4c84ff; color: #ffffff;}

#annotation_upload .second_wrap .hover_div {max-width: 94px; text-align: left; position: relative; }
#annotation_upload .second_wrap .hover_box {max-width: 94px; text-align: left; }
#annotation_upload .all_margin {margin: 0 auto;}

#annotation_upload .search_wrap .search_result_wrap .search_result .box.vid {border-radius: 2px; width: 120px; height: 22px; top: 13px; text-align:center; border: solid 1px #d9d9d9; background-color: #ffffff;  display: flex; align-items: center; justify-content: center;position:relative;flex-direction: column; }
#annotation_upload .search_wrap .search_result_wrap .search_result .box.vid .select_box { top: 4px; left: 4px; }

</style>

</head>
<body>

	<div class="container" id="annotation_upload">

		<div class="contents flex">
			<div class="main_wrap ">
				<div class="title_wrap ms">
					<div class="ms_wrap">
						<span class="main_title">Create Annotation</span>
						<div class="anno_wrap">
							<input class="anno_title" data-length="100" placeholder="Please enter the title" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"> 
							<input class="anno_contents" data-length="200" placeholder="Please enter the description">
						</div>
					</div>
				</div>
				<div class="horizontal_line"></div>
					<div class="list_wrap ms">
						<span class="list_title">Label List</span>
						<span class="list_total">Total 0</span>
						<div class="table_header">
							<table class="anno_table">
								<colgroup>
									<col style="width: 46px;"></col>
									<col style="width: 67px;"></col>
									<col style="width: auto;"></col>
									<col style="width: 61px;"></col>
									<col style="width: 61px;"></col>
									<col style="width: 61px;"></col>
									<col style="width: 61px;"></col>
									<col style="width: 85px;"></col>
								</colgroup>
								<thead>
									<tr>
										<th><div class="checkBox"></div></th>
										<th class="pre">PREVIEW</th>
										<th>PATH</th>
										<th>X</th>
										<th>Y</th>
										<th>W</th>
										<th>H</th>
										<th>LABEL</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table_body">
							<table class="anno_table">

								<colgroup>
									<col style="width: 46px;"></col>
									<col style="width: 67px;"></col>
									<col style="width: auto;"></col>
									<col style="width: 61px;"></col>
									<col style="width: 61px;"></col>
									<col style="width: 61px;"></col>
									<col style="width: 61px;"></col>
									<col style="width: 85px;"></col>
								</colgroup>

								<tbody>

								</tbody>

							</table>
						</div>
						<div class="btn_wrap del">
							<button class="del_btn ">Delete</button>
						</div>
						<div class="btn_wrap save">
							<button class="save_btn ">Save</button>
						</div>
					</div>
			</div>

			<div class="search_wrap">
				<div class="first_wrap">
					<div class="ms">
						<div class="ms_wrap">
							<span class="search_title">Search label Image by name</span>
							<span class="list_total">Total 0</span>
							
							<div class="image_search">
								<select name="label_type">
 									<!-- <option value="" data-value="box" selected>Bounding Box</option>
									<option value="polygon" data-value="polygon">Segmentation</option> -->	 
									<option value="" data-value="IMAGE_BBOX" selected>Image Bounding Box</option>
									<option value="IMAGE_SEGMENTATION" data-value="IMAGE_SEGMENTATION">Image Segmentation</option>
									<option value="VIDEO_BBOX" data-value="VIDEO_BBOX">Video Bounding Box</option>										
								</select>
								<input placeholder="Please enter the keyword" name="images">
								<button class="detail_btn "></button>
								<div class="detail_tooltip filter_color">
									<div class="info_wrap">
										<div class="filter_wrap flex">
											<div class="checkBox"></div>
											<span>Filter List</span>
										</div>
										<div class="select_wrap"></div>
										<div class="set_wrap">
											<button>Confirm</button>
										</div>
										<button class="close_tooltip_btn"></button>
									</div>
								</div>
								<button class="search_btn filter_color"></button>
							</div>
							<div class="horizontal_line"></div>
						</div>
					</div>
				</div>
				<div class="second_wrap filter_color">
				
				</div>
				
			</div>

		</div>

	</div>
</body>


<script>
	$(document).on("sessionLoad", function() {

	});
	
	// canvas
// 	var canvas;											// jh.sa 210225 canvas => that.data.canvas
// 	var canvas_hover;									// jh.sa 210225 canvas_hover => that.data.canvas_hover
// 	var colorHash = new ColorHash();					// jh.sa 210225 colorHash => that.data.colorHash
// 	var scale;											// jh.sa 210225 scale => that.data.scaleFactor
	
	// 데이터셋 데이터를사용
// 	var filter_arr = [];								// jh.sa 210225 filter_arr => that.data.filter_arr
	/* var segmentation; */
// 	var dataset_list = [];								// jh.sa 210225 dataset_list => that.data.dataset_list

	// 검색할때 fix 할거 
// 	var fixed_arr = [];									// jh.sa 210225 fixed_arr => that.data.fixed_arr
	// 태그용
// 	var tag_arr = [];									// jh.sa 210225 tag_arr => that.data.tag_arr
	// append 나 prepend 할때 사용하는 arr;	
// 	var search_arr = [];								// jh.sa 210225 search_arr => that.data.search_arr
	
	// 중복 제거 /태그용
// 	var dup_obj = [];									// jh.sa 210225 dup_obj => that.data.dup_obj
	
	// 검색 해서 데이터 가져올때 겹치는 부분 제거하기위해사용
// 	var search_obj = [];								// jh.sa 210225 search_obj => that.data.search_obj
	
	//오른쪽 박스 리스트에 사용 
	
// 	var box_obj = [];									// jh.sa 210225 box_obj => that.data.box_obj
// 	var tag_text = "";									// jh.sa 210225 tag_text => that.data.tag_text
	
	//search 부분 스크롤
// 	var scrollObj = {									// jh.sa 210225 scrollObj => that.data.scrollObj
// 			scroll_start:0,
// 			scroll_end:0,
// 			isScroll_top:0,
// 			isScroll_end:0,
// 			isScroll : false,
// 			default_size : 40,
// 			half_size : (40 / 2)
// 	}
	

	//왼쪽에 이미지 리스트에서 사용할것...

// 	var isImageScroll_top;								// jh.sa 210225 isImageScroll_top => that.data.imgScrollObj.isImageScroll_top
// 	var isImageScroll_end;								// jh.sa 210225 isImageScroll_end => that.data.imgScrollObj.isImageScroll_end
// 	var isImageScroll = false;							// jh.sa 210225 isImageScroll => that.data.imgScrollObj.isImageScroll
// 	var image_box_obj = [];								// jh.sa 210225 image_box_obj => that.data.imgScrollObj.image_box_obj
// 	var image_default_size = 40;						// jh.sa 210225 image_default_size => that.data.imgScrollObj.image_default_size
// 	var image_half_size = (image_default_size / 2);		// jh.sa 210225 image_half_size => that.data.imgScrollObj.image_half_size
// 	var removed_size = 0;								// jh.sa 210225 removed_size => that.data.imgScrollObj.removed_size
// 	var linked_list = null; 							// jh.sa 210225 linked_list => that.data.imgScrollObj.linked_list
// 	var last_node;										// jh.sa 210225 last_node => that.data.imgScrollObj.last_node
// 	var start_node;										// jh.sa 210225 start_node => that.data.imgScrollObj.start_node
// 	var image_remain_size;								// jh.sa 210225 image_remain_size => that.data.imgScrollObj.image_remain_size
	
	
	//replaceAll prototype 선언
	function replaceAll(str, searchStr, replaceStr) {
		return str.split(searchStr).join(replaceStr);
	}
	
	var annotation_upload = {
		pt : $("#annotation_upload"),
		data : {
			// canvas 
			canvas : null,
			canvas_hover : null,
			colorHash : null,
			scaleFactor : null,
			// 데이터셋 데이터를 사용 
			filter_arr : [],
			dataset_list : [],
			// 검색할 때 fix 할 것 
			fixed_arr : [],
			// 태그용
			tag_arr : [],
			// append 또는 prepend 할 때 사용하는 arr
			search_arr : [],
			// 중복 제거 /태그용
			dup_obj : [],
			// 검색해서 데이터 가져올 때 겹치는 부분 제거하기 위해서 사용하는 arr
			search_obj : [],
			// 오른쪽 박스 리스트에 사용
			box_obj : [],
			tag_text : null,
			// 우측 search 부분 스크롤
			scrollObj : {
				scroll_start:0,
				scroll_end:0,
				isScroll_top:0,
				isScroll_end:0,
				isScroll : false,
				default_size : 40,
				half_size : (40 / 2),
			},
			// 좌측 이미지 리스트 스크롤
			imgScrollObj : {
				isImageScroll_top : null,
				isImageScroll_end : null,
				isImageScroll : false,
				image_box_obj : [],
				image_default_size : 40,
				image_half_size : (40 / 2),
				image_remain_size : null,
				removed_size : 0,
				linked_list : null,
				start_node : null,
				last_node : null,
			},
		},
		init : function() {
			var that = annotation_upload;
			that.resetView();
		},
		
		resetView : function(){
			var that = annotation_upload;
			that.pt.find(':input').val("");
			var img_box = that.pt.find(".second_wrap");
			var list = that.pt.find("table tbody");
			that.data.filter_arr = [];
			hideLoading("#annotation_upload .search_result_wrap");
			hideLoading("#annotation_upload .select_wrap");
			that.pt.find("select[name='label_type']").removeAttr("disabled");
			that.pt.find("thead tr .checkBox").removeClass("selected");
			that.pt.find(".detail_btn").removeClass("selected");
			that.pt.find(".table_body").off("scroll");
			that.pt.find("thead .checkBox").off("click");
			that.pt.find(".table_body").scrollTop(0);
			$(list).html("");
			that.data.dup_obj = [];
			that.data.tag_arr = [];
			that.data.fixed_arr = [];
			that.data.box_obj = [];
			that.data.tag_text = "";
			that.data.search_arr = [];
			that.data.colorHash = new ColorHash();
			that.data.imgScrollObj.image_box_obj = [];
			that.data.imgScrollObj.linked_list = null;			
			that.resetScroll();
			$(img_box).html("");
			that.pt.find(".empty_wrap").remove();
			that.pt.find(".del_btn").hide();
			that.pt.find(".save_btn").hide();
			that.addEmptyData(that.pt.find(".second_wrap"), "No Result", "you may now proceed to search");
			that.addEmptyData(that.pt.find(".list_wrap"), "No Label", "please add any label");
			that.pt.find(".list_total").text("Total 0");
			that.getDatasetList();
			that.defaultListener();
		},
		
		addEmptyData : function(elem, data1, data2){
			var that = annotation_upload;
			
			elem.append("<div class='empty_wrap'><div class='no_image'></div><div class='eng_text'>"+data1+"</div><div class='kor_text'>"+data2+"</div></div>")
		},
		
		removeEmptyData : function(elem){
			var that = annotation_upload;
			elem.find(".empty_wrap").remove();
		},

		defaultListener : function() {
			var that = annotation_upload;
			var delete_imgs = that.pt.find(".main_wrap .del_btn");
			var select_all = that.pt.find("thead th .checkBox");
			
			that.pt.find(".search_btn").off("click").on("click", function() {
					that.checkSearchData();
			});	
			

			that.pt.find(".image_search input").off("keypress").on("keypress",function(key){
				if(key.which == 13){
					that.checkSearchData();
				}
			});
			
			that.pt.find(".detail_btn").off("click").on("click",function(){
				$(this).toggleClass("selected");
				
				if($(this).hasClass("selected")){
					that.pt.find(".filter_wrap div").removeClass("selected");
					showLoading(".info_wrap .select_wrap");
					that.getDatasetList();
					that.pt.find(".detail_tooltip").attr("style","visibility: visible");
				} else {
					that.pt.find(".detail_tooltip").attr("style","visibility: hidden");
				}

			});
			
			that.pt.find(".close_tooltip_btn").off("click").on("click",function(){
				that.pt.find(".detail_btn").removeClass("selected");
				that.pt.find(".detail_tooltip").attr("style","visibility: hidden");
			});
			
			that.pt.find(".save_btn").off("click").on("click",function(){
				that.createJson();
			});
			
			// jh.sa 추가
			that.pt.find("select[name='label_type']").off("change").on("change", function(){
				that.pt.find(".second_wrap").html("");
				that.pt.find(".list_total").text("Total 0");
				that.getDatasetList();
				that.addEmptyData(that.pt.find(".second_wrap"), "No Result","you may now proceed to search");				
			});

			delete_imgs.off("click").on("click",function(){
				that.data.imgScrollObj.removed_size = 0;
				var image_box_obj = that.data.imgScrollObj.image_box_obj;
				var linked_list = that.data.imgScrollObj.linked_list;
				var last_node = that.data.imgScrollObj.last_node;
				var start_node = that.data.imgScrollObj.start_node;
				if(that.pt.find("thead tr .checkBox").hasClass("selected")){
					that.pt.find(".table_body").off("scroll");
					that.pt.find(".table_body").scrollTop(0);
					that.pt.find("table tbody").html("");
					that.pt.find("thead .checkBox").off("click");
					that.data.imgScrollObj.linked_list = null;
					that.data.imgScrollObj.image_box_obj = [];
					that.pt.find(".del_btn").hide();
	  				that.pt.find(".save_btn").hide();
					that.addEmptyData(that.pt.find(".list_wrap"), "No Label", "please add any label");
					that.pt.find(".main_wrap .list_total").text("Total 0");
					that.selectboxListener();
				} else if(Object.keys(image_box_obj).length > 0){
					var keys = Object.keys(image_box_obj);
		  			for(var i=0; i<keys.length; i++){
		  				tr_contain = $("tr[data-id='" + keys[i] + "']");
		  				if(tr_contain.length){
		  					tr_contain.remove();
		  					that.data.imgScrollObj.removed_size += 1;
		  				}

		  				that.data.imgScrollObj.linked_list.removeNode(that.data.imgScrollObj.obj[keys[i]]);
				 		delete that.data.imgScrollObj.linked_list.obj[keys[i]];
		  			}
		  			
		  			if(linked_list.length == 0){
		  				that.pt.find(".del_btn").hide();
		  				that.pt.find(".save_btn").hide();
		  				that.addEmptyData(that.pt.find(".list_wrap"),"No Label", "please add any label");
		  			}
		  			

		  			that.data.imgScrollObj.image_box_obj = [];
  					var i = 0;
  					
  					that.setStartAndLastNode();
  					
  					while(true){
  						if(start_node.prev == undefined){
  							that.data.imgScrollObj.isImageScroll_top = true;
  							that.data.imgScrollObj.image_remain_size = 0;
  						} else if(last_node.next == undefined){
  							that.data.imgScrollObj.isImageScroll_end = true;
  						}
  						if(i >= that.data.imgScrollObj.removed_size){break;}
  						if(last_node.next != undefined){
  	  						i++;
  	  						that.loopDeletedRow("down",last_node.next);
  	  						that.data.imgScrollObj.isImageScroll_end = false;
  	  					} else {
  	  						that.data.imgScrollObj.isImageScroll_end = true;
  	  						if(start_node.prev != undefined){
  	  							i++;  	  							
  	  	  						that.loopDeletedRow("up",start_node.prev);
  	  	  						that.data.imgScrollObj.isImageScroll_top = false;
  	  						} else {
  	  							that.data.imgScrollObj.isImageScroll_top = true;
  	  							that.data.imgScrollObj.image_remain_size = 0;
  	  							break;
  	  						}
  	  					}
  					}
 
  				if(linked_list == null){
  	  				that.pt.find(".main_wrap .list_total").text("Total 0");
  	  			} else {
  	  				that.pt.find(".main_wrap .list_total").text("Total " + linked_list.length);	
  	  			}
  				that.tableListener();
  				that.selectboxListener();
				} else {
					alert("선택된 데이터가 없습니다");
				}
				
				select_all.removeClass("selected");
				
			});
		},
		
		setStartAndLastNode : function(){
			var that = annotation_upload;
			var linked_list = that.data.imgScrollObj.linked_list;
			
			if(linked_list != null){
				that.data.imgScrollObj.last_node = linked_list.obj[that.pt.find("tbody tr").last().data("id")];
				that.data.imgScrollObj.start_node = linked_list.obj[that.pt.find("tbody tr").first().data("id")];
			}
		},
		
		loopDeletedRow : function(type,node){
			
			var that = annotation_upload;
			
			var target = that.pt.find("table tbody");
			var html = ""
			var path = node.value.path;
			var x = node.value.x;
			var y = node.value.y;
			var w = node.value.w;
			var h = node.value.h;
			var label = node.value.label;
			
			// jh.sa 수정 
			var seg = node.value.segmentation;
			
			var cur_id;
			if(seg){
				cur_id = path + "," + x + "," + y + "," + w + "," + h + "," + label + "," + seg;
			} else {
				cur_id = path + "," + x + "," + y + "," + w + "," + h + "," + label;
			}
			
			
			html += " <tr data-id='"+cur_id+"'> ";
			html += "   <td><div class='checkBox'></div></td>";
			html += "   <td class='preview'>";
			html += "   	<div class='img_preview'>";
			html += "       	<div class='show_img'></div>";
			html += "       	<div class='normal_img_wrap'>";
			html += "   			<div class='title_wrap flex'>";
			html += "   				<div class='image'></div>";
			html += "   				<span class='title'></span>";
			html += "   			</div>";
			html += "   			<div class='frame_container'>";
			html += "   			</div>";
			html += "   		</div>";
			html += "   	</div>";
			html += "   </td>";
			html += " 	<td>" + path + "</td> ";
			html += " 	<td>" + x + "</td> ";
			html += " 	<td>" + y + "</td> ";
			html += " 	<td>" + w + "</td> ";
			html += " 	<td>" + h + "</td> ";
			html += " 	<td>" + label + "</td>";
			html += " </tr>";	

			
			if(type == "down"){
				target.append(html);
			} else {
				target.prepend(html);
			}
			
			that.setStartAndLastNode();
		},
		
		// jh.sa 텍스트 조건 없이 검색 버튼 누를 경우 데이터가 제대로 나오지 않던 문제 수정 
		collectDatasetId : function(data){
			var that = annotation_upload;
			
			that.data.dataset_list = [];
			for(var i = 0; i < data.length; i++){
				that.data.dataset_list.push(data[i].dataset_id);
			};
		},
		
		getDatasetList : function(){
			var that = annotation_upload;
			var label_type = that.pt.find("select[name='label_type'] option:selected").data("value");
			var ajaxData = {"label_type" : label_type};
			$.ajax({
				url : baseUrl + "data/getDatasetList.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("=====getDatasetList=====", res);
					if(res.result.code == "3301"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} 
					if (res.result.code == "200") {
						that.collectDatasetId(res.result.data);		// jh.sa 추가 
						that.drawDatasetList(res.result.data);
					} else {
						alert(res.result.data);
						hideLoading(".select_wrap");
					}
					
				},
				error : function(err) {
					hideLoading(" .select_wrap");
					console.log("ERROR!!", err);
				}
			});
		},
		
		drawDatasetList : function(data){
			var that = annotation_upload;
			var target = that.pt.find(".select_wrap");
			target.html("");
			var html = "";
			var size = data.length;
			
			for(var i = 0; i<size;i++){
				html += "<div data-id="+data[i]["dataset_id"]+" class='dataset_wrap flex'>";
				html += "<div class='checkBox'></div>";
				html += "<div class='folder'></div>";
				html += "<div class='title'>"+data[i]["title"]+"</div>";
				html += "</div>";
			}
			
			hideLoading(".select_wrap");
			target.append(html);
			that.setDatasetListener();
			
		},
		
		setDatasetListener : function(){
			var that = annotation_upload;
			var filter_arr = that.data.filter_arr;
			var filter_size = filter_arr.length;
			that.pt.find(".dataset_wrap").each(function(){
				var child = $(this).children(".checkBox");
				for(var i =0; i< filter_size; i++){
					if(child.parent().data("id") == filter_arr[i]){
						child.addClass("selected");
						break;
					} else {
						child.removeClass("selected");
					}
				}			
			});
			
			if(that.pt.find(".dataset_wrap .checkBox").length == that.pt.find(".dataset_wrap .checkBox.selected").length){
				that.pt.find(".filter_wrap div").addClass("selected");
			}
			
			that.pt.find(".dataset_wrap .title").off("mouseenter").on("mouseenter",function(){
				if(this.children.length) {return;}
				var text = $(this)[0].innerText;
				$(this).empty();
				$(this).append(text);
				that.addHoverBox($(this), text);
			});
			
			that.pt.find(".dataset_wrap .title").off("mouseleave").on("mouseleave",function(){
				that.removeHoverBox($(this));
			});
			
			that.pt.find(".dataset_wrap").off("click").on("click",function(){
				var check_box = $(this).children(".checkBox");
				check_box.toggleClass("selected");
				if(check_box.hasClass("selected")){
					if(that.pt.find(".dataset_wrap .checkBox").length == that.pt.find(".dataset_wrap .checkBox.selected").length){
						that.pt.find(".filter_wrap div").addClass("selected");
					}
				} else {
					that.pt.find(".filter_wrap div").removeClass("selected");
				}
			});
			
			that.pt.find(".filter_wrap div").off("click").on("click",function(){
				var check_all = $(this);
				check_all.toggleClass("selected");
				
				if(check_all.hasClass("selected")){
					that.pt.find(".dataset_wrap .checkBox").addClass("selected");
				} else {
					that.pt.find(".dataset_wrap .checkBox").removeClass("selected");
				}
			})
			
			that.pt.find(".set_wrap button").off("click").on("click",function(){
				that.data.filter_arr = [];
				that.pt.find(".dataset_wrap").children(".selected").each(function(){
					that.data.filter_arr.push($(this).parent().data("id"));
				});				
				that.pt.find(".detail_btn").removeClass("selected");
				that.pt.find(".detail_tooltip").attr("style","visibility: hidden");
				that.checkSearchData();
			});
	
		},
		
		checkSearchData : function(){
			var that = annotation_upload;
			var text = that.pt.find(".image_search input").val();
			that.pt.find(".second_wrap").html("");
			that.pt.find(".detail_btn").removeClass("selected");
			that.pt.find(".detail_tooltip").attr("style","visibility: hidden");
			that.pt.find(".image_search input").val('');
			that.pt.find(".search_wrap .select_box").removeClass("selected");
			that.data.search_arr = [];
			that.data.box_obj = {};
			that.resetScroll();
			that.setSearchAjaxData(text);				
		},
		
		setSearchAjaxData : function(text){
			var that = annotation_upload;
			var filter_arr = that.data.filter_arr;
			var dataset_list = that.data.dataset_list;
			var string_arr = "";
			var ajaxData = {};
			var url = "";
			var label_type = that.pt.find('.ms .ms_wrap .image_search select[name="label_type"] option:selected').data("value");
			if(text != ""){
				ajaxData["label"] = text;
				if(filter_arr.length > 0){
					for(var i = 0, len = filter_arr.length; i<len; i++){
						if(i == 0){
							string_arr += filter_arr[i]
						} else {
							string_arr += ","+filter_arr[i]
						}
					}
					ajaxData["dataset_id"] = string_arr;
					

	 				if(label_type == "VIDEO_BBOX") {
	 					url = "getSearchVideoAnnotationVisionList";	
	 				}
	 				else {
	 					url = "getSearchAnnotationVisionList";
	 				}
	 				console.log("url1 : " + url);
					that.getSearchVisionList(ajaxData, url);	
				} 

 				if(label_type == "VIDEO_BBOX") {
 					url = "getSearchVideoAnnotationVisionList";	
 				}
 				else {
 					url = "getSearchAnnotationVisionList";
 				}
 				console.log("url1 : " + url);
				that.getSearchVisionList(ajaxData, url);				
			} else {										// jh.sa 아무것도 입력하지 않고 검색 버튼 눌렀을 때 데이터가 제대로 조회되지 않던 문제 수정
				ajaxData["label"] = text;
				if(filter_arr.length > 0){
					for(var i = 0, len = filter_arr.length; i<len; i++){
						if(i == 0){
							string_arr += filter_arr[i]
						} else {
							string_arr += ","+filter_arr[i]
						}
					}
					ajaxData["dataset_id"] = string_arr;					
				} else {
					for(var i = 0, len = dataset_list.length; i<len; i++){
						if(i == 0){
							string_arr += dataset_list[i]
						} else {
							string_arr += ","+dataset_list[i]
						}
					}
					ajaxData["dataset_id"] = string_arr;					
				}

 				if(label_type == "VIDEO_BBOX") {
 					url = "getSearchVideoAnnotationVisionList";	
 				}
 				else {
 					url = "getSearchAnnotationVisionList";
 				}
 				console.log("url2 : " + url);
				that.getSearchVisionList(ajaxData, url);	
			}

		},
		
		
		getSearchVisionList : function(ajaxData, url) {
			var that = annotation_upload;

			showLoading("#annotation_upload .second_wrap");

			$.ajax({
				/* url : baseUrl + "data/getSearchAnnotationVisionList.json", */
				url : baseUrl + "data/" + url,
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("=====getSearchAnnotationVisionList=====", res);
					if(res.result.code == "3301"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} 
					if (res.result.code == "200") {
						if(res.result.data == 0){
							alert("사용 가능한 데이터가 없습니다");
							that.addEmptyData(that.pt.find(".second_wrap"), "No Result","you may now proceed to search");
						} else {
							that.modifySearchData(res.result.data);	
						} 			
					} else {
						alert(res.result.data);
					}
					hideLoading("#annotation_upload .second_wrap");
				},
				error : function(err) {
					hideLoading("#annotation_upload .second_wrap");
					console.log("ERROR!!", err);
				}
			});
		},
		
		resetScroll : function(){		
			var that = annotation_upload;
			var scroll_info = that.data.scrollObj;	
			that.data.scrollObj.isScroll_top = false;
			that.data.scrollObj.isScroll_end = false;
			that.data.scrollObj.isScroll = false;
			that.data.box_obj = {};
		},
		// 수정됨
/* 		modifySearchData : function(data){
			console.log("data:: ", data);
			var segmentation = "";
			var that = annotation_upload;
			search_obj = {};
			search_arr = [];
			dup_obj = [];
			that.resetScroll();
			
			for(var i =0, len = data.length; i<len;i++){
				var inf = data[i].info.replace(/\,/g,"");
				/* var comma = data[i].path + "," +data[i].info + "," + data[i].label; 
				var comma;
				//j.seo 추가 
				if(data[i].segmentation != null){
					comma = data[i].path + "," +data[i].info + "," + data[i].label + "," + data[i].segmentation;
				} else {
					// jh.sa 추가 : label_type이 box일 때 segmentation이 null로 추가되어 중복 add가 가능했던 문제
					comma = data[i].path + "," +data[i].info + "," + data[i].label;
				}
				var cur_id = data[i].path +inf + data[i].label;
				
				if(i < data.length - 1) {
					segmentation = segmentation + data[i].segmentation +"/";
				}
				else if(i == data.length - 1) {
					segmentation = segmentation + data[i].segmentation;
				}
				
				
					
				if(search_obj[cur_id] == undefined){
					search_arr.push(comma);	
					search_obj[cur_id] = comma;
					if(dup_obj[data[i].label] == undefined){
						dup_obj[data[i].label] = [comma];
					} else {
						dup_obj[data[i].label].push(comma);
					}
				}	
			}

			that.pt.find(".search_wrap .list_total").text("Total " + search_arr.length);
			that.initSearchList();
		}, */
		modifySearchData : function(data){
			var that = annotation_upload;
			var segmentation = "";
			
			that.data.search_obj = [];
			that.data.search_arr = [];
			that.data.dup_obj = [];
			that.resetScroll();
			
			
			for(var i=0, len = data.length; i<len;i++){
				var search_obj = that.data.search_obj;
				var dup_obj = that.data.dup_obj;
				if(data[i].label_type == "IMAGE_BBOX") {
					var inf = data[i].info.replace(/\,/g,"");
					/* var comma = data[i].path + "," +data[i].info + "," + data[i].label; */
					
					// jh.sa 추가 : label_type이 box일 때 segmentation이 null로 추가되어 중복 add가 가능했던 문제
					/* var split_info = data[i].info.split(",");
					var info = ""; */

					var comma = data[i].path + "," +data[i].info + "," + data[i].label + ",#" + data[i].label_type;
					
					var cur_id = data[i].path +inf + data[i].label;
					
					
						
					if(search_obj[cur_id] == undefined){
						that.data.search_arr.push(comma);	
						that.data.search_obj[cur_id] = comma;
						if(dup_obj[data[i].label] == undefined){
							that.data.dup_obj[data[i].label] = [comma];
						} else {
							that.data.dup_obj[data[i].label].push(comma);
						}
					}	
				} else if(data[i].label_type == "IMAGE_SEGMENTATION"){
					var tmp = JSON.parse(data[i].info);
					
					var info = tmp[0]; 
					
					/* var info = JSON.parse(data[i].info); */
					var info_box = info.box;
					var info_segmentation = info.segmentation;
 					var segmentation = "";
 					segmentation += "[";
					for(var k = 0; k < info_segmentation.length; k++) {
						if(k == 0) {
							segmentation += '{"x":' + info_segmentation[k]['x']+',"y": '+info_segmentation[k]['y']+'}';
						} else {
							segmentation += ',{"x":' + info_segmentation[k]['x']+',"y": '+info_segmentation[k]['y']+'}';
						}
					} 
					
					segmentation += "]";
					var segmentation_comma = data[i].path + "," + info_box + "," + data[i].label + "," + segmentation + ",#" + data[i].label_type;
					
					var seg_cur_id = data[i].path + info_box + data[i].label + info_segmentation;
					
					if(search_obj[seg_cur_id] == undefined){
						that.data.search_arr.push(segmentation_comma);	
						that.data.search_obj[seg_cur_id] = segmentation_comma;
						if(dup_obj[data[i].label] == undefined){
							that.data.dup_obj[data[i].label] = [segmentation_comma];
						} else {
							that.data.dup_obj[data[i].label].push(segmentation_comma);
						}
					}	
				} else if(data[i].label_type == "VIDEO_BBOX") {
 					var video_bbox_comma = data[i].path + "," + data[i].label + "," + data[i].meta_id + ",#" + data[i].label_type;
 					
 					var video_bbox_cur_id = data[i].path + data[i].label + data[i].meta_id + data[i].label_type;
 					
					if(search_obj[video_bbox_cur_id] == undefined){
						that.data.search_arr.push(video_bbox_comma);	
						that.data.search_obj[video_bbox_cur_id] = video_bbox_comma;
						if(dup_obj[data[i].label] == undefined){
							that.data.dup_obj[data[i].label] = [video_bbox_comma];
						} else {
							that.data.dup_obj[data[i].label].push(video_bbox_comma);
						}
					}	
				}
			}
			that.pt.find(".search_wrap .list_total").text("Total " + that.data.search_arr.length);
			that.initSearchList();
		},
		
		initSearchList : function(){
			var that = annotation_upload;	
			var search_arr = that.data.search_arr;
			that.data.fixed_arr = search_arr;	
			var scroll_info = that.data.scrollObj;
			
			that.data.scrollObj.scroll_start = 0;
			that.data.scrollObj.scroll_end = (scroll_info.default_size < search_arr.length ) ? scroll_info.default_size : search_arr.length;
			that.addList("init",scroll_info.scroll_start,scroll_info.scroll_end);
			that.drawLabelGroup();
			if(search_arr.length > scroll_info.default_size) {
				that.data.scrollObj.isScroll_top = true;
				that.setScrollListener();
			}
		},
		
		addList : function(type,start,end){
			var that = annotation_upload;
			var target = null;
			
			html = "";
			if(type == "init"){
				target = that.pt.find(".second_wrap");
				$(target).html("");
				
				html +=	"<div class='tag_txt_wrap'><div class='ms'><span>Tag</span></div></div>";
				html += "<div class ='tagtp'><div class='tag_wrap'><div class='tag_margin'></div></div></div>"
				html += "<div class='search_result_wrap'>";
				html += "<div class='all_margin'><div class='select_all_wrap flex'>";
				html += "<div class='checkBox'></div>"; 
				html += "<span>Select All</span>"; 
				html += "<button class='add_btn'>Add List</button>";
				html += "<button class='arg_btn'>Augmentation</button>";
				html += "</div></div>";
				html += "<div class='media_wrap'>";
				html += "<div class='search_result'>";	
			} else {
				target = that.pt.find(".search_result");
			}
			
			var scroll_info = that.data.scrollObj;

			var i = 0;	
			// ㅌㅍ
			for (i = start ; i < end ; i++) {
				var search_arr = that.data.search_arr;
				var box_obj = that.data.box_obj;
				var data = search_arr[i];
				var sp = data.split(",");
				// label_type 구별
				var start_label_type = data.indexOf("#");
				var end_label_type = data.length;
				var label_type = data.substring(start_label_type, end_label_type);
				var label_name = "";
				var cur_id = "";
				// IMAGE_BBOX
				if(label_type == "#IMAGE_BBOX") {
					cur_id = sp[0] + "," + sp[1] +"," + sp[2] +"," +sp[3] +"," + sp[4] + "," + sp[5] + "," + label_type;
					label_name = sp[5];
				} else if(label_type == "#IMAGE_SEGMENTATION") {
					
					var startIndex = data.indexOf("[");
					var endIndex = data.indexOf("]") + 1; 
					var split_seg = data.substring(startIndex, endIndex);
					var seg = split_seg;
					cur_id = sp[0] + "," + sp[1] +"," + sp[2] +"," +sp[3] +"," + sp[4] + "," + sp[5] + "," + seg + "," + label_type;
					label_name = sp[5];
				} else if(label_type == "#VIDEO_BBOX") {
					var video_bbox_comma = data[i].path + "," + data[i].label + "," + data[i].meta_id + ",#" + data[i].label_type;
					cur_id = sp[0] + "," + sp[1] + "," + sp[2] + "," + label_type;
					label_name = sp[1];
				}
				// IMAGE_SEGMENTATION 
/* 				var startIndex = data.indexOf("[");
				var endIndex = data.indexOf("]") + 1; 
				var split_seg = data.substring(startIndex, endIndex);
				var seg = split_seg; */
				// VIDEO_BBOX
				/* var cur_id; */
				// jh.sa 수정
/* 				if(seg){
					cur_id = sp[0] + "," + sp[1] +"," + sp[2] +"," +sp[3] +"," + sp[4] + "," + sp[5] + "," + seg;
				} else {
					cur_id = sp[0] + "," + sp[1] +"," + sp[2] +"," +sp[3] +"," + sp[4] + "," + sp[5];
				} */
				
				html += " <div class='box_contain' data-id='"+cur_id+"'> ";
				if(label_type == "#IMAGE_BBOX" || label_type == "#IMAGE_SEGMENTATION") {		// jh.sa 201027 수정 
					html += "  <div class='box'>";
				} else if(label_type == "#VIDEO_BBOX"){
					html += "  <div class='box vid'>";
				}
				if(box_obj[data] != undefined){
					html += "	<div class='select_box selected'></div>";
				} else {
					html += "	<div class='select_box'></div>";	
				}
				html += " 	<div class='img'></div> ";
				html += "  </div>";
				html += "   <div class='label_wrap'>";
				html += "   <span>"+label_name+"</span>";
				html += "   </div>";
				html += " </div> ";
				

			}
			that.data.scrollObj.isScroll = false;
			
			if(type == "down" || type == "init"){
// 				console.log("append");
				target.append(html);	
			} else {
// 				console.log("prepend");
				target.prepend(html);
			}
			
			if(type == "init"){
				html += "</div>";
				html += "</div>";
				html += "</div>";
			}
			

			that.drawImageBox();
			that.searchListListener();
		},
		
		setScrollListener : function(){
			var that = annotation_upload;	
			
			this.pt.find(".media_wrap").off("scroll").on("scroll",function(){
				var scroll_info = that.data.scrollObj;
				var target = $(this);
				var search_arr = that.data.search_arr;
				var st = target.scrollTop();
				var box_size = that.pt.find(".box_contain").length;
				

				if(st + target.innerHeight() >= target[0].scrollHeight && !scroll_info.isScroll && !scroll_info.isScroll_end){
					that.data.scrollObj.isScroll = true;
					
					var diff = 0;
					if(scroll_info.scroll_end + scroll_info.half_size >= search_arr.length){
						diff = search_arr.length - scroll_info.scroll_end;
						that.data.scrollObj.scroll_end = search_arr.length;
						that.data.scrollObj.scroll_start = scroll_info.scroll_start + diff;
						that.data.scrollObj.isScroll_end = true;
						
					}else{
						diff = scroll_info.half_size;
						that.data.scrollObj.scroll_end = scroll_info.scroll_end + diff;
						that.data.scrollObj.scroll_start = scroll_info.scroll_start + diff;
					}
					var end = scroll_info.scroll_end;
					var start = end - diff;
					
					that.addList("down",start,end);
					that.removeBox(diff,"down");	
					that.data.scrollObj.isScroll_top = false;
					
			
				}else if(st == 0 && !scroll_info.isScroll && !scroll_info.isScroll_top){
					that.data.scrollObj.isScroll = true;					
					
					var diff = 0;
					if(scroll_info.scroll_start - scroll_info.half_size <= 0){						
						diff = scroll_info.scroll_start;
						that.data.scrollObj.scroll_start = 0;
						that.data.scrollObj.scroll_end = scroll_info.scroll_end - diff;
						that.data.scrollObj.isScroll_top = true;
						
					}else{
						diff = scroll_info.half_size;
						that.data.scrollObj.scroll_end = scroll_info.scroll_end - diff;
						that.data.scrollObj.scroll_start = scroll_info.scroll_start - diff;
					}
					var start = scroll_info.scroll_start;
					var end = start + diff;
					
					
					that.addList("up",start,end);
					that.removeBox(diff,"up");	
					that.data.scrollObj.isScroll_end = false;
							
				}
			});
		},
		
		removeBox : function(size, type){
			
			
			if(size == 0){ return; }
			
			if(type == "down"){
				this.pt.find(".box_contain").slice(0,size).remove();					
			} else {		
				this.pt.find(".box_contain").slice(-size).remove();
			}
			this.pt.find(".media_wrap").scrollTop((this.pt.find(".media_wrap")[0].scrollHeight - this.pt.find(".media_wrap").height()) / 2);
		},

		drawImageBox : function(){
			var that = annotation_upload;
			that.pt.find(".box_contain .box").each(function(){
				var box = $(this);
				var cur_id = $(this).parent().data("id");
				var sp = cur_id.split(",");

				var imgObj = new Image();
				imgObj.src = "/uploadFile/xlabeller/" + sp[0]; 
				
				imgObj.onload = function(){
					that.data.canvas_hover = document.createElement('canvas');
					box.find(".img").html(that.data.canvas_hover);
					that.crop(imgObj, sp[1], sp[2], sp[3], sp[4]);
				}
			});

		},
		
		searchListListener : function() {
			var that = annotation_upload;	
			
			// 전체선택 눌렀을경우 .. 각각 search_arr 의 모든 데이터를 옮길수있게 arr 에 저장..
			// 개별선택 한경우 ..  선택 한 데이터만 obj 에 담아놨다가 append 할때 있으면 selected 한 상태로 append 없으면 무시
			// 개별선택 + 리스트에 추가한경우 개별선택 obj 에 있는 부분을모두 list 형태로  변환
			
			
			that.pt.find(".search_result_wrap .box").off("click").on("click",function(){
				var search_arr = that.data.search_arr;
				var box_obj = that.data.box_obj;
				var box = $(this);
				var checkBox = $(this).children(".select_box");
				var cur_id = box.parent().data("id");
				checkBox.toggleClass("selected");
				if(checkBox.hasClass("selected")){
					that.data.box_obj[cur_id] = cur_id;
					if(Object.keys(box_obj).length == search_arr.length){
						that.pt.find(".select_all_wrap .checkBox").addClass("selected");
					}
				} else {
					delete that.data.box_obj[cur_id];
					that.pt.find(".select_all_wrap .checkBox").removeClass("selected");
				}

			});
			
			that.pt.find(".select_all_wrap .checkBox").off("click").on("click",function(){
				var search_arr = that.data.search_arr;
				var select_all = $(this);
				select_all.toggleClass("selected");
				if(select_all.hasClass("selected")){
					that.pt.find(".search_result_wrap .box .select_box").addClass("selected");
					for(var i = 0, len = search_arr.length; i<len; i++){
						var cur_id = search_arr[i]
						that.data.box_obj[cur_id] = cur_id;
					}
				} else {
					that.pt.find(".search_result_wrap .box .select_box").removeClass("selected");
					that.data.box_obj = [];
				}
				
			});

			that.pt.find(".search_wrap .add_btn").off("click").on("click",function(){
				var search_arr = that.data.search_arr;
				var box_obj = that.data.box_obj;
				if(that.pt.find(".select_all_wrap .checkBox").hasClass("selected")){
					that.modifyImageListData(search_arr);
					that.selectboxListener();
				} else if(Object.keys(box_obj).length > 0){
					var keys = Object.keys(box_obj);
					var selected_arr = [];
		  			for(var i=0; i<keys.length; i++){
		  				selected_arr.push(keys[i]);
		  			}
		  			that.modifyImageListData(selected_arr);
		  			that.selectboxListener();
				} else {
					alert("선택된 데이터가 없습니다");
				}
				that.pt.find(".select_all_wrap .checkBox").removeClass("selected");
				that.pt.find(".search_result_wrap .box .select_box").removeClass("selected");
			});
			
			that.pt.find(".search_wrap .arg_btn").off("click").on("click",function(){
				
				
				var tempImgs = $(".media_wrap .search_result .box_contain canvas");
				var data = [];
				for(var i=0; i<tempImgs.length; i++){
					var img = that.encodeBase64ImageTagViaCanvas(tempImgs[i]);
					var tmpData = {
						image : img.split("base64,")[1],
						label : [{
							x1 : 0, 
							y1 : 0,
							x2 : 0+$(tempImgs[i])[0]['width'],
							y2 : 0+$(tempImgs[i])[0]['height'],
							type : $(tempImgs[i]).parent().parent().parent().find(".label_wrap span").html(),
						}],
						count : 5,
						augments : [{
								min_value : 10,
								max_value : 30,
								augment_type : "SPNOISE"
							}],
						optional : {
							flip : ["FLIPUD","FLIPLR"]
						}
					};
					that.createAugData(tmpData);
				}
// 				that.createAugData(tmpData);
				
			});
			
			// jh.sa 추가
			that.pt.find(".search_result_wrap .label_wrap").off("mouseenter").on("mouseenter", function(){
				var label_title = $(this).children("span");
				var text = label_title[0].innerText;
				cur_text = text;
				label_title.empty();
				label_title.append(text);
				that.addHoverBox($(this), text);
			});
			
			that.pt.find(".search_result_wrap .label_wrap").off("mouseleave").on("mouseleave",function(){
				that.removeHoverBox($(this));
			});				
		},
		
		drawLabelGroup : function(){
			var that = annotation_upload;
			var html ="";
			var dup_obj = that.data.dup_obj;
			var tagKeys = Object.keys(dup_obj);
			
			var target = that.pt.find(".second_wrap .tag_wrap .tag_margin");
			$(target).html("");

			for(var i = 0, len = tagKeys.length; i<len;i++){
				html += "<div class='tag_box_wrap'>";
				html += "<button># "+tagKeys[i]+"</button>"
				html += "</div>";
			}
			
			target.append(html.trim());
			that.labelGroupListener();
		},
		
		
		appendTagList : function(text){
			var that = annotation_upload;
// 			var tag_text = that.data.tag_text;
			var tag_arr = that.data.tag_arr;
			var dup_obj = that.data.dup_obj;
			
			if(that.data.tag_text == ""){
				that.data.tag_text = ""+text;
			} else {
				that.data.tag_text = that.data.tag_text + "," + text;
			}

			
// 			console.log(text ,dup_obj[text]);
			
			if(dup_obj[text] != undefined){
				var values = dup_obj[text];
				for(var y = 0; y<values.length;y++){
					that.data.tag_arr.push(values[y]);	
				}
			}
			that.setList(tag_arr);
		},
		
		setList : function(arr){
			var that = annotation_upload;
			var scroll_info = that.data.scrollObj;
			that.data.search_arr = arr;
			that.resetScroll();
			that.pt.find(".media_wrap").off("scroll");
			that.pt.find(".media_wrap").scrollTop(0);
			that.pt.find(".search_result").html("");
			
			var search_arr = that.data.search_arr;
			that.data.box_obj = [];
			that.data.scrollObj.scroll_start = 0;
			that.data.scrollObj.scroll_end = (scroll_info.default_size < search_arr.length ) ? scroll_info.default_size : search_arr.length;
			that.addList("down",scroll_info.scroll_start,scroll_info.scroll_end);
			if(search_arr.length > scroll_info.default_size) {
				that.data.scrollObj.isScroll_top = true;
				that.setScrollListener();
			}
			
			that.pt.find(".search_wrap .list_total").text("Total " + search_arr.length);
		},
		
		removeTagList : function(text){
			var that = annotation_upload;
			var fixed_arr = that.data.fixed_arr;
			var dup_obj = that.data.dup_obj;
// 			var tag_text = that.data.tag_text;
			that.data.tag_arr = [];
			
			if(that.data.tag_text.indexOf(",") > -1){
				sp = that.data.tag_text.split(",");
				for(var i = 0; i<sp.length; i++){
					if(sp[i] == text){
						sp.splice(i,1);
						break;
					}
				}

				if(sp.length == 1){
					
					that.data.tag_text = sp[0];
					
					if(dup_obj[sp[0]] != undefined){
						var values = dup_obj[sp[0]];
						for(var y = 0; y<values.length;y++){
							that.data.tag_arr.push(values[y]);	
						}
					}
					
					that.setList(that.data.tag_arr);
					
				} else {
					for(var i=0;i<sp.length;i++){
						if(i == 0){
							that.data.tag_text = sp[i];
						} else {
							that.data.tag_text = that.data.tag_text + "," + sp[i];
						}
						
						if(dup_obj[sp[i]] != undefined){
							var values = dup_obj[sp[i]];
							for(var y = 0; y<values.length;y++){
								that.data.tag_arr.push(values[y]);	
							}
						}
					}
					that.setList(that.data.tag_arr);
				}	
			} else {
				that.data.tag_text = "";
				
				that.setList(fixed_arr);
			}
		},
		
		labelGroupListener : function(){
			var that = annotation_upload;
			
			var cur_text = "";
			
			// 현재 tag_wrap 사이즈에 따라 media_wrap 높이를 변경해줘야하는데..
			// css 로 하는법... 있나
			var height = that.pt.find(".second_wrap .tag_wrap").outerHeight();
			var value = 387 + height;
			that.pt.find(".media_wrap").css({ 'height': 'calc(100% - ' + value+ 'px)' });
	
			that.data.tag_arr = [];
			
			that.pt.find(".second_wrap .tag_box_wrap button").off("click").on("click",function(){
				var btn = $(this);
				btn.toggleClass("selected");
				that.pt.find(".select_all_wrap .checkBox").removeClass("selected");
				var res = cur_text.slice(2);
				if(btn.hasClass("selected")){	
					that.appendTagList(res);
				} else {
					that.removeTagList(res);
				}
			});
			
			that.pt.find(".second_wrap .tag_box_wrap").off("mouseenter").on("mouseenter",function(){
				var btn = $(this).children("button");
				
// 				console.log(btn.width(), btn[0].scrollWidth - 8)
				
				var text  = btn[0].innerText;
				cur_text = text;
				btn.empty();
				btn.append(text);
				that.addHoverBox(btn , btn[0].innerText.slice(2));
			});
			
			that.pt.find(".second_wrap .tag_box_wrap").off("mouseleave").on("mouseleave",function(){
				var btn = $(this).children("button");
				that.removeHoverBox(btn);
			});	
		},
		
		crop : function(imgObj, xx, yy, ww, hh){
			var that = annotation_upload;
			var canvas_hover = that.data.canvas_hover;
			var ctx = canvas_hover.getContext("2d");
	
			
			hideLoading("#annotation_upload .show_img");
			
			var w = ww;
	    	var h = hh;
	    		
	    	var dw = 0;
	    	var dh = 0;
	    		
	    	var g_w = 105;
	    	var g_h = 80;
	    	
	    	var fw = w/g_w;
	    	var fh = h/g_h;
	    	
	    	if(fw >= fh){
	    		dw = w / fw;
	    		dh = h / fw;
	    	}else{
	    		dw = w / fh;
	    		dh = h / fh;
	    	}
	    	that.data.canvas_hover.width = dw;
	    	that.data.canvas_hover.height = dh;

			ctx.clearRect(0, 0, that.data.canvas_hover.width, that.data.canvas_hover.height);
			ctx.drawImage(imgObj, xx, yy, ww, hh, 0, 0, dw, dh);
        },

        rescale : function(img){
        	var that = annotation_upload;
        	var canvas = that.data.canvas;
        	var scaleFactor = that.data.scaleFactor;
        	var canvas_max_width = 560;
            var canvas_max_height = 380;
            if(canvas_max_height/canvas_max_width >= img.naturalHeight/img.naturalWidth){
            	that.data.scaleFactor = canvas_max_width/img.naturalWidth;
            } else{
            	that.data.scaleFactor = canvas_max_height/img.naturalHeight;
            }          
            
            canvas.setWidth(img.naturalWidth*scaleFactor);
         	canvas.setHeight(img.naturalHeight*scaleFactor);
    		canvas.calcOffset();
    		canvas.renderAll();    
    	},
    	
    	resetImageListValue : function(){
    		var that = annotation_upload;
    		
    		that.data.imgScrollObj.linked_list = new LinkedList();
    		that.data.imgScrollObj.image_remain_size = 0;
    		that.data.imgScrollObj.isImageScroll_top = false;
    		that.data.imgScrollObj.isImageScroll_end = false;
    		that.data.imgScrollObj.isImageScroll = false;
    		that.removeEmptyData(that.pt.find(".list_wrap"));
    	},
    	
    	modifyImageListData : function(data){
    		var that = annotation_upload;
    		var isDup = false;
    		var isInit = false;
    		var append_size = 0;
    		
    		if(that.data.imgScrollObj.linked_list == null){
    			isInit = true;
    			that.pt.find(".table_body").scrollTop(0);
    			that.resetImageListValue();
    		} else {
    			isInit = false;
    		}
    		
    		
    		// 현재 데이터로 인하여 scroll 발생해야함 ..
    		for(var i = 0, len = data.length; i<len; i++){
        		var linked_list = that.data.imgScrollObj.linked_list;
        		var isImageScroll_top = that.data.imgScrollObj.isImageScroll_top;
        		var isImageScroll_end = that.data.imgScrollObj.isImageScroll_end;
        		var image_default_size = that.data.imgScrollObj.image_default_size;
        		var image_half_size = that.data.imgScrollObj.image_half_size;
        		var image_remain_size = that.data.imgScrollObj.image_remain_size;
        		var last_node = that.data.imgScrollObj.last_node;
        		var start_node = that.data.imgScrollObj.start_node;
        		
    			if(linked_list.obj[data[i]] == undefined){
    				append_size += 1;
    				var sp = data[i].split(",");
    			
    				if(sp[5] == "") {
    					alert("공백인 Label명이 존재합니다. Label명을 확인해주세요.");
    					return ;
    				}
    				
    				// label_type 구별
    				var start_label_type = data[i].indexOf("#");
    				var end_label_type = data[i].length;
    				var label_type = data[i].substring(start_label_type, end_label_type);
    				var value = {};
    				var id = "";
    				
					if(label_type == "#IMAGE_BBOX") {
						value = { "path" : sp[0],"x" : sp[1], "y" : sp[2], "w" : sp[3], "h" : sp[4], "label" : sp[5], "label_type" : label_type};
						id = value.path + "," + value.x + "," + value.y + "," + value.w + "," + value.h + "," + value.label + "," + value.label_type;
					} else if(label_type == "#IMAGE_SEGMENTATION") {
						// j.seo 추가
	    				var startIndex = data[i].indexOf("[");
	    				var endIndex = data[i].indexOf("]") + 1; 
	    				var split_seg = data[i].substring(startIndex, endIndex);
	    				var seg = split_seg;
	    				value = { "path" : sp[0],"x" : sp[1], "y" : sp[2], "w" : sp[3], "h" : sp[4], "label" : sp[5], "segmentation" : seg, "label_type" : label_type};
	    				id = value.path + "," + value.x + "," + value.y + "," + value.w + "," + value.h + "," + value.label + "," + value.segmentation + "," + value.label_type;
						
					} else if(label_type == "#VIDEO_BBOX") {
						/* var video_bbox_comma = data[i].path + "," + data[i].label + "," + data[i].meta_id + ",#" + data[i].label_type;
						cur_id = sp[0] + "," + sp[1] + "," + sp[2] + "," + label_type;
						label_name = sp[1]; */
						value = { "path" : sp[0], "label" : sp[1], "meta_id" : sp[2], "label_type" : label_type};
						id = value.path + "," + value.label + "," + value.meta_id + "," + value.label_type;
					}
					
    				/* var value = { "path" : sp[0],"x" : sp[1], "y" : sp[2], "w" : sp[3], "h" : sp[4], "label" : sp[5], "segmentation" : seg, "label_type" : label_type}; */
/*     				var id; 	 // jh.sa 수정
    				if(seg){
        				id = value.path + "," + value.x + "," + value.y + "," + value.w + "," + value.h + "," + value.label + "," + value.segmentation + "," + value.label_type;
    				} else {
        				id = value.path + "," + value.x + "," + value.y + "," + value.w + "," + value.h + "," + value.label + "," + value.label_type;
    				} */
    				
    				that.data.imgScrollObj.linked_list.push(value, id);
    			} else {
    				isDup = true;
    			}
    		}
    		if(isDup){
    			alert("중복 데이터가 존재합니다.\n중복데이터를 제외한 데이터를 추가합니다.");
    			isDup = false;
    		}
    		
    		if(linked_list.length == 0){
    			that.pt.find(".del_btn").hide();
  				that.pt.find(".save_btn").hide();
  				that.addEmptyData(that.pt.find(".list_wrap"), "No Label", "please add any label");
  			} else {
  				that.pt.find(".del_btn").show();
  				that.pt.find(".save_btn").show();
  			}
    		
    		that.data.box_obj = [];
    		that.pt.find(".main_wrap .list_total").text("Total " + linked_list.length);
    		if(isInit){
    			that.initImageList();	
    		} else {
    			if(isImageScroll_end){
    				var box_size = that.pt.find("tbody tr").length;
    				// 맨 처음 부분 스크롤이 있을때와 
    				if(box_size < image_default_size){
    					// 스크롤이 존재하지않을때 
    					
    					if((image_default_size - box_size) > append_size){
        					that.loopImageList(append_size, last_node.next, "down", true);
        					that.tableListener();
    					} else {
    						var size = image_default_size - box_size;
    						that.loopImageList(size, last_node.next, "down", true);
        					that.tableListener();
        					that.data.imgScrollObj.isImageScroll_end = false;
        					that.setImageScrollListener();
        					
    					}
    				} else {
    					var size = image_half_size - (box_size - image_default_size);
    					if(size >= append_size){
//     						console.log("33");
    						var temp_size = image_remain_size + append_size;

        					that.loopImageList(append_size, last_node.next, "down", false);
        					that.tableListener();
        					that.data.imgScrollObj.image_remain_size = temp_size;

        				} else {
//         					console.log("44");
        					
        					that.loopImageList(size, last_node.next, "down", true);
        					
        					that.pt.find("tbody tr").slice(0,image_half_size).remove();
        					that.tableListener();
        					that.data.imgScrollObj.isImageScroll_end = false;
        				}
    					that.setImageScrollListener();
    				}

    			} 
    		}
    		
    	},
  
    	initImageList : function(){
    		var that = annotation_upload;		
    		var linked_list = that.data.imgScrollObj.linked_list;
			var node = linked_list.head;
			var image_default_size = that.data.imgScrollObj.image_default_size;
			that.data.imgScrollObj.start_node = node;
			that.loopImageList(image_default_size, node, "down",true);
			that.tableListener();
			
			if(linked_list.length > image_default_size){
				that.data.imgScrollObj.isImageScroll_top = true;
				that.setImageScrollListener();
			} else {
				that.data.imgScrollObj.isImageScroll_end = true;
			}
    	},

		addImageList : function(node,type){
			var that = annotation_upload;
			var image_half_size = that.data.imgScrollObj.image_half_size;
			
			that.loopImageList(image_half_size, node, type, false);
			that.data.imgScrollObj.isImageScroll = false;
			that.tableListener();
		},
		
		
		loopImageList : function(size,node,type,isInit){
			
			var that = annotation_upload;
			var temp_node = node;
			var target = that.pt.find("table tbody");	
			var i = 0;
			var image_box_obj = that.data.imgScrollObj.image_box_obj;
			
			while(node){
				if(i>=size){break;}
				
				var html = ""
				i++;
				
				var path = node.value.path;
				var x = node.value.x;
				var y = node.value.y;
				var w = node.value.w;
				var h = node.value.h;
				var label = node.value.label;
				var label_type = node.value.label_type;
				var cur_id = "";
				
				if(label_type == "#IMAGE_BBOX") {
					cur_id = path + "," + x + "," + y + "," + w + "," + h + "," + label + "," + label_type;
				} else if(label_type == "#IMAGE_SEGMENTATION") {
					var seg = node.value.segmentation;
					cur_id = path + "," + x + "," + y + "," + w + "," + h + "," + label + "," + seg + "," +label_type;
				} else if(label_type == "#VIDEO_BBOX") {
					//var video_bbox_comma = data[i].path + "," + data[i].label + "," + data[i].meta_id + ",#" + data[i].label_type;
					var meta_id = node.value.meta_id;
					cur_id = path + "," + label + "," + meta_id + "," + label_type;
					x = "-";
					y = "-";
					w = "-";
					h = "-";
				}
				/* console.log("label_type : " + label_type); */
				// jh.sa 수정
				/* var seg = node.value.segmentation; */
/* 				var cur_id;
				if(seg){
					cur_id = path + "," + x + "," + y + "," + w + "," + h + "," + label + "," + seg;
				} else {
					cur_id = path + "," + x + "," + y + "," + w + "," + h + "," + label;
				} */
				
				// jh.sa 201027 수정 
				if(label_type == "#IMAGE_BBOX" || label_type == "#IMAGE_SEGMENTATION") {
					html += " <tr data-id='"+cur_id+"'> ";		
					if(image_box_obj[cur_id] != undefined){
						html += "   <td><div class='checkBox selected'></div></td>";
					} else {
						html += "   <td><div class='checkBox'></div></td>";
					}
					html += "   <td class='preview'>";
					html += "   	<div class='img_preview'>";
					html += "       	<div class='show_img'></div>";
					html += "       	<div class='normal_img_wrap'>";
					html += "   			<div class='title_wrap flex'>";
					html += "   				<div class='image'></div>";
					html += "   				<span class='title'></span>";
					html += "   			</div>";
					html += "   			<div class='frame_container'>";
					html += "   			</div>";
					html += "   		</div>";
					html += "   	</div>";
					html += "   </td>";
					html += " 	<td>" + path + "</td> ";
					html += " 	<td>" + x + "</td> ";
					html += " 	<td>" + y + "</td> ";
					html += " 	<td>" + w + "</td> ";
					html += " 	<td>" + h + "</td> ";
					html += " 	<td>" + label + "</td>";
					html += " </tr>";					
					that.pt.find("th.pre").html("PREVIEW");
				} else if(label_type == "#VIDEO_BBOX"){
					html += " <tr data-id='"+cur_id+"'> ";		
					if(image_box_obj[cur_id] != undefined){
						html += "   <td><div class='checkBox selected'></div></td>";
					} else {
						html += "   <td><div class='checkBox'></div></td>";
					}
					html += "   <td class='preview'>";
// 					html += "   	<div class='img_preview'>";
// 					html += "       	<div class='show_img'></div>";
// 					html += "       	<div class='normal_img_wrap'>";
// 					html += "   			<div class='title_wrap flex'>";
// 					html += "   				<div class='image'></div>";
// 					html += "   				<span class='title'></span>";
// 					html += "   			</div>";
// 					html += "   			<div class='frame_container'>";
// 					html += "   			</div>";
// 					html += "   		</div>";
// 					html += "   	</div>";
					html += "   </td>";
					html += " 	<td>" + path + "</td> ";
					html += " 	<td>" + x + "</td> ";
					html += " 	<td>" + y + "</td> ";
					html += " 	<td>" + w + "</td> ";
					html += " 	<td>" + h + "</td> ";
					html += " 	<td>" + label + "</td>";
					html += " </tr>";	
					that.pt.find("th.pre").html("");
				}	
				
				that.data.imgScrollObj.start_node = node;
				that.data.imgScrollObj.last_node = node;
				
				if(type == "down"){
					target.append(html);
					node = node.next;
				} else {
					target.prepend(html);
					node = node.prev;	
				}	
			}

			that.setStartAndLastNode();	
			if(!isInit){
				that.setNodeData(i,type);	
			}
			
		},
		
		setNodeData : function(i,type){
			var that = annotation_upload;
			var linked_list = that.data.imgScrollObj.linked_list;
			var image_default_size = that.data.imgScrollObj.image_default_size;
			var image_half_size = that.data.imgScrollObj.image_half_size;
			var image_remain_size = that.data.imgScrollObj.image_remain_size;
			var last_node = that.data.imgScrollObj.last_node;
			var start_node = that.data.imgScrollObj.start_node;
			
			var scroll_bar = ".table_body";
			var items = "tbody tr";
			
			var tr_size = that.pt.find(items).length;
			if(type == "down"){
				
				if(i>=image_half_size && last_node.next != null){
// 					console.log(i, tr_size , "down normal");
		
					that.data.imgScrollObj.isImageScroll_top = false;
					if(tr_size != image_half_size){
						that.removeItems((tr_size - image_default_size), type, items, scroll_bar);
					} else {
						that.removeItems((tr_size - image_half_size), type, items, scroll_bar);
					}
					that.data.imgScrollObj.image_remain_size = 0;
					that.setStartAndLastNode();	
				} else {
					
					that.data.imgScrollObj.image_remain_size = i;
					that.data.imgScrollObj.isImageScroll_end =  true;
// 					console.log(i, tr_size, "down end");
				}

			} else {
				
				if(i>=image_half_size && start_node.prev != null){
					that.data.imgScrollObj.isImageScroll_end = false;
					that.removeItems((image_half_size + image_remain_size), type, items, scroll_bar);
					that.setStartAndLastNode();	
					that.data.imgScrollObj.image_remain_size = 0;
// 					console.log(i, tr_size, "up normal");
				} else {
					if(tr_size != image_half_size){
						that.removeItems((i + image_remain_size), type, items, scroll_bar);
						that.data.imgScrollObj.image_remain_size = 0;
					}
					that.data.imgScrollObj.isImageScroll_top =  true;
					
					that.data.imgScrollObj.last_node = linked_list.obj[that.pt.find(items).last().data("id")];
// 					console.log(i, tr_size, "up end");
				}
			}
		},
    	
    	setImageScrollListener : function(){
    		var that = annotation_upload;

    		that.pt.find(".table_body").off("scroll").on("scroll",function(){
    			
				var target = $(this);
				var st = target.scrollTop();
				
				var box_size = that.pt.find("tbody tr").length;
				var isImageScroll_top = that.data.imgScrollObj.isImageScroll_top;
				var isImageScroll_end = that.data.imgScrollObj.isImageScroll_end;
				var isImageScroll = that.data.imgScrollObj.isImageScroll;
				var last_node = that.data.imgScrollObj.last_node;
				var start_node = that.data.imgScrollObj.start_node;
				
				if (st + target.innerHeight() >= target[0].scrollHeight && !isImageScroll){
					// 제일 아래,.
					if(!isImageScroll_end){
						if(last_node.next != null) {
							that.data.imgScrollObj.isImageScroll = true;
							that.data.imgScrollObj.isImageScroll_top = false;
							that.addImageList(last_node.next,"down");	
						} 
					}
				} else if (st == 0 && !isImageScroll){
					if(!isImageScroll_top){
						if(start_node.prev != null){
							that.data.imgScrollObj.isImageScroll = true;
							that.data.imgScrollObj.isImageScroll_end = false;
							that.addImageList(start_node.prev,"up");
						}
					}
				}
			});
    	},

		removeItems : function(size,type, items, scroll_bar){
			var that = annotation_upload;
			
			if(type == "down"){
				that.pt.find(items).slice(0,size).remove();					
			} else {		
				that.pt.find(items).slice(-size).remove();
			}
			that.pt.find(scroll_bar).scrollTop((that.pt.find(scroll_bar)[0].scrollHeight - that.pt.find(scroll_bar).height()) / 2);
		},

		tableListener : function() {
			var that = annotation_upload;	
			
			var select_all = that.pt.find("table thead th .checkBox");
			var box_click = that.pt.find("table tbody tr .checkBox");

			box_click.off("click").on("click",function() {
				var btn = $(this);
				var cur_id = btn.parent().parent().data("id");
				var image_box_obj = that.data.imgScrollObj.image_box_obj;
				var linked_list = that.data.imgScrollObj.linked_list;
				btn.toggleClass("selected");
				
				
				if(btn.hasClass("selected")){
					that.data.imgScrollObj.image_box_obj[cur_id] = cur_id;
					if(Object.keys(image_box_obj).length == linked_list.length){
						select_all.addClass("selected");
					}
				} else {
					delete that.data.imgScrollObj.image_box_obj[cur_id];
					select_all.removeClass("selected");
				}
			});
			
			that.pt.find("table tbody td").off("mouseenter").on("mouseenter",function(){
				if(this.children.length) {return;}
				var text = $(this)[0].innerText;
				$(this).empty();
				$(this).append(text);
				that.addHoverBox($(this), text);
			});
			
			that.pt.find("table tbody td").off("mouseleave").on("mouseleave",function(){
				that.removeHoverBox($(this));
			});
			
			
			// 이미지 리스트 전체에 체크박스
			select_all.off("click").on("click",function(){
				var box_all = $(this);
				var linked_list = that.data.imgScrollObj.linked_list;
				box_all.toggleClass("selected");
				
				if(box_all.hasClass("selected")){
					that.pt.find("tbody tr .checkBox").addClass("selected");
					var node = linked_list.head;
					while(node){
						var path = node.value.path;
						var x = node.value.x;
						var y = node.value.y;
						var w = node.value.w;
						var h = node.value.h;
						var label = node.value.label;
						var cur_id = path + "," + x + "," + y + "," + w + "," + h + "," + label;
						that.data.imgScrollObj.image_box_obj[cur_id] = cur_id;
						node = node.next;
					}
				} else {
					that.pt.find("tbody tr .checkBox").removeClass("selected");
					that.data.imgScrollObj.image_box_obj = [];
				}
			});

			that.pt.find(".anno_table tbody tr .img_preview").off("mouseenter").on("mouseenter",function(){

				var show_img = $(this).children(".show_img");
				
				var x = $(this).offset().left + $(this).outerWidth() + 10;
		        var y = $(this).offset().top + $(this).outerHeight() - 59;
				
				show_img.css({"top":y+"px", "left":x+"px","position": "fixed","display": "flex"});
				var tr = $(this).parent().parent().children();
				showLoading("#annotation_upload .show_img");
				
				var imgObj = new Image();

				imgObj.src = "/uploadFile/xlabeller/" + tr[2].innerHTML; 
	 			
				// jh.sa 주석해제
 				imgObj.onload = function(){
					that.data.canvas_hover = document.createElement('canvas');
					show_img.html(that.data.canvas_hover);
					that.crop(imgObj, tr[3].innerHTML, tr[4].innerHTML, tr[5].innerHTML, tr[6].innerHTML);	
				}
				 
				imgObj.onerror = function(){
					hideLoading("#annotation_upload .show_img");
				}
			});
			
			that.pt.find(".anno_table tbody tr .img_preview").off("mouseleave").on("mouseleave",function(){
				var show_img = $(this).children(".show_img");
				var normal_img = $(this).children(".normal_img_wrap");
				show_img.css("display","none");
				$(this).removeClass("selected");
			});
			

			that.pt.find(".anno_table tbody tr .img_preview").off("click").on("click",function(){
				var normal_img = $(this).children(".normal_img_wrap");
				if(normal_img.parent().hasClass("selected")){
					normal_img.parent().toggleClass("selected");	
				} else {
					that.pt.find("tbody tr .img_preview").removeClass("selected");
					normal_img.parent().toggleClass("selected");
				}
				
				
				var x = $(this).offset().left + $(this).outerWidth() + 10;
		        var y = $(this).offset().top + $(this).outerHeight() - 141;
	        
		        normal_img.css({"top":y+"px", "left":x+"px","position": "fixed"});
				var tr = $(this).parent().parent().children();
				var cur_index = $(this).parent().parent().index();
				tr.find(".title_wrap .title").empty();
				tr.find(".title_wrap .title").text(tr[7].innerHTML);
				

				var cur_id = ""+tr[2].innerHTML + tr[3].innerHTML +tr[4].innerHTML + tr[5].innerHTML + tr[6].innerHTML + tr[7].innerHTML
				that.data.canvas = null;
				$(this).children().children(".frame_container").empty();
				$(this).children().children(".frame_container").append("<canvas id="+"'"+cur_index+"c' width='270px' height='182px'>");
				that.data.canvas = new fabric.Canvas(cur_index+"c");
				that.data.canvas.selection = false;

				var imgObj = new Image();
				var canvas = that.data.canvas;
				imgObj.src = "/uploadFile/xlabeller/" + tr[2].innerHTML; 
				showLoading(tr.children().children(".normal_img_wrap"));
				
				imgObj.onload = function(){					
					that.rescale(this);
					
					canvas.setBackgroundImage(imgObj.src, canvas.renderAll.bind(canvas), {
// 				          backgroundImageOpacity: 0.5,
// 				          backgroundImageStretch: true,
				          scaleX : that.data.scaleFactor,
						  scaleY : that.data.scaleFactor	          
				    });
					
					that.clearCanvas();
					that.setSingleMeta(cur_id, tr[7].innerHTML, tr[3].innerHTML, tr[4].innerHTML, tr[5].innerHTML, tr[6].innerHTML);
					that.updateRedraw();
					hideLoading(tr.children().children(".normal_img_wrap"));
				}
				
				imgObj.onerror = function(){
					hideLoading(tr.children().children(".normal_img_wrap"));
				}
				
				
			});		
		},
		
		addHoverBox : function(elem,text){
			var that = annotation_upload;

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
			var that = annotation_upload;
			elem.find(".hover_box").remove();
		},
		
		rescale : function(img){
        	var that = annotation_upload;
        	var canvas = that.data.canvas;
        	var scaleFactor = that.data.scaleFactor;
			var canvas_max_width = 270;
            var canvas_max_height = 182;
            if(canvas_max_height/canvas_max_width >= img.naturalHeight/img.naturalWidth){
            	that.data.scaleFactor = canvas_max_width/img.naturalWidth;
            } else{
            	that.data.scaleFactor = canvas_max_height/img.naturalHeight;
            }
            
            canvas.setWidth(img.naturalWidth*scaleFactor);
         	canvas.setHeight(img.naturalHeight*scaleFactor);
    		canvas.calcOffset();
    		canvas.renderAll();      
    	},
    	
    	updateRedraw : function(){
        	var that = annotation_upload;
        	var canvas = that.data.canvas;
			var rect = new fabric.Rect(labelMap);	
			canvas.add(rect);
			
        },
        
        clearCanvas : function(){
        	var that = annotation_upload;	
        	$("#label-container").empty();
        	//캔버스에 존재하는 오브젝트 모두 삭제
        	var canvas = that.data.canvas;
        	var canvObjLen = canvas.getObjects().length;
        	for(var i = 0 ; i < canvObjLen; i++){
        		canvas.remove(canvas.getObjects()[0]);
        	}
        },
        
        setSingleMeta : function(id,label,x,y,w,h){
        	var that = annotation_upload;
        	var colorHash = that.data.colorHash;
			var fillColor = colorHash.rgb(label);
			var scaleFactor = that.data.scaleFactor;

			labelMap = {
					id: id,
					label: label,
					left: x*1*scaleFactor,
					top: y*1*scaleFactor,
					width: w*1*scaleFactor,
					height: h*1*scaleFactor,
					lockMovementX : true,
					lockMovementY : true,
					lockScalingX : true,
					lockScalingY : true,
					lockRotation : true,
					angle: 0,
					fill: "rgba("+fillColor[0]+","+fillColor[1]+","+fillColor[2]+",0.5)"
			}
        },
		
        
		createJson : function() {
			var that = annotation_upload;
			var linked_list = that.data.imgScrollObj.linked_list;
			var dataArr = [];

			var title = that.pt.find(".anno_title").val();
			var contents = that.pt.find(".anno_contents").val();
			if(title == ""){
				alert("제목을 입력해주세요");
				that.pt.find(".anno_title").focus();
				return;
			}
			
			if(contents == ""){
				alert("설명을 입력해주세요");
				that.pt.find(".anno_contents").focus();
				return;
			}
				
			if(linked_list == null){
				alert("사용 가능한 데이터가 없습니다");
				return;
			}
			$("#loader").show();
			var keys = Object.keys(linked_list.obj);
			for(var i = 0; i<keys.length; i++){
				var value = linked_list.obj[keys[i]];
				dataArr.push(value.value);
			}
			
			if(dataArr.length == 0){
				alert("사용 가능한 데이터가 없습니다");
				$("#loader").hide();
				return;
			}
			
			
			console.log("dataArr::",dataArr);
			var str = JSON.stringify(dataArr);
			
			that.insertAnnotation(title, contents, str);
		},

		insertAnnotation : function(t, c, str) {
			var that = annotation_upload;
			var label_type = that.pt.find("select[name='label_type'] option:selected").data("value");
			var ajaxData = {
				"title" : t,
				"contents" : c,
				"data" : str,
				"label_type" : label_type
			}
			alert("데이터의 크기에 따라 작업시간이 오래 소요될 수 있습니다.\n잠시만 기다려주세요.");
			$.ajax({
				url : baseUrl + "annotation/insertAnnotation.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("=====insertAnnotation.json=====", res);
					$("#loader").hide();
					if(res.result.code == "3301"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					}
					if (res.result.code == "200") {
						alert(res.result.data);
						that.resetView();
						annotation.refresh();
						annotation.hideView();
						annotation.main();
					} else {
						alert(res.result.data);
					}
					
				},
				error : function(err) {
						$("#loader").hide();
						console.log("ERROR", err);
				}
			});

		},
		
		createAugData : function(data){
			var that = annotation_upload;
			
			$.ajax({
				url : "http://192.168.2.160:5000/augment/images",
				data : JSON.stringify(data),
// 				cache:false,
				crossDomain: true,
				crossOrigin: true,
				contentType:"application/json; charset=UTF-8",
				type : "POST",
// 				dataType:"json",
				success : function(res){
					console.log("::createAugData::",res);
					that.renderAugImage(res.augment_images);
				},
				error : function(err){
					console.log("ERROR",err);
				}
			});
		},
		
		renderAugImage : function(data){
			var that = annotation_upload;
			
			var dataIds = [];
			for(var i=0; i<data.length; i++){
				var html = "";
//	 			html += " <div class='box_contain' data-id='"+cur_id+"'> ";
				var dataId = '"'+ i + data[i]['label'][0]['x1']+','+ data[i]['label'][0]['x1']+','+ data[i]['label'][0]['y1']+','+ data[i]['label'][0]['x2']+','+ data[i]['label'][0]['y2']+","+data[i]['label'][0]['type'];
				dataIds.push(dataId);
				html += " <div class='box_contain' data-id='" + dataId + "'> ";
				html += "  <div class='box'>";
				html += "	<div class='select_box'></div>";	
				html += " 	<div class='img'><canvas width='"+data[i]['label'][0]['x2']+"' height='"+data[i]['label'][0]['y2']+"'></canvas></div> ";
				html += "  </div>";
				html += "  <div class='label_wrap'>";
				html += "   	<span>"+data[i].label[0]['type']+"</span>";
				html += "   </div>";
				html += " </div> ";
				that.pt.find(".search_result_wrap .media_wrap .search_result").append(html);	
			}
			that.loadAugImages(data,dataIds);
		},
		
		loadAugImages : function(data,dataIds){
			var that = annotation_upload;
			var path = [];
			var imgs = [];
			var ctxs = [];
			for(var i=0; i<data.length; i++){
				var imgObj = new Image();
				var src = "data:image/png;base64,"+data[i]['image'];
				path.push(src);
				
				var tmp = that.pt.find(".box_contain[data-id='"+dataIds[i]+"'] .box .img canvas");
				
				for(var j=0;j<tmp.length; j++){
					
					
					var ctx=tmp[j].getContext('2d');
					ctxs.push(ctx);
					var img = new Image();
					imgs.push(img);
// 					img.src = src;
// 					ctx.drawImage(img,0,0);
					
// 					img.onload = function(){
// 						ctx.drawImage(img,0,0);
// 					}
// 					img.src = src;
				}
				imgLoad(imgs,path,ctxs);
			}
			function imgLoad(imgs,src,ctxs){
				for(var i=0; i<imgs.length; i++){
// 					imgs[i].onload = function(){
// 						console.log(ctxs[i])
// 						ctxs[i].drawImage(imgs[i],0,0);
// 					}
					imgs[i].src = src[i];
				}
				
// 				img.onload = function(){
// 					ctx.drawImage(img,0,0)
// 				}
// 				img.src = src;
			}
		},
		
		encodeBase64ImageTagViaCanvas : function(canvas) {
			let uri = canvas.toDataURL('image/png');
			return uri
// 			return new Promise((resolve,reject) => {
// 				let uri = canvas.toDataURL('image/png');
// 				resolve(uri)
// 			});
		},
		
		selectboxListener : function(){
			var that = annotation_upload;
			var label_select = that.pt.find("select[name='label_type']");
			var linked_list = that.data.imgScrollObj.linked_list;
			
			if(linked_list != null){
				label_select.attr("disabled", "disabled");
			} else if (linked_list == null) {
				label_select.removeAttr("disabled");
			};
			
		},
	};

	
</script>
