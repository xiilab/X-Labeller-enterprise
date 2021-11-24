<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/header"  flush="false" />
<head>
	<title>X-labeller</title>
	
	<style>
		#header .nav_wrap { display: none; }
		#header .account_wrap { display: none; }
/* 		#join {  background-color: #fafafa;  min-height: 1300px;} */
		#join {  background-color: #fafafa;  min-height: 880px;}
		#join .join_wrap {  background-color: #fff;  border: solid 1px #d9d9d9; border-top: solid 1px #333; padding: 50px 100px; }
				
		#join .input_wrap { margin-bottom: 30px; }
		#join .input_wrap .input_label { width: 140px; }
		#join .input_wrap input { width: 570px; }
		#join .input_wrap input[name='account'],  #join .input_wrap input[name='email']{ width: 430px; }
		#join .input_wrap input[type='radio']{ width: 13px; margin-right: 10px; margin-left: 10px; }
		
		#join .join_wrap_btn { width: 120px;height: 54px; background-color: #008bed; margin-left: 20px; color: #fff; }
		#join .check_account_btn { }
		#join .check_email_btn { }
		#join .certification_email_btn { margin-left: 140px;    background-color: #226594;}
		#join .check_code_btn {}
		#join .submit_btn { width: 420px; height: 62px; }
		
		#join .agree_wrap  { font-size: 14px; margin-top: 80px; }
		#join .agree_wrap a { color: #008bed; }
		
		#join .page_title { padding-top: 80px; }
		#join .page_title_info { margin-bottom: 86px; }
		
		/* #join .change_back_color {background-color : #fd6500; !important}
		#join .change_color {color : #fd6500; !important}
		#join .change_filter { filter: saturate(200%) hue-rotate(180deg) !important; }
		#join .change_footer_color { background-image: linear-gradient(94deg, #fd6500, #fd6500 12%, #fd6500); } */

		#infoPwd, #infoID, #infoPwdCheck { font-size: 10px; color: #ff0000; font-weight: 400; position: relative; top: -25px; margin-left: 141px; }
	</style>
	<script src="<c:url value="/js/rsa/jsbn.js" />"></script>
	<script src="<c:url value="/js/rsa/rsa.js" />"></script>
	<script src="<c:url value="/js/rsa/prng4.js" />"></script>
	<script src="<c:url value="/js/rsa/rng.js" />"></script>
	
</head>
<body>
	
	<div class="container" id="join">
		<div class="w980">
			<div class="contents">
				<div class="page_title">회원가입</div>
				<div class="page_title_info">회원가입을 하시면 다양한 서비스를 이용하실 수 있습니다.</div>
				<div class="join_wrap change_filter">
				
					<input type="hidden" id="rsaPublicKeyModulus" value="<%=request.getAttribute("publicKeyModulus")%>" />
            		<input type="hidden" id="rsaPublicKeyExponent" value="<%=request.getAttribute("publicKeyExponent")%>" />
            		
					<div class="input_wrap flex">
						<label class="input_label">아이디</label>
						<input id="uid" class="" type="text" name="account" placeholder="영문 소문자, 숫자 15자 이내로 입력해주세요." maxlength="15">
						<button class="btn check_account_btn join_wrap_btn ">중복확인</button>
					</div>
					<span id="infoID"></span>
					
					<div class="input_wrap flex">
						<label class="input_label">비밀번호</label>
						<input id="upwd" class="" type="password" name="password" placeholder="영문 대소문자, 특수문자, 숫자를 조합하여 8-20자 이내로 입력해주세요.">
					</div>
					<span id="infoPwd"></span>
					<div class="input_wrap flex">
						<label class="input_label">비밀번호 확인</label>
						<input id="upwdCheck" class="" type="password" name="password_check" placeholder="비밀번호 확인을 입력해주세요.">
					</div>		
					<span id="infoPwdCheck"></span>					
					<div class="input_wrap flex">
						<label class="input_label">키</label>
<!-- 						<input class="" type="text" name="key" placeholder="발급받은 키값을 입력해주세요." > -->
						<input class="" type="text" name="key" placeholder="" value="QiI4VdYAzubdFP8AIq7yInMtkazPnmpswHCXLyeLJEM=" disabled>
					</div>
					
