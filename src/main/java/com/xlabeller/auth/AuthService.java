package com.xlabeller.auth;

import com.xlabeller.common.module.*;
import com.xlabeller.models.EmailTemplateVO;
import com.xlabeller.models.JsonOutputVO;
import com.xlabeller.models.UserVO;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.regex.PatternSyntaxException;


@Service
public class AuthService {
	@Autowired
	private AuthDao authDao;

	@Autowired
	protected EmailSender emailSender;
	

	@Autowired
	private EmailTemplateVO emailTemplateVO;
	
	private String  ENCRYPT_CODE = "xiilabxiilabxiil";
	private static Logger logger = Logger.getLogger(AuthService.class);
	
	private Object exsitAccount(UserVO userVO) {
		//account 존재여부
		List<UserVO> exsitAccountList = authDao.getUserByAccount(userVO);
		if(exsitAccountList.size() != 0){
			return Output.JsonOutput("300", "이미 사용하는 계정이 있습니다");
		}
		return null;
	}
	
	
	
	public Object getUserByAccount(UserVO userVO){
		Object exsitObject = exsitAccount(userVO);
		if(exsitObject != null) {
			return exsitObject;
		}else {
			return Output.JsonOutput("200", "사용 가능한 계정입니다.");
		}
		
	}
	
	private Object checkKey(UserVO userVO) throws Exception {
		
		if(userVO.getX_key() == null || userVO.getX_key().length() <= 0) {
			return Output.JsonOutput("4061", "키를 입력하셔야 회원가입이 가능합니다.");
		}
		String key = userVO.getX_key();
		AES256Util au = null;
		try {
			au = new AES256Util(ENCRYPT_CODE);
		} catch(UnsupportedEncodingException e){
			logger.error("checkKey UnsupportedEncodingException Error!", e);
			return Output.JsonOutput("4091", "올바르지 않은 Key입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우, 관리자에게 문의해주시길 바랍니다.");
		} 
		
		String planeText = null;
		try {
			planeText = au.decrypt(key);
		} catch (NoSuchAlgorithmException e) {
			// 특정 암호화 알고리즘이 요청되었지만 환경에서 사용할 수 없는 경우 발생
			logger.error("key : " + key);
			logger.error("checkKey NoSuchAlgorithmException Error!", e);
			return Output.JsonOutput("4091", "올바르지 않은 Key입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우, 관리자에게 문의해주시길 바랍니다.");
		} catch (GeneralSecurityException e) {
			// 시큐리티 관련 예외 처리
			logger.error("key : " + key);
			logger.error("checkKey GeneralSecurityException Error!", e);
			return Output.JsonOutput("4091", "올바르지 않은 Key입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우, 관리자에게 문의해주시길 바랍니다.");
		} catch (UnsupportedEncodingException e) {
			// 입력된 문자의 인코딩을 지원하지 않을 때 발생
			logger.error("key : " + key);
			logger.error("checkKey UnsupportedEncodingException Error!", e);
			return Output.JsonOutput("4091", "올바르지 않은 Key입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우, 관리자에게 문의해주시길 바랍니다.");
		} 
		//회사명_종료일_10명 ex)xiilab_20200101_10P 
		
		if(planeText == null || planeText.length() <= 0) {
			return Output.JsonOutput("4071", "올바르지 않은 Key입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우, 관리자에게 문의해주시길 바랍니다.");
		}
		
		String[] infoArr = planeText.split("_");
		if(infoArr.length != 3) {
			return Output.JsonOutput("4071", "올바르지 않은 Key입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우, 관리자에게 문의해주시길 바랍니다.");
		}
		
		if(infoArr[1].length() != 8) {
			return Output.JsonOutput("4071", "올바르지 않은 Key입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우, 관리자에게 문의해주시길 바랍니다.");
		}
		
		if(infoArr[2].indexOf("P") != infoArr[2].length()-1 ) {
			return Output.JsonOutput("4071", "올바르지 않은 Key입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우, 관리자에게 문의해주시길 바랍니다.");
		}
		
		int count = 0;
		try {
			count = Integer.valueOf(infoArr[2].split("P")[0]);
		} catch (NumberFormatException e) {
			logger.error("checkKey NumberFormatException Error!", e); 
			return Output.JsonOutput("4091", "올바르지 않은 Key입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우, 관리자에게 문의해주시길 바랍니다.");
		}
		
		List<UserVO> userList = authDao.getUserByKey(userVO);
		
		if(userList.size() >= count) {
			return Output.JsonOutput("300", "해당 키로 등록가능한 인원이 초과하였습니다.");			
		}
		
		au = null;
		return Output.JsonOutput("200", planeText);
	}
	
