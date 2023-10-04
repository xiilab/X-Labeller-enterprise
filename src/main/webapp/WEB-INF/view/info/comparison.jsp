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
							Comparison
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
								학습을 통해 나온 학습데이터의 Log정보를 읽어오고, 다른 학습 데이터와 비교하는 공간입니다.<br/>
								
							</div>
						</div>
					</div>
					<div class="content">
						<div class="title">
							2.용어설명
						</div>
						<div class="info-section-wrap">
							<div class="info-section">
							
								<img class="border main_img" src="./images/comparison/comparison1.png"></img>
								<div class="text">
									<p><span class="bold">1. Loss Graph : </span>Loss 시각화 그래프</p>
									<p><span class="bold">2. Loss : </span>모델의 예측과 정답 사이에 차이점을 나타내는 값</p>
									<p><span class="bold">3. Regression Loss : </span>예측한 상자와 실제 상자의 위치와 크기의 차이를 나타내는 값(값이 클수록 차이가 크며, 모델에 따라 없을 수도 있습니다.)</p>
									<p><span class="bold">4. Classification Loss : </span>예측한 상자의 분류와 실제 상자의 분류의 차이를 나타내는 값(값이 클수록 차이가 크며, 모델에 따라 없을 수도 있습니다.)</p>
									<p><span class="bold">5. mAP Graph : </span>mAP 시각화 그래프</p>
									<p><span class="bold">6. mAP : </span>예측한 상자들이 실제 상자와 얼마나 유사한지 나타내는 지표(0~1사이의 값을 가지며 1에 가까울 수록 예측의 정확도가 높음을 나타냅니다. mAP의 값이 0.1이여도 inference의 다른 파라미터(confidence_threshold 등)를 조정하여 정확도를 높일 수 있습니다.)</p>
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
	
							<span class="step">Step 1. Log 정보 확인</span>
								<img class="border main_img" src="./images/comparison/comparison_coco.png"></img>
								<div class="text">
									<p>- 학습이 완료된 데이터의 학습 진행사항 확인</p>
								</div>
<!-- 							<span class="step">Step 2. Detail Log정보 확인</span> -->
<!-- 								<img class="border main_img" src="./images/comparison/detail_comparison.png"></img> -->
<!-- 								<div class="text"> -->
<!-- 									<p>2. Detail loss 값을 epoche 별로 확인하고 싶을때 해당 그래프를 클릭후 확인</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
							
							<span class="step">Step 2. 다른 데이터와 비교</span>
								<img class="border main_img" src="./images/comparison/comparison2.png"></img>
								<img class="border main_img" src="./images/comparison/comparison3.png"></img>
								<div class="text">
									<p>- 비교하고자 하는 다른 학습데이터와 같이 확인 가능</p>
								</div>
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
