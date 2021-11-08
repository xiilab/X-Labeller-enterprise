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
#introduce .tab_wrap li { width: 552px; }

#introduce .content_wrap { width: 1010px; margin: 0 auto;     margin-bottom: 90px; }
#introduce .container {margin-top: 65px;}
#introduce #introduce_wrap .sub_title .flat {
	width: 5px;
    height: 24px;
    background-color: #2ea5e4;
}
#introduce #introduce_wrap .sub_title span {
	padding-left: 20px;
	font-size: 24px;
	font-weight: bold;
}
#introduce #introduce_wrap .text-content {
	margin-top: 30px;
	font-size: 16px;
	line-height: 1.75;
}
#introduce #introduce_wrap .section-wrap{
	border-collapse: collapse;
}
#introduce #introduce_wrap .section{
	flex: 1;
	width: 325px;
	height: 268px;
	border: 1px solid #d9d9d9;
	padding: 50px 30px;
}
#introduce #introduce_wrap .section .title {
	margin: 20px 0;
	font-size: 18px;
	font-weight: bold;
	color: #333333;
}
#introduce #introduce_wrap .section .info {
	font-size: 15px;
	line-height: 1.87;
	color: #555555;
}

</style>
</head>
<body>

	<div class="container" id="introduce">
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
						<li class="tab_list on" id="introduce">
							<a href="<c:url value="/share/introduce" />">
								<div>AI 데이터 소개</div>
							</a>
						</li>
						<li class="tab_list off" id="share">
							<a href="<c:url value="/share/list" />">
								<div>ETRI 데이터 공유</div>
							</a>
						</li>
					</ul>
				</div>
				<!-- end tab_wrap -->
				
				<div class="content_wrap" id="introduce_wrap">
					<div class="container">
						<div class="sub_title flex">
							<div class="flat"></div><span>AI 데이터 소개</span>
						</div>
						<div class="text-content">
							<p>산업에서 흔히 사용되는 인공지능은 지도학습을 기반으로 합니다. 지도학습이란 컴퓨터에 다양한 데이터를 입력, 반복된 훈련과정을 통해 하나의 결과를 유추하는 
							기술입니다. 따라서 인공지능 응용 서비스가 어떤 형태냐에 따라 다양한 도메인의 다양한 학습데이터를 필요로 합니다.</p>
 							<br>
							<p>인공지능은 수학적으로 표현할 수 없었던 복잡한 인간의 두뇌를 데이터를 기반으로 흉내 내는 것이라고 볼 수 있습니다. 이 순간에도 수없이 발생되는 모든 종류의 
							빅데이터들은 인간의 뇌를 흉내내기 위해 필요한 원천이라고 볼 수 있는데, 이 데이터들로부터 특정 서비스를 위해 전처리 된 후, 특정 모델에 적용되어 원하는 
							결과를 나오게 하는 데이터들을 모두 AI 데이터라고 할 수 있습니다.</p>
						</div>
						<div class="text-content">
							<div class="section-wrap flex">
								<div class="section">
									<div class="ic"><img src="<c:url value="/images/img-aidata-language.png" />"></div>
									<div class="title">언어 학습데이터</div>
									<div class="info">
										인간의 언어 현상을 컴퓨터와 같은 기계를 
										이용해서 모사 할 수 있도록 연구하고, 
										이를 구현하기 위해 사용하는 언어DB를 
										말합니다.
									</div>
								</div>
								<div class="section">
									<div class="ic"><img src="<c:url value="/images/img-aidata-sound.png" />"></div>
									<div class="title">음성언어 학습데이터</div>
									<div class="info">
										사람의 말을 기계가 이해하고 적절한 
										응답을 다시 사람에게 전달하는 것을 
										목적으로 다양한 환경에서 사람들이 
										발화한 언어DB를 말합니다.
									</div>
								</div>
								<div class="section">
									<div class="ic"><img src="<c:url value="/images/img-aidata-image.png" />"></div>
									<div class="title">객체검출(이미지) 학습데이터</div>
									<div class="info">
										인간의 언어 현상을 컴퓨터와 같은 기계를 
										이용해서 모사 할 수 있도록 연구하고, 
										이를 구현하기 위해 사용하는 언어DB를 
										말합니다.
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- end 구성 -->
				</div>
				<!-- end introduce_wrap -->
			</div>
			<!-- end contents -->
		</div>
	</div>

	<jsp:include page="/footer" flush="false" />

</body>
<script>
	$(document).on("sessionLoad", function() {
		introduce.init();
	});

	var introduce = {
		pt : $("#introduce"),
		init : function() {
			var that = this;
			
			that.listener();
		},

		listener : function() {
			var that = this;

		},
		
	};
</script>