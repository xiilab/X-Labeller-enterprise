<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>

<title>X-labeller</title>

<style>


/* 공통 */
#task_detail {width: 100%; height: 100%;}
#task_detail .ms_wrap  {width: 100%; margin-top: 23px;}
#task_detail .table_body{max-height: calc(100% - 206px); overflow-y: overlay; overflow-x:hidden; }

#task_detail .hover_box {border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
#task_detail .hover_box div {font-family: Open_Sans; font-size: 13px; color: #555555;}
#task_detail .hover_div div {word-break: break-word; margin: 2px 5px; white-space: normal; font-weight: 300; font-family: Open_Sans;}
#task_detail .hover_div {max-width: 264px; text-align: left; position: relative; }
#task_detail .hover_box {max-width: 264px; text-align: left; }
/* 메인 */

#task_detail .main_wrap {width: 60%; height: 100%; overflow: overlay; posiiton:relative;}
#task_detail .main_title {display: block; font-family: Open_Sans; font-size: 12px;font-weight: 400; color: #343434;}
#task_detail .detail_title { width: 980px; margin-top : 20px; display: block;font-family: Open_Sans; font-size: 20px; color: #343434;}
#task_detail .detail_contents { width: 980px; margin-top : 8px; display: block; font-family: Open_Sans; font-size: 12px; color: #797a7c; width: 720px;}
#task_detail .anno_wrap > input { width: 900px; border-width: 0; padding: 0; font-weight: 300;}

#task_detail .main_wrap .list_wrap {height: calc(100% - 149px); position: relative;}
#task_detail .main_wrap .horizontal_line {width: 100%; height: 1px; background-color: #e7e7e7; margin: 24px 0 0 0; display:inline-block;}

#task_detail .main_wrap .list_wrap span {margin: 22px 0 24px; float: left; font-family: Open_Sans;font-size: 14px;font-weight: 400; color: #343434;}
#task_detail .main_wrap .list_wrap .list_total {float: right; }

#task_detail table.anno_table td {cursor: default;}

#task_detail .main_wrap .list_wrap table tbody tr .preview .img_preview {cursor: pointer; border: 1px solid #979797; position: relative; margin: auto;  border-radius: 2px; background-size: 14px; width: 28px ; height: 28px; background-color: rgba(0, 0, 0, 0.1); background-image: url('./images/icon_preview_normal.png'); background-repeat: no-repeat; background-position: center; position: relative;}
#task_detail .main_wrap .list_wrap table tbody tr .preview .img_preview:hover { background-image: url('./images/icon_preview_hover.png'); border: 1px solid #4c84ff;}
#task_detail .main_wrap .list_wrap table tbody tr .preview .show_img{ z-index: 1; display: none; align-items: center; justify-content: center; flex-direction: column;  border-radius: 1px ; border : 1px solid #dadada;  top: -30px; left: 130%;  width: 120px;height: 90px;box-shadow: 0 5px 9px -1px rgba(0, 0, 0, 0.16); background-color: #ffffff;}
#task_detail .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap{ z-index: 99; display: none;   border-radius: 1px ; border : 1px solid #dadada;  top: -30px; left: 130%;  width: 294px;height: 248px; box-shadow: 0 5px 9px -1px rgba(0, 0, 0, 0.16); background-color: #ffffff}
#task_detail .main_wrap .list_wrap table tbody tr .preview .img_preview.selected .normal_img_wrap{display: block;}
#task_detail .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap .title_wrap {height: 28px; }
#task_detail .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap .title_wrap .image{margin-left: 12px; background-image: url('./images/icon_preview_hover.png'); background-repeat: no-repeat; width: 12px; height: 12px; }
#task_detail .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap .title_wrap .title{overflow: hidden; white-space: nowrap; text-overflow: ellipsis;max-width: 254px; margin-right:12px; margin-left: 4px; font-weight: 400; font-family: Open_Sans; font-size: 12px; color: #555555; }
#task_detail .main_wrap .list_wrap table tbody tr .preview .normal_img_wrap .frame_container {display:flex; height:219px; align-items: center; justify-content: center; flex-direction: column; border-top: 1px solid #dadada;}


/* 서브 */
#task_detail .sub_wrap {width: 40%; height: 100%; background-color: #f5f5f5; overflow-y: overlay; overflow-x: hidden; position:relative;}
#task_detail .sub_title {display: inline-block;  font-family: Open_Sans; font-size: 12px;color: #343434; font-weight: 400;}

/* #task_detail .sub_wrap .box_wrap {margin-top: 17px; min-height: 347px; } */
#task_detail .sub_wrap .box_wrap {margin-top: 17px; margin-bottom: 17px; padding: 15px; }
#task_detail .sub_wrap .box_wrap.border { border: 1px solid #dedcde; }
#task_detail .sub_wrap .box_wrap .input_wrap { margin-bottom: 12px; padding-top: 5px; }
/* #task_detail .sub_wrap .box_wrap .input_wrap:nth-child(6) {margin-bottom : 17px;}
#task_detail .sub_wrap .box_wrap .input_wrap:nth-child(7) {margin-bottom : 29px;} */
#task_detail .sub_wrap .box_wrap .input_wrap > label {margin-right: 27px; float: left; width: 180px; font-family: Open_Sans; font-size: 12px;  color: #343434;  font-weight: 300;}
#task_detail .sub_wrap .box_wrap .input_wrap > input { border: 1px solid #dedcde; border-radius:2px; width: calc(100% - 172px); height: 32px; background-color: #f9f9f9; color: #999999; padding: 0 11px ; font-family: Open_Sans; margin-bottom: -11px; }

#task_detail input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button { -webkit-appearance: none; margin: 0; }

#task_detail .sub_wrap .check_box_wrap {width:calc(100% - 148px); margin-bottom: -11px; }

#task_detail .sub_wrap .check_box_wrap .check_box > label { font-family: Open_Sans; font-size: 13px;font-weight: 300; color: #616263; margin-left: 19px; }
#task_detail .sub_wrap .check_box_wrap .check_box:last-child { margin-bottom: 0; }
#task_detail .sub_wrap .check_box_wrap .check_box {margin-bottom: 15px;}



#task_detail .sub_wrap .btn_wrap {text-align: center; margin-bottom: 28px;}
#task_detail .sub_wrap .btn_wrap .run_btn {border-radius:4px; padding: 0; width: 280px; height: 40px; box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2); font-family: Open_Sans; font-size: 12px;font-weight: 300; color: #ffffff;}

#task_detail .btn_wrap .run_btn.on {background-color: #ff5a4c;}
#task_detail .btn_wrap .run_btn.off {background-color: #4c84ff;}
#task_detail .btn_wrap .run_btn.pending {background-color: #999999;  cursor: not-allowed; pointer-events: none;}
#task_detail .btn_wrap .run_btn.off:hover {background-color: #3A71E9; }
#task_detail .btn_wrap .run_btn.on:hover {background-color: #dc463a; }


#task_detail .sub_wrap .log_place {width: 100% ; min-height: 260px; height: calc(100% - 519px); background-color: #e8e8e8; position:relative;}
#task_detail .margin {margin: 0 43px;}
#task_detail .sub_wrap .log_place .margin {height: 100%;}
#task_detail .sub_wrap .log_place span {position: relative;  font-family: Open_Sans; font-size: 13px;font-weight: 400;color: #555555; padding-top:23px; display: inline-block;}
#task_detail .sub_wrap .log_place .log_wrap { width: 100%; min-height: 100px; height: calc(100% - 160px); position: absolute;}
#task_detail .sub_wrap .log_place .log_wrap .log_area {border-radius: 2px; width: 100%; height: 100%; overflow:scroll; display: block; word-wrap:break-word;  background-color: #ffffff; font-size:13px; color: #555555; font-family: Open_Sans;}
#task_detail .sub_wrap .log_place .log_wrap pre {margin: 0; background-color: #e8e8e8; height: 100%; width: 100%; }

#task_detail .sub_wrap .log_place .log_size{ width: 100% ; height: 100%; position:relative;}

#task_detail .sub_wrap .defaultBtn {display:inline-block; width: 14px; height: 14px; background-color: #f5f5f5;}
#task_detail .sub_wrap .defaultBtn.selected {background: url("./images/icon_comparison_check.png") no-repeat center;}
#task_detail .gpu_node_list_wrap { width: 100%; text-align: center;}
#task_detail table.gpu_table th { border-top: 2px #3a3b3d solid; background-color: #fafafa; height: 44px; font-size: 11px; font-weight: 400; color: #333333; }
#task_detail table.gpu_table th, table.gpu_table tr, table.gpu_table td { text-align: center; border-bottom: 1px solid #e5e5e5; border-collapse: collapse; border-spacing: 0; }
#task_detail .table_body table.gpu_table { width: 100%; font-family: Open_Sans; font-size: 12px; color: #343434; font-weight: 300; border-collapse: collapse; }
#task_detail .table_body table.gpu_table tr:hover { background-color: #f4fcfe; }
#task_detail .table_body table.gpu_table td { padding-top: 3px; padding-bottom: 3px; }
#task_detail .table_header table.gpu_table { width: 100%; margin-top: 15px; border-collapse: collapse; }
/* #task_detail .sub_wrap .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
#task_detail .sub_wrap .table_body {max-height: 340px; overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; }
#task_detail .checkBtn { display:inline-block; width: 16px; height: 16px; background: url("${pageContext.request.contextPath}/resources/images/icon_gpu_check.png") no-repeat center; }

#task_detail .gpu_reset { width: 45px; height: 15px; border-radius: 5px; cursor: pointer; font-size: 12px; display: inline-block; text-align: center; margin: 0 auto; padding:5px; background-color: #4c84ff; color: #fff; line-height: 15px; margin-left: 15px; }
#task_detail .gpu_reset:hover { background-color: #3A71E9; }

#task_detail .tooltip_wrap { width: 17px; height: 17px; display: inline-block; cursor: pointer; margin: 0 5px; position: relative; top: 4px; background: url("${pageContext.request.contextPath}/resources/images/btn_help_nor.png") no-repeat; }
#task_detail .tooltip { width: 352px; padding: 10px 12px 10px 12px; color: #fff; background-color: rgba(0, 0, 0, 0.6); -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; font: 400 12px system-ui; position: absolute; z-index: 9999; left: 36.5%; padding-left: 12px; visibility: hidden; opacity: 0; transition: visibility 0s, opacity 0.3s ease; margin-bottom: -11px; }
#task_detail .tooltip.on { width: 352px; padding: 10px 12px 10px 12px; color: #fff; background-color: rgba(0, 0, 0, 0.6); -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; font: 400 12px system-ui; position: absolute; z-index: 9999; left: 36.5%; padding-left: 12px; visibility: visible; opacity: 1; transition: visibility 0s, opacity 0.3s ease; }

#task_detail .help_btn { width: 17px; height: 17px; display: inline-block; cursor: pointer; margin: 0 5px; position: relative; top: 4px; background: url("${pageContext.request.contextPath}/resources/images/btn_help_nor.png") no-repeat; }
#task_detail .help_tooltip { width: 352px; padding: 10px 12px 10px 12px; color: #fff; background-color: rgba(0, 0, 0, 0.6); -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; font: 400 12px system-ui; position: absolute; z-index: 9999; left: 22%; padding-left: 12px; visibility: hidden; opacity: 0; transition: visibility 0s, opacity 0.3s ease; }
#task_detail .help_tooltip.on { width: 352px; padding: 10px 12px 10px 12px; color: #fff; background-color: rgba(0, 0, 0, 0.6); -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; font: 400 12px system-ui; position: absolute; z-index: 9999; left: 20%; top: 70%; padding-left: 12px; visibility: visible; opacity: 1; transition: visibility 0s, opacity 0.3s ease; }

#task_detail .algorithm_name { font: 400 11px system-ui !important; color: #777 !important; }
#task_detail .icon_expand { width: 16px; height: 16px; padding-top: 0!important; padding-left: 15px; top: 4px; cursor: pointer; background: url("${pageContext.request.contextPath}/resources/images/icon-expand-small.png") no-repeat center; }
/* #task_detail .log_expand { width: 820px; height: 600px!important; background-color: #fff; border: 1px solid #333; position: absolute; z-index: 999; } */

