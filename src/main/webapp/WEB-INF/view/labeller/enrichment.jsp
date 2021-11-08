<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<c:url value="/css/swiper.min.css" />">
<script src="<c:url value="/js/swiper.min.js" />"></script>
<style>
.canvas-container {
	margin: 0px auto;
}

#enrichment {
	height: 100%;
}

#enrichment .enrichment_wrap {
	background-color: #fff;
}

#enrichment section.enrichment {
	width: calc(100% - 486px);
	height: 100%;
	position: relative;
	border: 1px solid #e5e5e5;
}

#enrichment section .title-wrap {
	width: 694px;
	margin: 23px auto 17px;
	font-size: 12px;
	font-weight: 400;
	color: #343434;
}

#enrichment section .title-wrap .poly_btn, #enrichment section .title-wrap .labelCopy_btn,
	#enrichment section .title-wrap .labelPaste_btn {
	margin-left: 5px;
	padding: 3px 10px;
	font-weight: 300;
	color: #333333;
	border: 1px solid #d9d9d9;
	border-radius: 3px;
	background-color: #ffffff;
	cursor: pointer;
}

#enrichment section .title-wrap .poly_btn:hover, #enrichment section .title-wrap .labelCopy_btn:hover,
	#enrichment section .title-wrap .labelPaste_btn:hover {
	background-color: #fafafa;
}

#enrichment section .title-wrap .poly_btn.action, #enrichment section .title-wrap .labelCopy_btn.action
	{
	background-color: #4c84ff;
}

#enrichment section .title-wrap .labelPaste_btn.disable {
	display: none;
}

#enrichment section.enrichment .frame-wrap {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 694px;
	height: 447px;
	position: relative;
	margin: 0 auto;
	padding: 40px 0 40px 0;
	border: 1px solid #e5e5e5;
}

#enrichment section.enrichment .prev {
	position: absolute;
	background: url(images/btn_image_arrow_left_normal.png) left;
	width: 16px;
	height: 25px;
	top: calc(50% - 25px);
	left: 5px
}

#enrichment section.enrichment .next {
	position: absolute;
	background: url(images/btn_image_arrow_right_normal.png) right;
	width: 16px;
	height: 25px;
	top: calc(50% - 25px);
	right: 5px
}

#enrichment section.enrichment .prev:hover {
	background: url(images/btn_image_arrow_left_hover.png) left;
	cursor: pointer;
}

#enrichment section.enrichment .next:hover {
	background: url(images/btn_image_arrow_right_hover.png) right;
	cursor: pointer;
}

#enrichment section.enrichment #frame-container {
	height: 380px;
	display: flex;
	display: -webkit-flex;
	display: -ms-flexbox;
	-webkit-align-items: center;
	align-items: center;
}

#enrichment section.enrichment canvas {
	border-radius: 8px;
}

#enrichment section.enrichment .imgList-wrap {
	width: 694px;
	margin: 20px auto;
	background-color: #f5f5f5;
	border: 1px solid #e5e5e5;
}

#enrichment section.enrichment .imgList {
	width: 610px;
	margin: 0 auto;
	position: relative;
	overflow: hidden;
	list-style: none;
	padding: 16px 0;
	z-index: 1;
}

#enrichment section.enrichment .swiper-slide {
	background-position: center;
	background-size: cover;
	width: 120px;
	height: 89px;
}

#enrichment section.enrichment .swiper-slide img {
	width: 100%;
	height: 100%;
}

#enrichment section.label {
	width: 486px;
	height: 100%;
	position: relative;
	background-color: #ffffff;
	border: 1px solid #e5e5e5;
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
}

#enrichment section.label .ar {
	position: absolute;
	right: 50px;
	font-size: 12px;
	font-weight: 300;
}

#enrichment section.label .tag-wrap .title {
	font-weight: 400;
	color: #555555;
	position: relative;
	width: calc(100% - 100px);
	height: 48px;
	padding: 0 50px;
	border-bottom: 1px solid #e7e7e7;
}

#enrichment section.label .tag-wrap .title .layer_bar {
	display: inline-block;
	width: 2px;
	height: 12px;
	margin-right: 10px;
	border-radius: 1px;
	background: #4c84ff;
}

#enrichment section.label .tag-wrap .content-wrap {
	height: 116px;
	overflow: overlay;
}

#enrichment section.label .tag-wrap .content {
	padding-bottom: 16px;
	margin: 0 auto;
	width: 405px;
}

#enrichment section.label .tag {
	width: 69px;
	margin: 16px 5px 0 5px;
	line-height: 32px;
	background: #f4f7fc;
	border: 1px solid #d9d9d9;
	border-radius: 4px;
	text-align: center;
	font-size: 14px;
	font-weight: 300;
	color: #555555;
	cursor: pointer;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

#enrichment section.label .tag.selected {
	background: #4c84ff;
	border-color: #2b65e6;
	color: #ffffff;
	box-shadow: 0 3px 4px 0 rgba(159, 189, 255, 0.7);
}

#enrichment .collision-wrap {
	font-size: 14px;
	font-weight: 400;
	color: #555555;
	position: relative;
	width: calc(100% - 100px);
	height: 48px;
	padding: 0 50px;
	border-top: 1px solid #e7e7e7;
}

#enrichment .collision-wrap .flex, #enrichment .all_collision-wrap .flex
	{
	width: auto;
}

#enrichment .area-wrap, #enrichment .layer-move-wrap {
	height: 24px;
	margin-left: 5px;
	border: 1px solid #d9d9d9;
	border-radius: 4px;
	background: #f8f8f8;
}

#enrichment .area-wrap .area {
	width: 54px;
	text-align: center;
}

#enrichment .arrow-btn {
	border-left: 1px solid #d9d9d9;
	width: 24px;
	height: 24px;
	object-fit: contain;
	background: url(images/icon-tree-arrow-bottom.png) no-repeat center;
	cursor: pointer;
}

#enrichment .layer-move-wrap .arrow-btn {
	border: 0;
}

#enrichment section.label .frame-wrap {
	height: calc(100% - 317px);
	overflow-y: overlay;
	border-top: 1px solid #e7e7e7;
}

#enrichment section.label .frame-wrap .label-layer {
	height: 47px;
	background: #f8f8f8;
	border-top: 1px solid #e7e7e7;
	border-bottom: 1px solid #e7e7e7;
}

#enrichment section.label .frame-wrap .label-layer .selector {
	width: 4px;
	height: 100%;
	margin-right: 44px;
	background: #f8f8f8;
}

#enrichment section.label .frame-wrap .label-layer .selector.selected {
	background: #4c84ff;
}

#enrichment section.label .frame-wrap .label-layer .visible {
	width: 18px;
	height: 18px;
	margin-left: -31px;
	margin-right: 13px;
}

#enrichment section.label .frame-wrap .label-layer .visible.on {
	background: url(images/btn_layer_view.png) no-repeat center;
}

#enrichment section.label .frame-wrap .label-layer .visible.off {
	background: url(images/btn_checkbox_normal.png) no-repeat center;
}

#enrichment section.label .frame-wrap .label-layer .visible.off:hover {
	background: url(images/btn_checkbox_hover.png) no-repeat center;
}

#enrichment section.label .frame-wrap .label-layer .switch {
	width: 24px;
	height: 100%;
	object-fit: contain;
	border-left: 1px solid #e5e5e5;
	background: url(images/icon-tree-arrow-bottom.png) no-repeat center;
}

#enrichment section.label .frame-wrap .label-layer .switch.open {
	background: url(images/icon-tree-arrow-bottom.png) no-repeat center;
}

#enrichment section.label .frame-wrap .label-layer .switch.close {
	background: url(images/icon-tree-arrow.png) no-repeat center;
}

#enrichment section.label .frame-wrap .label-layer .name {
	line-height: 100%;
	font-size: 14px;
	font-weight: 300;
	color: #343434;
}
/* 	#enrichment section.label .frame-wrap .label-layer .collision { font-size: 12px; font-weight: 500; color: #999999; float: right; } */
#enrichment section.label .frame-wrap .label-container {
	width: 402px;
	margin: 13px auto;
}

#enrichment section.label .frame-wrap .label-container .label-wrap {
	float: left;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	width: 120px;
	margin: 7px;
}

#enrichment section.label .frame-wrap .label-container .label-wrap canvas
	{
	position: relative;
}

#enrichment section.label .frame-wrap .label-container .label-wrap.collision .crop-img
	{
	border: solid #ff5353 1px;
	background-color: rgba(255, 83, 83, 0.2);
}

#enrichment section.label .frame-wrap .label-container .label-wrap.on .crop-img
	{
	border: solid #218aff 1px;
	background-color: rgba(76, 132, 255, 0.2);
}

#enrichment section.label .frame-wrap .label-container .label-wrap.on.collision .crop-img
	{
	border: solid #218aff 1px;
	background-color: rgba(255, 83, 83, 0.2);
}

#enrichment section.label .frame-wrap .label-container .label-wrap .crop-img
	{
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	flex-direction: column;
	height: 94px;
	width: 120px;
	border: solid 1px #d9d9d9;
	border-radius: 2px;
	background-color: #ffffff;
}

#enrichment section.label .frame-wrap .label-container .label-wrap .label
	{
	width: 100%;
	position: relative;
}

#enrichment section.label .frame-wrap .label-container .label-wrap .label input
	{
	width: 94px;
	position: relative;
	margin: 8px 0 0 0;
	padding: 5px 23px 5px 3px;
	border: 1px solid #d9d9d9;
	border-radius: 2px;
	font-family: Open_Sans;
	font-size: 13px;
	font-weight: 300;
	background: url('images/icon-edit.png') right no-repeat;
	background-color: #ffffff;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

#enrichment section.label .frame-wrap .label-container .label-wrap .label input:focus
	{
	border: 1px solid #218aff;
	background: none;
	background-color: #ffffff;
	background: url('images/icon-edit-hover.png') right no-repeat;
}

#enrichment section.label .frame-wrap .label-container .label-wrap .findTag
	{
	position: absolute;
	top: 25px;
	left: 0;
	width: calc(100% + 1px);
	max-height: 144px;
	margin-top: 16px;
	overflow-x: hidden;
	overflow-y: overlay;
	white-space: nowrap;
	text-overflow: ellipsis;
	border-radius: 2px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1);
	border: 1px solid #dadada;
	background-color: #ffffff;
	z-index: 99999999;
}

#enrichment section.label .frame-wrap .label-container .label-wrap .findTag li
	{
	line-height: 30px;
	padding: 0 16px;
	color: #616263;
}

#enrichment section.label .frame-wrap .label-container .label-wrap .findTag li:nth-of-type(odd)
	{
	background-color: #f8f8f8;
}

#enrichment section.label .frame-wrap .label-container .label-wrap .findTag li:hover
	{
	background-color: #cde5ff;
}

#enrichment section.label .frame-wrap .drag-container {
	width: 104px;
	height: 77px;
	padding: 8px;
	z-index: 1000;
	position: absolute;
	display: none;
	border-radius: 4px;
	box-shadow: 0 11px 9px -3px rgba(0, 0, 0, 0.21);
	background-color: rgba(255, 255, 255, 0.9);
	border: 2px solid #66aeff;
}

#enrichment section.label .frame-wrap .drag-container.not {
	border-color: #999999;
}

#enrichment section.label .frame-wrap .drag-container .num {
	display: inline;
	padding: 2px 7px;
	margin: 3px;
	border-radius: 10px;
	background-color: #ff5353;
	font-size: 12px;
	font-weight: 500;
	color: #ffffff;
}

#enrichment section.label .frame-wrap .drag-container .content .drag_img
	{
	width: 33px;
	height: 33px;
	margin: 0 auto 9px;
	background: url(images/icon_drag_image_allow.png) no-repeat center;
}

#enrichment section.label .frame-wrap .drag-container.not .content .drag_img
	{
	background: url(images/icon_drag_image_notallowed.png) no-repeat center;
}

#enrichment section.label .frame-wrap .drag-container .content .drag_text
	{
	font-size: 12px;
	color: #4c84ff;
	text-align: center;
}

#enrichment section.label .frame-wrap .drag-container.not .content .drag_text
	{
	color: #999999;
}

#enrichment .btn_wrap {
	height: 103px;
	position: absolute;
	right: 0;
	bottom: 0;
	background-color: #ffffff;
	z-index: 99;
}

#enrichment .submit_btn {
	width: 240px;
	line-height: 36px;
	margin: 0 auto;
	border-radius: 23px;
	box-shadow: 0 4px 8px 0 #b4d7ff;
	background-color: #4c84ff;
	font-size: 13px;
	font-weight: 300;
	color: #ffffff;
	cursor: pointer;
}

#enrichment .submit_btn:hover {
	background-color: #3A71E9;
}

#enrichment .list_btn {
	cursor: pointer;
	width: 153px;
	line-height: 44px;
	margin-top: 0;
	font-size: 14px;
	font-weight: 300;
}

#enrichment .list_btn a:hover {
	color: #fff;
	background-color: #008bed;
}

#enrichment section.enrichment .ar {
	position: absolute;
	right: 28px;
}

#enrichment .all_collision-wrap {
	font-size: 12px;
	font-weight: 300;
	color: #555555;
	background-color: #fafafa;
	position: relative;
	width: calc(100% - 56px);
	height: 35px;
	padding: 0 28px;
	border-bottom: 1px solid #e5e5e5;
}

#enrichment .all_collision-wrap .title {
	font-weight: 400;
}

#enrichment .range.collision {
	display: none;
	top: 40px;
	z-index: 9999999
}

#enrichment .range.all_collision {
	display: none;
	position: absolute;
	top: -172px;
	right: -25px;
	z-index: 9999999
}

#enrichment .range.layer-move {
	display: none;
	height: 122px;
	position: absolute;
	top: -50px;
	right: -178px;
	z-index: 9999999
}

#enrichment .range {
	display: none;
	position: relative;
	width: 180px;
	height: 345px;
	padding: 10px 8px;
	border: 1px solid #d9d9d9;
	border-radius: 2px;
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1);
	background-color: #f8f8f8;
}

#enrichment	.range .img {
	min-width: 24px;
	height: 24px;
	margin-right: 1px; /* jh.sa 추가 */
	/*margin-right: 5px;*/
	background: url('images/icon_tree_dataset_selected.png') left no-repeat;
}

#enrichment	.range .range-wrap .name, .range .option label {
	font-size: 13px;
	font-weight: 300;
	color: #616263;
	overflow: hidden; /* jh.sa 추가 */
	text-overflow: ellipsis; /* jh.sa 추가 */
}

/* jh.sa 추가 */
#enrichment .range .option .name {
	text-overflow: ellipsis;
	width: 103px;
	overflow: hidden;
}

#enrichment	.range .range-wrap {
	border-bottom: 1px solid #dadada;
	margin-bottom: 10px;
	padding: 0 7px 10px 7px;
}

#enrichment	.range .range-wrap input[type='range'] {
	width: 110px;
	height: 4px;
	padding: 0px;
}

#enrichment	.range .range-wrap span:not (.name ) {
	display: inline-block;
	width: 41px;
	line-height: 24px;
	margin-left: 10px;
	border: 1px solid #d9d9d9;
	border-radius: 4px;
	background: #ffffff;
	font-size: 12px;
	font-weight: 300;
	text-align: center;
	color: #555555;
}

#enrichment	.range .option {
	padding: 0 7px;
}

#enrichment	.range .option>div {
	margin-bottom: 14px;
	font-size: 12px;
	color: #616263;
}

#enrichment	.range .option input[type='radio'] {
	display: none;
}

#enrichment	.range .option input[type='radio']+label {
	padding-left: 18px;
	margin-right: 18px;
	font-size: 13px;
	background: url('images/btn_radio_normal.png') left no-repeat;
	overflow: hidden;
	cursor: pointer;
}

#enrichment	.range .option input[type='radio']:checked+label {
	background: url('images/btn_radio_selected.png') left no-repeat;
}

#enrichment	.range .collision_btn, #enrichment .range .move_btn {
	position: absolute;
	bottom: 22px;
	left: 39px;
	width: 120px;
	height: 24px;
	border: 1px solid #cbcbcb;
	border-radius: 2px;
	background-color: #f8f8f8;
	font-size: 12px;
	font-weight: 300;
	color: #343434;
}

#enrichment .position-label {
	margin-left: 10px;
	margin-right: 5px
}

#enrichment .position-value {
	padding: 5px;
	width: 50px;
}

#enrichment .quick_wrap {
	margin: 0 auto;
	width: 25%;
}

#enrichment .quick_btn_wrap {
	padding-top: 10px;
}

#enrichment .quick_btn {
	width: 100px;
	line-height: 36px;
	margin: 0 auto;
	margin-top: 5px;
	text-align: center;
	border-radius: 5px;
	box-shadow: 0 4px 8px 0 #e7e7e7;
	background-color: #4c84ff;
	font-size: 11px;
	font-weight: 300;
	color: #fff;
	cursor: pointer;
}

#enrichment .quick_btn:hover {
	background-color: #3A71E9;
}

#enrichment .quick_training, .quick_inference {
	width: 400px;
	background-color: #fafafa;
	padding: 23px;
	border: 1px solid #d9d9d9;
	position: absolute;
	left: 32%;
	top: 210px;
	z-index: 9999999;
	display: none;
}

#enrichment .quick_training.active, .quick_inference.active {
	display: block;
}

#enrichment .quick_training_btn, .quick_inference_btn {
	width: 100px;
	line-height: 28px;
	margin: 0 auto;
	text-align: center;
	border-radius: 23px;
	background-color: #4c84ff;
	font-size: 11px;
	font-weight: 300;
	color: #ffffff;
	cursor: pointer;
}

#enrichment .input_wrap {
	margin: 15px 0;
}

#enrichment .input_wrap label {
	width: 100px;
	font: 400 12px system-ui;
}

#enrichment .input_wrap input[type="text"] {
	width: 210px;
	height: 0px;
	font: 300 12px system-ui;
}

#enrichment .input_wrap input::placeholder {
	font: 400 11px system-ui;
	color: #777;
}

#enrichment .quick_close, .project_close, .config_close,
	.checkpoint_close {
	width: 37px;
	height: 37px;
	margin-top: -10px;
	display: inline-block;
	cursor: pointer;
	background:
		url("${pageContext.request.contextPath}/resources/images/btn-popup-close-normal.png");
}

#enrichment .quick_title {
	font: 400 12px 'Open_Sans';
	padding-bottom: 10px;
}

#enrichment .checkBtn {
	display: inline-block;
	width: 16px;
	height: 16px;
	background:
		url("${pageContext.request.contextPath}/resources/images/icon_gpu_check.png")
		no-repeat center;
}

#enrichment .list_wrap {
	height: calc(100% - 149px);
	position: relative;
	width: 100%;
}

#enrichment table.task_table th {
	border-top: 2px #3a3b3d solid;
	background-color: #fafafa;
	height: 44px;
	font-size: 12px;
	font-weight: 400;
	color: #333333;
}

#enrichment table.task_table th, table.task_table tr, table.task_table td
	{
	text-align: center;
	border-bottom: 1px solid #e5e5e5;
	border-collapse: collapse;
	border-spacing: 0;
}

#enrichment .table_body table.task_table {
	font-family: Open_Sans;
	font-size: 12px;
	color: #343434;
	font-weight: 300;
	border-collapse: collapse;
	width: 100%;
}

#enrichment .table_body table.task_table tr:hover {
	background-color: #f4fcfe;
}

#enrichment .table_body table.task_table td {
	padding-top: 3px;
	padding-bottom: 3px;
	font-size: 11px;
	cursor: default;
}

#enrichment .table_header table.task_table {
	margin-top: 15px;
	border-collapse: collapse;
	width: 100%;
}
/* #enrichment .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
#enrichment .table_body {
	max-height: 340px;
	overflow-y: overlay;
	overflow-x: hidden;
	background-color: #fff;
	position: relative;
	margin-bottom: 17px;
}

#enrichment table td {
	height: 48px;
}

#enrichment .radioBtn {
	margin-left: 5px;
}

#enrichment .csv_name_input_wrap {
	
}

#enrichment .csv_name_input_wrap span {
	font: 400 11px system-ui;
}

#enrichment .csv_name_input_wrap input {
	font: 400 11px system-ui;
	width: 90%;
	height: 0px;
}

#enrichment select {
	height: 40px;
	width: 253px;
	border: 1px solid #dedcde;
	font: 400 11px system-ui;
	background:
		url("${pageContext.request.contextPath}/resources/images/select_arrow.png")
		#fff no-repeat 97% 50%/10px;
}

#enrichment select:focus {
	outline: none;
}

#enrichment .select_project_wrap {
	position: relative;
	left: -1.5%;
	top: 13px;
}

#enrichment .add_project_btn, .training_config_btn, .checkpoint_list_btn
	{
	width: 20px;
	height: 20px;
	margin-left: 18px;
	text-align: center;
	border: 1px solid #dedcde;
	background-color: #fff;
	cursor: pointer;
}

#enrichment .add_project {
	width: 260px;
	height: 318px;
	background-color: #fafafa;
	padding: 23px;
	border: 1px solid #d9d9d9;
	top: -1px;
	left: 100%;
	position: absolute;
	z-index: 999;
	display: none;
}

#enrichment .training_config {
	width: 385px;
	height: 416px;
	background-color: #fafafa;
	padding: 23px;
	border: 1px solid #d9d9d9;
	top: -1px;
	left: 100%;
	position: absolute;
	z-index: 999;
	display: none;
	overflow-y: scroll;
}

#enrichment .add_project.active, .training_config.active,
	.checkpoint_list.active, .inference_config.active {
	display: block !important;
}

#enrichment .add_project input[type="text"] {
	width: 210px;
	height: 0px;
}

#enrichment .add_project label {
	width: 100px;
	font: 400 12px system-ui;
}

#enrichment .add_project textarea {
	width: 210px;
	height: 150px;
	margin: 10px 0;
	font: 400 13px Arial;
}
/* #enrichment .add_project .add_btn { width: 70px; padding: 4px; margin: 0 auto; background-color: #fff; border: 1px solid #dedcde; text-align: center; cursor: pointer; font: 400 13px system-ui; } */
#enrichment .training_config input[type=number]::-webkit-inner-spin-button,
	.training_config input[type=number]::-webkit-outer-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

#enrichment .training_config input, .inference_config input {
	height: 0px;
}

#enrichment .training_config input[type="text"], .inference_config input[type="text"]
	{
	width: 145px !important;
}

#enrichment .training_config label, .inference_config label {
	width: 180px !important;
	font: 400 12px system-ui;
}

#enrichment .inference_config input[type=number]::-webkit-inner-spin-button,
	.training_config input[type=number]::-webkit-outer-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

#enrichment .tooltip_wrap {
	width: 17px;
	height: 17px;
	display: inline-block;
	cursor: pointer;
	margin: 0 5px;
	position: relative;
	top: 4px;
	background:
		url("${pageContext.request.contextPath}/resources/images/btn_help_nor.png")
		no-repeat;
}

#enrichment .tooltip {
	min-width: 166px;
	max-width: 166px;
	padding: 12px 12px 12px 12px;
	color: #fff;
	background-color: rgba(0, 0, 0, 0.6);
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	font: 400 12px system-ui;
	position: absolute;
	z-index: 9999;
	left: 47%;
	padding-left: 12px;
	visibility: hidden;
	opacity: 0;
	transition: visibility 0s, opacity 0.3s ease;
}

#enrichment .tooltip.on {
	visibility: visible;
	opacity: 1;
	transition: visibility 0s, opacity 0.3s ease;
}

#enrichment .description_wrap {
	min-width: 340px;
	max-width: 340px;
	margin: 17px 0;
	padding: 15px;
}

#enrichment .description_wrap.border {
	border: 1px solid #dedcde;
}

#enrichment .description_wrap .description {
	font: 400 12px system-ui;
}

#enrichment .inference_config_btn {
	width: 20px;
	height: 20px;
	margin-left: 18px;
	text-align: center;
	border: 1px solid #dedcde;
	background-color: #fff;
	cursor: pointer;
	position: absolute;
	top: 13px;
	left: 89%;
	font-size: 13px;
}

#enrichment .inference_config {
	width: 385px;
	height: 526px;
	background-color: #fafafa;
	padding: 23px;
	border: 1px solid #d9d9d9;
	top: -1px;
	left: 100%;
	position: absolute;
	z-index: 999;
	display: none;
	overflow-y: scroll;
}

#enrichment .checkpoint_list {
	width: 385px;
	height: 490px;
	background-color: #fafafa;
	padding: 23px;
	border: 1px solid #d9d9d9;
	top: -1px;
	left: 100%;
	position: absolute;
	z-index: 999;
	display: none;
	overflow-y: scroll;
}
/* #enrichment .checkBtn { display:inline-block; width: 16px; height: 16px; background: url("${pageContext.request.contextPath}/resources/images/icon_gpu_check.png") no-repeat center; } */
#enrichment .checkpoint_list .list_wrap {
	height: calc(100% - 149px);
	position: relative;
	width: 100%;
}

#enrichment .checkpoint_list table.checkpoint_table th {
	border-top: 2px #3a3b3d solid;
	background-color: #fafafa;
	height: 44px;
	font-size: 11px;
	font-weight: 400;
	color: #333333;
}

#enrichment .checkpoint_list table.checkpoint_table th, table.checkpoint_table tr,
	table.checkpoint_table td {
	text-align: center;
	border-bottom: 1px solid #e5e5e5;
	border-collapse: collapse;
	border-spacing: 0;
}

#enrichment .checkpoint_list .table_body table.checkpoint_table {
	font-family: Open_Sans;
	font-size: 12px;
	color: #343434;
	font-weight: 300;
	border-collapse: collapse;
	width: 100%;
}

#enrichment .checkpoint_list .table_body table.checkpoint_table tr:hover
	{
	background-color: #f4fcfe;
}

#enrichment .checkpoint_list .table_body table.checkpoint_table td {
	padding-top: 3px;
	padding-bottom: 3px;
}

#enrichment .checkpoint_list .table_header table.checkpoint_table {
	margin-top: 15px;
	border-collapse: collapse;
	width: 100%;
}
/* #enrichment .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
#enrichment .checkpoint_list .table_body {
	max-height: 340px;
	overflow-y: overlay;
	overflow-x: hidden;
	background-color: #fff;
	position: relative;
	margin-bottom: 17px;
}

#enrichment .checkpoint_list table td {
	height: 48px;
}

#enrichment .checkpoint_list .checkpoint_table .radioBtn {
	margin-left: 5px;
}

#enrichment .checkpoint_list .selected_task_name {
	font: 400 11px system-ui !important;
	color: #777 !important;
}

#enrichment .empty_wrap {
	text-align: center;
	margin-top: 120px;
}

#enrichment .empty_wrap .no_image {
	margin-bottom: 17px;
	background-repeat: no-repeat;
	background-position-x: center;
}

#enrichment .empty_wrap .eng_text {
	font-family: Open_Sans;
	margin-bottom: 3px;
	font-size: 16px;
	font-weight: 300;
	color: #777777;
}

#enrichment .empty_wrap .kor_text {
	font-family: Open_Sans;
	font-size: 12px;
	color: #777777;
	font-weight: 200;
	margin-bottom: 120px;
}

#enrichment .no_image {
	height: 37px;
	background-image: url('./images/icon_nodata_list.png');
}

#enrichment .checkpoint_view {
	width: 270px;
	font: 400 10px system-ui;
	margin: -6px auto -6px 103px;
	display: none;
}

#enrichment .checkpoint_view.active {
	display: block;
}

#enrichment .inference_checkpoint {
	padding-top: 10px;
}

#enrichment .inference_checkpoint .list_wrap {
	height: calc(100% - 149px);
	position: relative;
	width: 100%;
}

#enrichment .inference_checkpoint table.checkpoint_table th {
	border-top: 2px #3a3b3d solid;
	background-color: #fafafa;
	height: 44px;
	font-size: 11px;
	font-weight: 400;
	color: #333333;
}

#enrichment .inference_checkpoint table.checkpoint_table th, table.checkpoint_table tr,
	table.checkpoint_table td {
	text-align: center;
	border-bottom: 1px solid #e5e5e5;
	border-collapse: collapse;
	border-spacing: 0;
}

#enrichment .inference_checkpoint .table_body table.checkpoint_table {
	font-family: Open_Sans;
	font-size: 12px;
	color: #343434;
	font-weight: 300;
	border-collapse: collapse;
	width: 100%;
}

#enrichment .inference_checkpoint .table_body table.checkpoint_table tr:hover
	{
	background-color: #f4fcfe;
}

#enrichment .inference_checkpoint .table_body table.checkpoint_table td
	{
	padding-top: 3px;
	padding-bottom: 3px;
}

#enrichment .inference_checkpoint .table_header table.checkpoint_table {
	margin-top: 15px;
	border-collapse: collapse;
	width: 100%;
}
/* #enrichment .table_body {max-height: calc(100% - 103px); overflow-y: overlay; overflow-x:hidden; background-color: #fff; position:relative; margin-bottom: 17px; } */
#enrichment .inference_checkpoint .table_body {
	max-height: 340px;
	overflow-y: overlay;
	overflow-x: hidden;
	background-color: #fff;
	position: relative;
	margin-bottom: 17px;
}

#enrichment .inference_checkpoint table td {
	height: 48px;
}

#enrichment .inference_algorithm {
	font: 400 10px system-ui;
}

#enrichment .side_btn_wrap {
	margin: 0 auto;
	width: 60%;
}

#enrichment .side_btn_wrap .cancel_btn {
	width: 100px;
	line-height: 36px;
	margin: 0 auto;
	padding: 10px 0px;
	margin-top: 5px;
	text-align: center;
	background-color: #fff;
	color: #777;
	font: 300 11px system-ui;
	cursor: pointer;
	border: 1px solid #e0e0e0;
}