<!-- 					<div class="input_wrap flex"> -->
<!-- 						<label class="input_label">이름</label> -->
<!-- 						<input class="" type="text" name="name" placeholder="실명을 입력해주세요."> -->
<!-- 					</div> -->
					
<!-- 					<div class="input_wrap flex"> -->
<!-- 						<label class="input_label">이메일</label> -->
<!-- 						<input class="" type="email" name="email" placeholder="이메일을 입력해주세요."> -->
<!-- 						<button class="btn check_email_btn join_wrap_btn">이메일 중복확인</button> -->
<!-- 					</div> -->
					
<!-- 					<div class="input_wrap certification_wrap flex hide"> -->
<!-- 						<button class="btn certification_email_btn join_wrap_btn">인증코드 전송</button> -->
<!-- 						<input class="" type="text" name="code" style="width: 130px;" > -->
<!-- 						<button class="btn check_code_btn join_wrap_btn">인증코드 확인</button> -->
<!-- 					</div> -->
					
<!-- 					<div class="input_wrap flex"> -->
<!-- 						<label class="input_label">사용목적</label> -->
<!-- 						<input class="" type="text" name="usage_purpose" placeholder="사용목적을 입력해주세요."> -->
<!-- 					</div> -->
					<style>
						.organization { flex-wrap: wrap; }
						.organization label:not(.input_label) {    width: 160px;  }
					</style>
<!-- 					<div class="input_wrap flex organization"> -->
<!-- 						<label class="input_label">소속기관분류</label> -->
<!-- 						<input class="" type="radio" name="organization" value="대기업" id="organization_1" checked /><label for="organization_1">대기업</label> -->
<!-- 						<input class="" type="radio" name="organization" value="중견/중소기업" id="organization_2"  /><label for="organization_2">중견/중소기업</label> -->
<!-- 						<input class="" type="radio" name="organization" value="대학교" id="organization_3"  /><label for="organization_3">대학교</label> -->
<!-- 						<p style="width: 100%"></p> -->
<!-- 						<input class="" type="radio" name="organization" value="개인사용자" id="organization_4" style="margin-left: 149px;" /><label for="organization_4">개인사용자</label> -->
<!-- 						<input class="" type="radio" name="organization" value="정부/공공기관" id="organization_5"  /><label for="organization_5">정부/공공기관</label> -->
<!-- 						<input class="" type="radio" name="organization" value="기타(민간 비영리 기관 등)" id="organization_6"  /><label for="organization_6">기타(민간 비영리 기관 등)</label> -->
<!-- 					</div> -->
					
<!-- 					<div class="input_wrap flex"> -->
<!-- 						<label class="input_label">소속</label> -->
<!-- 						<input class="" type="text" name="department" placeholder="소속을 입력해주세요."> -->
<!-- 					</div> -->
					
<!-- 					<div class="input_wrap flex"> -->
<!-- 						<label class="input_label">서비스 알게 된 경로</label> -->
<!-- 						<input class="" type="radio" name="path" value="인터넷 검색" id="path_1"  checked /><label for="path_1">인터넷 검색</label> -->
<!-- 						<input class="" type="radio" name="path" value="언론 기사" id="path_2"  /><label for="path_2">언론 기사</label> -->
<!-- 						<input class="" type="radio" name="path" value="강연/수업" id="path_3"  /><label for="path_3">강연/수업</label> -->
<!-- 						<input class="" type="radio" name="path" value="주변 소개" id="path_3"  /><label for="path_3">주변 소개</label> -->
<!-- 						<input class="" type="radio" name="path" value="기타" id="path_3"  /><label for="path_3">기타</label> -->
<!-- 					</div> -->
					<div class="agree_wrap t_center">
						회원으로 가입하시면 <a href="">서비스 약관</a>과 <a href="">개인정보 정책</a>을 읽고 동의하신 것으로 간주됩니다.
					</div>
					<div class="btn_wrap t_center">
						<button class="btn submit_btn style_btn">회원가입</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<%-- 	<jsp:include page="/footer"  flush="false" />		 --%>
	