#task_detail .log_expand { width: 820px; height: 700px!important; padding: 10px; position: absolute; z-index: 999999; border: 1px solid #dedede; top: 3%; right: 5%; background-color: #eee; display: none; box-shadow: 2px 2px #c4c4c4; }
#task_detail .log_expand.active { display: block; }
#task_detail .error_log { width: 96%; height: 91%; padding: 10px; background-color: #fff; }
#task_detail .log_close { font-size: 20px; font-weight: 400; color: #343434; float: right; cursor: pointer; margin: -4px 28px 0 0; }

#task_detail .log_expand .log_wrap { width: 100%; min-height: 100px; height: calc(100% - 60px); position: absolute;}
#task_detail .log_expand .log_title { font: 400 13px Open_Sans; color: #555; display: inline-block; }
#task_detail .log_expand .log_wrap .log_area {border-radius: 2px; width: 100%; height: 100%; overflow:scroll; display: block; word-wrap:break-word;  background-color: #ffffff; font-size:13px; color: #555555; font-family: Open_Sans;}
#task_detail .log_expand .log_wrap pre {margin: 3px 0 0 0; height: 100%; width: 97.7%; }
</style>

</head>
<body>

	<div class="container" id="task_detail">

		<div class="contents flex">
			<div class="main_wrap">
				<div class="title_wrap ms">
					<div class="ms_wrap">
						<span class="main_title">Training Task</span>
						<div class="flex">
							<div class="anno_wrap">
								<input class="detail_title" placeholder="제목을 입력해주세요" disabled>
								<input class="detail_contents" placeholder="내용을 입력해주세요" disabled>
							</div>
						</div>
					</div>
				</div>

				<div class="horizontal_line"></div>

				<div class="list_wrap ms">
					<span class="list_title">Label List</span>
					<span class="list_total">Total 0</span>
					<div class="table_header">
						<table class="anno_table">
							<colgroup>
								<col style="width: 89px;"></col>
								<col style=""></col>
								<col style="width: 61px;"></col>
								<col style="width: 61px;"></col>
								<col style="width: 61px;"></col>
								<col style="width: 61px;"></col>
								<col style="width: 85px;"></col>
							</colgroup>
							<thead>
								<tr>
									<th class="pre">PREVIEW</th>
									<th>PATH</th>
									<th>X_1</th>
									<th>Y_1</th>
									<th>X_2</th>
									<th>Y_2</th>
									<th>LABEL</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table_body">
						<table class="anno_table">
							<colgroup>
								<col style="width: 89px;"></col>
								<col style=""></col>
								<col style="width: 61px;"></col>
								<col style="width: 61px;"></col>
								<col style="width: 61px;"></col>
								<col style="width: 61px;"></col>
								<col style="width: 85px;"></col>
							</colgroup>
							<tbody></tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="sub_wrap filter_color">
				<div class="margin">

					<div class="ms_wrap ">
						<span class="sub_title">Training Hyperparameter</span>
						<span class="algorithm_name"></span>
						<div class="box_wrap border">
<!-- 							<div class="input_wrap flex">
								<label>steps</label><input type="text" name="first"
									value="1000" disabled>
							</div>
							<div class="input_wrap flex">
								<label>epochs</label><input type="text" name="second"
									value="20" disabled>
							</div>
							<div class="input_wrap flex">
								<label>minimum side</label><input type="text" name="third"
									value="800" disabled>
							</div>
							<div class="input_wrap flex">
								<label>maximum side</label><input type="text" name="fourth"
									value="1333" disabled>
							</div>
							<div class="input_wrap flex">
								<label>backbone</label><input type="text" name="fifth"
									value="resnet50" disabled>
							</div>
							<div class="input_wrap flex">
								<label>gpu</label><input type="text" name="sixth" value="0"
									disabled>
							</div>
							<div class="input_wrap flex">
								<label></label>
								<div class="check_box_wrap">
									<div class="check_box flex">
										<div class="defaultBtn first"></div>
										<label>use random transform</label>
									</div>
									<div class="check_box second flex">
										<div class="defaultBtn second"></div>
										<label>use freeze backbone</label>
									</div>

									<div class="check_box third flex">
										<div class="defaultBtn third"></div>
										<label>retina net</label>
									</div>
								</div>
							</div> -->
						</div>
						
                        <span class="sub_title">Select GPU Node</span>
                        <div class="gpu_reset">Refresh</div>	
                 <!--        <span class="list_total">Total 0</span> -->
                        <div class="list_wrap">
                            <div class="table_header">
                                <table class="gpu_table">
                                    <colgroup>
                                        <col style="width:200px;"></col>
                                        <col style="width:200px;"></col>
                                        <col style="width:200px;"></col>
                                        <col style="width:45px;"></col>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>GPU NODE</th>
                                            <th>DRIVER</th>
                                            <th>STATUS</th>
                                            <th><div class="checkBtn"></div></th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                            <div class="table_body">
                                <table class="gpu_table">
                                    <colgroup>
                                        <col style="width:200px;"></col>
                                        <col style="width:200px;"></col>
                                        <col style="width:200px;"></col>
                                        <col style="width:45px;"></col>
                                    </colgroup>
                                    <tbody>
<!--                                     <tr><td colspan='4' align='center'>Loading GPU list...</td></tr> -->
                                    </tbody>
                                </table>
                            </div>
                        </div>						
						<div class="btn_wrap">
							<button class="run_btn off">Start Training</button>
<!-- 							<span class="help_btn"></span> -->
<!-- 							<span class="help_tooltip">데이터가 10개 미만일 경우 평가 지표가 계산되지 않을 수 있습니다.</span> -->
						</div>
					</div>

				</div>
				<div class="log_place">
					<div class="margin ">
						<div class="log_size">
							<span>Log</span>
							<span class="icon_expand"></span>
							<div class="log_wrap">
								<pre>
									<div class="log_area"></div>
								</pre>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="log_expand">
				<div class="log_wrap">
					<span class="log_title">Log</span>
					<span class="log_close">&times;</span>
					<pre>
						<div class="log_area"></div>
					</pre>
				</div>
			</div>
		</div>

	</div>
</body>


<script>
	$(document).on("sessionLoad", function() {
		
	});

// 	var task_id;						// jh.sa 210208 task_id => that.data.taskId
// 	var start_pos;						// jh.sa 210208 start_pos => that.data.startPos
// 	var interval;						// jh.sa 210208 interval => that.data.interval
// 	var canvas;							// jh.sa 210208 canvas => that.data.canvas
// 	var canvas_hover;					// jh.sa 210208 canvas_hover => that.data.canvasHover
// 	var colorHash = new ColorHash();	// jh.sa 210208 colorHash => that.data.colorHash
// 	var scaleFactor;					// jh.sa 210208 scaleFactor => that.data.scaleFactor
	
// 	var initial_pos;					// jh.sa 210208 initial_pos => that.data.initialPos
// 	var area;							// jh.sa 210208 area => that.data.logArea
// 	var isZero;							// jh.sa 210208 isZero => that.data.isZero
// 	var back_size = 99999;				// jh.sa 210208 back_size => that.data.backSize
// 	var log_size = 99999;				// jh.sa 210208 log_size => that.data.logSize
	
	//scroll
// 	var guid = "";						// jh.sa 210216 guid => that.data.guid
// 	var bh;								// jh.sa 210216 bh => that.data.bh
// 	var ah;								// jh.sa 210216 ah => that.data.ah
// 	var isPrepend = false;				// jh.sa 210216 isPrepend => that.data.isPrepend
// 	var isScrollEnd = false;			// jh.sa 210216 isScrollEnd => that.data.isScrollEnd
// 	var isInit = false;					// jh.sa 210216 isInit => that.data.isInit
// 	var startTraining = false;			// jh.sa 210216 startTraining => that.data.startTraining
// 	var tempData = "";					// jh.sa 210216 tempData => that.data.tempData
// 	var currentState;					// jh.sa 210216 currentState => that.data.currentState
// 	var btn_interval;					// jh.sa 210216 btn_interval => that.data.btnInterval
// 	var start_timeout;					// jh.sa 210216 start_timeout => that.data.startTimeout
// 	var btn_click;						// jh.sa 210216 btn_click => that.data.btnClick
	
// 	var append_length;					// 사용 안함
// 	var prepend_length;					// 사용 안함
	
// 	var first_arr;						// jh.sa 210216 first_arr => that.data.firstArr
// 	var last_arr;						// jh.sa 210216 last_arr => that.data.lastArr
	
	//트레이닝 시작 버튼
// 	var run_btn;						// jh.sa 210216 run_btn => that.data.runBtn
	
	
	//스크롤에 사용
// 	var label_arr = [];					// jh.sa 210216 label_arr => that.data.labelArr
// 	var label_obj = {};					// 사용 안함
// 	var scrollObj = {					// jh.sa 210216 scrollObj => that.data.scrollObj
// 			scroll_start:0,
// 			scroll_end:0,
// 			isScroll_top:0,
// 			isScroll_end:0,
// 			isScroll : false,
// 			default_size : 40,
// 			half_size : (40 / 2)
// 	}
	
	// algorithm
