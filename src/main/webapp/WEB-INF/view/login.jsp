<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/header"  flush="false" />
<head>
	<title>X-labeller</title>
	
	<style>
		@media screen and (min-width: 1800px){
			/* #login .logo_img { background: url('images/img_login_big.png') no-repeat center; } */
			#login .logo_img { background: url('images/img_login_big_milnet.png') no-repeat center; }
		}
		@media screen and (max-width: 1800px){
			/* #login .logo_img { background: url('images/img_login_normal.png') no-repeat center; } */
			#login .logo_img { background: url('images/img_login_big_milnet.png') no-repeat center; }
			
		}
		
		#header { display: none; }
	
		#login { width: 100%; height: 100%; font-family: Open_Sans; font-size: 13px; color: #555555; }
		#login .min_w1440 { height: 100%; }
		#login .contents { height: 100%; }
		/* 기본 */
		#login .logo_wrap { width: 65%; height: 100%; background-color: #2184ff; color: #ffffff; }
		#login .logo_title { margin: 41px 44px; width: 190px; height: 19px; background: url('images/img-logo-milnet.png') no-repeat center; } 
		/* #login .logo_title { margin: 41px 44px; width: 108px; height: 29px; background: url('images/img-logo-x-labeller-copy-2.png') no-repeat center; } */ 
		/* */
		/*성모*/
		/* #login .logo_wrap { width: 65%; height: 100%; background-color: #2184ff; background-color : #fd6500; color: #ffffff; } 
		#login .logo_title { width: 221px; height: 64px; text-align: center; background: url('images/sungmo_logo.png') no-repeat center; cursor: pointer; background-size : contain; margin-top : 20px;} */ 
		/**/
		/* 위자드랩 */
		 /* #login .logo_wrap { width: 65%; height: 100%; background-color: #1440B7; color: #ffffff; } */
		/* #login .logo_title { width: 221px; height: 64px; text-align: center; background: url('images/wizardlab_logo.png') no-repeat center; cursor: pointer; background-size : contain; margin-top : 20px; margin-left : 25px;} */
		/* */
		/* #login .logo_title { width: 221px; height: 64px; text-align: center; background: url('images/wizardlab_logo.png') no-repeat center; cursor: pointer; background-size : contain; margin-top : 20px; margin-left : 25px;}  */
		#login .logo_title .rect { width: 20px; height: 20px; margin-right: 8px; display: inline-block; border-radius: 5px; background-color: #f9f9f9; }
		#login .logo_img { height: calc(100% - 151px); }
		#login .logo_footer { padding-left: 44px; line-height: 40px; background-image: linear-gradient(94deg, #0076f9, #176aff 12%, #1351c9); font-size: 12px; }
		#login .logo_footer span { font-weight: 500; }
		
		#login .login_wrap { width: 320px; margin: 0 auto; }
		#login .page_title { font-size: 40px; font-weight: 200; color: #4c84ff; padding-top: 0; padding-bottom: 27px; text-align: center; }
		#login .input_wrap { margin-bottom: 16px; position: relative; }
		#login .input_wrap input { width: 320px; font-family: Open_Sans; font-weight: 300; }
		#login .btn_wrap { margin-top: 83px; text-align: center; font-weight: 200; }
		#login .submit_btn { width: 320px; height: 48px; border-radius: 23px; box-shadow: 0 4px 8px 0 #b4d7ff; background-color: #218aff; color: #ffffff; margin-bottom: 15px; font-weight: 300; }
		#login .btn_wrap a { color: #4c84ff; }
		
		#login .keep_login {  width: auto; font-size: 12px; font-weight: 200; }
		#login .keep_login .checkBox { margin-right: 6px; }
		#login .find_id { font-size: 12px; font-weight: 200; }
 		#login .find_password { font-size: 12px; color: #555555; font-weight: 200; }
 		#login .line { width: 1px; height: 12px; background-color: #d8d8d8; margin: 2px 8px; }
/* 		#login .join {  width: 80px; } */
		#login .xlabeller_a { color: #4c84ff; }
		
		<!-- 필요하면 제거 -->
		/* #login .change_back_color {background-color : #fd6500; !important}
		#login .change_color {color : #fd6500; !important}
		#login .change_filter { filter: saturate(200%) hue-rotate(180deg) !important; }
		#login .change_footer_color { background-image: linear-gradient(94deg, #fd6500, #fd6500 12%, #fd6500); } */
		<!-- -->
		
	</style>
	<script src="<c:url value="/js/rsa/jsbn.js" />"></script>
	<script src="<c:url value="/js/rsa/rsa.js" />"></script>
	<script src="<c:url value="/js/rsa/prng4.js" />"></script>
	<script src="<c:url value="/js/rsa/rng.js" />"></script>
	
	

</head>
<body>
	
	<div class="container" id="login">
		<div class="min_w1440">
			<div class="contents flex">
				<div class="logo_wrap change_color">
					<div class="logo_title change_back_color"></div>
					<div class="logo_img change_filter"></div>
					<div class="logo_footer change_footer_color">Copyright ⓒ <span>Xiilab Corp.</span> All Rights Reserved.</div>
				</div>
				<div class="login_wrap ">
					<input type="hidden" id="rsaPublicKeyModulus" value="<%=request.getAttribute("publicKeyModulus")%>" />
            		<input type="hidden" id="rsaPublicKeyExponent" value="<%=request.getAttribute("publicKeyExponent")%>" />
					
					<div class="page_title change_color">Login</div>
					<div class="input_wrap flex">
						<input class="" type="text" id="uid" name="account" placeholder="ID" maxlength="15">
					</div>
					
					<div class="input_wrap flex">
						<input class="" type="password" id="upwd" name="password" placeholder="Password">
					</div>
					
					<div class="input_wrap change_filter" style="justify-content: space-between;">
						<div class="keep_login fl flex"><div class="checkBox"></div><span>Save Account</span></div>
						<div class="find_password fr">