	private boolean getExpiryDateByKey(String key) {
 		AES256Util au;
 		String planeText = null;
 		SimpleDateFormat transFormat = null;
 		Date expiryDate = null;
 		String nowStrDate = null;
 		Date nowDate = null;
 		try {
 			au = new AES256Util(ENCRYPT_CODE);
 		
 			planeText = au.decrypt(key);
 			//회사명_종료일_10명 ex)xiilab_20200101_10P 
 			if(planeText == null || planeText.length() <= 0 || planeText.length() < 2) {
 				logger.error("getExpiryDateByKey plneText Error! planeText : " + planeText);
 				return false;
 			}
 			String strDate = planeText.split("_")[1];
 			if(strDate.length() != 8) {
 				logger.error("getExpiryDateByKey strDate Error! strDate : " + strDate);
 				return false;
 			}
 			transFormat = new SimpleDateFormat("yyyyMMdd",Locale.KOREA);
 			
 			nowDate = new Date();
 			nowStrDate = transFormat.format(nowDate);
 			
 			expiryDate = transFormat.parse(strDate);
 			nowDate = transFormat.parse(nowStrDate);

 			int compare = expiryDate.compareTo(nowDate);
 			
 			if(compare < 0 ) {
 				return false;
 			}
 			
			return true;
 		
 		} catch(Exception e) {
 			if(e instanceof PatternSyntaxException) {
 	 			logger.error("planeText : " + planeText);
 	 			logger.error("checkKey PatternSyntaxException Error!", e);
 	 			return false;
 			} else if(e instanceof NoSuchAlgorithmException) {
 	 			// 특정 암호화 알고리즘이 요청되었지만 환경에서 사용할 수 없는 경우 발생
 	 			logger.error("key : " + key);
 	 			logger.error("checkKey NoSuchAlgorithmException Error!", e);
 	 			return false;
 			} else if(e instanceof GeneralSecurityException) {
 	 			// 시큐리티 관련 예외 처리
 	 			logger.error("key : " + key);
 	 			logger.error("checkKey GeneralSecurityException Error!", e);
 	 			return false;
 			} else if(e instanceof UnsupportedEncodingException) {
 	 			// 입력된 문자의 인코딩을 지원하지 않을 때 발생
 	 			logger.error("key : " + key);
 	 			logger.error("checkKey UnsupporstedEncodingException Error!", e);
 	 			return false;
 			} else if(e instanceof ParseException) {
 	 			// 파싱 과정에서 에러가 생겼을 때 발생
 	 			logger.error("key : " + key);
 	 			logger.error("expiryDate : " + expiryDate);
 	 			logger.error("nowStrDate : " + nowStrDate);
 	 			logger.error("checkKey UnsupportedEncodingException Error!", e);
 	 			return false;
 			} else if(e instanceof IllegalArgumentException) {
 	 			// 부적절한 인수를 메서드에 전달했을 때 발생
 	 			logger.error("key : " + key);
 	 			logger.error("checkKey UnsupportedEncodingException Error!", e);
 	 			return false;
 			} else if(e instanceof NullPointerException) {
 	 			// 부적절한 인수를 메서드에 전달했을 때 발생
 	 			logger.error("key : " + key);
 	 			logger.error("nowDate : " + nowDate);
 	 			logger.error("checkKey NullPointerException Error!", e);
 	 			return false;
 			} else {
 	 			logger.error("Exception Error!", e);
 	 			return false;
 			}
 		} finally {
 			au = null;
 			transFormat = null;
 			expiryDate = null;
 			nowStrDate = null;
 			nowDate = null;
 		}
 		

	}
	
	
	 
	
	public Object insertUser(UserVO userVO, HttpSession session) throws Exception {
		Object exsitObject = exsitAccount(userVO);
		if(exsitObject != null) {
			return exsitObject;
		}
		
		List<UserVO> userList = authDao.getUserByAccount(userVO);
		if(userList == null || userList.size() > 0) {
			return Output.JsonOutput("300", "이미 사용중인 ID입니다.\n다른 ID로 가입해주세요.");
		}
		
		//인증키 확인모듈
		JsonOutputVO checkObj = (JsonOutputVO)checkKey(userVO);
		if(!checkObj.getCode().equals("200")) {
			return checkObj;
		}
		
		/*암호화*/
		userVO.setPassword(Utils.encryptPassword(userVO.getPassword()));
		int cnt = authDao.insertUser(userVO);
		if(cnt != 1){
			return Output.JsonOutput("4001", "올바른 등록을 수행해주세요");
		}
		
		return Output.JsonOutput("200", "등록완료");
    }
		
