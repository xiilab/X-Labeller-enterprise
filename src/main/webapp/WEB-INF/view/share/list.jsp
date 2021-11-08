<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/header" flush="false" />
<head>
<title>ETRI 인공지능 데이터 허브 포털</title>

<style>
.bg-sub-share{
	width: 100%;
	height: 200px;
	background-image: url('../images/bg-sub-share.png');
	background-repeat: no-repeat;
}
.bg-sub-share>div { color: #ffffff; text-align: left; }
.bg-sub-share .bg_title {
	font-size: 28px;
	font-weight: 500px;
}
.bg-sub-share .bg_info {
	opacity: 0.9;
	line-height: 1.81;
}


/* tab_wrap */
#shareList .tab_wrap li { width: 552px; }

#shareList .content_wrap { width: 1010px; margin: 0 auto; }
#shareList .container {margin-top: 65px;}

#shareList .table_checkbox { width: 19px; height: 19px; background-image: url('../images/btn-checkbox-normal-6.png');  background-repeat: no-repeat; background-position: center; }
#shareList .table_checkbox.checked { background-image: url('../images/btn-checkbox-selected-2.png'); }

#shareList .btn_wrap .upload_btn { width: 135px; height: 44px; font-size: 14px;  }
#shareList .btn_wrap .download_btn { width: 135px; height: 44px; font-size: 14px; }


#shareList .search_wrap { 
	margin: 60px 0;
	padding: 28px 21px;
	border: 1px solid #d9d9d9;
	background-color: #fafafa;
}
#shareList .search_wrap .search_type {
	width: 169px;
	height: 44px;
}
#shareList .search_wrap .search_word {
	margin: 0 20px;
	padding: 0 10px;
	width: 594px;
	height: 44px;
}
#shareList .search_wrap .search_btn { padding: 0; width: 133px; height: 44px;color: #fefefe;background-color: #008bed;cursor: pointer; }
#shareList .search_wrap .search_btn:hover { background-color: #0063c0; }

#shareList .search_result_wrap { margin-bottom: 90px; }
#shareList .search_result_wrap .wrap_title { }
#shareList .search_result_wrap .wrap_title span { font-size: 13px; font-weight: 300; color: #555555; margin-left: 18px;  }
#shareList .search_result_wrap .search_result { flex-wrap: wrap;  align-items: flex-start; border-top: 2px #333 solid; margin-top: 15px;  }
#shareList .search_result_wrap .search_result .box {position: relative; padding: 13px; width: 196px;  border: solid 1px #d9d9d9; background-color: #ffffff;  margin-right: 36px; margin-top: 40px; }
#shareList .search_result_wrap .search_result .box:nth-child(4n+1) { margin-right: 0px; }
#shareList .search_result_wrap .search_result .box .img img { width: 196px; }
#shareList .search_result_wrap .search_result .box .title { font-size: 15px; font-weight: 500; overflow: hidden; text-overflow: ellipsis;  white-space: nowrap; }
#shareList .search_result_wrap .search_result .box .date { font-size: 12px; color: #555; }
#shareList .search_result_wrap .search_result .box .select_box { position: absolute; width: 20px; height: 20px; top: 20px; left: 20px; background-image: url('../images/btn-checkbox-normal.png'); background-repeat: no-repeat; }
#shareList .search_result_wrap .search_result .box .select_box.selected { background-image: url('../images/btn-checkbox-selected.png'); }
#shareList .search_result_wrap .search_result .all_select_box { width: 100%; margin-top: 25px; background-image: url('../images/btn-checkbox-normal.png'); background-repeat: no-repeat; background-size: 20px;     padding-left: 30px; cursor: pointer; }
#shareList .search_result_wrap .search_result .all_select_box.selected { background-image: url('../images/btn-checkbox-selected.png'); }
#shareList .search_result_wrap .search_result .box .view_btn { cursor:pointer; margin-top: 23px; margin-left: 15px; text-align: center; width: 160px; line-height: 30px; border-style: solid; border-width: 1px; border-image-source: linear-gradient(to top, #22d3df 1%, #2ea5e4); border-image-slice: 1;   }
#shareList .search_result_wrap .search_result .box .view_btn:hover {  color: #fff;  background-color: #008bed;  }
#shareList .search_result_wrap .list_btn { cursor:pointer; width: 130px; line-height: 44px;  margin-top: 0;   font-size: 14px;  font-weight: 300;}
#shareList .search_result_wrap .list_btn:hover {color:#fff; background-color: #008bed;}
#shareList .search_result_wrap .down_btn { cursor:pointer; width: 130px; line-height: 44px; margin-top: 0;   font-size: 14px;  font-weight: 300; margin-right: 20px;}
#shareList .search_result_wrap .down_btn:hover {color:#fff; background-color: #008bed;}