</body>
<script>
	$(document).on("sessionLoad", function() {
		join.init();
	});

	var join = {
		pt: $("#join"),
		init: function(){
			var that = this;

			
			that.listener();
		},
		
		listener: function(){
			var that = this;
			
			that.pt.find("#uid").off("input").on("input",function(e){
				if($(this).val() == ""){
					$("#infoID").html("");
				}							
			});
			
			that.pt.find("#upwd").change(function(){
				if($(this).val() == ""){
					$("#infoPwd").html("");
				}
			});
			
			that.pt.find("#upwdCheck").change(function(){
				if($(this).val() == ""){
					$("#infoPwdCheck").html("");
				}
			});			

			that.pt.find("#uid").off("keyup").on("keyup", function(e){
				// 비밀번호 유효성 검사
				var val = $(this).val();
				var num = val.search(/[0-9]/g);
				var eng = val.search(/[a-z]/ig);
			    var spe = val.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);				
				var msg = '';
				
				if(val.length === 0){
					msg ="";
				} else if(val.length < 5){
					msg = "아이디는 5자 이상 입력해주세요";
				} else if(val.length > 15){
					msg = "아이디는 15자 이내로 입력해주세요";
				} else {
					if(num < 0 || eng < 0){
						msg = "아이디는 영문 소문자 및 숫자를 혼합하여 입력해주세요";
					}					
				}
				
				if(val.match(/[^a-z0-9 ]/) || spe > 0){
					msg = "영문 대문자, 한글 및 특수문자는 사용 불가합니다";
				}					
// 				if(spe > 0){
// 					msg = "특수문자는 사용 불가합니다";
// 				}
				if(val.search(/\s/) != -1){
					msg = "아이디는 공백 없이 입력해주세요";
				}
				
				
				$("#infoID").html(msg);
			});				
			
			that.pt.find("#upwd").off("keyup").on("keyup", function(e){
				// 비밀번호 유효성 검사
				var val = $(this).val();
				var num = val.search(/[0-9]/g);
				var eng = val.search(/[a-z]/ig);
			    var spe = val.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);				
				var msg = '';
				
				if(val.length === 0){
					msg ="";
				} else if(val.length < 8){
					msg = "비밀번호는 8자리 이상 입력해주세요";
				} else if(val.length > 20){
					msg = "비밀번호는 20자 이내로 입력해주세요";
				} else {
					if(num < 0 || eng < 0 || spe < 0){
						msg = "비밀번호는 영문 대소문자, 숫자, 특수문자를 혼합하여 입력해주세요";
					}					
				}
				
				if(val.search(/\s/) != -1){
					msg = "비밀번호는 공백 없이 입력해주세요";
				}
				
				
				$("#infoPwd").html(msg);
			});
			
			that.pt.find("#upwdCheck").off("keyup").on("keyup", function(e){
				var val = $(this).val();
				var pwd = $("#upwd").val();
				var msg = "";
				
				if(val.length === 0){
					msg = "";
				} else if(val.length > 0 && val != pwd){
					msg = "비밀번호가 일치하지 않습니다";
				} else if(val.length > 0 && val == pwd){
					msg = "";
				}
				
				$("#infoPwdCheck").html(msg);
			});
			
			that.pt.find(".check_account_btn").off("click").on("click",function(){
				var account = that.pt.find("input[name='account']").val();
				if(account == ""){
					alert("아이디를 입력해주세요."); 
					return;
				} else {
					if(!validateID()){
						$("#infoID").html("");
						return;
					}								
					that.getUserByAccount(account);
				}
			});
			
// 			that.pt.find(".check_email_btn").off("click").on("click",function(){
// 				var email = that.pt.find("input[name='email']").val();
// 				if(email == ""){
// 					alert("이메일을 입력해주세요."); 
// 					return;
// 				} else if(!validator.emailForm(email)){
// 					alert("이메일 형식이 올바르지 않습니다."); 
// 					return;	
// 				}else {
// 					that.getUserByEmail(email);
// 				}
// 			});
			
// 			that.pt.find(".certification_email_btn").off("click").on("click",function(){
// 				that.authEmail();
// 			});
			
