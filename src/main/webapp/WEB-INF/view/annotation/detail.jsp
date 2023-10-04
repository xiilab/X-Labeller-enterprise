<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>

<title>밀리터리 이미지넷 객체 라벨기</title>

<style>

	@media screen and (min-width: 1920px){
		#annotation_detail .search_wrap .search_result_wrap .media_wrap .search_result { width : 536px; }
		#annotation_detail .tag_margin { width : 528px;}
		#annotation_detail .all_margin {width : 523px; }
		#annotation_detail .tag_box_wrap button {width: 78px;}
		#annotation_detail .all_margin .select_all_wrap .checkBox {padding-left: 0px;}

		#annotation_detail .tag_box_wrap {margin: 5px;}
		#annotation_detail .tag_wrap {max-height: 126px; min-height: 42px;}
	}

	@media screen and (max-width: 1920px){
		#annotation_detail .search_wrap .search_result_wrap .media_wrap .search_result { width : 536px; }
		#annotation_detail .tag_margin { width : 528px;}
		#annotation_detail .all_margin {width : 523px; }
		#annotation_detail .tag_box_wrap button {width: 78px;}
		#annotation_detail .all_margin .select_all_wrap .checkBox {padding-left: 0px;}

		#annotation_detail .tag_box_wrap {margin: 5px;}
		#annotation_detail .tag_wrap {max-height: 126px; min-height: 42px;}
	}
	
	@media screen and (max-width: 1600px){
		#annotation_detail .search_wrap .search_result_wrap .media_wrap .search_result { width : 402px; }
		#annotation_detail .tag_margin { width : 395px;}
		#annotation_detail .all_margin {width : 391px; }
		#annotation_detail .all_margin .select_all_wrap .checkBox {padding-left: 2px;}
		#annotation_detail .tag_box_wrap button {width: 71px;}
		#annotation_detail .tag_box_wrap {margin: 4px;}
		#annotation_detail .tag_wrap {max-height: 120px; min-height: 40px;}
	}

	@media screen and (max-width: 1440px){
		#annotation_detail .search_wrap .search_result_wrap .media_wrap .search_result { width : 402px; }
		#annotation_detail .tag_margin { width : 395px;}
		#annotation_detail .all_margin {width : 391px; }
		#annotation_detail .all_margin .select_all_wrap .checkBox {padding-left: 2px;}
		#annotation_detail .tag_box_wrap button {width: 69px;}
		#annotation_detail .tag_box_wrap {margin: 5px;}
		#annotation_detail .tag_wrap {max-height: 126px; min-height: 42px;}
	}
	
/* 공통 */

