package kr.or.ddit.login.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import kr.or.ddit.dclz.service.DclzService;
import kr.or.ddit.hr.vo.EmpVO;
import kr.or.ddit.login.interceptor.Auth;
import kr.or.ddit.login.interceptor.AuthUser;
import kr.or.ddit.login.interceptor.SHA256Util;
import kr.or.ddit.login.service.LoginService;
import kr.or.ddit.sanction.service.SanctionService;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class LoginController {
	@Autowired
	LoginService loginService;
	
	@Autowired
	SanctionService service;
	
	@Autowired
	DclzService dclzService;

	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
	
	public String getEmpVO(HttpSession session) {
		String empNo = "";
		EmpVO vo = (EmpVO) session.getAttribute("EMPVO");
		
		if (vo != null) {
			empNo = vo.getEmpNo();
			return empNo;
			
		} else {
			return "";
		}
	}
	
	public Map<String, Object> sanctnCount(String empNo) {
		
		Map<String, Object> sanctnCountMap = this.service.sanctnCount(empNo);
		sanctnCountMap.put("empNo", empNo);
		
		return sanctnCountMap;
	}

	/** 메인 페이지 */
	@Auth
	@GetMapping("/main")
	public String main(@AuthUser EmpVO empVO, Model model, HttpServletRequest request, HttpSession session) {
		String empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();
		
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		/** 사용자 접속IP */
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");
		if(ip == null) {
			ip = req.getRemoteAddr();
		}
		model.addAttribute("clientIP", ip);
		
		/** 출근 Sn 정보조회 **/
		Map<String,Object> map = new HashMap<String, Object>();
		
		/** 오늘 날짜 검색 */
		LocalDate localDate = LocalDate.now();
		String workDe = localDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		map.put("workDe", workDe);
		
		/** 로그인 세션 **/ 
	    map.put("empNo", empNo);
	    List<Map<String, Object>> commitYn = this.dclzService.commitYn(map);
	   
	    if(commitYn.size()>0) {
	    	String dclzSn = String.valueOf(commitYn.get(0).get("DCLZ_SN"));
	    	model.addAttribute("dclzSn", dclzSn);
	    	model.addAttribute("commute", "on");
	    }
		return "main";
	}

	/** 도메인 시작 메인 화면 */
	@RequestMapping("/")
	public String initMain() {
		return "redirect:/main";
	}

	/** 로그인 폼 */
	@RequestMapping("/login")
	public String login(Model model) {
		return "notiles/login";
	}

	/** 임시 비밀번호 발급 폼 */
	@RequestMapping("/forgotpw")
	public String forgotPW(Model model) {
		model.addAttribute("forgotpw", new EmpVO());
		return "notiles/forgotpw";
	}

	/** 권한 제한 페이지 */
	@RequestMapping("/accessError")
	public String accessError(Model model) {
		model.addAttribute("accessError", new EmpVO());
		return "notiles/accessError";
	}

	/** 로그인 처리 */
	@Auth
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public String loginCheck(@Validated EmpVO empVO,
			@RequestParam(value = "customCheck", required = false) String customCheck, HttpSession session,
			BindingResult result, HttpServletResponse response, Model model) {

		if (result.hasErrors()) {
			return "notiles/login";
		}

		if (session.getAttribute("EMPVO") != null) { // 기존에 login이란 세션 값이 존재한다면
			session.removeAttribute("EMPVO"); // 기존 값을 제거해 준다.
		}
		String password = empVO.getPassword();
		String encryPassword = SHA256Util.encrypt(password);
		
		empVO.setPassword(encryPassword);
		
		empVO = this.loginService.get(empVO);

		if (empVO != null) { // 로그인 성공
			
			session.setAttribute("EMPVO", empVO); // 세션에 login인이란 이름으로 EmpVO 객체를 저장해 놓음

			if (customCheck != null) {
				
				// 아이디 저장를 체크했을 경우
				if (customCheck.equals("on")) {
					
					// 쿠키 생성(직원번호)
					// 서버에 쿠키가 생성되고 response 객체에 저장되어 웹브라우저의 저장됨 -> 요청할 때마다 저장된 쿠키 정보를 반환함
					Cookie cookie = new Cookie("empNo", empVO.getEmpNo());
					
					// 초 단위 설정(60초 -> 1분 -> 하루 -> 한 달)
					cookie.setMaxAge(60 * 60 * 24 * 30);
					response.addCookie(cookie);

				} else { // 아이디 기억하기를 체크하지 않았을 경우
					
					// 쿠키 삭제 
					Cookie cookie = new Cookie("empNo", "");
					
					// 초 단위 설정(0)
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
				
			} else {
				
				// 쿠키 삭제
				Cookie cookie = new Cookie("empNo", "");
				
				// 초 단위 설정(0)
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}

			Map<String, Object> sanctnCountMap = sanctnCount(empVO.getEmpNo());
			model.addAttribute("sanctnCountMap", sanctnCountMap);
			
			/** 사용자 접속IP */
			HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			String ip = req.getHeader("X-FORWARDED-FOR");
			if(ip == null) {
				ip = req.getRemoteAddr();
			}
			model.addAttribute("clientIP", ip);
			
			/** 출근 Sn 정보조회 **/
			Map<String,Object> map = new HashMap<String, Object>();
			
			/** 오늘 날짜 검색 */
			LocalDate localDate = LocalDate.now();
			String workDe = localDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			map.put("workDe", workDe);
			
			/** 로그인 세션 **/ 
			
		    map.put("empNo", empVO.getEmpNo());
		    List<Map<String, Object>> commitYn = this.dclzService.commitYn(map);

		   
		    if(commitYn.size()>0) {
		    	String dclzSn = String.valueOf(commitYn.get(0).get("DCLZ_SN"));
		    	model.addAttribute("dclzSn", dclzSn);
		    	model.addAttribute("commute", "on");
		    }
			
			return "/main"; // forwarding
			
		} else { // 로그인 실패
			
			// 쿠키 삭제
			Cookie cookie = new Cookie("empNo", "");
			
			// 초 단위 설정(0)
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			
			empVO = new EmpVO();
			model.addAttribute("EMPVO", empVO); // 비밀번호가 틀렸을 경우 아이디를 기억하지 않기 위함
			model.addAttribute("loginFail", "사번 혹은 비밀번호를 확인해 주세요.");
			
			return "notiles/login";
		}
	}

	/** 로그아웃 */
	@Auth
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 초기화
		return "redirect:/login"; // 로그아웃 후 로그인 화면으로 이동
	}

	/** 임시 비밀번호 발급 */
	public static String getTempPassword(int length) {
		
		int index = 0;
		char[] charArr = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z' };

		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < length; i++) {
			index = (int) (charArr.length * Math.random());
			sb.append(charArr[index]);
		}

		return sb.toString();
	}

	/** 임시 비밀번호 문자 발송 */
	@ResponseBody
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	public void sendSMS(@RequestParam("phone") String userPhoneNumber, HttpServletResponse respon,
			HttpServletRequest request, EmpVO empVO, String text) { // 휴대폰 문자보내기

		JSONObject jsonObject = new JSONObject();

		String api_key = "NCSDOKMNFT0RVW7F";
		String api_secret = "0ZJOLSJ8FP34SQREVCTDORWAJ4LTNKIC"; // 유출 안 되게 조심
		Message coolsms = new Message(api_key, api_secret);

		HashMap<String, String> params = new HashMap<String, String>();

		int phoneCheck = this.loginService.phoneCheck(userPhoneNumber);

		if (phoneCheck == 1) {
			text = getTempPassword(8);
			String encryPassword = SHA256Util.encrypt(text);
			
			empVO.setPhonenum(userPhoneNumber);
			empVO.setPassword(encryPassword);
			loginService.updatePW(empVO);
			
			jsonObject.put("result", "true");

			params.put("to", userPhoneNumber);
			params.put("from", "01099619707");
			params.put("type", "SMS");
			params.put("text", "안녕하세요. SoftLab입니다.\n임시 비밀번호는 [" + text + "] 입니다.");
			params.put("app_version", "test app 1.2"); // application name and version

		} else if (phoneCheck == 0) {
			jsonObject.put("result", "false");
		}

		try {
			respon.getWriter().print(jsonObject.toJSONString());
		} catch (IOException e) { }

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			
		} catch (CoolsmsException e) {
		}

	}
	
	/** 에러 페이지 */
	@RequestMapping("/notiles/error")
	public String error() {
		return "notiles/error";
	}

}
