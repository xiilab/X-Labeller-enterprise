<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/header"  flush="false" />

<link rel="stylesheet" href="<c:url value="/css/slick.css" />">
<script src="<c:url value="/js/slick.min.js" />"></script>
		
<head>
	<title>X-labeller</title>
	
	<style>
		 .m_txt { font-size: 42px; }
		 .m_subtxt { font-size: 16px; margin-top: 18px }
		
		.main_1 {  background: url(images/bg-main-graphic.png) no-repeat #f2f2f2 right/1738px 713px;  min-width: 1200px; }
   		.main_1 .contents {  padding: 120px 60px 50px 60px; }
		.main_1 .bar {  width: 55px; height: 2px; background-color: #333333; }
		.main_1 .m_txt {  font-size: 44px; margin: 20px 0;}
		.main_1 .m_subtxt {font-size: 14px; line-height: 20px;  }
		.main_1 .detail_view_btn { width: 170px; margin-top: 37px; border: solid 1px #333333;  }
		.main_1 .detail_view_btn a { line-height: 52px; font-size: 18px; }
		.main_1 .detail_view_btn a:hover {color: #333; }
		
		.main_1 .cont_wrap {  margin-top: 200px; width: 1000px;box-shadow: 5px 8.7px 16px 0 #eaeaea; }
		.main_1 .cont_wrap .cont_btn { width: 227px; background-color: #fff;   }
		.main_1 .cont_wrap .cont_btn:after { content: ''; position: absolute; width: 1px;  height: 60px; display: block; margin-top: -78px;  background-color: #d9d9d9; }
		.main_1 .cont_wrap .cont_btn:nth-child(2):after {background-color: #fff; }
		.main_1 .cont_wrap .cont_txt { width: 252px;  line-height: 100px; color: #fff; background-image: linear-gradient(to left, #2ea5e4 16%, #22d4df); font-size: 24px; }
		.main_1 .cont_wrap .cont_btn a { display: flex; height: 100px;  align-items: center;   justify-content: center; font-size: 16px; }
		.main_1 .cont_wrap .cont_btn img {  width: 27px;  margin-right: 10px;  }
		
		.main_2 {  }
		.main_2 .contents {    padding: 100px 140px; }
		.main_2 .cont_wrap { margin-top: 50px;  }
		.main_2 .cont_wrap .cont {  width: 33%;  }
		.main_2 .cont_wrap .cont .cont_ic {  }
		.main_2 .cont_wrap .cont .cont_txt_1 { font-size: 22px;  margin: 14px 0;     font-weight: 400; }
		.main_2 .cont_wrap .cont .cont_txt_1 .em { color: #11a1cb; }
		.main_2 .cont_wrap .cont .cont_txt_2 {   line-height: 23px; }
		.main_2 .cont_wrap .cont .cont_btn { border: solid 1px #333333; width: 115px; margin-top: 20px; line-height: 35px;  display: inline-block; }
		
		.main_3 { background-image: linear-gradient(to left, #2ea5e4 16%, #22d4df);  }
		.main_3 .contents {     padding: 100px 140px; }
		.main_3 .m_txt { margin: 20px 0; color: #fff; }
		.main_3 .m_subtxt {  color: #fff; }
		.main_3 .cont_wrap { margin-top: 84px; }
		.main_3 .cont_wrap .cont {width: 33%;  }
		.main_3 .cont_img {  margin-left: 80px;  width: 146px; height: 146px; border-radius: 100%;  background-color: #fff; }
		.main_3 .cont_txt { font-size: 22px; color: #fff; margin-top: 35px;  }

		.main_3 .slick_btn_wrap { position: absolute; width: 933px; top: 370px; }
		.main_3 .slick_btn_wrap .slick_prev {  position: absolute; left: 0; cursor: pointer; }
		.main_3 .slick_btn_wrap .slick_next {  position: absolute; right: 0;  cursor: pointer; }
		.main_3 .slick_next:before {  content:url('images/btn-main-arrow-right-normal.png');}
		.main_3 .slick_prev:before { content:url('images/btn-main-arrow-left-normal.png'); }
		
		.main_4 {  }
		.main_4 .contents {    padding: 100px; }
		
		.main_4 .cont_wrap { position: relative; margin-top: 90px; }
		.main_4 .cont_wrap > .flex {  justify-content: space-between; }
		.main_4 .cont_title { font-size: 28px; font-weight: 500; }
		.main_4 .cont_title span { margin-left: 20px; font-size: 14px; color: #777; font-weight: 300;}
		
		.main_4 ul { margin-top: 40px; border-top: 2px #333 solid; }
		.main_4 ul > li { height: 70px; border-bottom: 1px #e8e8e8 solid; }
		.main_4 ul >  li:hover { cursor: pointer; background-color: #f4fcfe; }
		.main_4 .notice_list .num { width: 100px; }
		.main_4 .notice_list .num.top { width: 50px; margin: 0 25px; line-height: 25px; border-radius: 2px;  background-color: #008bed; color: #fff;}
		.main_4 .notice_list .title { width: 720px; }
		.main_4 .notice_list .date { width: 80px; }
		.main_4 .notice_list .hits { width: 100px; }
		.main_4 .notice_list li.selected  { background-color: #f4fcfe ;}
		.main_4 .notice_list .notice_contents { display: none; padding: 35px; line-height: 30px;  border-bottom: 1px #e8e8e8 solid; }
		
		.main_4 .faq_wrap .category_view a { display: inline-block; width: 95px; text-align: center; }
		.main_4 .faq_wrap .category_view a.active { color: #008bed; }
		.main_4 .faq_wrap .category_view a:after {   content: ''; width: 1px;  height: 16px;   background-color: #a0a0a0;  height: 16px;  margin-top: 3px;   position: absolute;  margin-left: 23px; }
		.main_4 .faq_wrap .category_view a:nth-child(3):after {   content: ''; width: 0px; }
		.main_4 .faq_list .ic { width: 100px; height: 47px; background:url('images/ic-q-normal.png') no-repeat center; }
		.main_4 .faq_list li.selected .ic { background:url('images/ic-q-selected.png') no-repeat center; }
		.main_4 .faq_list li.selected  {background-color: #f4fcfe;}
		.main_4 .faq_list .question { width: 800px; }
		.main_4 .faq_list .arrow { width: 100px; transition: all 0.5s; -webkit-transform: rotate(180deg);  -moz-transform: rotate(180deg); -ms-transform: rotate(180deg); -o-transform: rotate(180deg); transform: rotate(180deg); }
		.main_4 .faq_list li.selected .arrow {-webkit-transform: rotate(0deg); -moz-transform: rotate(0deg); -ms-transform: rotate(0deg); -o-transform: rotate(0deg); transform: rotate(0deg); }
		.main_4 .faq_list .answer { display: none; padding: 35px; line-height: 30px;  border-bottom: 1px #e8e8e8 solid; }
		.main_4 .faq_list .flex {flex-wrap: wrap; }
			
			
	</style>
</head>
<body>
	
	<div class="container" id="main">

		<div class="main_1">
			<div class="w1200">
				<div class="contents">
					<div class="bar"></div>
					<div class="m_txt bold">AI 공유 플랫폼</div>
					<div class="m_subtxt">인공지능 응용서비스에 활용 가능한 데이터 자원과 학습데이터 구축에 필요한 툴을 사용자들에게 제공하고, <br/>ETRI의 인공지능 기술을 소개하는 기능 등이 포함된 AI 공유 플랫폼 입니다.</div>
					<div class="detail_view_btn t_center"><a class="btn_link" href="<c:url value="/platform/introduce" />">자세히 보기</a></div>
					<div class="cont_wrap flex">
						<div class="cont_txt t_center">AI 공유 플랫폼은?</div>
						<div class="cont_btn t_center"><a class="btn_link" href=""><img src="<c:url value="/images/ic-main-1.png" />">구성 및 이용방법</a></div>
						<div class="cont_btn t_center"><a class="btn_link"  href="<c:url value="/share/introduce" />"><img src="<c:url value="/images/ic-main-2.png" />">AI 데이터 소개</a></div>
						<div class="cont_btn t_center"><a class="btn_link" href=""><img src="<c:url value="/images/ic-main-3.png" />">ETRI 기술 소개</a></div>
						<div class="cont_btn t_center"><a class="btn_link" href="<c:url value="/ask/list" />"><img src="<c:url value="/images/ic-main-4.png" />">문의하기</a></div>
					</div>
				</div>
			</div>
		</div>

		<div class="main_2">
			<div class="w1200">
				<div class="contents">
					<div class="m_txt t_center">데이터 공유 / 가공툴</div>
					<div class="m_subtxt t_center">공유 데이터를 사용해 보세요, 데이터 자원을 제공된 툴을 통하여 가공해 보세요.</div>
					<div class="cont_wrap flex">
						<div class="cont t_center">
							<div class="cont_ic"><img src="<c:url value="/images/ic-main-datashare.png" />"></div>
							<div class="cont_txt_1">ETRI 데이터 <span class="em">공유</span></div>
							<div class="cont_txt_2">언어분석API는 형태소 분석, 개체명 인식, <br/>동음이의어/다의어 분석,  <br/>의미역 인식 API를 제공합니다.</div>
							<div class="cont_btn"><a class="btn_link" href="<c:url value="/share/list" />">바로가기</a></div>
						</div>
						<div class="cont t_center">
							<div class="cont_ic"><img src="<c:url value="/images/ic-data-language.png" />"></div>
							<div class="cont_txt_1">언어학습 데이터  <span class="em">가공 툴</span></div>
							<div class="cont_txt_2">언어분석API는 형태소 분석, 개체명 인식, <br/>동음이의어/다의어 분석,  <br/>의미역 인식 API를 제공합니다.</div>
							<div class="cont_btn"><a class="btn_link" href="<c:url value="/datatool" />">바로가기</a></div>
						</div>
						<div class="cont t_center">
							<div class="cont_ic"><img src="<c:url value="/images/ic-main-imagetool.png" />"></div>
							<div class="cont_txt_1">시각학습 데이터 <span class="em"> 가공 툴</span></div>
							<div class="cont_txt_2">언어분석API는 형태소 분석, 개체명 인식, <br/>동음이의어/다의어 분석,  <br/>의미역 인식 API를 제공합니다.</div>
							<div class="cont_btn"><a class="btn_link" href="<c:url value="/datatool?type=visual" />">바로가기</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="main_3">
			<div class="w1200">
				<div class="contents">
					<div class="m_txt t_center">ETRI 기술 체험</div>
					<div class="m_subtxt t_center">공유 데이터를 사용해 보세요, 데이터 자원을 제공된 툴을 통하여 가공해 보세요.</div>
					
					<div class="slick_btn_wrap">
						<div class="slick_prev"></div>
						<div class="slick_next"></div>
					</div>
					
					<div class="cont_wrap flex">
						<div class="cont t_center">
							<div class="cont_img"></div>
							<div class="cont_txt">체험툴1</div>
						</div>
						<div class="cont t_center">
							<div class="cont_img"></div>
							<div class="cont_txt">체험툴1</div>
						</div>
						<div class="cont t_center">
							<div class="cont_img"></div>
							<div class="cont_txt">체험툴1</div>
						</div>
						
						<div class="cont t_center">
							<div class="cont_img"></div>
							<div class="cont_txt">체험툴1</div>
						</div>
						<div class="cont t_center">
							<div class="cont_img"></div>
							<div class="cont_txt">체험툴1</div>
						</div>
						<div class="cont t_center">
							<div class="cont_img"></div>
							<div class="cont_txt">체험툴1</div>
						</div>
						
						<div class="cont t_center">
							<div class="cont_img"></div>
							<div class="cont_txt">체험툴1</div>
						</div>
						<div class="cont t_center">
							<div class="cont_img"></div>
							<div class="cont_txt">체험툴1</div>
						</div>
						<div class="cont t_center">
							<div class="cont_img"></div>
							<div class="cont_txt">체험툴1</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		 
		<div class="main_4">
			<div class="w1200">
				<div class="contents">
					<div class="m_txt t_center">커뮤니티</div>
					<div class="m_subtxt t_center">AI공유 플랫폼의 중요 공지사항을 확인해 보세요. / 궁금한 사항을 문의하세요.</div>
					
					<div class="cont_wrap notice_wrap">
						<div class="flex">
							<div class="cont_title">공지사항 <span>중요 공지사항을 꼭 확인하세요.</span></div>
							<a href="<c:url value="/notice/list" />">더보기	</a>
						</div>
						<ul class="notice_list">
						
						</ul>
					</div>
					
					<div class="cont_wrap faq_wrap">
						<div class="flex">
							<div class="cont_title">FAQ <span>궁금한 사항을 확인해 보세요.</span></div>
							<div class="category_view">
								<a href="#" class="active" type="0">일반문의</a>
								<a href="#" type="1">개발관련</a>
								<a href="#" type="2">이용가이드</a>
							</div>
						</div>
						<ul class="faq_list">
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		
	</div>
	
	<jsp:include page="/footer"  flush="false" />		
	
</body>
<script>

	$(document).on("sessionLoad", function() {
		main.init();
	});
	
	var main = {
		pt: $("#main"),
		init: function(){
			var that = this;

			that.pt.find(".main_3 .cont_wrap").slick({
				  infinite: true,
				  slidesToShow: 3,
				  slidesToScroll: 3,
				  prevArrow: ".slick_prev", 
				  nextArrow: ".slick_next", 

			});
			
			that.getNoticeList();
			that.getFaqList();
			
			that.listener();
		},
		getNoticeList : function() {
			var that = this;
			$.ajax({
				url : baseUrl + "notice/getNoticeList.json",
				data : { page_num : 0 },
				type : "GET",
				success : function(res) {
					console.log("=====noticeList=====", res);
					if (res.result.code == "200") {
						that.drawNoticeList(res.result.data);
					} else {
					
					}
				},
				error : function(err) {
					console.log("ERROR!!", err);
				}
			});
		},
		drawNoticeList: function(data){
			var that = this;
			var target = ".main_4 .notice_list";
			
			that.pt.find(target).html("");
			var html = "";
			for(var i=0, len=5; i<len; i++){
				html += "	<li class='flex t_center'> ";
				if(i==0){
					html += "		<div class='top num'>공지</div> ";
				} else {
					html += "		<div class='num'>"+data[i]["id"]+"</div> ";
				}
				html += "		<div class='title t_left'>"+data[i]["title"]+"</div> ";
				html += "		<div class='date'>"+moment(data[i]["created_date"]).format("YYYY-MM-DD")+"</div> ";
				html += "		<div class='hits'>"+data[i]["hits"]+"</div> ";
				html += "	</li> ";
				html += "    <div class='notice_contents'>"+data[i]["contents"]+"</div>";
			}
			that.pt.find(target).append(html);
			

			that.pt.find(".main_4 .notice_list li").off("click").on("click",function(){
				if($(this).hasClass("selected")){
					$(this).removeClass("selected");
					$(this).next(".notice_contents").stop().slideUp(300);
				} else {
					that.pt.find(".main_4 .notice_list li.selected").removeClass("selected");
					that.pt.find(".main_4 .notice_list li").next(".notice_contents").stop().slideUp(300);
					$(this).addClass("selected");
					$(this).next(".notice_contents").stop().slideDown(300);
				}
			});
		},	
		getFaqList : function(inputValue) {
			var that = this;
			$.ajax({
				url : baseUrl + "faq/getFaqList.json",
				data : { page_num : 0 },
				type : "GET",
				success : function(res) {
					console.log("=====faqList=====", res);
					if (res.result.code == "200") {
						that.faqData = res.result.data;
						that.drawFaqList(res.result.data);
					} else {
					
					}
				},
				error : function(err) {
					console.log("ERROR!!", err);
				}
			});
		},
		drawFaqList: function(data){
			var that = this;
			var target = ".main_4 .faq_list";
			
			var data = that.faqData;
			
			var categoryData = {"0": [], "1": [], "2": []};
			for(var i=0, len=data.length; i<len; i++){
				categoryData[data[i].type].push(data[i]);
			}
			
			var targetData = categoryData[that.pt.find(".faq_wrap .category_view a.active").attr("type")];
			
			that.pt.find(target).html("");
			var html = "";
			for(var i=0, len=targetData.length; i<len; i++){
				
				html += "	<li class='flex t_center'> ";
				html += "		<div class='ic'></div> ";
				html += "		<div class='question t_left'>"+targetData[i]['title']+"</div> ";
				html += "		<div class='arrow'><img src='<c:url value='/images/ic-faq-arrow-down.png' />'></div> ";
				html += "	</li> ";
				html += "	<div class='answer'>"+targetData[i]['contents']+"</div> ";
						
			}
			that.pt.find(target).append(html);
			
			
			that.pt.find(".main_4 .faq_list li").off("click").on("click",function(){
				if($(this).hasClass("selected")){
					$(this).removeClass("selected");
					$(this).next(".answer").stop().slideUp(300);
				} else {
					that.pt.find(".main_4 .faq_list li.selected").removeClass("selected");
					that.pt.find(".main_4 .faq_list li").next(".answer").stop().slideUp(300);
					$(this).addClass("selected");
					$(this).next(".answer").stop().slideDown(300);
				}
			});
		},	
		listener: function(){
			var that = this;
			
			that.pt.find(".faq_wrap .category_view a").off("click").on("click",function(){
				that.pt.find(".faq_wrap .category_view a").removeClass("active");
				$(this).addClass("active");
				
				that.drawFaqList();
				
			});
			
		}
	};


</script>