</style>
</head>
<body>

	<div class="container" id="shareList">
		<div class="bg-sub-share flex">
			<div class="w1200">
				<div class="bg_title">AI 공유 플랫폼</div>
				<div class="bg_info">
					인공지능 응용서비스에 활용 가능한 데이터 자원과 학습데이터 구축에 필요한 툴을 사용자에게<br>
					제공하고, ETRI의 인공지능 기술을 소개하는 기능 등이 포함된 AI 공유 플랫폼 입니다.
				</div>
			</div>
		</div>
		<div class="w1200">
			<div class="contents">
				<div class="page_title">데이터 공유</div>
				<div class="page_title_info">학습 가능한 원천 데이터나 가공데이터를 공유 받으세요.</div>
				<div class="tab_wrap">
					<ul class="flex">
						<li class="tab_list off" id="introduce">
							<a href="<c:url value="/share/introduce" />">
								<div>AI 데이터 소개</div>
							</a>
						</li>
						<li class="tab_list on" id="share">
							<a href="<c:url value="/share/list" />">
								<div>ETRI 데이터 공유</div>
							</a>
						</li>
					</ul>
				</div>
				<!-- end tab_wrap -->
				
				<div class="content_wrap" id="list_wrap">
					<div class="search_wrap">
						<select class="search_type" name="search_type">
							<option value="visual">시각데이터 </option>
							<option value="lang">언어데이터</option>
						</select>
						<input class="search_word" type="text" name="search_word" placeholder="검색어를 입력해 주세요.">
						<input class="search_btn" type="submit" value="검색">
					</div>
					
					<div class="container lang_data_wrap">
						<table class="basic_table">
							<caption> 언어 Data List <span>Labelled data list</span></caption>
							<colgroup>
								<col style="width: 50px;"></col>
								<col style="width: 80px;"></col>
								<col style="width: 580px;"></col>
								<col style="width: 150px;"></col>
								<col style="width: 150px;"></col>
							</colgroup>
							<thead>
								<tr>
									<th></th>
									<th>ID</th>
									<th>TITLE</th>
									<th>STATUS</th>
									<th>DATE</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<div class="btn_wrap t_right">
							<button class="btn download_btn style_btn">다운로드</button>
						</div>
						<div class="pagination_wrap t_center"></div>
					</div>
					
<!-- 					<div class="container visual_data_wrap"> -->
<!-- 						<table class="basic_table"> -->
<%-- 							<caption> 시각 Data List <span>Labelled data list</span></caption> --%>
<%-- 							<colgroup> --%>
<%-- 								<col style="width: 50px;"></col> --%>
<%-- 								<col style="width: 80px;"></col> --%>
<%-- 								<col style="width: 580px;"></col> --%>
<%-- 								<col style="width: 150px;"></col> --%>
<%-- 								<col style="width: 150px;"></col> --%>
<%-- 							</colgroup> --%>
<!-- 							<thead> -->
<!-- 								<tr> -->
<!-- 									<th></th> -->
<!-- 									<th>ID</th> -->
<!-- 									<th>TITLE</th> -->
<!-- 									<th>STATUS</th> -->
<!-- 									<th>DATE</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody> -->
<!-- 							</tbody> -->
<!-- 						</table> -->
<!-- 						<div class="btn_wrap t_right"> -->
<!-- 							<button class="btn download_btn style_btn">다운로드</button> -->
<!-- 						</div> -->
<!-- 						<div class="pagination_wrap t_center"></div> -->
<!-- 					</div> -->
					
					<div class="search_result_wrap hide">
						<div class="wrap_title fl">시각 Data List<span>Labelled data list</span></div>
						<div class="list_btn style_btn fr">목록</div>
						<div class="down_btn style_btn fr">다운로드</div>
						<div class="clear"></div>
						<div class="search_result flex">
								<div class="all_select_box">전체선택</div>
						</div> 
				
						</div>
					</div>
					
				</div>
			</div>
			<!-- end contents -->
		</div>
	</div>

	<jsp:include page="/footer" flush="false" />

