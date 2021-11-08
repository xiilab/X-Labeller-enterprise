<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
	<title>X-labeller</title>
	
	<style>
		#info { height: 100%; overflow: overlay; }
		#info .title-wrap { padding: 60px 0; width: 900px; background: #ffffff; position: fixed;  }
		#info .title { display: inline-block; line-height:49px; font-family: OpenSans; font-size: 36px; font-weight: 500; color: #555555; }
		#info .title-tab { margin-top: 9px; border-radius: 2px; border: solid 1px #dedcde; border-right: 0; background-color: #ffffff; font-weight: 500; }
		#info .title-tab li { padding: 6px 16px; border-right: solid 1px #dedcde; cursor: pointer; }
		#info .title-tab li:hover { color: #4c84ff; }
		#info .blank { height: 169px; }
		
		#info .content { margin-bottom: 64px; font-family: NotoSans; font-size: 16px; color: #555555; font-weight: 200;}
		#info .content .title { font-size: 24px; font-weight: 500; }
		#info .content .text { padding-left: 28px; }
		#info .content .bold { font-weight: 500; }
		#info .content .step { font-size: 18px; font-weight: 500; color: #333333; display: inline-block; margin-top: 20px;}
		#info .content .border { width: 898px; border: 1px solid #cbcbcb; margin: 20px 0; }
		
		#info p {margin-bottom: 10px; }
	</style>
</head>
<body>
	
	<div class="container" id="info">
		<div class="w900">
			<div class="contents">
				<div class="info-wrap">
					<div class="title-wrap">
						<div class="title">
							Setup
						</div>
						<div class="title-tab kr fr">
							<ul class="flex">
								<li>소개</li>
								<li>용어설명</li>
								<li>사용방법</li>
							</ul>
						</div>
					</div>
					<div class="blank"></div>
					
					<div class="content">
						<div class="title">
							1.소개
						</div>
						<div class="info-section-wrap">
							<div class="info-section">
								학습을 진행할 수 있게 GpuNode를 추가 및 설치하는 작업입니다.<br/>
							</div>
						</div>
					</div>
					<div class="content">
						<div class="title">
							2.용어설명
						</div>
						<div class="info-section-wrap">
							<div class="info-section">
								<img class="border main_img" src="./images/setup/setup_setting_install.png"></img>
								<div class="text">
									<p><span class="bold">1. GpuNode List : </span> GpuNode의 추가 및 삭제 가능
									<p><span class="bold">2. Deployment List : </span> GpuNode의 배포상태 리스트
									<p><span class="bold">3. Installment List : </span> GpuNode의 설치상태 리스트
									<p><span class="bold">4. Docker Swarm Join : </span> GpuNode의 Docker Join 상태 리스트</p>
								</div>
							</div>
							<div class="info-section">
							</div>
						</div>
					</div>
					<div class="content">
						<div class="title">
							3.사용방법
						</div>
						<div class="info-section-wrap">
							<div class="info-section">
							
							<span class="step">Step 1. Install</span>
								<img class="border main_img" src="./images/setup/setup_install.png"></img>
								<div class="text">
									<p><span class="bold">1. </span>Install 버튼 클릭</p>
								</div>
							<span class="step">Step 2. Setting & Install</span>
								<img class="border main_img" src="./images/setup/setup_step2.png"></img>
								<div class="text">
									<p>- Node 이름, 비밀번호 및 IP 주소 기재후 추가
									<p>- Docker 에 추가후 Join 시킨 Node의 설치 여부 확인</p>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
</body>
<script>
	$(function() {
		info.init();
	});

	var info = {
		pt: $("#info"),
		init: function(){
			var that = this;

			
			that.listener();
		},
		
		listener: function(){
			var that = this;
			var tt = 0;
			
			that.pt.find(".title-wrap li").off("click").on("click", function(){
				var index = $(this).index();
				
				var header = that.pt.find(".blank")[0].offsetHeight
				var position = that.pt.find(".content").eq(index).position();
				console.log(that.pt.find(".content").eq(index));
				console.log(position.top);
				
				$("#info").animate({scrollTop:position.top - header}, 500);
			});
			
		},
		
	}
</script>