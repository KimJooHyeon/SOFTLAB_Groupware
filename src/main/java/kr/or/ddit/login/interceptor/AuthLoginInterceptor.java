package kr.or.ddit.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.or.ddit.hr.vo.EmpVO;
import kr.or.ddit.login.controller.LoginController;
import kr.or.ddit.login.service.LoginService;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private LoginService loginService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		log.info("loginInterceptor 확인");
		
		String empNo = request.getParameter("empNo");
		String password = request.getParameter("password");
		
		EmpVO empVO = new EmpVO();
		empVO.setEmpNo(empNo);
		empVO.setPassword(password);
		loginService.get(empVO);
		
		return true;
	}
}