// 	var train_param_arr = [];			// 사용 안함
// 	var train_param_obj = {};			// 사용 안함 
	
	
// 	var first_data_result = "";			// 사용 안함
	
	var task_detail = {
		pt : $("#task_detail"),
		data : {
			labelType : null,
			taskId : null,
			startPos : null,
			initialPos : null,
			interval : null,
			canvas : null,
			canvasHover : null,
			colorHash : null,
			scaleFactor : null,
			logArea : null,
			isZero : false,
			backSize : 99999,
			logSize : 99999,
			guid : null,
			bh : null,
			ah : null,
			isPrepend : false,
			isScrollEnd : false,
			isInit : false,
			startTraining : false,
			tempData : null,
			currentState : null,
			btnInterval : null,
			startTimeout : null,
			btnClick : null,
			firstArr : null,
			lastArr : null,
			runBtn : null,
			labelArr : [],
			labelObj : {},
			scrollObj : {
					scroll_start:0,
					scroll_end:0,
					isScroll_top:0,
					isScroll_end:0,
					isScroll : false,
					default_size : 40,
					half_size : (40 / 2)					
			},
			
		},
		
		init : function(id) {
			let that = task_detail;
// 			task_id = id;
// 			start_pos = 0;
			that.data.taskId = id;
			that.data.startPos = 0;
			that.resetView();
		},
		
		resetView : function() {
			var that = task_detail;
			var btn_interval = that.data.btnInterval;
			var start_timeout = that.data.startTimeout;
			
			if(btn_interval != null){
				clearInterval(btn_interval);
			}
			if(start_timeout != null){
				clearTimeout(start_timeout)
			}
			that.data.currentState = null;
			that.data.btnClick = false;
			that.pt.find(".table_body").off("scroll");
			that.pt.find(".table_body").scrollTop(0);
			$("#task_detail").find(".table_body .gpu_table tbody").html("");
			$("#task_detail").find(".table_body .gpu_table tbody").append("<tr><td colspan='4' align='center'>Loading GPU list...</td></tr>");			
			//that.pt.find(".table_body tbody").html("");
			that.logAreaExpand();
			that.data.runBtn = that.pt.find(".btn_wrap .run_btn");
			that.getTrainStatus();												// 막아둠 
			that.data.btnInterval = setInterval(that.getTrainStatus, 5000);				// 막아둠
			that.data.firstArr = null;
			that.data.lastArr = null;
			// area = that.pt.find(".log_area");
			that.data.logArea = that.pt.find(".log_area");
			that.data.startTraining = true;
			that.data.guid = that.guid();
			that.resetLogData();
			that.pt.find(".list_total").text("Total 0");
			that.pt.find(".sub_wrap .box_wrap").html("");
			
			// helper 툴팁(training button) 		
// 			let help_tooltip_wrap = that.pt.find(".help_btn");
// // 			console.log("help_tooltip_wrap:: ", help_tooltip_wrap);
// 			help_tooltip_wrap.off("click").on("click", function() {
// 				let tooltip = $(this).next(".help_tooltip");
// 				tooltip.toggleClass("on");
// 			});
// 			help_tooltip_wrap.off("mouseleave").on("mouseleave", function() {
// 				let tooltip = $(this).next(".help_tooltip");
// 				tooltip.removeClass("on");						
// 			})

// 			setInterval(that.test,1000)
// 			that.test();
			
			that.getTaskById();
// 			that.drawGpuNodeList();
			that.getSelectableGpuNode();
			
			let gpu_reset = $("#task_detail").find(".gpu_reset");
			gpu_reset.off("click").on("click", function() {
				that.getSelectableGpuNode();
			});			
		},
		
		test : function(){

			let that = task_detail;
			
// 			let data = "첫번째 줄\n"+"두번째 줄\n";
			
			let data = "2020-06-16 19:25:58,425 < start train >\n"+
				"2020-06-16 19:25:58,425 < start train >\n"+
				"2020-06-16 19:25:58,662 Loading base network...\n"+
				"2020-06-16 19:25:58,758 load pretrain backend model\n"+
				"2020-06-16 19:25:58,759 Loading the dataset...\n"+
				"2020-06-16 19:25:58,759 Using the specified args:\n"+
				"2020-06-16 19:25:58,759 <Parameters.Params object at 0x106654550>\n"+
				"2020-06-16 19:25:58,759 Epoch : 1/5\n"+
				"2020-06-16 19:26:34,660 timer : 3.7531 sec.\n"+
				"2020-06-16 19:26:34,660 iter 1 || Loss : 12.1489 ||\n"+
				"2020-06-16 19:26:34,661 Epoch : 2/5\n"+
				"2020-06-16 19:27:10,746 timer : 3.8680 sec.\n"+
				"2020-06-16 19:27:10,746 iter 2 || Loss : 10.1494 ||\n"+
				"2020-06-16 19:27:10,746 Epoch : 3/5\n"+
				"2020-06-16 19:27:43,345 timer : 3.5590 sec.\n"+
				"2020-06-16 19:27:43,345 iter 3 || Loss : 10.5791 ||\n"+
				"2020-06-16 19:27:43,361 Epoch : 4/5\n"+
				"2020-06-16 19:28:12,731 timer : 3.5350 sec.\n"+
				"2020-06-16 19:28:12,731 iter 4 || Loss : 12.0830 ||\n"+
				"2020-06-16 19:28:12,731 Epoch : 5/5\n"+
				"2020-06-16 19:28:41,704 timer : 3.0305 sec.\n"+
				"2020-06-16 19:28:41,705 iter 5 || Loss : nan ||\n"+
				"2020-06-16 19:28:42,060 < end train >\n";

			
// 			let data = "_branch2b[0][0]\n"+             
// 			"2019-01-31T09:14:20.412592858Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.412596008Z res2c_branch2b_relu (Activation (None, None, None, 6 0           bn2c_branch2b[0][0]              \n"+
// 			"2019-01-31T09:14:20.412599127Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.412602265Z res2c_branch2c (Conv2D)         (None, None, None, 2 16384       res2c_branch2b_relu[0][0]        \n"+
// 			"2019-01-31T09:14:20.412605645Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.412609028Z bn2c_branch2c (BatchNormalizati (None, None, None, 2 1024        res2c_branch2c[0][0]             \n"+
// 			"2019-01-31T09:14:20.419175767Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.419178699Z C5_reduced (Conv2D)             (None, None, None, 2 524544      res5c_relu[0][0]                 \n"+
// 			"2019-01-31T09:14:20.419180537Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.419182370Z P5_upsampled (UpsampleLike)     (None, None, None, 2 0           C5_reduced[0][0]                 \n"+
// 			"2019-01-31T09:14:20.419184207Z                                                                  res4f_relu[0][0]                 \n"+
// 			"2019-01-31T09:14:20.419186051Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.419187867Z C4_reduced (Conv2D)             (None, None, None, 2 262400      res4f_relu[0][0]                 \n"+
// 			"2019-01-31T09:14:20.419189713Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.419191535Z P4_merged (Add)                 (None, None, None, 2 0           P5_upsampled[0][0]               \n"+
// 			"2019-01-31T09:14:20.419193384Z                                                                  C4_reduced[0][0]                 \n"+
// 			"2019-01-31T09:14:20.419195214Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.419197061Z P4_upsampled (UpsampleLike)     (None, None, None, 2 0           P4_merged[0][0]                  \n"+
// 			"2019-01-31T09:14:20.419198890Z                                                                  res3d_relu[0][0]                 \n"+
// 			"2019-01-31T09:14:20.419200734Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.419202573Z C3_reduced (Conv2D)             (None, None, None, 2 131328      res3d_relu[0][0]                 \n"+
// 			"2019-01-31T09:14:20.422259477Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.422279993Z P6 (Conv2D)                     (None, None, None, 2 4718848     res5c_relu[0][0]                 \n"+
// 			"2019-01-31T09:14:20.422282647Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.422284828Z P3_merged (Add)                 (None, None, None, 2 0           P4_upsampled[0][0]               \n"+
// 			"2019-01-31T09:14:20.422286820Z                                                                  C3_reduced[0][0]                 \n"+
// 			"2019-01-31T09:14:20.422288829Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.422290732Z C6_relu (Activation)            (None, None, None, 2 0           P6[0][0]                         \n"+
// 			"2019-01-31T09:14:20.422293108Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.422304957Z P3 (Conv2D)                     (None, None, None, 2 590080      P3_merged[0][0]                  \n"+
// 			"2019-01-31T09:14:20.422315350Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.422320520Z P4 (Conv2D)                     (None, None, None, 2 590080      P4_merged[0][0]                  \n"+
// 			"2019-01-31T09:14:20.422323135Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.422326130Z P5 (Conv2D)                     (None, None, None, 2 590080      C5_reduced[0][0]                 \n"+
// 			"2019-01-31T09:14:20.422339844Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.422341831Z P7 (Conv2D)                     (None, None, None, 2 590080      C6_relu[0][0]                    \n"+
// 			"2019-01-31T09:14:20.422343652Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.422345572Z regression_submodel (Model)     (None, None, 4)      2443300     P3[0][0]                         \n"+
// 			"2019-01-31T09:14:20.422347424Z                                                                  P4[0][0]                         \n"+
// 			"2019-01-31T09:14:20.422349269Z                                                                  P5[0][0]                         \n"+
// 			"2019-01-31T09:14:20.422351132Z                                                                  P6[0][0]                         \n"+
// 			"2019-01-31T09:14:20.422352996Z                                                                  P7[0][0]                         \n"+
// 			"2019-01-31T09:14:20.422355548Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.422357440Z classification_submodel (Model) (None, None, 1)      2381065     P3[0][0]                         \n"+
// 			"2019-01-31T09:14:20.422359291Z                                                                  P4[0][0]                         \n"+
// 			"2019-01-31T09:14:20.422361117Z                                                                  P5[0][0]                         \n"+
// 			"2019-01-31T09:14:20.422362968Z                                                                  P6[0][0]                         \n"+
// 			"2019-01-31T09:14:20.422364838Z                                                                  P7[0][0]                         \n"+
// 			"2019-01-31T09:14:20.422366673Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.422368494Z regression (Concatenate)        (None, None, 4)      0           regression_submodel[1][0]        \n"+
// 			"2019-01-31T09:14:20.422370335Z                                                                  regression_submodel[2][0]        \n"+
// 			"2019-01-31T09:14:20.422372184Z                                                                  regression_submodel[3][0]        \n"+
// 			"2019-01-31T09:14:20.422374091Z                                                                  regression_submodel[4][0]        \n"+
// 			"2019-01-31T09:14:20.422376079Z                                                                  regression_submodel[5][0]        \n"+
// 			"2019-01-31T09:14:20.422377954Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.422380903Z classification (Concatenate)    (None, None, 1)      0           classification_submodel[1][0]    \n"+
// 			"2019-01-31T09:14:20.422382801Z                                                                  classification_submodel[2][0]    \n"+
// 			"2019-01-31T09:14:20.422384662Z                                                                  classification_submodel[3][0]    \n"+
// 			"2019-01-31T09:14:20.422386502Z                                                                  classification_submodel[4][0]    \n"+
// 			"2019-01-31T09:14:20.422388360Z                                                                  classification_submodel[5][0]    \n"+
// 			"2019-01-31T09:14:20.422390201Z ==================================================================================================\n"+
// 			"2019-01-31T09:14:20.422392062Z Total params: 36,382,957\n"+
// 			"2019-01-31T09:14:20.422393845Z Trainable params: 12,821,805\n"+
// 			"2019-01-31T09:14:20.422395621Z Non-trainable params: 23,561,152\n"+
// 			"2019-01-31T09:14:27.226346242Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:27.226371226Z None\n"+
// 			"2019-01-31T09:14:27.226373948Z Epoch 1/1\n"+
// 			"2019-01-31T09:14:27.226375815Z \n"+
// 			"2019-01-31T09:14:27.901958585Z   1/100 [..............................] - ETA: 5:11 - loss: 0.1022 - regression_loss: 0.0000e+00 - classification_loss: 0.1022\n"+
// 			"2019-01-31T09:14:28.672139916Z   2/100 [..............................] - ETA: 3:07 - loss: 0.0975 - regression_loss: 0.0000e+00 - classification_loss: 0.0975\n"+
// 			"2019-01-31T09:14:28.955473140Z   3/100 [..............................] - ETA: 2:28 - loss: 1.1805 - regression_loss: 0.7351 - classification_loss: 0.4454    \n"+
// 			"2019-01-31T09:14:29.216255867Z   4/100 [&gt;.............................] - ETA: 1:56 - loss: 1.7906 - regression_loss: 1.1733 - classification_loss: 0.6173\n"+
// 			"2019-01-31T09:14:29.487019722Z   5/100 [&gt;.............................] - ETA: 1:37 - loss: 1.4527 - regression_loss: 0.9386 - classification_loss: 0.5141\n"+
// 			"2019-01-31T09:14:29.735817141Z   6/100 [&gt;.............................] - ETA: 1:24 - loss: 1.2259 - regression_loss: 0.7822 - classification_loss: 0.4437\n"+
// 			"2019-01-31T09:14:29.959125144Z   7/100 [=&gt;............................] - ETA: 1:15 - loss: 1.5463 - regression_loss: 1.0029 - classification_loss: 0.5435\n"+
// 			"2019-01-31T09:14:30.221659993Z   8/100 [=&gt;............................] - ETA: 1:07 - loss: 1.7986 - regression_loss: 1.1815 - classification_loss: 0.6170\n"+
// 			"2019-01-31T09:14:30.491590296Z   9/100 [=&gt;............................] - ETA: 1:02 - loss: 1.6099 - regression_loss: 1.0503 - classification_loss: 0.5596\n"+
// 			"2019-01-31T09:14:30.742774025Z  10/100 [==&gt;...........................] - ETA: 57s - loss: 1.4580 - regression_loss: 0.9452 - classification_loss: 0.5128 \n"+
// 			"2019-01-31T09:14:30.961666549Z  11/100 [==&gt;...........................] - ETA: 53s - loss: 1.6640 - regression_loss: 1.0948 - classification_loss: 0.5693\n"+
// 			"2019-01-31T09:14:31.228901551Z  12/100 [==&gt;...........................] - ETA: 50s - loss: 1.8207 - regression_loss: 1.2045 - classification_loss: 0.6162\n"+
// 			"2019-01-31T09:14:31.500652311Z  13/100 [==&gt;...........................] - ETA: 47s - loss: 1.6882 - regression_loss: 1.1118 - classification_loss: 0.5764\n"+
// 			"2019-01-31T09:14:31.749532468Z  14/100 [===&gt;..........................] - ETA: 45s - loss: 1.5741 - regression_loss: 1.0324 - classification_loss: 0.5417\n"+
// 			"2019-01-31T09:14:31.974548322Z  15/100 [===&gt;..........................] - ETA: 43s - loss: 1.7083ㅂㅈㄱㅂㅈ - regression_loss: 1.1269 - classification_loss: 0.5813\n"+
// 			"2019-01-31T09:14:32.237911184Z  16/100 [===&gt;..........................] - ETA: 41s - loss: 1.8232 - regression_loss: 1.2073fsdfs - classification_loss: 0.6158\n"+
// 			"2019-01-31T09:14:32.513109047Z  17/100 [====&gt;.........................] - ETA: 39s - loss: 1.7217 - regression_loss: 1.1363 - classification_loss: 0.5854\n"+
// 			"2019-01-31T09:14:32.762636183Z  18/100 [====&gt;.........................] - ETA: 38s - loss: 1.6310 - regression_loss: 1.0732 - classification_loss: 0.5578\n"+
// 			"2019-01-31T09:14:32.983025185Z  19/100 [====&gt;.........................] - ETA: 36s - loss: 1.7220 - regression_loss: 1.1333 - classification_loss: 0.5886\n"+
// 			"2019-01-31T09:14:33.243959997Z  20/100 [=====&gt;........................] - ETA: 35s - loss: 1.8203 - regression_loss: 1.2044 - classification_loss: 0.6159\n"+
// 			"2019-01-31T09:14:33.515125450Z  21/100 [=====&gt;........................] - ETA: 34s - loss: 1.7383 - regression_loss: 1.1471 - classification_loss: 0.5912\n"+
// 			"2019-01-31T09:14:33.763855433Z  22/100 [=====&gt;........................] - ETA: 33s - loss: 1.6633 - regression_loss: 1.0949 - classification_loss: 0.5683\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:34.248966775Z  24/100 [======&gt;.......................] - ETA: 31s - loss: 1.8168 - regression_loss: 1.2012 - classification_loss: 0.6156\n"+
// 			"2019-01-31T09:14:34.520188700Z  25/100 [======&gt;.......................] - ETA: 30s - loss: 1.7480 - regression_loss: 1.1531 - classification_loss: 0.5948\n"+
// 			"2019-01-31T09:14:34.769793507Z  26/100 [======&gt;.......................] - ETA: 29s - loss: 1.6841 - regression_loss: 1.1088 - classification_loss: 0.5753\n"+
// 			"2019-01-31T09:14:34.991444991Z  27/100 [=======&gt;......................] - ETA: 28s - loss: 1.7506 - regression_loss: 1.1544 - classification_loss: 0.5962\n"+
// 			"2019-01-31T09:14:35.250625630Z  28/100 [=======&gt;......................] - ETA: 28s - loss: 1.8137 - regression_loss: 1.1982 - classification_loss: 0.6155\n"+
// 			"2019-01-31T09:14:35.521874360Z  29/100 [=======&gt;......................] - ETA: 27s - loss: 1.7544 - regression_loss: 1.1569 - classification_loss: 0.5975\n"+
// 			"2019-01-31T09:14:35.772116116Z  30/100 [========&gt;.....................] - ETA: 26s - loss: 1.6987 - regression_loss: 1.1183 - classification_loss: 0.5804\n"+
// 			"2019-01-31T09:14:35.989338316Z  31/100 [========&gt;.....................] - ETA: 26s - loss: 1.7565 - regression_loss: 1.1578 - classification_loss: 0.5987\n"+
// 			"2019-01-31T09:14:36.249911047Z  32/100 [========&gt;.....................] - ETA: 25s - loss: 1.8104 - regression_loss: 1.1949 - classification_loss: 0.6155\n"+
// 			"2019-01-31T09:14:36.520786982Z  33/100 [========&gt;.....................] - ETA: 24s - loss: 1.7583 - regression_loss: 1.1587 - classification_loss: 0.5997\n"+
// 			"2019-01-31T09:14:52.588093750Z  97/100 [============================&gt;.] - ETA: 0s - loss: 1.7356 - regression_loss: 1.1237 - classification_loss: 0.6119\n"+
// 			"2019-01-31T09:14:52.836181251Z  98/100 [============================&gt;.] - ETA: 0s - loss: 1.7182 - regression_loss: 1.1123 - classification_loss: 0.6059\n"+
// 			"2019-01-31T09:14:53.055744929Z  99/100 [============================&gt;.] - ETA: 0s - loss: 1.7303 - regression_loss: 1.1180 - classification_loss: 0.6123\n"+
// 			"2019-01-31T09:14:53.055781124Z 100/100 [==============================] - 29s 290ms/step - loss: 1.7459 - regression_loss: 1.1273 - classification_loss: 0.6186\n"+
// 			"2019-01-31T09:15:01.795506545Z \n"+
// 			"2019-01-31T09:15:01.795543942Z Epoch 00001: saving model to /xlabeller/workspace/78/120/model/resnet50_csv_01.h5\n";

// 			let data = " - ETA: 34s - loss: 1.7383 - regression_loss: 1.1471 - classification_loss: 0.5912\n"+
// 			"2019-01-31T09:14:33.763855433Z  22/100 [=====&gt;........................] - ETA: 33s - loss: 1.6633 - regression_loss: 1.0949 - classification_loss: 0.5683\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  23/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:14:33.984676126Z  99/100 [=====&gt;........................] - ETA: 32s - loss: 1.7415 - regression_loss: 1.1484 - classification_loss: 0.5931\n"+
// 			"2019-01-31T09:15:01.795543942Z Epoch 00001: saving model to /xlabeller/workspace/78/120/model/resnet50_csv_01.h5";

// 			let data2 = "_branch2b[0][0]\n"+             
// 			"2019-01-31T09:14:20.412592858Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.412596008Z res2c_branch2b_relu (Activation (None, None, None, 6 0           bn2c_branch2b[0][0]              \n"+
// 			"2019-01-31T09:14:20.412599127Z __________________________________________________________________________________________________\n"+
// 			"2019-01-31T09:14:20.412602265Z res2c_branch2c (Conv2D)         (None, None, None, 2 16384       res2c_branch2b_relu[0][0]        \n"+
// 			"2019-01-31T09:14:33.243959997Z  20/100 [=====&gt;........................] - ETA: 35s - loss: 1.8203 - regression_loss: 1.2044 - classification_loss: 0.6159\n"+
// 			"2019-01-31T09:14:33.515125450Z  21/100 [=====&gt;........................]"; 
			
			that.modifyStr(data, true);
// 			let a = "eteqwrqwrqwrqw\n"
// 			let b = "eteqwrqwrqwrqw"
// 			let aa = a.split("\n")
			
// 			console.log(a.length);
// 			console.log(b.length);
			var area = that.data.logArea;
			area.off("scroll").on("scroll",function(){
				let st = $(this).scrollTop();
// 				var bh = that.data.bh;
// 				var ah = that.data.ah;
// 				if(st == 0){
// 					that.data.bh = area[0].scrollHeight;
// 	 				that.modifyStr(data2, false);
// 	 				that.data.ah = area[0].scrollHeight;
// 	 				let total = ah-bh; 
// 	 				area.scrollTop(total);
// 				} 
			});
		},
		
		modifyStr : function(data, isAppend){
			var that = task_detail;
			var arr = data.split("\n");
			var first_arr = that.data.firstArr;
			var last_arr = that.data.lastArr;
			// 가져온 데이터 \n 으로 스플릿..
			// 필요한 데이터 는 날짜, step, loss , regression_loss, classification_loss ;
			// 생각해야될것 길이가 가변적일수도 있음..
			// log 데이터가 2줄 반 // 다음 데이터는 반 + 2줄 반줄 이런식으로 올 가능성이 있음
			
			//아니면 replace ??

			if(isAppend){
				for(let i = 0, len = arr.length; i<len; i++){
					if(arr.length == 1 || (arr.length == 2 && arr[1].trim() == "")){
						//만약 arr 데이터가 사이즈가 1 또는 2인데 \n 으로 Trim 해서 다음줄이 공백인 경우.. 제일마지막.. 
						that.setLogText(arr[i],isAppend);
					 } else {
					 		if(i == 0){
					 			if(first_arr == null){
									that.data.firstArr = arr[i];
									that.setLogText(first_arr,isAppend);			// jh.sa 첫줄 안나오는 오류 수정 
								 }  else {
									 var start = last_arr + arr[i];
									 that.setLogText(start,isAppend);
								 }
					 		} else if(i == arr.length - 1){
					 			let chr = arr[i].slice(0,1);
					 			that.setLogText(arr[i],isAppend); 
					 			if(chr == "2" && arr[i].indexOf("h5") > -1){
					 				that.setLogText(arr[i],isAppend);
					 			} else {
					 				that.data.lastArr = arr[i];	
					 			}				 				
					 		} else {
					 			that.setLogText(arr[i],isAppend);
					 		}
					 }	
				}
			} else {
				for(let i = arr.length - 1; i>=0; i--){
					if(arr.length == 1 || (arr.length == 2 && arr[1].trim() == "")){
						//만약 arr 데이터가 사이즈가 1 또는 2인데 \n 으로 Trim 해서 다음줄이 공백인 경우.. 제일마지막.. 
						that.setLogText(arr[i],isAppend);
					 } else {
						 if(i == arr.length - 1){
								var start = arr[i] + first_arr
								that.setLogText(start, isAppend);
							} else if(i == 0){
								that.data.firstArr = arr[i];
							} else {
								that.setLogText(arr[i],isAppend);
							}
					 }
				}
			}
		},
		
		setLogText : function(log, isAppend){
			let that = task_detail;
			var area = that.data.logArea;
// 				console.log("log: ::", log);

				if(isAppend){
					area.append(log+"\n");
				} else {
					area.prepend(log+"\n");
				}			
				
				// 로그 데이터가 바뀌어서 잠시 쓰지 않음 jh.sa				
// 				let chr = log.slice(0,1);
			
// 			if(chr != "2"){
// 				if(isAppend){
// 					area.append(log+"\n");
// 				} else {
// 					area.prepend(log+"\n");
// 				}
// 				return;
// 			}
// 			let first_split = log.slice(0,30);	
// 			let second_split = log.slice(30);
// 			let first_str = "";
// 			if(first_split.substring(11,19) != ""){
// 				first_str = "["+ first_split.substring(11,19) + "]";
// 			}
// 			let total_str = "";

// 			if(second_split.indexOf("regression_loss") > - 1){
// 				let s1 = log.split("[")[0];			
// 				let row_arr = log.split("-");				
// 				let step_str = ""+s1.slice(30);
// 				let s = ""+step_str.replace(/ /g,"&nbsp;&nbsp;");
				
// 				total_str = first_str + s + "|" + row_arr[4].slice(0,13)  + " |" + row_arr[5].slice(0,24) + " |" + row_arr[6].slice(0,28); 
// 			} else {
// 				total_str = first_str + second_split;	
// 			}
// 			if(isAppend){
// 				area.append(total_str+"\n");
// 			} else {
// 				area.prepend(total_str+"\n");
// 			}
		},
		
		getTrainStatus : function() {
			let that = task_detail;
			var task_id = that.data.taskId;
			var btn_interval = that.data.btnInterval;
			var detail_class = trainer.pt.find(".section_wrap .task_detail");
			
			if(!detail_class.hasClass("selected")){
				clearInterval(btn_interval);
				return;
			}
			
			ajaxData = {
				task_id : task_id
			}
			
			$.ajax({
				url : baseUrl + "task/getTrainStatus.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("======getTrainStatus======", res);	
				 	if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {					
						that.drawCurrentState(res.result.data);
					}
				},
				error : function(err) {
					console.log("getTrainStatus ERROR!!", err);				
				}
			});
		},
		
		// 실행중일때 true , 실행중 아닐때 false;
		drawCurrentState : function(data){		
			//console.log("drawCurrentState data::", data);
			var that = task_detail;
			var	btn_click = that.data.btnClick;
			var run_btn = that.data.runBtn;
			var currentState = that.data.currentState;
			
			if(btn_click) { return; }
			run_btn.removeClass("pending");

			if(currentState == data) { return; }
			else if(currentState == null || currentState == "") {
				that.data.currentState = data;
				that.setRunBtn("init");
			} else {
				that.data.currentState = data;
				that.setRunBtn("normal");
			}
		},
		
		setRunBtn : function(type){
			let that = task_detail;
			var run_btn = that.data.runBtn;
			var currentState = that.data.currentState;
			// 사용자가 처음 들어올때
			if(type == "init"){
				if(currentState){		
					run_btn.removeClass("off");
					run_btn.addClass("on");
					run_btn.text("Stop Training");
				} 	else {	
					run_btn.removeClass("on");
					run_btn.addClass("off");
					run_btn.text("Start Training");
				}	
			} else {
				//사용자가 detail 페이지 보고있을때 다른 사용자가 누를경우...

				if(currentState){
					run_btn.removeClass("off");
					run_btn.addClass("on");
					run_btn.text("Stop Training");
					
					that.resetLogData();
// 					showLoading(".log_wrap .log_area");
					that.data.startTraining = true;
		
				} 	else {
					run_btn.removeClass("on");
					run_btn.addClass("off");
					run_btn.text("Start Training");
				}
			}
		},
		

		resetLogData : function(){
			let that = task_detail;
			var area = that.data.logArea;
			var interval = that.data.interval;
			
			that.data.start_pos = 0;
			
			if(interval != null){
				clearInterval(interval);
			}
			area.off("scroll");
			area.text('');
			that.data.isInit = false;
			that.data.isScrollEnd = false;
			that.data.isPrepend = false;
			that.data.backSize = 99999;
			that.data.isZero = false;
			
			//로그 시작
			that.initTrainLog();				// 막아둠
		},


		scrollListener : function(){
			let that = task_detail;
			var area = that.data.logArea;
			var guid = that.data.guid;
			var isPrepend = that.data.isPrepend;
			var tempData = that.data.tempData;
			
			area.off("scroll").on("scroll",function(){
				let st = $(this).scrollTop();
				if(st == 0 && !isPrepend){
					that.data.isPrepend = true;
					if(tempData != guid){
						that.data.isPrepend = false;
					} else {
/* 						that.getTrainLogBack(); */
					}
				} else if(st + $(this).innerHeight() >= this.scrollHeight){
					that.data.isScrollEnd = true;
				} else {
					that.data.isScrollEnd = false;
				}
			});
		},	
		
		initTrainLog : function(){
			let that = task_detail;
			var task_id = that.data.taskId;
			var back_size = that.data.backSize;
			
			var ajaxData = {
				task_id : task_id,
				size: back_size
			};
			console.log("init");			
			that.callAjax(ajaxData, "init");			// 막아둠 
		},
		
		getTrainLog : function(){
			let that = task_detail;
			var task_id = that.data.taskId;
			var start_pos = that.data.startPos;
			var log_size = that.data.logSize;
			
			var ajaxData = {
				task_id : task_id,
				start : start_pos,
				size: log_size
			};
			console.log("normal");
			that.callAjax(ajaxData, "normal");			// 막아둠
		},
		
		/*getTrainLogBack : function(){
			let that = task_detail;
			
			if(isZero){
				return;
			}
			
			if(parseInt(initial_pos) <= 0){
				isZero = true;
				back_size = Math.abs(initial_pos);
				initial_pos = 0;
			}
			
			ajaxData = {
				id : task_id,
 				start : initial_pos,
				size: back_size 
			};

			console.log("scroll");
			that.callAjax(ajaxData, "scroll");		
		},*/
		
		callAjax : function(ajaxData, type){
			let that = task_detail;
			var interval = that.data.interval;
			var detail_class = trainer.pt.find(".section_wrap .task_detail"); 
			var guid = that.data.guid;
			var startTraining = that.data.startTraining;
			var first_arr = that.data.firstArr;
			
			if(!detail_class.hasClass("selected")){
				clearInterval(interval);
				return;
			}
			
			that.data.tempData = guid;
			console.log("ajaxData", ajaxData);				
			$.ajax({
				url : baseUrl + "/task/getTrainLog.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("=======getTraingLog=========",res)			
					if(res.result.code == undefined){return;}
					else if (res.result.code == "200") {
						if(res.result.data.log == "파일이 존재하지 않습니다" 
								|| res.result.data.log == "데이터가 존재하지 않습니다" 
								|| res.result.data.log == "" 
								|| res.result.data.log == null) {
							if(type == "scroll"){ 
								var area = that.data.logArea;
								if(first_arr != ""){
									area.prepend(first_arr + "\n");
									that.data.first_arr = "";
								}
								that.data.isPrepend = false;
							}
							
							if(startTraining){
								that.data.startTimeout = window.setTimeout(that.resetLogData,10000);
							}
							return;
						}
						that.drawTrainLog(res, type);	
					} else if(res.result.code == "4584"){
						if(startTraining){
							that.data.startTimeout = window.setTimeout(that.resetLogData,10000);
						}
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} 
					else {
						if(type == "scroll"){ that.data.isPrepend = false; }
						
					}
				
				},
				error : function(err) {
					if(type == "scroll"){ that.data.isPrepend = false; }
					console.log("callAjax ERROR!!", err);
					hideLoading(".log_wrap .log_area");
				}
			});
		},

		drawTrainLog : function(res, type){
			let that = task_detail;
			var start_pos = that.data.startPos;
			var initial_pos = that.data.initialPos;
			var area = that.data.logArea;
			var interval = that.data.interval;
			var guid = that.data.guid;
			var ah = that.data.ah;
			var bh = that.data.bh;
			var isScrollEnd = that.data.isScrollEnd;
			var startTraining = that.data.startTraining;
			var isInit = that.data.isInit;
			var tempData = that.data.tempData;
			
			if(tempData != guid && type != "init"){
				that.data.isPrepend = false;	
				return;
			}
			
			if(type == "init" && !isInit) {
				that.data.tempData = guid;
				if(interval != null){
					clearInterval(interval);
				}
				hideLoading(".log_wrap .log_area");
// 				area.append(res.result.data.log);
				that.modifyStr(res.result.data.log, true);
				that.scrollListener();
				interval = setInterval(that.getTrainLog, 5000);
				that.data.isInit = true;
				that.data.start_pos = res.trainLogVO.start;
				that.data.initial_pos = parseInt(start_pos) - res.result.data.log.length;
				start_pos = parseInt(start_pos) + res.result.data.log.length;		
			} else {
				if(isInit){
					if(type == "scroll"){
						that.data.bh = area[0].scrollHeight;
						that.data.initial_pos = parseInt(initial_pos) - res.result.data.log.length;
// 		 				area.prepend(res.result.data.log);
		 				that.modifyStr(res.result.data.log, false);
		 				that.data.ah = area[0].scrollHeight;
		 				let total = ah-bh; 
		 				area.scrollTop(total);
		 				that.data.isPrepend = false;		
						
					} else {
						that.data.start_pos = parseInt(start_pos) + res.result.data.log.length;
// 						area.append(res.result.data.log);
						that.modifyStr(res.result.data.log, true);
					}
				} else {
	 				if(interval != null){
						clearInterval(interval);
					}
				}
			}

			if(type == "init" || isScrollEnd || startTraining){
				area.scrollTop(area[0].scrollHeight);
				that.data.startTraining = false;
			}

			that.data.isPrepend = false;
		},

		getTaskById : function() {
			let that = this;
			var task_id = that.data.taskId;
			
			var ajaxData = {
				task_id : task_id,
				type : 1
			};

			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/getTaskById.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("=====getTaskById=====", res);
					if (res.result.code == "200") {	
// 						that.drawTaskResult(res.result.data);			
						that.getAlgorithmById(res.result.data);
						that.data.labelType = res.result.data.label_type;
						$("#loader").hide();
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
						$("#loader").hide();
					} else {
						alert(res.result.data);
						$("#loader").hide();
					}
					
					hideLoading("#task_detail .list_wrap");
				},
				error : function(err) {
					$("#loader").hide();
					console.log("getTaskById ERROR!!", err);
				}
			});

		},
		
		resetAnnotationListScroll : function(){
			var that = task_detail;
			var scroll_info = that.data.scrollObj;	
			
			scroll_info.isScroll_top = false;
			scroll_info.isScroll_end = false;
			scroll_info.isScroll = false;
// 			that.data.labelObj = {};
			that.data.labelArr = [];
		},
		
		// task_id 로 불러온 config 정보 그리기 
		drawTaskResult : function(taskData, algorithmData) {
			var that = task_detail;
			var label_arr = that.data.labelArr;
			
			that.resetAnnotationListScroll();
		
			that.data.labelArr = taskData.annotation_list;
			let algorithm_id = taskData.algorithm_id;
			let algorithm_data = algorithmData;
			let train_param = JSON.parse(algorithm_data.train_param);

			// config 는 getTaskById 에서, train_param 은 getAlgorithmById 에서 가져옴 
			let config = JSON.parse(taskData.config);
			let config_length = Object.keys(config).length;
			//let check_first = $("#task_detail").find(".checkBox.first");
// 			let teateateat = JSON.parse(algorithmData.train_param);
			
			that.pt.find(".detail_title").val(taskData.title);
			that.pt.find(".detail_contents").val(taskData.contents);
			
			console.log("config:::", config);
			console.log("config_length:::", config_length);
			console.log("algorithmData:::", algorithm_data);
			console.log("train_param:::", train_param);
			//console.log("check_first:::", check_first, typeof(check_first));
			
			let target = $("#task_detail").find(".box_wrap");
			let target_title = $("#task_detail").find(".sub_wrap .ms_wrap .algorithm_name");
			let algorithm_name = "( Selected algorithm : " + algorithm_data.title + " )";
			$(target).html("");
			$(target_title).html(algorithm_name);
			
			for(let i = 0; i < config_length - 1; i++){
			let config_key = Object.keys(config)[i];
			let config_value = config[Object.keys(config)[i]];
			let type_config_value = typeof(config[Object.keys(config)[i]]);
			
			let html = "";
			
			if(type_config_value === "string"){
				html += '<div class="input_wrap flex light">';
// 				html += '<label>'+config_key+'</label>';
				html += '<label>'+config_key+'<span class="tooltip_wrap"></span></label>';
				html += '<span class="tooltip">'+train_param[i].helper+'</span>';
				html += '<input type="text" name="'+config_key+'" value="'+config_value+'" disabled/>';
				html += '</div>';
				$(target).append(html);
				continue;
			} else if (type_config_value === "number"){
				html += '<div class="input_wrap flex light">';
// 				html += '<label>'+config_key+'</label>';
				html += '<label>'+config_key+'<span class="tooltip_wrap"></span></label>';
				html += '<span class="tooltip">'+train_param[i].helper+'</span>';
				html += '<input type="number" name="'+config_key+'" value="'+config_value+'" disabled/>';
				html += '</div>';
				$(target).append(html);
				continue;
			} else if (type_config_value === "boolean") {
				if (config_value === true) {
					html += '<div class="input_wrap flex check">';
// 					html += '<label>'+config_key+'</label>';
					html += '<label>'+config_key+'<span class="tooltip_wrap"></span></label>';
					html += '<span class="tooltip">'+train_param[i].helper+'</span>';				
					html += '<div class="check_box_wrap">';
					html += '<div class="check_box">';
					html += '<div class="checkBox first selected" name="'+config_key+'"></div>';
					html += '</div>';
					html += '</div>';
					html += '</div>';
					$(target).append(html);
				} else if (config_value === false) {
					html += '<div class="input_wrap flex check">';
					html += '<label>'+config_key+'<span class="tooltip_wrap"></span></label>';
					html += '<span class="tooltip">'+train_param[i].helper+'</span>';
					html += '<div class="check_box_wrap">';
					html += '<div class="check_box">';
					html += '<div class="checkBox first" name="'+config_key+'"></div>';
					html += '</div>';
					html += '</div>';
					html += '</div>';
					
					$(target).append(html);					
				}
				
				
				continue;
			}
			
			if(i == config_length -1) {
				html += '<div class="input_wrap flex light">';
// 				html += '<label>'+config_key+'</label>';
				html += '<label>'+config_key+'</label>';
				html += '<input type="text" name="'+config_key+'" value="'+config_value+'" disabled/>';
				html += '</div>';
				$(target).append(html);					
			}
			
			};
			
// 			console.log("train_param_arr::", train_param_arr);
			
			// helper 툴팁
			let tooltip_wrap = that.pt.find(".tooltip_wrap");
// 			console.log("tooltip_wrap:: ", tooltip_wrap);
			tooltip_wrap.off("mouseover").on("mouseover", function() {
				let tooltip = $(this).parent("label").next(".tooltip");
				tooltip.toggleClass("on");
			});
			tooltip_wrap.off("mouseout").on("mouseout", function() {
				let tooltip = $(this).parent("label").next(".tooltip");
				tooltip.removeClass("on");						
			})
			
			that.runListener();
			
			if(label_arr != null){
				that.initAnnotationList();
			}
		},			
