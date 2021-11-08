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
							Algorithm
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
								모델을 학습, 추론하기 위한 알고리즘을 생성하는 공간입니다.<br />
								생성한 알고리즘을 수정, 삭제 및 배포할 수 있습니다.
							</div>
						</div>
					</div>
					<div class="content">
						<div class="title">
							2.용어설명
						</div>
						<div class="info-section-wrap">
							<div class="info-section">
								<img class="border main_img" src="./images/algorithm/algorithm_desc.png"></img>
								<div class="text">
									<p><span class="bold">Workspace : </span> 알고리즘 정보가 담겨있는 디렉터리</p>
									<p><span class="bold">New + : </span> 알고리즘 생성</p>
									<p><span class="bold">Register Algorithm : </span> 알고리즘 생성 페이지</p>
									<p><span class="bold">Detail Algorithm : </span> 생성한 알고리즘 수정, 삭제 및 배포</p>
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
								<span class="step">Step 1: New + (알고리즘 생성)</span>
								<img class="border main_img" src="./images/algorithm/algorithm_new2.png"></img>
								<div class="text">
									<p><span class="bold">1. Title : </span>알고리즘 Title명 입력</p>
									<p><span class="bold">2. Description : </span>알고리즘 Description 입력</p>
									<p><span class="bold">3. Docker Base Image : </span>User Defined 체크 후 원하는 기반이 되는 Docker 이미지 입력</p>
									<p><span class="bold">4. Docker File Command : </span>추가 하고 싶은 Command 만큼 + 버튼 클릭, 이미지를 구성할 Command 입력 후 Type 지정</p>
									<p><span class="bold">5. Algorithm Source Code Upload(ZIP) : </span>등록할 소스 코드를 전체 압축 후 업로드</p>
									<p><span class="bold">6. Train function name : </span>학습 동작을 정의한 함수의 위치</p>
									<p><span class="bold">7. Inference Initialize Function Name : </span>추론 동작을 위한 모델 생성 및 사전 작업 함수의 위치</p>
									<p><span class="bold">8. Inference Function Name : </span>모델의 추론 동작을 정의한 함수의 위치</p>
									<p><span class="bold">9. Define Training Hyperparameters : </span>학습 코드에 필요한 파라미터 만큼 + 버튼 클릭, 파라미터명 입력, Description 입력, Type 지정, Default 값 입력</p>
									<p><span class="bold">10. Define Inference Hyperparameters : </span>추론 코드에 필요한 파라미터 만큼 + 버튼 클릭, 파라미터명 입력, Description 입력, Type 지정, Default 값 입력</p>
									<p><span class="bold">11. Submit : </span>알고리즘 저장</p> 
								</div>							
							</div>
							<div class="info-section">
								<span class="step">Step 2: 알고리즘 삭제, 수정, 배포</span>
								<img class="border main_img" src="./images/algorithm/algorithm_step2.png"></img>
								<div class="text">
									<p><span class="bold">1. Delete : </span>해당 알고리즘을 삭제</p>
									<p><span class="bold">2. Save : </span>원하는 값을 수정하고 소스 코드를 다시 업로드 후 Save 버튼으로 알고리즘 수정</p>
									<p><span class="bold">3. Deploy : </span>해당 알고리즘을 Worker 노드들에게 배포</p>
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