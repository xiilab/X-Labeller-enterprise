package com.xlabeller.common.module;

import com.xlabeller.models.UserVO;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

/**
 * session Util
 * - Spring에서 제공하는 RequestContextHolder 를 이용하여
 * request 객체를 service까지 전달하지 않고 사용할 수 있게 해줌
 *
 */
public class SessionUtil {
	
	private static HashMap<String, HttpSession> sessionMap = new HashMap<String, HttpSession>();
	private static HashMap<String, String> sessionToIdMap = new HashMap<String, String>();
	
	public static void putSessionMap(String id,HttpSession session) {
		if(sessionMap.get(id) != null) {
			sessionMap.get(id).setAttribute("userInfo", null);
			sessionMap.get(id).invalidate();
			
			if(sessionMap.get(id)!= null) {
				sessionMap.remove(id);
			}
			if(sessionToIdMap.get(session.getId())!= null) {
				sessionToIdMap.remove(session.getId());
			}
			
			
			
			
		}
		
		sessionMap.put(id, session);
		sessionToIdMap.put(session.getId(),id);
	}
	
	public static boolean checkSessionMap(String id,HttpSession session) {
		if(sessionMap.get(id) != null && ((UserVO)sessionMap.get(id).getAttribute("userInfo")).getUser_id().equals(id) && sessionMap.get(id).getId().equals(session.getId())  ) {
			return true;
		}
		return false;
	}
	
	public static void releaseSessionMap(HttpSession session) {
		String id = sessionToIdMap.get(session.getId());
		
		session.setAttribute("userInfo", null);
		session.invalidate();
		if(sessionMap.get(id)!= null) {
			sessionMap.remove(id);
		}
		if(sessionToIdMap.get(session.getId())!= null) {
			sessionToIdMap.remove(session.getId());
		}
		
	
		
	}
	
	
	
	
    /**
     * attribute 값을 가져 오기 위한 method
     *
     * @param String  attribute key name
     * @return Object attribute obj
     */
    public static Object getAttribute(String name) throws Exception {
        return (Object)RequestContextHolder.getRequestAttributes().getAttribute(name, RequestAttributes.SCOPE_SESSION);
    }

    /**
     * attribute 설정 method
     *
     * @param String  attribute key name
     * @param Object  attribute obj
     * @return void
     */
    public static void setAttribute(String name, Object object) throws Exception {
        RequestContextHolder.getRequestAttributes().setAttribute(name, object, RequestAttributes.SCOPE_SESSION);
    }

    /**
     * 설정한 attribute 삭제
     *
     * @param String  attribute key name
     * @return void
     */
    public static void removeAttribute(String name) throws Exception {
        RequestContextHolder.getRequestAttributes().removeAttribute(name, RequestAttributes.SCOPE_SESSION);
    }

    /**
     * session id
     *
     * @param void
     * @return String SessionId 값
     */
    public static String getSessionId() throws Exception  {
        return RequestContextHolder.getRequestAttributes().getSessionId();
    }
    
    
    public static UserVO getUserInfo(){
    	UserVO userInfo = null;
    	try {
    		userInfo = (UserVO)getAttribute("userInfo");
//    		System.out.println(userInfo.getId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return userInfo; 
    }
}