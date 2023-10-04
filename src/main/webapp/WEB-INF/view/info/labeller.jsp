<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
	<title>밀리터리 이미지넷 객체 라벨기</title>
	
	<style>
		.wa { width: auto; }
		#info { height: 100%; overflow: overlay; }
		#info .title-wrap { padding: 60px 0; width: 900px; background: #ffffff; position: sticky; top: 0;  }
		#info .title { display: inline-block; line-height:49px; font-family: OpenSans; font-size: 36px; font-weight: 500; color: #555555; }
		#info .title-tab { margin-top: 9px; border-radius: 2px; border: solid 1px #dedcde; border-right: 0; background-color: #ffffff; font-weight: 500; }
		#info .title-tab li { padding: 6px 16px; border-right: solid 1px #dedcde; cursor: pointer; }
		#info .title-tab li:hover { color: #4c84ff; }
		
		#info .content { margin-bottom: 64px; font-family: NotoSans; font-size: 16px; font-weight: 200; color: #555555; }
		#info .content .title { font-size: 24px; font-weight: 500; }
		#info .content .text {padding: 0 28px; }
		#info .content .bold { font-weight: 500; }
		#info .content .step { font-size: 18px; font-weight: 500; color: #333333; display: inline-block; margin-top: 20px; }
		#info .content .border { width: 898px; border: 1px solid #cbcbcb; margin: 20px 0; }
		#info .content .mb30 { margin-bottom: 30px; }
		#info .content .mb20 { display: block; margin: 0 auto 20px; }
		#info .content .w500 { width: 500px; padding: 20px 0 20px 20px ;  }
		
		#info img.addFile { margin: 0 !important; }
		#info .inline { display: inline-block; }
	</style>
</head>
<body>
	
	<div class="container" id="info">
		<div class="w900">
			<div class="contents">
				<div class="info-wrap">
					<div class="title-wrap">
						<div class="title">
							Labeller
						</div>
						<div class="title-tab kr fr">
							<ul class="flex">
								<li>소개</li>
								<li>용어설명</li>
								<li>사용방법</li>
							</ul>
						</div>
					</div>
					
					<div class="content">
						<div class="title">
							1.소개
						</div>
						<div class="info-section-wrap">
							<div class="info-section">
								모델을 학습하기 위한 학습데이터를 생성하는 단계.<br />
								이미지 데이터를 서버에 업로드 하고, 이미지 별로 학습데이터를 Tag하는 작업을 도와줍니다.
							</div>
						</div>
					</div>
					<div class="content">
						<div class="title">
							2.용어설명
						</div>
						<div class="info-section-wrap">
							<div class="info-section">
								<img class="border" src='<c:url value='/images/labeller/labeller_main2.png' />' alt="terminology">
								<div class="text">
