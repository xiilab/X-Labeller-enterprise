<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/header" flush="false" />
<head>
	<title>ETRI 인공지능 데이터 허브 포털</title>
	
	<style>
	.bg-sub-datatool{
		width: 100%;
		height: 200px;
		background-image: url('images/bg-sub-datatool.png');
		background-repeat: no-repeat;
	}
	.bg-sub-datatool>div { color: #ffffff; text-align: left; }
	.bg-sub-datatool .bg_title {
		font-size: 28px;
		font-weight: 500px;
	}
	.bg-sub-datatool .bg_info {
		opacity: 0.9;
		line-height: 1.81;
	}
	
	#index .contents { margin-bottom: 100px; }
	
	/* tab_wrap */
	#index .tab_wrap li { width: 552px; }
	
	#index .container { width: 1010px; margin: 0 auto;font-size: 16px; }
	#index .content-wrap {
		width: 900px;
		height: 220px;
		margin: 125px 0 103px 0;
		margin-left: auto;
		margin-right: auto; 
		border: 2px solid #d9d9d9;
		border-radius: 8px;
		box-shadow: 0px 10px 0 0 rgba(228, 228, 228, 0.5);
		cursor:pointer;
	}
	#index .content-wrap .col { flex: 1; }
	#index .content-wrap .col .text-content { width: 245px; margin: auto; text-align: left; }
	#index .content-wrap .col .text-content p { font-size: 28px; font-weight: 300; line-height: 1.43; }
	#index .content-wrap .col .text-content p span { position: absolute; top: 28px; margin-left: 5px; }
	#index .content-wrap .col .text-content div { margin: 16px; }
	#index .content-wrap.section-1 .col .img-content { width: 252px; height: 147px; margin: auto; object-fit: contain; background-image: url('images/img-languagetool-graphic.png'); }
	#index .content-wrap.section-2 .col .img-content { width: 171px; height: 149px; margin: auto; object-fit: contain; background-image: url('images/img-imagedatatool-graphic.png'); }
	
	#index .sub_title .flat {
		width: 5px;
	    height: 24px;
	    background-color: #2ea5e4;
	}
	#index .sub_title .flex span {
		padding-left: 20px;
		font-size: 24px;
		font-weight: bold;
	}
	#index .sub_title .info {
	    margin: 40px 0;
	}
	#index .sub_title .info p{
		width: 922px;
		margin: auto;
		font-size: 15px;
		line-height: 2;
	}
	
	#index .section-wrap {
		width: 820px;
		margin: auto;
	}
	#index .section-wrap .section {
		border-bottom: 1px solid #d9d9d9;
	}
	#index .section-wrap .section:last-of-type{
		border-bottom: 0;
	}
	#index .section-wrap .step {
		margin: 35px;
		font-size: 28px;
		font-weight: 200;
		line-height: 1.07;
		color: #333333;
	}
	#index .section-wrap .step-info {
		font-size: 15px;
		line-height: 2;
	}
	#index .section-wrap .step-info .border{
		padding: 8px;
	    box-shadow: 0px 4px 0 0 rgba(228, 228, 228, 0.8);
	    border: 1px solid #2ea5e4;
	
	}
	#index .section-wrap .step-info span {
		color: #777777;
	}
	
	</style>