<%-- 						<a href="<c:url value="/join" />"> --%>
							Forgot Password?
<!-- 						</a> -->
						</div>
						<div class="line fr"></div>
						<div class="find_id fr">
<%-- 						<a class="" href="<c:url value="/findPassword" />"> --%>
							Forgot ID?
<!-- 						</a> -->
						</div>
					</div>
					
					<div class="btn_wrap change_filter">
						<button class="btn submit_btn">Login</button>
						<div>
							Don't have <span class="xlabeller_a">X-labeller</span> account? <a href="<c:url value="/join"/>">Sign up</a>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
<%-- 	<jsp:include page="/footer"  flush="false" />		 --%>
	
</body>
<script>
	$(document).on("sessionLoad", function() {
		login.init();
	});

	var login = {
		pt: $("#login"),
		init: function(){
			var that = this;
			
			// 뒤로가기, URL 접근 등을 통해 로그인세션이 있음에도 로그인 페이지에 접근한 경우 메인화면으로 리턴
			if(loginUserInfo.data){
				location.href = baseUrl + "main";
			}
			
			// ID 쿠키 저장
			var userInputId = getCookie("userInputId");
			$("input[name='account']").val(userInputId);
			
			var userInputPwd = getCookie("userInputPwd");
			$("input[name='password']").val(userInputPwd);
			
			if($("input[name='account']").val() != "" && $("input[name='password']").val() != ""){
				$(".keep_login .checkBox").addClass("selected");
			}
			that.listener();
		},
		
		listener: function(){
			var that = this;
			
			that.pt.find(".submit_btn").off("click").on("click",function(){
				var inputValue = {
						account: that.pt.find("input[name='account']").val(),
						password: that.pt.find("input[name='password']").val(),
				};
				
				if(inputValue.account == ""){
					alert("ID를 입력해주세요"); 
					that.pt.find("input[name='account']").focus();
					
					return;
				}
				
				if(inputValue.password == ""){
					alert("비밀번호를 입력해주세요"); 
					that.pt.find("input[name='password']").focus();
					
					return;
				}
		
				that.loginUser(inputValue);
			});
			
			
			that.pt.find("input[name='password']").keydown(function (key) {
		        if(key.keyCode == 13){
		        	that.pt.find(".submit_btn").trigger("click");
		        }
		    });
			
			
			that.pt.find(".keep_login .checkBox").off("click").on("click", function(){
				$(this).toggleClass("selected");
			});
			
		},
		
		loginUser: function(inputValue){
			var that = this;
			
			$("#loader").show();
			// 로그인정보 유효성 예외처리 수행해주세요.
			
			// 암호화 로직
			var rsaPublicKeyModulus = $("#rsaPublicKeyModulus").val();
			var rsaPublicKeyExponent = $("#rsaPublicKeyExponent").val();
			
			var rsa = new RSAKey();
		    rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);

		    // 사용자ID와 비밀번호를 RSA로 암호화한다.
		    var securedAccount = rsa.encrypt(inputValue.account);
		    var securedPassword = rsa.encrypt(inputValue.password);
			
			$.ajax({
			   	url :  baseUrl + "auth/loginUser.json",
			   	data : {
// 			   		account: inputValue.account,
// 			   		password: inputValue.password,
			   		account: securedAccount,
			   		password: securedPassword,
			   	},
			   	type : "POST",
			   	success : function(res){
					console.log("=====loginUser=====", res);
					if(res.result.code == "200"){
// 						location.href = baseUrl + "main";
						$("#loader").hide();
						if(document.referrer.indexOf("join")>-1 || document.referrer.indexOf("findPassword")>-1  || document.referrer.indexOf("reset")>-1 || document.referrer.indexOf("mypage")>-1 || document.referrer.indexOf("login")>-1 ) location.href = baseUrl + "main";
						/* else if(document.referrer != null && typeof document.referrer != "undefined" && document.referrer != "") location.href = document.referrer; */
						else if(document.referrer != null && typeof document.referrer != "undefined" && document.referrer != "") location.href = baseUrl + "main";
						else location.href = baseUrl + "main";
						that.saveAccount();
					} else {
						alert(res.result.data);
						$("#loader").hide();
					}
			   	},
			   	error : function(err){
			   		 $("#loader").hide(); 
			   		 console.log("ERROR!!", err);
			   	}
			});
		},
		
		saveAccount: function(){
			var that = this;
			var save_account = that.pt.find(".keep_login .checkBox");
			
			if(save_account.hasClass("selected")){
				var userInputId = $("input[name='account']").val();
				var userInputPwd = $("input[name='password']").val();
				setCookie("userInputId", userInputId, 365);
				setCookie("userInputPwd", userInputPwd, 365);
			} else {
				deleteCookie("userInputId");
				deleteCookie("userInputPwd");
			};
		},
		
		setCookie: function(cookieName, value, exdays) {
			var that = this;
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires" + exdate.toGMTString());
			document.cookie = cookieName + cookieName + "=" + cookieValue;
		},
		
		deleteCookie: function(cookieName){
			var that = this;
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1); // 어제 날짜를 쿠키 소멸 날짜로 설정
			document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		},
		
		getCookie: function(cookieName){
			var that = this;
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookicName);
			var cookieValue = '';
			if(start != -1){
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if(end == -1)end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}
		
	};


</script>