/* 		drawTaskResult : function(taskData, algorithmData) {
			let that = this;
			
			that.resetAnnotationListScroll();
	
			label_arr = taskData.annotation_list;
			let algorithm_id = taskData.algorithm_id;
			let algorithm_data = algorithmData;
			let train_param = JSON.parse(algorithm_data.train_param);

			// config 는 getTaskById 에서, train_param 은 getAlgorithmById 에서 가져옴 
			let config = JSON.parse(taskData.config);
			let config_length = Object.keys(config).length;
			//let check_first = $("#task_detail").find(".checkBox.first");
			
			that.pt.find(".detail_title").val(taskData.title);
			that.pt.find(".detail_contents").val(taskData.contents);
			
			console.log("config:::", config);
			console.log("config_length:::", config_length);
			console.log("algorithmData:::", algorithm_data);
			console.log("train_param:::", train_param);
			//console.log("check_first:::", check_first, typeof(check_first));
			
			for(let i = 0; i < config_length; i++){
				train_param_obj = { [i] : train_param[i].type };
				train_param_arr.push(train_param_obj);
				console.log("train_param_arr:::::",train_param_arr);
				let value_config = config[Object.keys(config)[i]];
				let str_list = $("#task_detail").find("input[type='text']");
				let num_list = $("#task_detail").find("input[type='number']");
				let chk_list = $("#task_detail").find(".checkBox.first");
				
				
				if(typeof(value_config) === "string") {
						for(let j = 0; j < str_list.length; j++){
							str_list[j]["value"] = value_config;	
							break
						}
						continue
				} else if (typeof(value_config) === "number"){
					for(let j = 0; j < num_list.length; j++){
						num_list[j]["value"] = value_config;	
						break
					}
					continue
				} else if (typeof(value_config) === "boolean"){
					for(let j = 0; j < chk_list.length; j++){
						if(value_config === true){
							chk_list[j].className += " selected"
								break
						} else if(value_config == false){
							break
						}	
						continue
					}

				}
			}
			
			console.log("train_param_arr::", train_param_arr);
			
			that.runListener();
			
			if(label_arr != null){
				that.initAnnotationList();
			}
		},	 */	

