package com.kjh.login.interceptor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kjh.hr.vo.EmpVO;
import com.kjh.login.controller.LoginController;
import com.kjh.login.service.LoginService;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	LoginService loginService;
	
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
								Object handler) throws Exception {
		 /** 1. handler 종류 확인 
		 	 우리가 관심 있는 것은 Controller에 있는 메서드이므로 HandlerMethod 타입인지 체크 */
		
		if( handler instanceof HandlerMethod == false ) {
			
			// return true이면  Controller에 있는 메서드가 아니므로, 그대로 컨트롤러로 진행
			return true;
		}

		/** 2.형 변환 */
		HandlerMethod handlerMethod = (HandlerMethod)handler;
		
		/** 3. @Auth 받아오기 */
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);
		Auth adminRole = handlerMethod.getMethod().getDeclaringClass().getAnnotation(Auth.class);
		
		/** 4. method에 @Auth가 없는 경우, 즉 인증이 필요 없는 요청 */
		if( auth == null ) {
			return true;
		}
		
		/** 5. @Auth가 있는 경우이므로, 세션이 있는지 체크 */
		HttpSession session = request.getSession();
		
		if( session == null ) {
			
			// 로그인 화면으로 이동
			log.info("5-1. 로그인 화면으로 이동");
			
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		
		/** 6. 세션이 존재하면 유효한 유저인지 확인 */
		EmpVO empVO = (EmpVO)session.getAttribute("EMPVO");
		
		if ( empVO == null ) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}

		/** 7. admin일 경우 */
		if( adminRole != null ) {
			
			String role = adminRole.role().toString();
			
			if( "ADMIN".equals(role)) {
				log.info("admin 관리자 로그인");
				
				List<Map<String, Object>> empAuth = loginService.selectAuthor(empVO.getEmpNo());
				
				String objectAuth = null;
				List<String> listAuth = new ArrayList<String>();
				
				for (Map<String, Object> map : empAuth) {
					objectAuth = map.get("AUTHOR_CODE").toString();

					if( "ADMIN".equals(objectAuth) == true ){
						
						listAuth.add("ADMIN");
						break;
					} 
				}

				if (!listAuth.contains("ADMIN")) {
					response.sendRedirect(request.getContextPath() + "/accessError");
					return false;
				}

			} else if ("HR".equals(role)) {
				log.info("HR 인사 로그인");

				List<Map<String, Object>> empAuth = loginService.selectAuthor(empVO.getEmpNo());

				String objectAuth = null;
				List<String> listAuth = new ArrayList<String>();
				
				for (Map<String, Object> map : empAuth) {
					objectAuth = (String) map.get("AUTHOR_CODE");
					
					// 인사권한을 갖고 있다는 걸 알 수 있는 조건을 작성한다.
					
					if ("HR".equals(objectAuth) == true) { 
						
						listAuth.add("HR");
						break;
					}
				}
				
				if (!listAuth.contains("HR")) {
					response.sendRedirect(request.getContextPath() + "/accessError");
					return false;
				}
				
			} else if ("INT".equals(role)) {
				log.info("INT 출퇴근 로그인");

				List<Map<String, Object>> empAuth = loginService.selectAuthor(empVO.getEmpNo());

				String objectAuth = null;
				List<String> listAuth = new ArrayList<String>();
				
				for (Map<String, Object> map : empAuth) {
					objectAuth = (String) map.get("AUTHOR_CODE");
					
					if ("INT".equals(objectAuth) == true) { 
						
						listAuth.add("INT");
						break;
					}
				}
				
				if (!listAuth.contains("INT")) {
					response.sendRedirect(request.getContextPath() + "/accessError");
					return false;
				}
				
			} else if ("VCT".equals(role)) {
				log.info("VCT 휴가 로그인");

				List<Map<String, Object>> empAuth = loginService.selectAuthor(empVO.getEmpNo());

				String objectAuth = null;
				List<String> listAuth = new ArrayList<String>();
				
				for (Map<String, Object> map : empAuth) {
					objectAuth = (String) map.get("AUTHOR_CODE");

					if ("VCT".equals(objectAuth) == true) { 
						
						listAuth.add("VCT");
						break;
					}
				}
				
				if (!listAuth.contains("VCT")) {
					response.sendRedirect(request.getContextPath() + "/accessError");
					return false;
				}
				
			} else if ("BNT".equals(role)) {
				log.info("BNT 출장 로그인");

				List<Map<String, Object>> empAuth = loginService.selectAuthor(empVO.getEmpNo());

				String objectAuth = null;
				List<String> listAuth = new ArrayList<String>();
				
				for (Map<String, Object> map : empAuth) {
					objectAuth = (String) map.get("AUTHOR_CODE");
					
					if ("BNT".equals(objectAuth) == true) { 
						
						listAuth.add("BNT");
						break;
					}
				}
				
				if (!listAuth.contains("BNT")) {
					response.sendRedirect(request.getContextPath() + "/accessError");
					return false;
				}
			} 
		}

		/** 8. 접근허가, 즉 메서드를 실행하도록 함 */
		return true;
	}
}