#annotation_detail {width: 100%; height: 100%;}
.section_wrap {background-color: #fff;}

#annotation_detail .anno_table tbody td {cursor:default;}
#annotation_detail .table_body{max-height: calc(100% - 212px); overflow-y: overlay; overflow-x: hidden; }
#annotation_detail .table_body .anno_table {table-layout: fixed;}
#annotation_detail .ms_wrap {width: 100%; padding-top: 23px; }

#annotation_detail .hover_box {border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
#annotation_detail .hover_box div {font-family: Open_Sans; font-size: 13px; color: #555555;}
#annotation_detail .hover_div div {word-break: break-word; margin: 2px 5px; white-space: normal; font-weight: 300; font-family: Open_Sans;}

#annotation_detail .empty_wrap {text-align: center;}
#annotation_detail .empty_wrap .no_image {margin-bottom: 17px; background-repeat: no-repeat; background-position-x: center; }
#annotation_detail .empty_wrap .eng_text {font-family: Open_Sans; margin-bottom: 3px; font-size: 16px; font-weight: 300; color: #777777;}
#annotation_detail .empty_wrap .kor_text {font-family: Open_Sans; font-size: 12px; color: #777777; font-weight: 200;}

/* 메인 */

#annotation_detail .main_wrap {width: 60%; height: 100%; position:relative;}
#annotation_detail .main_title {display: block;font-family: Open_Sans; font-size: 12px;font-weight: 400; color: #343434; margin-bottom : 20px;}
#annotation_detail .anno_title { display: block; font-family: Open_Sans; font-size: 20px; color: #343434;}
#annotation_detail .anno_contents {margin-top : 8px; display: block;  font-family: Open_Sans; font-size: 12px; color: #797a7c; width: 304px;}
#annotation_detail .anno_wrap {width: calc(100% - 39px);}
#annotation_detail .anno_wrap > input { width: 900px; border-width: 0; padding: 0; font-weight: 300; }

#annotation_detail .create_btn {position:relative; float:right; right:7; display:block; width: 32px; height: 32px; background-color: #ffffff; background: url('./images/icon-edit.png') no-repeat center; }
#annotation_detail .create_btn:hover {background: url('./images/icon-edit-hover.png') no-repeat center; }

#annotation_detail .main_wrap .list_wrap span {margin: 22px 0 24px; float: left; font-family: Open_Sans;font-size: 14px;font-weight: 400; color: #343434;}
#annotation_detail .main_wrap .list_wrap .list_total {float: right; }

#annotation_detail .main_wrap .list_wrap {height: calc(100% - 138px);}
#annotation_detail .main_wrap .list_wrap .btn_wrap > button {border-radius:2px; text-align:center ; padding: 0px; width: 68px; height: 28px; font-family: Open_Sans;font-size: 12px; font-weight: 300;}
#annotation_detail .main_wrap .del_btn {float:left; background-color: #f8f8f8; color: #343434;}

#annotation_detail .main_wrap .del_btn { background-color: #f8f8f8; color: #343434;}
#annotation_detail .main_wrap .btn_wrap.del {left: 30px;}

#annotation_detail .main_wrap .save_btn {float:right; background-color: #4c84ff; color: #ffffff; }
#annotation_detail .main_wrap .btn_wrap.save {right: 30px;}

#annotation_detail .main_wrap .save_btn:hover {background-color: #3A71E9; }

#annotation_detail .main_wrap .empty_wrap { margin-top: 170px;  }
#annotation_detail .main_wrap .no_image {height: 37px; background-image: url('./images/icon_nodata_list.png'); }

#annotation_detail .main_wrap .list_wrap .btn_wrap {bottom: 0; position: absolute; margin-bottom: 41px; }
#annotation_detail .main_wrap .list_wrap .btn_wrap.del{ left: 30;}
#annotation_detail .main_wrap .list_wrap .btn_wrap.save{ right: 30;}

#annotation_detail .main_wrap .list_wrap table tbody tr .preview .img_preview {cursor: pointer; border: 1px solid #979797; position: relative; margin: auto;  border-radius: 2px; background-size: 14px; width: 28px ; height: 28px; background-color: rgba(0, 0, 0, 0.1); background-image: url('./images/icon_preview_normal.png'); background-repeat: no-repeat; background-position: center; position: relative;}
#annotation_detail .main_wrap .list_wrap table tbody tr .preview .img_preview:hover { background-image: url('./images/icon_preview_hover.png'); border: 1px solid #4c84ff;}
#annotation_detail .main_wrap .list_wrap table tbody tr .preview .show_img{ z-index: 1; display: none; align-items: center; justify-content: center; flex-direction: column;  border-radius: 1px ; border : 1px solid #dadada;  top: -30px; left: 130%;  width: 120px;height: 90px;box-shadow: 0 5px 9px -1px rgba(0, 0, 0, 0.16); background-color: #ffffff;}
#annotation_detail .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap{ z-index: 99; display: none;   border-radius: 1px ; border : 1px solid #dadada;  top: -30px; left: 130%;  width: 294px;height: 248px; box-shadow: 0 5px 9px -1px rgba(0, 0, 0, 0.16); background-color: #ffffff}
#annotation_detail .main_wrap .list_wrap table tbody tr .preview .img_preview.selected .normal_img_wrap{display: block;}
#annotation_detail .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap .title_wrap {height: 28px; }
#annotation_detail .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap .title_wrap .image{margin-left: 12px; background-image: url('./images/icon_preview_hover.png'); background-repeat: no-repeat; width: 12px; height: 12px; }
#annotation_detail .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap .title_wrap .title{overflow: hidden; white-space: nowrap; text-overflow: ellipsis; line-height: 28px; max-width: 254px; margin-right:12px; margin-left: 4px; font-weight: 300; font-family: Open_Sans; font-size: 12px; color: #555555; }
#annotation_detail .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap .frame_container {display:flex; height:219px; align-items: center; justify-content: center; flex-direction: column; border-top: 1px solid #dadada;}

#annotation_detail .main_wrap .horizontal_line {width: 100%; height: 1px; background-color: #e7e7e7; margin-top: 15px; display:inline-block;}


#annotation_detail .main_wrap .hover_div {max-width: 264px; text-align: left; position: relative; font-weight: 400;}
#annotation_detail .main_wrap .hover_box {max-width: 264px; text-align: left; }

/* 서브 */

#annotation_detail .search_wrap {width: 40%; height: 100%; position: relative; overflow-y: hidden; border-left: 1px solid #e5e5e5;}

#annotation_detail .image_search {margin-top: 17px; position: relative; display: block; }
#annotation_detail .image_search input { border-radius: 2px; border-color: #dedcde; border-right: none; padding: 0 11px; margin-left: 177px; width: calc(100% - 200px); height: 40px; font-weight: 300; background-color: #ffffff; font-family: Open_Sans; font-size: 13px; color: #555555; box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1);}
/* #annotation_detail .image_search input { border-radius: 2px; border-color: #dedcde; border-right: none; padding: 0 11px; width: calc(100% - 23px); height: 40px; background-color: #ffffff; font-family: Open_Sans; font-weight:300; font-size: 13px; color: #555555; box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1);} */
#annotation_detail .image_search select { width: 170px; height: 42px; padding: 0 11px; display: inline-block; position: absolute; color: #555; background-color: #fff; box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.1); border-color: #dedcde; border-radius: 2px; outline: none; font-weight: 300; font-family: Open_Sans; }

#annotation_detail .image_search .search_btn {top: 0 ; background-repeat: no-repeat; background-position: center; background-image: url('./images/icon_filter_search_normal.png'); right: 0; position: absolute;  width: 41px; height: 41px; background-color: #4c84ff; border-radius: 4px;}
#annotation_detail .image_search .search_btn:hover {background-color: #3A71E9; }

#annotation_detail .search_wrap .add_btn {border-radius:2px; padding: 0 ; border: 1px solid #cbcbcb;  text-align: center; width: 88px; height: 28px;background-color: #f8f8f8; font-family: Open_Sans;font-size: 12px;font-weight: 300;color: #343434;}
#annotation_detail .search_wrap .horizontal_line {width: 100%; height: 0; margin-top: 26px;}

#annotation_detail .search_wrap .select_all_wrap {margin-bottom : 20px;}
#annotation_detail .search_wrap .select_all_wrap span { line-height: 14px; font-family: Open_Sans; font-weight: 300; font-size: 12px; color: #343434; float:left; margin-left: 9px; width: calc(100% - 111px); }

#annotation_detail .search_title {display: inline-block;  font-family: Open_Sans; font-size: 12px;color: #343434; font-weight: 400;}
#annotation_detail span.list_total {float: right; font-family: Open_Sans; font-size: 12px;color: #343434; font-weight: 400;}

#annotation_detail .search_wrap .search_result_wrap { margin-top: 23px; width: 100%; position: relative; display: block; height: 100%}
#annotation_detail .search_wrap .search_result_wrap .media_wrap { overflow-y: overlay; height: calc(100% - 511px);}
#annotation_detail .search_wrap .search_result_wrap .media_wrap .search_result { margin: 0 auto; }
#annotation_detail .search_wrap .search_result_wrap #loading {background: 0;}
#annotation_detail .search_wrap .search_result_wrap .search_result .box_contain {float:left ; width:120px; margin: 7px;}
#annotation_detail .search_wrap .search_result_wrap .search_result .box { top: 13px; border-radius: 2px; width: 120px; height: 90px; text-align:center; border: solid 1px #d9d9d9; background-color: #ffffff;  display: flex; align-items: center; justify-content: center;position:relative;flex-direction: column; }
#annotation_detail .search_wrap .search_result_wrap .search_result .box .select_box { position: absolute; width: 14px; height: 14px; top: 10px; left: 10px; background-image: url('./images/btn_checkbox_normal.png'); background-repeat: no-repeat; }
#annotation_detail .search_wrap .search_result_wrap .search_result .box:hover .select_box {background-image: url('./images/btn_checkbox_hover.png');}
#annotation_detail .search_wrap .search_result_wrap .search_result .box:hover {cursor: pointer; border : 1px solid #4c84ff;}
#annotation_detail .search_wrap .search_result_wrap .search_result .box .select_box.selected {background-image: url('./images/btn_checkbox_selected.png');  }
#annotation_detail .search_wrap .box_contain .label_wrap {border-radius: 2px; margin-top: 12px; width: 120px; height: 24px; position:relative; border: 1px solid #dedcde; background-color: #ffffff; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; }
#annotation_detail .search_wrap .box_contain .label_wrap span { line-height: 24px; margin-left: 9px;  font-family: Open_Sans; font-size: 13px; color: #555555; font-weight: 300;}


#annotation_detail .image_search .detail_btn {border : 0; background-image: url('./images/icon_filter_normal.png'); top :5px; right: 0; position: absolute; margin-right: 50px; width: 30px; height: 30px;}
#annotation_detail .image_search .detail_btn:hover {background-image: url('./images/icon_filter_hover.png');}


#annotation_detail .detail_tooltip {margin-top : 15px; z-index: 999999; right:0 ; top : 55; position: absolute; visibility: hidden; width: 245px;height: 433px;background: #ffffff; border-radius: 2px; border : 1px solid #dadada;} 
#annotation_detail .detail_tooltip:after, .detail_tooltip:before {bottom: 100%; left: 84.5%; border: solid transparent; content: " "; height: 0; width: 0; position: absolute; pointer-events: none;} 
#annotation_detail .detail_tooltip:after {border-color: rgba(136, 183, 213, 0); border-bottom-color: #ffffff; border-width: 10px; margin-left: -35px;}
#annotation_detail .detail_tooltip:before {border-color: rgba(194, 225, 245, 0); border-bottom-color: #dadada; border-width: 11px; margin-left: -36px;}


#annotation_detail .info_wrap {position:relative; width: 100% ; height: 97.3%;}
#annotation_detail .info_wrap .select_wrap {position: absolute; margin-top: 13px; max-height: 295px; width: 100%; overflow-y: scroll; border-bottom: 1px solid #dadada; border-top: 1px solid #dadada;}
#annotation_detail .info_wrap .set_wrap {width: 245px; height: 28px;  background-color: #ffffff; position:absolute; text-align:center; margin: 333px auto 0 auto;}
#annotation_detail .info_wrap .set_wrap button {border-radius:2px; width: 68px; height: 28px; font-family: Open_Sans; font-size: 12px; font-weight: 300; color: #343434; background-color: #f8f8f8; padding: 0px; border: 1px solid #cbcbcb ; border-radius: 1px;}

#annotation_detail .info_wrap .close_tooltip_btn {padding:0; background-repeat: no-repeat; background-position: center; background-image: url('./images/icon_filter_arrow_normal.png'); color: #555555;  height: 20px; position: absolute; bottom: 0; width : 100%; background-color: #f8f8f8; text-align: center;  border-top: 1px solid #cbcbcb; border-radius: 1px; }
#annotation_detail .info_wrap .close_tooltip_btn:hover {background-image: url('./images/icon_filter_arrow_hover.png');}

#annotation_detail .select_wrap .dataset_wrap {cursor:pointer; width: 100%; height: 36px; border-bottom: 1px solid #dadada;}
#annotation_detail .select_wrap .dataset_wrap:hover {background-color: #e4f1ff;}
#annotation_detail .select_wrap .dataset_wrap .checkBox {margin-left: 21px;}
#annotation_detail .select_wrap .dataset_wrap .folder {background-image: url('./images/icon_filter_folder.png'); background-repeat: no-repeat; background-position: center; margin-left: 13px; width: 16px; height: 16px;}
#annotation_detail .select_wrap .dataset_wrap .title {margin-left: 10px; font-family: Open_Sans; font-weight: 300; font-size: 13px; color: #616263; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; max-width: 150px;}
#annotation_detail .select_wrap .dataset_wrap:last-child{border-bottom: 0;}

#annotation_detail .info_wrap .filter_wrap {margin-top : 14px; margin-left: 21px;}
#annotation_detail .info_wrap .filter_wrap span {margin-left: 13px; line-height: 14px; font-size: 12px; color: #343434; font-family: Open_Sans; font-weight: 400;}


#annotation_detail .search_wrap .first_wrap {background-color: #f5f5f5; border-bottom : 1px solid #e5e5e5;}
#annotation_detail .second_wrap {position: relative; height: 100%;}

#annotation_detail .search_wrap .empty_wrap { margin-top: 270px;  }
#annotation_detail .search_wrap .empty_wrap .no_image {height: 34px; background-image: url('./images/icon_nodata_research.png');} 

#annotation_detail .tagtp {padding: 20px 0 ; border-bottom: 1px solid #e5e5e5; }
#annotation_detail .tag_txt_wrap {height: 48px; border-bottom: 1px solid #e5e5e5;}
#annotation_detail .tag_txt_wrap span {line-height: 48px;font-family: Open_Sans; font-size: 14px;font-weight: 400; color: #555555; }
#annotation_detail .tag_margin {margin: 0 auto;}
#annotation_detail .tag_wrap {  overflow: overlay; overflow-x:hidden;}
#annotation_detail .tag_wrap .tag_box_wrap { float : left; text-align: center; position:relative; }
#annotation_detail .tag_wrap .tag_box_wrap button{ height: 32px; border: 1px solid #d9d9d9; border-radius: 4px; background-color: #f4f7fc; font-weight: 200;  font-family: Open_Sans; font-size: 14px; color: #555555; padding: 0px; overflow: hidden;white-space: nowrap;text-overflow: ellipsis;}
#annotation_detail .tag_wrap .tag_box_wrap button.selected {box-shadow: 0 3px 4px 0 rgba(159, 189, 255, 0.7); background-color: #4c84ff; color: #ffffff;}

#annotation_detail .second_wrap .hover_div {max-width: 94px; text-align: left; position: relative; font-weight: 400;}
#annotation_detail .second_wrap .hover_box {max-width: 94px; text-align: left; }



#annotation_detail .all_margin {margin: 0 auto;}
#annotation_detail .search_wrap .search_result_wrap .search_result .box.vid {border-radius: 2px; width: 120px; height: 22px; top: 13px; text-align:center; border: solid 1px #d9d9d9; background-color: #ffffff;  display: flex; align-items: center; justify-content: center;position:relative;flex-direction: column; }
#annotation_detail .search_wrap .search_result_wrap .search_result .box.vid .select_box { top: 4px; left: 4px; }

</style>

</head>
<body>

	<div class="container" id="annotation_detail">

		<div class="contents flex">
			<div class="main_wrap ">
				<div class="title_wrap ms">
					<div class="ms_wrap">
						<span class="main_title">데이터세트 패키지 수정</span>
						<div class="flex">
							<div class="anno_wrap">
								<input class="anno_title" data-length="100" placeholder="제목을 입력해주세요."  onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
								<input class="anno_contents" data-length="200" placeholder="설명을 입력해주세요.">
							</div>
							<button class="create_btn"></button>
						</div>
					</div>
				</div>
				<div class="horizontal_line"></div>

				<div class="list_wrap ms">

					<span class="list_title">색인(라벨링) 목록</span>
					<span class="list_total">총개수 0</span>
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
									<th class="pre">미리보기</th>
									<th>파일경로</th>
									<th>X</th>
									<th>Y</th>
									<th>W</th>
									<th>H</th>
									<th>라벨</th>
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
						<button class="del_btn filter_color">삭제</button>
					</div>
					<div class="btn_wrap save">
						<button class="save_btn ">저장하기</button>
					</div>
				</div>
			</div>

			<div class="search_wrap">
				<div class="first_wrap">
					<div class="ms">
						<div class="ms_wrap">
							<span class="search_title">이미지 이름으로 검색</span>
							<span class="list_total">총개수 0</span>
							<div class="image_search">
								<select name="label_type">
									<!-- <option value="Image" selected>Bounding Box</option>
									<option value="polygon">Segmentation</option> -->
									<option value="IMAGE_BBOX">바운딩 박스</option>
									<option value="IMAGE_SEGMENTATION">세그멘테이션</option>
									<%--									<option value="VIDEO_BBOX">Video Bounding Box</option>									--%>
								</select>							
								<input placeholder="키워드를 입력해주세요." name="images">
								<button class="detail_btn"></button>
								<div class="detail_tooltip filter_color">
									<div class="info_wrap">
										<div class="filter_wrap flex">
											<div class="checkBox"></div>
											<span>필터 목록</span>
										</div>
										<div class="select_wrap"></div>
										<div class="set_wrap">
											<button>확인하기</button>
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
	
// 	var canvas;											// jh.sa 210225 canvas => that.data.canvas
// 	var canvas_hover;									// jh.sa 210225 canvas_hover => that.data.canvas_hover
// 	var colorHash = new ColorHash();					// jh.sa 210225 colorHash => that.data.colorHash
// 	var cur_id;											// jh.sa 210225 cur_id => that.data.annotation_id
// 	var init_label_type;								// jh.sa 210225 init_label_type => that.data.init_label_type
	
// 	var detail_list = new Array();						// jh.sa 210225 detail_list => that.data.detail_list 사용 안함
// 	var scaleFator;										// jh.sa 210225 scaleFator => that.data.scaleFactor
// 	var saved_text;										// jh.sa 210225 saved_text => that.data.saved_text 사용 안함
// 	var filter_arr = [];								// jh.sa 210225 filter_arr => that.data.filter_arr
// 	var dataset_list = [];								// jh.sa 210225 dataset_list => that.data.dataset_list
// 	var segmentation;									// jh.sa 210225 segmentation => that.data.segmentation 사용 안함
	
// 데이터가 너무많을경우...
	
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
	
	//선택한 데이를 리스트에 넣어주기 위해 사용
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
	
	
	var annotation_detail = {
		pt : $("#annotation_detail"),
		data : {
			annotation_id : null,
			init_label_type : null,
			canvas : null,
			canvas_hover : null,
			colorHash : null,
			scaleFactor : null,
			filter_arr : [],
			dataset_list : [],
			// 데이터가 너무많을경우...
			// 검색할때 fix 할거 
			fixed_arr : [],
			// 태그용
			tag_arr : [],
			// append 나 prepend 할때 사용하는 arr;
			search_arr : [],
			// 중복 제거 /태그용
			dup_obj : [],
			// 검색 해서 데이터 가져올때 겹치는 부분 제거하기위해사용
			search_obj : [],
			//선택한 데이를 리스트에 넣어주기 위해 사용
			box_obj : [],
			tag_text : null,
			//search 부분 스크롤
			scrollObj : {	
					scroll_start:0,
					scroll_end:0,
					isScroll_top:0,
					isScroll_end:0,
					isScroll : false,
					default_size : 40,
					half_size : (40 / 2)
			},		
			imgScrollObj : {
					linked_list : null,	
					start_node : null,
					last_node : null,
					isImageScroll_top : null,
					isImageScroll_end : null,
					isImageScroll : false,
					image_box_obj : [],
					image_default_size : 40,
					image_half_size : (40 / 2),
					image_remain_size : null,
					removed_size : 0,
			},
		},
		init : function(id, label_type) {
			var that = this;
			that.data.annotation_id = id;
			that.data.init_label_type = label_type;
			/* console.log("init_label_type : " + init_label_type); */
			that.resetView();
		
		},
		
		resetView : function(){
			var that = this;
			that.getAnnotationById();	
			that.pt.find(':input').val("");
			var img_box = that.pt.find(".second_wrap");
			var list = that.pt.find("table tbody");
			that.data.filter_arr = [];
			that.pt.find(".table_body").off("scroll");
			that.pt.find("thead .checkBox").off("click");
			that.pt.find(".table_body").scrollTop(0);
// 			that.data.detail_list = [];	
			$(list).html("");
			that.data.dup_obj = [];
			that.data.tag_arr = [];
			that.data.fixed_arr = [];
			that.data.box_obj = [];
			that.data.colorHash = new ColorHash();
			that.data.imgScrollObj.image_box_obj = [];
			that.data.imgScrollObj.linked_list = null;
			that.data.search_arr = [];
			that.pt.find("tbody").html("");
			that.pt.find(".table_body table tbody tr").remove();
			hideLoading("#annotation_detail .search_result_wrap");
			hideLoading("#annotation_detail .select_wrap");
			that.pt.find("thead tr .checkBox").removeClass("selected");
			that.pt.find(".detail_btn").removeClass("selected");
			$(img_box).html("");
			that.data.tag_text = "";
			that.pt.find(".empty_wrap").remove();
			that.addEmptyData(that.pt.find(".second_wrap"), "검색결과가 없습니다.","찾고자 하는 라벨을 검색해주세요.");
			that.pt.find(".list_total").text("총개수 0")
			
			that.defaultListener();
		},
		
		addEmptyData : function(elem, data1, data2){
			let that = this;
			elem.append("<div class='empty_wrap'><div class='no_image'></div><div class='eng_text'>"+data1+"</div><div class='kor_text'>"+data2+"</div></div>")
		},
		
		removeEmptyData : function(elem){
			let that = this;
			elem.find(".empty_wrap").remove();
		},
		
		setStartAndLastNode : function(){
			let that = this;
			var linked_list = that.data.imgScrollObj.linked_list;
			
			if(linked_list != null){
				that.data.imgScrollObj.last_node = linked_list.obj[that.pt.find("tbody tr").last().data("id")];
				that.data.imgScrollObj.start_node = linked_list.obj[that.pt.find("tbody tr").first().data("id")];
			}
		},
		
		
		
		getAnnotationById : function(){
			let that = this;
			var id = that.data.annotation_id;
			var ajaxData = {
				annotation_id : id
			};
			$("#loader").show();
			$.ajax({
				url : baseUrl + "annotation/getAnnotationById.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					$("#loader").hide();
					console.log("=====getAnnotationById=====", res);
					if(res.result.code == "3301"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} 
					if (res.result.code == "200") {
						label_type = res.result.data.label_type;
						that.pt.find("select[name='label_type']").val(label_type).change();
						that.getDatasetList();							
						that.setAnnotationData(res.result.data);
						that.selectboxListener();
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
		
		getVideoAnnotationById : function(){
			let that = this;
			var id = that.data.annotation_id;
			var ajaxData = {
				annotation_id : id
			};
			$("#loader").show();
			$.ajax({
				url : baseUrl + "annotation/getVideoAnnotationById.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					$("#loader").hide();
					console.log("=====getAnnotationById=====", res);
					if(res.result.code == "3301"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} 
					if (res.result.code == "200") {
						label_type = res.result.data.label_type;
						that.pt.find("select[name='label_type']").val(label_type).change();
						that.getDatasetList();							
						that.setAnnotationData(res.result.data);
						that.selectboxListener();
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
		
		setAnnotationData : function(data){
			let that = this;
			let arr = JSON.parse(data.data);
			that.pt.find(".anno_title").val(data.title);
			that.pt.find(".anno_contents").val(data.contents);	
			that.pt.find(".table_body").scrollTop(0);
			//console.log("arr::",arr);
			that.modifyImageListData(arr, "init");
		},
		
		resetImageListData : function(){
			let that = this;
			
			that.data.imgScrollObj.linked_list = new LinkedList();
			that.data.imgScrollObj.image_remain_size = 0;
			that.data.imgScrollObj.isImageScroll_top = false;
			that.data.imgScrollObj.isImageScroll_end = false;
			that.data.imgScrollObj.isImageScroll = false;
			that.data.imgScrollObj.image_box_obj = [];
    		that.removeEmptyData(that.pt.find(".list_wrap"))
		},
		
		// 수정 필요 (여기부터, meta)
		modifyImageListData : function(data, isAppend){
			var that = this;
			var isDup = false;
    		var isInit = false;
    		var append_size = 0;
    		
    		that.data.box_obj = [];
    		
    		if(that.data.imgScrollObj.linked_list == null){
    			that.resetImageListData();
    			that.pt.find("table tbody").html("");
    			isInit = true;
    		} else {
    			isInit = false;
    		}
    		
    		//console.log("isAppend : " + isAppend);
    		//console.log("linkedList : ", linked_list.obj);
    		for(let i = 0, len = data.length; i<len; i++){
    			var linked_list = that.data.imgScrollObj.linked_list;
    			var id = "";
    			if(isAppend == "append"){
    				id = data[i];
    			} else {
    				/* if(data[i].segmentation != "") {
    					id = data[i].path + "," + data[i].x + "," + data[i].y + "," + data[i].w + "," + data[i].h + "," + data[i].label + "," + data[i].segmentation;
    					id = data[i].path + "," + data[i].x + "," + data[i].y + "," + data[i].w + "," + data[i].h + "," + data[i].label; 
    				} else {
    					id = data[i].path + "," + data[i].x + "," + data[i].y + "," + data[i].w + "," + data[i].h + "," + data[i].label;
    				} */
    				if(data[i].label_type == "#IMAGE_SEGMENTATION") {
    					id = data[i].path + "," + data[i].x + "," + data[i].y + "," + data[i].w + "," + data[i].h + "," + data[i].label + "," + data[i].segmentation + "," + data[i].label_type;
    					/* id = data[i].path + "," + data[i].x + "," + data[i].y + "," + data[i].w + "," + data[i].h + "," + data[i].label; */
    				} else if(data[i].label_type == "#IMAGE_BBOX"){
    					id = data[i].path + "," + data[i].x + "," + data[i].y + "," + data[i].w + "," + data[i].h + "," + data[i].label + "," + data[i].label_type;
    				} else if(data[i].label_type == "#VIDEO_BBOX") {
    					//cur_id = path + "," + label + "," + meta_id + "," + label_type;
    					id = data[i].path + "," + data[i].label + "," + data[i].meta_id + "," + data[i].label_type;
    				}
    			}
    			if(linked_list.obj[id] == undefined){
    				if(isAppend == "append"){
    					let obj = "";
    					let sp = id.split(",");
        				let start_label_type = id.indexOf("#");
        				let end_label_type = id.length;
        				let label_type = id.substring(start_label_type, end_label_type);
        				
        				if(label_type == "#IMAGE_BBOX") {
    						obj = { "path" : sp[0],"x" : sp[1], "y" : sp[2], "w" : sp[3], "h" : sp[4], "label" : sp[5], "label_type" : label_type};
    						id = obj.path + "," + obj.x + "," + obj.y + "," + obj.w + "," + obj.h + "," + obj.label + "," + obj.label_type;
    					} else if(label_type == "#IMAGE_SEGMENTATION") {
    						// j.seo 추가
    	    				let startIndex = data[i].indexOf("[");
    	    				let endIndex = data[i].indexOf("]") + 1; 
    	    				let split_seg = data[i].substring(startIndex, endIndex);
    	    				let seg = split_seg;
    	    				obj = { "path" : sp[0],"x" : sp[1], "y" : sp[2], "w" : sp[3], "h" : sp[4], "label" : sp[5], "segmentation" : seg, "label_type" : label_type};
    	    				id = obj.path + "," + obj.x + "," + obj.y + "," + obj.w + "," + obj.h + "," + obj.label + "," + obj.segmentation + "," + obj.label_type;
    						
    					} else if(label_type == "#VIDEO_BBOX") {
    						obj = { "path" : sp[0], "label" : sp[1], "meta_id" : sp[2], "label_type" : label_type};
    						id = obj.path + "," + obj.label + "," + obj.meta_id + "," + obj.label_type;
    						
    					}
        				that.data.imgScrollObj.linked_list.push(obj, id);
    				} else {
    					let init_obj = "";
    					let sp = id.split(",");
    					let init_id = "";
    	
/*         				let start_label_type = id.indexOf("#");
        				let end_label_type = id.length;
        				let label_type = id.substring(start_label_type, end_label_type); */
        				
        				if(data[i].label_type == "#IMAGE_BBOX") {
        					init_obj = { "path" : sp[0],"x" : sp[1], "y" : sp[2], "w" : sp[3], "h" : sp[4], "label" : sp[5], "label_type" : data[i].label_type};
        					init_id = init_obj.path + "," + init_obj.x + "," + init_obj.y + "," + init_obj.w + "," + init_obj.h + "," + init_obj.label + "," + init_obj.label_type;
    					} else if(data[i].label_type == "#IMAGE_SEGMENTATION") {
    						// j.seo 추가
    	    				let startIndex = data[i]['segmentation'].indexOf("[");
    	    				let endIndex = data[i]['segmentation'].indexOf("]") + 1; 
    	    				let split_seg = data[i]['segmentation'].substring(startIndex, endIndex);
    	    				let seg = split_seg;
    	    				init_obj = { "path" : sp[0],"x" : sp[1], "y" : sp[2], "w" : sp[3], "h" : sp[4], "label" : sp[5], "segmentation" : seg, "label_type" : data[i].label_type};
    	    				init_id = init_obj.path + "," + init_obj.x + "," + init_obj.y + "," + init_obj.w + "," + init_obj.h + "," + init_obj.label + "," + init_obj.segmentation + "," + init_obj.label_type;
    						
    					} else if(data[i].label_type == "#VIDEO_BBOX") {
    						/* let video_bbox_comma = data[i].path + "," + data[i].label + "," + data[i].meta_id + ",#" + data[i].label_type;
    						cur_id = sp[0] + "," + sp[1] + "," + sp[2] + "," + label_type;
    						label_name = sp[1]; */
    						init_obj = { "path" : sp[0], "label" : sp[1], "meta_id" : sp[2], "label_type" : data[i].label_type};
    						init_id = init_obj.path + "," + init_obj.label + "," + init_obj.meta_id + "," + init_obj.label_type;
    					}
    					/* linked_list.push(data[i], id); */
    					that.data.imgScrollObj.linked_list.push(init_obj, init_id);
    				}
    				append_size += 1;
				} else {
					isDup = true;
				}
    		}
    		
    		that.pt.find(".main_wrap .list_total").text("총개수 " + that.data.imgScrollObj.linked_list.length);
    		that.showOrHide();
    		
    		if(isDup){
    			alert("중복 데이터가 존재합니다.\n중복데이터를 제외한 데이터를 추가합니다.");
    			isDup = false;
    		}
    		
    		if(isInit){
    			that.initImageList();	
    		} else {
    			that.appendImage(append_size);
    		}
		},
		
		showOrHide : function(){
			let that = this;	
			var linked_list = that.data.imgScrollObj.linked_list;
			
			if(linked_list.length == 0){
    			that.pt.find(".del_btn").hide();
    			that.pt.find(".save_btn").hide();
  				that.addEmptyData(that.pt.find(".list_wrap"),"생성된 라벨이 없습니다.", "라벨을 추가해주세요.");
  			} else {
  				that.pt.find(".del_btn").show();
  				that.pt.find(".save_btn").show();
  			}
		},
		
		appendImage : function(append_size){
			var that = this;
			var isImageScroll_end = that.data.imgScrollObj.isImageScroll_end;
    		var image_default_size = that.data.imgScrollObj.image_default_size;
    		var image_half_size = that.data.imgScrollObj.image_half_size;
    		var image_remain_size = that.data.imgScrollObj.image_remain_size;
    		var last_node = that.data.imgScrollObj.last_node;
    		var start_node = that.data.imgScrollObj.start_node;			
			
			if(!isImageScroll_end){return;}
			let box_size = that.pt.find("tbody tr").length;
			// 맨 처음 부분 스크롤이 있을때와 
			if(box_size < image_default_size){
				// 스크롤이 존재하지않을때 
				if((image_default_size - box_size) > append_size){
					that.loopImageList(append_size, last_node.next, "down", true);
					that.annotationListener();
				} else {
					// 스크롤이벤트가 없다가 생기는곳
					let size = image_default_size - box_size;
					that.loopImageList(size, last_node.next, "down", true);
					that.annotationListener();
					that.data.imgScrollObj.isImageScroll_end = false;
					that.setImageScrollListener();
					
				}
			} else {
				let size = image_half_size - (box_size - image_default_size);
				if(size >= append_size){
					// append 하는 사이즈가 default box size 로 만들기위해.. size 보다 작다면 그냥 제일 아래에 붙이면됌
					//console.log("last_node:",last_node);
					let temp_size = image_remain_size + append_size;

					that.loopImageList(append_size, last_node.next, "down", false);
					that.annotationListener();
					that.data.imgScrollObj.image_remain_size = temp_size;

				} else {
					// append 하는 사이즈가 default box size 로 만들기위해.. size 보다 크다면 default box size 로 만들고 그 default_box size 만큼 붙이고 아래 스크롤이 더생김
					that.loopImageList(size, last_node.next, "down", true);
					
					that.pt.find("tbody tr").slice(0,image_half_size).remove();
					that.annotationListener();
					that.data.imgScrollObj.isImageScroll_end = false;
				}
				that.setImageScrollListener();
			}
		},
		
		initImageList : function(){
			var that = this;
			var linked_list = that.data.imgScrollObj.linked_list;
			var node = linked_list.head;
			var image_default_size = that.data.imgScrollObj.image_default_size;
			
			that.data.imgScrollObj.start_node = node;
			that.loopImageList(image_default_size, node, "down",true);
			that.annotationListener();
			
			if(linked_list.length > image_default_size){
				that.data.imgScrollObj.isImageScroll_top = true;
				that.setImageScrollListener();
			} else {
				that.data.imgScrollObj.isImageScroll_end = true;
			}
		},
			
		addImageList : function(node, type){
			let that = this;
			var image_half_size = that.data.imgScrollObj.image_half_size;
			
			that.loopImageList(image_half_size, node, type, false);
			that.data.imgScrollObj.isImageScroll = false;
			that.annotationListener();
		},
		
		loopDeletedRow : function(type,node){
			
			let that = this;
			
			let target = that.pt.find("table tbody");
			let html = "";
			html = that.setHtml(node);
	
			if(type == "down"){
				target.append(html);
			} else {
				target.prepend(html);
			}
			
			that.setStartAndLastNode();	
		},
		
		setHtml : function(node){
			var that = this;
			var html = ""
			var path = node.value.path;
			var x = node.value.x;
			var y = node.value.y;
			var w = node.value.w;
			var h = node.value.h;
			var label = node.value.label;
			var label_type = node.value.label_type;
			var cur_id = "";
			var segmentation = "";
			var image_box_obj = that.data.imgScrollObj.image_box_obj;
			if(label_type == "#IMAGE_BBOX") {
				cur_id = path + "," + x + "," + y + "," + w + "," + h + "," + label + "," + label_type;
			} else if(label_type == "#IMAGE_SEGMENTATION") {
				let seg = node.value.segmentation;
				cur_id = path + "," + x + "," + y + "," + w + "," + h + "," + label + "," + seg + "," +label_type;
			} else if(label_type == "#VIDEO_BBOX") {
				//let video_bbox_comma = data[i].path + "," + data[i].label + "," + data[i].meta_id + ",#" + data[i].label_type;
				let meta_id = node.value.meta_id;
				cur_id = path + "," + label + "," + meta_id + "," + label_type;
				x = "-";
				y = "-";
				w = "-";
				h = "-";
			}
			/* cur_id = path + "," + x + "," + y + "," + w + "," + h + "," + label; */
/*  			if(node.value.segmentation == "") {
				cur_id = path + "," + x + "," + y + "," + w + "," + h + "," + label;
				//console.log("seg null :" + cur_id);
			} else {
				segmentation = node.value.segmentation;
				cur_id = path + "," + x + "," + y + "," + w + "," + h + "," + label + "," + segmentation;
			}  */
			
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
				that.pt.find("th.pre").html("미리보기");
			} else if(label_type == "#VIDEO_BBOX"){
				html += " <tr data-id='"+cur_id+"'> ";
				if(image_box_obj[cur_id] != undefined){
					html += "   <td><div class='checkBox selected'></div></td>";
				} else {
					html += "   <td><div class='checkBox'></div></td>";
				}
				html += "   <td class='preview'>";
// 				html += "   	<div class='img_preview'>";
// 				html += "       	<div class='show_img'></div>";
// 				html += "       	<div class='normal_img_wrap'>";
// 				html += "   			<div class='title_wrap flex'>";
// 				html += "   				<div class='image'></div>";
// 				html += "   				<span class='title'></span>";
// 				html += "   			</div>";
// 				html += "   			<div class='frame_container'>";
// 				html += "   			</div>";
// 				html += "   		</div>";
// 				html += "   	</div>";
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


			
			
			//console.log("linkedList.length::: ", linked_list.length);
			that.selectboxListener();
			
			return html;
		},
		
		loopImageList : function(size,node,type,isInit){			
			let that = this;
			let target = that.pt.find("table tbody");	
			let i = 0;
			while(node){
				if(i>=size){break;}
				i++;
				let html = "";
				html = that.setHtml(node);
				
				
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
			var that = this;
			var linked_list = that.data.imgScrollObj.linked_list;
			var image_default_size = that.data.imgScrollObj.image_default_size;
			var image_half_size = that.data.imgScrollObj.image_half_size;
			var image_remain_size = that.data.imgScrollObj.image_remain_size;
    		var last_node = that.data.imgScrollObj.last_node;
    		var start_node = that.data.imgScrollObj.start_node;
    		
			var tr_size = that.pt.find("tbody tr").length;
			if(type == "down"){
				//붙은 데이터가 half_size 보다 크거나 같고 마지막노드 다음이 널이 아닌경우
				if(i>=image_half_size && last_node.next != null){
// 					console.log(i, tr_size , "down normal");
				
					that.data.imgScrollObj.isImageScroll_top = false;
					if(tr_size != image_half_size){
						that.removeTableBox((tr_size - image_default_size), type);
					} else {
						that.removeTableBox((tr_size - image_half_size), type);
					}
					that.data.imgScrollObj.image_remain_size = 0;
					that.setStartAndLastNode();	
				} else {
					//붙은 데이터가 half_size 보다 작고 마지막노드 다음이 널인 경우 걍 마지막에 붙여버리면됌 remove 안시킴
					that.data.imgScrollObj.image_remain_size = i;
					that.data.imgScrollObj.isImageScroll_end =  true;
// 					console.log(i, tr_size, "down end");
				}

			} else {
				//붙은 데이터가 half_size 보다 크거나 같고 시작노드 전이 널이 아닌경우 
				if(i>=image_half_size && start_node.prev != null){
					that.data.imgScrollObj.isImageScroll_end = false;
					that.removeTableBox((image_half_size + image_remain_size), type);
					that.setStartAndLastNode();	
					that.data.imgScrollObj.image_remain_size = 0;
// 					console.log(i, tr_size, "up normal");
				} else {
					//붙은 데이터가 half_size 보다 작고 널인경우
					
					//tr_size 가 default size 가 아닐때 .. 
					if(tr_size != image_half_size){
						that.removeTableBox((i + image_remain_size), type);
						that.data.imgScrollObj.image_remain_size = 0;
					}
					that.data.imgScrollObj.isImageScroll_top =  true;
					
					that.data.imgScrollObj.last_node = linked_list.obj[that.pt.find("tbody tr").last().data("id")];
// 					console.log(i, tr_size, "up end");
				}
			}
		},
    	
    	setImageScrollListener : function(){
    		let that = this;

    		that.pt.find(".table_body").off("scroll").on("scroll",function(){
    			
				let target = $(this);
				let st = target.scrollTop();				
				let box_size = that.pt.find("tbody tr").length;
				
				var isImageScroll = that.data.imgScrollObj.isImageScroll;
				var isImageScroll_top = that.data.imgScrollObj.isImageScroll_top;
				var isImageScroll_end = that.data.imgScrollObj.isImageScroll_end;
				var last_node = that.data.imgScrollObj.last_node;
				var start_node = that.data.imgScrollObj.start_node;
				
				if (st + target.innerHeight() >= target[0].scrollHeight && !isImageScroll && !isImageScroll_end && last_node.next != null){
					// 제일 아래,.
					that.data.imgScrollObj.isImageScroll = true;
					that.data.imgScrollObj.isImageScroll_top = false;
					that.addImageList(last_node.next,"down");			
					
				} else if (st == 0 && !isImageScroll && !isImageScroll_top && start_node.prev != null){
					//위에
					that.data.imgScrollObj.isImageScroll = true;
					that.data.imgScrollObj.isImageScroll_end = false;
					that.addImageList(start_node.prev,"up");
				}
			});
    	},
    	
    	removeTableBox : function(size,type){
			let that = this;

			if(type == "down"){
				that.pt.find("tbody tr").slice(0,size).remove();					
			} else {		
				that.pt.find("tbody tr").slice(-size).remove();
			}
			that.pt.find(".table_body").scrollTop((that.pt.find(".table_body")[0].scrollHeight - that.pt.find(".table_body").height()) / 2);

		},

		annotationListener : function() {
			let that = this;
			
			let select_all = that.pt.find("table thead th .checkBox");

			// 이미지 리스트 row 에 체크박스 
			let box_click = that.pt.find("table tbody tr .checkBox");
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
				let text = $(this)[0].innerText;
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
					let node = linked_list.head;
					while(node){
						let path = node.value.path;
						let x = node.value.x;
						let y = node.value.y;
						let w = node.value.w;
						let h = node.value.h;
						let label = node.value.label;
						let cur_id = path + "," + x + "," + y + "," + w + "," + h + "," + label;
						that.data.imgScrollObj.image_box_obj[cur_id] = cur_id;
						node = node.next;
					}
				} else {
					that.pt.find("tbody tr .checkBox").removeClass("selected");
					that.data.imgScrollObj.image_box_obj = [];
				}
			});

			that.pt.find(".anno_table tbody tr .img_preview").off("mouseenter").on("mouseenter",function(){

				let show_img = $(this).children(".show_img");
				
				let x = $(this).offset().left + $(this).outerWidth() + 10;
		        let y = $(this).offset().top + $(this).outerHeight() - 59;
		        
				show_img.css({"top":y+"px", "left":x+"px","position": "fixed","display": "flex"});
				let tr = $(this).parent().parent().children();
				showLoading(".show_img");
				
				let imgObj = new Image();
				
				imgObj.src = "/uploadFile/xlabeller/" + tr[2].innerHTML; 
	 			
				// jh.sa 주석해제
 				imgObj.onload = function(){
					that.data.canvas_hover = document.createElement('canvas');
					show_img.html(that.data.canvas_hover);
					that.crop(imgObj, tr[3].innerHTML, tr[4].innerHTML, tr[5].innerHTML, tr[6].innerHTML);	
				} 
				
				imgObj.onerror = function(){
					hideLoading(".show_img");
				}			
			});
			
			that.pt.find(".anno_table tbody tr .img_preview").off("mouseleave").on("mouseleave",function(){
				let show_img = $(this).children(".show_img");
				let normal_img = $(this).children(".normal_img_wrap");
				show_img.css("display","none");
				$(this).removeClass("selected");
			});
			

			that.pt.find(".anno_table tbody tr .img_preview").off("click").on("click",function(){
				let normal_img = $(this).children(".normal_img_wrap");
				if(normal_img.parent().hasClass("selected")){
					normal_img.parent().toggleClass("selected");	
				} else {
					that.pt.find("tbody tr .img_preview").removeClass("selected");
					normal_img.parent().toggleClass("selected");
				}
				
				
				let x = $(this).offset().left + $(this).outerWidth() + 10;
		        let y = $(this).offset().top + $(this).outerHeight() - 141;
	        
		        normal_img.css({"top":y+"px", "left":x+"px","position": "fixed"});
				let tr = $(this).parent().parent().children();
				let cur_index = $(this).parent().parent().index();
				tr.find(".title_wrap .title").empty();
				tr.find(".title_wrap .title").text(tr[7].innerHTML);
				
				
				let cur_id = ""+tr[2].innerHTML + tr[3].innerHTML +tr[4].innerHTML + tr[5].innerHTML + tr[6].innerHTML + tr[7].innerHTML
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
// 				          width: canvas.width,
// 				          height: canvas.height
						 scaleX : that.data.scaleFactor,
						 scaleY : that.data.scaleFactor
				    });
					
					that.clearCanvas();
					
					that.setSingleMeta(cur_id,tr[7].innerHTML, tr[3].innerHTML, tr[4].innerHTML, tr[5].innerHTML, tr[6].innerHTML);
					that.updateRedraw();
					hideLoading(tr.children().children(".normal_img_wrap"));
				};
				
				imgObj.onerror = function(){
					hideLoading(tr.children().children(".normal_img_wrap"));
				}
				
				
			});
		},
		
		defaultListener : function(){
			let that = this;	
			
			let select_all = that.pt.find("table thead tr .checkBox");
			let delete_imgs = that.pt.find(".main_wrap .del_btn");
			let change_btn = that.pt.find(".create_btn");
			let save_btn = that.pt.find(".save_btn");
			
			save_btn.off("click").on("click",function(){
				that.createJson();
			});
			
			change_btn.off("click").on("click",function(){
				that.createJson();
// 				let title = that.pt.find(".anno_title").val();
// 				let contents = that.pt.find(".anno_contents").val();
					
// 				if(title == ""){
// 					alert("제목을 입력해주세요");
// 					that.pt.find(".anno_title").focus();
// 					return;
// 				}
				
// 				if(contents == ""){
// 					alert("설명을 입력해주세요");
// 					that.pt.find(".anno_contents").focus();
// 					return;
// 				}
				
// 				$("#loader").show();
// 				that.updateAnnotation(title, contents, null);
				
			});
			
			
			that.pt.find(".search_btn").off("click").on("click", function() {
				that.checkSearchData();
			});	

			that.pt.find(".image_search input").off("keypress").on("keypress",function(key){
				if(key.which == 13){
					that.checkSearchData();
				}
			});
			
			delete_imgs.off("click").on("click",function(){
				var linked_list = that.data.imgScrollObj.linked_list;
				var start_node = that.data.imgScrollObj.start_node;
				var last_node = that.data.imgScrollObj.last_node;
				var removed_size = that.data.imgScrollObj.removed_size;
				var image_box_obj = that.data.imgScrollObj.image_box_obj;
				
				that.data.imgScrollObj.removed_size = 0;
				if(that.pt.find("thead tr .checkBox").hasClass("selected")){
					that.pt.find(".table_body").off("scroll");
					that.pt.find("thead .checkBox").off("click");
					that.pt.find("table tbody").html("");
					that.data.imgScrollObj.linked_list = null;
					that.data.imgScrollObj.image_box_obj = [];
					that.pt.find(".del_btn").hide();
					that.pt.find(".save_btn").hide();
		  			that.addEmptyData(that.pt.find(".list_wrap"), "생성된 라벨이 없습니다.", "라벨을 추가해주세요.");
		  			that.pt.find(".main_wrap .list_total").text("총개수 0");
		  			that.selectboxListener();
				} else if(Object.keys(image_box_obj).length > 0){
					let keys = Object.keys(image_box_obj);
		  			for(let i=0; i<keys.length; i++){
		  				tr_contain = $("tr[data-id='" + keys[i] + "']");
		  				if(tr_contain.length){
		  					tr_contain.remove();
		  					that.data.imgScrollObj.removed_size += 1;
		  				}

		  				that.data.imgScrollObj.linked_list.removeNode(that.data.imgScrollObj.linked_list.obj[keys[i]]);
				 		delete that.data.imgScrollObj.linked_list.obj[keys[i]];
		  			}
		  			
		  			if(linked_list.length == 0){
		  				that.pt.find(".del_btn").hide();
		  				that.pt.find(".save_btn").hide();
		  				that.addEmptyData(that.pt.find(".list_wrap"), "생성된 라벨이 없습니다.", "라벨을 추가해주세요.");
		  			}
		  			
		  			that.data.imgScrollObj.image_box_obj = [];
  					let i = 0;
  					
  					that.setStartAndLastNode();
  					
  					while(true){
  						if(start_node.prev == undefined){
  							that.data.imgScrollObj.isImageScroll_top = true;
  							that.data.imgScrollObj.image_remain_size = 0;
  						} else if(last_node.next == undefined){
  							that.data.imgScrollObj.isImageScroll_end = true;
  						}
  						if(i >= removed_size){break;}
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
 
  				/* console.log(isImageScroll_top, linked_list.length, that.pt.find("tbody tr").length, image_remain_size); */	
  				
  				if(linked_list == null){
  					that.pt.find(".main_wrap .list_total").text("총개수 0");
  				} else {
  					that.pt.find(".main_wrap .list_total").text("총개수 " + linked_list.length);
  				}
  				
  				that.annotationListener();
  				that.selectboxListener();
				} else {
					alert("선택된 데이터가 없습니다");
				}
				
				select_all.removeClass("selected");
				
			});
			
			
			that.pt.find(".detail_btn").off("click").on("click",function(){
				$(this).toggleClass("selected");
				
				if($(this).hasClass("selected")){
					that.pt.find(".filter_wrap div").removeClass("selected");
					showLoading("#annotation_detail .info_wrap .select_wrap");
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
		},
		
		resetScroll : function(){
			var that = this;
			that.data.search_obj =[];
			that.data.box_obj = [];
// 			that.data.tag_obj = {};
			
			let scroll_info = that.data.scrollObj;	
			that.data.scrollObj.isScroll_top = false;
			that.data.scrollObj.isScroll_end = false;
			that.data.scrollObj.isScroll = false;
		},

		
		checkSearchData : function(){
			var that = this;
			var text = that.pt.find(".image_search input").val();
			var target = that.pt.find(".second_wrap");
			$(target).html("");
			that.pt.find(".detail_btn").removeClass("selected");
			that.pt.find(".detail_tooltip").attr("style","visibility: hidden");
			that.pt.find(".image_search input").val('');
			that.pt.find(".search_wrap .select_box").removeClass("selected");
			that.data.search_arr = [];
			that.data.box_obj = [];
			that.resetScroll();
			that.setSearchAjaxData(text);	
// 			that.getSearchVisionList(text);	
			
		},
		
		setSearchAjaxData : function(text){
			let that = this;
			let string_arr = "";
			let ajaxData = {};
			let url = "";
			var filter_arr = that.data.filter_arr;
			var init_label_type = that.data.init_label_type;
			var dataset_list = that.data.dataset_list;
			if(text != ""){
				ajaxData["label"] = text;
				if(filter_arr.length > 0){
					for(let i = 0, len = filter_arr.length; i<len; i++){
						if(i == 0){
							string_arr += filter_arr[i]
						} else {
							string_arr += ","+filter_arr[i]
						}
					}
					ajaxData["dataset_id"] = string_arr;
					
	 				if(init_label_type == "VIDEO_BBOX") {
	 					url = "getSearchVideoAnnotationVisionList";	
	 				}
	 				else {
	 					url = "getSearchAnnotationVisionList";
	 				}
	 				console.log("url1 : " + url);
					that.getSearchVisionList(ajaxData, url);	
				} 
				//let label_type = that.pt.find('.ms .ms_wrap .image_search select[name="label_type"] option:selected').html();

				/* that.getSearchVisionList(ajaxData);	 */
 				if(init_label_type == "VIDEO_BBOX") {
 					url = "getSearchVideoAnnotationVisionList";	
 				}
 				else {
 					url = "getSearchAnnotationVisionList";
 				}
 				console.log("url2 : " + url);
				that.getSearchVisionList(ajaxData, url);	
			} else {										// jh.sa 아무것도 입력하지 않고 검색 버튼 눌렀을 때 데이터가 제대로 조회되지 않던 문제 수정
				ajaxData["label"] = text;
				if(filter_arr.length > 0){
					for(let i = 0, len = filter_arr.length; i<len; i++){
						if(i == 0){
							string_arr += filter_arr[i]
						} else {
							string_arr += ","+filter_arr[i]
						}
					}
					ajaxData["dataset_id"] = string_arr;					
				} else {
					for(let i = 0, len = dataset_list.length; i<len; i++){
						if(i == 0){
							string_arr += dataset_list[i]
						} else {
							string_arr += ","+dataset_list[i]
						}
					}
					ajaxData["dataset_id"] = string_arr;					
				}
			
 				if(init_label_type == "VIDEO_BBOX") {
 					url = "getSearchVideoAnnotationVisionList";	
 				}
 				else {
 					url = "getSearchAnnotationVisionList";
 				}
 				console.log("url3 : " + url);
				that.getSearchVisionList(ajaxData, url);	
				/* that.getSearchVisionList(ajaxData);	 */
			}

		},
		
		// jh.sa 텍스트 조건 없이 검색 버튼 누를 경우 데이터가 제대로 나오지 않던 문제 수정 
		collectDatasetId : function(data){
			let that = this;
			
			that.data.dataset_list = [];
			for(let i = 0; i < data.length; i++){
				that.data.dataset_list.push(data[i].dataset_id);
			};
			//console.log("=====dataset_list=====", dataset_list, label_type);
		},		
		
		getDatasetList : function(){
			var that = this;
			var label_type = that.data.init_label_type;
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
						that.collectDatasetId(res.result.data);
						that.drawDatasetList(res.result.data);
						that.data.tag_text = "";
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
			let that = this;
			let target = that.pt.find(".select_wrap");
			target.html("");
			let html = "";
			let size = data.length;
			
			
			for(let i = 0; i<size;i++){
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
			var that = this;
			var filter_arr = that.data.filter_arr;
			var filter_size = filter_arr.length;
			
			that.pt.find(".dataset_wrap").each(function(){
				let child = $(this).children(".checkBox");
				for(let i =0; i< filter_size; i++){
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
				let text = $(this)[0].innerText;
				$(this).empty();
				$(this).append(text);
				that.addHoverBox($(this), text);
			});
			
			that.pt.find(".dataset_wrap .title").off("mouseleave").on("mouseleave",function(){
				that.removeHoverBox($(this));
			});
			
			that.pt.find(".dataset_wrap").off("click").on("click",function(){
				let check_box = $(this).children(".checkBox");
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
				let check_all = $(this);
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

		getSearchVisionList : function(ajaxData, url) {
			let that = this;

// 			let size = filter_arr.length;
// 			let string_arr;
// 			let ajaxData;
			
// 			if(size <= 0){
// 				ajaxData = {
// 					label : text
// 				};
// 			} else {
// 				for(let i =0; i<size; i++){
// 					if(i == 0){
// 						string_arr = ""+filter_arr[i]
// 					} else {
// 						string_arr += ","+filter_arr[i]
// 					}
// 				}
// 				ajaxData = {
// 					label : text,
// 					dataset_id : string_arr
// 				};
// 			}	


			showLoading("#annotation_detail .second_wrap");


			$.ajax({
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
						if(res.result.data.length == 0){
							alert("사용 가능한 데이터가 없습니다");
							that.addEmptyData(that.pt.find(".second_wrap"), "검색결과가 없습니다.", "찾고자 하는 라벨을 검색해주세요.");
						} else {
							that.modifySearchData(res.result.data);	
						}
									
					} else {
						alert(res.result.data);
					}
					hideLoading("#annotation_detail .search_result_wrap");
					hideLoading("#annotation_detail .second_wrap");
				},
				error : function(err) {
					hideLoading("#annotation_detail .search_result_wrap");
					hideLoading("#annotation_detail .second_wrap");
					console.log("ERROR!!", err);
				}
			});
		},
		
		modifySearchData : function(data){
			let that = this;
			
			that.data.search_arr = [];
			that.data.dup_obj = [];
			
			for(let i =0, len = data.length; i<len;i++){
				var dup_obj = that.data.dup_obj;
				var search_obj = that.data.search_obj;
				
				if(data[i].label_type == "IMAGE_BBOX") {
					let inf = data[i].info.replace(/\,/g,"");
/* 					let comma = data[i].path + "," +data[i].info + "," + data[i].label;
					let cur_id = data[i].path +inf + data[i].label; */
					
					let comma = data[i].path + "," +data[i].info + "," + data[i].label + ",#" + data[i].label_type;
					
					let cur_id = data[i].path +inf + data[i].label;
				
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
/* 					let info = JSON.parse(data[i].info);

					let info_box = info.box;
					let info_segmentation = info.segmentation;
					let segmentation_comma = data[i].path + "," + info_box + "," + data[i].label + "," + info_segmentation;
					
					let seg_cur_id = data[i].path + info_box + data[i].label + "," + info_segmentation;
					
					 */
					 
					var tmp = JSON.parse(data[i].info);
						
					let info = tmp[0];
					/* let info = JSON.parse(data[i].info); */

					
					let info_box = info.box;
					let info_segmentation = info.segmentation;
 					let segmentation = "";
 					segmentation += "[";
					for(let k = 0; k < info_segmentation.length; k++) {
						if(k == 0) {
							segmentation += '{"x":' + info_segmentation[k]['x']+',"y": '+info_segmentation[k]['y']+'}';
						} else {
							segmentation += ',{"x":' + info_segmentation[k]['x']+',"y": '+info_segmentation[k]['y']+'}';
						}
					} 
					segmentation += "]"
/* 					let info_box = info.box;
					let info_segmentation = info.segmentation; */
					let segmentation_comma = data[i].path + "," + info_box + "," + data[i].label + "," + segmentation + ",#" + data[i].label_type;
					
					let seg_cur_id = data[i].path + info_box + data[i].label + info_segmentation;
					
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
 					let video_bbox_comma = data[i].path + "," + data[i].label + "," + data[i].meta_id + ",#" + data[i].label_type;
 					
 					let video_bbox_cur_id = data[i].path + data[i].label + data[i].meta_id + data[i].label_type;
 					
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
			
/* 			console.log("search_obj::",search_obj);sf
			console.log("seg_cur_id::",seg_cur_id); */
			that.data.fixed_arr = that.data.search_arr;
			
			that.pt.find(".search_wrap .list_total").text("총 개수 " + that.data.search_arr.length);
			that.initSearchList();
		},
		
		initSearchList : function(){
			var that = this;	
			var search_arr = that.data.search_arr;
			var scroll_info = that.data.scrollObj;
			
			that.data.fixed_arr = search_arr;
			
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
			
			let that = this;
			let target = null;
			
			html = "";
			if(type == "init"){
				target = that.pt.find(".second_wrap");
				$(target).html("");
				
				html +=	"<div class='tag_txt_wrap'><div class='ms'><span>태그(색인목록)</span></div></div>";
				html += "<div class ='tagtp'><div class='tag_wrap'><div class='tag_margin'></div></div></div>"
				html += "<div class='search_result_wrap'>";
				html += "<div class='all_margin'><div class='select_all_wrap flex'>";
				html += "<div class='checkBox'></div>"; 
				html += "<span>전체 선택</span>";
				html += "<button class='add_btn'>라벨 추가</button>";
				html += "</div></div>";
				html += "<div class='media_wrap'>";
				html += "<div class='search_result'>";	
			} else {
				target = that.pt.find(".search_result");
			}
			
			let scroll_info = that.data.scrollObj;
			//console.log(start,end);

			let i = 0;	
			for (i = start ; i < end ; i++) {
				var search_arr = that.data.search_arr;
				var data = search_arr[i];
				var box_obj = that.data.box_obj;
				let sp = data.split(",");
				// label_type 구별
				let start_label_type = data.indexOf("#");
				let end_label_type = data.length;
				let label_type = data.substring(start_label_type, end_label_type);
				let label_name = "";
				let cur_id = "";
				// IMAGE_BBOX
				if(label_type == "#IMAGE_BBOX") {
					cur_id = sp[0] + "," + sp[1] +"," + sp[2] +"," +sp[3] +"," + sp[4] + "," + sp[5] + "," + label_type;
					label_name = sp[5];
				} else if(label_type == "#IMAGE_SEGMENTATION") {
					let startIndex = data.indexOf("[");
					let endIndex = data.indexOf("]") + 1; 
					let split_seg = data.substring(startIndex, endIndex);
					let seg = split_seg;
					cur_id = sp[0] + "," + sp[1] +"," + sp[2] +"," +sp[3] +"," + sp[4] + "," + sp[5] + "," + seg + "," + label_type;
					label_name = sp[5];
				} else if(label_type == "#VIDEO_BBOX") {
					let video_bbox_comma = data[i].path + "," + data[i].label + "," + data[i].meta_id + ",#" + data[i].label_type;
					cur_id = sp[0] + "," + sp[1] + "," + sp[2] + "," + label_type;
					label_name = sp[1];
				}
				/* let seg = "";
				let cur_id = "";
	
				if (sp.length > 6) {
					let startIndex = data.indexOf("[");
					let endIndex = data.indexOf("]") + 1;
					seg = data.substr(startIndex, endIndex);
					cur_id = sp[0] + "," + sp[1] +"," + sp[2] +"," +sp[3] +"," + sp[4] + "," + sp[5] + "," + seg;
				} else {
					cur_id = sp[0] + "," + sp[1] +"," + sp[2] +"," +sp[3] +"," + sp[4] + "," + sp[5];
				} */
			
				/* console.log("[ index : ", data.indexOf("["));
				console.log("길이 : ", data.indexOf("]"));
				let cur_id = sp[0] + "," + sp[1] +"," + sp[2] +"," +sp[3] +"," + sp[4] + "," + sp[5]; */
				
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
				html += " </div>";
				
				
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
			let that = this;	
			
			this.pt.find(".media_wrap").off("scroll").on("scroll",function(){
				var scroll_info = that.data.scrollObj;
				var search_arr = that.data.search_arr;
				var target = $(this);
				
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
		
		removeBox : function(size,type){
			let that = this;
			
			if(size == 0){ return; }

			if(type == "down"){
				that.pt.find(".box_contain").slice(0,size).remove();					
			} else {		
				that.pt.find(".box_contain").slice(-size).remove();
			}
			that.pt.find(".media_wrap").scrollTop((that.pt.find(".media_wrap")[0].scrollHeight - that.pt.find(".media_wrap").height()) / 2);
		},

		drawImageBox : function(){
			let that = this;
			that.pt.find(".box_contain .box").each(function(){
				let box = $(this);
				let cur_id = $(this).parent().data("id");
				let sp = cur_id.split(",");

				let imgObj = new Image();
				imgObj.src = "/uploadFile/xlabeller/" + sp[0]; 
// 				imgObj.src = "/xlabeller/images/sabana3.jpg";
				
				imgObj.onload = function(){
					that.data.canvas_hover = document.createElement('canvas');
					box.find(".img").html(that.data.canvas_hover);
					that.crop(imgObj, sp[1], sp[2], sp[3], sp[4]);
				}
			});

		},
		
		searchListListener : function() {
			let that = this;	
			
			var selectBox = ".search_result_wrap .box .select_box", allSelectBox = ".select_all_wrap .checkBox";
			
			// 전체선택 눌렀을경우 .. 각각 search_arr 의 모든 데이터를 옮길수있게 arr 에 저장..
			// 개별선택 한경우 ..  선택 한 데이터만 obj 에 담아놨다가 append 할때 있으면 selected 한 상태로 append 없으면 무시
			// 개별선택 + 리스트에 추가한경우 개별선택 obj 에 있는 부분을모두 list 형태로  변환
			
			
			that.pt.find(".search_result_wrap .box").off("click").on("click",function(){
				var box = $(this);
				var checkBox = $(this).children(".select_box");
				var box_obj = that.data.box_obj;
				var search_arr = that.data.search_arr;
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
				var select_all = $(this);
				var search_arr = that.data.search_arr;
				var box_obj = that.data.box_obj;
				
				select_all.toggleClass("selected");
				if(select_all.hasClass("selected")){
					that.pt.find(".search_result_wrap .box .select_box").addClass("selected");
					for(let i = 0, len = search_arr.length; i<len; i++){
						/* console.log("select_all_wrap : ", search_arr[i]); */
						let cur_id = search_arr[i]
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
					//console.log("bb");
					that.modifyImageListData(search_arr, "append");
// 					that.selectboxListener();				// jh.sa 
				} else if(Object.keys(box_obj).length > 0){
					//console.log("box_obj : ", box_obj);
					let keys = Object.keys(box_obj);
					let selected_arr = [];
		  			for(let i=0; i<keys.length; i++){
		  				selected_arr.push(keys[i]);
		  			}
		  			//console.log("cc");
		  			that.modifyImageListData(selected_arr, "append");
// 		  			that.selectboxListener();			// jh.sa 
				} else {
					alert("선택된 데이터가 없습니다");
				}
				that.pt.find(".select_all_wrap .checkBox").removeClass("selected");
				that.pt.find(".search_result_wrap .box .select_box").removeClass("selected");
			});
			
			// jh.sa 추가
			that.pt.find(".search_result_wrap .label_wrap").off("mouseenter").on("mouseenter", function(){
				let label_title = $(this).children("span");
				let text = label_title[0].innerText;
				cur_text = text;
				label_title.empty();
				label_title.append(text);
				that.addHoverBox($(this), text);
			});
			
			that.pt.find(".search_result_wrap .label_wrap").off("mouseleave").on("mouseleave",function(){
				that.removeHoverBox($(this));
			});				
		},
		
		getLabelGroup : function(ajaxData){
			let that = this;
			$("#loader").show();
			$.ajax({
				url : baseUrl + "data/getLabelGroup.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("=====getLabelGroup=====", res);
					$("#loader").hide();
					if(res.result.code == "3301"){
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} 
					if (res.result.code == "200") {
						that.drawLabelGroup(res.result.data);
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
		
		drawLabelGroup : function(){
			var that = this;
			var html ="";
			var dup_obj = that.data.dup_obj;
			var tagKeys = Object.keys(dup_obj);
			
			var target = that.pt.find(".second_wrap .tag_wrap .tag_margin");
			$(target).html("");

			for(let i = 0, len = tagKeys.length; i<len;i++){
				html += "<div class='tag_box_wrap'>";
				html += "<button># "+tagKeys[i]+"</button>"
				html += "</div>";
			}
			
			target.append(html.trim());
			that.labelGroupListener();
		},
		
		
		appendTagList : function(text){
			let that = this;
// 			var tag_text = that.data.tag_text;
			var dup_obj = that.data.dup_obj;
			
			if(that.data.tag_text == ""){
				that.data.tag_text = ""+text;
			} else {
				that.data.tag_text = that.data.tag_text + "," + text;
			}
			
			if(dup_obj[text] != undefined){
				let values = dup_obj[text];
				for(let y = 0; y<values.length;y++){
					that.data.tag_arr.push(values[y]);	
				}
			}
			that.setList(that.data.tag_arr);
		},
		
		setList : function(arr){
			let that = this;
			var scroll_info = that.data.scrollObj;				// jh.sa 추가
			that.data.search_arr = arr;
// 			let scroll_info = data.scroll;				// jh.sa 수정		전체 태그 리스트에서 각 태그를 눌러도 결과가 나오지 않던 문제 수정
			
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
			
			that.pt.find(".search_wrap .list_total").text("총 개수 " + that.data.search_arr.length);
		},
		
		removeTagList : function(text){
			let that = this;
			var fixed_arr = that.data.fixed_arr;
// 			var tag_text = that.data.tag_text;
			var dup_obj = that.data.dup_obj;
			
			that.data.tag_arr = [];
			if(that.data.tag_text.indexOf(",") > -1){
				sp = that.data.tag_text.split(",");
				for(let i = 0; i<sp.length; i++){
					if(sp[i] == text){
						sp.splice(i,1);
						break;
					}
				}

				if(sp.length == 1){
					
					that.data.tag_text = sp[0];
					
					if(dup_obj[sp[0]] != undefined){
						let values = dup_obj[sp[0]];
						for(let y = 0; y<values.length;y++){
							that.data.tag_arr.push(values[y]);	
						}
					}
					
					that.setList(that.data.tag_arr);
					
				} else {
					for(let i=0;i<sp.length;i++){
						if(i == 0){
							that.data.tag_text = sp[i];
						} else {
							that.data.tag_text = that.data.tag_text + "," + sp[i];
						}
						
						if(dup_obj[sp[i]] != undefined){
							let values = dup_obj[sp[i]];
							for(let y = 0; y<values.length;y++){
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
			let that = this;
			let cur_text = "";
			
			let height = that.pt.find(".second_wrap .tag_wrap").outerHeight();
			let value = 395 + height;
			that.pt.find(".media_wrap").css({ 'height': 'calc(100% - ' + value+ 'px)' });
			
			that.data.tag_arr = [];
			that.pt.find(".second_wrap .tag_box_wrap button").off("click").on("click",function(){
				let btn = $(this);
				btn.toggleClass("selected");	
				that.pt.find(".select_all_wrap .checkBox").removeClass("selected");
				let res = cur_text.slice(2);
				if(btn.hasClass("selected")){	
					that.appendTagList(res);
				} else {
					that.removeTagList(res);
				}
			});
			
			that.pt.find(".second_wrap .tag_box_wrap").off("mouseenter").on("mouseenter",function(){
				let btn = $(this).children("button");
				let text  = btn[0].innerText;
				cur_text = text;
				btn.empty();
				btn.append(text);
				that.addHoverBox(btn , btn[0].innerText.slice(2));
			});
			
			that.pt.find(".second_wrap .tag_box_wrap").off("mouseleave").on("mouseleave",function(){
				let btn = $(this).children("button");
				that.removeHoverBox(btn);
			});
		},
		
		addHoverBox : function(elem,text){
			let that = this;
			
// 			console.log(elem[0].scrollWidth, elem.innerWidth(),elem[0].clientWidth);
			
			if (elem[0].scrollWidth >  elem[0].clientWidth) {
				let btn_width = elem.outerWidth();
				let btn_height = elem.outerHeight();
				let top = elem.offset().top;
				let left = elem.offset().left;
				let right = ($(window).width() - (elem.offset().left + elem.outerWidth())); 
				let bottom = ($(window).height() - (elem.offset().top + elem.outerHeight()));

			   	elem.append("<div class='hover_box'><div class='hover_div'><div>"+text+"</div</div></div>");
			   	let hover_box = elem.children(".hover_box");
			   	let text_div = hover_box.find(".hover_div div");
				hover_box.css({"display" : "block"});
			   	let text_width = text_div.outerWidth();
			   	let text_height = text_div.outerHeight();
			   	hover_box.css({"display" : "none"});
	   	
			   	let x;
			   	let y;
			   	
			   	if(right - text_width < 0){
			   		x = left - text_width;
			   		
			   	} else {
			   		x = left + btn_width / 2;
			   	}
			   	
			   	if(bottom - text_height < 0){
		   			y = top - text_height;
		   		} else {
		   			y = top + btn_height / 2;
		   		}

			   	hover_box.css({"top":y+"px", "left":x+"px","position": "fixed","display" : "block"});
			}
		},
		
		removeHoverBox : function(elem){
			let that = this;
			elem.find(".hover_box").remove();
		},
		
		crop : function(imgObj, xx, yy, ww, hh){
			let that = this;
			var canvas_hover = that.data.canvas_hover;
			var ctx = canvas_hover.getContext("2d");
	
			
			hideLoading(".show_img");

	    	
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
			ctx.drawImage(imgObj, xx, yy, ww, hh,0,0, dw,dh);
        },

        rescale : function(img){
        	var that = this;
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
        	var that = this;
        	var canvas = that.data.canvas;
			var rect = new fabric.Rect(labelMap);	
			canvas.add(rect);
			
        },
        
        clearCanvas : function(){
        	var that = this;	
        	var canvas = that.data.canvas;
        	$("#label-container").empty();
        	//캔버스에 존재하는 오브젝트 모두 삭제
        	var canvObjLen = canvas.getObjects().length;
        	for(var i = 0 ; i < canvObjLen; i++){
        		canvas.remove(canvas.getObjects()[0]);
        	}
        },
        
        setSingleMeta : function(id,label,x,y,w,h){
        	var that = this;
        	var colorHash = that.data.colorHash;
        	var scaleFactor = that.data.scaleFactor;
			var fillColor = colorHash.rgb(label);

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
			var that = this;
			var linked_list = that.data.imgScrollObj.linked_list;
			var title = that.pt.find(".anno_title").val();
			var contents = that.pt.find(".anno_contents").val();
			var dataArr = [];
			
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
			let keys = Object.keys(linked_list.obj);
			for(let i = 0; i<keys.length; i++){
				let value = linked_list.obj[keys[i]];
				dataArr.push(value.value);
			}
			
			if(dataArr.length == 0){
				alert("사용 가능한 데이터가 없습니다");
				$("#loader").hide();
				return;
			}
			
			
			var str = JSON.stringify(dataArr);
			
			that.updateAnnotation(title, contents, str);
			
		},

		updateAnnotation : function(t, c, str) {
			var that = this;
			var id = that.data.annotation_id;
			var cur_label_type = $("#annotation_detail select[name='label_type'] option:selected").val();
			var ajaxData;
			if(str != null){
			 	ajaxData = {
					"annotation_id": id,
					"title" : t,
					"contents" : c,
					"data" : str,
					"label_type" : cur_label_type				// jh.sa 추가 : ajaxData가 VO로 들어가긴하는데 DB 반영이 안되는듯함.
				}
			} else {
				ajaxData = {
					"annotation_id" : id,
					"title" : t,
					"contents" : c,
					"label_type" : cur_label_type
				}
			}
			alert("데이터의 크기에 따라 작업시간이 오래 소요될 수 있습니다.\n잠시만 기다려주세요.");
			$.ajax({
				url : baseUrl + "annotation/updateAnnotation.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("=====updateAnnotation.json=====", res);
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
					}  else {
						alert(res.result.data);
					}
					
				},
				error : function(err) {
					$("#loader").hide();
					console.log("ERROR!!", err);
				}
			});
		},
		
		selectboxListener : function(){
			let that = this;
			let label_select = that.pt.find("select[name='label_type']");
			let label_select_option = that.pt.find("select[name='label_type'] option");
			var linked_list = that.data.imgScrollObj.linked_list;
			
			//console.log("label_type : " + label_type);

// 			that.pt.find("select[name='label_type']").val(label_type).change();
			// jh.sa 추가
			that.pt.find("select[name='label_type']").off("change").on("change", function(){
				that.pt.find(".second_wrap").html("");
				that.pt.find(".list_total").text("총 개수 0");
				that.data.filter_arr = [];
				that.data.fixed_arr = [];
				that.data.search_Arr = [];
				that.data.init_label_type = $("#annotation_detail select[name='label_type'] option:selected").val();
				that.getDatasetList();
				that.addEmptyData(that.pt.find(".second_wrap"), "검색결과가 없습니다.","찾고자 하는 라벨을 검색해주세요.");
			});			
	/* 		let value = label_select_option.data("value");
				for(let i = 0, len=label_select.length; i < len; i++) {
					if(value == label_type) {
						label_select_option.attr("selected", "selected");
					}
				} */ 
			// jh.sa 210225 annotation 수정 시에는 좌측 데이터를 다 지워도 select(label_type) 값을 변경할 수 없게 함
			label_select.attr("disabled", "disabled");
// 			if(linked_list){
// 				label_select.attr("disabled", "disabled");
// 			} else if (!linked_list) {
// 				label_select.removeAttr("disabled");
// 			};
			
		},		

	};
</script>