<!-- 									<p><span class="bold">1. Workspace : </span> 'DataSet' 정보가 담겨있는 디렉터리</p> -->
<!-- 									<p><span class="bold">2. Canvas : </span> 'Label' 작업을 하는 영역</p> -->
<!-- 									<p><span class="bold">3. Data List : </span> 작업할 'Data' 선택할 수 있는 기능</p> -->
<!-- 									<p><span class="bold">4. Pannel : </span> 'Label' 작업을 도와주는 기능을 제공하는 영역</p> -->
<!-- 									<p><span class="bold">5. Tag : </span> 선택한 'Layer'의 'Label' 이름 정보</p> -->
<!-- 									<p><span class="bold">6. Collision : </span> 두 'Layer'간에 중첩된 'Label'를 검색 및 삭제하는 기능</p> -->
<!-- 									<p><span class="bold">7. Transfer : </span> 두 'Layer'중 선택한 'Layer'로 모든 'Label' 이동</p> -->
<!-- 									<p><span class="bold">8. Layer : </span> 'Label' 작업을 할 'DataSet'을 선택하는 영역</p> -->
<!-- 									<p><span class="bold">9. Label : </span> 작업한 'Label' 정보가 담겨있는 Object</p> -->
<!-- 									<p><span class="bold">10. Quick Training : </span>해당 DataSet에서 바로 Training을 진행 할 수 있는 기능</p> -->
<!-- 									<p><span class="bold">11. Quick Inference : </span>해당 DataSet에서 바로 Inference을 진행 할 수 있는 기능</p> -->
									<p><span class="bold">1. Workspace : </span> 'DataSet' 정보가 담겨있는 디렉터리</p>
									<p><span class="bold">2. Canvas : </span> 'Label' 작업을 하는 영역</p>
									<p><span class="bold">3. Data List : </span> 작업할 'Data' 선택할 수 있는 기능</p>
									<p><span class="bold">4. Collision : </span> 두 'Layer'간에 모든 이미지에서 중첩된 'Label'를 검색 및 삭제하는 기능</p>
									<p><span class="bold">5. Transfer : </span> 두 'Layer'중 선택한 'Layer'로 모든 'Label' 이동</p>
									<p><span class="bold">6. Quick Training : </span>해당 DataSet에서 바로 학습을 진행 할 수 있는 기능</p>
									<p><span class="bold">7. Quick Inference : </span>해당 DataSet에서 바로 추론을 진행 할 수 있는 기능</p>									
									<p><span class="bold">8. Tag : </span> 선택한 'Layer'의 'Label' 이름 정보</p>
									<p><span class="bold">9. Collision : </span> 두 'Layer'간에 해당 이미지에서 중첩된 'Label'를 검색 및 삭제하는 기능</p>
									<p><span class="bold">10. Layer : </span> 'Label' 작업을 할 'DataSet'을 선택하는 영역</p>
									<p><span class="bold">11. Label : </span> 작업한 'Label' 정보가 담겨있는 Object</p>

								</div>
							</div>
							<div class="info-section">
								<div class="border">
									<div class="text">
										<br/>
										<p><span class="bold">1. DataSet : </span> 'Data', 'Label'를 묶어서 관리하는 단위</p>
										<p><span class="bold">2. Data : </span> 원본 이미지 데이터를 의미하는 단위</p>
										<span class="bold">3. Label : </span> 작업한 'Label' 정보를 의미하는 단위</p>
										<br/>
									</div>
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
								<div class="step">Step 1 : New + (DataSet 만들기)</div>
								<img class="border" src='<c:url value='/images/labeller/create_dataset_labeller2.png' />' alt="upload">
								<div class="text">
									<p><span class="bold">1. New + : </span> [New +] 버튼 클릭</p>
									<p><span class="bold">2. Title : </span> DataSet Title명 입력</p>
									<p><span class="bold">3. Description : </span> DataSet Description 입력</p>
									<p><span class="bold">4. 파일첨부 : </span> 이미지 또는 비디오 파일 또는 ZIP 파일 첨부</p>
									<p><span class="bold">5. Save : </span> DataSet 저장</p>
								</div>
								
								<div class="border">
									<div class="text">
										<p><span class="step">파일첨부</span></p>
										<p><span class="bold">1) Image File</span> - 비교적 적은 양의 Image 등록 시 용이</p>
										<img class="border addFile" src='<c:url value='/images/labeller/labeller_addFile2.png' />' alt="upload">
										<div class="text">
											<p><span class="bold">1. </span> [Attatch] 버튼 클릭 후, 사용자가 원하는 Image File 선택 및 등록</p>
											<p><span class="bold">2. </span> 사용자가 원하는 Image File 선택 후 Drag&Drop으로 등록</p>
										</div>
										<br/>
										<p><span class="bold">2) Video File</span> - 비디오 파일을 등록 시 사용</p>
										<img class="border addFile" src='<c:url value='/images/labeller/labeller_addFile_video2.png' />' alt="upload">
										<div class="text">
											<p><span class="bold">1. </span> [Attatch] 버튼 클릭 후, 사용자가 원하는 Video File 선택 및 등록</p>
											<p><span class="bold">2. </span> 사용자가 원하는 Video File 선택 후 Drag&Drop으로 등록</p>
											<p><span class="bold">* 단, Video File로 등록 시 File 한개씩 등록 가능</span></p>
										</div>										
										<br/>
										<p><span class="bold">3) ZIP File</span> - 비교적 많은 양의 Image 등록 시 용이</p>
										<img class="border addFile" src='<c:url value='/images/labeller/labeller_addFile_zip2.png' />' alt="upload">
										<div class="text">
											<p><span class="bold">1. </span> [Attatch] 버튼 클릭 후, 사용자가 원하는 ZIP File 선택 및 등록</p>
											<p><span class="bold">2. </span> 사용자가 원하는 ZIP File 선택 후 Drag&Drop으로 등록</p>
											<p><span class="bold">* 단, ZIP File로 등록 시 File 한개씩 등록 가능</span></p>
										</div>
									</div>
								</div>
							</div>
							
							<div class="info-section">
								<div class="step">Step 2 : Import</div>
								<img class="border" src='<c:url value='/images/labeller/import_dataset_labeller2.png' />' alt="import">
								<div class="text">
									<p><span class="bold">1. Import : </span> [Import] 버튼 클릭</p>
									<p><span class="bold">2. Title : </span> DataSet Title명 입력</p>
									<p><span class="bold">3. Description : </span> DataSet Description 입력</p>
									<p><span class="bold">4. 파일첨부 : </span> Import할 ZIP 파일 첨부</p>
									<p><span class="bold">5. Duplicate file existence : </span> 중복 파일 처리 방식 선택 </p>
									<p><span class="bold">6. Save : </span> DataSet 저장</p>
								</div>
								<div class="border">
									<div class="text">
										<p><span class="step">Duplicate file existence</span></p>
										<p><span class="bold">1) Create File</span> - 중복 Data, 다른 Link로 중복 생성</p>
										<p><span class="bold">2) Copy Link</span> - 중복 Data, 원본 Data의 Link 복사</p>
									</div>
								</div>
								
							</div>
							
							<div class="info-section">
								<div class="step">Step 3 : Data List</div>
								<img class="border" src='<c:url value='/images/labeller/dataList_dataset_labeller2.png' />' alt="modify">
								<div class="text">
									<p><span class="bold">1. Data List : </span> DataSet 우클릭, [Data List] 메뉴 클릭</p>
									<p><span class="bold">2. Preview : </span> Data 정보 간단하게 확인 가능</p>
									<p><span class="bold">3. Delete : </span> 불필요한 Data들을 선택하여 삭제 가능</p>
									<p><span class="bold">4. Copy : </span> Data 복사</p>
									<p><span class="bold">5. Transfer : </span> Data 이동</p>
									<p><span class="bold">6. Add : </span> Data 추가</p>
								</div>
							</div>
							
							<div class="info-section">
								<div class="step">Step 4 : 라벨 목록</div>
								<img class="border" src='<c:url value='/images/labeller/labelList_dataset_labeller2.png' />' alt="addImg">
								<div class="text">
									<p><span class="bold">1. 라벨 목록 : </span> DataSet 우클릭, [라벨 목록] 메뉴 클릭</p>
									<p><span class="bold">2. Tag : </span> 원하는 Label 클릭, 특정 Label 검색</p>
									<p><span class="bold">3. Label선택 : </span> 수정 할 Label 클릭</p>
