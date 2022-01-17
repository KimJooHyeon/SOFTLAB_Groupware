package kr.or.ddit.hr.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.bbs.vo.Pagination;
import kr.or.ddit.hr.service.EmpService;
import kr.or.ddit.hr.vo.CrtfreqstVO;
import kr.or.ddit.hr.vo.EmpVO;
import kr.or.ddit.login.interceptor.Auth;
import kr.or.ddit.sanction.service.SanctionService;

@Controller
public class EmpController {
	private static final Logger log = LoggerFactory.getLogger(EmpController.class);
	
	@Autowired
	EmpService empService;

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

	/* 관리자 권한x */
	// 직원조회 조직도
	@Auth
	@GetMapping("/hr/organization")
	public String deptEmpList(Model model, @RequestParam Map<String, Object> map, HttpSession session) throws Exception {

		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		// 부서목록
		List<Map<String, Object>> deptList = empService.deptList(map);
		model.addAttribute("deptList", deptList);

		// 직원목록
		List<Map<String, Object>> empList = empService.deptEmpList(map);
		model.addAttribute("deptEmpList", empList);

		// 팀원목록
		List<Map<String, Object>> teamList = empService.teamList(map);
		model.addAttribute("teamList", teamList);

		return "hr/organization";
	}

	/* 관리자 권한x */
	// 전자결재 조직도
	@Auth
	@GetMapping("/hr/sanctionOrganizationChart")
	public String sanctionOrganization(Model model, @RequestParam Map<String, Object> map) throws Exception {

		// 부서목록
		List<Map<String, Object>> deptList = empService.deptList(map);
		model.addAttribute("deptList", deptList);

		// 직원목록
		List<Map<String, Object>> empList = empService.deptEmpList(map);
		model.addAttribute("deptEmpList", empList);

		// 팀원목록
		List<Map<String, Object>> teamList = empService.teamList(map);
		model.addAttribute("teamList", teamList);

		return "sanction/sanctionOrganizationChart";
	}

	/* 관리자 권한x */
	// 인사 조직도 상세조회Ajax
	@Auth
	@RequestMapping("/hr/detailOrganizationAjax")
	@ResponseBody
	public Map<String, Object> empDetail(String empNo, Model model) throws Exception {
		/*
		 * log.debug("empNo : ", empNo); EmpVO empVo = this.empService.empDetail(empNo);
		 * log.info("empVo", empVo); model.addAttribute("empVo", empVo); return
		 * "hr/detailOrganizationAjax";
		 */

		Map<String, Object> paramMap = new HashMap<String, Object>();

		EmpVO empList = new EmpVO();
		empList.setEmpNo(empNo);

		EmpVO detailUser = this.empService.empDetail(empList);

		model.addAttribute("detailUser", detailUser);

		String selectWorkStleCode = this.empService.selectWorkStleCode(empNo);
		model.addAttribute("selectWorkStleCode", selectWorkStleCode);

		paramMap.put("selectWorkStleCode", selectWorkStleCode);
		paramMap.put("detailUser", detailUser);

		return paramMap;
	}

	/* 관리자 권한x */
	// 인사관리 직원 검색
	@Auth
	@RequestMapping("/hr/empSearch")
	public String empSearch(@RequestParam String keyword, Model model, @RequestParam Map<String, Object> map, HttpSession session)
			throws Exception {

		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		// 부서목록
		List<Map<String, Object>> deptList = empService.deptList(map);
		model.addAttribute("deptList", deptList);

		// 직원목록
		List<Map<String, Object>> empList = empService.deptEmpList(map);
		model.addAttribute("deptEmpList", empList);

		// 팀원목록
		List<EmpVO> empSearch = empService.empSearch(keyword);
		model.addAttribute("empSearch", empSearch);

		return "hr/searchOrganization";
	}

	/* 관리자 권한x */
	// 인사 조직도 상세조회Ajax
	@Auth
	@RequestMapping("/hr/searchEmpAjax")
	@ResponseBody
	public List<EmpVO> empSearch(String keyword, Model model) throws Exception {

		List<EmpVO> empSearch = this.empService.empSearch(keyword);

		model.addAttribute("detailUser", empSearch);

		return empSearch;
	}

	/* 관리자 권한x */
	// 증명서 신청 폼
	@Auth
	@RequestMapping("/hr/crtfForm")
	public String crtfForm(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();

		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		EmpVO empVO = empService.detailEmp(empNo);
		model.addAttribute(empVO);

		return "hr/crtfForm";
	}

	/* 관리자 권한x */
	// 증명서 신청 완료
	@Auth
	@RequestMapping(value = "/hr/insertCrtf", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String insertCrtf(@RequestParam Map<String, Object> map) {
		int result = 0;
		String successYn = "신청 실패";

		result = this.empService.insertCrtf(map);
		log.info("result : " + result);
		if (result > 0) {
			successYn = "신청 완료";
			return successYn;
		} else {
			return "";
		}
	}

	/* 관리자 권한x */
	// 증명서 신청 목록
	@Auth
	@RequestMapping("/hr/crtfList")
	public String crtfList(HttpServletRequest request, Model model,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) throws Exception {
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();

		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("currentPage", currentPage);
		
		List<Map<String, Object>> crtfList = this.empService.crtfList(map);
		int total = this.empService.crtfListCount(empNo);
		log.info("total : " + total);
		
		Pagination pagination = new Pagination(total, currentPage, 10, crtfList);
		log.info("endPage : " + pagination.getEndPage());
		log.info("list : " + crtfList);
		log.info("pagination : " + pagination);
		
		model.addAttribute("crtfList", new Pagination(total, currentPage, 10, crtfList));
		model.addAttribute("page", currentPage);
		model.addAttribute("loginEmp", empNo);
		
		return "hr/crtfList";
	}

	/* 관리자 권한x */
	// 증명서 취소
	@ResponseBody
	@RequestMapping("/hr/deleteCrtf")
	public int deleteCrtf(HttpServletRequest request) {
		int result = 0;
		String[] crtfArr = request.getParameterValues("valueArr");

		int size = crtfArr.length;
		for (int i = 0; i < size; i++) {
			result = this.empService.deleteCrtf(Integer.parseInt(crtfArr[i]));
		}

		return result;
	}

	/* 관리자 권한x */
	// 증명서 프린트 창 modal Ajax
	@Auth
	@RequestMapping("/hr/crtfDetail")
	@ResponseBody
	public CrtfreqstVO crtfDetail(int crtfReqstSn, Model model) throws Exception {

		CrtfreqstVO crtfPrint = new CrtfreqstVO();
		crtfPrint.setCrtfReqstSn(crtfReqstSn);

		CrtfreqstVO crtfDetail = this.empService.crtfDetail(crtfReqstSn);

		model.addAttribute("crtfDetail", crtfDetail);

		return crtfDetail;
	}

}
