package com.xlabeller.models;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class EmailTemplateVO {
	private String code;
	private String vaddr_btc;
	private String vaddr_eth;
	private String url;
	
	
	public String getVaddr_btc() {
		return vaddr_btc;
	}



	public void setVaddr_btc(String vaddr_btc) {
		this.vaddr_btc = vaddr_btc;
	}



	public String getVaddr_eth() {
		return vaddr_eth;
	}



	public void setVaddr_eth(String vaddr_eth) {
		this.vaddr_eth = vaddr_eth;
	}



	public String getUrl() {
		return url;
	}



	public void setUrl(String url) {
		this.url = url;
	}
	@Value("#{globalProperty['domain.address']}")
	private String domain;
	
	
	public String getDomain() {
		return domain;
	}



	public void setDomain(String domain) {
		this.domain = domain;
	}



	public String getCode() {
		return code;
	}



	public void setCode(String code) {
		this.code = code;
	}



	public String makeConfirm() {
		String html = "<html>\n" + 
				"	<body>\n" + 
				"		<div class='email-wrap' style='padding:40px;border:1px solid #eeeeee;width:700px;'>\n" + 
				"			<div class='e_header'>\n" + 
				"				<div class='header-img'>\n" + 
				"					<div style='background-image:url("+getDomain()+"images/img-logo.png);width:128px;height:43px' ></div>\n" + 
				"				</div>\n" + 
				"			</div>\n" + 
				"			<div class='e_contents' style='padding:40px;border:1px solid #eeeeee;margin-top:20px'>\n" + 
				"				<div style='font-size:20px;color: #008bed;font-weight:normal'>회원가입 이메일 인증</div>\n" + 
				"				<div style='border:1px solid #eeeeee;width:100%;margin-top:15px'></div>\n" + 
				"				<div style='font-size:14px; color: #333333; font-weight:normal; line-height:30px; margin-top:20px'>\n" + 
				"					안녕하세요. 회원가입을 진행해주셔서 감사드립니다<br>\n" + 
				"					아래의 인증코드를 복사하여 회원가입을 완료부탁드립니다.\n" + 
				"				</div>\n" + 
				"				<div style='font-size:16px;font-weight:bold;margin-top:20px'>인증코드 : "+getCode()+"</div>\n" + 
				"			</div>\n" + 
				"			<div class='e_footer' style='margin-top:10px;font-size:12px;color:#868686;line-height:25px'>\n" + 
				"				경기도 분당구 삼평동 696-1 판교글로벌 R&D센터 Office A동 2층~3층<br>\n" + 
				"				본 Open API서비스는 한국정보화진흥원과 ETRI가 공동으로 제공하는 서비스입니다.<br>\n" + 
				"				COPYRIGHT © 2018 ETRI CORPORATION., ALL RIGHTS RESERVED.\n" + 
				"			</div>\n" + 
				"		</div>\n" + 
				"	</body>\n" + 
				"</html>\n" + 
				"";
				
		
				
		return html;
				
		
	}
	
	
	
	public String makePasswordReset() {
		String html = "<html>\n" + 
				"	<body>\n" + 
				"		<div class='email-wrap' style='padding:40px;border:1px solid #eeeeee;width:700px;'>\n" + 
				"			<div class='e_header'>\n" + 
				"				<div class='header-img'>\n" + 
				"					<div style='background-image:url("+getDomain()+"images/img-logo.png);width:128px;height:43px' ></div>\n" + 
				"				</div>\n" + 
				"			</div>\n" + 
				"			<div class='e_contents' style='padding:40px;border:1px solid #eeeeee;margin-top:20px'>\n" + 
				"				<div style='font-size:20px;color: #008bed;font-weight:normal'>비밀번호 재설정</div>\n" + 
				"				<div style='border:1px solid #eeeeee;width:100%;margin-top:15px'></div>\n" + 
				"				<div style='font-size:14px; color: #333333; font-weight:normal; line-height:30px; margin-top:20px'>\n" + 
				"					안녕하세요. 비밀번호 재설정 요청에 따라 이메일로<br>\n" + 
				"					비밀번호 재설정을 진행합니다<br>\n" + 
				"					아래 URL로 이동하셔서 비밀번호 재설정을 진행부탁드립니다\n" + 
				"				</div>\n" + 
				"				<div style='font-size:16px;font-weight:bold;margin-top:20px'>URL : <a href='"+getUrl()+"' style='color:#ff403b' >"+getUrl()+"</a></div>\n" + 
				"			</div>\n" + 
				"			<div class='e_footer' style='margin-top:10px;font-size:12px;color:#868686;line-height:25px'>\n" + 
				"				경기도 분당구 삼평동 696-1 판교글로벌 R&D센터 Office A동 2층~3층<br>\n" + 
				"				본 Open API서비스는 한국정보화진흥원과 ETRI가 공동으로 제공하는 서비스입니다.<br>\n" + 
				"				COPYRIGHT © 2018 ETRI CORPORATION., ALL RIGHTS RESERVED.\n" + 
				"			</div>\n" + 
				"		</div>\n" + 
				"	</body>\n" + 
				"</html>\n" + 
				"";
				
		return html;
				
		
	}
	
	
	
	
}