</head>
<c:set var="type" value="${param.type}" />
<body>

	<div class="container" id="index">
		<div class="bg-sub-datatool flex">
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
				<div class="page_title">데이터 가공</div>
				<div class="page_title_info">ETRI의 인공지는 SW를 사용해 최적의 데이터셋으로 가공하세요.</div>
	
				<div class="tab_wrap">
					<ul class="flex">
						<li class="tab_list on" id="language">
							<a href="#">
								<div>언어학습 데이터 가공 도구</div>
							</a>
						</li>
						<li class="tab_list off" id="image">
							<a href="#">
								<div>시각학습 데이터 가공 도구</div>
							</a>
						</li>
					</ul>
				</div>
				<!-- end tab_wrap -->
				
				<div class="container">
					<div class="page-content">
						<div class="content-wrap section-1 flex">
							<div class="col">
								<div class="text-content">
									<p><span>･&nbsp;&nbsp;･</span><b>언어학습</b> 데이터 가공</p>
								 	<p>도구 사용</p>
								 	<div></div>
								 	<a href="<c:url value="/datatool/languageList" />">바로가기 ></a>
								 </div>
							</div>
							<div class="col">
								<div class="img-content"></div>
							</div>
						</div>
						<div class="content-wrap section-2 flex">
							<div class="col">
								<div class="text-content">
									<p><span>･&nbsp;&nbsp;･</span><b>시각학습</b> 데이터 가공</p>
								 	<p>도구 사용</p>
								 	<div></div>
								 	<a href="<c:url value="/datatool/visualList" />">바로가기 ></a>
								 </div>
							</div>
							<div class="col">
								<div class="img-content"></div>
							</div>
						</div>
					</div>
					
					<div class="page-content section">
						<div class="sub_title">
							<div class="flex">
								<div class="flat"></div><span>사전 준비 사항</span>
							</div>
							<div class="info">
								<p><span>언어학습</span> 데이터 가공 도구를 사용하려면 ETRI 인공지능 Open API 서비스에서 개발자 계정을 등록 해야 합니다. 개발자 계정 등록 이후 API 사용 신청을 <br>
								통해 API 사용시 필요한 인증 정보를 획득해야 합니다.</p>
							</div>
						</div>
						<div class="section-wrap">
							<div class="section flex">
								<div class="step">Step 1.</div>
								<div class="step-info">“<b>ETRI AI</b>” 홈페이지의 [<b>Open API 사용신청</b>] 페이지로 이동합니다.</div>
							</div>
							<div class="section flex">
								<div class="step">Step 2.</div>
								<div class="step-info">“[<b>Open API 사용신청</b>] 페이지의   <b class="border">키 발급 신청하기</b>  버튼을 클릭합니다.</div>
							</div>
							<div class="section flex">
								<div class="step">Step 3.</div>
								<div class="step-info">Open API의 Access Key 발급에 필요한 <b>사용 신청 정보</b>를 입력 후   <b class="border">등록하기</b>   버튼을 <br>
														클릭합니다. <span>(등록된 사용 신청은 “ETRI AI” 관리자에 의해서 승인이 필요합니다.)</span></div>
							</div>
							<div class="section flex">
								<div class="step">Step 4.</div>
								<div class="step-info">[<b>Open API 사용신청</b>] 페이지의   <b class="border">키 발급 신청확인</b>   버튼을 클릭합니다.</div>
							</div>
							<div class="section flex">
								<div class="step">Step 5.</div>
								<div class="step-info">키 발급 신청에 입력한 “<b>이메일</b>”와 “<b>패스워드</b>”를 입력 후   <b class="border">API KEY 확인하기</b>   버튼을 클릭합니다.</div>
							</div>
							<div class="section flex">
								<div class="step">Step 6.</div>
								<div class="step-info">발급된 Open API의 <b>Access Key</b>를 확인합니다.</div>
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
		index.init();
	});

	var index = {
		type: "${type}",
		pt : $("#index"),
		init : function() {
			var that = this;
			console.log(that.type)
			
			that.listener();

			if(that.type == "visual") $(".tab_wrap #image").trigger("click");
			else 	that.pt.find(".section-2").hide();
		},

		listener : function() {
			var that = this;

			//탭메뉴 클릭
			that.pt.find(".tab_wrap .tab_list").off("click").on("click", function(){
				$(this).parent().contents().removeClass("on").addClass("off");
				$(this).removeClass("off").addClass("on");
				
				var nodeId = $(this).attr("id");
				if(nodeId == "language"){
					that.pt.find(".section-1").show();
					that.pt.find(".section-2").hide();
					that.pt.find(".sub_title .info span").text("언어학습");
				}else if(nodeId == "image"){
					that.pt.find(".section-2").show();
					that.pt.find(".section-1").hide();
					that.pt.find(".sub_title .info span").text("시각학습");
				}else {
					return false;
				}
				
				return false;
			});
			
			that.pt.find(".content-wrap").off("click").on("click", function(){
				if($(this).hasClass("section-1")) location.href = baseUrl + "datatool/languageList";
				else location.href = baseUrl + "datatool/visualList";
			});
		},
	};
</script>