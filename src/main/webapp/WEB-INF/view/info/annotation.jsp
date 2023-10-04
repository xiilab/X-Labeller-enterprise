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
							Annotation
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
								Labeller를 통해 Tag가 완료된 학습데이터를 학습 이전에 Snapshot으로 패키지 하는 기능을 제공합니다.<br/>
								Annotation에서 패키징된 데이터는 추후에 학습할때 학습데이터로 활용됩니다.
							</div>
						</div>
					</div>
					<div class="content">
						<div class="title">
							2.용어설명
						</div>
						<div class="info-section-wrap">
							<div class="info-section">
								<p><span class="bold">Annotation : </span> Labeller를 통해 Tag 된 이미지들을 사용자가 분류해서 패키징해놓은 단위
								<p><span class="bold">Label : </span> Labeller를 통해 Tag 된 이미지의 정보를 담은 단위
								<p><span class="bold">DataSet : </span> Labeller를 통해 생성된 이미지묶음 단위</p>
								
								<p><span class="step">Annotation</span>	
								<img class="border main_img" src="./images/annotation/annotation_main2.png"></img>
								
								<div class="text">
									<p><span class="bold">1. 라벨 목록 : </span>리스트 형태로 나타낸 Label 데이터</p>
									<p><span class="bold">2. Preview : </span> Label 데이터 이미지</p>
									<p><span class="bold">3. Tag : </span> Label 데이터를 Label 데이터의 이름으로 분류한 영역
									<p><span class="bold">4. Label Container : </span> 검색된 Label 데이터의 결과를 담고있는 영역</p>
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
							<span class="step">Step 1. Annotation 생성</span>
								<img class="border main_img" src="./images/annotation/create_annotation2.png"></img>
								<div class="text">
									<p>- Workspace 영역 하단에 [New +] 버튼을 클릭
									<p>- 패키징할 Annotation 데이터의 제목과 설명을 기재
									<p>- 패키징하고자 하는 Label 데이터를 검색</p>
								</div>
							<span class="step">Step 2-1. 검색하기</span>
								<img class="border main_img" src="./images/annotation/search_annotation2.png"></img>
								
								<div class="text">
									<p>- 검색해서 나온 데이터를 전체선택 또는 부분선택후 리스트에 추가</p>
								</div>
							<span class="step">Step 2-2. Filter로 검색하기</span>	
								<img class="border main_img" src="./images/annotation/search2_annotation2.png"></img>
								
								<div class="text">
									<p>- Filter 기능을 이용한 Label 데이터 검색
									<p>- Filter List 안에 있는 DataSet 정보들을 통해서 이미지 검색</p>
								</div>
								
							<span class="step">Step 2-3. Tag로 검색하기</span>	
								<img class="border main_img" src="./images/annotation/search3_annotation2.png"></img>
								
								<div class="text">
									<p>- 전체 검색후 Tag 영역에 분류된 Label 로 검색</p>
								</div>
							
							<span class="step">Step 3. 저장하기</span></p>
								<img class="border main_img" src="./images/annotation/save_annotation2.png"></img>
								
								<div class="text">
									<p>- 라벨 목록 에 포함된 정보들을 확인후 저장
									<p>- 라벨 목록 에는 이미지를 볼수있는 Preview 기능 과 Label 정보가 포함</p>
								</div>
								
							<span class="step">Step 4. 수출하기</span>	
								
								<img class="border main_img" src="./images/annotation/export_annotation2.png"></img>
								
								<div class="text">
									<p>- Workspace 영역에서 수출 할 Annotation 데이터 우클릭 하고 Export 클릭</p>
								</div>
								
								<img class="border main_img" src="./images/annotation/export2_annotation2.png"></img>
								
								<div class="text">
									<p>- 저장하고싶은 폴더에 ZIP파일 형태로 저장, 추후에 Labeller 에서 사용가능
									<p>- ZIP 파일 안에는 JSON 형식의 Label 데이터와 DataSet 이미지들이 포함</p>
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