</body>
<script>
	$(document).on("sessionLoad", function() {
		shareList.init();
	});

	var shareList = {
		pt : $("#shareList"),
		init : function() {
			var that = this;
			
			that.pageKey = "shareList";
			
			that.pt.find("input[name='search_word']").val("");
			
			that.pageSet(null, "lang");
// 			that.pageSet(null, "visual");
			
			that.listener();
		},
		pageSet: function(search, dataType){
			var that = this;

			var tableTarget = dataType == "lang" ? ".lang_data_wrap" : ".visual_data_wrap";
			
			that.pt.find(tableTarget + " .pagination_wrap").html("");
			var html = '<ul id="pagination" class="pagination-sm"></ul>';
			that.pt.find(tableTarget + " .pagination_wrap").append(html);
			
			that.totalPage = 0;
			
			var startPage =  sessionStorage.getItem(that.pageKey) == null ? 1 : sessionStorage.getItem(that.pageKey)*1;
			var ajaxData = { page_num : startPage-1, page_size: 10, type: 0   };
			
			if(typeof search != "undefined" || search == null){
				var searchType = that.pt.find(".board_search_type option:selected").val();
				ajaxData[searchType] = search;
			}
			
			
			$.ajax({
			   	url : baseUrl + "data/getDatasetList.json",
			   	data : ajaxData,
			   	type : "POST",
			   	success : function(res){
			   		console.log("=====getDatasetList=====",dataType, res);
			   		
					if(res.result.code == "200" && res.result.data.length > 0 ){
							
// 							that.totalPage = Math.ceil(res.datasetVO.total_size*1 / 10);
							that.totalPage = 1;
							
							that.pt.find(tableTarget + " #pagination").twbsPagination({
								  totalPages: that.totalPage,
								  visiblePages: 7,
								  first:"<<",
								  prev:"<",
								  next:">",
								  last:">>",
								  startPage: startPage,
								  onPageClick: function (event, page_num) {
									  if(that.pageChk == -1){
										  that.drawData(res.result.data, tableTarget);
										  that.pageChk = 1;
									  } else {
										  that.getData(page_num, search, dataType);
									  }
//											  
								  }
							});	
					} else {
						that.listener();
					}
			   	},
			   	error : function(err){
			   		 console.log("ERROR!!", err);
			   	}
			});
		},
		getData: function(page_num, search, dataType){
			var that = this;
			
			var tableTarget = dataType == "lang" ? ".lang_data_wrap" : ".visual_data_wrap";
			
			
			sessionStorage.setItem(that.pageKey, page_num*1);
			var ajaxData = { page_num : page_num*1-1, page_size: 10, type: 0 };
			
			if(typeof search != "undefined" || search == null){
					var searchType = $(".board-search-type option:selected").val();
					ajaxData[searchType] = search;
			}
			
			
			$.ajax({
				url : baseUrl + "data/getDatasetList.json",
			   	data : ajaxData,
			   	type : "POST",
			   	success : function(res){
					if(res.result.code == "200"){
						that.drawData(res.result.data, tableTarget)
					}
			   	},
			   	error : function(err){
			   		 console.log("ERROR!!", err);
			   	}
			});
			
		},
		pageChk: -1,
		drawData: function(data, tableTarget){
			var that = this;
			
			var target = that.pt.find(tableTarget+ " table tbody");
			$(target).html("");

			var html = "";
			for(var i=0, len=data.length; i<len; i++){
				html += " <tr data-id='"+data[i]["id"]+"'> ";
				html += " 	<td class='table_checkbox'></td> ";
				html += " 	<td>"+data[i]["id"]+"</td> ";
				html += " 	<td>"+data[i]["title"]+"</td> ";
				html += " 	<td>"+data[i]["status"]+"</td> ";
				html += " 	<td>"+moment(data[i]["created_date"]).format("YYYY-MM-DD")+"</td> ";
				html += " </tr> ";
			}
			
			$(target).append(html);
			
			that.pt.find(tableTarget + " table tbody tr td").off("click").on("click",function(){
				var targetId = $(this).parent().data("id");
				$(this).parent().toggleClass("selected");
				$(this).parent().children(".table_checkbox").toggleClass("checked");
			});
			
		},
		listener : function() {
			var that = this;

			that.pt.find("input[name='search_word']").keydown("click",function(k){
				if(k.keyCode == 13) that.pt.find(".search_btn").trigger("click");
			})
			
			that.pt.find(" .search_btn").off("click").on("click",function(){
				var searchType = that.pt.find(".search_type option:selected").val(),
					searchWord = that.pt.find("input[name='search_word']").val();
				
				sessionStorage.setItem(that.pageKey, 1);
				if(searchType == "visual"){
					that.getSearchVisionList(searchWord);
				}
// 				if(searchWord == "") that.pageSet();
// 				else that.pageSet(searchWord);
				
			});
			
			that.pt.find(".search_result_wrap .list_btn").off("click").on("click",function(){
				that.pt.find(".visual_data_wrap").removeClass("hide");
				that.pt.find(".lang_data_wrap").removeClass("hide");
				that.pt.find(".search_result_wrap").addClass("hide");
				
				that.pt.find("input[name='search_word']").val("");
				
				that.pageSet(null, "lang");
				that.pageSet(null, "visual");
			});
		},

		getSearchVisionList: function(searchWord){
			var that = this;
			
			var ajaxData = {
// 					page_num : page_num*1-1,
					label: searchWord
			};
			
			
			$.ajax({
				url : baseUrl + "data/getSearchVisionList.json",
			   	data : ajaxData,
			   	type : "POST",
			   	success : function(res){
			   		console.log("=====getSearchVisionList=====", res);
					if(res.result.code == "200"){
						that.drawSearchList(res.result.data);
					}
			   	},
			   	error : function(err){
			   		 console.log("ERROR!!", err);
			   	}
			});
		},

		drawSearchList: function(data){
			var that = this;
			
			that.pt.find(".visual_data_wrap").addClass("hide");
			that.pt.find(".lang_data_wrap").addClass("hide");
			that.pt.find(".search_result_wrap").removeClass("hide");
			
			var target = that.pt.find(".search_result_wrap .search_result");
			$(target).html("");

			var html = "";
			html += "<div class='all_select_box'>전체선택</div>";
			for(var i=0, len=data.length; i<len; i++){
				html += " <div class='box' data-id='"+data[i]['id']+"'> ";
				html += "	<div class='select_box'></div>";
				html += " 	<div class='img'><img src='data:image/jpeg;base64,"+data[i]['crop_img']+"'></div> ";
// 				html += " 	<div class='title'>Title</div> ";
// 				html += " 	<div class='date'>2018.11.12</div> ";
				html += " </div> ";
			
			}
			
			$(target).append(html);
			
			that.pt.find(".down_btn").off("click").on("click",function(){
				var selectedArr = [], selectedLen = that.pt.find(".search_result_wrap .box .select_box.selected").length;
				
				if(selectedLen != 0){
					that.pt.find(".search_result_wrap .box .select_box.selected").each(function(){
						selectedArr.push($(this).parent().data("id"))
					});
					that.saveVisionData(selectedArr.join());
				} else {
					alert("다운로드할 시각데이터를 선택해주세요."); return;
				}
			});
			
			var selectBox = ".search_result_wrap .box .select_box",
				allSelectBox = ".search_result_wrap .all_select_box";
			
			that.pt.find(".search_result_wrap .box").off("click").on("click",function(){
				$(this).children(".select_box").toggleClass("selected");
				
				var total = that.pt.find(selectBox).length,
				  checkedLen =  that.pt.find(selectBox+".selected").length;
			
				if(total == checkedLen) that.pt.find(allSelectBox).addClass("selected");
				else that.pt.find(allSelectBox).removeClass("selected");
			});
			
			that.pt.find(allSelectBox).off("click").on("click",function(){
				$(this).toggleClass("selected");
				
				if($(this).hasClass("selected")) {
					that.pt.find(selectBox).addClass("selected");
				} else {
					that.pt.find(selectBox).removeClass("selected");
				} 
			});
			
		},
		saveVisionData: function(idList){
			window.open(baseUrl + "data/saveVisionData?id="+idList);
			
			that.pt.find(".search_result_wrap .box .select_box").removeClass("selected");
			that.pt.find(".search_result_wrap .all_select_box").removeClass("selected");
		},
	};
</script>