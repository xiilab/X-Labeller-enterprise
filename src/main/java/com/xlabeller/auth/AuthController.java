package com.xlabeller.auth;

import com.xlabeller.models.JsonOutputVO;
import com.xlabeller.models.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.crypto.Cipher;
import javax.servlet.http.HttpSession;
import java.security.PrivateKey;



@Controller
@RequestMapping("/auth")
public class AuthController {
 
	@Autowired
	private AuthService authService;  
	
	/**
	 * 유저 등록
	 * INPUT : 
	 * 		account(계정명)
	 * 		password(패스워드) 
	 * OUTPUT : 
	 * 		
	 **/
	@RequestMapping("/insertUser")
	public Object insertUser(UserVO userVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		//RSA 복호화
		PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_KEY_");
//		session.removeAttribute("_RSA_WEB_KEY_"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.
			
		if (privateKey == null) {
		    throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
		}
//		Object result;
		try {
		    String account = decryptRsa(privateKey, userVO.getAccount());
		    String password = decryptRsa(privateKey, userVO.getPassword());
		    String x_key = userVO.getX_key();
		    UserVO loginUserVO = new UserVO();
		    loginUserVO.setAccount(account);
		    loginUserVO.setPassword(password);
		    loginUserVO.setX_key(x_key);
		    JsonOutputVO result = (JsonOutputVO)authService.insertUser(loginUserVO, session);
//		    if(result != null && result.getCode().equals("200")) {
//		    	session.removeAttribute("_RSA_WEB_KEY_"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.
//		    }
			modelAndView.addObject("result",  result);
			return modelAndView;		
		    
		} catch (Exception ex) {
			return "redirect:/error";
		}
	}
	
	/**
	 * 유저 로그인 
	 * INPUT :
	 * 		page_num
	 * 		page_size
	 * OUTPUT :
	 * 
	 **/
	@RequestMapping("/loginUser")
	public Object loginUser(UserVO userVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		//RSA 복호화
		PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_KEY_");
		
		if (privateKey == null) {
		    throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
		}
		try {
		    String account = decryptRsa(privateKey, userVO.getAccount());
		    String password = decryptRsa(privateKey, userVO.getPassword());
		    UserVO loginUserVO = new UserVO();
		    loginUserVO.setAccount(account);
		    loginUserVO.setPassword(password);
		    JsonOutputVO result = (JsonOutputVO) authService.loginUser(loginUserVO, session);
//		    if(result.getCode() != null && result.getCode().equals("200")) {
//		    	session.removeAttribute("_RSA_WEB_KEY_"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.
//		    }
			modelAndView.addObject("result",  result);
			return modelAndView;		
		    
		} catch (Exception ex) {
			return "redirect:/error";
		}
	}
	
	/**
	 * 계정명 중복검사
	 * INPUT :
	 * 		account(계정명)
	 * OUTPUT : 
	 * 		
	 **/
	@RequestMapping("/getUserByAccount")
	public ModelAndView getUserByAccount(UserVO userVO) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result = authService.getUserByAccount(userVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	
	
	
	/**
	 * 로그아웃
	 * INPUT :
	 * OUTPUT :
	 * 
	 **/
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = authService.logout(session);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	/**
	 * 세션가져오기
	 * INPUT : 
	 * OUTPUT :
	 * 
	 **/
	@RequestMapping("/getSession")
	public ModelAndView getSession(UserVO userVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result = authService.getSession();
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	/**
	 * 내 정보 수정
	 * INPUT :
	 * 		password 
	 * OUTPUT :
	 * 
	**/
	@RequestMapping("/updateUser")
	public Object updateUser(UserVO userVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
//		Object result;
//		try {
//			result = authService.updateUser(userVO, session);
//		} catch (Exception e) {
//			e.printStackTrace();
//			String errMsg = e.getMessage();
//			if(errMsg==null){
//				result = Output.JsonOutput("9000", "네트워크가 불안정합니다. 지속적으로 발생시 문의 부탁드립니다");
//			}else if( (errMsg.split("#")).length != 2 ){
//				result = Output.JsonOutput("9001", "네트워크가 불안정합니다. 지속적으로 발생시 문의 부탁드립니다");
//			}else{
//				String[] errMsgArr = errMsg.split("#");
//				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
//			}
//		}
		
		//RSA 복호화
		PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_KEY_");
		
		if (privateKey == null) {
		    throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
		}
		try {
		    //String account = decryptRsa(privateKey, userVO.getAccount());
		    String password = decryptRsa(privateKey, userVO.getPassword());
		    UserVO loginUserVO = new UserVO();
		   // loginUserVO.setAccount(account);
		    loginUserVO.setPassword(password);
		    JsonOutputVO result = (JsonOutputVO) authService.updateUser(loginUserVO, session);
		    if(result.getCode() != null && result.getCode().equals("200")) {
		    	session.removeAttribute("_RSA_WEB_KEY_"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.
		    }
			modelAndView.addObject("result",  result);
			return modelAndView;		
		    
		} catch (Exception ex) {
			return "redirect:/error";
		}
		
		
//		modelAndView.addObject("result",  result);
//		return modelAndView;
	
	}
	
	/*
	 키발급용
	 사용하지 말것.
	 */
	
	/**
	 * 키발급용(사용금지)
	**/
	@RequestMapping("/getRegKey")
	public ModelAndView getRegKey(UserVO userVO) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result = authService.getRegKey(userVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	
	private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
        System.out.println("will decrypt : " + securedValue);
        Cipher cipher = Cipher.getInstance("RSA");
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
        return decryptedValue;
    }

    /**
     * 16진 문자열을 byte 배열로 변환한다.
     */
    public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) {
            return new byte[]{};
        }

        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
    }
 
	
	
}