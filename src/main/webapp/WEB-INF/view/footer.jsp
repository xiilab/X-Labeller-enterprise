<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	#footer  { }
	#footer .footer_1 { background-color: #e8eaf0; padding: 70px 0;   }
	#footer .footer_1 .sitemap { position: relative; width: 239px;     height: 180px; text-align: center;  }
	#footer .footer_1 .sitemap h3 { font-weight: 500; font-size: 18px; }
	#footer .footer_1 .sitemap:after {   position: absolute;  content: ''; width: 1px; height: 16px; background-color: #a0a0a0; height: 16px;  top: 24px; right: 0; }
	#footer .footer_1 .sitemap ul { margin-top: 40px; }
	#footer .footer_1 .sitemap li {  margin-bottom: 15px;}
	#footer .footer_1 .sitemap li > a {font-size: 16px;    color: #555; }
	
	#footer .footer_2 { padding: 40px 0;   }
	#footer .footer_2 a { margin-right: 40px; }
	#footer .footer_2 a:after {   content: ''; width: 1px;  height: 16px;   background-color: #a0a0a0;  height: 16px;  margin-top: 3px;   position: absolute;  margin-left: 20px; }
	#footer .footer_2 a:nth-child(3):after {   content: ''; width: 0px; }
	#footer .footer_2 a:hover { color:#005bab; }
	#footer .footer_2 .info { margin-top: 35px; }
	#footer .footer_2 .info p { color: #868686; }
	#footer .footer_2 .logo { margin-top: 50px;  margin-bottom: 30px; }
	
	#footer .footer_3 { background-color: #222126; line-height: 69px; }
	#footer .footer_3 .contents {font-size: 15px; color: #fff; opacity: 0.6; }

</style>


<footer id="footer">
	<div class="footer_1">
		<div class="w1200">
			<div class="contents flex">
				<div class="sitemap">
					<h3>AI 공유 플랫폼 소개</h3>
					<ul>
						<li><a href="<c:url value="/platform/introduce" />" >구성 및 이용방법</a></li>
						<li><a href="<c:url value="/platform/sitemap" />" >사이트맵</a></li>
					</ul>				
				</div>
				<div class="sitemap">
					<h3>데이터 공유</h3>
					<ul>
						<li><a href="<c:url value="/share/introduce" />" >AI 데이터 소개</a></li>
						<li><a href="<c:url value="/share/list" />">ETRI 데이터  공유</a></li>
					</ul>				
				</div>
				<div class="sitemap">
					<h3>데이터 가공</h3>
					<ul>
						<li><a href="<c:url value="/datatool" />">언어학습 데이터  가공 도구</a></li>
						<li><a href="<c:url value="/datatool?type=visual" />">시각학습 데이터 가공 도구</a></li>
					</ul>				
				</div>
				<div class="sitemap">
					<h3>ETRI 기술 소개</h3>
					<ul>
						<li><a href="">기술소개</a></li>
						<li><a href="">기술시연</a></li>
					</ul>				
				</div>
				<div class="sitemap">
					<h3>커뮤니티</h3>
					<ul>
						<li><a href="<c:url value="/notice/list" />" >공지사항</a></li>
						<li><a href="<c:url value="/ask/list" />" >문의하기</a></li>
						<li><a href="<c:url value="/faq/list" />" >FAQ</a></li>
					</ul>				
				</div>
			</div>
		</div>
	</div>
	<div class="footer_2">
		<div class="w1200">
			<div class="contents">
				<a href="">이용약관</a>
				<a href="">운영정책</a>
				<a href="">개인정보처리방침</a>
				<div class="info">
					<p>경기도 분당구 삼평동 696-1 판교글로벌 R&D센터 Otffice A동 2층~3층</p>
					<p>본 Open API서비스는 한국정보화진흥원과 ETRI가 공동으로 제공하는 서비스입니다.</p>
				</div>
				<div class="logo">
					<img class="logo" src="<c:url value="/images/img-logo.png" />">
				</div>
			</div>
		</div>
	</div>
	<div class="footer_3">
		<div class="w1200">
			<div class="contents t_center">COPYRIGHT © 2018 ETRI CORPORATION., ALL RIGHTS RESERVED.</div>
		</div>
	</div>
</footer>
	
	
		
<script>

</script>
