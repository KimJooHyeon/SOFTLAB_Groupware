package kr.or.ddit.dclz.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.bbs.vo.Pagination;
import kr.or.ddit.dclz.service.DclzService;
import kr.or.ddit.hr.service.EmpService;
import kr.or.ddit.hr.vo.EmpVO;
import kr.or.ddit.login.interceptor.Auth;
import kr.or.ddit.login.interceptor.Auth.Role;
import kr.or.ddit.sanction.service.SanctionService;

@Auth(role=Role.INT)
@RequestMapping("/dclz")
@Controller
public class DclzAuthVctController {

	@Autowired
	DclzService dclzService;
	@Autowired
	EmpService empService;
	@Autowired
	SanctionService sanctionService;
	
	private static final Logger logger = LoggerFactory.getLogger(DclzAuthVctController.class);
	
	public Map<String, Object> sanctnCount(String empNo) {
		
		Map<String, Object> sanctnCountMap = this.sanctionService.sanctnCount(empNo);
		sanctnCountMap.put("empNo", empNo);
		
		return sanctnCountMap;
	}
	
	@RequestMapping(value="/vcatnadminSearch", method = RequestMethod.POST)
	@ResponseBody
	// 관리자 휴가관리 목록조회 검색 
	public Pagination vcatnadminSearch(@RequestBody Map<String, String> data) {
		
		String keyword = (String) data.get("keyword");
		int page = Integer.parseInt((String) data.get("page"));
		
		LocalDate now = LocalDate.now();
		String nowyear = now.format(DateTimeFormatter.ofPattern("yyyy"));
		String searchYear = data.get("searchYear").toString();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", page);
		map.put("currentYear", searchYear);
		
		List<Map<String, Object>> searchResult = this.dclzService.vcatnadminSearch(map);
		int total = this.dclzService.searchVcatnCount(map);
		
		
		/* 근무 연차 계산하기 */
		String standard = nowyear+"-01-01";
		String workyear ="";
		
		for(Map<String, Object> aftermap : searchResult ) {
			String start = (String) aftermap.get("ENCPN_DE");
			try {
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date beginDate = formatter.parse(start);
				Date endDate = formatter.parse(standard);
				
				long diff = endDate.getTime()-beginDate.getTime();
				long diffday = diff / (24*60*60*1000);
				int diffyear = (int)diffday/365;
				
				if(diffyear<1) {
					workyear = "1년 미만";
				}else {
					workyear = diffyear+" 년차";
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
			aftermap.put("workyear", workyear);
		}
		
		Pagination pagination = new Pagination(total, page, 10, searchResult);
		
		return pagination;
	}
	
	
	@Auth 
	@RequestMapping("/vcatnadmintYear")
	@ResponseBody
	// 휴가 관리 목록 출력 (년도로 조회시)
	public Pagination vcatnadmintYear(Model model, @RequestBody Map<String, Object> data) {
		
		String keyword = (String) data.get("keyword");
		int page = Integer.parseInt((String) data.get("page"));
		
		LocalDate now = LocalDate.now();
		String nowyear = now.format(DateTimeFormatter.ofPattern("yyyy"));
		
		String searchYear = data.get("searchYear").toString();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", page);
		map.put("currentYear", searchYear);
		
		List<Map<String, Object>> searchResult = this.dclzService.vcatnadminSearch(map);
		int total = this.dclzService.searchVcatnCount(map);
		
		
		/* 근무 연차 계산하기 */
		String standard = nowyear+"-01-01";
		String workyear ="";
		
		for(Map<String, Object> aftermap : searchResult ) {
			String start = (String) aftermap.get("ENCPN_DE");
			try {
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date beginDate = formatter.parse(start);
				Date endDate = formatter.parse(standard);
				
				long diff = endDate.getTime()-beginDate.getTime();
				long diffday = diff / (24*60*60*1000);
				int diffyear = (int)diffday/365;
				
				if(diffyear<1) {
					workyear = "1년 미만";
				}else {
					workyear = diffyear+" 년차";
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
			aftermap.put("workyear", workyear);
		}
		
		Pagination pagination = new Pagination(total, page, 10, searchResult);
		
		return pagination;
	}
	
	@Auth
	@PostMapping("vcatnSelectByDept")
	@ResponseBody
	// 관리자 휴가관리 부서로 분류
	public Pagination vcatnSelectByDept(@RequestBody Map<String, String> dept) {
		LocalDate now = LocalDate.now();
		String nowyear = now.format(DateTimeFormatter.ofPattern("yyyy"));
		String searchYear = dept.get("searchYear");
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("currentYear", searchYear);
		
		String deptCode = dept.get("deptCode");
		String deptNm = dept.get("deptNm");
		int page = Integer.parseInt((String)dept.get("page"));
		
		if(deptCode.equals("QCT")) {
			map.put("dept", "MND");
			map.put("team", deptCode);
			map.put("currentPage", page);
		}else if(deptCode.equals("SLT") || deptCode.equals("CMT")){
			map.put("dept", "BSD");
			map.put("team", deptCode);
			map.put("currentPage", page);
		}else if(deptCode.equals("RDT") || deptCode.equals("DST")){
			map.put("dept", "RDD");
			map.put("team", deptCode);
			map.put("currentPage", page);
		}else if(deptCode.equals("GAT") || deptCode.equals("ACT") || deptCode.equals("HRT")){
			map.put("dept", "ADD");
			map.put("team", deptCode);
			map.put("currentPage", page);
		}
		
		List<Map<String,Object>> selectByDept = this.dclzService.vcatnSelectByDept(map);
		int count = this.dclzService.vcatnSelectByDeptCount(map);
		
		/* 근무 연차 계산하기 */
		String standard = nowyear+"-01-01";
		String workyear ="";
		
		for(Map<String, Object> aftermap : selectByDept ) {
			String start = (String) aftermap.get("ENCPN_DE");
			try {
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date beginDate = formatter.parse(start);
				Date endDate = formatter.parse(standard);
				
				long diff = endDate.getTime()-beginDate.getTime();
				long diffday = diff / (24*60*60*1000);
				int diffyear = (int)diffday/365;
				
				if(diffyear<1) {
					workyear = "1년 미만";
				}else {
					workyear = diffyear+" 년차";
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
			aftermap.put("workyear", workyear);
		}
		
		
		Pagination pagination = new Pagination(count, page, 10, selectByDept);
		
		return pagination;
	}
	
	
	// 연차휴가 일괄등록
	@Auth
	@PostMapping("vcatnAdminInsert")
	@ResponseBody
	public void vcatnAdminInsert() {
		Map<String, Object> insertmap = new HashMap<String, Object>();
		List<Map<String,Object>> allList = this.dclzService.vcatnSelectByAll();
		/* 근무 연차 계산하기 */
		LocalDate now = LocalDate.now();
		String occrrncYear = now.format(DateTimeFormatter.ofPattern("yyyy"));
		String standard = occrrncYear+"-01-01";
		int occrrncDaycnt = 0;
		
		
		for(Map<String, Object> aftermap : allList ) {
			String start = (String) aftermap.get("ENCPN_DE");
			try {
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date beginDate = formatter.parse(start);
				Date endDate = formatter.parse(standard);
				
				long diff = endDate.getTime()-beginDate.getTime();
				long diffday = diff / (24*60*60*1000);
				int diffMonth = (int)diffday/30;
				int diffyear = (int)diffday/365;
				if(diffyear<1) {
					occrrncDaycnt = (diffMonth) +((int) (15*diffMonth/12));
				}else if(diffyear==1) {
					int rest = 11-(diffMonth-12);
					if(rest>0) {
						occrrncDaycnt = rest + 15;
					}
				}
				else{
					occrrncDaycnt = 15 + (diffyear-1)/2;
					if(occrrncDaycnt>25) {
						occrrncDaycnt = 25;
					}
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			insertmap.put("empNo", aftermap.get("EMP_NO"));
			insertmap.put("occrrncYear", occrrncYear);
			insertmap.put("occrrncDaycnt",occrrncDaycnt);
			
			int result = this.dclzService.insertVcatnAdmin(insertmap);
			if(result>0) {
				insertmap.clear();
			}
		}
	}
	
	@RequestMapping(value="/vcatnadmin")
	// 관리자 휴가관리 전체 목록 조회 
	public String vcatnadmin(Model model,@RequestParam(value="currentPage", defaultValue = "1") int currentPage, HttpServletRequest request)throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int ing = this.empService.selectIngCount();
	
		LocalDate now = LocalDate.now();
		String nowyear = now.format(DateTimeFormatter.ofPattern("yyyy"));
	
		map.put("currentPage", currentPage);
		map.put("currentYear", nowyear);
	
		List<Map<String, Object>> empList = this.dclzService.vcatnadmin(map);
		int resultCount = this.dclzService.vcatnaminCount(nowyear);
	
		if(empList.size() > 0) {
			boolean yearData = true;
			model.addAttribute("yearData", yearData);
			}else {
			boolean yearData = false;
			model.addAttribute("yearData", yearData);
		}

		/* 근무 연차 계산하기 */
		String standard = nowyear+"-01-01";
		String workyear ="";
	
		for(Map<String, Object> aftermap : empList ) {
			String start = (String) aftermap.get("ENCPN_DE");
			try {
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date beginDate = formatter.parse(start);
				Date endDate = formatter.parse(standard);
			
				long diff = endDate.getTime()-beginDate.getTime();
				long diffday = diff / (24*60*60*1000);
				int diffyear = (int)diffday/365;
			
				if(diffyear<1) {
				workyear = "1년 미만";
				}else {
				workyear = diffyear+" 년차";
				}
			} catch (ParseException e) {
			e.printStackTrace();
			}
			aftermap.put("workyear", workyear);
		}
	
		Pagination pagination = new Pagination(resultCount, currentPage, 10, empList);
	
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
		
		model.addAttribute("empList", pagination);
		model.addAttribute("page", currentPage);
		model.addAttribute("nowYear", nowyear);
	
		return "dclz/vcatnadmin";
	}
	
}