<!-- 									<p><span class="bold">4. Label수정 : </span> Label 수정</p> -->
									<p><span class="bold">4. Save : </span> 수정한 Label 정보 저장</p>
								</div>
							</div>
							
							<div class="info-section">
								<div class="step">Step 5 : Modify</div>
								<img class="border" src='<c:url value='/images/labeller/modify_dataset_labeller2.png' />' alt="modify">
								<div class="text">
									<p><span class="bold">1. Modify : </span>수정 할 DataSet 우클릭, [Modify] 메뉴 클릭</p>
									<p><span class="bold">2. Title : </span>수정 할 DataSet Title명 입력</p>
									<p><span class="bold">3. Description : </span>수정 할 DataSet Description 입력</p>
									<p><span class="bold">4. Save : </span>DataSet 저장</p>
								</div>
							</div>
							
							<div class="info-section">
								<div class="step">Step 6 : Add Image</div>
								<img class="border" src='<c:url value='/images/labeller/addImage_dataset_labeller2.png' />' alt="addImg">
								<div class="text">
									<p><span class="bold">1. Add Image : </span>이미지를 추가 할 DataSet 우클릭, [Add Image] 메뉴 클릭</p>
									<p><span class="bold">2. 파일첨부 : </span>추가 할 이미지 또는 비디오 파일 또는 ZIP 파일 첨부</p>
									<p><span class="bold">3. Save : </span>DataSet 저장</p>
								</div>
							</div>
							
							<div class="info-section">
								<div class="step">Step 7 : Replicate</div>
								<div class="border flex">
									<img src='<c:url value='/images/labeller/replicate_labeller2.png' />' alt="replicate">
									<div class="text">
										<p><span class="bold">1. Replicate : </span> DataSet 우클릭, [Replicate] 메뉴 선택</p>
										<p><span class="bold">2. Only Data : </span> Data만 복제 (Label에 대한 정보는 복제되지 않음)</p>
										<p><span class="bold">3. With Label : </span> Data와 Label 같이 복제</p>
									</div>
								</div>
								<div class="clear"></div>
							</div>
							
							<div class="info-section">
								<div class="step">Step 8 : Delete</div>
								<div class="border flex">
									<img src='<c:url value='/images/labeller/delete_labeller2.png' />' alt="delete">
									<div class="text">
										<p><span class="bold">1. Delete : </span> DataSet 우클릭, [Delete] 메뉴 선택</p>
										<p><span class="bold">2. DataSet : </span> 해당 DataSet과 그 안에 있는 모든 정보 삭제</p>
										<p><span class="bold">3. Data : </span> 해당 DataSet 안에 있는 모든 Data, Label 정보 삭제</p>
										<p><span class="bold">4. Label : </span> 해당 DataSet 안에 있는 모든 Label 정보 삭제</p>
									</div>
								</div>
								
							</div>
							
							<div class="info-section">
								<div class="step">Step 9 : Enrichment</div>
								<div class='border fn-wrap mb30'>
									<img class='mb20' src='<c:url value='/images/labeller/enrichment_label_create.png' />' alt="label_create">
									<div class="text">
										<p><span class="bold">1. Label 생성 : </span> Canvas Drag&Drop으로 Label 생성</p>
										<p><span class="bold">2. Label : </span> Label 확인 및 name을 지정</p>
									</div>
								</div>
								<div class='fn-wrap mb30'>
									<div class="border flex">
										<img class='w500' src='<c:url value='/images/labeller/enrichment_label_move.png' />' alt="label_move">
										<div class="text">
											<p><span class="bold">1. Label 이동 : </span><br> Label 선택, Label Drag&Drop으로 Label 이동</p>
										</div>
									</div>
								</div>
								<div class='fn-wrap mb30'>
									<div class="border flex">
										<img class='w500' src='<c:url value='/images/labeller/enrichment_label_size.png' />' alt="label_size">
										<div class="text">
											<p><span class="bold">1. Label 크기 조정 : </span><br> Label 선택, Coords Drag&Drop</p>
										</div>
									</div>
								</div>
								<div class='fn-wrap mb30'>
									<div class="border flex">
										<img class='w500' src='<c:url value='/images/labeller/enrichment_label_copy.png' />' alt="label_copy&paste">
										<div class="text">
											<p><span class="bold">1. Label 복사 : </span> Label 선택, Ctrl + C</p>
											<p><span class="bold">1. Label 붙여넣기 : </span> Ctrl + V</p>
										</div>
									</div>
								</div>
								<div class='fn-wrap mb30'>
									<div class="border flex">
										<img class='w500' src='<c:url value='/images/labeller/enrichment_zoom.png' />' alt="zoom">
										<div class="text">
											<p><span class="bold">Zoom In : </span> Canvas 마우스 휠 다운</p>
											<p><span class="bold">Zoom Out : </span> Canvas 마우스 휠 업</p>
										</div>
									</div>
								</div>
								<div class='fn-wrap mb30'>
									<div class="border flex">
										<img class='w500' src='<c:url value='/images/labeller/enrichment_label_panning.png' />' alt="delete">
										<div class="text">
											<p><span class="bold">Panning : </span> Canvas Alt + Drag&Drop</p>
										</div>
									</div>
								</div>
								<div class='border fn-wrap mb30'>
									<img class='mb20' src='<c:url value='/images/labeller/enrichment_tag.png' />' alt="tag">
									<div class="text">
										<p><span class="bold">1. Tag 검색 : </span> Tag 선택, 선택한 Tag의 Label 정보 출력</p>
									</div>
								</div>
								<div class='border fn-wrap mb30'>
									<img class='mb20' src='<c:url value='/images/labeller/enrichment_label_drag.png' />' alt="label_drag">
									<div class="text">
										<p><span class="bold">1. Label 선택 : </span> Layer이동할 Label 선택 (Ctrl + Click)</p>
										<p><span class="bold">2. Layer 이동 : </span> Label Drag 후 옮길 Layer에 Drop</p>
									</div>
								</div>
							</div>
							<div class="info-section">
								<div class="step">Step 10 : Quick Training</div>
								<div class="fn-wrap mb30">
									<div class="text">
										<img class="border" src='<c:url value='/images/labeller/enrichment_quicktraining.png' />' alt="upload">
										<p><span class="bold">1. Quick Training : </span>Quick Training 설정 팝업 창</p>
										<p><span class="bold">2. Annotation : </span>해당 DataSet의 Label로 자동으로 생성 할 Annotation 이름</p>
										<p><span class="bold">3. Project : </span>Task를 생성 할 Project 선택</p>
										<p><span class="bold">4. Create New Project : </span>Project 생성</p>
										<p><span class="bold">5. Task : </span>자동으로 생성 할 Task 이름</p>
										<p><span class="bold">6. Description : </span>자동으로 생성 할 Task의 설명</p>
										<p><span class="bold">7. Inheritance : </span>이전에 학습된 모델의 정보로 학습 하는 기능</p>
										<p><span class="bold">8. Inheritance Model 선택 : </span>이전의 학습된 모델 선택</p>
										<p><span class="bold">9. Algorithm : </span>학습을 진행 할 알고리즘 선택</p>
										<p><span class="bold">10. Algorithm 설정 : </span>알고리즘 학습 파라미터 설정</p>
										<p><span class="bold">11. 학습 시작 : </span>학습 시작</p>
										<br/>
										<p><span class="bold">Create New Project : </span>새롭게 생성 할 Project의 이름과 설명을 입력 후 새로운 Project를 생성하는 기능</p>
										<img class="border" src='<c:url value='/images/labeller/enrichment_quicktraining_project.png' />' alt="upload">
										<p><span class="bold">Select Checkpoint : </span>이전의 학습된 모델을 선택하는 기능</p>
										<img class="border" src='<c:url value='/images/labeller/enrichment_quicktraining_checkpoint.png' />' alt="upload">
										<p><span class="bold">Training Config : </span>알고리즘의 학습 파라미터를 설정 하는 기능</p>
										<img class="border" src='<c:url value='/images/labeller/enrichment_quicktraining_config.png' />' alt="upload">
										<p><span class="bold"></span>- 설정 확인 후 학습 시작 버튼 클릭으로 Quick Training 시작</p>
									</div>								
								</div>
							</div>
							<div class="info-section">
								<div class="step">Step 11 : Quick Inference</div>
								<div class="fn-wrap mb30">
									<div class="text">
										<img class="border" src='<c:url value='/images/labeller/enrichment_quickinference.png' />' alt="upload">
										<p><span class="bold">1. Output Filename : </span>추론 결과를 저장할 CSV 파일 이름을 설정</p>
										<p><span class="bold">2. Select Task : </span>추론에 사용 할 모델이 있는 Task 선택</p>
										<p><span class="bold">3. Inference Model : </span>추론에 사용 할 모델 선택</p>
										<p><span class="bold">4. 추론 시작 : </span>추론 시작</p>
										<br/>
										<p><span class="bold">Inference Config & Select Checkpoint : </span></p>
										<p><span class="bold"></span>알고리즘의 추론 파라미터를 설정 하는 기능 및 추론에 사용 할 모델을 선택 하는 기능</p>
										<img class="border" src='<c:url value='/images/labeller/enrichment_quickinference_config.png' />' alt="upload">
										<p><span class="bold"></span>- 설정 확인 후 추론 시작 버튼 클릭으로 Quick Inference 시작</p>
										<br/>
										<p><span class="bold">Inference 결과 확인 : </span></p>	
										<img class="border" src='<c:url value='/images/labeller/enrichment_quick_inference_result.png' />' alt="upload">	
										<p><span class="bold"></span>- 해당 DataSet에 추론 결과가 바로 반영 됩니다.</p>		
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
				console.log(this);
				var index = $(this).index();
				
				//var header = that.pt.find(".blank")[0].offsetHeight;
				var header = that.pt.find(".title-wrap")[0].offsetHeight
				var position = that.pt.find(".content").eq(index).position();
				console.log(that.pt.find(".content").eq(index));
				console.log(position.top);
				
				that.pt.animate({scrollTop:position.top - 169 }, 500);
			});
			
		},
		
	}
</script>
