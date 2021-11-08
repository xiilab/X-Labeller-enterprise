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
							Trainer
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
								Project 별로 학습 데이터를 관리 및 학습하고 추론 완료된 데이터를 Labeller에 다시 추가해주는 공간입니다.
							</div>
						</div>
					</div>
					<div class="content">
						<div class="title">
							2.용어설명
						</div>
						<div class="info-section-wrap">
							<div class="info-section">
							
								<p><span class="bold">Annotation : </span>Labeller를 통해 Tag 된 이미지들을 사용자가 분류해서 패키징해놓은 단위</p>
								<p><span class="bold">Project : </span>학습 또는 추론을 할때 사용되는 데이터를 묶어서 분류해놓은 데이터 단위</p>
								<p><span class="bold">Task : </span>학습 또는 추론을 할때 사용되는 단위</p>
								<p><span class="bold">Inheritance : </span>이전의 학습된 모델의 정보로 적은 데이터로 빠르게 학습하는 기능</p>
								
								
	
								
								<p><span class="step">1. Create Task</span></p>
									<img class="border main_img" src="./images/trainer/desc_1_create_task.png"></img>
									
									<div class="text">
										<p><span class="bold">1. Annotation List : </span>리스트형태로 나타낸 Annotation 데이터</p>
										<p><span class="bold">2. Config : </span>학습을 위해 필요한 설정값</p>
										<p><span class="bold">3. Help : </span>각 파라미터에 대한 설명 (마우스 포인터를 올리면 나타남)</p>
										<p><span class="bold">4. Save : </span>Task 생성</p>
									</div>
	
									
								<p><span class="step">2. Training</span></p>
									<img class="border main_img" src="./images/trainer/desc_2_training.png"></img>
									<div class="text">
										<p><span class="bold">1. Label List : </span>리스트형태로 나타낸 Label 데이터</p>
										<p><span class="bold">2. Preview : </span>Label 데이터의 이미지</p>
										<p><span class="bold">3. Config : </span>Task 생성될때 넣은 설정값</p>
										<p><span class="bold">4. Select GPU Node : </span>학습을 진행할 Node와 GPU 선택</p>
										<p><span class="bold">5. Refresh : </span>사용 가능한 Node와 GPU 목록을 새로 불러옴</p>
										<p><span class="bold">6. Start Training : </span>학습 시작</p>
										<p><span class="bold">7. Log 확대버튼 : </span>Log를 큰 팝업창으로 볼 수 있는 버튼</p>
										<p><span class="bold">8. Log : </span>Log를 나타내는 공간</p>
									</div>
									
								<p><span class="step">3. Run Inference</span></p>	
									<img class="border main_img" src="./images/trainer/desc_3_inference.png"></img>
									
									<div class="text">
										<p><span class="bold">1. DATASET LIST : </span>추론이 가능한 DataSet 목록</p>
										<p><span class="bold">2. Preview : </span>DataSet 안에 있는 원본 이미지</p>
										<p><span class="bold">3. Config : </span>추론 설정 값</p>
										<p><span class="bold">4. Output file name : </span>추론 결과를 저장할 CSV 파일 이름을 설정</p>
										<p><span class="bold">5. Select GPU Node : </span>추론을 진행할 Node와 GPU 선택</p>
										<p><span class="bold">6. Download Model : </span>학습으로 생성 된 모델을 다운로드 할 수 있는 기능</p>
										<p><span class="bold">7. MODEL : </span>학습 완료후 생성된 모델</p>
										<p><span class="bold">8. Start Inference : </span>추론 시작</p>
									</div>
									
								<p><span class="step">4. Inference List</span></p>
									<img class="border main_img" src="./images/trainer/desc_4_inference_list.png"></img>	
									<div class="text">
										<p><span class="bold">1. Inference List : </span> 추론이 완료된 Label 데이터를 리스트 형태로 보여줌</p>
										<p><span class="bold">2. Select Label : </span>Add 할 Label 선택</p>
										<p><span class="bold">3. Preview : </span>추론이 완료된 Label 데이터 이미지</p>
										<p><span class="bold">4. Add : </span>선택 한 Label을 해당 DataSet에 추가</p>
										<p><span class="bold">5. Status : </span>추론 진행 상태 (초록색: 진행중, 빨간색: 진행중이지 않음)</p>
										<p><span class="bold">6. Refresh : </span>CSV 파일 목록을 새로 불러옴</p>
										<p><span class="bold">7. CSV : </span>추론 결과에 대한 CSV 파일</p>
										<p><span class="bold">8. Open : </span>CSV 파일을 엶</p>
									</div>
								<p><span class="step">5. Inheritance</span></p>
									<img class="border main_img" src="./images/trainer/desc_5_inheritance.png"></img>
									<div class="text">
										<p><span class="bold">1. </span>이전의 학습된 모델이 있는 Task 우클릭 후 Inheritance 클릭</p>
										<p><span class="bold">2. </span>생성될 Task의 Project 위치 선택</p>
										<p><span class="bold">3. </span>이전의 학습된 모델 선택</p>
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

							<p><span class="step">Step 1. Project 생성</span>	
								<img class="border main_img" src="./images/trainer/method_step1_create_project.png"></img>
								
								<div class="text">
									<p><span class="bold">1. </span>Workspace 영역 하단에 [New +] 버튼 클릭</p>
									<p><span class="bold">2. </span>Project 의 제목과 설명 기재후 저장</p>
								</div>
							<p><span class="step">Step 2. Task 생성</span>	
								<img class="border main_img" src="./images/trainer/method_step2_create_task.png"></img>
								
								<div class="text">
									<p><span class="bold">1. </span>생성된 Project 우클릭 후 Create Task 버튼 클릭</p>
									<p><span class="bold">2. </span>Annotation 영역에서 패키징한 데이터 선택</p>
									<p><span class="bold">3. </span>학습을 진행하기 위한 알고리즘 선택과 해당 알고리즘 학습 파라미터 값 설정</p>
								</div>
								
							<span class="step">Step 3. Training 시작</span>	
								<img class="border main_img" src="./images/trainer/method_step3_training_start.png"></img>
								
								<div class="text">
									<p>- 학습시킬 Task 데이터를 우클릭후 Training 버튼 클릭 또는 Drag&Drop 을 이용</p>
									<p>- 적용된 알고리즘 학습 파라미터 값을 확인</p>
									<p>- Node 와 GPU 선택</p>
									<p>- Start Training 버튼으로 학습 시작</p>
									<p>- 학습에 대한 진행도는 Log 데이터를 통해 확인 가능</p>
								</div>
							
							<span class="step">Step 4. Inference 시작</span>	
								<img class="border main_img" src="./images/trainer/method_step4_inference_start.png"></img>
								
								<div class="text">
									<p>- 학습이 완료된 Task에 우클릭 후 Run Inference 버튼 클릭</p>
									<p>- 추론할 DataSet 데이터를 Drag&Drop 으로 추가</p>
									<p>- 추론 파라미터 값 설정</p>
									<p>- Node 와 GPU 선택 </p>
									<p>- 추론에 사용할 학습이 완료 된 모델 선택</p>
									<p>- Start Inference 버튼으로 추론 시작</p>
								</div>
								
							<span class="step">Step 5. Inference 결과</span>
								<img class="border main_img" src="./images/trainer/method_step5_inference_result.png"></img>
								
								<div class="text">
									<p>- 추론이 완료된 Task를 우클릭 후 Inference List 버튼 클릭</p>
									<p>- 추론 결과에 대한 CSV 파일을 열고 Labeller에 추가할 Label 데이터를 선택 후 Add 버튼 클릭</p>
								</div>		
								
							<span class="step">Step 6. Labeller 확인</span>	
								<img class="border main_img" src="./images/trainer/method_step6_labeller_confirm.png"></img>
								
								<div class="text">
									<p>- 추론 결과에서 선택한 Label이 해당 DataSet에 추가 된 것을 확인</p>
								</div>
								
							<span class="step">Step 7. Inheritance</span>		
								<img class="border main_img" src="./images/trainer/method_step7_inheritance.png"></img>
								
								<div class="text">
									<p>- 이전의 학습된 모델의 정보로 빠르게 학습하는 기능</p>
									<p>- Inheritance Task를 생성할 상위 Project 위치 지정</p>
									<p>- Inheritance 로 생성 할 Task 제목과 설명 입력</p>
									<p>- 학습에 사용할 Annotation 선택</p>
									<p>- 학습 파라미터 조정</p>
									<p>- 이전의 학습된 모델 선택 후 Task 생성</p>
									<p>- 생성된 Task에서 기존 Training과 동일하게 진행</p>
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