#enrichment .side_btn_wrap .save_btn, .side_btn_wrap .add_btn {
	width: 100px;
	line-height: 36px;
	padding: 10px 0px;
	margin: 0 auto;
	margin-top: 5px;
	text-align: center;
	background-color: #4c84ff;
	color: #fff;
	font: 300 11px system-ui;
	cursor: pointer;
	border: 1px solid #e0e0e0;
}

#enrichment .checkpoint_list .side_btn_wrap {
	margin-top: 60px;
	text-overflow: ellipsis;
}

#enrichment .quick_wrap select { padding: 5px 20px; }

#enrichment .hover_box { max-width: 140px; border: 1px solid #d9d9d9; text-align: center; z-index: 9999; display: none; position: absolute; border-radius: 2px; box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.19); background-color: #ffffff; }
#enrichment .hover_box div {font-family: Open_Sans; font-size: 13px; color: #555555;}
#enrichment .hover_div div {word-break: break-word; margin: 2px 5px; line-height:20px; white-space: normal; font-weight: 300; font-family: Open_Sans;}

#enrichment .canvas-wrap span:first-child { font-size: 13px; }
#enrichment .canvas-wrap span:last-child { color: #4c84ff; font-size: 14px; }
</style>
<c:set var="datasetId" value="${param.datasetId}" />
<div class="container" id="enrichment">
	<div class="contents">
		<div class="enrichment_wrap flex">
			<!-- jpark -->
			<section class="enrichment">
				<div class="title-wrap">
					<span class="canvas-wrap"><span>Enrichment</span> <span>|</span> Canvas</span>
					<div class='labelPaste_btn disable fr'>paste</div>
					<div class='labelCopy_btn fr'>copy</div>
					<div class='poly_btn fr' hidden>polygon</div>
				</div>

				<div class="frame-wrap" oncontextmenu='return false'>
					<div class="prev prev_btn"></div>
					<div class="next next_btn"></div>
					<div id="frame-container">
						<canvas id='c' width="800px" height="600px"></canvas>
					</div>
				</div>
				<div class="imgList-wrap">
					<div class="all_collision-wrap flex">
						<div class="title">Data</div>
						<div class="position-label">Position :</div>
						<input type="text" class="position-value" value="0" onKeyPress="return checkNum2(event);" />
						
						<!-- 임시로 막아둠 -->
<!-- 						<div class="ar flex"> -->

<!-- 							Collision batch processing : -->
<!-- 							<div class="area-wrap flex"> -->
<!-- 								<div class="area"> -->
<!-- 									<span class="percent">none</span> -->
<!-- 								</div> -->
<!-- 								<div class="arrow-btn"></div> -->
<!-- 							</div> -->

<!-- 							&nbsp;&nbsp;&nbsp;&nbsp;Label batch transfer -->
<!-- 							<div class="layer-move-wrap flex"> -->
<!-- 								<div class="arrow-btn"></div> -->
<!-- 							</div> -->
<!-- 						</div> -->


						<!-- 							<div class="position-wrap"> -->
						<!-- 								<div class="position-label">Position</div> -->
						<!-- 								<input type="text" class="position-value" value="0"/> -->
						<!-- 							</div>    -->
						<div class="all_collision range">
							<div class="range-wrap">
								<div class="aTitle flex">
									<div class="img"></div>
									<span class="name"></span>
								</div>
								<div class="flex">
									<input name="aRange" type="range" min="0" max="100" step="5"
										value="100"> <span class="aPercent"></span>
								</div>
							</div>
							<div class="range-wrap">
								<div class="bTitle flex">
									<div class="img"></div>
									<span class="name"></span>
								</div>
								<div class="flex">
									<input name="bRange" type="range" min="0" max="100" step="5"
										value="100"> <span class="bPercent"></span>
								</div>
							</div>
							<div class="option">
								<div>*Please select a base layer</div>
								<input class="" type="radio" name="all_layer" id="all_aLayer" value="0" checked="checked"> 
								<label for="all_aLayer" class="flex">
									<div class="aTitle flex">
											<div class="img"></div>
											<span class="name"></span>
									</div>
								</label> 
								<input class="" type="radio" name="all_layer" id="all_bLayer" value="1"> 
								<label for="all_bLayer" class="flex">
									<div class="bTitle flex">
										<div class="img"></div>
										<span class="name"></span>
									</div>
								</label> 
								<br>
								<div>*Please select a condition</div>
								<input class="" type="radio" name="all_option" id="all_and"
									value="0" checked="checked"> <label for="all_and">and</label>
								<input class="" type="radio" name="all_option" id="all_or"
									value="1"> <label for="all_or">or</label>
							</div>
							<button type="button" class="collision_btn">Batch
								processing</button>
						</div>
						<div class="layer-move range">
							<div class="option">
								<div>*Please select transfer layer</div>
								<input class="" type="radio" name="move_layer" id="move_aLayer"
									value="0" checked="checked"> <label for="move_aLayer"
									class="flex"><div class="aTitle flex">
										<div class="img"></div>
										<span class="name"></span>
									</div></label> <input class="" type="radio" name="move_layer"
									id="move_bLayer" value="1"> <label for="move_bLayer"
									class="flex"><div class="bTitle flex">
										<div class="img"></div>
										<span class="name"></span>
									</div></label>
							</div>
							<button type="button" class="move_btn">Batch transfer</button>
						</div>
					</div>
					<div class="imgList"></div>
				</div>
				<!-- Quick Training & Inference -->
				<div class="quick_wrap flex">
					<div id="quick_training_btn" class="quick_btn">Quick Training</div>
					<div id="quick_inference_btn" class="quick_btn">Quick
						Inference</div>

					<!-- Quick Training -->
					<div id="quick_training" class="quick_training">
						<div class="quick_title">
							Quick Training<span class="quick_close fr"></span>
						</div>
						<div class="input_wrap flex">
							<label>Annotation</label> 
							<input type="text" name="annotation_name" data-length="100" placeholder="Please enter the annotation name" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'>
						</div>
						<div class="input_wrap flex">
							<label>Project</label> <select id="project_result"
								class="project_result" name="project_result">

							</select> <span class="add_project_btn">+</span>
						</div>
						<div class="input_wrap flex"> 
							<label>Task</label> <input type="text" name="task_name"
								placeholder="Please enter the task name" data-length="100" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'>
						</div>
						<div class="input_wrap flex">
							<label>Description</label> <input type="text"
								name="task_contents"
								data-length="200" 
								placeholder="Please enter the task description">
						</div>
						<div class="input_wrap flex">
							<label>Inheritance</label> <select id="task_result"
								class="task_result" name="task_result">

							</select> <span class="checkpoint_list_btn">+</span>
						</div>
						<span class="checkpoint_view"></span>
						<div class="input_wrap flex">
							<label>Algorithm</label> <select id="algorithm_result"
								class="algorithm_result" name="algorithm_result">

							</select> <span class="training_config_btn">+</span>
						</div>
						<div class="quick_btn_wrap">
							<div class="quick_training_btn">Start Training</div>
						</div>
						<div id="add_project" class="add_project">
							<div class="quick_title">
								Create New Project
								<!-- 								<span class="project_close fr"></span>							 -->
							</div>
							<input type="text" name="title"
								placeholder="Please enter the title" data-length="100" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'>
							<textarea class="contents_area" name="contents"
								data-length="200" 
								placeholder="Please enter the description"></textarea>
							<div class="side_btn_wrap flex">
								<div class="cancel_btn">Cancel</div>
								<div class="add_btn">Create</div>
							</div>

						</div>
						<div id="checkpoint_list" class="checkpoint_list">
							<div class="quick_title">
								Select Model <span class="selected_task_name"></span>
								<!-- 								<span class="checkpoint_close fr"></span> -->
							</div>
							<div class="list_wrap">
								<div class="table_header">
									<table class="checkpoint_table">
										<colgroup>
											<col style="width: 15px;"></col>
											<col style="width: 200px;"></col>
										</colgroup>
										<thead>
											<tr>
												<th><div class="checkBtn"></div></th>
												<th>MODEL</th>
											</tr>
										</thead>
									</table>
								</div>
								<div class="table_body">
									<table class="checkpoint_table">
										<colgroup>
											<col style="width: 15px;"></col>
											<col style="width: 200px;"></col>
										</colgroup>
										<tbody>
											<!--                                     <tr><td colspan='4' align='center'>Loading GPU list...</td></tr> -->
										</tbody>
									</table>
								</div>
							</div>
							<div class="side_btn_wrap flex">
								<div class="cancel_btn">Cancel</div>
								<div class="save_btn">Save</div>
							</div>
						</div>
						<div id="training_config" class="training_config">
							<div class="quick_title">
								Training Config
								<!-- 								<span class="config_close fr"></span>		 -->
							</div>
							<div class="description_wrap"></div>
							<div class="config_wrap"></div>
							<div class="side_btn_wrap flex">
								<div class="cancel_btn">Cancel</div>
								<div class="save_btn">Save</div>
							</div>
						</div>
					</div>



					<!-- Quick Inference -->
					<div id="quick_inference" class="quick_inference">
						<div class="quick_title">
							Quick Inference<span class="quick_close fr"></span>
						</div>
						<div class="csv_name_input_wrap">
							<!-- 							<span>output file name</span> -->
							<input type="text" name="csv_title"
								placeholder="Please enter the output file name" onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/>
						</div>
						<div class="quick_task_list">
							<div class="list_wrap">
								<div class="table_header">
									<table class="task_table">
										<colgroup>
											<col style="width: 25px;"></col>
											<col style="width: 200px;"></col>
											<col style="width: 5px;"></col>
										</colgroup>
										<thead>
											<tr>
												<th><div class="checkBtn"></div></th>
												<th>Select Task</th>
												<th><span class="inference_config_btn">+</span></th>
											</tr>
										</thead>
									</table>
								</div>
								<div class="table_body">
									<table class="task_table">
										<colgroup>
											<col style="width: 15px;"></col>
											<col style="width: 200px;"></col>
										</colgroup>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="quick_btn_wrap">
							<div class="quick_inference_btn">Start Inference</div>
						</div>
						<div id="inference_config" class="inference_config">
							<div class="quick_title">
								Inference Config & Select Model
								<!-- 								<span class="config_close fr"></span>		 -->
							</div>
							<div class="inference_algorithm"></div>
							<div class="description_wrap"></div>
							<div class="config_wrap"></div>
							<div class="inference_checkpoint">
								<div class="list_wrap">
									<div class="table_header">
										<table class="checkpoint_table">
											<colgroup>
												<col style="width: 15px;"></col>
												<col style="width: 200px;"></col>
											</colgroup>
											<thead>
												<tr>
													<th><div class="checkBtn"></div></th>
													<th>MODEL</th>
												</tr>
											</thead>
										</table>
									</div>
									<div class="table_body">
										<table class="checkpoint_table">
											<colgroup>
												<col style="width: 15px;"></col>
												<col style="width: 200px;"></col>
											</colgroup>
											<tbody>
												<!--                                     <tr><td colspan='4' align='center'>Loading GPU list...</td></tr> -->
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="side_btn_wrap flex">
								<div class="cancel_btn">Cancel</div>
								<div class="save_btn">Save</div>
							</div>
						</div>
					</div>
				</div>

			</section>
			<section class="label">
				<div class="tag-wrap">
					<div class="title flex">
						<div class="name">Filter</div>
<!-- 						<div class="name">Tag</div> -->
						<div class="info ar">
							<div class="layer_bar"></div>
							<span class="layer_name"></span> : Filters <span class="num"></span>
						</div>
					</div>
					<div class="content-wrap"></div>
				</div>
				<div class='clear'></div>
				<div class="collision-wrap flex">
					<div class="title">Label</div>
					
						<!-- 임시로 막아둠 -->
<!-- 					<div class="title">Layer</div> -->
<!-- 					<div class="ar flex"> -->
<!-- 						Collision Check : -->
<!-- 						<div class="area-wrap flex"> -->
<!-- 							<div class="area"> -->
<!-- 								<span class="percent">none</span> -->
<!-- 							</div> -->
<!-- 							<div class="arrow-btn"></div> -->
<!-- 						</div> -->
<!-- 					</div> -->

					<div class="collision range ar">
						<div class="range-wrap">
							<div class="aTitle flex">
								<div class="img"></div>
								<span class="name"></span>
							</div>
							<div class="flex">
								<input name="aRange" type="range" min="0" max="100" step="5"
									value="100"> <span class="aPercent"></span>
							</div>
						</div>
						<div class="range-wrap">
							<div class="bTitle flex">
								<div class="img"></div>
								<span class="name"></span>
							</div>
							<div class="flex">
								<input name="bRange" type="range" min="0" max="100" step="5"
									value="100"> <span class="bPercent"></span>
							</div>
						</div>
						<div class="option">
							<div>* Please select a base layer</div>
							<input class="" type="radio" name="layer" id="aLayer" value="0"
								checked="checked"> <label for="aLayer" class="flex">
								<div class="aTitle flex">
									<div class="img"></div>
									<span class="name"></span>
								</div>
							</label> <input class="" type="radio" name="layer" id="bLayer" value="1">
							<label for="bLayer" class="flex">
								<div class="bTitle flex">
									<div class="img"></div>
									<span class="name"></span>
								</div>
							</label> <br>
							<div>*Please select a condition</div>
							<input class="" type="radio" name="option" id="and" value="0"
								checked="checked"> <label for="and">and</label> <input
								class="" type="radio" name="option" id="or" value="1"> <label
								for="or">or</label>
						</div>
						<button type="button" class="collision_btn">Confirm</button>
					</div>
				</div>
				<div class="frame-wrap" oncontextmenu='return false'></div>
				<div class="btn_wrap flex">
					<div id="submit" class="submit_btn">Save</div>
				</div>
			</section>
			<!-- jpark -->
		</div>
	</div>
	<!-- end contents -->
</div>

<script src="<c:url value="/js/download.js" />"></script>

