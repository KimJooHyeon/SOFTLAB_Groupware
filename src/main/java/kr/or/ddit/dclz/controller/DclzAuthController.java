package kr.or.ddit.dclz.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.bbs.vo.Pagination;
import kr.or.ddit.dclz.service.DclzService;
import kr.or.ddit.dclz.vo.RestdeVO;
import kr.or.ddit.hr.service.EmpService;
import kr.or.ddit.hr.vo.EmpVO;
import kr.or.ddit.login.interceptor.Auth;
import kr.or.ddit.login.interceptor.Auth.Role;
import kr.or.ddit.sanction.service.SanctionService;

@Auth(role=Role.INT)
@RequestMapping("/dclz")
@Controller
public class DclzAuthController {
	
	@Autowired
	DclzService dclzService;
	@Autowired
	EmpService empService;
	@Autowired
	SanctionService sanctionService;
	
	private static final Logger logger = LoggerFactory.getLogger(DclzAuthController.class);
	
	public Map<String, Object> sanctnCount(String empNo) {
		
		Map<String, Object> sanctnCountMap = this.sanctionService.sanctnCount(empNo);
		sanctnCountMap.put("empNo", empNo);
		
		return sanctnCountMap;
	}
	
	@Auth
	@RequestMapping("/restDateList") 
	// 휴일 등록 목록 출력 
	public String restDateList(Model model, @RequestParam(value="currentPage", defaultValue = "1") int currentPage, HttpServletRequest request) {
		
		/** 현재 년도로 검색 */
		LocalDate now = LocalDate.now();
		String searchYear = now.format(DateTimeFormatter.ofPattern("yyyy"));
		
		/** 전자결재 숫자 표시 시작 */
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();

		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> sanctionMapList = this.sanctionService.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", sanctionMapList);
		/** 전자결재 숫자 표시 끝 */
		
		/** 페이징 시작 */ 
		Map<String, Object> requestMap = new HashMap<>();
		requestMap.put("searchYear", searchYear);
		
		int total = this.dclzService.restDeCount(requestMap);
		
		requestMap.put("currentPage", currentPage);
		List<Map<String, Object>> mapList = this.dclzService.restDeList(requestMap);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		} 
		/** 페이징 끝 */
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("searchYear", searchYear);
		
