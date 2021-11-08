package com.xlabeller.page;

import com.xlabeller.common.module.SessionUtil;
import com.xlabeller.models.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;


@Controller
@RequestMapping("/")
public class PageController {
	/************************************************************************/	
	/* 공통 */
	@RequestMapping("/header")
	public ModelAndView header() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("header");
		
		return modelAndView;
	}
	
	@RequestMapping("/footer")
	public ModelAndView footer() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("footer");
		
		return modelAndView;
	}
	
	@RequestMapping("/main")
	public Object main() {
		UserVO userInfo = SessionUtil.getUserInfo();
		ModelAndView modelAndView = new ModelAndView();
		if(userInfo == null || userInfo.getLevel_cd() == null || userInfo.getLevel_cd().length() <= 0 ) {
//			modelAndView.setViewName("login");
			return "redirect:/login";
		} else if (userInfo.getLevel_cd().equals("0")){
			modelAndView.setViewName("labeller/labeller");
		} else {
			modelAndView.setViewName("inspection/inspection");
		}
		
		return modelAndView;
	}
	
	/************************************************************************/	
	/* 회원가입 */
	@RequestMapping("/join")
	public Object join(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		try {
			//RSA 키 발급
			KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
			generator.initialize(2048);
	
			KeyPair keyPair = generator.genKeyPair();
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
	
			PublicKey publicKey = keyPair.getPublic();
			PrivateKey privateKey = keyPair.getPrivate();
	
			// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
			session.setAttribute("_RSA_WEB_KEY_", privateKey);
	
			// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
			RSAPublicKeySpec publicSpec = keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			String publicKeyModulus = publicSpec.getModulus().toString(16);
			String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
			request.setAttribute("publicKeyModulus", publicKeyModulus);
			request.setAttribute("publicKeyExponent", publicKeyExponent);
		}catch(NoSuchAlgorithmException | InvalidKeySpecException e) {
			return "redirect:/error";
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("join");
		
		return modelAndView;
	}
	
	@RequestMapping("/joinResult")
	public ModelAndView joinResult() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("joinResult");
		
		return modelAndView;
	}
	
	/* 로그인 */
	@RequestMapping("/login")
	public Object login(HttpSession session, HttpServletRequest request, HttpServletResponse response) {		
		try {
			//RSA 키 발급
			KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
			generator.initialize(2048);
	
			KeyPair keyPair = generator.genKeyPair();
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
	
			PublicKey publicKey = keyPair.getPublic();
			PrivateKey privateKey = keyPair.getPrivate();
	
			// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
			session.setAttribute("_RSA_WEB_KEY_", privateKey);
	
			// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
			RSAPublicKeySpec publicSpec = keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			String publicKeyModulus = publicSpec.getModulus().toString(16);
			String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
			request.setAttribute("publicKeyModulus", publicKeyModulus);
			request.setAttribute("publicKeyExponent", publicKeyExponent);
		}catch(NoSuchAlgorithmException | InvalidKeySpecException e) {
			return "redirect:/error";
		}
	
		
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login");
		
		return modelAndView;
	}
	
	/* 마이페이지 */
	@RequestMapping("/mypage")
	public Object mypage(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		try {
			//RSA 키 발급
			KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
			generator.initialize(2048);
	
			KeyPair keyPair = generator.genKeyPair();
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
	
			PublicKey publicKey = keyPair.getPublic();
			PrivateKey privateKey = keyPair.getPrivate();
	
			// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
			session.setAttribute("_RSA_WEB_KEY_", privateKey);
	
			// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
			RSAPublicKeySpec publicSpec = keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			String publicKeyModulus = publicSpec.getModulus().toString(16);
			String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
			request.setAttribute("publicKeyModulus", publicKeyModulus);
			request.setAttribute("publicKeyExponent", publicKeyExponent);
		}catch(NoSuchAlgorithmException | InvalidKeySpecException e) {
			return "redirect:/error";
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage");
		
		return modelAndView;
	}
	
	/* 비밀번호 찾기 */
	@RequestMapping("/findPassword")
	public ModelAndView findPassword() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("findPassword");
		
		return modelAndView;
	}
	
	/* 비밀번호 변경 */
	@RequestMapping("/users/reset")
	public ModelAndView updatePassword() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("users/reset");
		
		return modelAndView;
	}

	/************************************************************************/
	
	@RequestMapping("/workspace")
	public ModelAndView workspaceIndex() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("workspace");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller")
	public Object labelerList() {
		//ModelAndView modelAndView = new ModelAndView();
		//modelAndView.setViewName("labeller/labeller");
		
		UserVO userInfo = SessionUtil.getUserInfo();
		ModelAndView modelAndView = new ModelAndView();
		if(userInfo == null || userInfo.getLevel_cd() == null || userInfo.getLevel_cd().length() <= 0 ) {
//			modelAndView.setViewName("login");
			return "redirect:/login";
		} else if (userInfo.getLevel_cd().equals("0")){
			modelAndView.setViewName("labeller/labeller");
		} else {
			modelAndView.setViewName("inspection/inspection");
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/inspection")
	public ModelAndView inspectionList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("inspection/inspection");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller/main")
	public ModelAndView labelerMain() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/main");
		
		return modelAndView;
	}
	
	@RequestMapping("/inspection/main")
	public ModelAndView inspectionMain() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("inspection/main");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller/upload")
	public ModelAndView labelerUpload() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/upload");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller/modify")
	public ModelAndView labelerModify() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/modify");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller/addImg")
	public ModelAndView labelerAddImg() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/addImg");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller/imports")
	public ModelAndView labelerImports() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/imports");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller/dataList")
	public ModelAndView labelerDataList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/dataList");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller/dataList2")
	public ModelAndView labelerDataList2() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/dataList2");
		
		return modelAndView;
	}	
	
	@RequestMapping("/labeller/labelList")
	public ModelAndView labelerListList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/labelList");
		
		return modelAndView;
	}
	
	@RequestMapping("/inspection/labelList")
	public ModelAndView inspectionListList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("inspection/labelList");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller/enrichment")
	public ModelAndView labelerEnrichment() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/enrichment");
		
		return modelAndView;
	}
	
	@RequestMapping("/inspection/enrichment")
	public ModelAndView inspectionEnrichment() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("inspection/enrichment");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller/groupView")
	public ModelAndView labelerGroupView() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/groupView");
		
		return modelAndView;
	}
	
	
	@RequestMapping("/labeller/replicate")
	public ModelAndView labelerReplicate() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/replicate");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller/imgBBox")
	public ModelAndView labelerImgBBox() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/imgBBox");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller/imgSeg")
	public ModelAndView labelerImgSeg() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/imgSeg");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller/videoBBox")
	public ModelAndView labelerVideoBBox() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/videoBBox");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller/imgLine")
	public ModelAndView labelerImgLine() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/imgLine");
		
		return modelAndView;
	}
	
	@RequestMapping("/inspection/imgBBox")
	public ModelAndView inspectionImgBBox() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("inspection/imgBBox");
		
		return modelAndView;
	}
	
	@RequestMapping("/inspection/imgSeg")
	public ModelAndView inspectionImgSeg() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("inspection/imgSeg");
		
		return modelAndView;
	}
	
	@RequestMapping("/inspection/videoBBox")
	public ModelAndView inspectionVideoBBox() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("inspection/videoBBox");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller/imgBBoxList")
	public ModelAndView labelerImgBBoxList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/imgBBoxList");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller/imgSegList")
	public ModelAndView labelerImgSegList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/imgSegList");
		
		return modelAndView;
	}
	
	@RequestMapping("/labeller/videoBBoxList")
	public ModelAndView labelerVideoBBoxList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("labeller/videoBBoxList");
		
		return modelAndView;
	}		
	
	/************************************************************************/	
	
	@RequestMapping("/info")
	public ModelAndView info() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("info/info");
		
		return modelAndView;
	}
	
	
	@RequestMapping("/info/labeller")
	public ModelAndView labelerInfo() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("info/labeller");
		
		return modelAndView;
	}
	
	@RequestMapping("/info/annotation")
	public ModelAndView AnnotationInfo() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("info/annotation");
		
		return modelAndView;
	}
	@RequestMapping("/info/trainer")
	public ModelAndView TrainerInfo() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("info/trainer");
		
		return modelAndView;
	}
	
	@RequestMapping("/info/comparison")
	public ModelAndView ComparisonInfo() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("info/comparison");
		
		return modelAndView;
	}
	
	@RequestMapping("/info/setup")
	public ModelAndView SetupInfo() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("info/setup");
		
		return modelAndView;
	}
	
	@RequestMapping("/info/monitor")
	public ModelAndView MonitorInfo() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("info/monitor");
		
		return modelAndView;
	}
	
	@RequestMapping("/info/algorithm")
	public ModelAndView AlgorithmInfo() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("info/algorithm");
		
		return modelAndView;
	}

	
	/************************************************************************/
	//ANNOTATION
	
	@RequestMapping("/annotation")
	public ModelAndView annotation() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("annotation/annotation");
		return modelAndView;
	}
	
	@RequestMapping("/annotation/workspace")
	public ModelAndView annotationWorkspace() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("annotation/workspace");
		return modelAndView;
	}
	
	@RequestMapping("/annotation/main")
	public ModelAndView annotationMain() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("annotation/main");
		return modelAndView;
	}
	
	@RequestMapping("/annotation/upload")
	public ModelAndView annotationUpload() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("annotation/upload");
		return modelAndView;
	}
	
	@RequestMapping("/annotation/detail")
	public ModelAndView annotationDetail() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("annotation/detail");
		return modelAndView;
	}
	
	@RequestMapping("/annotation/list")
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("annotation/list");
		return modelAndView;
	}
	
	@RequestMapping("/annotation/info")
	public ModelAndView annotationInfo() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("annotation/info");
		return modelAndView;
	}
	
	
	
	/************************************************************************/
	//TRAINER
	
	@RequestMapping("/trainer")
	public ModelAndView trainer() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("trainer/trainer");
		return modelAndView;
	}
	
	@RequestMapping("/trainer/workspace")
	public ModelAndView trainerWorkspace() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("trainer/workspace");
		return modelAndView;
	}
	
	@RequestMapping("/trainer/main")
	public ModelAndView TrainerMain() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("trainer/main");
		return modelAndView;
	}
	
	@RequestMapping("/trainer/info")
	public ModelAndView trainerInfo() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("trainer/info");
		return modelAndView;
	}
	
	@RequestMapping("/trainer/upload")
	public ModelAndView trainerUpload() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("trainer/upload");
		return modelAndView;
	}
	
	@RequestMapping("/trainer/detail")
	public ModelAndView trainerDetail() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("trainer/detail");
		return modelAndView;
	}
	
	@RequestMapping("/project/upload")
	public ModelAndView projectUpload() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("trainer/project/upload");
		return modelAndView;
	}
	
	@RequestMapping("/project/list")
	public ModelAndView projectList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("trainer/project/list");
		return modelAndView;
	}
	
	
	
	@RequestMapping("/task/detail")
	public ModelAndView taskDetail() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("trainer/task/detail");
		return modelAndView;
	}
	
	@RequestMapping("/task/run")
	public ModelAndView taskRun() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("trainer/task/run");
		return modelAndView;
	}
	
	@RequestMapping("/task/list")
	public ModelAndView taskList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("trainer/task/list");
		return modelAndView;
	}
	
	@RequestMapping("/task/result")
	public ModelAndView taskResult() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("trainer/task/result");
		return modelAndView;
	}
	
	@RequestMapping("/task/retrain")
	public ModelAndView taskRetrain() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("trainer/task/retrain");
		return modelAndView;
	}
	
	@RequestMapping("/task/inherit")
	public ModelAndView taskInherit() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("trainer/task/inherit");
		return modelAndView;
	}
	
	/************************************************************************/
	//comparison
	@RequestMapping("/comparison")
	public ModelAndView comparison() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("comparison/comparison");
		return modelAndView;
	}
	@RequestMapping("/comparison/main")
	public ModelAndView comparisonMain() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("comparison/main");
		return modelAndView;
	}
	@RequestMapping("/comparison/graph")
	public ModelAndView graph() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("comparison/graph");
		return modelAndView;
	}
	
	/************************************************************************/
	//setup
	@RequestMapping("/setup")
	public ModelAndView setup() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("setup/setup");
		return modelAndView;
	}
	
	/************************************************************************/
	//setup
	@RequestMapping("/monitor")
	public ModelAndView monitor() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("monitor/monitor");
		return modelAndView;
	}
	
	
	/************************************************************************/
	//algorithm
	@RequestMapping("/algorithm/list")
	public ModelAndView algorithmList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("algorithm/list");
		return modelAndView;
	}

	@RequestMapping("/algorithm/register")
	public ModelAndView algorithmRegister() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("algorithm/register");
		return modelAndView;
	}
	
	@RequestMapping("/algorithm/detail")
	public ModelAndView algorithmDetail() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("algorithm/detail");
		return modelAndView;
	}		
	
	/************************************************************************/
	
	/************************************************************************/
	// mAP 비교용 임시 페이지
	
	@RequestMapping("/task/map")
	public ModelAndView taskMap() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("trainer/task/map");
		return modelAndView;
	}	
	
	@RequestMapping("/map/comparison")
	public ModelAndView mapComparison() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("map/comparison");
		return modelAndView;
	}	
	
	@RequestMapping("/map/comparison/main")
	public ModelAndView mapComparisonMain() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("map/main");
		return modelAndView;
	}
	
	
	/************************************************************************/	
	
	
	/************************************************************************/
	//TEST
	
		@RequestMapping("/test")
		public ModelAndView test() {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("test/labeller");
			
			return modelAndView;
		}
		
		@RequestMapping("/test/workspace")
		public ModelAndView test2() {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("test/workspace");
			return modelAndView;
		}
		

	/************************************************************************/	
	
		/* 채팅 */	
		@RequestMapping("/chat/view")
		public ModelAndView chatView() {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("chat/view");
			
			return modelAndView;
		}
		
	/************************************************************************/	
	
	
	/************************************************************************/	
		
		
		@RequestMapping("/test/test")
		public ModelAndView testtestView() {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("test");
			
			return modelAndView;
		}
		
	/************************************************************************/	
		
		
}