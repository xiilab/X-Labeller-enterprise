package com.xlabeller.auth;

import com.xlabeller.common.module.SessionUtil;
import com.xlabeller.models.UserVO;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;


@Service
public class LoginCheckIntercepter extends HandlerInterceptorAdapter {
//	private static final Logger logger  =  Logger.getLogger(LoginCheckIntercepter.class);
	
 
//	@Override
//	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler){
//
//
//		boolean result   =  false;
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");
////		String rootPath   =  request.getContextPath();
//		try{
////			logger.debug("enter intercepter");
//			HttpSession session  =  request.getSession(false);
////			System.out.println("session : " + session.getId());
////			session.setMaxInactiveInterval(60*60*24);
//
//			if(session == null){
//				JSONObject errObj = new JSONObject();
//				PrintWriter out = response.getWriter();
//				errObj.put("code", "2001");
//				errObj.put("data", "로그인 세션 기간이 만료 되었습니다");
//				out.print(errObj);
//				out.flush();
//				return false;
//			}else{
//
//				UserVO userVO  =  (UserVO)session.getAttribute("userInfo");
//				//UserInfo 로 세션 등록
//				if(userVO != null && userVO.getUser_id() != null){
//				// session exist
//					if(SessionUtil.checkSessionMap(userVO.getUser_id(), session)) {return true;}
//					SessionUtil.putSessionMap(userVO.getUser_id(), session);
//
//				}else{
//					JSONObject errObj = new JSONObject();
//					PrintWriter out = response.getWriter();
//					errObj.put("code", "2001");
//					errObj.put("data", "로그인 세션 기간이 만료 되었습니다");
//					out.print(errObj);
//					out.flush();
//					return false;
//				}
//
//			}
//
//			result =  true;
//
//		}catch(Exception e){
//			e.printStackTrace();
//			//logger.debug(e.getMessage());
//			return false;
//		}
//
//		return result;
//	}
}
