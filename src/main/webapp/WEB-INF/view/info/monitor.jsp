<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
	<title>밀리터리 이미지넷 객체 라벨기</title>
	
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
							Monitor
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
								현재 동작 중인 Project/Task들을 보여 주는 공간 입니다.
							</div>
						</div>
					</div>
					<div class="content">
						<div class="title">
							2.용어설명
						</div>
						<div class="info-section-wrap">
							<div class="info-section">
								<img class="border main_img" src="./images/monitor/monitor.png"></img>
								<div class="text">
									<p><span class="bold">1. PROJECT TITLE : </span>Project의 이름</p>
									<p><span class="bold">2. TASK TITLE : </span>Task의 이름</p>
									<p><span class="bold">3. Type : </span>어떤 작업이 진행 중인지 알려줍니다. 학습:Training, 추론:Inference</p>
									<p><span class="bold">4. STATUS : </span>작업의 현재 상태를 알려줍니다.</p>
									<p><span class="bold">5. KILL : </span>작업을 종료 할 수 있게 해줍니다.</p>								
								</div>
							</div>
						</div>
					</div>
					<div class="content">
						<div class="title">
							3.사용방법
						</div>
						<div class="info-section-wrap">
							<div class="info-section">
								<img class="border main_img" src="./images/monitor/monitor_2.png"></img>							
								<div class="text">
									<span class="step">Step 1. 현재 동작중인 Project/Task 정보 확인</span>
									<p><span class="bold"></span>- 어떤 Project의 어떤 Task가 어떤 작업으로 동작중이고, 현재 상태는 무엇인지 확인합니다.</p>								
								</div>							
							</div>
							<div class="info-section">
								<div class="text">
									<span class="step">Step 2. 작업 종료</span>
									<p><span class="bold"></span>- 종료하고자 하는 Project/Task의 Kill 버튼을 클릭하여 작업을 종료합니다.</p>								
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