		return "dclz/restDateList";
	}
	
	@Auth
	@RequestMapping("/dclzRestInsert") 
	// 휴일 등록 
	public String restDeInsert(HttpServletRequest httpServletRequest) {
		RestdeVO restdeVO = new RestdeVO();
		
		String restdeDe = httpServletRequest.getParameter("restdeDe");
		String restdeSeCode = httpServletRequest.getParameter("restdeSeCode");
		String restdeNm = httpServletRequest.getParameter("restdeNm");
		
		restdeVO.setRestdeDe(restdeDe);
		restdeVO.setRestdeSeCode(restdeSeCode);
		restdeVO.setRestdeNm(restdeNm);

		int restDeInsert = this.dclzService.restDeInsert(restdeVO);
		return "redirect:/dclz/restDateList";
	}
	
	@Auth
	@ResponseBody 
	// 휴일 목록 삭제 
	@RequestMapping(value="/dclzRestDelete", method = RequestMethod.POST)
	public int restDeDelete(@RequestParam String[] valueArr) {
		
		int result = 0;
		
		int size = valueArr.length;
		for(int i=0; i<size; i++) {
			result = this.dclzService.restDeDelete(valueArr[i]);
		}
		
		return result;
	}
	
	
	@Auth 
	@RequestMapping("/restDateListMonth")
	@ResponseBody
	// 휴일 등록 목록 출력 (년도로 조회시)
	public Pagination restDateListMonth(Model model, @RequestBody Map<String, Object> data) {
		
		String searchYear = data.get("searchYear").toString();
		
		/** 페이징 시작 */ 
		Map<String, Object> requestMap = new HashMap<>();
		requestMap.put("searchYear", searchYear);
		
		int total = this.dclzService.restDeCount(requestMap);
		int currentPage= Integer.parseInt(String.valueOf(data.get("page"))) ;
		
		requestMap.put("currentPage", currentPage);
		List<Map<String, Object>> mapList = this.dclzService.restDeList(requestMap);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		} 
		/** 페이징 끝 */
		
		
		return pagination;
	}
	
	@Auth
	@RequestMapping("/dclzListadmin") 
	// 관리자가 근태현황 전체 목록 조회 - 일별
	public String dclzListadmin(HttpServletRequest request, Model model, String empNo) {
	
		/** 현재 월로 검색 */
		LocalDate now = LocalDate.now();
		String searchMonth = now.format(DateTimeFormatter.ofPattern("yyyy-MM"));
		String paramMonth = now.format(DateTimeFormatter.ofPattern("yyyy,MM"));
		String printMonth = now.format(DateTimeFormatter.ofPattern("yyyy년 MM월"));
		
		/** 전자결재 숫자 표시 시작 */
		HttpSession session = request.getSession();
	    EmpVO emp = (EmpVO)session.getAttribute("EMPVO");
	    String sanctionEmpNo = emp.getEmpNo();
		
		if (sanctionEmpNo == null || sanctionEmpNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(sanctionEmpNo);
		List<Map<String, Object>> sanctionMapList = this.sanctionService.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", sanctionMapList);
		/** 전자결재 숫자 표시 끝 */
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("searchMonth", searchMonth);
		
		Map<String, Object> requestMap = new HashMap<>();
		
		int total = this.dclzService.dclzListCount(map);
		
		requestMap.put("empNo", empNo);
		requestMap.put("searchMonth", searchMonth);
		List<Map<String, Object>> mapList = this.dclzService.selectDclzList(requestMap);
		
		model.addAttribute("printMonth", printMonth);
		model.addAttribute("searchMonth", paramMonth);
		model.addAttribute("mapList", mapList);
		model.addAttribute("empNo",empNo);
		
	
	return "dclz/dclzList";
	}
	
	

	
	@Auth 
	@RequestMapping("/managedclzListMonth")
	@ResponseBody
	// 근태관리 목록 월별 출력 
	public Pagination vcatnadmintMonth(Model model, @RequestBody Map<String, Object> data) {
		
		int page = Integer.parseInt((String) data.get("page"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", page);
		List<Map<String, Object>> empList = this.dclzService.dclzadminSelect(map);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");
		String current = df.format(cal.getTime());
				
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
				
		for (Map<String, Object> emp : empList) {
			String empNo = emp.get("EMP_NO").toString();
			
			Map<String, Object> searchMap = new HashMap<String, Object>();
			searchMap.put("searchMonth", current);
			searchMap.put("empNo", empNo);
			
			List<Map<String, Object>> resultmap = this.dclzService.selectWorkStle(searchMap);
			
			emp.put("workdates", resultmap);
			
			searchMap.clear();
			}
		
		List<String> dates = new ArrayList<String>();
		for(int i=1; i <=lastDay; i++) {
			dates.add(current+"-"+String.format("%02d",i));
		}
		
		int resultCount = this.dclzService.selectAllempCount();
		Pagination pagination = new Pagination(resultCount, page, 10, empList);
		
		return pagination;
	}
	
	
	@RequestMapping(value="/managedclzList")
	// 관리자 근태관리 전체 목록 조회 
	public String managedclz(Model model,@RequestParam(value="currentPage", defaultValue = "1") int currentPage, HttpServletRequest request)throws Exception {
		/** 전자결재 숫자 표시 시작 */
		HttpSession session = request.getSession();
		EmpVO sanctionEmp = (EmpVO) session.getAttribute("EMPVO");
		String sanctionEmpNo = sanctionEmp.getEmpNo();
		
		if (sanctionEmpNo == null || sanctionEmpNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(sanctionEmpNo);
		List<Map<String, Object>> sanctionMapList = this.sanctionService.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", sanctionMapList);
		/** 전자결재 숫자 표시 끝 */
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", currentPage);
		List<Map<String, Object>> empList = this.dclzService.dclzadminSelect(map);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");
		SimpleDateFormat dfp = new SimpleDateFormat("yyyy,MM");
		SimpleDateFormat dfp2 = new SimpleDateFormat("yyyy년 MM월");
		String current = df.format(cal.getTime());
		String searchMonth = dfp.format(cal.getTime());
		String printMonth = dfp2.format(cal.getTime());
				
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
				
		for (Map<String, Object> emp : empList) {
			String empNo = emp.get("EMP_NO").toString();
			
			Map<String, Object> searchMap = new HashMap<String, Object>();
			searchMap.put("searchMonth", current);
			searchMap.put("empNo", empNo);
			
			List<Map<String, Object>> resultmap = this.dclzService.selectWorkStle(searchMap);
			
			emp.put("workdates", resultmap);
			
			searchMap.clear();
			}
		
		List<String> dates = new ArrayList<String>();
		for(int i=1; i <=lastDay; i++) {
			dates.add(current+"-"+String.format("%02d",i));
		}
		
		int resultCount = this.dclzService.selectAllempCount();
		Pagination pagination = new Pagination(resultCount, currentPage, 10, empList);
	
		model.addAttribute("empList", pagination);
		model.addAttribute("page", currentPage);
		model.addAttribute("lastDay", lastDay);
		model.addAttribute("dates", dates);
		model.addAttribute("searchMonth", searchMonth);
		model.addAttribute("printMonth", printMonth);
		
		return "dclz/managedclzList";
	}

}