	public Object loginUser(UserVO userVO, HttpSession session) {
		
		/*암호화*/
		userVO.setPassword(Utils.encryptPassword(userVO.getPassword()));
		
		UserVO userInfo = authDao.getUserByAccountPassword(userVO);
		UserVO chageUserVO = new UserVO();
		int updateCnt = 0;
		if(userInfo != null){
			
			if(!getExpiryDateByKey(userInfo.getX_key())) {
				return Output.JsonOutput("4071","해당 접속 계정이 만료 되었거나, 올바르지 않은 인증키입니다.");
			}
			
			session.setAttribute("userInfo", userInfo);
			chageUserVO.setUser_id(userInfo.getUser_id());
			chageUserVO.setLogin_count("0");
			updateCnt = authDao.updateUser(chageUserVO); 
			
			return Output.JsonOutput("200",userInfo);
		} else {
			List<UserVO> user = authDao.getUserByAccount(userVO);
			if(user == null || user.isEmpty() || user.get(0).getUser_id() == null || user.get(0).getUser_id().length() <= 0) {
				return Output.JsonOutput("300","가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
			}
			userVO.setUser_id(user.get(0).getUser_id());
			UserVO loginUserVO = authDao.getUserById(userVO);
			if(loginUserVO != null && loginUserVO.getLogin_count() != null && loginUserVO.getLogin_count().length() > 0) {
				if(!(loginUserVO.getLogin_count().equals("5"))) {
					updateCnt = authDao.updateLoginCount(loginUserVO);
					return Output.JsonOutput("300","가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
				} else {
					return Output.JsonOutput("300","로그인을 5회 이상 실패해 계정잠금 상태로 전환되었습니다.\n잠금해제를 원하실 경우 관리자에게 문의해주시길 바랍니다.");
				}
			}
			
		}
		return Output.JsonOutput("300","로그인이 올바르지 않습니다. 다시 시도해주시기 바랍니다.");
	}
	
	public Object getSession() {
		UserVO UserInfo = SessionUtil.getUserInfo();
		if(UserInfo != null){
			return Output.JsonOutput("200",UserInfo);
			
		}
		return Output.JsonOutput("310", "Empty Login Session");
		
	}
	

	
	
	public Object logout(HttpSession session) {
		
		session.setAttribute("userInfo", null);
		session.invalidate();
		return Output.JsonOutput("200","Logout");
	}
	
	
	

	public Object updateUser(UserVO userVO, HttpSession session) throws Exception {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("261","올바르지 않은 접근입니다");
		}
		
//		// 비밀번호 유효성 검사식1 : 숫자, 특수문자가 포함
//		String regExp_symbol = "([0-9].*[!,@,#,^,&,*,(,)])|([!,@,#,^,&,*,(,)].*[0-9])";
//		// 비밀번호 유효성 검사식 2 : 영문자 대소문자 하나라도 포함되어 있는지 확인
//		String regExp_alpha = "([a-z].*[A-Z])|([A-Z].*[a-z])"; 
//		
//		Pattern pattern_symbol = Pattern.compile(regExp_symbol);
//		Pattern pattern_alpha = Pattern.compile(regExp_alpha);
//		
//
//		Matcher matcher_symbol = pattern_symbol.matcher(userVO.getPassword());
//		Matcher matcher_alpha = pattern_alpha.matcher(userVO.getPassword());
//		
//		if(matcher_symbol.find() && matcher_alpha.find()) {
//			return Output.JsonOutput("245", "유효하지 않은 비밀번호입니다.\n영문 대 소문자, 특수문자, 숫자를 조합하여 8~20자 이내로 입력해주세요.");
//		}
		
		//인증키 확인모듈
//		if(userVO.getX_key() != null && !userVO.getX_key().equals("") ) {
		if(userVO.getX_key() != null && !(userVO.getX_key().length() <= 0) ) {
			JsonOutputVO checkObj = (JsonOutputVO)checkKey(userVO);
			if(checkObj.getCode() != null && !checkObj.getCode().equals("200")) {
				return checkObj;
			}
		}else{
			userVO.setX_key("");
		}
		
		userVO.setUser_id(userInfo.getUser_id());
		
//		if(userVO.getPassword() != null && !userVO.getPassword().equals("")) {
		if(userVO.getPassword() != null && !(userVO.getPassword().length() <= 0)) {
			/*암호화*/
			userVO.setPassword(Utils.encryptPassword(userVO.getPassword()));
		}
		
		int cnt = authDao.updateUser(userVO);
		if(cnt != 1){
			return Output.JsonOutput("262", "올바른 수행해주세요");
		}
		
		
		UserVO afterUserInfo = authDao.getUserById(userVO);
		session.setAttribute("userInfo", afterUserInfo);
		
		return Output.JsonOutput("200", "변경완료");
    }
	
	public Object getRegKey(UserVO userVO){
//		AES256Util au;
//		try {
//			au = new AES256Util(ENCRYPT_CODE);
//		
//			if(!userVO.getAccount().equals("xiilab")) {
//				return Output.JsonOutput("300", "올바르지 않은 접근");
//			}
//			if(!userVO.getPassword().equals("xiirocks123!@")) {
//				return Output.JsonOutput("300", "올바르지 않은 접근");
//			}
//			
//			String key = au.encrypt(userVO.getX_key());
//			
//			return Output.JsonOutput("200", key);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return Output.JsonOutput("301", "에러");
//		} finally {
//			au = null;
//		}
		
		// j.seo 수정
		AES256Util au;
		try {
			au = new AES256Util(ENCRYPT_CODE);
		
			if(!userVO.getAccount().equals("xiilab")) {
				return Output.JsonOutput("300", "올바르지 않은 접근");
			}
			if(!userVO.getPassword().equals("xiirocks123!@")) {
				return Output.JsonOutput("300", "올바르지 않은 접근");
			}
			
			String key = au.encrypt(userVO.getX_key());
			
			return Output.JsonOutput("200", key);
		} catch (NoSuchAlgorithmException e) {
 			// 특정 암호화 알고리즘이 요청되었지만 환경에서 사용할 수 없는 경우 발생
 			logger.error("getRegKey NoSuchAlgorithmException Error!", e);
 			return Output.JsonOutput("301", "에러");
 		} catch (GeneralSecurityException e) {
 			// 시큐리티 관련 예외 처리
 			logger.error("getRegKey GeneralSecurityException Error!", e);
 			return Output.JsonOutput("301", "에러");
 		} catch (UnsupportedEncodingException e) {
 			// 입력된 문자의 인코딩을 지원하지 않을 때 발생
 			logger.error("getRegKey UnsupporstedEncodingException Error!", e);
 			return Output.JsonOutput("301", "에러");
 		} finally {
 			au = null;
 		}
    }
	
    
}