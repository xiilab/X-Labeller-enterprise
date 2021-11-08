<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/header"  flush="false" />
<head>
	<title>X-labeller</title>
	
	<style>
		body { background-color: #fafafa; }
/* 		#mypage {  background-color: #fafafa;  min-height: 1300px;} */
		#mypage .point_wrap,  #mypage .info_wrap{  background-color: #fff;  border: solid 1px #d9d9d9; border-top: solid 1px #333; padding: 50px 100px; }
		
		#mypage .point_wrap .input_label { width: 200px; }
		
		#mypage .sub_title  { font-size: 20px; font-weight: 500;      border-bottom: 1px #d9d9d9 solid;  padding-bottom: 20px; margin-bottom: 20px; }
		#mypage .info_wrap {margin-top: 40px; }
		#mypage .input_wrap { margin-bottom: 30px; }
		#mypage .input_wrap .input_label { width: 140px; }
		#mypage .input_wrap input { width: 570px; }
		#mypage .input_wrap input[type='radio']{ width: 13px; margin-right: 10px; margin-left: 10px; }
		
		#mypage .mypage_wrap_btn { width: 120px; height: 54px; background-color: #008bed; margin-left: 20px; color: #fff; }
		#mypage .cancel_btn { width: 150px; height: 62px; border: solid 2px #d9d9d9;   font-size: 18px;}
		#mypage .submit_btn { width: 150px; height: 62px; }
		
	</style>
	
	<script src="<c:url value="/js/rsa/jsbn.js" />"></script>
	<script src="<c:url value="/js/rsa/rsa.js" />"></script>
	<script src="<c:url value="/js/rsa/prng4.js" />"></script>
	<script src="<c:url value="/js/rsa/rng.js" />"></script>
		
</head>
<body>
	
	<div class="container" id="mypage">
		<div class="w980">
			<div class="contents">
				<div class="page_title">마이페이지</div>
<!-- 				<div class="page_title_info">현재 보유 포인트 및 내 정보를 확인하세요.</div> -->
<!-- 				<div class="point_wrap"> -->
<!-- 					<div class="sub_title">포인트</div> -->
<!-- 					<div class="input_wrap flex"> -->
<!-- 						<label class="input_label">현재 보유 포인트</label> -->
<!-- 						<input class="" type="text" name="point" disabled> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
				<input type="hidden" id="rsaPublicKeyModulus" value="<%=request.getAttribute("publicKeyModulus")%>" />
           		<input type="hidden" id="rsaPublicKeyExponent" value="<%=request.getAttribute("publicKeyExponent")%>" />
            						
				<div class="info_wrap">
					<div class="sub_title">기본 정보</div>
					<div class="input_wrap flex">
						<label class="input_label">아이디</label>
						<input class="" type="text" name="account" disabled>
					</div>
					
					<div class="input_wrap flex">
						<label class="input_label">비밀번호</label>
						<input class="" type="password" name="password" placeholder="비밀번호를 변경하시려면 입력해주세요.">
					</div>
					
					<div class="input_wrap flex">
						<label class="input_label">비밀번호 확인</label>
						<input class="" type="password" name="password_check" placeholder="비밀번호 확인을 입력해주세요.">
					</div>					
					
					<div class="input_wrap flex">
						<label class="input_label">키</label>
						<input class="" type="text" name="key" placeholder="발급받은 키값을 입력해주세요.">
					</div>
					
<!-- 					<div class="input_wrap flex"> -->
<!-- 						<label class="input_label">이름</label> -->
<!-- 						<input class="" type="text" name="name" disabled> -->
<!-- 					</div> -->
					
<!-- 					<div class="input_wrap flex"> -->
<!-- 						<label class="input_label">이메일</label> -->
<!-- 						<input class="" type="email" name="email" disabled> -->
<!-- 					</div> -->
					
<!-- 					<div class="input_wrap flex"> -->
<!-- 						<label class="input_label">API KEY</label> -->
<!-- 						<input class="" type="text" name="api_key" placeholder=""> -->
<!-- 					</div> -->

					<div class="btn_wrap t_center">
						<button class="btn cancel_btn">취소</button>
						<button class="btn submit_btn style_btn">수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<%-- 	<jsp:include page="/footer"  flush="false" />		 --%>
	
</body>
<script>
	$(document).on("sessionLoad", function() {
		mypage.init();
	});

	var mypage = {
		pt: $("#mypage"),
		init: function(){
			var that = this;

			if($.isEmptyObject(loginUserInfo)){
				alert("로그인 후 이용가능합니다.");
				location.href = baseUrl + "login";
			}
			else that.drawData();
			
			that.listener();
		},
		drawData: function() {
			var that = this;
			
			that.pt.find("input[name='account']").val(loginUserInfo.data.account);
			that.pt.find("input[name='key']").val(loginUserInfo.data.x_key);
// 			that.pt.find("input[name='name']").val(loginUserInfo.data.name);
// 			that.pt.find("input[name='email']").val(loginUserInfo.data.email);
// 			that.pt.find("input[name='api_key']").val(loginUserInfo.data.api_key);
			
		},
		
		listener: function(){
			var that = this;
			that.pt.find(".submit_btn").off("click").on("click",function(){
				that.updateUser();
			});
			that.pt.find(".cancel_btn").off("click").on("click", function(){
				window.history.back();
			});
		},
		
		updateUser: function(){
			var that = this;
			
			var password = that.pt.find("input[name='password']").val();
			var password_check = that.pt.find("input[name='password_check']").val();
			var x_key = that.pt.find("input[name='key']").val();
			
		    // 암호화 로직
		    var rsaPublicKeyModulus = $("#rsaPublicKeyModulus").val();
		    var rsaPublicKeyExponent = $("#rsaPublicKeyExponent").val();
		    
		    var rsa = new RSAKey();
		    rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);

		    // 사용자 비밀번호를 RSA로 암호화한다.
		    var securedPassword = rsa.encrypt(password);					
			
			var ajaxData = {};
			
// 			var apiKey = that.pt.find("input[name='api_key']").val();
			
			if(password === "") { 
				alert("비밀번호를 입력해주세요."); return;
			}
			
			if(password_check === ""){
				alert("비밀번호 확인을 입력해주세요."); return;
			}
			
			if(password != password_check){
				alert("비밀번호가 일치하지 않습니다.\n다시 입력해주세요.");
				that.pt.find("input[name='password_check']").val("");
				that.pt.find("input[name='password_check']").focus();
				return;
			}
			
			if(x_key === "") {
				alert("키를 입력해주세요."); return;
			}
			
			if(!chkPwd(password)){
				return;
			};					
			
// 			if(apiKey != "") ajaxData.api_key = apiKey;
			
// 			ajaxData.password = password;
			ajaxData.password = securedPassword;
			ajaxData.x_key = x_key; 
			
			$.ajax({
			   	url :  baseUrl + "auth/updateUser.json",
			   	data : ajaxData,
			   	type : "POST",
			   	success : function(res){
					console.log("=====updateUser=====", res);
					if(res.result.code == "200"){
						alert("정보수정이 완료되었습니다.");
						location.href = baseUrl + "mypage";
					} else {
						/* alert("정보수정이 정상적으로 이루어지지 않았습니다.\n다시 시도해주세요."); */
						alert(res.result.data);
						location.reload();
					}
			   	},
			   	error : function(err){
			   		 console.log("ERROR!!", err);
			   	}
			});
		},
	};

	
</script>