/* 		drawTaskResult : function(data) {
			let that = this;
			
			that.resetAnnotationListScroll();
	
			label_arr = data.annotation_list;
			let algorithm_id = data.algorithm;
			
			let config = JSON.parse(data.config);


			that.pt.find(".detail_title").val(data.title);
			that.pt.find(".detail_contents").val(data.contents);

			that.pt.find("input[name='first']").val(config["--steps"]);
			that.pt.find("input[name='second']").val(config["--epochs"]);
			that.pt.find("input[name='third']").val(config["--image-min-side"]);
			that.pt.find("input[name='fourth']").val(config["--image-max-side"]);
			that.pt.find("input[name='fifth']").val(config["--backbone"]);
			that.pt.find("input[name='sixth']").val(config["--gpu"]);

			let check_first = that.pt.find(".defaultBtn.first");
			let check_second = that.pt.find(".defaultBtn.second");

			let first = config["--random-transform"];
			let second = config["--freeze-backbone"];


			if (first == "true") {
				check_first.addClass("selected");
			} else {
				check_first.removeClass("selected");
			}

			if (second == "true") {
				check_second.addClass("selected");
			} else {
				check_second.removeClass("selected");
			}

			if (algorithm_id != null) {
				that.pt.find(".defaultBtn.third").addClass("selected");
			} else {
				that.pt.find(".defaultBtn.third").removeClass("selected");
			}
			that.runListener();
			
			if(label_arr != null){
				that.initAnnotationList();
			}
		}, */
		
		initAnnotationList : function(){
			var that = this;
			that.pt.find(" .table_body .anno_table tbody").html("");
			var scroll_info = that.data.scrollObj;
			var label_arr = that.data.labelArr;
			
			scroll_info.scroll_start = 0;
			scroll_info.scroll_end = (scroll_info.default_size < label_arr.length ) ? scroll_info.default_size : label_arr.length;
			that.drawAnnotationList("init",scroll_info.scroll_start,scroll_info.scroll_end);
			if(label_arr.length > scroll_info.default_size) {
				scroll_info.isScroll_top = true;
				that.setAnnotationScrollListener();
			}
			
			that.pt.find(".list_total").text("Total " + label_arr.length);
		},
		
		drawAnnotationList : function(type,start,end) {	
			let that = this;
			let target = that.pt.find(".table_body .anno_table tbody");
			var scroll_info = that.data.scrollObj;
			var label_arr = that.data.labelArr;
			let html = "";
			let label_type = that.data.labelType;				// jh.sa 201027 수정 
			let i = 0;
			for (i = start ; i < end ; i++) {
				let data = label_arr[i];
				
				let sp = data.split(",");
				html += " <tr data-id='"+data+"'> ";
				html += "   <td class='preview'>";
				if(label_type == "VIDEO_BBOX"){
					that.pt.find("th.pre").html("");
				} else if (label_type == "IMAGE_BBOX" || label_type == "IMAGE_SEGMENTATION"){
					html += "   	<div class='img_preview'>";
					html += "       	<div class='show_img'></div>";
					html += "       	<div class='normal_img_wrap'>";
					html += "   			<div class='title_wrap flex'>";
					html += "   				<div class='image'></div>";
					html += "   				<span class='title'></span>";
					html += "   			</div>";
					html += "   			<div class='frame_container'>";
					html += "   			</div>";
					html += "   		</div>";
					html += "   	</div>";	
					that.pt.find("th.pre").html("PREVIEW");
				}				
				html += "   </td>";
				html += "   <td>" + sp[0] + "</td> ";
				html += " 	<td>" + sp[1] + "</td> ";
				html += " 	<td>" + sp[2] + "</td> ";
				html += " 	<td>" + sp[3] + "</td> ";
				html += " 	<td>" + sp[4] + "</td> ";
				html += " 	<td>" + sp[5] + "</td> ";
				html += " </tr>";
			}
			scroll_info.isScroll = false;

			if(type == "down" || type == "init"){
				target.append(html);	
			} else {
				target.prepend(html);
			}
			
			that.annoListener();
		},
		
		setAnnotationScrollListener : function(){
			let that = this;	
			
			that.pt.find(".table_body").off("scroll").on("scroll",function(){
				var scroll_info = that.data.scrollObj;
				let target = $(this);
				
				let st = target.scrollTop();
				let box_size = that.pt.find("tbody tr").length;
				
				var label_arr = that.data.labelArr;

				if(st + target.innerHeight() >= target[0].scrollHeight && !scroll_info.isScroll && !scroll_info.isScroll_end){
					scroll_info.isScroll = true;
					
					var diff = 0;
					if(scroll_info.scroll_end + scroll_info.half_size >= label_arr.length){
						diff = label_arr.length - scroll_info.scroll_end;
						scroll_info.scroll_end = label_arr.length;
						scroll_info.scroll_start = scroll_info.scroll_start + diff;
						scroll_info.isScroll_end = true;
						
					}else{
						diff = scroll_info.half_size;
						scroll_info.scroll_end = scroll_info.scroll_end + diff;
						scroll_info.scroll_start = scroll_info.scroll_start + diff;
					}
					var end = scroll_info.scroll_end;
					var start = end - diff;
					
					that.drawAnnotationList("down",start,end);
					that.removeBox(diff,"down");	
					scroll_info.isScroll_top = false;
					
			
				}else if(st == 0 && !scroll_info.isScroll && !scroll_info.isScroll_top){
					scroll_info.isScroll = true;					
					
					var diff = 0;
					if(scroll_info.scroll_start - scroll_info.half_size <= 0){						
						diff = scroll_info.scroll_start;
						scroll_info.scroll_start = 0;
						scroll_info.scroll_end = scroll_info.scroll_end - diff;
						scroll_info.isScroll_top = true;
						
					}else{
						diff = scroll_info.half_size;
						scroll_info.scroll_end = scroll_info.scroll_end - diff;
						scroll_info.scroll_start = scroll_info.scroll_start - diff;
					}
					var start = scroll_info.scroll_start;
					var end = start + diff;
					
					
					that.drawAnnotationList("up",start,end);
					that.removeBox(diff,"up");	
					scroll_info.isScroll_end = false;
							
				}
			});
		},
		
		removeBox : function(size,type){
			let that = this;
			
			if(size == 0){ return; }

			if(type == "down"){
				that.pt.find("tbody tr").slice(0,size).remove();					
			} else {		
				that.pt.find("tbody tr").slice(-size).remove();
			}
			that.pt.find(".table_body").scrollTop((that.pt.find(".table_body")[0].scrollHeight - that.pt.find(".table_body").height()) / 2);
		},

		
		annoListener : function(){
			let that = task_detail;

			
			that.pt.find(".anno_table tbody tr .img_preview").off("mouseenter").on("mouseenter",function(){

				let show_img = $(this).children(".show_img");
				
				let x = $(this).offset().left + $(this).outerWidth() + 10;
		        let y = $(this).offset().top + $(this).outerHeight() - 59;
				
		        
				show_img.css({"top":y+"px", "left":x+"px","position": "fixed","display": "flex"});
				let tr = $(this).parent().parent().children();
				showLoading(".show_img");
				
				let imgObj = new Image();

				imgObj.src = "/uploadFile/" + tr[1].innerHTML; 
// 	 			imgObj.src = "/xlabeller/images/sabana3.jpg";
	 			
				imgObj.onload = function(){
					canvas_hover = document.createElement('canvas');
					show_img.html(canvas_hover);
					
					that.crop(imgObj, tr[2].innerHTML, tr[3].innerHTML, tr[4].innerHTML, tr[5].innerHTML);	
				};
				
				imgObj.onerror = function(){
					hideLoading(".show_img");
				}			
			});
			
			that.pt.find("table tbody td").off("mouseenter").on("mouseenter",function(){
				let text = $(this)[0].innerText;
				if(text == "") {return;}	
				$(this).empty();
				$(this).append(text);
				that.addHoverBox($(this), text);
			});
			
			that.pt.find("table tbody td").off("mouseleave").on("mouseleave",function(){
				that.removeHoverBox($(this));
			});
			
			that.pt.find(".anno_table tbody tr .img_preview").off("mouseleave").on("mouseleave",function(){
				let show_img = $(this).children(".show_img");
				let normal_img = $(this).children(".normal_img_wrap");
				show_img.css("display","none");
				$(this).removeClass("selected");
			});
			
			that.pt.find(".anno_table tbody tr .img_preview").off("click").on("click",function(){
				let normal_img = $(this).children(".normal_img_wrap");
				if(normal_img.parent().hasClass("selected")){
					normal_img.parent().toggleClass("selected");	
				} else {
					that.pt.find("tbody tr .img_preview").removeClass("selected");
					normal_img.parent().toggleClass("selected");
				}
				
				
				let x = $(this).offset().left + $(this).outerWidth() + 10;
		        let y = $(this).offset().top + $(this).outerHeight() - 141;
	        
		        normal_img.css({"top":y+"px", "left":x+"px","position": "fixed"});
				let tr = $(this).parent().parent().children();
				let cur_index = $(this).parent().parent().index();
				tr.find(".title_wrap .title").empty();
				tr.find(".title_wrap .title").text(tr[6].innerHTML);
				

				let cur_id = ""+tr[1].innerHTML+tr[2].innerHTML + tr[3].innerHTML +tr[4].innerHTML + tr[5].innerHTML + tr[6].innerHTML
				canvas = null;
				$(this).children().children(".frame_container").empty();
				$(this).children().children(".frame_container").append("<canvas id="+"'"+cur_index+"c' width='270px' height='182px'>");
				canvas = new fabric.Canvas(cur_index+"c");
				canvas.selection = false;

				let imgObj = new Image();
				imgObj.src = "/uploadFile/" + tr[1].innerHTML; 
				
				showLoading(tr.children().children(".normal_img_wrap"));
				
				imgObj.onload = function(){					
					that.rescale(this);
					
					canvas.setBackgroundImage(imgObj.src, canvas.renderAll.bind(canvas), {
// 				          backgroundImageOpacity: 0.5,
// 				          backgroundImageStretch: true,
// 				          width: canvas.width,
// 				          height: canvas.height		
				          scaleX : scaleFactor,
						  scaleY : scaleFactor	
				    });
					
					that.clearCanvas();
					that.setSingleMeta(cur_id,tr[6].innerHTML, tr[2].innerHTML, tr[3].innerHTML, tr[4].innerHTML, tr[5].innerHTML);
					that.updateRedraw();
					hideLoading(tr.children().children(".normal_img_wrap"));
				};
				
				imgObj.onerror = function(){
					hideLoading(tr.children().children(".normal_img_wrap"));
				}
				
				
			});
		},
		
		addHoverBox : function(elem,text){
			let that = this;
			
			

			if (elem[0].scrollWidth >  elem.innerWidth()) {
				let btn_width = elem.outerWidth();
				let btn_height = elem.outerHeight();
				let top = elem.offset().top;
				let left = elem.offset().left;
				let right = ($(window).width() - (elem.offset().left + elem.outerWidth())); 
				let bottom = ($(window).height() - (elem.offset().top + elem.outerHeight()));

			   	elem.append("<div class='hover_box'><div class='hover_div'><div>"+text+"</div</div></div>");
			   	let hover_box = elem.children(".hover_box");
			   	let text_div = hover_box.find(".hover_div div");
				hover_box.css({"display" : "block"});
			   	let text_width = text_div.outerWidth();
			   	let text_height = text_div.outerHeight();
			   	hover_box.css({"display" : "none"});
	   	
			   	let x;
			   	let y;
			   	
			   	if(right - text_width < 0){
			   		x = left - text_width;
			   		
			   	} else {
			   		x = left + btn_width / 2;
			   	}
			   	
			   	if(bottom - text_height < 0){
		   			y = top - text_height;
		   		} else {
		   			y = top + btn_height / 2;
		   		}

			   	hover_box.css({"top":y+"px", "left":x+"px","position": "fixed","display" : "block"});
			}
		},
		
		removeHoverBox : function(elem){
			let that = this;
			elem.find(".hover_box").remove();
		},
		
		crop : function(imgObj, xx, yy, xxx, yyy){
			let that = this;

			var ctx = canvas_hover.getContext("2d");
	
			
			hideLoading(".show_img");
			
			var ww = xxx - xx;
			var hh = yyy - yy;
			
			var w = ww;
	    	var h = hh;
	    		
	    	var dw = 0;
	    	var dh = 0;
	    		
	    	var g_w = 105;
	    	var g_h = 80;
	    	
	    	var fw = w/g_w;
	    	var fh = h/g_h;
	    	
	    	if(fw >= fh){
	    		dw = w / fw;
	    		dh = h / fw;
	    	}else{
	    		dw = w / fh;
	    		dh = h / fh;
	    	}
	    	canvas_hover.width = dw;
	    	canvas_hover.height = dh;

			ctx.clearRect(0, 0, canvas_hover.width, canvas_hover.height);
			ctx.drawImage(imgObj, xx, yy, ww, hh, 0, 0, dw, dh);
        },

        rescale : function(img){
        	var canvas_max_width = 270;
            var canvas_max_height = 182;
            if(canvas_max_height/canvas_max_width >= img.naturalHeight/img.naturalWidth){
            	scaleFactor=canvas_max_width/img.naturalWidth;
            } else{
            	scaleFactor=canvas_max_height/img.naturalHeight;
            }
            
            canvas.setWidth(img.naturalWidth*scaleFactor);
         	canvas.setHeight(img.naturalHeight*scaleFactor);
    		canvas.calcOffset();
    		canvas.renderAll();      
    	},
    	
    	updateRedraw : function(){
        	var that = this;
			var rect = new fabric.Rect(labelMap);	
			canvas.add(rect);
			
        },
        
        clearCanvas : function(){
        	let that = this;	
        	$("#label-container").empty();
        	//캔버스에 존재하는 오브젝트 모두 삭제
        	var canvObjLen = canvas.getObjects().length;
        	for(var i = 0 ; i < canvObjLen; i++){
        		canvas.remove(canvas.getObjects()[0]);
        	}
        },
        
        setSingleMeta : function(id,label,x,y,xx,yy){
        	let that = this;
			let fillColor = colorHash.rgb(label);

			labelMap = {
					id: id,
					label: label,
					left: x*1*scaleFactor,
					top: y*1*scaleFactor,
					width: (xx-x)*1*scaleFactor,
					height: (yy-y)*1*scaleFactor,
					lockMovementX : true,
					lockMovementY : true,
					lockScalingX : true,
					lockScalingY : true,
					lockRotation : true,
					angle: 0,
					fill: "rgba("+fillColor[0]+","+fillColor[1]+","+fillColor[2]+",0.5)"
			}
        },
		
		runListener : function(gpu_node_id, gpu_index){
			let that = task_detail;
			let msg = "";
			let gpu_select_btn = $("#task_detail").find(".gpu_table tbody").find(".radioBtn");
			let gpu_id = gpu_node_id;
			let gpu_idx = gpu_index;
			var run_btn = that.data.runBtn;
			
			run_btn.off("click").on("click",function(){

				if(run_btn.hasClass("on")){
					msg = "Training을 중단하시겠습니까?";
					if(confirm(msg) == true){
						that.setBtnDefault();
						that.killTrain();	
					}	
				} else if(run_btn.hasClass("off")){
					msg = "Training을 시작하시겠습니까?\n(데이터가 10개 미만일 경우 평가 지표가 계산되지 않을 수 있습니다.)";
					if(confirm(msg) == true){
						that.setBtnDefault();
						that.runTrain();
					}
				}
				
			});
			
			// GPU Node Select 
/* 			gpu_select_btn.off("click").on("click",function(){
				$(this).toggleClass("selected");
				if($(this).hasClass("selected")) {
					gpu_select_btn.not(this).removeClass("selected");
				}
			}); */
			
// 			let gpu_row_click = $("#task_detail").find(".sub_wrap .list_wrap .gpu_table tbody tr")
// 			gpu_row_click.off("click").on("click",function() {
// 				let gpu_tr = $(this);
// 				//let gpu_btn = gpu_tr.children().children().children(".radioBtn");
// 				let gpu_btn = gpu_tr.children(".gpu_select").children(".radioBtn");
// 				//let gpu_id = gpu_tr.data("id");
// 				gpu_btn.toggleClass("selected");
// 				if(gpu_btn.hasClass("selected")){
// 					//radio_obj = {};
// 					$("#task_detail").find(".sub_wrap .table_body .gpu_table tbody tr .radioBtn").removeClass("selected");
// 					gpu_btn.addClass("selected");
// 					//radio_obj[id] = id;
// 				} else {
// 					//radio_obj = {};
// 				}				
// 			});			

		},	
		
		setBtnDefault : function(){
			let that = task_detail;		
			var btn_interval = that.data.btnInterval;
			var start_timeout = that.data.startTimeout;
			
			hideLoading(".log_wrap .log_area");
			
			that.data.btnClick = true;
			that.data.startTraining = false;
			
			if(btn_interval != null){
				clearInterval(btn_interval);
			}
			
			if(start_timeout != null){
				clearTimeout(start_timeout);
			}
			
			
		},
		
		runTrain : function() {
			let that = task_detail;
			var task_id = that.data.taskId;
			var run_btn = that.data.runBtn;
			
            // 선택된 gpu node 의 gpu_node_id와 gpu_index 값 넘기기
            let selected_gpu_node_id = $("#task_detail").find(".table_body .gpu_table tbody tr").find("td .selected").parents("tr").attr("data-id");
            let selected_gpu_index = $("#task_detail").find(".table_body .gpu_table tbody tr").find("td .selected").parents("tr").find(".gpu_index").attr("data-index");
			
	        if(selected_gpu_node_id == undefined || selected_gpu_node_id == null || selected_gpu_node_id == "" || selected_gpu_index == undefined || selected_gpu_index == null || selected_gpu_index == ""){
// 		        	alert("사용 가능한 GPU가 없습니다");			// gpu 사용가능한것이 없어도 run 버튼이 눌리던 문제 대안 
		        	alert("선택된 GPU가 없습니다.\nGPU를 선택해주세요.");
		        	return;
		       }
            
            var ajaxData = {
				task_id : task_id,
				gpu_node_id : selected_gpu_node_id,
				gpu_index : selected_gpu_index
			}
			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/runTrain.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("======runTrain======", res);
					if (res.result.code == "200"){
						run_btn.addClass("pending");
						run_btn.text("Please Wait...");
						alert(res.result.data);
						that.data.currentState = null;
						that.data.startTraining = true;
						that.resetLogData();
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
// 						that.setDefaultBtn();
						that.data.startTraining = true;
						alert(res.result.data);
					}
					
					
					$("#loader").hide();
					that.data.btnInterval = setInterval(that.getTrainStatus, 5000);			// 막아둠
					that.data.btnClick = false;
					
				},
				error : function(err) {
					that.data.btnInterval = setInterval(that.getTrainStatus, 5000);			// 막아둠
					$("#loader").hide();
					console.log("runTrain ERROR!!", err);					
//  					that.setDefaultBtn();
				}
			});

		},
		
		killTrain : function() {
			let that = task_detail;
			var task_id = that.data.taskId;
			var run_btn = that.data.runBtn;
			
			var ajaxData = {
				task_id : task_id
			}
			
			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/killTrain.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					console.log("======killTrain======", res);
					if (res.result.code == "200"){
						run_btn.addClass("pending");
						run_btn.text("Please Wait...");
						alert("Training이 중단되었습니다");
						
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert("Training도중에 문제가 발생해 중단합니다.");
					}
					$("#loader").hide();
					that.data.btnInterval = setInterval(that.getTrainStatus, 5000);			// 막아둠
					that.data.btnClick = false;
				},
				error : function(err) {
					$("#loader").hide();
					that.data.btnInterval = setInterval(that.getTrainStatus, 5000);			// 막아둠
					console.log("killTrain ERROR!!", err);
// 					that.setDefaultBtn();
				}
			});

		},
		
		guid : function() {
  			function s4() {
  				return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
  			}
  			return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
  		},
  		
		// id에 해당하는 algorithm 정보 가져오기
		getAlgorithmById : function(data) {
			let that = this;
			
			let taskData = data;
			let ajaxData = {
				algorithm_id : data.algorithm_id
			}
			
			$("#loader").show()
			$.ajax({
				url : baseUrl + "algorithm/getAlgorithmById.json",
				data : ajaxData,
				type : "POST",
				success : function(res){
					console.log("=====getAlgorithmById=====", res);
					if(res.result.code == "200"){
						//that.setTrainParameters(res.result.data);
						that.drawTaskResult(taskData, res.result.data);
						$("#loader").hide();
						console.log("===taskData===", taskData);
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						$("#loader").hide();
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
						$("#loader").hide();
					}
				},
				error : function(err){
					console.log("getAlgorithmById ERROR!", err);
				}
			});
		},  	
		
		// algorithm_id의 정보로 div 그리기 
 		setTrainParameters : function(data) {
			let that = this;
			let train_param_data = JSON.parse(data.train_param);
			let target = $("#task_detail").find(".box_wrap");
			$(target).html("");
			
			for(let i=0; i < train_param_data.length; i++){
					console.log(train_param_data[i]);
					let html = "";
					if(train_param_data[i].type == "string") {
						html += '<div class="input_wrap flex light">';
						html += '<label>'+train_param_data[i].param+'<span class="tooltip_wrap"></span></label>';
						html += '<span class="tooltip">'+train_param_data[i].helper+'</span>';
						html += '<input type="text" name="'+train_param_data[i].param+'" value="" disabled/>';
						html += '</div>';
						$(target).append(html);
					} else if(train_param_data[i].type == "number"){
						html += '<div class="input_wrap flex light">';
						html += '<span class="tooltip">'+train_param_data[i].helper+'</span>';
						html += '<input type="number" name="'+train_param_data[i].param+'" value="" disabled/>';
						html += '</div>';	
						$(target).append(html);
					} else if (train_param_data[i].type = "boolean"){
						html += '<div class="input_wrap flex check">';
						html += '<label>'+train_param_data[i].param+'<span class="tooltip_wrap"></span></label>';
						html += '<span class="tooltip">'+train_param_data[i].helper+'</span>';
						html += '<div class="check_box_wrap">';
						html += '<div class="check_box">';					
						html += '<div class="checkBox first" name="'+train_param_data[i].param+'"></div>';
						html += '</div>';
						html += '</div>';
						html += '</div>';
						
						$(target).append(html);
					};
					
					// helper 툴팁 		
					let tooltip_wrap = that.pt.find(".tooltip_wrap");
// 					console.log("tooltip_wrap:: ", tooltip_wrap);
					tooltip_wrap.off("mouseover").on("mouseover", function() {
						let tooltip = $(this).parent("label").next(".tooltip");
						tooltip.toggleClass("on");
					});
					tooltip_wrap.off("mouseout").on("mouseout", function() {
						let tooltip = $(this).parent("label").next(".tooltip");
						tooltip.removeClass("on");						
					})
					
					//$(target).append(html);
					that.defaultListener();	 			
			};
		},
		
		// 사용가능한 GPU Node select list 
		drawGpuNodeList : function(data) {
			var that = this;
            var target = $("#task_detail").find(".gpu_table tbody");
            $(target).html("");

            //var data = [{"node_ip":"192.168.1.12","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"1"},
            //{"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"}];  
			
//              let data = [{"node_ip":"192.168.1.12","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"1"},
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},             
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},   
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},   
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},   
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},   
//              {"node_ip":"192.168.1.13","available_gpu_index":"1,2,3","unavailable_gpu_index":"4","gpu_node_id":"2"},   
//              {"node_ip":"192.168.1.13","unavailable_gpu_index":"4","gpu_node_id":"2"},                
//              ];              
            
            //var data = [{"node_ip":"192.168.1.12","unavailable_gpu_index":"4","gpu_node_id":"1"}];             
            //var data;
            var data = data; 
            var renderArr = [];
            var html = "";         
           
            if(data != undefined || data != null || typeof(data) == "object") {
            	if (data.length > 0){
                    for(var j = 0 ; j < data.length ; j++){

                        var tempObj = data[j];
                        var node_ip = tempObj["node_ip"];
                        var gpu_node_id = tempObj["gpu_node_id"];
						if(tempObj["available_gpu_index"]){
	                        var agiArr = tempObj["available_gpu_index"].split(",");
	                        for(var i = 0 ; i < agiArr.length ; i++){
	                        var status = "available";
	                        var resultObj = {"node_ip":node_ip,"gpu_index":agiArr[i],"status":status,"gpu_node_id":gpu_node_id};
	                        renderArr.push(resultObj);

	                        }							
						} else {
							// jh.sa 210126 xx번 서버에 GPU가 n개일 때 n개 모두 사용중일 경우 node_ip + No GPU available 표시
							html += "<tr>";
							html += "<td class='gpu_node_ip'>"+ node_ip +"</td>";
							html += "<td colspan='3' align='center'>No GPU available</td>";    
							html += "</tr>";
// 							html += "<tr><td colspan='4' align='center'>No GPU available</td></tr>";   
						}

        /*                 var ugiArr = tempObj["unavailable_gpu_index"].split(",");
                        for(var i = 0 ; i < ugiArr.length ; i++){
                        var status = "unavailable";
                        var resultObj = {"node_ip":node_ip,"gpu_index":ugiArr[i],"status":status,"gpu_node_id":gpu_node_id};
                        renderArr.push(resultObj);

                        } */
                        console.log("renderArr::", renderArr);
                    }              		
            	} else {
            		// 데이터가 0일 때(데이터가 없을 때)
            		html += "<tr><td colspan='4' align='center'>No GPU available</td></tr>";
            	}
            } else {
        		// 데이터가 null이거나 undefined이거나 object가 아닐 때 
            	html += "<tr><td colspan='4' align='center'>No GPU available</td></tr>";            	
            }
			
            for(var i = 0 ; i < renderArr.length;i++){
            var renderObj = renderArr[i];
            var template = "";

            template = "<tr data-id='"+renderObj["gpu_node_id"]+"'>"+"<td class='gpu_node_ip'>"+renderObj["node_ip"]+"</td>"+"<td class='gpu_index' data-index='"+renderObj["gpu_index"]+"'>"+renderObj["gpu_index"]+"</td>"+"<td class='gpu_status'>"+renderObj["status"]+"</td>"+"<td class='gpu_select'>"+"<div class='radioBtn'>"+"</div>"+"</td>"+"</tr>"; 
                
            html+= template;
            }
			
            $(target).html(html);  
            
			let gpu_row_click = $("#task_detail").find(".sub_wrap .list_wrap .gpu_table tbody tr")
			gpu_row_click.off("click").on("click",function() {
				let gpu_tr = $(this);
				//let gpu_btn = gpu_tr.children().children().children(".radioBtn");
				let gpu_btn = gpu_tr.children(".gpu_select").children(".radioBtn");
				//let gpu_id = gpu_tr.data("id");
				gpu_btn.toggleClass("selected");
				if(gpu_btn.hasClass("selected")){
					//radio_obj = {};
					$("#task_detail").find(".sub_wrap .table_body .gpu_table tbody tr .radioBtn").removeClass("selected");
					gpu_btn.addClass("selected");
					//radio_obj[id] = id;
				} else {
					//radio_obj = {};
				}				
			});	             
			
		},
		
		// 사용가능한 GPU Node List 가져오기 
		getSelectableGpuNode : function() {
			let that = this;
			var task_id = that.data.taskId;
			
			var ajaxData = {
				task_id : task_id
			}

			$("#loader").show();
			$.ajax({
				url : baseUrl + "task/getSelectableGpuNode.json",
				data : ajaxData,
				type : "POST",
				success : function(res) {
					$("#loader").hide();
					console.log("=====getSelectableGpuNode=====", res);
					if (res.result.code == "200") {	
						that.drawGpuNodeList(res.result.data);
					} else if (res.result.code == "2001") {
						alert(res.result.data);
						location.href = baseUrl + 'login';
					} else {
						alert(res.result.data);
					}
					
					hideLoading("#task_detail .list_wrap");
				},
				error : function(err) {
					$("#loader").hide();
					console.log("getSelectableGpuNode ERROR!!", err);
				}
			});

		},
		
		logAreaExpand : function() {
			let that = this;
			
			let icon_expand = that.pt.find(".icon_expand");
			let log_expand = that.pt.find(".log_expand");
			let log_close = that.pt.find(".log_close");

			icon_expand.off("click").on("click", function(){
				log_expand.toggleClass("active");
				log_expand.draggable();
			});
			
			log_close.off("click").on("click", function(){
				log_expand.removeClass("active");
			})
		}

	};
</script>
