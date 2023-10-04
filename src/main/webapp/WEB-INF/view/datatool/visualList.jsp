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
#visualList .tab_wrap li { width: 552px; }

#visualList .content_wrap { width: 1010px; margin: 0 auto; }
#visualList .container {margin-top: 65px;}

#visualList .table_checkbox { width: 19px; height: 19px; background-image: url('../images/btn-checkbox-normal-6.png');  background-repeat: no-repeat; background-position: center; }
#visualList .table_checkbox.checked { background-image: url('../images/btn-checkbox-selected-2.png'); }

#visualList .btn_wrap .upload_btn { width: 133px; height: 44px; box-shadow: 0px 3px 0 0 rgba(0, 0, 0, 0.1); border: solid 1px #1e88f5; background-color: #008bed; color: #fff; margin-bottom: 50px; }


</style>
</head>
<body>

	<div class="container" id="visualList">
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
				<div class="page_title">시각학습 데이터 가공</div>
				<div class="page_title_info">ETRI의 인공지는 SW를 사용해 최적의 데이터셋으로 가공하세요.</div>
				
				<div class="content_wrap" id="list_wrap">
					<div class="container">
					
						<div class="btn_wrap t_right">
							<button class="btn upload_btn">업로드</button>
						</div>
						
						
						<table class="basic_table">
							<colgroup>
<%-- 								<col style="width: 50px;"></col> --%>
								<col style="width: 80px;"></col>
								<col style="width: 580px;"></col>
<%-- 								<col style="width: 150px;"></col> --%>
								<col style="width: 150px;"></col>
							</colgroup>
							<thead>
								<tr>
<!-- 									<th></th> -->
									<th>ID</th>
									<th>제목</th>
<!-- 									<th>상태</th> -->
									<th>DATE</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
	
						<div class="pagination_wrap t_center"></div>
						
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
		visualList.init();
	});

	var visualList = {
		pt : $("#visualList"),
		init : function() {
			var that = this;
			
			
			if(!loginCheck()){
				alert("로그인 후 이용 가능합니다.");
				location.href = baseUrl + "login";
			} else {
				that.pageSet();
			}
			
			that.listener();
		},
		pageSet: function(search){
			var that = this;

			that.pt.find(".pagination_wrap").html("");
			var html = '<ul id="pagination" class="pagination-sm"></ul>';
			that.pt.find(".pagination_wrap").append(html);
			
			that.totalPage = 0;
			
			var startPage =  sessionStorage.getItem(that.pageKey) == null ? 1 : sessionStorage.getItem(that.pageKey)*1;
			var ajaxData = { page_num : startPage-1, type: 1 };
			
			if(typeof search != "undefined"){
				var searchType = that.pt.find(".board_search_type option:selected").val();
				ajaxData[searchType] = search;
			}
			
			
			$.ajax({
			   	url : baseUrl + "data/getMyDatasetList.json",
			   	data : ajaxData,
			   	type : "POST",
			   	success : function(res){
			   		console.log("=====getMyDatasetList=====", res);
			   		
					if(res.result.code == "200" && res.result.data.length > 0 ){
							
						that.totalPage = Math.ceil(res.datasetVO.total_size*1 / 10);
// 							that.totalPage = 1;
							
							that.pt.find("#pagination").twbsPagination({
								  totalPages: that.totalPage,
								  visiblePages: 7,
								  first:"<<",
								  prev:"<",
								  next:">",
								  last:">>",
								  startPage: startPage,
								  onPageClick: function (event, page_num) {
									  if(that.pageChk == -1){
										  that.drawData(res.result.data);
										  that.pageChk = 1;
									  } else {
										  that.getData(page_num, search);
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
		getData: function(page_num, search){
			var that = this;
			
			sessionStorage.setItem(that.pageKey, page_num*1);
			var ajaxData = { page_num : page_num*1-1, type: 1 };
			
			if(typeof search != "undefined"){
					var searchType = $(".board-search-type option:selected").val();
					ajaxData[searchType] = search;
			}
			
			
			$.ajax({
				url : baseUrl + "data/getMyDatasetList.json",
			   	data : ajaxData,
			   	type : "POST",
			   	success : function(res){
					if(res.result.code == "200"){
						that.drawData(res.result.data)
					}
			   	},
			   	error : function(err){
			   		 console.log("ERROR!!", err);
			   	}
			});
			
		},
		pageChk: -1,
		drawData: function(data){
			var that = this;
			
			var target = that.pt.find("#list_wrap tbody");
			$(target).html("");
				
			var html = "";
			for(var i=0, len=data.length; i<len; i++){
				html += " <tr data-id='"+data[i]["id"]+"'> ";
// 				html += " 	<td class='table_checkbox'></td> ";
				html += " 	<td>"+data[i]["id"]+"</td> ";
				html += " 	<td>"+data[i]["title"]+"</td> ";
// 				html += " 	<td>"+data[i]["status"]+"</td> ";
				html += " 	<td>"+moment(data[i]["created_date"]).format("YYYY-MM-DD")+"</td> ";
				html += " </tr> ";
			}
			
			$(target).append(html);
			
			that.pt.find("#list_wrap tbody tr td").off("click").on("click",function(){
				var targetId = $(this).parent().data("id");
				console.log("click", targetId);
				
				location.href = baseUrl + "datatool/enrichment?datasetId=" + targetId
			});
			
		},
		listener : function() {
			var that = this;

			
			that.pt.find(".upload_btn").off("click").on("click",function(){
				if(loginCheck()){
					location.href = baseUrl + "datatool/upload";
				} else {
					alert("로그인 후 이용 가능합니다.");
					location.href = baseUrl + "login";
				}
			});
		},
		
	};
</script>
