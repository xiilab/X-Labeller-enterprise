<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/header"  flush="false" />
<head>
	<title>X-labeller</title>
	
	<style>
		#joinResult { background-color: #fafafa;     padding-bottom: 100px; }
		#joinResult .join_result_wrap {  background-color: #fff;  border: solid 1px #d9d9d9; border-top: solid 1px #333; padding: 50px 60px; }
		
		#joinResult .login_btn { width: 220px; line-height: 60px; }
		#joinResult .desc_1 {   font-size: 20px;  font-weight: 500; margin-top: 50px; margin-bottom: 15px; }
		#joinResult .desc_2 {font-size: 15px;margin-bottom: 69px; }
		
	</style>
</head>
<body>
	
	<div class="container" id="joinResult">
		<div class="w620">
			<div class="contents">
				<div class="page_title">가입완료</div>
				<div class="page_title_info">X-Labeller 솔루션이 제공하는 다양한 서비스를 이용해 보세요.</div>
				
				<div class="join_result_wrap t_center">
					<img src="<c:url value="/images/img-sub-join.png" />">
					<div class="desc_1">X-Labeller 회원가입이 성공적으로 완료되었습니다.</div>
					<div class="desc_2">로그인 후, X-Labeller를 이용하실 수 있습니다.</div>
					<button class="btn login_btn style_btn"><a href="<c:url value="/login" />" class="btn_link">로그인</a></button>
				</div>
			</div>
		</div>
	</div>
	
<%-- 	<jsp:include page="/footer"  flush="false" />		 --%>
	
</body>
<script>
	$(document).on("sessionLoad", function() {
		joinResult.init();
	});

	var joinResult = {
		pt: $("#joinResult"),
		init: function(){
			var that = this;

			
			that.listener();
		},
		
		listener: function(){
			var that = this;
			
			
			
		},
		
	};


</script>