// 			that.pt.find(".check_code_btn").off("click").on("click",function(){
// 				var code = that.pt.find("input[name='code']").val();
// 				if(code == ""){
// 					alert("인증코드를 입력해주세요."); 
// 					return;
// 				} else {
// 					that.checkAuthCode(code);
// 				}
// 			});
			
			that.pt.find(".submit_btn").off("click").on("click",function(){
				var inputValue = {
						account: that.pt.find("input[name='account']").val(),
						password: that.pt.find("input[name='password']").val(),
						password2: that.pt.find("input[name='password_check']").val(),
						x_key: that.pt.find("input[name='key']").val(),
// 						name: that.pt.find("input[name='name']").val(),
// 						email: that.pt.find("input[name='email']").val(),
// 						usage_purpose: that.pt.find("input[name='usage_purpose']").val(),
// 						organization: that.pt.find("input[name=organization]:checked").val(),
// 						department: that.pt.find("input[name='department']").val(),
// 						path: that.pt.find("input[name='path']:checked").val(),
				};
				
				if(!validator.account(inputValue.account)){
					alert("아이디 중복확인을 해주세요."); return;
				}
				
				if(!validator.password(inputValue.password)){
					alert("비밀번호를 입력해주세요."); return;
				}
				
				if(!validator.password(inputValue.password2)){
					alert("비밀번호 확인을 입력해주세요."); return;
				}				
				
				if(!validator.key(inputValue.x_key)){
					alert("키를 입력해주세요."); return;
				}
				
				if(!validateID()){
					that.pt.find("input[name='account']").removeAttr("disabled");
					return;
				}
				
				if(!chkPwd(inputValue.password)){
					$("#upwd").val("");
					$("#infoPwd").html("");
					return;
				};
				
	   			if(inputValue.password != inputValue.password2){
	   				alert("비밀번호가 일치하지 않습니다.");
	   				that.pt.find("input[name='password_check']").val("");
	   				$("#infoPwdCheck").html("");
	   				that.pt.find("input[name='password_check']").focus();
	   				return;
	   			};				
				
				console.log("inputValue.x_key : " + inputValue.x_key);
// 				if(!validator.name(inputValue.name)){
// 					alert("이름을 입력해주세요."); return;
// 				}
				
// 				if(!validator.email(inputValue.email)){
// 					alert("이메일 중복확인을 해주세요."); return;
// 				}
				
// 				if(!validator.emailCertification(inputValue.email)){
// 					alert("이메일 인증을 해주세요."); return;
// 				}
				
				that.insertUser(inputValue);
			});
		},
		
		insertUser: function(inputValue){
			var that = this;
			//console.log("inputValue::", inputValue);
			$("#loader").show();
			// 암호화 로직
			var rsaPublicKeyModulus = $("#rsaPublicKeyModulus").val();
			var rsaPublicKeyExponent = $("#rsaPublicKeyExponent").val();
			
			var rsa = new RSAKey();
		    rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);

		    // 사용자ID와 비밀번호를 RSA로 암호화한다.
		    var securedAccount = rsa.encrypt(inputValue.account);
		    var securedPassword = rsa.encrypt(inputValue.password);
		    
			$.ajax({
			   	url :  baseUrl + "auth/insertUser.json",
/* 			   	data : {
			   		account: inputValue.account,
			   		password: inputValue.password,
			   		x_key: inputValue.x_key,
			   	}, */
			   	data : {
// 			   		account: inputValue.account,
// 			   		password: inputValue.password,
			   		account: securedAccount,
			   		password: securedPassword,
			   		x_key: inputValue.x_key
			   	},
			   	type : "POST",
			   	success : function(res){
					console.log("=====insertUser=====", res);
					if(res.result.code == "200"){
						$("#loader").hide();
						location.href = baseUrl + "joinResult";
					} else if(res.result.code == "743"){
						$("#loader").hide();
						alert(res.result.data)
					} else {
						$("#loader").hide();
						alert("회원가입이 정상적으로 이루어지지 않았습니다.\n다시 시도해주세요.");
// 						location.reload();
					}
			   	},
			   	error : function(err){
			   		 console.log("ERROR!!", err);
			   	}
			});
		},
		checkAccount: 0,
		checkEmail: 0,
		checkEmailCode: 0,
		getUserByAccount: function(account){
			var that = this;
			
			$.ajax({
			   	url :  baseUrl + "auth/getUserByAccount.json",
			   	data : {
			   		account: account
			   	},
			   	type : "POST",
			   	success : function(res){
					console.log("=====getUserByAccount=====", res);
					alert(res.result.data);
					
					if(res.result.code == "200"){
						that.checkAccount = 1;
						that.pt.find("input[name='account']").attr("disabled", true);
					} else {
						that.checkAccount = 0;
						that.pt.find("input[name='account']").val("");
					}
			   	},
			   	error : function(err){
			   		 console.log("ERROR!!", err);
			   	}
			});
		},
