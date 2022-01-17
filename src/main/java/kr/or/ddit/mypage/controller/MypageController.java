package kr.or.ddit.mypage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.hr.controller.EmpController;
import kr.or.ddit.hr.service.EmpService;
import kr.or.ddit.hr.vo.DeptVO;
import kr.or.ddit.hr.vo.EmpVO;
import kr.or.ddit.login.interceptor.Auth;
import kr.or.ddit.login.interceptor.SHA256Util;
import kr.or.ddit.mypage.service.MypageService;
import kr.or.ddit.sanction.service.SanctionService;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class MypageController {
	private static final Logger log = LoggerFactory.getLogger(EmpController.class);
	
	@Autowired
	MypageService mypageService;
	@Autowired
	EmpService empService;
	@Autowired
	SqlSession sqlSession;
	@Autowired
	SanctionService service;
	
	public String empNo = "";
	
	public String getEmpVO(HttpSession session) {
			
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
	
	/** 마이페이지 들어가기 전 비밀번호 체크 폼 */
	@Auth
	@RequestMapping("/password")
	public String password(HttpSession session, Model model) {
		
		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		return "mypage/passwordCheck";
	}
	
	/** 마이페이지 들어가기전 비밀번호 체크 */
	@Auth
	@RequestMapping("/passwordCheck")
	public String passwordCheck(HttpServletRequest request, Model model, @RequestParam String password) {
		HttpSession session = request.getSession();
		
		EmpVO empVO = (EmpVO) session.getAttribute("EMPVO");		
		String realPassword = empVO.getPassword();
		
		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		String encryPassword = SHA256Util.encrypt(password);
		
		if (encryPassword.equals(realPassword)) {
			String empNo = empVO.getEmpNo();
			
			String clsfCode = empVO.getClsfCode();
			
			EmpVO emp = this.empService.detailEmp(empNo);
			DeptVO dept = this.empService.selectDept(empNo);
			String deptNm = dept.getDeptNm();
			String selectClsf = this.mypageService.selectClsf(clsfCode);

			emp.setDeptVO(dept);
			
			model.addAttribute("emp", emp);
			model.addAttribute("selectClsf", selectClsf);
			model.addAttribute("deptNm", deptNm);
			
			return "mypage/mypage";
			
		} else {
			model.addAttribute("message", "비밀번호를 확인해 주세요.");
			return "mypage/passwordCheck";
		}
	}
	
	/** 비밀번호 수정 */
	@Auth
	@PostMapping("/updatePassword")
	public String updatePassword(HttpServletRequest request, Model model, @RequestParam String password) {
		HttpSession session = request.getSession();
		
		EmpVO empVO = (EmpVO) session.getAttribute("EMPVO");
		
		String empNo = empVO.getEmpNo();
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		EmpVO emp = this.empService.detailEmp(empNo);
		String clsfCode = empVO.getClsfCode();
		DeptVO dept = this.empService.selectDept(empNo);
		String deptNm = dept.getDeptNm();
		String selectClsf = this.mypageService.selectClsf(clsfCode);
		
		emp.setDeptVO(dept);
		
		model.addAttribute("emp", emp);
		model.addAttribute("selectClsf", selectClsf);
		model.addAttribute("deptNm", deptNm);
		
		String encryPassword = SHA256Util.encrypt(password);
		empVO.setPassword(encryPassword);
		
		this.mypageService.updatePassword(empVO);
		
		return "mypage/mypage";
	}
	
	/** 인증번호 6자리 발급 */
	public static String numberGen(int len, int dupCd) {
		
		Random rand = new Random();
		String numStr = "";  // 난수가 저장될 변수
		
		for (int i = 0; i < len; i++) {
			
			String ran = Integer.toString(rand.nextInt(10));
			
			if (dupCd == 1) {
				
				// 중복 허용시 numStr에 append
				numStr += ran;
			
			} else if (dupCd == 2) {
				
				// 중복을 허용하지 않을시 중복된 값 있는지 검사
				if (!numStr.contains(ran)) {
					
					// 중복된 값이 없으면 numStr에 append
					numStr += ran;
					
				} else {
					
					// 생성된 난수가 중복되면 루틴을 다시 실행
					i -= 1;
					
				}
			}
		}
		return numStr;
	}
	
	String phonNo = null;
	String confirmNo = null;
	
	/** 휴대폰번호 문자 인증 */
	@Auth
	@ResponseBody
	@RequestMapping("/sendSms")
	public void sendSms(@RequestParam("phone") String userPhoneNumber, HttpServletResponse respon,
			HttpServletRequest request, EmpVO empVO, String text) {
		phonNo = userPhoneNumber;
		
		JSONObject jsonObject = new JSONObject();
		
		String api_key = "NCSDOKMNFT0RVW7F";
		String api_secret = "0ZJOLSJ8FP34SQREVCTDORWAJ4LTNKIC"; // 유출 안 되게 조심
		Message coolsms = new Message(api_key, api_secret);

		HashMap<String, String> params = new HashMap<String, String>();

		text = numberGen(6, 1);
		confirmNo = text;
		
		int phoneCheck = this.mypageService.phoneCheck(userPhoneNumber);
		
		if (phoneCheck >= 1) {
			jsonObject.put("result", "dupl");
		} else if (phoneCheck == 0){
			empVO.setPhonenum(userPhoneNumber);
			empVO.setPassword(text);
			
			jsonObject.put("result", "true");
			
			params.put("to", userPhoneNumber);
			params.put("from", "01099619707");
			params.put("type", "SMS");
			params.put("text", "안녕하세요. SoftLab입니다.\n인증번호는 [" + text + "] 입니다.");
			params.put("app_version", "test app 1.2"); // application name and version
		}
		
		try {
			respon.getWriter().print(jsonObject.toJSONString());
		} catch (IOException e) { }

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
		} catch (CoolsmsException e) {
		}
	}
	
	/** 인증번호 체크 */
	@Auth
	@ResponseBody
	@PostMapping("/smsCheck")
	public void updatePhoneNum(HttpServletRequest request, HttpServletResponse respon, Model model,@RequestParam  Map<String, Object> paramMap) {
		HttpSession session = request.getSession();
		JSONObject jsonObject = new JSONObject();
		
		String code = (String)paramMap.get("smsNo");
		
		String beforePhonNO = phonNo;
		
		EmpVO empVO = (EmpVO) session.getAttribute("EMPVO");
		
		String empNo = empVO.getEmpNo();
		
		EmpVO emp = this.empService.detailEmp(empNo);
		String clsfCode = empVO.getClsfCode();
		DeptVO dept = this.empService.selectDept(empNo);
		String deptNm = dept.getDeptNm();
		String selectClsf = this.mypageService.selectClsf(clsfCode);
		
		emp.setDeptVO(dept);
		
		model.addAttribute("emp", emp);
		model.addAttribute("selectClsf", selectClsf);
		model.addAttribute("deptNm", deptNm);
		empVO.setPhonenum(beforePhonNO);
		
		int getCode = Integer.parseInt(code);
		int getConfirmNo = Integer.parseInt(confirmNo);
		
		
		if (code.equals(confirmNo)) {
			this.mypageService.updatePhoneNum(empVO);
			jsonObject.put("result", "true");
		} else {
			jsonObject.put("result", "false");
		}
		
		try {
			respon.getWriter().print(jsonObject.toJSONString());
		} catch (IOException e) { }
	}
	
}