<script>
	var colorHash = new ColorHash();

	//undo, redo
	var hObjTemplete = {
		stack : [],
		cursor : 0,
		label : {
			action : {},	// “create” or “remove” or “update”
			list : [],		// layerId : {}, labelId : {}, labelValue : {}, before : {}
		},
	};
	var hObj = null;
	//
	var dataset_id;
	var media_type;
	var label_type;
	let selected_task_id;
	let quick_project_id;
	let current_swiperInfo;
	let compare_flag = false;
	let flag = false;
	let state = false;
	// label_type
	let isBoxData = false;
	let isPolyData = false;	
	const enrichment = {
		pt:$("#enrichment"),
		data: {
			nodes: null,

			enrichCanvas: null,
			enrichPanel: null,
			enrichSwiper: null,

			imgMap: {},
			imgList: [],
			assetList: [],

			canvas: null,
			gInfo: {current_cursor:0},
			gArr: [],
			gObjTemplete: {
				imgSrc : 0,
				imgInfo: {scaleFactor : 1 , width : 0 , height : 0},
				img : null,
				newRect : {id : 0, width: null, height: null, left: null, top: null, angle: 0,fill: 'rgba(33,138,255,0.5)',label:""},	
				layer : {},
				tempRect : {beforeX:0,beforeY:0,afterX:0,afterY:0}
			},
			gObj: null,
			cObj: {},
			
			isCollision : false,
			
			//canvas size
			canvWidth: 0,
			canvHeight: 0,
			titleHeight: 58,
			framePaddingHeight:82,
			imgListHeight: 200,
			
		},
		getLastCursor() {
	 			var that = this;
	 			let result;
	 			$.ajax({
	 				url :  baseUrl + "data/getLastCursor.json",
	 				data : {dataset_id : dataset_id * 1},					//	id => dataset_id(0921)
	 				type : "GET",
	 				async : false,
	 				success : function(res){
	 					console.log("=====getLastCursor=====",res);
	 					if(res.result.code == "200"){
	 						result = res.result.data;
	 					} else if(res.result.code == "2001"){
							alert(res.result.data);
							location.href = baseUrl + 'login';
						}
	 				},
	 				error : function(err){
	 					$("#loader").hide();
	 					alert(err);
	 					console.log("ERROR!!", err);
	 				}
	 			}); 	
	 			return result;
	 		},
		init(nodes, current_cursor) {
			const that = this;
			
			that.data.nodes = nodes;
  			dataset_id = nodes[0].id;
			console.log("nodes : ", nodes);
  			console.log("state : " + state);
			console.log("status : " + nodes[0].status);
  			
  			if(state == false && $("#" + nodes[0].tId + "_loading").hasClass("upload_wait")) {
  				alert("데이터를 업로드 하는 중입니다...");
  				state = true;
  				/* history.go(0); */
  			}
  			/* if(nodes[0].status == '1') {
  				$("#" + nodes[0].tId + "_loading").removeClass("upload_wait");
  				$("#" + nodes[0].tId + "_loading").addClass("upload_complete");
  			} */
  			that.computed.getDatasetById(dataset_id);
   			if(nodes.length == 1) {
 				current_cursor = that.getLastCursor();
 				compare_flag = false;
  			} else if(nodes.length >= 2 && compare_flag === false) {
  				current_cursor = 0;
  				compare_flag = true;
  			}
 
  			isPolyData = false;
  			isBoxData = false;
  			
  			console.log(current_cursor);
 			
			that.reset(current_cursor);
			setParentObj(this);			
			
			if(nodes.length>2){
				alert("레이어는 최대 2개까지 선택할 수 있습니다 \n다시 시도해주세요");
   						
   				labeller.pt.find("div.section").removeClass("selected");
   				var node = ".section.info";
   				labeller.pt.find(node).addClass("selected");
   				return false;
			} else if (nodes.length == 2 ){
				that.computed.getDataList(nodes);
			} else {
				that.computed.getDataList(nodes);
			};
			
			// jh.sa 추가: label 작업 시 save_btn 누르면 image list의 position value가 0으로 돌아가던 문제 수정
			console.log("current_cursor:: ", current_cursor);
			if(current_cursor != 0 && current_cursor != "undefined" && current_cursor != null){
				$(".position-value")[0].value = current_cursor;
			} else if(current_cursor == null || current_cursor == "undefined" || current_cursor == 0) {
				$(".position-value")[0].value = 0;
			}
// 			$(".position-value")[0].value = 0;
			
			// Quick Training & Inference
			that.pt.find(".quick_training").removeClass("active");
			that.pt.find(".quick_inference").removeClass("active");
			that.pt.find(".quick_task_list .list_wrap .table_body .task_table tbody").html("");
			that.bind.quickTraining();
			that.bind.quickInference();
		
		},
		bind : {
			root : null,
			
			evtInit() {
				const that = this;

				that.arrow();
				that.submit();
				that.keyDown();
				that.collision();
				that.inputCheck();

// 				that.windowResize();
			},
			
// 			windowResize() {
// 				const that = this;
// 				$(window).resize(function(e){
// 					console.log(e);
					
// 					that.root.setCanvasSize();
					
// 					const enrichCanvas = that.root.data.enrichCanvas;
// 					enrichCanvas.render.drawInit();
					
// 				});
// 			},
			collision() {
				const that = this;

				$(".area-wrap .arrow-btn").off("click").on("click", function(){
					if(that.root.data.nodes.length<2){
						alert("비교할 레이어가 없습니다");
						return false;
					}
					
					if($(this).parents(".collision-wrap").length>0){
						$(".collision").show();
					} else if($(this).parents(".all_collision-wrap").length>0) {
						$(".all_collision").show();
					}
					
					$("body").on("mousedown", that.root.computed.onBodyMouseDown);
				});
				$(".layer-move-wrap .arrow-btn").off("click").on("click", function(){
					if(that.root.data.nodes.length<2){
						alert("비교할 레이어가 없습니다");
						return false;
					}
					$(".layer-move").show();
					
					$("body").on("mousedown", that.root.computed.onBodyMouseDown);
				});
				
				let rangeDown = false;
				$(".range input[type='range']").off("mousedown").on("mousedown", function(){
					rangeDown = true;
				});
				$(".range input[type='range']").off("mouseup").on("mouseup", function(){
					rangeDown = false;
					
					if($(this).parents(".collision").length>0){
						$(".collision-wrap .percent").text($(this).val()+"%");
					} else if($(this).parents(".all_collision").length>0){
						$(".all_collision-wrap .percent").text($(this).val()+"%");
					}
					$(this).next().text($(this).val()+"%");
				});
				$(".range input[type='range']").off("mousemove").on("mousemove", function(){
					if(!rangeDown) { return; }
					if($(this).parents(".collision").length>0){
						$(".collision-wrap .percent").text($(this).val()+"%");
					} else if($(this).parents(".all_collision").length>0){
						$(".all_collision-wrap .percent").text($(this).val()+"%");
					}
					$(this).next().text($(this).val()+"%");
				});
				$(".collision_btn").off("click").on("click", function(){
					let selected, 	// 선택한 layer
						option;		// 선택한 옵션 (and : 두 레이어 범위 모두 만족시, or : 둘 중 한 레이어라도 범위 만족시)
					if($(this).parents(".collision").length>0){
						$(".label .label-wrap").removeClass("collision");
						
						selected = $(".collision input[name='layer']:checked").val();
						option = $(".collision input[name='option']:checked").val();
						
						that.root.computed.collision(false, selected, option);
					} else if($(this).parents(".all_collision").length>0){
						if(confirm("충돌 라벨을 모두 삭제하시겠습니까?") == true){  
							selected = $(".all_collision input[name='all_layer']:checked").val();
							option = $(".all_collision input[name='all_option']:checked").val();
							
							that.root.computed.collision(true, selected, option);
						}
					}
					
					$(".range").hide();
					$("body").off("mousedown", that.root.computed.onBodyMouseDown);
				});
				$(".move_btn").off("click").on("click", function(){
					let selected, option;
					
					selected = $(".layer-move input[name='move_layer']:checked").val();
					that.root.computed.layerMove(selected);
						
					
					
					$(".range").hide();
					$("body").off("mousedown", that.root.computed.onBodyMouseDown);
				});
			},

			arrow() {
				const that = this;
				
				//이미지 index와 커서 위치 비교
				/* function imgListCheck() {
					const cursor = that.root.data.gInfo.current_cursor;
					const index = $(".swiper-slide-active").attr("id").split("_")[1];
					const enrichSwiper = that.root.data.enrichSwiper;
					
					if(cursor == index){
						return true;
					} else {
						enrichSwiper.render.drawSwiper();
						return false;
					}
				} */

				//gInfo.current_cursor 줄이고 initEnrichment() 호출
				$(".prev_btn").off("click").on("click", function(){
					$("#loader").show();
					let cursor = that.root.data.gInfo.current_cursor;
					const enrichSwiper = that.root.data.enrichSwiper;
					const swiper = enrichSwiper.data.swiper;
					enrichSwiper.data.chkMouseEvent[0] = true;

					if(cursor > 0){
						that.root.data.gInfo.current_cursor--;
						setTimeout(()=>{
							that.root.computed.initEnrichment();
						}, 0);
						swiper.slidePrev();
						$(".position-value")[0].value = that.root.data.gInfo.current_cursor;
					} else{
						$("#loader").hide();
						alert("첫번째 이미지 입니다");
					}
				});
				//gInfo.current_cursor 늘리고 initEnrichment() 호출
				$(".next_btn").off("click").on("click", function(){
					$("#loader").show();
					let cursor = that.root.data.gInfo.current_cursor;
					const imgList = that.root.data.imgList;
					const enrichSwiper = that.root.data.enrichSwiper;
					const swiper = enrichSwiper.data.swiper;
					enrichSwiper.data.chkMouseEvent[0] = true;

					if(cursor < imgList.length - 1){
						that.root.data.gInfo.current_cursor++;
						setTimeout(() => {
							that.root.computed.initEnrichment();
							
						}, 0);
						swiper.slideNext();
						$(".position-value")[0].value = that.root.data.gInfo.current_cursor;
							
					} else{
						$("#loader").hide();
						alert("마지막 이미지 입니다");
					}
				});
			},
			submit() {
				const that = this;

				$("#submit").off("click").on("click", function(){
					const labelArr = $(".label-container .label input[type='text']");
					
					for(let i=0; i<labelArr.length; i++){
						if($(labelArr[i]).val() == "") {
							alert("Label 이름을 입력해주세요");
							$(labelArr[i]).focus();
							
							return false;
						}
					}
					
					that.root.computed.submitMeta();
				});
			},
			
			inputCheck() {
				const that = this;
				
				$("input").off("input").on("input",function(e){				
					//영문, 숫자, 특수문자
					if($(this).attr("type") == "number" || $(this).hasClass("position-value")){
						
					} else if($(this).val().match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
						alert("영문과 특수문자 및 숫자만 입력 가능합니다");
					}						
					var str = $(this).val().replace(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/gi,"");					
// 					let str = $(this).val();
					if(str.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
						
						if($(this).attr("type") == "file"){
							
						} else {
							$(this).val(str.slice(0, -1));						
						}
						
					} else {
						if($(this).attr("type") == "file"){
							
						} else {
							$(this).val(str);						
						}
					}
					
					if($(this).data("length") == 100 && $(this).val().length > 100){
						var string = $(this).val();
						alert("입력 가능한 텍스트 개수를 초과하였습니다\n중간에 입력하신 경우 기존 텍스트의 마지막 글자를 삭제합니다");
						$(this).val(string.slice(0,100));
						return false;
					} else if ($(this).data("length") == 200 && $(this).val().length > 200){
						var string = $(this).val();
						alert("입력 가능한 텍스트 개수를 초과하였습니다\n중간에 입력하신 경우 기존 텍스트의 마지막 글자를 삭제합니다");
						$(this).val(string.slice(0,200));
						return false;	
					} else if ($(this).data("length") == 250 && $(this).val().length > 250){
						var string = $(this).val();
						alert("입력 가능한 텍스트 개수를 초과하였습니다\n중간에 입력하신 경우 기존 텍스트의 마지막 글자를 삭제합니다");
						$(this).val(string.slice(0,250));
						return false;							
					}			

					
					
					return;				
					
				

				});
				
				$("textarea").off("input").on("input",function(e){
					//영문, 숫자, 특수문자
					if($(this).val().match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
						alert("영문과 특수문자 및 숫자만 입력 가능합니다");
					}						
					var str = $(this).val().replace(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/gi,"");	
// 					let str = $(this).val();
					if(str.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
							$(this).val(str.slice(0, -1));						
					} else {
							$(this).val(str);						
					}
					
					if ($(this).data("length") == 200 && $(this).val().length > 200){
						var string = $(this).val();
						alert("입력 가능한 텍스트 개수를 초과하였습니다\n중간에 입력하신 경우 기존 텍스트의 마지막 글자를 삭제합니다");
						$(this).val(string.slice(0,200));
						return false;	
					}	
					
					return;						

				});					
			},
			// Quick Training & Inference
			quickTraining() {
				const that = this;
				
				// quick training 팝업창 띄우기
				$("#quick_training_btn").off("click").on("click", function(){
					$(".quick_training").toggleClass("active");
					$(".quick_training").draggable();
					$(".add_project").removeClass("active");
					$(".checkpoint_list").removeClass("active");
					$(".quick_training .radioBtn.selected").removeClass("selected");	
					$(".training_config").removeClass("active");
					$(".add_project_btn")[0].textContent = "+";
					$(".training_config_btn")[0].textContent = "+";
					$("#quick_training .checkpoint_list_btn")[0].textContent = "+";
					that.root.pt.find(".description_wrap").removeClass("border");
					that.root.pt.find(".checkpoint_view").removeClass("active");
					that.root.pt.find(".algorithm_result").removeAttr("disabled");
					that.root.pt.find("#training_config .config_wrap").html("");
					that.root.pt.find("#training_config .description_wrap").html("");	
					that.root.pt.find(".empty_wrap").remove();
					// j.seo 수정
					/* that.root.computed.getDatasetList(); */
					that.root.computed.setAnnoTaskName();
					that.root.computed.getTaskList(null, "0");
					that.root.computed.getAlgorithmList();
				});
				// 새 project 생성 창 띄우기 버튼 
				$(".add_project_btn").off("click").on("click", function() {
					let add_project_zIndex = parseInt($("#quick_training .add_project").css("zIndex"));
					let checkpoint_list_zIndex = parseInt($("#quick_training .checkpoint_list").css("zIndex"));
					let train_config_zIndex = parseInt($("#quick_training .training_config").css("zIndex"));	
					
					$(".add_project").toggleClass("active");
					$(".add_project input").val("");
					$(".add_project textarea").val("");
					if($(".add_project").hasClass("active")){
						$(".add_project_btn")[0].textContent = "-";
					} else {
						$(".add_project_btn")[0].textContent = "+";
					}
					
					// z-index 우선순위 제어
					if(add_project_zIndex <= checkpoint_list_zIndex){
						$("#quick_training .add_project").css({"zIndex":checkpoint_list_zIndex + 1});
					} else if(add_project_zIndex <= train_config_zIndex) {
						$("#quick_training .add_project").css({"zIndex":train_config_zIndex + 1});
					}					
				});
				// Checkpoint list 창 띄우기 버튼
				$("#quick_training .checkpoint_list_btn").off("click").on("click", function() {
					let add_project_zIndex = parseInt($("#quick_training .add_project").css("zIndex"));
					let checkpoint_list_zIndex = parseInt($("#quick_training .checkpoint_list").css("zIndex"));
					let train_config_zIndex = parseInt($("#quick_training .training_config").css("zIndex"));
					
					if($(".task_result").val() != ""){
						$("#quick_training .checkpoint_list").toggleClass("active");
// 						that.root.pt.find(".empty_wrap").remove();
// 						$(".quick_training .radioBtn.selected").removeClass("selected");	// 수정 창 띄울때 없애는것이 아니라 옵션이 바뀔때 없애야함
						if($("#quick_training .checkpoint_list").hasClass("active")){
							$("#quick_training .checkpoint_list_btn")[0].textContent = "-";
						} else {
							$("#quick_training .checkpoint_list_btn")[0].textContent = "+";
						}					
					} else {
						alert("Inheritance에 사용할 task를 선택해주세요");	
					}
					
					// z-index 우선순위 제어
					if(checkpoint_list_zIndex <= add_project_zIndex){
						$("#quick_training .checkpoint_list").css({"zIndex":add_project_zIndex + 1});
					} else if(checkpoint_list_zIndex <= train_config_zIndex) {
						$("#quick_training .checkpoint_list").css({"zIndex":train_config_zIndex + 1});
					}					
				});
				// Training config 입력 영역 띄우기 버튼
				$(".training_config_btn").off("click").on("click", function() {
					let add_project_zIndex = parseInt($("#quick_training .add_project").css("zIndex"));
					let checkpoint_list_zIndex = parseInt($("#quick_training .checkpoint_list").css("zIndex"));
					let train_config_zIndex = parseInt($("#quick_training .training_config").css("zIndex"));
					
					$(".training_config").toggleClass("active");
// 					that.root.pt.find(".description_wrap").html("");
					if($(".training_config").hasClass("active")){
						$(".training_config_btn")[0].textContent = "-";
					} else {
						$(".training_config_btn")[0].textContent = "+";
					}
					
					// z-index 우선순위 제어
					if(train_config_zIndex <= add_project_zIndex){
						$("#quick_training .training_config").css({"zIndex":add_project_zIndex + 1});
					} else if(train_config_zIndex <= checkpoint_list_zIndex) {
						$("#quick_training .training_config").css({"zIndex":checkpoint_list_zIndex + 1});
					}					
				});					
				// 팝업창 닫기
				$("#quick_training .quick_close").off("click").on("click", function() {
					$(".quick_training").removeClass("active");
					that.root.pt.find(".checkpoint_list .selected_task_name").html("");					
				});
				$("#quick_training .add_project .side_btn_wrap .cancel_btn").off("click").on("click", function() {
					$(".add_project").removeClass("active");
					$(".add_project_btn")[0].textContent = "+";
				});
				$("#quick_training .training_config .side_btn_wrap .cancel_btn").off("click").on("click", function() {
					$(".training_config").removeClass("active");
					$(".training_config_btn")[0].textContent = "+";
					let temp_id = $(".quick_training .algorithm_result option:selected").data("id");
					that.root.computed.getAlgorithmById(temp_id, "0");
				});		
				$("#quick_training .training_config .side_btn_wrap .save_btn").off("click").on("click", function() {
					$(".training_config").removeClass("active");
					$(".training_config_btn")[0].textContent = "+";
				});						
				
				$("#quick_training .checkpoint_list .side_btn_wrap .cancel_btn").off("click").on("click", function() {
					$("#quick_training .checkpoint_list").removeClass("active");
					$("#quick_training .checkpoint_list_btn")[0].textContent = "+";					
// 					$(".quick_training .radioBtn.selected").removeClass("selected");
					if($(".quick_training .radioBtn.selected").length == 0){
						$(".checkpoint_view").removeClass("active");
					}
					let temp_id = $(".quick_training .task_result option:selected").data("id");
					that.root.computed.getCheckpointList(temp_id, "0");
				});		
				$("#quick_training .checkpoint_list .side_btn_wrap .save_btn").off("click").on("click", function() {
					$("#quick_training .checkpoint_list").removeClass("active");
					$("#quick_training .checkpoint_list_btn")[0].textContent = "+";
				});
				// project 생성 버튼
				$(".quick_training .add_btn").off("click").on("click", function() {
					that.root.computed.getProjectData();
					$(".add_project").removeClass("active");
					$(".add_project_btn")[0].textContent = "+";					
				});
				// start training 버튼 			
				$(".quick_training_btn").off("click").on("click", function() {
					that.root.pt.find(".algorithm_result").removeAttr("disabled");
					that.root.computed.createJsonQuickTrain();
				});
			
			},
			
			quickInference() {
				const that = this;
				
				// 팝업창 띄우기
				$("#quick_inference_btn").off("click").on("click", function(){
					$(".quick_inference").toggleClass("active");
					$(".quick_inference").draggable();
					$(".quick_inference .radioBtn.selected").removeClass("selected");					
					$(".inference_config").removeClass("active");
					$(".inference_config_btn")[0].textContent = "+";			
					that.root.pt.find(".description_wrap").removeClass("border");						
					that.root.pt.find("#inference_config .config_wrap").html("");
					that.root.pt.find("#inference_config .description_wrap").html("");
					that.root.pt.find(".quick_task_list .table_body tbody").html("");
					that.root.computed.getTaskList(null, "1");
					that.root.computed.setAnnoTaskName();
				});				
				// Inference config 입력 영역 띄우기 버튼
				$(".inference_config_btn").off("click").on("click", function() {
					if($("#quick_inference .radioBtn.selected").length == 0){
						alert("Task를 선택해주세요");
						return
					} else {
						$(".inference_config").toggleClass("active");
//	 					that.root.pt.find(".description_wrap").html("");
						if($(".inference_config").hasClass("active")){
							$(".inference_config_btn")[0].textContent = "-";
						} else {
							$(".inference_config_btn")[0].textContent = "+";
						}
					}
				});				
				// 팝업창 닫기
				$("#quick_inference .quick_close").off("click").on("click", function() {
					$(".quick_inference").removeClass("active");
					$(".quick_inference input[name='csv_title']").val("");
				});	
				$("#quick_inference .side_btn_wrap .cancel_btn").off("click").on("click", function() {
					$(".inference_config").removeClass("active");
					$(".inference_config_btn")[0].textContent = "+";
					let temp_id = $(".quick_inference .quick_task_list .radioBtn.selected").parent().next().data("id");
					that.root.computed.getTaskById(temp_id);
				});		
				$("#quick_inference .side_btn_wrap .save_btn").off("click").on("click", function() {
					$(".inference_config").removeClass("active");
					$(".inference_config_btn")[0].textContent = "+";
				});							
				// run inference 버튼 			
				$(".quick_inference_btn").off("click").on("click", function() {
					that.root.computed.createJsonQuickInference();
				});				
			},
			
			addEmptyData(elem, data1, data2){
				const that = this;
				elem.append("<div class='empty_wrap'><div class='no_image'></div><div class='eng_text'>"+data1+"</div><div class='kor_text'>"+data2+"</div></div>")
			},
			
			removeEmptyData(elem){
				const that = this;
				elem.find(".empty_wrap").remove();
			},
			
			addHoverBox(elem,text){
				const that = this;

				if (elem[0].scrollWidth >  elem[0].clientWidth) {
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
				   	//오른쪽이 text 길이보다 작을때
				   		x = left - text_width;
				   		
				   	} else {
				   	//오른쪽이 text 길이보다 클때
				   		x = left + btn_width / 2;
				   	}
				   	
				   	if(bottom - text_height < 0){
				   	//아래가 text 길이보다 작을때
			   			y = top - text_height;
			   		} else {
			   			y = top + btn_height / 2;
			   		}

				   	hover_box.css({"top":y+"px", "left":x+"px","position": "fixed","display" : "block"});
				}
			},			
			
			removeHoverBox(elem){
				let that = this;
				elem.find(".hover_box").remove();
			},			
			
			keyDown() {
				const that = this;

				// jh.sa save 버튼 단축키
// 				let isCtrl;		// ctrl, s 눌림 여부 확인
// 				$(document).off("keyup").on("keyup", function(evt){
// 					if (evt.which == 17) isCtrl = false;
// 				});
				
// 				//label 복사,붙여넣기,삭제, undo,redo
// 				$(document).off("keydown").on("keydown", function(evt){
// 					if($(".label-wrap.on").length != 0){
// 						that.backspace(evt);
// 						that.copy(evt);
// 					}

// 					//undo
// 					const confirm = that.history(evt);
// 					if(confirm){ return false; }
// 					//redo

// 					that.paste(evt);
					

// 					// jh.sa save 버튼 단축키
// 					if (evt.which == 17) isCtrl = true;
// 					if (evt.which == 83 && isCtrl == true) {
// 						$(".label input[type='text']").trigger("blur");				// jh.sa 추가
// 						that.save(evt);
// 					};
// 				});
				
				
				$(document).find("#enrichment .position-value").off("keydown").on("keydown",function(evt){
					if(evt.keyCode == 13){
						
						
						var pos = this.value*1;
						if(isNaN(pos)){
							alert("숫자를 입력해주세요");
							return;
						}
						
						
						console.log(pos);
						
						var imgLen = that.root.data.imgList.length;
						
						var viewStartCursor = 0;
						var viewEndCursor = 0;
						var loadStartCursor = 0;
						var loadEndCursor = 0;
						if(pos < 0){
							pos = 0;
						}else if(pos+14 >= imgLen){
							alert("마지막 위치에 가깝기 때문에 마지막 페이지로 이동합니다");
							pos = imgLen-15;
						}
						
						if(imgLen > 30){
							if(pos - 15 < 0){
								viewStartCursor = 0;
								viewEndCursor = 29;
								loadStartCursor = 0;
								loadEndCursor = 29;
							}else if(pos+14 >= imgLen){
								viewStartCursor = imgLen - 30;
								viewEndCursor = imgLen - 1;
								loadStartCursor = imgLen - 30;
								loadEndCursor = imgLen - 1;
							}else{
								viewStartCursor = pos-15;
								viewEndCursor = pos+14;
								loadStartCursor = pos-15;
								loadEndCursor = pos+14;								
							}						
						}else{
							viewStartCursor = 0;
							viewEndCursor = imgLen-1;
							loadStartCursor = 0;
							loadEndCursor = imgLen-1;
						}
						that.root.data.gInfo.current_cursor = pos;
						that.root.data.enrichSwiper.data.swiperInfo = {maxSize : 30, viewStartCursor : viewStartCursor, viewEndCursor : viewEndCursor, loadStartCursor:loadStartCursor,loadEndCursor:loadEndCursor,isUpdateSlide:true, threshold:15},
						console.log("position 지정 후 swiperInfo : ", that.root.data.enrichSwiper.data.swiperInfo);
						
						that.root.data.enrichSwiper.render.drawSwiper();
						that.root.data.enrichSwiper.data.swiperInfo.isUpdateSlide = false;
						
// 						$("#slide_"+pos).trigger("click");
						
// 						for(var i=0 ;i < pos ;i++){
// 							enrichment.data.enrichSwiper.data.swiper.slideNext()
// 						}
// 						aa = that.root.data.enrichSwiper.data.swiper.slideTo(pos,0,false);
						
						
					}
				});
				
			},
			history(evt) {
				const that = this;
				let confirm = false;
				if (evt.keyCode == 90 && (evt.ctrlKey === true || evt.metaKey === true)) {
					confirm = true;
					
					if(evt.shiftKey === true){
						console.log("redo");
						
						let cursor;
						if(hObj.cursor < hObj.stack.length) {
							cursor = hObj.cursor;
						} else {
							return confirm;
						}
						
						const action = hObj.stack[cursor].action;
						const list = hObj.stack[cursor].list;
						if(action == "create") {
							console.log("c",list);
							that.root.computed.drawLabel(list);
						} else if(action == "remove") {
							console.log("r",list);
							that.root.computed.removeLabel(list);
						} else if(action == "update") {
							console.log("u",list);
							that.root.computed.updateHistoryLabel(list, "redo");
						} else if(action == "move") {
							console.log("m",list);
							const removeList = [];
							$.each(list, function(index, value){
								var temp = {};
								temp["layerId"] = value.before;
								temp["labelId"] = value.labelId;
								temp["labelValue"] = value.labelValue;
								removeList.push(temp);
							});
							that.root.computed.drawLabel(list);
							that.root.computed.removeLabel(removeList);
						}
						
						hObj.cursor++;
					} else {
						console.log("undo");
						
						if(hObj.cursor > 0) {
							cursor = --hObj.cursor;
						} else {
							return confirm;
						}
						
						var action = hObj.stack[cursor].action;
						var list = hObj.stack[cursor].list;
						if(action == "create") {
							console.log("c",list);
							that.root.computed.removeLabel(list);
						} else if(action == "remove") {
							console.log("r",list);
							that.root.computed.drawLabel(list);
						} else if(action == "update") {
							console.log("u",list);
							that.root.computed.updateHistoryLabel(list, "undo");
						} else if(action == "move") {
							console.log("m",list);
							const drawList = [];
							$.each(list, function(index, value){
								const temp = {};
								temp["layerId"] = value.before;
								temp["labelId"] = value.labelId;
								temp["labelValue"] = value.labelValue;
								drawList.push(temp);
							});
							that.root.computed.removeLabel(list);
							that.root.computed.drawLabel(drawList);
						}
						
// 						return false;
					}
				}
				return confirm;
			},

			copy(evt) {
				const that = this;
				const gObj = that.root.data.gObj;
				if (evt.keyCode == 67 && (evt.ctrlKey === true || evt.metaKey === true)) {
				    const layerId = $(".label-wrap.on").parent().parent()[0].id;
					const id = $(".label-wrap.on")[0].id.substr(4);
				    let gObjCopy = $.extend({}, gObj.layer[layerId].labelMap[id]);
				    gObjCopy.id = "";
				    gObjCopy.tempLeft = gObjCopy.left;
					that.gObjCopy = gObjCopy;
				} 
			},
			paste(evt){
				const that = this;
				const gObj = that.root.data.gObj;
				const canvas = that.root.data.canvas;
				const gObjCopy = that.gObjCopy;
				if (evt.keyCode == 86 && (evt.ctrlKey === true || evt.metaKey === true)) {
			    	//paste
			    	if (!gObjCopy) { return; };
			    	//layer선택 여부 체크
					layerId = $(".label-layer .selector.selected").parent().parent().attr("id");
					if(typeof(layerId)=="undefined"){
						alert("레이어를 선택해주세요");
						return false;
					}
					//
			    	
			    	if (gObjCopy.top + gObjCopy.height > canvas.getHeight()-10 ) {
			    		gObjCopy.top = 10;
			    		gObjCopy.tempLeft += 15;
			    		gObjCopy.left = gObjCopy.tempLeft;
			    	} else if(gObjCopy.left + gObjCopy.width > canvas.getWidth() - 10 ) {
			    		gObjCopy.tempLeft = 10;
			    		gObjCopy.left = gObjCopy.tempLeft;
			    	}
					gObjCopy.top = gObjCopy.top + 15;
			    	gObjCopy.left = gObjCopy.left + 15;
			    	
			    	const img = gObj.img;
					const imgInfo = gObj.imgInfo;
					if(gObjCopy.points){
						alert("개체를 붙여 넣지 마십시오");
						return;
					} else {
						var rect = new fabric.Rect(gObjCopy);
						canvas.add(rect);
					}
					
					const canv = document.createElement('canvas');
					const uuid = that.root.guid();
					canv.id = gObjCopy.id = rect.id = uuid;
					
					that.root.data.enrichPanel.render.addLabel(canv, layerId, gObjCopy);
					gObj.layer[layerId].labelMap[uuid] = JSON.parse( JSON.stringify(gObjCopy) );
					
					// jh.sa 추가 : 동일한 데이터셋 내에서 다른 이미지 끼리 label 복사붙여넣기 할 경우 우측 label container가 보이지 않던 문제 수정  
					const cur_layer = $("#"+layerId+" .label-container");
					if(cur_layer.css("display") == "none"){
						cur_layer.css("display","block");
					}					
					
					//undo, redo
					const tObj = {};
					tObj["layerId"] = layerId;
					tObj["labelId"] = uuid;
					tObj["labelValue"] = gObj.layer[layerId].labelMap[uuid];
					tObj["before"] = null;
					hObj.label.list.length = 0;
					hObj.label.list[0] = tObj;
					hObj.label.action = "create";
					hObj.stack.length = hObj.cursor;
					hObj.stack[hObj.cursor++] = JSON.parse( JSON.stringify( hObj.label ) );
					//

			    }
			},
			backspace(evt) {
				const that = this;
				if (evt.keyCode == 8 || evt.keyCode == 46) {
					console.log('BACKSPACE was pressed');
					const textNode = $(".label-container .label input[type='text']:focus");
					if(textNode.length>0 ){
						return;
					}
					
				    that.root.computed.del();
					
				    
				    
				    const layers = $(".layer-wrap");
				    $.each(layers, function(index, value){
						//여기
				        if($(value).find(".label-wrap").length == 0){
				        	$(value).find(".switch").removeClass("open");
				        	$(value).find(".switch").addClass("close");
				        	$(value).find(".switch").parent().next().slideToggle("500");
				        		
				        }
				    })
					evt.preventDefault();
				}
			},
			
			save(evt) {
				const that = this;
				const labelArr = $(".label-container .label input[type='text']");
				
				for(let i=0; i<labelArr.length; i++){
					if($(labelArr[i]).val() == "") {
						alert("Label 이름을 입력해주세요");
						$(labelArr[i]).focus();
						
						return false;
					}
				}
				
				that.root.computed.submitMeta();
			},
		},
		computed: {
			root : null,
			getDatasetById : function(id){
				var that = this;
				console.log("qqqqq");
				$("#loader").show();
				$.ajax({
					url :  baseUrl + "data/getDatasetById.json",
				   	data : { dataset_id : id },
				   	type : "POST",
				   	success : function(res){
				   		$("#loader").hide();
				   		// ㅌ
				   		console.log("=====getDatasetById=====", res);
						if(res.result.code == "200"){
							media_type = res.result.data.media_type;
							label_type = res.result.data.label_type;
/* 							console.log("root.nodes : ", that.root.data.nodes); */
							if(res.result.data.status == '1') {
								if($("#" + that.root.data.nodes[0].tId + "_loading").hasClass("upload_wait")) {
									$("#" + that.root.data.nodes[0].tId + "_loading").removeClass("upload_wait");
					  				$("#" + that.root.data.nodes[0].tId + "_loading").addClass("upload_complete");	
								}
				  			}
							console.log("이 데이터셋의 미디어 유형은 [", media_type, "] 입니다.");	
							console.log("이 데이터셋의 라벨링 유형은 [", label_type, "] 입니다.");	
							// 해당 데이터셋의 media_type에 따라 업로드 탭 영역 구분
						} else if(res.result.code == "2001"){
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}
				   	},
				   	error : function(err){
				   		$("#loader").hide();
				   		 console.log("ERROR!!", err);
				   	}
				});				
			},
			
			getDataList(nodes){
				const that = this;
				const dataArr = [];
				
				$("#loader").show();
				for(let i=0, len=nodes.length; i<len; i++){
					dataArr.push(that.ajaxDataList(nodes[i].id));
				}
				Promise.all(dataArr).then(function(res){
					console.log("=====getDataList=====", res);
					
					const resArr = [];
					for(let i=0, len=res.length; i<len; i++){
						const data = res[i].result.data;
						if(data.length > 0){
							resArr.push(data);
						}
					}
					// jh.sa : replica 데이터가 아닌데도 2개 데이터셋이 다중선택되는 문제 수정 
// 					if(resArr.length == 2){
// 						if(resArr[0].length == resArr[1].length){
// 							if(resArr[0][0]["path"] == resArr[1][0]["path"]){
// 								that.confirmDataList(resArr);
// 								dataset_id = res[0].dataVO.dataset_id;	
// 								if(res[0].result.data[0].label_type == "IMAGE_BBOX"){
// 									isBoxData = true;
// 								} else if (res[0].result.data[0].label_type == "IMAGE_SEGMENTATION"){
// 									isPolyData = true;
// 								}
// 							} else {
// 								labeller.pt.find("div.section").removeClass("selected");
// 								const node = ".section.info";
// 								labeller.pt.find(node).addClass("selected");
// 								alert("데이터 다중선택 및 layer 추가는 복제 관계에 있는 데이터끼리만 가능합니다.\n다시 시도해주세요.");
// 								return
// 							}
// 						} else {
// 							labeller.pt.find("div.section").removeClass("selected");
// 							const node = ".section.info";
// 							labeller.pt.find(node).addClass("selected");
// 							alert("데이터 다중선택 및 layer 추가는 복제 관계에 있는 데이터끼리만 가능합니다.\n다시 시도해주세요.");
// 							return
// 						}
// 					} else if(resArr.length == 1 && wsObj[setting.key].dir.getSelectedNodes().length == 2){
// 						labeller.pt.find("div.section").removeClass("selected");
// 						const node = ".section.info";
// 						labeller.pt.find(node).addClass("selected");
// 						alert("데이터 다중선택 및 layer 추가는 복제 관계에 있는 데이터끼리만 가능합니다.\n다시 시도해주세요.");
// 						return
// 					} else if(resArr.length == 0){
// 						//dataList가 없으면 addImg로 이동
// 						alert("데이터가 없습니다. \n데이터를 추가해주세요.");
// 						$("#loader").hide();
						
// 						labeller.pt.find("div.section").removeClass("selected");
// 						var node = ".section.addImg";
// 						labeller.pt.find(node).addClass("selected");
							
// 						addImg.init(that.root.data.nodes[0]);
// 						return false;						
// 					} else {
// 	 					that.confirmDataList(resArr);
// 	 					dataset_id = res[0].dataVO.dataset_id;		
// 						if(res[0].result.data[0].label_type == "IMAGE_BBOX"){
// 							isBoxData = true;
// 						} else if (res[0].result.data[0].label_type == "IMAGE_SEGMENTATION"){
// 							isPolyData = true;
// 						}	 					
// 					}
					if(resArr.length == 0){
						//dataList가 없으면 addImg로 이동
						alert("데이터가 없습니다. \n데이터를 추가해주세요.");
						$("#loader").hide();
						
						labeller.pt.find("div.section").removeClass("selected");
						var node = ".section.addImg";
						labeller.pt.find(node).addClass("selected");
							
						addImg.init(that.root.data.nodes[0]);
						return false;						
					} else {
	 					that.confirmDataList(resArr);
	 					dataset_id = res[0].dataVO.dataset_id;		
						if(label_type == "IMAGE_BBOX"){
							isBoxData = true;
						} else if (label_type == "IMAGE_SEGMENTATION"){
							isPolyData = true;
						}	 					
					}					

				});
			},
			
			//dataList 가져와 swiper, canvas, panel 생성
			confirmDataList(dataList){
				const that = this;
				if(dataList.length > 0){
					that.initImgInfo(dataList);	//이미지리스트 초기화
					
					//datalist
					const enrichSwiper = that.root.data.enrichSwiper;
					let swiper;
					if(enrichSwiper){
						swiper = enrichSwiper.data.swiper;
					}
					
					// jh.sa 데이터 저장 후 Init할 때 이전 swiperInfo 값 적용
					let cur_cursor = $(".position-value").val() * 1;
					if(cur_cursor > 0){
						// label 저장 시 init 될 때 저장되있던 swiperInfo 값 가져오기 
// 						if(current_swiperInfo != undefined || current_swiperInfo != null && cur_cursor > 15){
// 							that.root.data.enrichSwiper = new ImgList(that.root, swiper);
// 							that.root.data.enrichSwiper.data.swiperInfo = current_swiperInfo;
// 							ImgList.prototype.data.swiper.activeIndex = cur_cursor;
// 							ImgList.prototype.data.swiperInfo.loadStartCursor = cur_cursor - 15;
// 							ImgList.prototype.data.swiperInfo.loadEndCursor = cur_cursor + 15;
// 							ImgList.prototype.data.swiperInfo.viewStartCursor  = cur_cursor - 15;
// 							ImgList.prototype.data.swiperInfo.viewEndCursor = cur_cursor + 15;
// 						} else {
							// 처음 init 될 때 커서값 기준으로 가져오기
							that.root.data.enrichSwiper = new ImgList(that.root, swiper);	
// 							that.root.data.enrichSwiper.data.swiper.activeIndex = cur_cursor;			// 설정되어있으면 > 버튼 동작 X
							that.root.data.enrichSwiper.data.swiperInfo = {maxSize : 30, viewStartCursor : cur_cursor - 15, viewEndCursor : cur_cursor + 15, loadStartCursor: cur_cursor - 15,loadEndCursor: cur_cursor + 15,isUpdateSlide: false, threshold:15};

// 							ImgList.prototype.data.swiper.activeIndex = cur_cursor;						// 설정되어있으면 > 버튼 동작 X
							ImgList.prototype.data.swiperInfo = {maxSize : 30, viewStartCursor : cur_cursor - 15, viewEndCursor : cur_cursor + 15, loadStartCursor: cur_cursor - 15,loadEndCursor: cur_cursor + 15,isUpdateSlide: false, threshold:15};
							
							console.log("end prototype",ImgList.prototype.data.swiperInfo.loadStartCursor,ImgList.prototype.data.swiperInfo.loadEndCursor,ImgList.prototype.data.swiperInfo.viewStartCursor,ImgList.prototype.data.swiperInfo.viewEndCursor);
							console.log("slideReset prototype",ImgList.prototype.data.swiper.previousIndex , ImgList.prototype.data.swiper.activeIndex);		
							console.log("end 초기화 loadStart, loadEnd, viewStart, viewEnd : ",that.root.data.enrichSwiper.data.swiperInfo.loadStartCursor,that.root.data.enrichSwiper.data.swiperInfo.loadEndCursor,that.root.data.enrichSwiper.data.swiperInfo.viewStartCursor,that.root.data.enrichSwiper.data.swiperInfo.viewEndCursor);
							console.log("slideReset 초기화, 이전 / 활성화 인덱스 : ",that.root.data.enrichSwiper.data.swiper.previousIndex , that.root.data.enrichSwiper.data.swiper.activeIndex);							
// 						}
					} else {
						that.root.data.enrichSwiper = new ImgList(that.root, swiper);						
					}
					
					const canvas = that.root.data.canvas;
					//
					const enrichCanvas = that.root.data.enrichCanvas = new Canvas(that.root);
					enrichCanvas.setCanvas(canvas);
					//
					const enrichPanel = that.root.data.enrichPanel = new Panel(that.root);
					enrichPanel.setCanvas(canvas);
					
					
					//j.park 총카운트
					$("#enrichment .title-wrap .canvas-wrap").html("<span>Enrichment</span> <span>|</span> Canvas ("+dataList[0].length+")");
					//
					
					$("#loader").hide();
					that.initEnrichment();
					that.root.bind.evtInit();
				} else {
					//dataList가 없으면 addImg로 이동
					alert("데이터가 없습니다. \n데이터를 추가해주세요.");
					$("#loader").hide();
					
					labeller.pt.find("div.section").removeClass("selected");
					var node = ".section.addImg";
					labeller.pt.find(node).addClass("selected");
						
					addImg.init(that.root.data.nodes[0]);
					return false;
				}
			},

			//컨버스 그리기 시작
			//data변경시 호출하면 됨
			initEnrichment() {
				const that = this;
				that.initGObj();			//gObj 초기화

				const gObj = that.root.data.gObj
				console.log("**********gObj**********: ", gObj);
				//컨버스에 이미지 로딩
				that.root.data.enrichCanvas.onload(gObj);
				
				var e = jQuery.Event("keydown", {keyCode: 17});
				$(document).trigger(e);
				// that.getMetaList(dataId);
			},
			// 텔포
			//layer의 label정보 가져와서 매핑 후 그리기
			getMetaList(){
				const that = this;
				
				const dataId = that.root.data.assetList[that.root.data.gInfo.current_cursor];
				console.log("dataId : " + dataId);
				const idObj = {};
				const idArr = dataId.split(","); 
				const metaArr = [];
 				for(let i=0, len=idArr.length; i<len; i++){
					const id = idArr[i].split("_");
					metaArr.push(that.ajaxMetaList(id[0]));
					idObj[id[0]] = id[1];
				} 
				Promise.all(metaArr).then(function(res){
					console.log("=====getMetaList=====",res);
					
					for(let i=0, len=res.length; i<len; i++){
						if(res[i].result.code == "200"){
							res[i].metaVO.dataset_id = idObj[res[i].metaVO.data_id]
							that.mappingLabelMap(res[i], idObj);
						} 
					}
					
					that.root.data.enrichCanvas.render.addLabel();	// canvas에 label그리기
					that.root.computed.drawPanel();					// panel에 label그리기
					const chkMouseEvent = that.root.data.enrichSwiper.data.chkMouseEvent;
					if(chkMouseEvent[0] === true){
						if(chkMouseEvent[1] === true){
							chkMouseEvent[0] = false;
							chkMouseEvent[1] = false;
							$("#loader").hide();
						}else {
							chkMouseEvent[1] = true;
						}
					}else {
						$("#loader").hide();
					}
				});
			},
			/*mappingLabelMap(res){
 				const that = this;
 				let gObj = that.root.data.gObj;
 				const nodes = that.root.data.nodes;
 				
 				console.log("res.metaVO.data_id : " + res.metaVO.data_id);
 				console.log("nodes length2 : " + nodes.length);
 				
 				//update gObj.layer
 				for(let i=0, len=nodes.length; i<len; i++){ 
 					gObj.layer[res.metaVO.data_id] = { labelMap : {},};
 					 console.log("dataset_id : " + res.metaVO.dataset_id);
 					console.log("data_id : " + res.metaVO.data_id); 
 					if(nodes[i].id == res.metaVO.dataset_id){ 
 					
 					if(nodes.length >= 2) {
 						if(flag === false) {
 						gObj.layer[res.metaVO.data_id] = { labelMap : {}, pId : nodes[0].id, pTitle : nodes[0].title };
 						flag = true;
 						} else if(flag === true){
 							gObj.layer[res.metaVO.data_id] = { labelMap : {}, pId : nodes[1].id, pTitle : nodes[1].title };
 							flag = false;
 						}
 					} else {
 							gObj.layer[res.metaVO.data_id] = { labelMap : {}, pId : nodes[0].id, pTitle : nodes[0].title };
 						}
 					/* } 
 				} 
 				// update gObj.layer.labelMap
 				const data = res.result.data;
 				if(data != null){
 					for(let i = 0, len = data.length ; i < len ; i++){
 						if(that.IsJsonString(res.result.data)) {
 						}
 						const inf = data[i].info.split(",");
 						const fillColor = colorHash.rgb(data[i].label);
 						
 						gObj.layer[res.metaVO.data_id].labelMap[data[i].meta_id] = {						
 							angle: 0,
 							fill: "rgba("+fillColor[0]+","+fillColor[1]+","+fillColor[2]+",0.5)",
 							id: data[i].meta_id,
 							label: data[i].label,
 							left: inf[0]*1*gObj.imgInfo.scaleFactor,
 							top: inf[1]*1*gObj.imgInfo.scaleFactor,
 							width: inf[2]*1*gObj.imgInfo.scaleFactor,
 							height: inf[3]*1*gObj.imgInfo.scaleFactor,
 						};
 						if(data[i].segmentation){
 							const temp = data[i].segmentation.replace(/[\[\]\{ ]/gi, "");
 							const strPoints = temp.split("},");
 							const points = [];
 							for(let j=0; j<strPoints.length; j++){
 								let x, y, t;
 								const p = strPoints[j].replace(/\}/, "").split(",");
 								x = eval(p[0].split(":")[1])*1*gObj.imgInfo.scaleFactor;
 								y = eval(p[1].split(":")[1])*1*gObj.imgInfo.scaleFactor;
 								console.log("123 : ", x, y);
 								t = { x, y };
// 								console.log(t);
 								points.push(t);
 							}
 							gObj.layer[res.metaVO.data_id].labelMap[data[i].meta_id]["points"] = points;
// 							console.log(gObj.layer[res.metaVO.data_id].labelMap[data[i].id]);
 						}
 					}
 				} 
 			},*/
			// 수정
			mappingLabelMap(res){
				const that = this;
				let gObj = that.root.data.gObj;
				const nodes = that.root.data.nodes;
				
				console.log("res.metaVO.data_id : " + res.metaVO.data_id);
				console.log("nodes length2 : " + nodes.length);
				
				//update gObj.layer
/* 				for(let i=0, len=nodes.length; i<len; i++){ */
					gObj.layer[res.metaVO.data_id] = { labelMap : {},};
					/* console.log("dataset_id : " + res.metaVO.dataset_id);
					console.log("data_id : " + res.metaVO.data_id); */
					/* if(nodes[i].id == res.metaVO.dataset_id){ */
					
					if(nodes.length >= 2) {
						if(flag === false) {
						gObj.layer[res.metaVO.data_id] = { labelMap : {}, pId : nodes[0].id, pTitle : nodes[0].title };
						flag = true;
						} else if(flag === true){
							gObj.layer[res.metaVO.data_id] = { labelMap : {}, pId : nodes[1].id, pTitle : nodes[1].title };
							flag = false;
						}
					} else {
							gObj.layer[res.metaVO.data_id] = { labelMap : {}, pId : nodes[0].id, pTitle : nodes[0].title };
						}
					/* } */
/* 				} */

				// update gObj.layer.labelMap
				const data = res.result.data;
				if(data != null){
					for(let i = 0, len = data.length ; i < len ; i++){
						/* console.log("info : " + data[i].info); */
						if(data[i].label_type == "IMAGE_BBOX") {
							/* console.log("box"); */
							const inf = data[i].info.split(",");
							const fillColor = colorHash.rgb(data[i].label);
						
							gObj.layer[res.metaVO.data_id].labelMap[data[i].meta_id] = {						
								angle: 0,
								fill: "rgba("+fillColor[0]+","+fillColor[1]+","+fillColor[2]+",0.5)",
								id: data[i].meta_id,
								label: data[i].label,
								left: inf[0]*1*gObj.imgInfo.scaleFactor,
								top: inf[1]*1*gObj.imgInfo.scaleFactor,
								width: inf[2]*1*gObj.imgInfo.scaleFactor,
								height: inf[3]*1*gObj.imgInfo.scaleFactor,
							};
						} else if(data[i].label_type == "IMAGE_SEGMENTATION"){
							/* console.log("seg!"); */
							const infoParser = JSON.parse(data[i].info);
							/* const box = infoParser.box; */
							const info_box = infoParser.box.split(",");
							const info_segmentation = infoParser.segmentation;
							/* const segmentation_info = box.split(","); */
							const segmentation_fillColor = colorHash.rgb(data[i].label);
							
							gObj.layer[res.metaVO.data_id].labelMap[data[i].meta_id] = {						
									angle: 0,
									fill: "rgba("+segmentation_fillColor[0]+","+segmentation_fillColor[1]+","+segmentation_fillColor[2]+",0.5)",
									id: data[i].meta_id,
									label: data[i].label,
									left: info_box[0]*1*gObj.imgInfo.scaleFactor,
									top: info_box[1]*1*gObj.imgInfo.scaleFactor,
									width: info_box[2]*1*gObj.imgInfo.scaleFactor,
									height: info_box[3]*1*gObj.imgInfo.scaleFactor,
								};
							
							const temp = info_segmentation.replace(/[\[\]\{ ]/gi, "");
							/* console.log("temp : " + temp); */
							const strPoints = temp.split("},");
							/* console.log("strPoints : ", strPoints); */
							const points = [];
							for(let j=0; j<strPoints.length; j++){
								let x, y, t;
								const p = strPoints[j].replace(/\}/, "").split(",");
								/* console.log("p:",p); */
								x = eval(p[0].split(":")[1])*1*gObj.imgInfo.scaleFactor;
								y = eval(p[1].split(":")[1])*1*gObj.imgInfo.scaleFactor;
								/* console.log("123 : ", x, y); */
								t = { x, y };
								/* console.log(t); */
								points.push(t);
								/* console.log("points : ", points); */
							}
							gObj.layer[res.metaVO.data_id].labelMap[data[i].meta_id]["points"] = points;
//								console.log(gObj.layer[res.metaVO.data_id].labelMap[data[i].id]);
							
/* 							if(data[i].segmentation){
								const temp = data[i].segmentation.replace(/[\[\]\{ ]/gi, "");
								const strPoints = temp.split("},");
								const points = [];
								for(let j=0; j<strPoints.length; j++){
									let x, y, t;
									const p = strPoints[j].replace(/\}/, "").split(",");
									x = eval(p[0].split(":")[1])*1*gObj.imgInfo.scaleFactor;
									y = eval(p[1].split(":")[1])*1*gObj.imgInfo.scaleFactor;
									console.log("123 : ", x, y);
									t = { x, y };
// 								console.log(t);
									points.push(t);
								}
								gObj.layer[res.metaVO.data_id].labelMap[data[i].meta_id]["points"] = points;
// 								console.log(gObj.layer[res.metaVO.data_id].labelMap[data[i].id]);
							} */
						}
					}
				}
			},
			IsJsonString(str) {
				  try {
				    var json = JSON.parse(str);
				    return (typeof json === 'object');
				  } catch (e) {
				    return false;
				  }
			},
			drawCanvas(){
				const that = this;

				const gObj = that.root.data.gObj
				that.root.data.enrichCanvas.onload(gObj);
			},
			

			drawPanel() {
				const that = this;

				const gObj = that.root.data.gObj
				that.root.data.enrichPanel.onload(gObj);
				
				if(that.root.data.isCollision){
					that.root.pt.find(".collision-wrap .collision .collision_btn").trigger("click");
				}
			},
			
			updateDataset(dataset_id, data_id) {
 				$.ajax({
 					url : baseUrl + "data/updateDataset.json",
 					data : { dataset_id : dataset_id, save_data_id : data_id},			// id => dataset_id(0921)
 					type : "POST",
 					async : false,
 					success : function(res) {
//  						console.log("=======updateDataset======", res);
 						console.log("SUCCESS");	 						
 					}, 
 					error : function(err) {
 						console.log("error!!!!", err);
 					}
 				});
 			}, 

			submitMeta(ing) {
				const that = this;
				const index = that.root.data.gInfo.current_cursor;
				const assetId = that.root.data.assetList[index];
				const gObj = that.root.data.gObj;
				const width = gObj.imgInfo.width;
				const height = gObj.imgInfo.height;
				const scaleFactor = gObj.imgInfo.scaleFactor;

				$("#loader").show();
				const layerKeys = Object.keys(gObj.layer);
				const updateMetaList = [];
				for(let i=0; i<layerKeys.length; i++){	//layer반복
					let ajaxData = {info:[]};
					const keys = Object.keys(gObj.layer[layerKeys[i]].labelMap);
					console.log(keys);
					const layer = gObj.layer[layerKeys[i]];

					ajaxData.data_id = layerKeys[i];
					for(let j = 0 ; j < keys.length ; j++){	//label반복
						const box_width = layer.labelMap[keys[j]].width;
						const box_height = layer.labelMap[keys[j]].height;
						const left = layer.labelMap[keys[j]].left;
						const top = layer.labelMap[keys[j]].top;
						const label = layer.labelMap[keys[j]].label;
						console.log("label : " + label);
						if(label == "") {
							alert("label명을 입력해주세요.");
							return ;
						}
						const meta_id = layer.labelMap[keys[j]].id;
						if(layer.labelMap[keys[j]].points){	//폴리곤
							const points = layer.labelMap[keys[j]].points;
							let segmentation = "[";
							console.log("points!!!!!!!!!", points);
							for(let k=0; k<points.length; k++){
								if(k==0){
									segmentation += "{x: "+points[k].x/scaleFactor+", y: "+points[k].y/scaleFactor+"}";									
								} else {
									segmentation += ",{x: "+points[k].x/scaleFactor+", y: "+points[k].y/scaleFactor+"}";
								}
							}
							segmentation += "]";
							console.log("segmentation points : :" , segmentation);
							ajaxData.info.push({
								segmentation,
								data_id : layerKeys[i]+"",
								width:box_width/scaleFactor+"",
								height:box_height/scaleFactor+"",
								left:left/scaleFactor+"",
								top:top/scaleFactor+"",
								label:label+"",
								label_type : label_type+"",
								meta_id : meta_id,
							});
							
							continue;
						}
								
						ajaxData.info.push({
							data_id : layerKeys[i]+"",
							width:box_width/scaleFactor+"",
							height:box_height/scaleFactor+"",
							left:left/scaleFactor+"",
							top:top/scaleFactor+"",
							label:label+"",
							label_type : label_type+"",
							meta_id : meta_id,
						});
							
					}
					
					/*
						data_id : data id
						width : label 너비
						height : label 높이
						left : label x좌표
						top : label y좌
						label : label 명
						meta_id : label id
						segmentation : 폴리곤의경우, point좌표
						+
						label_type : 데이터셋, label의 객체 탐지 유형
					*/
					ajaxData.info = JSON.stringify(ajaxData.info); 
					console.log("==ajaxdata==",ajaxData);
					var deffered = $.ajax({
						url :  baseUrl + "data/updateMeta.json",
						data : ajaxData,
						type : "POST",
						traditional: true,
						success : function(res){
							console.log("compare_flag" + compare_flag);
							if(compare_flag === false) {
								that.updateDataset(dataset_id * 1, ajaxData['data_id']);
							} else if(compare_flag === true){
								console.log("SUCCESS2");
							}
						},
						error : function(err){
							$("#loader").hide();
							alert(err);
							console.log("ERROR!!", err);
						}
					});

					updateMetaList.push(deffered);
				}
				
				Promise.all(updateMetaList).then(function(res){
					console.log("===updateMeta===",res);
					$("#loader").hide();
					for(var i=0; i<res.length; i++){
						if(res[i].result.code == "200"){
						} else if(res[i].result.code == "2001"){
							alert(res[i].result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res[i].result.data);
							return false;
						}
					}
					
					// jh.sa 저장 후 해당 지점의 swiperInfo 데이터 넘기기
// 					current_swiperInfo = that.root.data.enrichSwiper.data.swiperInfo;
// 					console.log("current_swiperInfo: ", current_swiperInfo);
					if(!ing){
						that.root.init(that.root.data.nodes, index);
					}
				});
				
			},

			//data object(gObj) info setting
			initGObj(){
				const that = this;
				const data = that.root.data;
				
				if(typeof data.gArr[data.gInfo.current_cursor] == "undefined"){
					data.gArr[data.gInfo.current_cursor] = JSON.parse( JSON.stringify(data.gObjTemplete) );	
				}
				data.gObj = data.gArr[data.gInfo.current_cursor];
				data.gObj.imgSrc = data.imgList[data.gInfo.current_cursor];
				hObj = JSON.parse( JSON.stringify(hObjTemplete) );
			},
			//
			//ㅌㅍ
			//data image info setting
			initImgInfo(dataArr){
				const that = this;

				const data = that.root.data;
				const imgMap = data.imgMap = {};
				const imgList = data.imgList = [];
				const assetList = data.assetList = [];
				
				/* if(dataArr.length == 1) 
				{
					for(let i=0, len=dataArr.length; i<len; i++){
						that.mappingImgMap2(dataArr[i]);
					}
					
					/* const keys = Object.values(imgMap); */
/* 					const keys = Object.values(imgMap); */
	/* 				for(let i=0, len=keys.length; i<len; i++){
						imgList.push("/uploadFile/xlabeller/"+keys[i]);
	    				/* assetList.push(imgMap[keys[i]]); 
					} 
					let i = 0;
					for(let key in imgMap) {
						imgList.push("/uploadFile/xlabeller/"+keys[i]);
						assetList.push(key);
						i++;
					}
				} */
				
				for(let i=0, len=dataArr.length; i<len; i++){
					that.mappingImgMap(dataArr[i]);
				}
					
				/* const keys = Object.values(imgMap); */
				const keys = Object.keys(imgMap);

				for(let i=0, len=keys.length; i<len; i++){
					imgList.push("/uploadFile/xlabeller/"+keys[i]);
    				assetList.push(imgMap[keys[i]]); 
				}
			},
   			mappingImgMap(data){
 				const that = this;
				const imgMap = that.root.data.imgMap;

				for(let i=0, len=data.length; i<len; i++){
					if(typeof(imgMap[data[i].path]) == "undefined"){
						imgMap[data[i].path] = data[i].data_id;
						if(data[i].dataset_id){
							imgMap[data[i].path] += "_" + data[i].dataset_id;
						}
					} else {
						imgMap[data[i].path] += "," + data[i].data_id;
						if(data[i].dataset_id){
							imgMap[data[i].path] += "_" + data[i].dataset_id;
						}
					}
    			}
			},   
			 
/*   			 mappingImgMap2(data){
				const that = this;
				const imgMap = that.root.data.imgMap;
				
		
				for(let i=0, len=data.length; i<len; i++){
					imgMap[data[i].id] = data[i].path;
					 
 					//if(data[i].dataset_id){
					//	imgMap[data[i].id] += "_" + data[i].dataset_id;
					//}  
				}
				
				
			},    */


			
			multiSelection() {
				const that = this;
				const canvas = that.root.data.canvas;

				canvas.discardActiveObject();
				const cmpArr = [];
				const tempArr = $(".label .layer-wrap .label-wrap.on");
				$.each(tempArr, function(index, value){
					cmpArr.push(value.id.split("_")[1]);
				});
				canvasObjArr = [];
				for(var i=0; i<cmpArr.length; i++){
					canvas.getObjects().forEach(function(o) {
						if(o.id === cmpArr[i]) {
							canvasObjArr.push(o);
						}
					});
				}
				const multiSelection = new fabric.ActiveSelection(canvasObjArr, {
					canvas: canvas,
					lockMovementX: true,
					lockMovementY: true,
					hasControls: false,
					hasBorders: false,
				});
				
				canvas.setActiveObject(multiSelection);
			},

			onBodyMouseDown : function(evt) {
				const that = this;
				if (!($(evt.target).hasClass("range") || $(evt.target).parents(".range").length>0)) {
					$(".range").hide();
					$("body").off("mousedown", that.onBodyMouseDown);
				}
			},

			del(){
				const that = this;
				
				hObj.label.list.length = 0;

				const del = $(".label-container").find(".label-wrap.on");
				const labels = [];
				$.each(del, function(index, value){
					const labelMap = {
						layerId : $(value).parent().parent().attr("id"),
						labelId : value.id.split("_")[1],
					}
					labels.push(labelMap);

					const labelObj = {};
					labelObj["layerId"] = labelMap.layerId;
					labelObj["labelId"] = labelMap.labelId;
					labelObj["labelValue"] = that.root.data.gObj.layer[labelMap.layerId].labelMap[labelMap.labelId];
					labelObj["before"] = null;
					hObj.label.list.push(labelObj);
				});
				
				//undo, redo
				hObj.stack.length = hObj.cursor;
				hObj.label.action = "remove";
	
				hObj.stack[hObj.cursor++] = JSON.parse( JSON.stringify( hObj.label ) );
				//
				
				that.removeLabel(labels);
			},
			drawLabel(label) {
				const that = this;
				const gObj = that .root.data.gObj;
				const img = gObj.img;
				const imgInfo = gObj.imgInfo;
				const canvas = that.root.data.canvas;
				
				const enrichCanvas = that.root.data.enrichCanvas;
				const enrichPanel = that.root.data.enrichPanel;
				for(let i=0; i<label.length; i++){
					const layerId = label[i].layerId;
					const labelId = label[i].labelId
					const labelValue = label[i].labelValue;
					const label = label[i];			//jh.sa polygon fill
					
					//draw canvas
					if(labelValue.points){	// polygon
						enrichCanvas.render.createPoints(labelValue.id, labelValue.points, label);
					} else {
						const rect = new fabric.Rect(labelValue);
						canvas.add(rect);
					}
					//
					const canv = document.createElement('canvas');
					canv.id = labelValue.id

					enrichPanel.render.addLabel(canv, layerId, labelValue);
					gObj.layer[layerId].labelMap[labelId] = JSON.parse( JSON.stringify(labelValue) );
				}
			},
			removeLabel(label){
				const that = this;
				const gObj = that.root.data.gObj;
				const canvas = that.root.data.canvas;

				//mapping
				const canvObj = canvas.getObjects();
				
				for(let i=0; i<label.length; i++){
					for(let j=0; j<canvObj.length; j++){
						const isId = label[i].labelId == canvObj[j].id;
						const isParentId = label[i].labelId == canvObj[j].parent_obj_id
						if(isId || isParentId){
							canvas.remove(canvObj[j]);
							$(".label #"+label[i].layerId+" #div_"+label[i].labelId).remove();
		 					delete(gObj.layer[label[i].layerId].labelMap[label[i].labelId]);
						}
					}
				}
			},
			updateHistoryLabel(list, type) {
				const that = this;
				const gObj = that.root.data.gObj;
				const canvas = that.root.data.canvas;

				const attr = type == "undo" ? "before" : "labelValue" 
				
				canvas.discardActiveObject();
							
				//mapping
				const canvObj = canvas.getObjects();
				const canvObjMap = {};
				for(let i=0 ; i<canvObj.length; i++){
					canvObjMap[canvObj[i].id] = canvObj[i];
				}
				
				const enrichCanvas = that.root.data.enrichCanvas;
				const enrichPanel = that.root.data.enrichPanel;
				for(let i=0; i<list.length; i++){
					const o = canvObjMap[list[i].labelId];
					//canvas
					canvas.remove(o);
					
					const c = canvas.getObjects()
					for(let j=0; j<c.length; j++){
						if(c[j].parent_obj_id && c[j].parent_obj_id == list[i].labelId){
							canvas.remove(c[j]);
						}
					}
					if(list[i][attr].points){
						enrichCanvas.render.createPoints(list[i][attr].id, list[i][attr].points, list[i][attr].fill);		// jh.sa polygon fill
					} else {
						const rect = new fabric.Rect(list[i][attr]);
						canvas.add(rect);
					}
					canvas.renderAll();
					
					//label
					$(".label #"+list[i].layerId+" #div_"+o.id).removeClass("on");
					$(".label #"+list[i].layerId+" #div_"+o.id+" input[type='text']" ).val(list[i][attr].label);
					const canv = document.getElementById(o.id);
					const img = gObj.img;
					const imgInfo = gObj.imgInfo;
					enrichPanel.render.drawLabelImage(canv, list[i][attr]);
					
					//gObj
					gObj.layer[list[i].layerId].labelMap[list[i].labelId] = list[i][attr];
				}
			},
			
			updateLabel(label, type){
				const that = this;
				const gObj = that.root.data.gObj;
				const canvas = that.root.data.canvas;

				canvas.discardActiveObject();
							
				//mapping
				const canvObj = canvas.getObjects();
				const canvObjMap = {};
				for(let i=0 ; i<canvObj.length; i++){
					canvObjMap[canvObj[i].id] = canvObj[i];
				}
				
				for(let i=0; i<label.length; i++){
					const o = canvObjMap[label[i].labelId];
					//canvas
					canvas.remove(o);
					const rect = new fabric.Rect(label[i].labelValue);
					canvas.add(rect);
					canvas.renderAll();
					
					//label
					if(type=="redo"){
						$(".label #"+label[i].layerId+" #div_"+o.id+" input[type='text']" ).val(label[i].labelValue.label);
					} else if(type=="undo") {
						$(".label #"+label[i].layerId+" #div_"+o.id).removeClass("on");
						$(".label #"+label[i].layerId+" #div_"+o.id+" input[type='text']" ).val(label[i].before.label);
					}
					const canv = document.getElementById(o.id);
					const img = gObj.img;
	    			const imgInfo = gObj.imgInfo;
	    			const enrichPanel = that.root.data.enrichPanel;
					enrichPanel.render.drawLabelImage(canv, label[i].labelValue, img, imgInfo);
	    			
					
					//gObj
					if(type=="redo"){
						gObj.layer[label[i].layerId].labelMap[label[i].labelId] = label[i].labelValue;
					} else if(type=="undo"){
						gObj.layer[label[i].layerId].labelMap[label[i].labelId] = label[i].before;
					}
				}
								
			},

			//collision
			getMetaAjax : function(index, selected, isProcess){
				const that = this;
				const assetList = that.root.data.assetList;
				
				if(index < assetList.length){
					const dataId = assetList[index];
					const idObj = {};
					const idArr = dataId.split(",");
					const getMetaList = [];
					
					$("#loader").show();
					for(let i=0; i<idArr.length; i++){ 
						idObj[idArr[i].split("_")[0]] = idArr[i].split("_")[1]; 
						const deffered = $.ajax({
							url :  baseUrl + "/data/getMetaList.json",
							data : {data_id : idArr[i].split("_")[0]},
							type : "POST",
							success : function(res){
								console.log("=====data=====", res);
							},
							error : function(err){
								console.log("ERROR!!", err);
							}
						});

						getMetaList.push(deffered);
					 }
					
					Promise.all(getMetaList).then(function(res){
						console.log("===getMetaList===",res);
	// 					$("#loader").hide();
						that.mappingGObj(index, selected, idObj, res, isProcess);
						
					});
				} else {
					return false;
				}
			},
			
			
			
			//
			
			
			      


			// data정보를 gObj로 매핑해서 충돌검사 
			mappingGObj : function(index, selected, idObj, res, isProcess){
				const that = this;
				const imgList = that.root.data.imgList;
				let gObj = that.root.data.gObj

				that.root.data.gObj = { 
					imgSrc : 0,
					imgInfo: {scaleFactor : 1 , width : 0 , height : 0},
					img : null,
					layer : {},
				};
				
				that.root.data.gObj.imgSrc = imgList[index];
				that.root.data.gObj.img = new Image();
// 				that.root.data.gObj.img.src = "<c:url value='"+gObj.imgSrc+"' />";
				that.root.data.gObj.img.src = "<c:url value='"+that.root.data.gObj.imgSrc+"' />";
				that.root.data.gObj.img.onload = function(){
					var gObj = that.root.data.gObj;
	 				that.rescale(this);
					for(let i=0; i<res.length; i++){
						if(res[i].result.code == "200"){
							res[i].metaVO.dataset_id = idObj[res[i].metaVO.data_id]
							that.root.data.gObj.layer[res[i].metaVO.data_id] = { labelMap : {},};
							
							//
							const data = res[i].result.data;
							if(data != null){
								for(let j = 0 ; j < data.length ; j++){
									const inf = data[j].info.split(",");
									const fillColor = colorHash.rgb(data[j].label);
									that.root.data.gObj.layer[res[i].metaVO.data_id].labelMap[data[j].id] = {						
										angle: 0,
										fill: "rgba("+fillColor[0]+","+fillColor[1]+","+fillColor[2]+",0.5)",
										height: inf[3]*1*gObj.imgInfo.scaleFactor,
										id: data[j].id,
										label: data[j].label,
										left: inf[0]*1*gObj.imgInfo.scaleFactor,
										top: inf[1]*1*gObj.imgInfo.scaleFactor,
										width: inf[2]*1*gObj.imgInfo.scaleFactor
									};
								}
							}//end labelMap
							
						} 
					}//end layer
					
					if(isProcess == "collision"){
						//onload 수행 후 실행
						that.deleteCollision(index, selected, isProcess);
					} else if(isProcess == "layerMove"){
						that.processLayerMove(index, selected, isProcess);
					}
					
				}//end gObj
			},
			
			layerMove(selected) {
				const that = this;
				
				that.getMetaAjax(0, selected, "layerMove");
			},
			
			processLayerMove(index, selected, isProcess) {
				const that = this;
				const nodes = that.root.data.nodes;
				const gObj = that.root.data.gObj;
				const gInfo = that.root.data.gInfo;

				const keys = Object.keys(gObj.layer);
				let unselected;
				
				if(keys.length>1){
					for(let i=0; i<keys.length; i++){
						if(i!=selected){
							unselected = keys[i];
						}
					}
					
					const unlabelMap = gObj.layer[unselected].labelMap;
					const unlabelKeys = Object.keys(unlabelMap);
					for(let i=0; i<unlabelKeys.length; i++){
						gObj.layer[keys[selected]].labelMap[unlabelKeys[i]] = unlabelMap[unlabelKeys[i]];
						delete(unlabelMap[unlabelKeys[i]]);
					}
					
				}
				
				let ing = true;
				that.submitMeta(ing);

				ing = that.getMetaAjax(++index, selected, isProcess);
				if(ing === false){
					that.root.init(nodes, gInfo["current_cursor"]);
				}
			},
			
			collisionInfo : {
				isAll : null,
				isSelected : null,
				isType : null,
			},
			/*
				all : true = dataset내의 모든 data적용, false = 해당 data적용
				selected : 선택한 레이어 meta데이터 살림
				type : and = 두 레이어 범위 모두 만족시, or = 두 레이어 범위 중 하나만 만족시
			*/
			collision(all, selected, type){
				const that = this;
				const gObj = that.root.data.gObj;

				that.collisionInfo.isAll = all;
				that.collisionInfo.isType = type;
				if(all){
					that.getMetaAjax(0, selected, "collision");
				} else {
					const keys = Object.keys(gObj.layer);
					that.collisionInfo.isSelected = keys[selected];
					const idArr = that.processCollision(gObj);
					that.root.data.isCollision = true;
				}
			},

			//충돌 검사후 삭제
			deleteCollision : function(index, selected, isProcess){
				const that = this;
				const nodes = that.root.data.nodes;
				const gObj = that.root.data.gObj;
				const gInfo = that.root.data.gInfo;

				const keys = Object.keys(gObj.layer);
				that.collisionInfo.isSelected = keys[selected];

				//충돌하는 meta id 받아와서 gObj에서 삭제 후 submit
				const idArr =  that.processCollision(gObj);
				if(idArr){
					for(let i=0; i<idArr.length; i++){
						for(let j=0; j<keys.length; j++){
							delete(gObj.layer[keys[j]].labelMap[idArr[i]]);
						}
					}
				}
				
				let ing = true;
				that.submitMeta(ing);

				ing = that.getMetaAjax(++index, selected, isProcess);
				if(ing === false){
					that.root.init(nodes, gInfo["current_cursor"]);
				}
			},
			
			// 충돌 검사
			/*
				두 레이어의 label을 비교, 겹치는 부분이 사용자가 선택한 부분보다 많을 시 해당 label의 id값 return;
			*/
			processCollision(cObj){
				const that = this;
				
				const cIdArr = []; 
				
				const keys = Object.keys(cObj.layer);
				if(keys.length != 2){
					return;
				}
				
				let aIndex, bIndex, aKeys, bKeys;
				if(that.collisionInfo.isSelected == keys[0]){
					aIndex = 0;
					bIndex = 1;
					aKeys = Object.keys(cObj.layer[keys[0]].labelMap);
					bKeys = Object.keys(cObj.layer[keys[1]].labelMap);
				}else if(that.collisionInfo.isSelected == keys[1]){
					aIndex = 1;
					bIndex = 0;
					aKeys = Object.keys(cObj.layer[keys[1]].labelMap);
					bKeys = Object.keys(cObj.layer[keys[0]].labelMap);
				}
				for(let i=0; i<aKeys.length; i++){
					const temp1 = cObj.layer[keys[aIndex]].labelMap[aKeys[i]];
					const a = [];
					a[0] = temp1.left;
					a[1] = temp1.left + temp1.width;
					a[2] = temp1.top;
					a[3] = temp1.top + temp1.height;
					
					for(let j=0; j<bKeys.length; j++){
						const temp2 = cObj.layer[keys[bIndex]].labelMap[bKeys[j]];
						const b = [];
						b[0] = temp2.left;
						b[1] = temp2.left + temp2.width;
						b[2] = temp2.top;
						b[3] = temp2.top + temp2.height;
						
						//x, y coordinate comparison
						let mathX, mathY;
						if(a[0]<b[0]){
							mathX = Math.abs(a[0] - b[1]);
						} else {
							mathX = Math.abs(a[1] - b[0]);
						}
						if(a[2]<b[2]){
							mathY = Math.abs(a[2] - b[3]);
						} else {
							mathY = Math.abs(a[3] - b[2]);
						}
						const isComparisonX = Math.abs(a[1]-a[0]) + Math.abs(b[1]-b[0]) > mathX;
						const isComparisonY = Math.abs(a[3]-a[2]) + Math.abs(b[3]-b[2]) > mathY;
						
						const t = [];
						if(isComparisonX && isComparisonY){
							if(temp1.label !== temp2.label){
								continue;
							}
							
							if(a[0] <= b[0]){ t[0] = b[0]; }
							else if(a[0] > b[0]){ t[0] = a[0]; }
							
							if(a[1] <= b[1]){ t[1] = a[1]; }
							else if(a[1] > b[1]){ t[1] = b[1]; }
							
							if(a[2] <= b[2]){ t[2] = b[2]; }
							else if(a[2] > b[2]){ t[2] = a[2]; }
							
							if(a[3] <= b[3]){ t[3] = a[3]; }
							else if(a[3] > b[3]){ t[3] = b[3]; }
							
							
							////
							//type == 0 : AND,
							//type == 1 : OR
							tArea = Math.abs(t[1]-t[0]) * Math.abs(t[3]-t[2]);
							aArea = Math.abs(a[1]-a[0]) * Math.abs(a[3]-a[2]);
							bArea = Math.abs(b[1]-b[0]) * Math.abs(b[3]-b[2]);
							let aPercent, bPercent;
							if(that.collisionInfo.isAll){
								aPercent = $(".all_collision .aPercent").text().split("%")[0];
								bPercent = $(".all_collision .bPercent").text().split("%")[0];
							} else {
								aPercent = $(".collision .aPercent").text().split("%")[0];
								bPercent = $(".collision .bPercent").text().split("%")[0];
							}
							
							//check and, or
							let isAndOr;
							if(that.collisionInfo.isType == 0){
								isAndOr = aPercent <= tArea / aArea * 100 && bPercent <= tArea / bArea * 100;
							} else if(that.collisionInfo.isType == 1){
								isAndOr = aPercent <= tArea / aArea * 100 || bPercent <= tArea / bArea * 100;
							}
							
							if(isAndOr){
								// temp1 : 선택테이블, temp2 : 선택안된테이
								cIdArr.push(temp2.id);
								$("#div_"+temp2.id).addClass("collision");
								//
							}
							
								
						}//end x,y좌표 비교
						
					}//end b레이어
				}//end a레이어
				
				
				//충돌된 메타id 리턴
				return cIdArr;
			},

			//canvas 크기에 맞게 이미지크기 조절
			rescale : function(img,w,h){
				const that = this;
// 				const canvas_max_width = that.root.data.canvWidth;
// 				const canvas_max_height = that.root.data.canvHeight;
				const canvas_max_width = 596;
				const canvas_max_height = 447;
				
				if(w != null && h != null){
					canvas_max_width = w;
					canvas_max_height = h;        		
				}
					
				// canvas 최대 너비와 높이에 맞춰 원본 이미지 비율대로 이미지 크기 설정
				let scaleFactor=0;
				if(canvas_max_height/canvas_max_width >= img.naturalHeight/img.naturalWidth  ){
					scaleFactor=canvas_max_width/img.naturalWidth;
				}else{
					scaleFactor=canvas_max_height/img.naturalHeight;
				}
				
				let imgInfo = that.root.data.gObj.imgInfo;
				imgInfo.scaleFactor = scaleFactor;
				imgInfo.width = img.naturalWidth;
				imgInfo.height = img.naturalHeight;
				
				
				that.root.data.canvas.setWidth(img.naturalWidth*scaleFactor);
				that.root.data.canvas.setHeight(img.naturalHeight*scaleFactor);
				that.root.data.canvas.calcOffset();
				that.root.data.canvas.renderAll();
				that.root.pt.find("section.enrichment #frame-container").height(img.naturalHeight*scaleFactor);
			},
			//
			
			ajaxDataList(id){
				console.log("id : " + id);
				const deffered = $.ajax({
					url : baseUrl + "data/getDataList.json",
					data : {dataset_id : id},
					type : "POST",
					success(res){
						if(res.result.code == "200"){
							
						} else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}		
					},
					error(err) {
						console.log("ERROR!!", err);
					}
				});
				return deffered;
			},
			ajaxMetaList(id){
				const deffered = $.ajax({
					url :  baseUrl + "data/getMetaList.json",
					data : {data_id : id},
					type : "POST",
					success : function(res){
						console.log("getMetaList", res);
						if(res.result.code == "200"){
							
						} else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}							
					},
					error : function(err){
						console.log("ERROR!!", err);
					}
				});
				return deffered;
			},
			setAnnoTaskName() {
				const that = this;
				const deffered = $.ajax({
					url : baseUrl + "task/setAnnoTaskName.json",
					data : {dataset_id : dataset_id},
					type : "POST",
					success(res){
						console.log("=======setAnnoTaskName=======", res);
						that.taskName = res.result[0];
						that.annotationName = res.result[1];
						that.inferenceName = res.result[2];
						that.getDatasetList();

					},
					error(err) {
						console.log("ERROR!!", err);
					}
				});
				return deffered;
			},
			// Quick Training & Quick Inference
			getDatasetList(){
				const that = this;
				const deffered = $.ajax({
					url : baseUrl + "/data/getDatasetList.json",
					data : {dataset_id : null},							// id => dataset_id(0921)
					type : "POST",
					success(res){
						console.log("=======getDatasetList=======", res);
						if(res.result.code == "200"){
							that.drawDefaultQuickInfo(res.result.data);
							that.drawDefaultCsvInfo(res.result.data);							
						} else if(res.result.code == "2001"){
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}

					},
					error(err) {
						console.log("ERROR!!", err);
					}
				});
				return deffered;				
			},
			
			drawDefaultQuickInfo(datasetData){
				const that = this;
				
				let dataset_data = datasetData;
				let annotation_title_input = that.root.pt.find("input[name='annotation_name']");
				let task_title_input = that.root.pt.find("input[name='task_name']");
				let task_contents_input = that.root.pt.find("input[name='task_contents']");
			
				console.log("dataset_data : ", dataset_data);
				console.log("taskName3 : " + that.taskName);
				console.log("annoName3 : " + that.annotationName);
				for(let i = 0; i < dataset_data.length; i++){
					if(dataset_data[i].dataset_id === dataset_id){
						annotation_title_input.val(that.annotationName);			// jh.sa default name  
						task_title_input.val(that.taskName); 
						task_contents_input.val("Quick training model");
					} else {
						continue;
					}
				};
			},
			
			drawDefaultCsvInfo(datasetData){
				const that = this;
			
				let dataset_data = datasetData;
				let csv_title = that.root.pt.find("input[name='csv_title']");
			
				console.log("dataset_data : ", dataset_data);
				for(let i = 0; i < dataset_data.length; i++){
					if(dataset_data[i].dataset_id === dataset_id){
						csv_title.val(that.inferenceName);			// jh.sa default name  
					} else {
						continue;
					}
				};				
			},
			// label_type별로 알고리즘 리스트 출력 
			getAlgorithmList(){
				const that = this;
				let datasetId = that.root.data.nodes[0].id;
				const deffered = $.ajax({
					url : baseUrl + "/algorithm/getAlgorithmList.json",
					data : {algorithm_id : null, dataset_id : datasetId},
					type : "POST",
					success(res){
						console.log("=======getAlgorithmList=======", res);
						if(res.result.code == "200"){
							that.drawAlgorithmList(res.result.data);
						} else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}						
						
					},
					error(err) {
						console.log("ERROR!!", err);
					}
				});
				return deffered;								
			},
			
			getAlgorithmById(data, num){
				const that = this;
				const deffered = $.ajax({
					url : baseUrl + "/algorithm/getAlgorithmById.json",
					data : {algorithm_id : data},
					type : "POST",
					success(res){
						console.log("=======getAlgorithmById=======", res);
						if(res.result.code == "200"){
							if(num == "0") {
								that.setTrainingConfig(res.result.data);					
							} else if (num == "1") {
								that.setInferenceConfig(res.result.data);
							}
						} else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}		

					},
					error(err) {
						console.log("ERROR!!", err);
					}
				});
				return deffered;					
			},
			
			getTaskById(id){
				const that = this;
				const deffered = $.ajax({
					url : baseUrl + "/task/getTaskById.json",
					data : {id : id},
					type : "POST",
					success(res){
						console.log("=======getTaskById=======", res);

						if(res.result.code == "200"){
							that.getAlgorithmById(res.result.data.algorithm_id, "1");
							that.getCheckpointList(id, "1");
						} else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}		
					},
					error(err) {
						console.log("ERROR!!", err);
					}
				});
				return deffered;				
			},
			
			getTaskList(data, num){
				const that = this;
				/* console.log("dataset ID : ", that.data.nodes); */
				/* let dataset_id = nodes[0].id; */
				const deffered = $.ajax({
					url : baseUrl + "/task/getQuickInferenceTaskList.json",
					data : {project_id : null, id : dataset_id},
					type : "POST",
					success(res){
						console.log("=======getQuickInferenceTaskList=======", res);
						
						if(res.result.code == "200"){
							if(num == "0"){
								that.getProjectList(res.result.data, "0");
							} else if (num == "1") {
								that.getProjectList(res.result.data, "1");
							}
						} else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}								

						
					},
					error(err) {
						console.log("ERROR!!", err);
					}
				});
				return deffered;				
			},
			getProjectList(data, num){
				const that = this;
				let task_list_data = data;
				const deffered = $.ajax({
					url : baseUrl + "/project/getProjectList.json",
					data : null,
					type : "POST",
					success(res){
						console.log("=======getProjectList=======", res);
						if(res.result.code == "200"){
							if(num == "0"){
								that.drawInheritTaskList(task_list_data, res.result.data);
								that.drawProjectList(res.result.data);
							} else if (num == "1"){
								that.drawTaskList(task_list_data, res.result.data);
							}
						} else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}								
						

					},
					error(err) {
						console.log("ERROR!!", err);
					}
				});
				return deffered;				
			},
			
			getCheckpointList(id, num){
				const that = this;
				
				const deffered = $.ajax({
					url : baseUrl + "/task/getCheckPointList.json",
					data : { id : id },
					type : "POST",
					success(res){
						console.log("=======getCheckPointList=======", res);
						if(res.result.code == "200"){
							if(num == "0"){
								that.drawInheritCheckpointList(res.result.data);
							} else if(num == "1"){
								that.drawInferenceCheckpointList(res.result.data);
							}
						} else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}								

						
					},
					error(err) {
						console.log("ERROR!!", err);
					}
				});
				return deffered;				
			},
			
			drawAlgorithmList(data){
				const that = this;
				
				console.log("algorithmListData : ", data);
				let selectTarget = that.root.pt.find(".quick_training .algorithm_result");
				$(selectTarget).html("");
				
				let html = "<option value=''>Please select the algorithm</option>"; 
				for(let i=0, len = data.length; i<len; i++){
					html += "<option data-id='"+data[i]["algorithm_id"]+"' value='"+data[i]["title"]+"'>";
					html += data[i]["title"];
					html += "</option>";
		
				}
				$(selectTarget).append(html);
				that.selectAlgorithm(data);
			},
			
			// quick training을 할 task를 생성할 프로젝트 
			drawProjectList(data){
				const that = this;
				
				console.log("projectListData : ", data);
				let selectTarget = that.root.pt.find(".quick_training .project_result");
				$(selectTarget).html("");
				
				let html = "<option value=''>Please select the project</option>"; 
				for(let i=0, len = data.length; i<len; i++){
					html += "<option data-id='"+data[i]["id"]+"' value='"+data[i]["title"]+"'>";
					html += data[i]["title"];
					html += "</option>";
		
				}
				$(selectTarget).append(html);
				
				// 기본값으로 첫번째 프로젝트 지정 
				let options = $(".project_result").children("option");
				options[1].selected = true;
				
			},
			
			// inheritance 대상이 될 task list를 select box으로 보여줌 
			drawInheritTaskList(task_list_data, project_data){
				const that = this;
				console.log("inheritTaskListData : ", task_list_data);
				console.log("inheritProjectData : ", project_data);
				let selectTarget = that.root.pt.find(".quick_training .task_result");
				$(selectTarget).html("");
				
				let html = "<option value=''>Please select the task</option>"; 
				for(let i=0; i < task_list_data.length; i++){
					for(let j=0; j < project_data.length; j++){
						if(task_list_data[i].project_id === project_data[j].id){
							html += "<option data-id='"+task_list_data[i]["id"]+"' data-projectId='"+project_data[j].id+"' value='"+task_list_data[i]["title"]+"'>";
							html +=  project_data[j].title+ " / " + task_list_data[i]["title"];
							html += "</option>";							
						} else {
							continue
						}
					}
				}
				$(selectTarget).append(html);	
				that.selectInheritTask(task_list_data);
			},
			
			// inheritance 선택 시 checkpoint list 그리기 
			drawInheritCheckpointList(data){
				const that = this;
				
				if(data != null && data.length > 0){
					let checkPoints = data.reverse();
					let target = that.root.pt.find("#quick_training .checkpoint_table tbody");
					
					let html = "";
					$(target).html("");
					that.root.pt.find(".empty_wrap").remove();
					console.log("checkPoints : ", checkPoints);
					console.log("target html : ", target);
					
					if(checkPoints.includes(".DS_Store")){
						let index = checkPoints.indexOf(".DS_Store");
						if(index>-1){
							checkPoints.splice(index, 1);
						}
					}
					console.log("checkPoints : ", checkPoints);
					
					for(let i = 0; i < checkPoints.length; i++){
						if(checkPoints[i] != ".DS_Store"){
							html += "<tr>";
							html += "<td class='checkPoint_check'>";
							if(i == 0){
								html += "<div class='radioBtn selected'></div>";
							} else {
								html += "<div class='radioBtn'></div>";								
							}
							html += "</td>";
							html += "<td class='checkPoint_name'>"+checkPoints[i]+"</td>";
							html += "</tr>";					
						}
					}
					
					$(target).prepend(html);
					that.root.bind.removeEmptyData(that.root.pt.find("#quick_training .checkpoint_list .list_wrap"));
					
					//jh.sa
					let checkpoint_view = that.root.pt.find(".checkpoint_view");
					let selected_cp_name = that.root.pt.find(".checkpoint_list .radioBtn.selected").parent().next().text();
					console.log("chkpoint_name: ", selected_cp_name);
					checkpoint_view.addClass("active");
					checkpoint_view.html("Selected Model :" + selected_cp_name);
					let selected_id = that.root.pt.find(".task_result option:selected").data("id");
					that.getSelectedTaskById(selected_id);
					that.root.pt.find(".algorithm_result").attr("disabled","disabled");
					
					that.checkPointListener();					
				} else if(data != null && data.length == 0) {
// 					that.root.bind.removeEmptyData(that.root.pt.find("#quick_training .checkpoint_list .list_wrap"));					
					if(that.root.pt.find("#quick_training .checkpoint_list .empty_wrap").length == 0){
						that.root.bind.addEmptyData(that.root.pt.find("#quick_training .checkpoint_list .list_wrap"), "No Model", "please train your task first");
					}
				} else {
// 					that.root.bind.removeEmptyData(that.root.pt.find("#quick_training .checkpoint_list .list_wrap"));					
					if(that.root.pt.find("#quick_training .checkpoint_list .empty_wrap").length == 0){
						that.root.bind.addEmptyData(that.root.pt.find("#quick_training .checkpoint_list .list_wrap"), "No Model", "please train your task first");				
					}
				}

			},
			
			// quick inference checkpoint
			drawInferenceCheckpointList(data){
				const that = this;
				
				if(data != null && data.length > 0){
					let checkPoints = data.reverse();
					let target = that.root.pt.find("#quick_inference .inference_checkpoint .checkpoint_table tbody");
					
					let html = "";
					
					$(target).html("");
					that.root.pt.find(".empty_wrap").remove();
					console.log("checkPoints : ", checkPoints);
					console.log("target html : ", target);
					
					if(checkPoints.includes(".DS_Store")){
						let index = checkPoints.indexOf(".DS_Store");
						if(index>-1){
							checkPoints.splice(index, 1);
						}
					}
					console.log("checkPoints : ", checkPoints);
					
					for(let i = 0; i < checkPoints.length; i++){
						if(checkPoints[i] != ".DS_Store"){
							html += "<tr>";
							html += "<td class='checkPoint_check'>";
							if(i == 0){
								html += "<div class='radioBtn selected'></div>";
							} else {
								html += "<div class='radioBtn'></div>";								
							}
							html += "</td>";
							html += "<td class='checkPoint_name'>"+checkPoints[i]+"</td>";
							html += "</tr>";					
						}
					}
					
					$(target).prepend(html);
					that.root.bind.removeEmptyData(that.root.pt.find("#quick_inference .inference_checkpoint .list_wrap"));
					that.inferenceCheckPointListener();					
				} else if(data != null && data.length == 0) {
// 					that.root.bind.removeEmptyData(that.root.pt.find("#quick_inference .inference_checkpoint .list_wrap"));					
					if(that.root.pt.find("#quick_inference .inference_checkpoint .empty_wrap").length == 0){
						that.root.bind.addEmptyData(that.root.pt.find("#quick_inference .inference_checkpoint .list_wrap"), "No Model", "please train your task first");
					}
				} else {
// 					that.root.bind.removeEmptyData(that.root.pt.find("#quick_inference .inference_checkpoint .list_wrap"));					
					if(that.root.pt.find("#quick_inference .inference_checkpoint .empty_wrap").length == 0){
						that.root.bind.addEmptyData(that.root.pt.find("#quick_inference .inference_checkpoint .list_wrap"), "No Model", "please train your task first");
					}
				}
			},			
			
			// quick inference 팝업의 task list 그리기 
			drawTaskList(task_list_data, project_data){
				const that = this;
				

				console.log("taskDataa:: " , task_list_data);
				console.log("project_data :: ", project_data);
				let target = that.root.pt.find(".quick_task_list .list_wrap .table_body .task_table tbody");
				let html = "";
				
				for(let i = 0; i < task_list_data.length; i++){
					html += "<tr>";
					html += "<td class='task_check'>";
					html += "<div class='radioBtn'></div>";
					html += "</td>";
					for(let j = 0; j < project_data.length; j++){
						if(task_list_data[i].project_id === project_data[j].id){
							html += "<td class='task_name' data-id='"+task_list_data[i].id+"' data-projectId='"+project_data[j].id+"'>"+project_data[j].title+" / "+task_list_data[i].title+"</td>";							
						} else {
							continue;
						}
					}
					html += "</tr>";	
				}
				
				$(target).append(html);
				that.taskListener();
				
			},
			
			// quick training 창에서 algorithm 선택 시 config 셋팅 
			setTrainingConfig(data){
				const that = this;
				
				let configData;
				let description;
				let target = that.root.pt.find("#training_config .config_wrap");
				let description_target = that.root.pt.find("#training_config .description_wrap");
				that.root.pt.find("#training_config .description_wrap").addClass("border");	
				if(data == null) {
					$(target).html("");
					$(description_target).html("");
					
					description = "<div class='description'>The algorithm does not exist.</div>";
					$(description_target).append(description);						
				} else {
					configData = JSON.parse(data.train_param);		
					
					$(target).html("");
					$(description_target).html("");
					
					description = "<div class='description'>"+data.description+"</div>";
					$(description_target).append(description);		
					
					for(let i=0; i < configData.length; i++){
						console.log(configData[i]);
						let html = "";
						if(configData[i].type == "string") {
							html += '<div class="input_wrap flex light">';
							html += '<label>'+configData[i].param+'<span class="tooltip_wrap"></span></label>';
							html += '<span class="tooltip">'+configData[i].helper+'</span>';
							html += '<input type="text" name="'+configData[i].param+'" value="'+configData[i].defaultvalue+'"/>';
							html += '</div>';
							$(target).append(html);
						} else if(configData[i].type == "number"){
							html += '<div class="input_wrap flex light">';
							html += '<label>'+configData[i].param+'<span class="tooltip_wrap"></span></label>';
							html += '<span class="tooltip">'+configData[i].helper+'</span>';
							html += '<input type="number" name="'+configData[i].param+'" value="'+configData[i].defaultvalue+'" onKeyPress="return checkNum(event);"/>';
							html += '</div>';	
							$(target).append(html);
						} else if (configData[i].type = "boolean"){
							if(configData[i].defaultvalue === true) {
								html += '<div class="input_wrap flex check">';
								html += '<label>'+configData[i].param+'<span class="tooltip_wrap"></span></label>';
								html += '<span class="tooltip">'+configData[i].helper+'</span>';
								html += '<div class="check_box_wrap">';
								html += '<div class="check_box">';					
								html += '<div class="checkBox first selected" name="'+configData[i].param+'"></div>';
								html += '</div>';
								html += '</div>';
								html += '</div>';							
							} else {
								html += '<div class="input_wrap flex check">';
								html += '<label>'+configData[i].param+'<span class="tooltip_wrap"></span></label>';
								html += '<span class="tooltip">'+configData[i].helper+'</span>';
								html += '<div class="check_box_wrap">';
								html += '<div class="check_box">';					
								html += '<div class="checkBox first" name="'+configData[i].param+'"></div>';
								html += '</div>';
								html += '</div>';
								html += '</div>';
							}

							
							$(target).append(html);
						};				
					};
					
					// helper 툴팁
					let tooltip_wrap = that.root.pt.find("#training_config .tooltip_wrap");
//						console.log("tooltip_wrap:: ", tooltip_wrap);
					tooltip_wrap.off("mouseover").on("mouseover", function() {
						let tooltip = $(this).parent("label").next(".tooltip");
						tooltip.toggleClass("on");
					});
					tooltip_wrap.off("mouseout").on("mouseout", function() {
						let tooltip = $(this).parent("label").next(".tooltip");
						tooltip.removeClass("on");						
					})
					
					// checkbox 활성화
					let check_first = that.root.pt.find("#training_config .checkBox");

					check_first.off("click").on("click", function() {
						$(this).toggleClass("selected");
					});					
				}
				
			},
			
			// quick inference 에서 task 선택 시 config 셋팅 
			setInferenceConfig(data, taskId){
				const that = this;
				
				let task_id = taskId;
				let configData;
				let description;
				let algorithm_name;
				let target = that.root.pt.find("#inference_config .config_wrap");
				let description_target = that.root.pt.find("#inference_config .description_wrap");
				let algorithm_target = that.root.pt.find(".inference_algorithm");
				console.log("setInference task_id : ", task_id);
				if(data == null) {
					$(target).html("");
					$(description_target).html("");
					$(algorithm_target).html("");
					
					description = "<div class='description'>The algorithm does not exist.</div>";
					$(description_target).append(description);	
				} else {
					configData = JSON.parse(data.inference_param);		
					
					$(target).html("");
					$(description_target).html("");
					$(algorithm_target).html("");
					
					description = "<div class='description'>"+data.description+"</div>";
					$(description_target).append(description);	
					algorithm_name = "Selected algorithm : " + data.title;
					$(algorithm_target).html(algorithm_name);
					
					for(let i=0; i < configData.length; i++){
						console.log(configData[i]);
						let html = "";
						if(configData[i].type == "string") {
							html += '<div class="input_wrap flex light">';
							html += '<label>'+configData[i].param+'<span class="tooltip_wrap"></span></label>';
							html += '<span class="tooltip">'+configData[i].helper+'</span>';
							html += '<input type="text" name="'+configData[i].param+'" value="'+configData[i].defaultvalue+'"/>';
							html += '</div>';
							$(target).append(html);
						} else if(configData[i].type == "number"){
							html += '<div class="input_wrap flex light">';
							html += '<label>'+configData[i].param+'<span class="tooltip_wrap"></span></label>';
							html += '<span class="tooltip">'+configData[i].helper+'</span>';
							html += '<input type="number" name="'+configData[i].param+'" value="'+configData[i].defaultvalue+'" onKeyPress="return checkNum(event);"/>';
							html += '</div>';	
							$(target).append(html);
						} else if (configData[i].type = "boolean"){
							if(configData[i].defaultvalue === true) {
								html += '<div class="input_wrap flex check">';
								html += '<label>'+configData[i].param+'<span class="tooltip_wrap"></span></label>';
								html += '<span class="tooltip">'+configData[i].helper+'</span>';
								html += '<div class="check_box_wrap">';
								html += '<div class="check_box">';					
								html += '<div class="checkBox first selected" name="'+configData[i].param+'"></div>';
								html += '</div>';
								html += '</div>';
								html += '</div>';							
							} else {
								html += '<div class="input_wrap flex check">';
								html += '<label>'+configData[i].param+'<span class="tooltip_wrap"></span></label>';
								html += '<span class="tooltip">'+configData[i].helper+'</span>';
								html += '<div class="check_box_wrap">';
								html += '<div class="check_box">';					
								html += '<div class="checkBox first" name="'+configData[i].param+'"></div>';
								html += '</div>';
								html += '</div>';
								html += '</div>';
							}

							
							$(target).append(html);
						};
					};
					
					// helper 툴팁
					let tooltip_wrap = that.root.pt.find("#inference_config .tooltip_wrap");
//						console.log("tooltip_wrap:: ", tooltip_wrap);
					tooltip_wrap.off("mouseover").on("mouseover", function() {
						let tooltip = $(this).parent("label").next(".tooltip");
						tooltip.toggleClass("on");
					});
					tooltip_wrap.off("mouseout").on("mouseout", function() {
						let tooltip = $(this).parent("label").next(".tooltip");
						tooltip.removeClass("on");						
					})
					
					// checkbox 활성화
					let check_first = that.root.pt.find("#inference_config .checkBox");

					check_first.off("click").on("click", function() {
						$(this).toggleClass("selected");
					});					
				}
					
				
				if($("#quick_inference .radioBtn.selected").length == 0){
					$(target).html("");
					$(description_target).html("Please select task data");
				};
				

				
			},			
			
			// quick training의 algorithm select box 
			selectAlgorithm(data){
				const that = this;
				
				// 초기화시 RETINAT 기본값 적용 
				let options = $(".algorithm_result").children("option");
				let selected_option_id;
				for(var i=1; i < options.length; i++){
				    if(options[i].label == "RETINANET"){
				    	options[i].selected = true;
				    	selected_option_id = options[i].attributes["data-id"].value
				    }
				}
				that.getAlgorithmById(selected_option_id, "0", null);				// RETINANET algorithm_id
				
				$("#quick_training .algorithm_result").on("change", function(){
					let selected_algorithm = $(this).val();
					
					for(let i=0; i < data.length; i++){
						if(selected_algorithm == data[i]["title"]){
							that.getAlgorithmById(data[i]["algorithm_id"], "0", null);
							break;
						};
					};				
				});
			},
			
			// quick training 의 inheritance task select box 선택 시 호출 
			selectInheritTask(data){
				const that = this;
				
				$("#quick_training .task_result").on("change", function(){
					let selected_task = $(this).val();
					if(selected_task != ""){
						that.root.pt.find(".empty_wrap").remove();
// 						that.root.bind.removeEmptyData(that.root.pt.find(".checkpoint_list .list_wrap"));
						that.root.pt.find(".checkpoint_list .list_wrap .checkpoint_table tbody").html("");
						if($(".quick_training .radioBtn.selected").length == 0){
							that.root.pt.find(".checkpoint_view").removeClass("active");
							that.root.pt.find(".algorithm_result").removeAttr("disabled");
						} else if ($(".quick_training .radioBtn.selected").length > 0){
							$(".quick_training .radioBtn.selected").removeClass("selected");			//추가 
						}

						for(let i=0; i < data.length; i++){
							if(selected_task == data[i]["title"]){
								that.getCheckpointList(data[i]["id"], "0");
								that.drawTaskName(data[i]["title"]);
								break;
							};
						};						
					} else if(selected_task == "") {
						that.root.pt.find(".checkpoint_view").removeClass("active");
						that.root.pt.find(".algorithm_result").removeAttr("disabled");
						that.root.bind.removeEmptyData(that.root.pt.find(".checkpoint_list .list_wrap"));
						that.root.bind.addEmptyData(that.root.pt.find(".checkpoint_list .list_wrap"), "No Model", "please train your task first");				
						// 						that.root.bind.removeEmptyData(that.root.pt.find(".checkpoint_list .list_wrap"));
						that.root.pt.find(".checkpoint_list .list_wrap .checkpoint_table tbody").html("");
						that.root.pt.find(".checkpoint_list .selected_task_name").html("");
						$("#quick_training .checkpoint_list").removeClass("active");
						$("#quick_training .checkpoint_list_btn")[0].textContent = "+";					
						$(".quick_training .radioBtn.selected").removeClass("selected");
					}

				});
			},
			
			// quick training 의 inheritance task 선택 시 checkpoint list 상단에 선택한 task 이름 표시 
			drawTaskName(data){
				const that = this;
				
				let taskName_data = data;
				let target_title = that.root.pt.find(".checkpoint_list .selected_task_name");
				let select_task_name = "( Selected Task : " + taskName_data + " )";
				$(target_title).html(select_task_name);
				console.log("taskName_data : ", taskName_data);

			},
			
			checkPointListener() {
				const that = this;
				 
				let chk_radio_obj;
				let row_click = that.root.pt.find(".checkpoint_list .list_wrap .checkpoint_table tbody tr")
				row_click.off("click").on("click",function() {
					let tr = $(this);
					let btn = tr.children().children(".radioBtn");
					let chkpoint_name = tr.children(".checkPoint_name").val();
					let checkpoint_view = that.root.pt.find(".checkpoint_view");
					btn.toggleClass("selected");
					if(btn.hasClass("selected")){
						chk_radio_obj = {};
						that.root.pt.find(".checkpoint_list .list_wrap .checkpoint_table tbody tr .radioBtn").removeClass("selected");
						btn.addClass("selected");
						chk_radio_obj[chkpoint_name] = chkpoint_name;
// 						that.selectCheckpointAlgorithm();
						
						let selected_id = that.root.pt.find(".task_result option:selected").data("id");
						that.getSelectedTaskById(selected_id);
						
						let selected_cp_name = that.root.pt.find(".checkpoint_list .radioBtn.selected").parent().next().text();
						console.log("chkpoint_name: ", selected_cp_name);
						checkpoint_view.addClass("active");
						checkpoint_view.html("Selected Checkpoint :" + selected_cp_name);
						
						that.root.pt.find(".algorithm_result").attr("disabled","disabled");		// 체크포인트 선택 시 algorithm select 비활성화 
					} else {
						chk_radio_obj = {};
						that.root.pt.find(".algorithm_result").removeAttr("disabled");
						checkpoint_view.removeClass("active");
						checkpoint_view.html("");
						// 초기화시 RETINAT 기본값 적용 
						let options = $(".algorithm_result").children("option");
						let selected_option_id;
						for(var i=1; i < options.length; i++){
						    if(options[i].label == "RETINANET"){
						    	options[i].selected = true;
						    	selected_option_id = options[i].attributes["data-id"].value
						    }
						}
						that.getAlgorithmById(selected_option_id, "0", null);				// RETINANET algorithm_id
					}
					
				});	
			},
			
			inferenceCheckPointListener() {
				const that = this;
				 
				let chk_radio_obj;
				let row_click = that.root.pt.find(".inference_checkpoint .list_wrap .checkpoint_table tbody tr")
				row_click.off("click").on("click",function() {
					let tr = $(this);
					let btn = tr.children().children(".radioBtn");
					let chkpoint_name = tr.children(".checkPoint_name").val();
					let checkpoint_view = that.root.pt.find(".checkpoint_view");
					btn.toggleClass("selected");
					if(btn.hasClass("selected")){
						chk_radio_obj = {};
						that.root.pt.find(".inference_checkpoint .list_wrap .checkpoint_table tbody tr .radioBtn").removeClass("selected");
						btn.addClass("selected");
						chk_radio_obj[chkpoint_name] = chkpoint_name;
						
// 						let selected_cp_name = that.root.pt.find(".inference_checkpoint .radioBtn.selected").parent().next().text();
// 						console.log("chkpoint_name: ", selected_cp_name);
// 						checkpoint_view.addClass("active");
// 						checkpoint_view.html("Selected Checkpoint :" + selected_cp_name);
					} else {
						chk_radio_obj = {};
						checkpoint_view.removeClass("active");
						checkpoint_view.html("");
					}
					
				});	
			},			
			
			// quick training 에서 checkpoint 선택 시 해당 task에 적용된 알고리즘 반영
			getSelectedTaskById(id){
				const that = this;
				const deffered = $.ajax({
					url : baseUrl + "/task/getTaskById.json",
					data : {id : id},
					type : "POST",
					success(res){
						console.log("=======getTaskById=======", res);
						if(res.result.code == "200"){
							that.selectCheckpointAlgorithm(res.result.data.algorithm_id);
							that.getAlgorithmById(res.result.data.algorithm_id, "0", null);
						} else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}								
					},
					error(err) {
						console.log("ERROR!!", err);
					}
				});
				return deffered;					
				
			},			
			
			selectCheckpointAlgorithm(algorithm_id){
				const that = this;
				
				console.log("algorithm_id???? ", algorithm_id);
				let options = $(".algorithm_result").children("option");
				for(var i=1; i < options.length; i++){
				    if(options[i].attributes["data-id"].value == algorithm_id){
				    	options[i].selected = true;
				    }
				}
			},
			

			
			taskListener : function() {
				const that = this;
				 
				let chk_radio_obj_inf;
				let row_click_inf = that.root.pt.find("#quick_inference .list_wrap .table_body .task_table tbody tr")
				row_click_inf.off("click").on("click",function() {
					let tr = $(this);
					let btn = tr.children().children(".radioBtn");
					let task_name = tr.children(".task_name").val();
					let task_id = tr.children(".task_name")[0].attributes["data-id"].value;
					btn.toggleClass("selected");
					if(btn.hasClass("selected")){
						chk_radio_obj_inf = {};
						that.root.pt.find("#quick_inference .list_wrap .table_body .task_table tbody tr .radioBtn").removeClass("selected");
						btn.addClass("selected");
						chk_radio_obj_inf[task_name] = task_name;
					} else {
						chk_radio_obj_inf = {};
						that.root.pt.find(".inference_checkpoint .list_wrap .checkpoint_table tbody").html("");
						that.root.pt.find(".inference_config").removeClass("active");
						$(".inference_config_btn")[0].textContent = "+";
					}
					that.root.pt.find(".inference_checkpoint .list_wrap .checkpoint_table tbody").html("");
					that.getTaskById(task_id);
					that.root.pt.find("#inference_config .description_wrap").addClass("border");	
				});	
				
				let chk_radio_obj_train;
				let row_click_train = that.root.pt.find("#quick_training .list_wrap .table_body .task_table tbody tr")
				row_click_train.off("click").on("click",function() {
					let tr = $(this);
					let btn = tr.children().children(".radioBtn");
					let task_name = tr.children(".task_name").val();
					let task_id = tr.children(".task_name")[0].attributes["data-id"].value;
					btn.toggleClass("selected");
					if(btn.hasClass("selected")){
						chk_radio_obj_train = {};
						that.root.pt.find("#quick_training .list_wrap .table_body .task_table tbody tr .radioBtn").removeClass("selected");
						btn.addClass("selected");
						chk_radio_obj_train[task_name] = task_name;
					} else {
						chk_radio_obj_train = {};
					}
					that.getTaskById(task_id);
					that.root.pt.find("#training_config .description_wrap").addClass("border");	
				});					
			},
			
			getProjectData(){
				const that = this;
				
				let title = that.root.pt.find(".add_project input[name='title']").val();
				let contents = that.root.pt.find(".add_project textarea[name='contents']").val();

				if(title == ""){
				 	alert("제목을 입력해주세요");
				 	that.pt.find("input[name='title']").focus();
				 	return;
				}
				
				if(contents == ""){
				 	alert("내용을 입력해주세요");
				 	that.pt.find("textarea[name='contents']").focus();
				 	return;
				} 
				

				$("#loader").show();
				console.log("title, contents : ", title, contents);
				that.insertProject(title, contents);				
			},
			
			insertProject(t, c){
				const that = this;
				
				let ajaxData = {
						title : t,
						contents : c
				}
				
				const deffered = $.ajax({
					url : baseUrl + "/project/insertProject.json",
					data : ajaxData,
					type : "POST",
					success(res){
						$("#loader").hide();
						console.log("=======insertProject=======", res);
						
						if(res.result.code == "200"){
//	 						that.drawTaskList(task_list_data, res.result.data);
							that.getTaskList(res.result.data,"0");
							that.root.pt.find(".quick_training .add_project").removeClass("active");
						} else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data);
						}								

					},
					error(err) {
						$("#loader").hide();
						console.log("ERROR!!", err);
					}
				});
				return deffered;						
			},
			
			createJsonQuickTrain(){
				const that = this;
				let annotation_title = that.root.pt.find("input[name='annotation_name']");
				let task_title = that.root.pt.find("input[name='task_name']");
				let task_contents = that.root.pt.find("input[name='task_contents']");
				let training_arr = {};
				let project_id = that.root.pt.find("select[name='project_result'] option:selected").attr("data-id");
 				let algorithm_id = that.root.pt.find("select[name='algorithm_result'] option:selected").attr("data-id");
 				let base_task_id = that.root.pt.find("select[name='task_result'] option:selected").attr("data-id");
 				let selected_checkpoint_name = null;
 				// config변수
 				let train_string = that.root.pt.find(".training_config .config_wrap").children(".light").children("input[type='text']");
 				let train_number = that.root.pt.find(".training_config .config_wrap").children(".light").children("input[type='number']");
 				let train_chk = that.root.pt.find(".training_config .config_wrap").children(".check").children(".check_box_wrap").children(".check_box").children(".first");
 				console.log("train_chk::", train_chk);
 				console.log("train_string::", train_string);
 				console.log("train_number::", train_number);
 	 			let train_arr = {};
 	 			
 				/* let selected_checkpoint_name = that.root.pt.find(".radioBtn.selected").parent().parent("tr").children(".checkPoint_name"); */
 			// 해당 알고리즘 입력, config에 삽입하는 데이터
 				for(var i=0; i < train_string.length; i++){
 					if(train_string[i].value != ""){
 						train_arr[train_string[i].name] = train_string[i].value;
 					} else {
 						alert("config에 값을 입력해주세요.");
 						train_string[i].focus();
 						return;
 					}
 				}; 
 				
 				for(var i=0; i < train_number.length; i++){
 					if(train_number[i].value != ""){
 						train_arr[train_number[i].name] = train_number[i].value * 1;
 						console.log("train_number[i].value * 1:::", train_number[i].value * 1);
 						console.log("typeof train_number[i].value * 1 :::", typeof(train_number[i].value * 1));
 					} else {
 						alert("config에 값을 입력해주세요.");
 						train_number[i].focus();
 						return;
 					}
 				};			
 				
 				for(let j=0; j < train_chk.length; j++){
 				    if(train_chk[j].classList.contains('selected') == true){
 				    	train_arr[train_chk[j].attributes.name.value] = true;
 				    } else {
 				    	train_arr[train_chk[j].attributes.name.value] = false;
 				    }
 				};
 				
 				let result_string = JSON.stringify(train_arr); 
 				console.log("result_string::"+result_string);
 				
				if(annotation_title.val() == null || annotation_title.val() == "") {
					alert("Annotation의 이름을 입력해주세요");
					return;
				}
				if(task_title.val() == null || task_title.val() == ""){
					alert("Task의 이름을 입력해주세요");
					return;
				}
				if(task_contents.val() == null || task_contents.val() == ""){
					alert("Task의 내용을 입력해주세요");
					return;
				}
 				if(project_id == null || project_id == "" || project_id == "undefined"){
 					alert("Task를 생성할 Project 폴더를 선택해주세요.");
 					return;
 				}
 				if(algorithm_id == null || algorithm_id == "" || algorithm_id == "undefined"){
 					alert("알고리즘을 선택해주세요.");
 					return;
 				}
 				if(base_task_id != undefined || base_task_id != null) {
 					console.log("1");
 					// inheritstance에 checkpoint 선택했는데 checkpoint 선택 안했으면 선택해라는 메시지띄우기
 					selected_checkpoint_name = that.root.pt.find(".checkpoint_list .radioBtn.selected").parent().parent("tr").children(".checkPoint_name").text();
 					if(selected_checkpoint_name == null || selected_checkpoint_name == "" || selected_checkpoint_name == undefined) {
 						alert("CheckPoint를 선택해주세요.");
 						return ;
 					}
 				} else if(base_task_id == null || base_task_id == undefined || base_task_id == "") {
 				// inheritstance가 undefined면 ajaxData null로 전달
 				console.log("2");
 					base_task_id = null;
 					selected_checkpoint_name = null;
 				}
				
				training_arr["annotation_title"] = annotation_title.val();
				training_arr["task_title"] = task_title.val();
				training_arr["task_contents"] = task_contents.val();
				training_arr["dataset_id"] = dataset_id;
 				training_arr["project_id"] = project_id;
 				training_arr["algorithm_id"] = algorithm_id;
 				training_arr["config"] = result_string;
 				training_arr["base_task_id"] = base_task_id;
 				training_arr["selected_checkpoint_name"] = selected_checkpoint_name;
				
				quick_training_data = JSON.stringify(training_arr);
				console.log("quick_training_data : ", quick_training_data);
// 				that.root.pt.find("#quick_training").removeClass("active");		// training confirm 에서 확인 시 200일 때 닫기 
// 				annotation_title.val("");										// training confirm 에서 확인 시 200일 때 초기화 
// 				task_title.val("");												// training confirm 에서 확인 시 200일 때 초기화
				that.ajaxQuickTrain(training_arr, quick_training_data);
			},
			
			createJsonQuickInference(){
				const that = this;
				
				let select_task_btn = that.root.pt.find("#quick_inference .radioBtn");
				let selected_task = that.root.pt.find("#quick_inference .radioBtn.selected").parent().parent("tr").children(".task_name");
				let csv_title = that.root.pt.find("input[name='csv_title']").val();
				let check_box = that.root.pt.find("#quick_inference .checkBox");
			    let inf_string = that.root.pt.find("#quick_inference .config_wrap").children(".light").children("input[type='text']");
			    let inf_number = that.root.pt.find("#quick_inference .config_wrap").children(".light").children("input[type='number']");
			    let inf_chk = that.root.pt.find("#quick_inference .config_wrap").children(".check").children(".check_box_wrap").children(".check_box").children(".first");
			        console.log("inf_chk::", inf_chk);
			        console.log("inf_string::", inf_string);
			        console.log("inf_number::", inf_number);
			    let config_arr = {};
			    let result = [];
			    let selected_checkpoint_name = null;
			    
			    // 해당 inference parameters 입력
			    for(let i=0; i < inf_string.length; i++){
			        if(inf_string[i].value != ""){
			            config_arr[inf_string[i].name] = inf_string[i].value;
			        } else {
			            alert("값을 입력해주세요");
			            inf_string[i].focus();
			            return;
			        }
			    };
			    
			    for(let i=0; i < inf_number.length; i++){
			        if(inf_number[i].value != ""){
			            config_arr[inf_number[i].name] = inf_number[i].value * 1;
			            console.log("inf_number[i].value * 1:::", inf_number[i].value * 1);
			            console.log("typeof inf_number[i].value * 1 :::", typeof(inf_number[i].value * 1));
			        } else {
			            alert("값을 입력해주세요");
			            inf_number[i].focus();
			            return;
			        }
			    };			
			    
			    for(let j=0; j < inf_chk.length; j++){
			        if(inf_chk[j].classList.contains('selected') == true){
			            config_arr[inf_chk[j].attributes.name.value] = true;
			        } else {
			            config_arr[inf_chk[j].attributes.name.value] = false;
			        }
			    };

			    
			    let config_string = JSON.stringify(config_arr);				////// quickInference 파라미터로 넘겨야할 값 
			    console.log("config_string;::::", config_string);				

				let inference_arr = {};
				if(select_task_btn.hasClass("selected")){
					selected_task_id = selected_task[0].attributes["data-id"].value;
					quick_project_id = selected_task[0].attributes["data-projectId"].value;
				} else {
					alert("Task를 선택해주세요");
					return;
				};
				
				if(csv_title == "" || csv_title == "undefined" || csv_title == null){
					alert("CSV output 파일명을 입력해주세요");
					return;
				}
				
				selected_checkpoint_name = that.root.pt.find(".inference_checkpoint .radioBtn.selected").parent().next().text();
				if(selected_checkpoint_name == null || selected_checkpoint_name == "" || selected_checkpoint_name == undefined) {
					alert("CheckPoint를 선택해주세요.");
					return ;
				}
				
				inference_arr["selected_task_id"] = selected_task_id;
				inference_arr["dataset_id"] = dataset_id;
				inference_arr["csv_title"] = csv_title;
				inference_arr["config"] = config_string;
				inference_arr["selected_checkpoint_name"] = selected_checkpoint_name;
				
				quick_inference_data = JSON.stringify(inference_arr);
				console.log("selected_task_id: ", selected_task_id);
				console.log("current dataset_id : ", dataset_id);
				console.log("quick_project_id dataset_id : ", quick_project_id);
				console.log("quick_inference_data : ", quick_inference_data);
				that.ajaxQuickInference(inference_arr, quick_project_id, quick_inference_data);
			},
			
			ajaxQuickTrain(arr, data){
				const that = this;
				//let ajaxData = data;
				let annotation_title = that.root.pt.find("input[name='annotation_name']");
				let task_title = that.root.pt.find("input[name='task_name']");
				let ajaxData = {
 						annotation_title : arr.annotation_title,
 						task_title : arr.task_title,
 						contents : arr.task_contents,
 						dataset_id : dataset_id * 1,
						project_id : arr.project_id,
 						algorithm_id : arr.algorithm_id,
 						config : arr.config,
 						base_task_id : arr.base_task_id,
 						check_point_name : arr.selected_checkpoint_name
 				};

				console.log("ajaxData for Q-training:: ", ajaxData, arr);
				let msg = "Annotation : "+arr.annotation_title+"\n"+"Trainer : "+arr.task_title+"\n\n"+"입력하신 정보로 training을 시작합니다. 계속하시겠습니까?";
				if(confirm(msg)){
					// ajax 호출 
					$("#loader").show();
					const deffered = $.ajax({
						url : baseUrl + "task/quickTraining.json",
						data : ajaxData,
						type : "POST",
						success(res){
							$("#loader").hide();
							if(res.result.code == "200"){
								console.log("=======QuickTrainer=======", res);
								alert(res.result.data);
								that.root.pt.find("#quick_training").removeClass("active");
							} else if (res.result.code == "2001") {
								alert(res.result.data);
								location.href = baseUrl + 'login';
							} else {
								alert(res.result.data);
							}									
						},
						error(err) {
							$("#loader").hide();
							console.log("ERROR!!", err);
						}
					});
					return deffered;						
				} else {
					alert("취소되었습니다.");
				}
			
			},
			
			ajaxQuickInference(arr, quick_project_id, data){
				const that = this;
				let ajaxData = {
					task_id : arr.selected_task_id,
					dataset_id : arr.dataset_id,
					csv_title : arr.csv_title,
					config : arr.config,
					check_point_name : arr.selected_checkpoint_name
				};
				console.log("ajaxData for Q-inference:: ", ajaxData);				
				let msg = "선택하신 task 데이터로 inference를 시작합니다. 계속하시겠습니까?";
				
				if(confirm(msg)){
					// ajax 호출				
					$("#loader").show();
					const deffered = $.ajax({
						url : baseUrl + "task/quickInference.json",
						data : ajaxData,
						type : "POST",
						success(res){
							$("#loader").hide();
							console.log("=======QuickInference=======", res);
							if(res.result.code == 200) {
								alert(res.result.data);
								that.root.pt.find("#quick_inference").removeClass("active");
								// 세션에 task_id, project_id 저장 후 inference list 확인을 위해 trainer 페이지로 이동 
								if(window.sessionStorage){
									sessionStorage.setItem("selected_task_id", arr.selected_task_id);
									sessionStorage.setItem("selected_pId", quick_project_id);
									let position = sessionStorage.getItem("selected_task_id");
									let position2 = sessionStorage.getItem("selected_pId");
									console.log("position: ", position, position2);
								}
								that.root.computed.initEnrichment();
							} else if (res.result.code == "2001"){
								alert(res.result.data);
								location.href = baseUrl + 'login';
							} else if (res.result.code == 3404) {
								alert("이미 중복된 이름의 CSV 파일이 존재합니다.\n다른 CSV파일명으로 Inference해주시길 바랍니다.");
							}
							else {
								alert(res.result.data);
							}
						},
						error(err) {
							$("#loader").hide();
							console.log("ERROR!!", err);
						}
					});
					return deffered;						
				} else {
					alert("취소되었습니다.");
				}

				

			},
			
		},

		reset(current_cursor){
			const that = this;
			
			that.data.imgList = [];
    		that.data.assetList = [];
			that.data.imgMap = {};
			
			if(typeof(current_cursor) == "undefined"){
				that.data.gInfo = {current_cursor:0};
    		} else {
				that.data.gInfo = {current_cursor:current_cursor};
    		}
			that.data.gArr = [];
			that.data.gObj = null;
			
			$("#frame-container").find(".canvas-container").remove();
			$("#frame-container").find("canvas").remove();
    		$("#frame-container").append("<canvas id='c' width='800px' height='600px' />");
    		$(".label-container").empty();
			that.data.canvas = window._canvas = new fabric.Canvas('c', {
				perPixelTargetFind : true,
			});

			//충돌검사 reset
    		$(".percent").html("none")
    		$(".range input[type='range']").val(100);
    		$(".label-layer .collision span").html("none"); 
    		
    		$(".aPercent").html("100%");
    		$("input[name='aRange']").val(100);
    		$(".bPercent").html("100%");
    		$("input[name='bRange']").val(100);
    		$(".all_collision input[type='radio']#and").prop("checked", true);
    		
    		
    		$(".poly_btn").removeClass("action");
    		$(".labelCopy_btn").removeClass("action");
    		$(".labelPaste_btn").addClass('disable');
    		that.data.cObj = {};
    		
    		that.data.isCollision = false;
    		
    		
			// jh.sa 화면 초기화
			// 태그 영역 레이어 이름 초기화
			$("#enrichment section.label .tag-wrap .info.ar .layer_name").html("");
			// 태그 영역 태그 개수 초기화
			$("#enrichment section.label .tag-wrap .info.ar .num").html("");
			// 태그 영역 태그 리스트 초기화
			$("#enrichment section.label .tag-wrap .content").html("");
			// 레이어 영역 레이어 초기화
			$("#enrichment section.label .frame-wrap").html("");	
			// 이미지 데이터 리스트 초기화
			$("#enrichment section.enrichment .imgList-wrap .imgList ul").html("");
			// 이미지 데이터 캔버스 개수 초기화
			$("#enrichment .title-wrap .canvas-wrap").html("<span>Enrichment</span> <span>|</span> Canvas");
			
    		//canvas Size
//     		that.setCanvasSize();
		},