// 		getUserByEmail: function(email){
// 			var that = this;
			
// 			$.ajax({
// 			   	url :  baseUrl + "auth/getUserByEmail.json",
// 			   	data : {
// 			   		email: email
// 			   	},
// 			   	type : "POST",
// 			   	success : function(res){
// 			   		console.log("=====getUserByEmail=====", res);
// 					alert(res.result.data);
					
// 					if(res.result.code == "200"){
// 						that.checkEmail = 1;
// 						that.pt.find("input[name='email']").attr("disabled", true);
// 						that.pt.find(".certification_wrap").removeClass("hide");
// 					} else {
// 						that.checkEmail = 0;
// 						that.pt.find("input[name='email']").val("");
// 					}
					
// 			   	},
// 			   	error : function(err){
// 			   		 console.log("ERROR!!", err);
// 			   	}
// 			});
// 		},
// 		authEmail: function(){
// 			var that = this;
			
// 			$("#loader").fadeIn();
			
// 			$.ajax({
// 			   	url :  baseUrl + "auth/authEmail.json",
// 			   	data : {
// 			   		email: that.pt.find("input[name='email']").val()
// 			   	},
// 			   	type : "POST",
// 			   	success : function(res){
// 			   		console.log("=====authEmail=====", res);
// 			   		if(res.result.code == "200"){
// 						alert("인증메일이 발송되었습니다.\n메일 확인 후 인증번호를 입력해주세요.");
// 						that.pt.find(".certification_email_btn").addClass("disabled", true);
// 			   		} else {
// 			   			alert("인증메일이 발송에 실패하였습니다.\n다시 시도 해주세요.");
// 			   			return;
// 					}
// 			   		$("#loader").fadeOut();
// 			   	},
// 			   	error : function(err){
// 			   		 console.log("ERROR!!", err);
// 			   	}
// 			});
// 		},
// 		checkAuthCode: function(code){
// 			var that = this;
			
// 			$.ajax({
// 			   	url :  baseUrl + "auth/checkAuthCode.json",
// 			   	data : {
// 			   		code: code
// 			   	},
// 			   	type : "POST",
// 			   	success : function(res){
// 			   		console.log("=====checkAuthCode=====", res);
// 			   		if(res.result.code == "200"){
// 			   			alert("인증이 완료되었습니다.");
// 			   			that.checkEmailCode = 1;
// 			   		} else {
// 			   			alert("인증에 실패하였습니다. 다시 시도 해주세요.");
// 			   			that.pt.find(".certification_email_btn").removeClass("disabled", true);
// 			   			that.checkEmailCode = 0;
// 			   		}
// 			   	},
// 			   	error : function(err){
// 			   		 console.log("ERROR!!", err);
// 			   	}
// 			});
// 		},
	};


	var validator = {
			account: function(val){
				if(join.checkAccount == 0){
					return false;
				} else {
					return true;
				}
			},
			password: function(val){
				if(val < 5){
					return false;
				} else {
					return true;
				}
			},
			key: function(val){
				if(val == ""){
					return false;
				} else {
					return true;
				}
			},
// 			name: function(val){
// 				if(val == ""){
// 					return false;
// 				} else {
// 					return true;
// 				}
// 			},
// 			email: function(val){
// 				if(join.checkEmail == 0){
// 					return false;
// 				} else {
// 					return true;
// 				}
// 			},
// 			emailForm: function(val){
// 			    var emailReg=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
// 			    return emailReg.test(val);
// 			},
// 			emailCertification: function(val){
// 				if(join.checkEmailCode == 0){
// 					return false;
// 				} else {
// 					return true;
// 				}
// 			}
	}
</script>