// 		setCanvasSize() {
// 			const that = this;
// 			let w = that.pt.find("section.enrichment #frame-container").width() - 180;
// 			let h = w*19/28;
			
// 			const th =  that.data.titleHeight;
// 			const fph = that.data.framePaddingHeight;
// 			const ih = that.data.imgListHeight;
// 			const max_height = that.pt.find("section.enrichment").height()-(th+fph+ih);
// 			if(h > max_height){
// 				h = max_height;
// 				w = h*28/19;
// 			}
			
// 			that.data.canvWidth = w;
// 			that.data.canvHeight = h;
// 		},
		
		guid() {
			function s4() {
  				return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
  			}
  			return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
		}
	}
	




	//////////// instance ///////////////
	function Canvas(parent){
		let isPoly;
		if(isBoxData === false && isPolyData === true){
			isPoly = true;		
		} else if (isBoxData === true && isPolyData === false){
			isPoly = false;
		};		
		
		Canvas.prototype.parent = null;
		Canvas.prototype.data = {
			gObj: null,
			canvas: null,
			isPoly: isPoly,
			points: [],
		}
		Canvas.prototype.init = (parent) => {
			const that = this;
			that.parent = parent;
		}
		Canvas.prototype.setCanvas = (canvas) => {
			const that = this;
			that.data.canvas = canvas;
		}
		// draw canvas
		Canvas.prototype.onload = (gObj) => {
			const that = this;
			that.data.gObj = gObj;
			that.render.drawInit();
		}
		Canvas.prototype.bind = {
			chkClick : false,
			evtInit: () => {
				const that = this;
				that.data.canvas.off();
				that.bind.downEvt();
				that.bind.moveEvt();
				that.bind.upEvt();
				that.bind.wheelEvt();
				that.bind.polyEvt();
				that.bind.copyEvt();

				that.bind.objMoving();
				that.bind.objScaling();
				that.bind.objModified();
			},
			copyEvt : () => {
				const that = this;
				$(".labelCopy_btn").off('click').on('click', function(){
					if($(this).hasClass("action")){
						$(this).removeClass("action");
						$(".labelPaste_btn").addClass('disable');
						that.parent.data.cObj = {};
					} else {
						$(this).addClass("action");
						$(".labelPaste_btn").removeClass('disable');
						
						const gObj = that.parent.data.gObj;
						layers = Object.keys(gObj.layer);
						
						for(layer of layers){
							const labelMap = JSON.parse( JSON.stringify(gObj.layer[layer].labelMap) )
							that.parent.data.cObj = {...that.parent.data.cObj, ...labelMap};
						}
						
					}
				});
				$(".labelPaste_btn").off('click').on('click', function(){
					const cObj = that.parent.data.cObj;
					const gObj = that.parent.data.gObj;
					layer = $(".label-layer .selector.selected").parent().parent().attr("id");
					gObj.layer[layer].labelMap = {...gObj.layer[layer].labelMap, ...cObj};
					that.render.addLabel();
					that.parent.computed.drawPanel();
				});
			},
			polyEvt : () => {
				const that = this;
				$(".poly_btn").off("click").on("click", function(){
					if($(this).hasClass("action")){
						$(this).removeClass("action");
						that.data.isPoly = false;
						const gObj = that.data.gObj;
						const layerId = $(".label-layer .selector.selected").parent().parent().attr("id");
						const uuid = that.data.polyId;
						//undo, redo
						const tObj = {};
						tObj["layerId"] = layerId;
						tObj["labelId"] = uuid;
						tObj["labelValue"] = gObj.layer[layerId].labelMap[uuid];
						tObj["before"] = null;
						hObj.label.list.length = 0;
						hObj.label.list[0] = tObj;
						hObj.label.action = "create";
						hObj.stack.length = hObj.cursor;
						hObj.stack[hObj.cursor++] = JSON.parse( JSON.stringify( hObj.label ) );
						//
					} else {
						$(this).addClass("action");
						that.data.isPoly = true;
						that.data.polyId = that.parent.guid();
					}
				});
				// shift = start, alt = end  변경
				if(isPolyData === true){
					$(document).keydown(function(evt) {
						if(evt.keyCode == 16) {
							that.data.isPoly = true;
							that.data.polyId = that.parent.guid();						
						} else if (evt.keyCode == 18 && Object.keys(enrichment.data.enrichCanvas.data.gObj.layer).length > 0) {
							that.data.isPoly = false;
							const gObj = that.data.gObj;
							const layerId = $(".label-layer .selector.selected").parent().parent().attr("id");
							const uuid = that.data.polyId;
							//undo, redo
							const tObj = {};
							tObj["layerId"] = layerId;
							tObj["labelId"] = uuid;
							tObj["labelValue"] = gObj.layer[layerId].labelMap[uuid];
							tObj["before"] = null;
							hObj.label.list.length = 0;
							hObj.label.list[0] = tObj;
// 							hObj.label.action = "create";
							hObj.label.action = "update";
							hObj.stack.length = hObj.cursor;
							hObj.stack[hObj.cursor++] = JSON.parse( JSON.stringify( hObj.label ) );							
						}
					})					
				}

			},
			downEvt : () => {
				const that = this;
				const canvas = that.data.canvas;
				canvas.on("mouse:down", function(evt){
					console.log("mouse:down", evt);
					const evte = evt.e;
					
					//wheel break;
					that.bind.chkClick = true;

					// 선택영역 클릭 시 라벨 추가 막기
					const tempRect = that.data.gObj.tempRect;
					tempRect.beforeX=null;
					tempRect.beforeY=null;
					

					//canvas shortcut
					// jh.sa: ctrl, cmd, shift 키 누를때 이동&크기조절 제한 
					if (evte.altKey === true || evte.ctrlKey === true || evte.metaKey === true || evte.shiftKey === true) {		
						if(canvas.getActiveObject()){
							canvas.getActiveObject().lockMovementX = true;
							canvas.getActiveObject().lockMovementY = true;
							canvas.getActiveObject().lockScalingX = true;
							canvas.getActiveObject().lockScalingY = true;
							// jh.sa : shift키 누르면서 좌우로 크기 조절하면 평행사변형이 되던 문제 수정
							canvas.getActiveObject().lockSkewingX = true;
							canvas.getActiveObject().lockSkewingY = true;							
						}
					
						//movement
						this.isDragging = true;
						this.selection = false;
						return;
					}

					
					if(this.selection != true){return;}

					if(evt.target != null){
						that.data.canvas.discardActiveObject();
						that.data.canvas.setActiveObject(evt.target);
						const selectedObj = that.data.canvas.getActiveObject();
						if(selectedObj.type && selectedObj.type == "point"){
							//polygon point 클릭시 polygon선택
							$(".label-container").find(".label-wrap").removeClass("on");
							$(".label-container").find("#div_"+evt.target.parent_obj_id).addClass("on");
						} else if (evte.ctrlKey === true || evte.metaKey === true){
							//다중선택
							$(".label-container").find("#div_"+evt.target.id).addClass("on");
							that.parent.computed.multiSelection();
						} else if(evte.shiftKey == true && that.data.isPoly == true ) {
							//point 외 선택불가
							if(evt.target.type != "point"){
								that.data.canvas.discardActiveObject();
							}
						} else {
							$(".label-container").find(".label-wrap").removeClass("on");
							$(".label-container").find("#div_"+evt.target.id).addClass("on");
						}
						
						return;
					}else{
						$(".label-container").find(".label-wrap").removeClass("on");
						if(evte.shiftKey == true && that.data.isPoly == true ) {
							that.data.canvas.discardActiveObject();
							return;							
						}
					}
					
					//draw polygon
					if(that.data.isPoly){
						const point = {x:evt.absolutePointer.x,y:evt.absolutePointer.y};
						console.log("포인트 point:: ", point);
						that.computed.procPolygon(point);
						return;
					}

					tempRect.beforeX = (evte.layerX - this.viewportTransform[4]) / this.viewportTransform[0];
					tempRect.beforeY = (evte.layerY - this.viewportTransform[5]) / this.viewportTransform[0];
					if(tempRect.beforeX >= canvas.getWidth()){
						tempRect.beforeX = canvas.getWidth()
					} else if ( tempRect.beforeX <= 0) {
						tempRect.beforeX = 0;
					}
					if(tempRect.beforeY >= canvas.getHeight()){
						tempRect.beforeY = canvas.getHeight();
					} else if ( tempRect.beforeY <= 0) {
						tempRect.beforeY = 0;
					}
				});
			},
			moveEvt : () => {
				const that = this;
				const canvas = that.data.canvas;
				canvas.on("mouse:move",function(evt){
					if (this.isDragging) {
						const zoom = canvas.getZoom();
						
						if (this.viewportTransform[4] + evt.e.movementX >= 0) {
							return;
						} else if (this.viewportTransform[4] + evt.e.movementX < canvas.getWidth() - canvas.getWidth() * zoom) {
							return;
						} 
						if (this.viewportTransform[5] + evt.e.movementY >= 0) {
							return;
						} else if (this.viewportTransform[5] + evt.e.movementY < canvas.getHeight() - canvas.getHeight() * zoom) {
							return;
						}	
						const delta = new fabric.Point(evt.e.movementX, evt.e.movementY);
						canvas.relativePan(delta);
					}
				});
			},
			upEvt : () => {
				const that = this;
				const canvas = that.data.canvas;
				const gObj = that.data.gObj;
				canvas.on("mouse:up",function(evt){
					//wheel break;
					that.bind.chkClick = false;
					
					//canvas movement
					if (this.isDragging) {
						if(canvas.getActiveObject()){
							canvas.getActiveObject().lockMovementX = false;
							canvas.getActiveObject().lockMovementY = false;
							canvas.getActiveObject().lockScalingX = false;
							canvas.getActiveObject().lockScalingY = false;
						}
						
						this.isDragging = false;
						this.selection = true;
						return;
					}
					//

					if(that.data.isPoly){
						return;
					}
					
					//ctrlKey 누르고 영역선택시 영역내 label 다중선택
					if(evt.e.metaKey == true || evt.e.ctrlKey == true){
						const activeObjects = canvas.getActiveObjects();
						if(activeObjects.length>0){
							for(let i=0; i<activeObjects.length; i++){
								$(".label-container").find("#div_"+activeObjects[i].id).addClass("on");
							}
						}
						that.parent.computed.multiSelection();
						
						return;
					}
					
					if(this.selection != true){return;}
					// jh.sa : polygon 만 사용할 시 여기서부터 분기처리 
					if(isBoxData == true && isPolyData == false){
						const tempRect = gObj.tempRect;
						const newRect = gObj.newRect;
						const img = gObj.img;
						const imgInfo = gObj.imgInfo;
						
						tempRect.afterX = (evt.e.layerX - this.viewportTransform[4]) / this.viewportTransform[0];
						tempRect.afterY = (evt.e.layerY - this.viewportTransform[5]) / this.viewportTransform[0];

						// canvas 영역 밖 선택
//	 					if(evt.e.target != $("#frame-container").find(".upper-canvas")[0]){
//	 						return false;
//	 					}
						if(evt.e.target != $("#frame-container").find(".upper-canvas")[0]){
							let zoom = canvas.getZoom();
							if (zoom >= 1){
								return false;
							} else if (zoom == 0.8) {
								console.log("evt.e:: ", evt.e);
								console.log("tempRect.afterX:: ", tempRect.afterX);
								console.log("tempRect.afterY:: ", tempRect.afterY);
								tempRect.afterX = (evt.e.layerX - this.viewportTransform[4]) / this.viewportTransform[0];
								tempRect.afterY = (evt.e.layerY - this.viewportTransform[5]) / this.viewportTransform[0];
								console.log("evt.e:: ", evt.e);
								console.log("tempRect.afterX:: ", tempRect.afterX);
								console.log("tempRect.afterY:: ", tempRect.afterY);	
							}
						}					
						
						if(tempRect.afterX >= canvas.getWidth()){
							tempRect.afterX = canvas.getWidth()
						} else if ( tempRect.afterX <= 0) {
							tempRect.afterX = 0;
						}
						if(tempRect.afterY >= canvas.getHeight()){
							tempRect.afterY = canvas.getHeight();
						} else if ( tempRect.afterY <= 0) {
							tempRect.afterY = 0;
						}
						//

						// 선택영역 클릭 시 라벨 추가 막기
						if(tempRect.beforeX==null && tempRect.beforeY ==null){return;}
						//

						const w = tempRect.afterX - tempRect.beforeX;
						const h = tempRect.afterY - tempRect.beforeY;
						
						if(w == 0 || h == 0){ return ;}
						
						// layer선택 여부 체크
						layerId = $(".label-layer .selector.selected").parent().parent().attr("id");
						if(typeof(layerId)=="undefined"){
							alert("레이어를 선택해주세요");
							return false;
						}
						

						if( w < 0 ){
							newRect.width = w*(-1);
							newRect.left = tempRect.afterX;
						}else{
							newRect.width = w;
							newRect.left = tempRect.beforeX;
						}
						if( h < 0 ){
							newRect.height = h*(-1);
							newRect.top = tempRect.afterY;
						}
						else{
							newRect.height = h;
							newRect.top = tempRect.beforeY;
						}
						
						var rect = new fabric.Rect(newRect);
						canvas.add(rect);

						//panel draw 추가
						const enrichPanel = that.parent.data.enrichPanel;

						const canv = document.createElement('canvas');
						const uuid = that.parent.guid();
						canv.id = newRect.id = rect.id = uuid;
						
						enrichPanel.render.addLabel(canv, layerId, newRect);
						gObj.layer[layerId].labelMap[uuid] = JSON.parse( JSON.stringify(gObj.newRect) );
						
						//undo, redo
						const tObj = {};
						tObj["layerId"] = layerId;
						tObj["labelId"] = uuid;
						tObj["labelValue"] = gObj.layer[layerId].labelMap[uuid];
						tObj["before"] = null;
						hObj.label.list.length = 0;
						hObj.label.list[0] = tObj;
						hObj.label.action = "create";
						hObj.stack.length = hObj.cursor;
						hObj.stack[hObj.cursor++] = JSON.parse( JSON.stringify( hObj.label ) );
						//
						
						console.log("create rect");
						canvas.discardActiveObject();
						
						if($(".label .layer-wrap#"+layerId+" .switch").hasClass("close")){
							$(".label #"+layerId+" .label-layer .switch").trigger("click");
						}
						
					}

				});
			},
			wheelEvt : () => {
				const that = this;
				const canvas = that.data.canvas;
				canvas.on("mouse:wheel",function(evt){
					console.log("mouse:wheel", evt);
					//클릭 이벤트가 없을경우만 실행
					if(!that.bind.chkClick){
						const delta = evt.e.deltaY;
						const pointer = canvas.getPointer(evt.e);
						let zoom = canvas.getZoom();
						zoom = zoom + delta/200;
						
						// jh.sa : zoom 확대 시에 polygon point 크기가 커지던 문제 수정
						let allPoints = canvas.getObjects("point");
						$.each(allPoints, function(i, obj){
							if (zoom > 10) zoom = 10;
							if (zoom < 0.8) zoom = 0.8;							
							obj.set({
								scaleX: 1/zoom,
								scaleY: 1/zoom
							});
						});								
						
						//최대크기 : 10(10이상시 크기변화가 크지않음), 최소크기 : 0.8
						if (zoom > 10) zoom = 10;
						if (zoom < 0.8) zoom = 0.8;
						canvas.zoomToPoint({ x: evt.e.offsetX, y: evt.e.offsetY }, zoom);
						evt.e.preventDefault();
						evt.e.stopPropagation();
						
						//줌이 1보다 작을때 컨버스를 중앙에
						if (zoom < 1) {
							this.viewportTransform[4] = (this.getWidth() - this.getWidth() * zoom) / 2;
							this.viewportTransform[5] = (this.getHeight() - this.getHeight() * zoom) / 2;
						} else {
							if (this.viewportTransform[4] >= 0) {
								this.viewportTransform[4] = 0;
							} else if (this.viewportTransform[4] < canvas.getWidth() - canvas.getWidth() * zoom) {
								this.viewportTransform[4] = canvas.getWidth() - canvas.getWidth() * zoom;
							}
							if (this.viewportTransform[5] >= 0) {
								this.viewportTransform[5] = 0;
							} else if (this.viewportTransform[5] < canvas.getHeight() - canvas.getHeight() * zoom) {
								this.viewportTransform[5] = canvas.getHeight() - canvas.getHeight() * zoom;
							}
						}
						
						this.renderAll();
					}
				});
			},

			objMoving : () => {
				const that = this;
				const canvas = that.data.canvas;
				canvas.on("object:moving",function(evt){
// 					console.log("object:moving", evt);
					if(canvas.getActiveObject()==null){
						return;
					}
					
					let canv;
					const panel = that.parent.data.enrichPanel;
					// polygon
					if(canvas.getActiveObject().type == "point"){
						const p = evt.target;
						//객체 선택
						let target = null;
						
						const gObj = that.data.gObj;
						const keys = Object.keys(gObj.layer);
						for(let i=0, len = keys.length; i<len; i++){
							if(gObj.layer[keys[i]].labelMap[p.parent_obj_id]){
								target = JSON.parse( JSON.stringify(gObj.layer[keys[i]].labelMap[p.parent_obj_id]));
								break;								
							}
						}
						const w = canvas.width;
						const h = canvas.height;
						const tPoint = canvas.getActiveObject();
						const img = that.data.gObj.img;
						const imgInfo = that.data.gObj.imgInfo;
						
						tPoint.left = evt.target.left;
						tPoint.top = evt.target.top;
						
						// jh.sa : point 이동 canvas 내에서만 할 수 있도록 수정 
						if (tPoint.left > canvas.getWidth()){
							tPoint.left = canvas.getWidth();
						}
						
						if (tPoint.top > canvas.getHeight()){
							tPoint.top = canvas.getHeight();
						}
						
						if(tPoint.width > canvas.getWidth()){
							tPoint.width = canvas.getWidth();
						}
						
						if(tPoint.height > canvas.getHeight()){
							tPoint.height = canvas.getHeight();
						}
						if(tPoint.left < 0){
							tPoint.left = 0;
						}
						if(tPoint.top < 0){
							tPoint.top = 0;
						}
						
						evt.target.left = tPoint.left;
						evt.target.top = tPoint.top;
						
						
// 						canvas.getObjects().forEach(function(o) {
// 			    	        if(typeof o.id != "undefined" && o.id === p.parent_obj_id) {
// 			    	            target = o;
// 			    	        }
// 			    		});
			    		if(target != null){
			    			//객체 위치 업데이트
							target.points[p.name] = {x: p.getCenterPoint().x, y: p.getCenterPoint().y};
			    			
							const polygon = that.render.upsertPolygon(target.id, target.points);
			    			that.computed.resetPolyPosition(polygon, target);
			    		}
			    		
			    		canv = document.getElementById(evt.target.parent_obj_id);
			    		panel.render.drawLabelImage(canv, target);
			    		
			    		that.data.modifiedRect = target;
						return;
					}
					// rect
					const uuid = evt.target.id;
					const gObj = that.data.gObj;

					const keys = Object.keys(gObj.layer);
					let i;
					for(i=0; i<keys.length; i++){
						if(typeof(gObj.layer[keys[i]].labelMap[uuid])!="undefined"){
							break;
						}
					}
					
					const tempRect = that.data.gObj.tempRect;
					const newRect = that.computed.setLabelById(uuid, keys[i]);
					const img = that.data.gObj.img;
					const imgInfo = that.data.gObj.imgInfo;
					
					newRect.width = evt.target.getScaledWidth();
					newRect.left = evt.target.left;
					newRect.height = evt.target.getScaledHeight();
					newRect.top = evt.target.top;
				
					// object 이동 canvas 내에서
					if (newRect.left+newRect.width > canvas.getWidth()){
						newRect.left = canvas.getWidth() - newRect.width;
					}
					
					if (newRect.top+newRect.height > canvas.getHeight()){
						newRect.top = canvas.getHeight() - newRect.height;
					}
					
					if(newRect.width > canvas.getWidth()){
						newRect.width = canvas.getWidth();
					}
					
					if(newRect.height > canvas.getHeight()){
						newRect.height = canvas.getHeight();
					}
					if(newRect.left < 0){
						newRect.left = 0;
					}
					if(newRect.top < 0){
						newRect.top = 0;
					}
					
					evt.target.left = newRect.left;
					evt.target.top = newRect.top;
					
					
					canv = document.getElementById(evt.target.id);
					//패널이미지
					panel.render.drawLabelImage(canv, newRect);
					
					that.data.modifiedRect = newRect;
				});
			},
			objScaling : () => {
				const that = this;
				const canvas = that.data.canvas;
				canvas.on("object:scaling",function(evt){
					console.log("object:scaling");
					const uuid = evt.target.id;
					const gObj = that.data.gObj;
					
					const keys = Object.keys(gObj.layer);
					let i;
					for(i=0; i<keys.length; i++){
						if(typeof(gObj.layer[keys[i]].labelMap[uuid])!="undefined"){
							break;
						}
					}
					
					const tempRect = gObj.tempRect;
					const newRect = that.computed.setLabelById(uuid, keys[i]);
					const img = gObj.img;
					const imgInfo = gObj.imgInfo;
					
					newRect.width = evt.target.getScaledWidth();
					newRect.left = evt.target.left;
					newRect.height = evt.target.getScaledHeight();
					newRect.top = evt.target.top;

					// object 크기조절 canvas 내에서
					// jh.sa 수정 
					if(newRect.left < 0){
						newRect.left = 0;
						evt.target.left = newRect.left;
						newRect.width = evt.target.aCoords.br.x - 2;
						evt.target.scaleX = newRect.width / evt.target.width;
					}


					if(newRect.top < 0){
						newRect.top = 0;
						evt.target.top = newRect.top;
						newRect.height = evt.target.aCoords.br.y - 1;
						evt.target.scaleY = newRect.height / evt.target.height;						
					}
					

					if (newRect.left+newRect.width > canvas.getWidth()){
						newRect.width = canvas.getWidth() - newRect.left;
						evt.target.scaleX = newRect.width / evt.target.width;
					}
					
					if (newRect.top+newRect.height > canvas.getHeight()){
						newRect.height =  canvas.getHeight() - newRect.top;
						evt.target.scaleY = newRect.height / evt.target.height;
					}
					
					console.log("scale :: ", evt.target);
					const canv = document.getElementById(evt.target.id);
					const panel = that.parent.data.enrichPanel;
					panel.render.drawLabelImage(canv, newRect, img, imgInfo);
					
					that.data.modifiedRect = newRect;
				});
			},
			objModified : () => {
				const that = this;
				const canvas = that.data.canvas;
				canvas.on("object:modified",function(evt){
					console.log("object:modified");
					
					const gObj = that.data.gObj;
					let label;
					if(evt.target.type == "point"){
						label = $("#div_"+evt.target.parent_obj_id);
					} else {
						label = $(".label-container").find(".label-wrap.on");
					}
					const layerId = label.parents(".layer-wrap").attr("id");
					const labelId = label.attr("id").split("div_")[1];

					const labelObj = {};
					labelObj["layerId"] = layerId;
					labelObj["labelId"] = labelId;
					labelObj["before"] = JSON.parse( JSON.stringify( gObj.layer[layerId].labelMap[labelId] ) );
					gObj.layer[layerId].labelMap[labelId] = JSON.parse( JSON.stringify(that.data.modifiedRect) );
					labelObj["labelValue"] = gObj.layer[layerId].labelMap[labelId];
					
					//histoy stack
					hObj.label.list.length = 0;
					hObj.stack.length = hObj.cursor;
					hObj.label.action = "update";
					hObj.label.list.push(labelObj);
					hObj.stack[hObj.cursor++] = JSON.parse( JSON.stringify( hObj.label ) );
				});
			},
		}
		Canvas.prototype.computed = {
			procPolygon : (point) => {
				const that = this;
				const uuid = that.data.polyId;
				
				const layerId = $(".label-layer .selector.selected").parent().parent().attr("id");
				that.computed.mappingPoly(layerId, uuid, point);
				that.computed.drawPoly(layerId, uuid);

				const panel = that.parent.data.enrichPanel;
				panel.computed.procPolygon(layerId, uuid);
				
				if($(".label .layer-wrap#"+layerId+" .switch").hasClass("close")){
					$(".label .layer-wrap#"+layerId+" .switch").removeClass("close");
					$(".label .layer-wrap#"+layerId+" .switch").addClass("open");
					$(".label .layer-wrap#"+layerId+" .switch").parent().next().slideToggle("500");
				}
			},
			mappingPoly : (layerId, labelId, point) => {
				const that = this;
				const gObj = that.data.gObj;
				const newRect = { ...gObj.newRect };
				
				if(typeof(layerId)=="undefined"){
					alert("레이어를 선택해주세요");
					return false;
				}
				let labelMap = gObj.layer[layerId].labelMap[labelId];
				if(!labelMap){
					labelMap = newRect;
					labelMap.id = labelId;
					labelMap.points = [];
				}
				
				labelMap.points.push({
					x : point.x,
					y : point.y
				});
				gObj.layer[layerId].labelMap[labelId] = labelMap;
			},
			resetPolyPosition : (polygon, labelMap) => {
				const that = this;
				labelMap.left = polygon.aCoords.tl.x;
				labelMap.top = polygon.aCoords.tl.y;
				labelMap.width = polygon.aCoords.br.x - polygon.aCoords.tl.x;
				labelMap.height = polygon.aCoords.br.y - polygon.aCoords.tl.y;
			},
			drawPoly : (layerId, labelId) => {
				const that = this;
				const gObj = that.data.gObj;
				const labelMap = gObj.layer[layerId].labelMap[labelId];
				const points = labelMap.points;
				const index = points.length-1;
				
				that.render.createPoint(labelId, points[index], index);
				const polygon = that.render.upsertPolygon(labelId, points);
				that.computed.resetPolyPosition(polygon, labelMap);
				
				//undo, redo
				const tObj = {};
				tObj["layerId"] = layerId;
				tObj["labelId"] = labelId;
				tObj["labelValue"] = gObj.layer[layerId].labelMap[labelId];
				tObj["before"] = null;
				hObj.label.list.length = 0;
				hObj.label.list[0] = tObj;
				hObj.label.action = "create";
				hObj.stack.length = hObj.cursor;
				hObj.stack[hObj.cursor++] = JSON.parse( JSON.stringify( hObj.label ) );
				//
			},
			
			setLabelById : (uuid, key) => {
				const that = this;
				const gObj = that.data.gObj;
				return JSON.parse( JSON.stringify(gObj.layer[key].labelMap[uuid])); 
			},
		}
		Canvas.prototype.render = {
			drawInit: () => {
				this.render.drawImg();
			},
			drawImg: () => {
				const that = this;
				const canvas = that.data.canvas;
				const gObj = that.data.gObj;
				
				canvas.clear();
				$("#loader").show();
				gObj.img = new Image();
				gObj.img.src = "<c:url value='"+gObj.imgSrc+"' />";
				gObj.img.onload = function() {
					//$("#loader").hide();
// 					console.log("this",this);
// 					console.log("gObj", gObj.img);

					that.parent.computed.rescale(this);
					canvas.setBackgroundImage(gObj.img.src, canvas.renderAll.bind(canvas), {
						scaleX: gObj.imgInfo.scaleFactor,
						scaleY: gObj.imgInfo.scaleFactor
			    	});
					
					//
					that.parent.computed.getMetaList()
					//

				}
				gObj.img.onerror = function(){
					$("#loader").hide();
					alert("이미지 파일이 아닙니다.");
				}
				fabric.Object.prototype.set({
					transparentCorners: false,
					cornerColor: 'rgba(102,153,255,0.5)',
					cornerSize: 12,
					hasRotatingPoint: false,
					padding: 5
				});
				canvas.viewportTransform = [1,0,0,1,0,0];
				canvas.renderAll();
			},
			addLabel: () => {
				const that = this;
				const canvas = that.data.canvas;
				
				const layer = that.data.gObj.layer;
				const layerKeys = Object.keys(layer);
				for(let i=0, len=layerKeys.length; i<len;i++){
					const label = layer[layerKeys[i]].labelMap;
					const labelKeys = Object.keys(label);

					for(let j=0, len=labelKeys.length; j<len; j++){
						if(label[labelKeys[j]].points) {
							that.render.createPoints(label[labelKeys[j]].id, label[labelKeys[j]].points, label[labelKeys[j]].fill);		// jh.sa polygon fill 
						}else {
							const rect = new fabric.Rect(label[labelKeys[j]]);
							canvas.add(rect);
						}
					}

				}

				that.bind.evtInit();
			},

			createPoint : (uuid, point, index) => {
				const that = this;
				const canvas = that.data.canvas;
				
				const circle = new fabric.Circle({
					type : "point",
					radius: 3,
					fill: 'green',
					left: point.x,
					top: point.y,
					originX: 'center',
					originY: 'center',
					// hasBorders: false,
					objectCaching: false,
					hasControls: false,
					selectable: true,
					name: index,
					parent_obj_id : uuid
				});
				canvas.add(circle);
			},
			createPoints : (uuid, points, label_fill) => {
				const that = this;
				const canvas = that.data.canvas;

				for(let i=0; i<points.length; i++){
					const circle = new fabric.Circle({
						type : "point",
						radius: 3,
						fill: 'green',
						left: points[i].x,
						top: points[i].y,
						originX: 'center',
						originY: 'center',
						// hasBorders: false,
						objectCaching: false,
						hasControls: false,
						selectable: true,
						name: i,
						parent_obj_id : uuid,
						ignoreZoom : true
					});
					canvas.add(circle);
				}
				that.render.upsertPolygon(uuid, points, label_fill);
			},
			upsertPolygon : (uuid, points, label_fill) => {
				const that = this;
				const canvas = that.data.canvas;
				
				canvas.getObjects().forEach(function(o) {
					if(typeof o.id != "undefined" && o.id === uuid) {
			            canvas.remove(o);
			        }
				});
				const clonedPoints = points.map(function(o){
				    return fabric.util.object.clone(o);
				});
				let fill = 'rgba(33,138,255,0.5)'
				if(label_fill){
// 					fill = label.fill;
					fill = label_fill;
				}
				const polygon = new fabric.Polygon(clonedPoints, {
				    fill: fill,
				    selectable: false,
				    hasControls: false,
				    objectCaching: false,
				    // hasBorders: false,
					lockMovementX: true,
					lockMovementY: true,
				    id:uuid
				});
				canvas.add(polygon);
				return polygon;
			},
		}
		Canvas.prototype.init(parent);
	}

	function ImgList(parent, swiper){
		ImgList.prototype.parent = null;
		ImgList.prototype.init = (parent, swiper) =>{
			const that = this;
			that.parent = parent;
			that.data.swiper = swiper;
			that.render.drawSwiper();
		}
		ImgList.prototype.data = {
			swiperInfo : {maxSize : 30, viewStartCursor : 0, viewEndCursor : 29, loadStartCursor:0,loadEndCursor:29,isUpdateSlide:false, threshold:15}, 
			chkMouseEvent : [false, false]
		}
		ImgList.prototype.bind = {
			click : () => {
				const that = this;
				$(".swiper-slide").off("click").on("click", function(e){
					$("#loader").show();
					var current_cursor =  this.id.split("slide_")[1];
					that.parent.data.gInfo.current_cursor = current_cursor;
					setTimeout(() => {
						that.parent.computed.initEnrichment();
					}, 0);
					that.data.swiper.slideTo(that.data.swiper.clickedIndex, 500);
					$(".position-value")[0].value = that.parent.data.gInfo.current_cursor;
					// that.computed.reset();
				});
			},
			slideChange : () => {
				const that = this;
				that.data.swiper.off("slideChange").on("slideChange",function(evt){
					if(that.data.swiperInfo.isUpdateSlide == true){return;}
					let direct;
					if(that.data.swiper.previousIndex > that.data.swiper.activeIndex){ //왼쪽 이동
						direct = "left";
					}else{ //오른쪽 이동
						direct = "right";
					}
					
					console.log("slideChange",that.data.swiper.previousIndex , that.data.swiper.activeIndex);
					that.computed.swiperSlideChange(direct);
					
					if(that.data.swiperInfo.viewStartCursor < 0){
						that.data.swiperInfo.viewStartCursor = that.data.swiperInfo.loadStartCursor;				// jh.sa 추가: 왼쪽으로 빠르게 드래그 시 viewStartCursor값이 0 이하의 음수값으로 떨어지면서 imgList의 index를 잡지 못해 lastIndexOf 에러 발생 
					}
					console.log("sc",that.data.swiperInfo.loadStartCursor,that.data.swiperInfo.loadEndCursor,that.data.swiperInfo.viewStartCursor,that.data.swiperInfo.viewEndCursor);
				});
			},
			transitionEnd : () => {
				const that = this;
				const imgList = that.parent.data.imgList;
				that.data.swiper.off("transitionEnd").on("transitionEnd",function(evt){
					if(that.data.swiperInfo.isUpdateSlide == true){return;}
					that.data.swiperInfo.isUpdateSlide = true;	
					
					//우측 스크롤 이미지 로딩
					for(let i = that.data.swiperInfo.loadEndCursor ; i < that.data.swiperInfo.viewEndCursor ; i++){
						that.data.swiperInfo.loadEndCursor++;
						//
						var imgSrcPath = imgList[that.data.swiperInfo.loadEndCursor];
						var lastIndex = imgSrcPath.lastIndexOf(".");
						var imgSrcPathResult = [imgSrcPath.slice(0, lastIndex), "_tb", imgSrcPath.slice(lastIndex)].join('');
						
						//
// 						const slides = "<li class='swiper-slide' id='slide_"+that.data.swiperInfo.loadEndCursor+"'><img src='<c:url value='"+imgList[that.data.swiperInfo.loadEndCursor]+"'/>'></li>";
						const slides = "<li class='swiper-slide' id='slide_"+that.data.swiperInfo.loadEndCursor+"'><img src='<c:url value='"+imgSrcPathResult+"'/>'></li>";
						that.data.swiper.appendSlide(slides);
						
					}
					//좌측 이미지 제거
					for(let i = that.data.swiperInfo.loadStartCursor ; i < that.data.swiperInfo.viewStartCursor ; i++){
						that.data.swiperInfo.loadStartCursor++;
						that.data.swiper.removeSlide(0);
						
					}
					
					//좌측 스크롤 이미지 로딩
					for(let i = that.data.swiperInfo.loadStartCursor ; i > that.data.swiperInfo.viewStartCursor ; i--){
						that.data.swiperInfo.loadStartCursor--;
						
						//
						var imgSrcPath = imgList[that.data.swiperInfo.loadStartCursor];
						var lastIndex = imgSrcPath.lastIndexOf(".");
						var imgSrcPathResult = [imgSrcPath.slice(0, lastIndex), "_tb", imgSrcPath.slice(lastIndex)].join('');
						//
						
						const slides = "<li class='swiper-slide' id='slide_"+that.data.swiperInfo.loadStartCursor+"'><img src='<c:url value='"+imgSrcPathResult+"'/>'></li>";
// 						const slides = "<li class='swiper-slide' id='slide_"+that.data.swiperInfo.loadStartCursor+"'><img src='<c:url value='"+imgList[that.data.swiperInfo.loadStartCursor]+"'/>'></li>";
						that.data.swiper.prependSlide(slides);
						
					}
					
					//우측 이미지 제거
					for(let i = that.data.swiperInfo.loadEndCursor ; i > that.data.swiperInfo.viewEndCursor ; i--){
						that.data.swiperInfo.loadEndCursor--;
						/* that.data.swiper.removeSlide(that.data.swiper.slides.length-1); */
						/* that.data.swiper.removeSlide(0); */
					}
					
					
					that.data.swiperInfo.isUpdateSlide = false;
					console.log("end",that.data.swiperInfo.loadStartCursor,that.data.swiperInfo.loadEndCursor,that.data.swiperInfo.viewStartCursor,that.data.swiperInfo.viewEndCursor);
					console.log("slideReset",that.data.swiper.previousIndex , that.data.swiper.activeIndex);

					const chkMouseEvent = that.data.chkMouseEvent;
					if(chkMouseEvent[0] === true){
						if(chkMouseEvent[1] === true){
							chkMouseEvent[0] = false;
							chkMouseEvent[1] = false;
							$("#loader").hide();
						}else {
							chkMouseEvent[1] = true;
						}
					}
					
					that.bind.click();
				});
			},
		}
		ImgList.prototype.computed = {
			swiperSlideChange : (direct) => {
				const that = this;
				const imgList = that.parent.data.imgList;
				
				if(direct == "right" && that.data.swiper.activeIndex > that.data.swiperInfo.threshold){
					if(that.data.swiperInfo.loadEndCursor >= imgList.length){return;}	
					/* var diff = that.data.swiper.activeIndex - that.data.swiperInfo.threshold;
					if(that.data.swiperInfo.viewEndCursor + diff >= imgList.length){
						diff = imgList.length - that.data.swiperInfo.viewEndCursor -1;
					} */
					var diff = that.data.swiper.activeIndex - that.data.swiper.previousIndex;
					if(that.data.swiperInfo.viewEndCursor + diff >= imgList.length){
						diff = imgList.length - that.data.swiperInfo.viewEndCursor -1;
					}
					
					that.data.swiperInfo.viewStartCursor += diff;
					that.data.swiperInfo.viewEndCursor += diff;	
					
					
				}else if(direct == "left" && that.data.swiper.activeIndex < that.data.swiperInfo.threshold){
					if(that.data.swiperInfo.loadStartCursor <= 0){return;}
					/* var diff = that.data.swiperInfo.threshold - that.data.swiper.activeIndex;
					if(that.data.swiperInfo.viewStartCursor - diff <= 0){
						diff = that.data.swiperInfo.viewStartCursor;
					} */
					var diff = that.data.swiper.activeIndex - that.data.swiper.previousIndex;
					if(that.data.swiperInfo.viewStartCursor <= 0){
						that.data.swiperInfo.viewStartCursor = 0;
						diff = 0;
					}
					that.data.swiperInfo.viewStartCursor += diff;
					that.data.swiperInfo.viewEndCursor += diff;
					
				}
			},

			reset : () => {
				const that = this;
				that.data.swiperInfo = {maxSize : 30, viewStartCursor : 0, viewEndCursor : 29, loadStartCursor:0,loadEndCursor:29,isUpdateSlide:false, threshold:15};

				const keys = Object.keys(that.bind);
				for(let k=0, len=keys.length; k<len; k++){
					that.bind[keys[k]]();
				}
			},
		}
		ImgList.prototype.render = {
			drawSwiper : () => {
				const that = this;
				const gInfo = that.parent.data.gInfo;
				const cursor = gInfo.current_cursor;
				const imgList = that.parent.data.imgList;
				
				let html = "";
				let i = 0;
				if(cursor > 15){
					i = cursor - 15;
				
				}
				
				let j = 0;
				if(that.data.swiper) {
					for(i; i<imgList.length && j < that.data.swiperInfo.maxSize; i++, j++){
						
						//
						var imgSrcPath = imgList[i];
						var lastIndex = imgSrcPath.lastIndexOf(".");
						var imgSrcPathResult = [imgSrcPath.slice(0, lastIndex), "_tb", imgSrcPath.slice(lastIndex)].join('');
						//
						html += "<li class='swiper-slide' id='slide_"+i+"'><img src='<c:url value='"+imgSrcPathResult+"'/>'></li>";
// 						html += "<li class='swiper-slide' id='slide_"+i+"'><img src='<c:url value='"+imgList[i]+"'/>'></li>";
					}
					
					that.data.swiper.removeAllSlides();
					that.data.swiper.appendSlide(html);
				} else {
					html +='<ul class="swiper-wrapper">';
					for(i; i<imgList.length && j < that.data.swiperInfo.maxSize; i++, j++){ 
						
						//
						var imgSrcPath = imgList[i];
						var lastIndex = imgSrcPath.lastIndexOf(".");
						var imgSrcPathResult = [imgSrcPath.slice(0, lastIndex), "_tb", imgSrcPath.slice(lastIndex)].join('');
						//
						html += "<li class='swiper-slide' id='slide_"+i+"'><img src='<c:url value='"+imgSrcPathResult+"'/>'></li>";
// 						html += "<li class='swiper-slide' id='slide_"+i+"'><img src='<c:url value='"+imgList[i]+"'/>'></li>";
					}
					html += '</ul>';
					$(".imgList").empty();
					$(".imgList").append(html);
					
					that.data.swiper = new Swiper('.imgList', {
						effect: 'coverflow',
						grabCursor: true,
						centeredSlides: true,
						slidesPerView: 'auto',
						mousewheel : {},
						coverflowEffect: {
							rotate: 20,
							stretch: 20,
							depth: 150,
							modifier: 1,
							slideShadows : true,
						},
					});
					
					that.data.isSwiper = true;
				}

				if(cursor > 15){
					that.data.swiper.slideTo(15);	
				} else {
					that.data.swiper.slideTo(cursor);
				}	
				
				
				const keys = Object.keys(that.bind);
				for(let k=0, len=keys.length; k<len; k++){
					that.bind[keys[k]]();
				}
			},
		}
		ImgList.prototype.init(parent, swiper);
	}
	
	function Panel(parent, canvas){
		Panel.prototype.parent = null;
		Panel.prototype.data = {
			gObj: null,
			canvas: null,
			
		}
		Panel.prototype.init = (parent) => {
			const that = this;
			that.parent = parent;
		}
		Panel.prototype.setCanvas = (canvas) => {
			const that = this;
			that.data.canvas = canvas;
		}
		Panel.prototype.onload = (gObj) => {
			const that = this;
			that.data.gObj = gObj;
			that.data.pt = that.parent.pt;
			that.render.drawLayer();
		}
		Panel.prototype.bind = {
			evtInit() {
				const that = this;
				
			},
			labelEvt() {
				const that = this;

				that.inputFocus();
				that.inputBlur();
				that.inputInput();
				that.inputHover();

				that.labelDown();
				that.labelMove();
				that.labelUp();
			},
			layerEvt() {
				const that = this;

				that.selector();
				that.switch();
				that.visible();
			},

			selector : () => {
				const that = this;
				$(".label .label-layer").off("click").on("click", function(){
					const enrichCanvas = that.parent.data.enrichCanvas;
					const isPoly = enrichCanvas.data.isPoly
// 					if(isPoly) {
// 						alert("다각형을 그리는 동안 레이어를 선택할 수 없습니다");
// 						return;
// 					}
					
					$(".selector").removeClass("selected");
					$(this).find(".selector").addClass("selected");
					
					
					//기존 tag 선택풀기
					$(".label-container .label-wrap").show();
					const targets = $(".label-container .label-wrap");
					that.computed.tagSetting(targets);
					//
					
					const layer_id = $(this).parents(".layer-wrap").attr("id");
					const layer_name = $(this).children(".name").attr("title");
					$(".tag-wrap .layer_name").html(layer_name);
					$(".tag-wrap .layer_name").each(function(){
						let length = 30;
						
						$(this).each(function(){
							if($(this).text().length >= length){
								$(this).text($(this).text().substr(0,length)+"..."+"_"+layer_id);
							}
						});
					});	
					$(".tag-wrap .layer_name").attr("title", layer_name);					
					
					
					const tags = that.computed.updateTagset($(this).parents(".layer-wrap").attr("id"));
					that.computed.drawTagset(tags);
					
				});
				
				//선택된 레이어가 없을 시 첫번째 레이어 선택
				if($(".label .layer-wrap .label-layer .selector.selected").length<=0){
					$(".label .layer-wrap .label-layer").first().trigger("click");
				}
			},
			switch : () => {
				const that = this;
				$(".label .label-layer .switch").off("click").on("click", function(){
					if($(this).hasClass("open")){
						$(this).removeClass("open");
						$(this).addClass("close");
					} else {
						const label = $(this).parents(".layer-wrap").find(".label-wrap");
						if(label.length == 0) {
							alert("Label 이 없습니다 \n Label 을 추가해주세요");
							return false;
						}
						
						$(this).removeClass("close");
						$(this).addClass("open");
					}
					$(this).parent().next().slideToggle("500");
				});

				$(".label .label-layer").off("dblclick").on("dblclick", function(evt){
					if($(evt.target).hasClass("visible") || $(evt.target).hasClass("switch")){
						return;
					}
					
					if($(this).children(".switch").hasClass("open")){
						$(this).children(".switch").removeClass("open");
						$(this).children(".switch").addClass("close");
					} else {
						const label = $(this).parents(".layer-wrap").find(".label-wrap");
						if(label.length == 0) {
							alert("Label 이 없습니다 \n Label 을 추가해주세요");
							return false;
						}
						
						$(this).children(".switch").removeClass("close");
						$(this).children(".switch").addClass("open");
					}
					$(this).children(".switch").parent().next().slideToggle("500");
				});
			},
			visible : () => {
				const that = this;

				function visible() {
					const canvas = that.data.canvas;
					const gObj = that.data.gObj;
					//캔버스에 존재하는 오브젝트 모두 삭제
					const canvObjLen = canvas.getObjects().length;
					for(let i = 0 ; i < canvObjLen; i++){
						canvas.remove(canvas.getObjects()[0]);
					}
					
					const keysNode = $(".label-layer .visible.on").parents(".layer-wrap")
					for(let i=0; i<keysNode.length; i++){
						const layer = gObj.layer[keysNode[i].id];
						//글로벌 변수에서 오브젝트 정보 가져옴
						const keyArr = Object.keys(layer.labelMap);
						if(keyArr.length < 1 ){continue;}
						
						//글로벌 변수의 정보를 통해 오브젝트를 그리고 이벤트 바인딩
						for(let j = 0 ; j < keyArr.length ; j++){
							const uuid = keyArr[j];
							const newRect = layer.labelMap[uuid];
							const img = gObj.img;
							const imgInfo = gObj.imgInfo;
							
							if(newRect.points){
								that.parent.data.enrichCanvas.render.createPoints(newRect.id, newRect.points);
							} else {
								const rect = new fabric.Rect(newRect);
								canvas.add(rect);
							}
						}
					}
				}

				$(".label .label-layer .visible").off("click").on("click", function(){
					if($(this).hasClass("on")){
						$(this).removeClass("on");
						$(this).addClass("off");
					} else {
						$(this).removeClass("off");
						$(this).addClass("on");
					}
					visible();
					
					return false;
				});
			},

			inputFocus : () => {
				const that = this;
				$(".label-container .label input").off("focus").on("focus",function(e){
					if(!$(this).parents(".label-wrap").hasClass("on")){
						// $(".label-container").find(".label-wrap").removeClass("on");
						// $(this).parents(".label-wrap").addClass("on")
						$(this).parent().prev().trigger("mousedown");
					}
					
					$(".findTag").remove();
					const html = "<div class='findTag'><ul></ul></div>";
					$(this).parent().append(html);
					that.data.isTagAppend = true;
					
					const layer = $(this).parents(".layer-wrap").attr("id");
					const datasetId = that.parent.data.gObj.layer[layer].pId;
					const tagset = that.computed.getLabelGroup(datasetId);
					that.computed.setLabelGroup(tagset);
				});
			},
			inputBlur : () => {
				const that = this;
				const gObj = that.data.gObj;
				const canvas = that.data.canvas;
				$(".label-container .label input").off("blur").on("blur",function(e){
					let typingList = that.data.typingList;
					$(this).parents(".label-wrap").removeClass("draggable");
					if(typingList){	// label명 변경 위치
						hObj.label.list.length = 0;
						
						let layerId = $(this).parents(".layer-wrap").attr("id");
						const label = typingList.parents(".label-wrap");
						
						//history stack
						$.each(label, function(index, value){
							const labelId = value.id.split("div_")[1];
							
							const labelObj = new Object();
							labelObj["layerId"] = layerId;
							labelObj["labelId"] = labelId;
							labelObj["before"] = JSON.parse( JSON.stringify( gObj.layer[layerId].labelMap[labelId] ) );
							gObj.layer[layerId].labelMap[labelId].label = $(value).find(".label input[type='text']").val();
							gObj.layer[layerId].labelMap[labelId].fill = that.data.fill;
							labelObj["labelValue"] = gObj.layer[layerId].labelMap[labelId];
							hObj.label.list.push(labelObj);
						});
						
						hObj.stack.length = hObj.cursor;
						hObj.label.action = "update";
						hObj.stack[hObj.cursor++] = JSON.parse( JSON.stringify( hObj.label ) );
					}
					
					typingList = false;
					
					layerId = $(".label-layer .selector.selected").parents(".layer-wrap").attr("id");
					const tags = that.computed.updateTagset(layerId);
					that.computed.drawTagset(tags);
				});
			},
			inputInput : () => {
				const that = this;
				const gObj = that.data.gObj;
				const canvas = that.data.canvas;

				$(".label-container .label input").off("input").on("input",function(e){
					//영문, 숫자, 특수문자
					if($(this).val().match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
						alert("영문과 특수문자 및 숫자만 입력 가능합니다");
					}
					
					const str = $(this).val().replace(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/gi,"");
                    if(str.match(/[^a-zA-Z0-9~!@#$%^&*()-_=+ ]/)){
							$(this).val(str.slice(0, -1));						
					} else {
							$(this).val(str);						
					}					
                    
					// 텍스트 길이 제한 
					if ($(this).data("length") == 250 && $(this).val().length > 250){
						var string = $(this).val();
						alert("입력 가능한 텍스트 개수를 초과하였습니다\n중간에 입력하신 경우 기존 텍스트의 마지막 글자를 삭제합니다");
						$(this).val(string.slice(0,250));
						return false;							
					} 
					
					// const colorHash = new ColorHash();
					let fillColor;
					if($(this).val() == "") {
						fillColor = [33,138,255];
					} else {
						fillColor = colorHash.rgb($(this).val());
					}
					const label = $(".label-container").find(".label-wrap.on .label input[type='text']");
					$.each(label, function(index, value){
						$(value).val(str);
						
						const id = $(value).parents(".label-wrap").attr("id").split("_")[1];
						const fill = "rgba("+fillColor[0]+","+fillColor[1]+","+fillColor[2]+",0.5)";
						that.data.fill = fill;
						canvas.getObjects().forEach(function(o) {
							if(o.id === id) {
								o.set("fill",fill);
							}
						});
						
					});
					canvas.renderAll();
					
					that.data.typingList = label;
					$(".findTag").remove();
				});
			},
			
			inputHover: () => {  // jh.sa 우측 Label 영역 텍스트길이가 긴 label 이름 툴팁 추가
				const that = this;
				
				$(".label-container .label").off("mouseenter").on("mouseenter", function(){
					let label_title = $(this).children("input");
					let text = label_title.val();
					label_title.empty();
					label_title.append(text);
					that.parent.bind.addHoverBox($(this), text);
				});
				
				$(".label-container .label").off("mouseleave").on("mouseleave", function(){
					that.parent.bind.removeHoverBox($(this));
				});				
			},

			labelDown: () => {
				const that = this;
				const canvas = that.data.canvas;
				$(".crop-img").off("mousedown").on("mousedown",function(evt){
					if (evt.ctrlKey === true || evt.metaKey === true) {
						if($(this).parents(".label-container").find(".on").length <= 0){
							$(".label .frame-wrap .label-wrap").removeClass("on");
						}
						$(this).parent().addClass("on");
						
						that.parent.computed.multiSelection();
					} else {
						if(!$(this).parent().hasClass("on")){
							const cmp_id = $(this).parent()[0].id.split("_")[1];
							canvas.getObjects().forEach(function(o) {
								if(o.id === cmp_id) {
									canvas.setActiveObject(o);            	        	
								}
							});
							$(".label .frame-wrap .label-wrap").removeClass("on");
							$(this).parent().addClass("on");
						}
					}
					canvas.renderAll();
					$(".label .frame-wrap .label-wrap.on").addClass("draggable");
				});
			},
			labelMove: () => {
				const that = this;
				$(".label .frame-wrap").off("mousemove").on("mousemove", function(evt){
					const draggable = $(".label .frame-wrap .label-wrap.draggable");
					
					if(draggable.length>0){
						$(".drag-container .num").text(draggable.length);
						$(".drag-container").show().offset({
							top : evt.pageY+3,
							left : evt.pageX+3
						});
						
						if(evt.target.className == "frame-wrap"){
							$(".drag-container").addClass("not");
							$(".drag-container .drag_text").text("Not Allowed");
						} else {
							$(".drag-container").removeClass("not");
							$(".drag-container .drag_text").text("Drag & Drop");
						}
						
					} else {
						evt.preventDefault();
						evt.stopPropagation();
					}
				});
			},
			labelUp: () => {
				const that = this;
				const gObj = that.data.gObj;
				$(document).off("mouseup").on("mouseup", function(evt){
					$(".drag-container").hide();
					
					//findTag remove
					let isTag = true;
					const li = $(".findTag li");
					for(let i=0; i<li.length; i++){
						if(evt.target == li[i]){
							isTag = false;
							break;
						}
					}
					if(isTag && !that.data.isTagAppend){
						$(".findTag").remove();
					}
					that.data.isTagAppend = false;
					//
					
					
					let targetId = "";	//옮길 gObj layer
					if($(evt.target).parents(".layer-wrap").length>0){
						targetId = $(evt.target).parents(".layer-wrap").attr("id");
					} else if ($(evt.target).hasClass("layer-wrap")){
						targetId = $(evt.target).attr("id");
					} else {
						$(".label .frame-wrap .label-wrap.on").removeClass("draggable");
						return false;
					}
					
					hObj.label.list.length = 0;
					
					const draggable = $(".label .frame-wrap .label-wrap.draggable");
					const layerId = draggable.parents(".layer-wrap").attr("id");	//기존 gObj layer 키
					if(draggable.length > 0 && layerId != targetId){
						$.each(draggable, function(index, value){
							const id = value.id.split("_")[1];
							const img = gObj.img;
							const imgInfo = gObj.imgInfo;
							
							
							gObj.layer[targetId].labelMap[id] = gObj.layer[layerId].labelMap[id];
							delete gObj.layer[layerId].labelMap[id];
							
							//
							const labelObj = {};
							labelObj["layerId"] = targetId;
							labelObj["labelId"] = id;
							labelObj["labelValue"] = gObj.layer[targetId].labelMap[id];
							labelObj["before"] = layerId
							hObj.label.list.push(labelObj);
							//
							
							const newRect = gObj.layer[targetId].labelMap[id];
							const canv = document.createElement('canvas');
							canv.id = newRect.id = id;
							that.render.addLabel(canv, targetId, newRect);
						});
						
						//
						hObj.stack.length = hObj.cursor;
						hObj.label.action = "move";
						hObj.stack[hObj.cursor++] = JSON.parse( JSON.stringify( hObj.label ) );
						//
						
						$(".label .frame-wrap .label-wrap.on").remove();
						if($("#"+layerId+" .label-wrap").length > 0){
						} else {
							$(".label #"+layerId+" .label-layer .switch").trigger("click");
						}
						
						if($("#"+targetId+" .switch").hasClass("close")){
							$(".label #"+targetId+" .label-layer .switch").trigger("click");
						}
					}
					$(".label .frame-wrap .label-wrap.on").removeClass("draggable");
				});
			},


			tagClick: () => {
				const that = this;
				$(".tag-wrap .tag").off("click").on("click",function(){
					$(this).toggleClass("selected");
					
					const targets = $(".layer-wrap .selector.selected").parents(".layer-wrap").find(".label-container .label-wrap");
					targets.hide();
					
					if($(".tag-wrap .tag.selected").length>0){
						const selectedTag = $(".tag-wrap .tag.selected");
						const targetArr = [];
						for(let i=0; i<selectedTag.length; i++){
							const tagName = $(".tag-wrap .tag.selected")[i].innerHTML.substr(1);
							for(let j=0; j<targets.length; j++){
								if($(targets[j]).find(".label input[type='text']").val() == tagName){
									$(targets[j]).show();
									targetArr.push(targets[j]);
								}
							}
						}
						that.computed.tagSetting(targetArr);
					} else {
						//
						$(".label-container .label-wrap").show();
						const targets = $(".label-container .label-wrap");
						that.computed.tagSetting(targets);
						//
					}
					
				});
			},
			
			tagHover: () => {
				const that = this;
				$(".tag-wrap .tag").off("mouseenter").on("mouseenter", function(){
					let text = $(this)[0].innerText;
					$(this).empty();
					$(this).append(text);
					that.parent.bind.addHoverBox($(this), $(this)[0].innerText.slice(1));
				});
				$(".tag-wrap .tag").off("mouseleave").on("mouseleave", function(){
					that.parent.bind.removeHoverBox($(this));
				});				
			},
		}
		Panel.prototype.computed = {
			getLabelGroup : (id) => {
				const tagset = [];
				$.ajax({
					url :  baseUrl + "/data/getLabelGroup.json",
					data : {dataset_id : id},
					type : "POST",
					async: false,
					success : function(res){
						console.log("=====getLabelGroup=====", res);
						if(res.result.code == 200){
							const data = res.result.data
							for(let i=0, len=data.length; i<len; i++){
								tagset.push(data[i].label);
							}
						} else if (res.result.code == "2001") {
							alert(res.result.data);
							location.href = baseUrl + 'login';
						} else {
							alert(res.result.data)
						}
					},
					error : function(err){
						alert(err);
						console.log("ERROR!!", err);
					}
				});
				
				return tagset
			},
			setLabelGroup: (tagset) => {
				const that = this;
				const gObj = that.data.gObj;
				const canvas = that.data.canvas;
				
				if(tagset.length<=0){
					$(".findTag").remove();
					return;
				}
				let html="";
				for(let i=0, len=tagset.length; i<len; i++){
					html +="<li> #"+tagset[i]+"</li>";
				}
				$(".findTag ul").append(html);
				
				$(".findTag li").off("click").on("click", function(){
					const tag = $(this).text().split("#")[1];
					const fillColor = colorHash.rgb(tag);
					const label = $(".label-container").find(".label-wrap.on .label input[type='text']");
					hObj.label.list.length = 0;
					$.each(label, function(index, value){
						$(value).val(tag);
						const layerId = $(value).parents(".layer-wrap").attr("id");
						const id = $(value).parents(".label-wrap").attr("id").split("_")[1];
						
						const fill = "rgba("+fillColor[0]+","+fillColor[1]+","+fillColor[2]+",0.5)";
						canvas.getObjects().forEach(function(o) {
							if(o.id === id) {
								o.set("fill",fill);
							}
						});

						const labelObj = new Object();
						labelObj["layerId"] = layerId;
						labelObj["labelId"] = id;
						labelObj["before"] = JSON.parse( JSON.stringify( gObj.layer[layerId].labelMap[id] ) );
						gObj.layer[layerId].labelMap[id].label = tag;
						gObj.layer[layerId].labelMap[id].fill = fill;
						labelObj["labelValue"] = JSON.parse( JSON.stringify( gObj.layer[layerId].labelMap[id]));
						hObj.label.list.push(labelObj);
					});
					hObj.stack.length = hObj.cursor;
					hObj.label.action = "update";
					hObj.stack[hObj.cursor++] = JSON.parse( JSON.stringify( hObj.label ) );
					
					canvas.renderAll();
					
					layerId = $(".label-layer .selector.selected").parents(".layer-wrap").attr("id");
					const tags = that.computed.updateTagset(layerId);
					that.computed.drawTagset(tags);
					
					$(".findTag").remove();
				});
			},

			updateTagset : (id) => {
				const that = this;
				const tagObj = new Object();
				const layer = that.data.gObj.layer[id];
				const labelKeys = Object.keys(layer.labelMap);
				for(let i=0; i<labelKeys.length; i++){
					const key = layer.labelMap[labelKeys[i]].label;
					tagObj[key] = 1;
				}
				
				return Object.keys(tagObj);
			},

			drawTagset : (tags) => {
				const that = this;
        		
				$(".tag-wrap .num").html(tags.length);
				$(".tag-wrap .content-wrap").empty();
				if(tags.length>0){
					$(".tag-wrap .content-wrap").append("<div class='content'></div>");
					for(let i=0; i<tags.length; i++){
						const html = "<div id='"+tags[i]+"' class='tag fl'>#"+tags[i]+"</div>";
						$(".tag-wrap .content").append(html);
					}
					$(".tag-wrap .content").append("<div class='clear'></div>");
				}
				that.bind.tagClick();
				that.bind.tagHover();
			},
			//선택한 태그의 label 캔버스에 그리기
			tagSetting : (targets) => {
				const that = this;
				const canvas = that.data.canvas;
				const gObj = that.data.gObj;
				//캔버스에 존재하는 오브젝트 모두 삭제
				const canvObjLen = canvas.getObjects().length;
				for(let i = 0 ; i < canvObjLen; i++){
					canvas.remove(canvas.getObjects()[0]);
				}
				
				for(let i=0; i<$(targets).length; i++){
					const layerKey = $(targets[i]).parents(".layer-wrap").attr("id");
					const layer = gObj.layer[layerKey];
					const labelKey = $(targets)[i].id.split("div_")[1];
					const newRect = layer.labelMap[labelKey];
					const img = gObj.img;
					const imgInfo = gObj.imgInfo;
					
					if(newRect.points){
						that.parent.data.enrichCanvas.render.createPoints(newRect.id, newRect.points, newRect.fill);		// jh.sa polygon fill 
					} else {
						var rect = new fabric.Rect(newRect);
						canvas.add(rect);
					}
					
// 					console.log(layerKey, labelKey);
				}
				
// 				console.log(typeof(targets), targets);
			},

			procPolygon : (layerId, labelId) => {
				const that = this;
				const labelContainer = $("#"+layerId+" #div_"+labelId);
				let canv;
				if(labelContainer.length > 0){
					canv = $("#"+labelId)[0];
					console.log(canv);
				} else {
					canv = document.createElement('canvas');
					console.log(canv);
					canv.id = labelId;
					
					//패널에 label컨테이너 생성
					console.log("canv: ", canv, "layerId: ", layerId, "labelId: ", labelId);
					that.render.drawLabelContainer(canv, layerId, labelId);
				}
				const labelMap = that.data.gObj.layer[layerId].labelMap[labelId];
// 				that.computed.procLabelImage(layerId, labelId, labelMap.points, canv);
				that.render.drawLabelImage(canv, labelMap);
				that.bind.labelEvt();
			},
			/* procLabelImage : (layerId, labelId, points, canv) => {
				const that = this;
				
				const enrichCanvas = that.parent.data.enrichCanvas;
				for(let i=0; i<points.length; i++) {
					enrichCanvas.computed.mappingPoly(layerId, labelId, points[i]);
				}
				
				const labelMap = that.data.gObj.layer[layerId].labelMap[labelId];
				that.render.drawLabelImage(canv, labelMap);
			}, */
		}
		Panel.prototype.render = {
			drawLayer: () => {
				const that = this;
				const pt = that.parent.pt;
				const gObj = that.data.gObj;

				pt.find(".label .frame-wrap").empty();
				pt.find(".label .frame-wrap").append("<div class='drag-container'><div class='num'></div><div class='content'><div class='drag_img'></div><div class='drag_text'></div></div></div>");

				const layerKeys = Object.keys(gObj.layer);
				for(let i=0, len=layerKeys.length; i<len; i++){
					console.log("id : " + layerKeys[i]);
					const layer = gObj.layer[layerKeys[i]];
/* 					console.log("layer Title: " + layer.pTitle);
					console.log("layer Title: " + layer.pId); */
					/* const labelKeys = Object.keys(layer.labelMap); */
					const labelKeys = Object.keys(layer.labelMap); 
					let isOpen, isShow = "";
					if(labelKeys.length>0){
						isOpen = "open";
					} else {
						isOpen = "close";
						isShow = "display: none;";
					}

					const html = "<div id='"+layerKeys[i]+"' class='layer-wrap clear'>"
						+ "<div class='label-layer flex'>"
						+ 	"<div class='selector'></div><div class='visible on'></div><div class='switch "+isOpen+"'></div><div class='name'>"+layer.pTitle+"_"+layerKeys[i]+"</div>"
						+ "</div>"
						+ "<div class='label-container' style='"+isShow+"'><div class='clear'></div></div>"
						+ "</div>";
					pt.find(".label .frame-wrap").append(html);
					
					pt.find(".layer-wrap .label-layer").css("display", "none");

					// jh.sa : 우측 layer 목록에서 데이터셋 이름 50자 이상인 경우 말줄임표 처리  
					$("div.name").each(function(){
						let length = 30;
						
						$(this).each(function(){
							if($(this).text().length >= length){
								$(this).text($(this).text().substr(0,length)+"..."+"_"+layerKeys[i]);
							}
						});
					});				
					// jh.sa : 우측 layer 목록에서 말줄임표로 줄여진 데이터셋 이름 title 툴팁 띄우기		
					pt.find(".label-layer .name").eq(i).attr("title", layer.pTitle+"_"+layerKeys[i]);
					
					//총돌검사 레이어명
					pt.find(".collision .range-wrap .name").eq(i).text(layer.pTitle+"_"+layerKeys[i]);
					pt.find(".collision .range-wrap .name").eq(i).attr("title", layer.pTitle+"_"+layerKeys[i]);	// jh.sa name 길어서 잘리는 부분 TITLE로 대체 
					pt.find(".all_collision .range-wrap .name").eq(i).text(layer.pTitle);
					pt.find(".all_collision .range-wrap .name").eq(i).attr("title", layer.pTitle);				// jh.sa name 길어서 잘리는 부분 TITLE로 대체 
					pt.find(".collision .option .name").eq(i).text(layer.pTitle+"_"+layerKeys[i]);
					pt.find(".collision .option .name").eq(i).attr("title", layer.pTitle+"_"+layerKeys[i]);		// jh.sa name 길어서 잘리는 부분 TITLE로 대체 
					pt.find(".all_collision .option .name").eq(i).text(layer.pTitle);
					pt.find(".all_collision .option .name").eq(i).attr("title", layer.pTitle);					// jh.sa name 길어서 잘리는 부분 TITLE로 대체 
					pt.find(".layer-move .option .name").eq(i).text(layer.pTitle);
					pt.find(".layer-move .option .name").eq(i).attr("title", layer.pTitle);						// jh.sa name 길어서 잘리는 부분 TITLE로 대체 
	
					// jh.sa : collision 창에서 데이터셋 이름 15자 이상인 경우 말줄임표 처리 
					$("span.name").each(function(){
						let length = 15;
						
						$(this).each(function(){
							if($(this).text().length >= length){
								$(this).text($(this).text().substr(0,length)+"...");
							}
						});
					});					
					
					for(j = 0 ; j < labelKeys.length ; j++){
						const uuid = labelKeys[j];
						let newRect = layer.labelMap[uuid];
						let canv = document.createElement('canvas');
						canv.id = newRect.id = uuid;
						
						that.render.addLabel(canv, layerKeys[i], newRect);
					}

				}

				that.bind.layerEvt();
			},


			addLabel: (canv, layerId, labelMap) => {
				const that = this;
				
				that.render.drawLabelContainer(canv, layerId, labelMap.id);
				that.render.drawLabelImage(canv, labelMap);
				that.bind.labelEvt();
			},
			//label 컨네이너 생성
			drawLabelContainer: (canv, layerId, labelId) => {
				const that = this;

				if(typeof(layerId) == "undefined") { return; }

				const html = "<div id='div_"+labelId+"' class='label-wrap'> <div class='crop-img'></div> <div class='label'><input type='text' data-length='250' onkeyup='noSpaceForm(this);' onchange='noSpaceForm(this);'/></div> </div>";
				$("#"+layerId+" .label-container").prepend(html);
				$("#"+layerId+" .label-container #div_"+labelId+" .crop-img").html(canv);
			},
			//label 컨테이너에 이미지 삽입
			drawLabelImage: (canv, label) => {
				const that = this;
				const gObj = that.data.gObj;
				const img = gObj.img;
				const scaleFactor = gObj.imgInfo.scaleFactor;

				const context = canv.getContext('2d');		
				const w = label.width/scaleFactor;
				const h = label.height/scaleFactor;
				
				let dw = 0;
				let dh = 0;
				
				const g_w = 105;
				const g_h = 80;
				
				const fw = w/g_w;
				const fh = h/g_h;
				
				if(fw >= fh){
					dw = w / fw;
					dh = h / fw;
				}else{
					dw = w / fh;
					dh = h / fh;
				}
				canv.width = dw;
				canv.height = dh;
				
				const left = label.left/scaleFactor;
				const top = label.top/scaleFactor;
				const width = label.width/scaleFactor;
				const height = label.height/scaleFactor;

				context.clearRect(0, 0, canv.width, canv.height);	
				context.drawImage(img,label.left/scaleFactor, label.top/scaleFactor, label.width/scaleFactor, label.height/scaleFactor, 0, 0,dw,dh);		      
				
				$(canv).parent().parent().find("input").val(label.label);		
			},
			
		}
		Panel.prototype.init(parent, canvas);
	}
	
	//
	function setParentObj(that){
		var keys = Object.keys(that);
		for(var i = 0 ; i < keys.length;i++){
			const obj = that[keys[i]];
			if(typeof(obj) == "object" && typeof(obj.root) != "undefined"){
				obj["root"] = that;
			}
		}
	}
	
</script>









