package kr.or.ddit.dclz.controller;

import java.text.ParseException;
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
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.bbs.vo.Pagination;
import kr.or.ddit.dclz.service.DclzService;
import kr.or.ddit.dclz.vo.BsrpVO;
import kr.or.ddit.dclz.vo.VcatnVO;
import kr.or.ddit.dclz.vo.YrycVO;
import kr.or.ddit.hr.service.EmpService;
import kr.or.ddit.hr.vo.EmpVO;
import kr.or.ddit.login.interceptor.Auth;
import kr.or.ddit.sanction.service.SanctionService;

@RequestMapping("/dclz")
@Controller
public class DclzController {
	
	@Autowired
	DclzService dclzService;
	@Autowired
	EmpService empService;
	@Autowired
	SanctionService sanctionService;
	
	private static final Logger logger = LoggerFactory.getLogger(DclzController.class);
	
	public Map<String, Object> sanctnCount(String empNo) {
		
		Map<String, Object> sanctnCountMap = this.sanctionService.sanctnCount(empNo);
		sanctnCountMap.put("empNo", empNo);
		
		return sanctnCountMap;
	}
	
	@Auth
	@RequestMapping(value="/commute", method=RequestMethod.POST)
	@ResponseBody
	// 나의 근태등록(출근) 
	public String commuteInsert(Model model, HttpServletRequest request, @RequestParam Map<String,Object> map, HttpServletResponse response) {
		int result = 0;
		/** 로그인 세션 **/ 
		HttpSession session = request.getSession();
	    EmpVO emp = (EmpVO)session.getAttribute("EMPVO");
	    String empNo = emp.getEmpNo();
	    String workDe = map.get("workDe").toString();
	    map.put("empNo", empNo);
		List<Map<String, Object>> commitYn = this.dclzService.commitYn(map);
		
	    if(commitYn.size()>0) {
	    	return "already";
	    }else {
	    	/** 휴일 근로일 때 휴일로 등록 **/
	    	String vcatn = this.dclzService.restDeList2(workDe);
	    	if(vcatn!=null) {
	    		map.put("workStleCode", "W7");
	    	}else {
	    		map.put("workStleCode", "W1");
	    	}
	    	result = this.dclzService.commuteInsert(map);
	    	String insertDclzSn = String.valueOf(map.get("dclzSn")); 
	    	if(result>0) {
	    		return insertDclzSn;
	    	}else {
	    		return "fail";
	    	}
	    }
	}
	
	@Auth
	@RequestMapping(value="/getOff", method=RequestMethod.POST)
	@ResponseBody
	// 나의 근태등록 (퇴근) 
	public int getOffUpdate(@RequestParam Map<String,Object> map, HttpServletResponse response, HttpServletRequest request) {
		
		Date currentTime = new Date();
		
		map.put("lvffcTime", currentTime);
		int result = this.dclzService.getoff(map);
		return result;
	}
	
	@Auth
	@RequestMapping("/dclzList") 
	// 나의 근태현황 전체 목록 조회 - 일별
	public String dclzList(HttpServletRequest request, Model model) {
		
		/** 로그인 세션 **/ 
		HttpSession session = request.getSession();
	    EmpVO emp = (EmpVO)session.getAttribute("EMPVO");
	    String empNo = emp.getEmpNo();
		
		/** 현재 월로 검색 */
		LocalDate now = LocalDate.now();
		String searchMonth = now.format(DateTimeFormatter.ofPattern("yyyy-MM"));
		String paramMonth = now.format(DateTimeFormatter.ofPattern("yyyy,MM"));
		String printMonth = now.format(DateTimeFormatter.ofPattern("yyyy년 MM월"));
		
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("searchMonth", searchMonth);
		
		
		/** 전자결재 숫자 표시 시작 */
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> sanctionMapList = this.sanctionService.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", sanctionMapList);
		/** 전자결재 숫자 표시 끝 */
		
		Map<String, Object> requestMap = new HashMap<>();
		
		requestMap.put("empNo", empNo);
		requestMap.put("searchMonth", searchMonth);
		List<Map<String, Object>> mapList = this.dclzService.selectDclzList(requestMap);
		
		model.addAttribute("printMonth", printMonth);
		model.addAttribute("searchMonth", paramMonth);
		model.addAttribute("mapList", mapList);
		model.addAttribute("empNo", empNo);
		
		return "dclz/dclzList";
	}
	

	
	@Auth
	@ResponseBody
	@RequestMapping(value="/dclzListMonth", method = RequestMethod.POST)
	// 나의 근태 현황 검색(월별로 조회)
	public List<Map<String, Object>> dclzListMonth(HttpServletRequest request, @RequestBody Map<String, Object> data) {
		
		/** 로그인 세션 **/ 
		HttpSession session = request.getSession();
	    EmpVO emp = (EmpVO)session.getAttribute("EMPVO");
	    String empNo = emp.getEmpNo();
		
		String searchMonth = data.get("searchMonth").toString();
		
		Map<String, Object> requestMap = new HashMap<>();
		
		requestMap.put("empNo", empNo);
		requestMap.put("searchMonth", searchMonth);
		
		List<Map<String, Object>> mapList = this.dclzService.selectDclzList(requestMap);
		
		return mapList;
	}
		
		
	@Auth
	@ResponseBody
	@RequestMapping(value="/searchDclzList", method = RequestMethod.POST)
	// 나의 근태 현황 검색(기간)
	public List<Map<String, Object>> searchDclzList(HttpServletRequest request, @RequestParam Map<String,Object> map, ModelAndView mav) {
		
		/** 로그인 세션 **/ 
		HttpSession session = request.getSession();
	    EmpVO emp = (EmpVO)session.getAttribute("EMPVO");
	    String empNo = emp.getEmpNo();
		map.put("empNo",empNo);
		
		List<Map<String, Object>> dclzList = this.dclzService.searchDclzList(map);
		
		return dclzList;
	}
	
	@Auth
	@ResponseBody
	@RequestMapping(value="/weekDclzList", method = RequestMethod.POST)
	// 나의 근태 현황 (주간별)
	public List<Map<String, Object>> weekDclzList(@RequestParam Map<String,Object> map, ModelAndView mav) {
		
		String str = map.get("searchMonth").toString();
		String searchMonth = str.replace(',', '-');
		map.put("searchMonth", searchMonth);
		
		List<Map<String, Object>> weekdclzList = this.dclzService.weekSelectDclz(map);
		
		return weekdclzList;
	}
	
	@Auth
	@RequestMapping("/bsrpForm") 
	// 출장 신청 폼 
	public String bsrpForm(HttpServletRequest request, Model model) {
		
		/** 로그인 세션 **/ 
		HttpSession session = request.getSession();
	    EmpVO emp = (EmpVO)session.getAttribute("EMPVO");
	    String empNo = emp.getEmpNo(); 
		
	    /** 전자결재 숫자 표시 시작 */
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> sanctionMapList = this.sanctionService.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", sanctionMapList);
		/** 전자결재 숫자 표시 끝 */
	    
		EmpVO empVO = empService.detailEmp(empNo);
		model.addAttribute(empVO);
		
		return "dclz/bsrpForm";
	}
	
	@Auth
	@RequestMapping(value="/bsrpInsert", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	// 출장 임시저장
	public String bsrpInsert(@RequestParam Map<String,Object> map) {
		int result = 0;
		String bsrpSn = "fail";
		
		result = this.dclzService.bsrpInsert(map);
		
		if (result>0) {
			bsrpSn = String.valueOf(map.get("bsrpSn"));
		}
		
		return bsrpSn;
	}
	
	@Auth
	@RequestMapping(value="/bsrpList")
	// 출장 신청함 목록조회 
	public String bsrpList(HttpServletRequest request, Model model,
							@RequestParam(value="currentPage", defaultValue = "1") int currentPage) {
		BsrpVO bsrpVO = new BsrpVO();
		
		/** 로그인 세션 **/ 
		HttpSession session = request.getSession();
	    EmpVO emp = (EmpVO)session.getAttribute("EMPVO");
	    String empNo = emp.getEmpNo(); 
		bsrpVO.setEmpNo(empNo);
		
		/** 전자결재 숫자 표시 시작 */
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
		
		int total = this.dclzService.bsrpListCount(empNo);
		
		requestMap.put("empNo", empNo);
		requestMap.put("currentPage", currentPage);
		List<Map<String, Object>> bsrpList = this.dclzService.bsrpList(requestMap);
		
		for (Map<String, Object> bsrpMap : bsrpList) {
			String sanctnYn = bsrpMap.get("SANCTN_YN").toString();
			if(sanctnYn.equals("Y")) {
				int elctrnSanctnSn = Integer.parseInt(String.valueOf(bsrpMap.get("ELCTRN_SANCTN_SN")));
				Map<String, Object> electMap = this.dclzService.elctrnSanState(elctrnSanctnSn);
				Boolean last = electMap.containsKey("LAST_STTUS_CODE");
				String stcode = electMap.get("STCODE").toString();
				if(last) {
					String lastcode = electMap.get("LAST_STTUS_CODE").toString();
					if(lastcode.equals("L1")) {
						bsrpMap.put("sanctnStat", "결재완료");
					}else {
						bsrpMap.put("sanctnStat", "반려");
					}
				}else if(stcode.equals("S1")) {
					bsrpMap.put("sanctnStat", "결재대기");
				}else if(stcode.equals("S2")) {
					bsrpMap.put("sanctnStat", "결재진행");
				}
			}
			else {
				bsrpMap.put("sanctnStat", "임시저장");
			}
		}
		
		Pagination pagination = new Pagination(total, currentPage, 10, bsrpList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		} 
		/** 페이징 끝 */
		
		model.addAttribute("pagination", pagination);
		
		return "dclz/bsrpList";
	}
	
	@Auth
	@RequestMapping(value="/bsrpDelete", method= RequestMethod.POST)
	@ResponseBody
	// 출장 임시저장 삭제 
	public int bsrpDelete(@RequestParam String[] valueArr) {
		int result = 0;
		
		int size = valueArr.length;
		for(int i=0; i<size; i++) {
			result = this.dclzService.bsrpDelete(valueArr[i]);
		}
		
		return result;
	}
	
	@Auth
	@RequestMapping(value="/bsrpDetailDelete", method= RequestMethod.POST)
	@ResponseBody
	// 출장 상세조회 페이지 임시저장 삭제 
	public int bsrpDetailDelete(@RequestParam String bsrpSn) {
		int result = 0;
		result = this.dclzService.bsrpDelete(bsrpSn);
		
		return result;
	}
	
	@Auth
	@RequestMapping(value="/bsrpDetail")
	// 출장 임시저장 상세 출력 
	public String bsrpDetail(@RequestParam String bsrpSn, Model model, HttpServletRequest request) {
		BsrpVO bsrpVO = this.dclzService.bsrpDetail(bsrpSn);
		Map<String,Object> empMap = this.sanctionService.empInfoByEmpNo(bsrpVO.getEmpNo());
		model.addAttribute("bsrpVO", bsrpVO);
		model.addAttribute("empMap", empMap);
		
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
		
		return "dclz/bsrpDetail";
	}
	
	@Auth 
	@RequestMapping(value="/bsrpUpdate", method=RequestMethod.POST)
	@ResponseBody
	// 출장 임시저장 수정 
	public int bsrpUpdate(@RequestParam Map<String,Object> map) {
	  int result = 0;
	  
	  result = this.dclzService.bsrpUpdate(map);
	  
	  return result;
	}
	
	
	@Auth 
	@RequestMapping("/searchBsrpPages")
	@ResponseBody
	// 출장 임시저장 검색 
	public Pagination searchBsrpPages(HttpServletRequest request,
										@RequestBody Map<String, Object> data){
		
		/** 로그인 세션 **/ 
		HttpSession session = request.getSession();
	    EmpVO emp = (EmpVO)session.getAttribute("EMPVO");
	    String empNo = emp.getEmpNo(); 
	    
	    /** 페이징 시작 */
		
	    int currentPage= Integer.parseInt(String.valueOf(data.get("page"))) ;
		
		data.put("empNo", empNo);
		data.put("currentPage", currentPage);
		int total = this.dclzService.searchBsrpCount(data);
		List<Map<String, Object>> bsrpList = this.dclzService.searchBsrpPage(data);
		
		for (Map<String, Object> bsrpMap : bsrpList) {
			String sanctnYn = bsrpMap.get("SANCTN_YN").toString();
			if(sanctnYn.equals("Y")) {
				int elctrnSanctnSn = Integer.parseInt(String.valueOf(bsrpMap.get("ELCTRN_SANCTN_SN")));
				Map<String, Object> electMap = this.dclzService.elctrnSanState(elctrnSanctnSn);
				Boolean last = electMap.containsKey("LAST_STTUS_CODE");
				String stcode = electMap.get("STCODE").toString();
				if(last) {
					String lastcode = electMap.get("LAST_STTUS_CODE").toString();
					if(lastcode.equals("L1")) {
						bsrpMap.put("sanctnStat", "결재완료");
					}else {
						bsrpMap.put("sanctnStat", "반려");
					}
				}else if(stcode.equals("S1")) {
					bsrpMap.put("sanctnStat", "결재대기");
				}else if(stcode.equals("S2")) {
					bsrpMap.put("sanctnStat", "결재진행");
				}
			}
			else {
				bsrpMap.put("sanctnStat", "임시저장");
			}
		}
		
		Pagination pagination = new Pagination(total, currentPage, 10, bsrpList);
		
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
	@RequestMapping("/vcatnForm") 
	// 휴가 신청 폼 
	public String vcatnForm(HttpServletRequest request, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		/** 로그인 세션 **/ 
		HttpSession session = request.getSession();
	    EmpVO emp = (EmpVO)session.getAttribute("EMPVO");
	    String empNo = emp.getEmpNo(); 
		
		EmpVO empVO = empService.detailEmp(empNo);
		model.addAttribute(empVO);
		
		/** 전자결재 숫자 표시 시작 */
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> sanctionMapList = this.sanctionService.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", sanctionMapList);
		/** 전자결재 숫자 표시 끝 */
		
		/** 현재 년도로 검색 */
		LocalDate now = LocalDate.now();
		String searchYear = now.format(DateTimeFormatter.ofPattern("yyyy"));
		
		/** 남은 휴가일수 조회 **/
		map.put("empNo", empNo);
		map.put("searchYear", searchYear);
		
		YrycVO yrycVO = this.dclzService.yrycSelect(map);
		if(yrycVO !=null) {
			model.addAttribute(yrycVO);
		}
		
		return "dclz/vcatnForm";
	}
	
	
	   // 휴가일수 자동계산
	   @PostMapping("/vcatnRequestCount")
	   @ResponseBody
	   public long vcatnRequestCount(@RequestParam String startDate, String endDate) throws ParseException {
	      
	      List<String> myDateList = new ArrayList<>();
	      
	      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	      
	      Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
	      Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(endDate);
	      
	      long diffSec = (date2.getTime() - date1.getTime()) / 1000;
	      long diffDays = diffSec / (24 * 60 * 60) + 1;
	      
	      Calendar c1 = Calendar.getInstance();
	      Calendar c2 = Calendar.getInstance();
	      
	      c1.setTime(date1);
	      c2.setTime(date2);
	      
	      while (c1.compareTo(c2) != 1) {
	         myDateList.add(format.format(c1.getTime()));
	         
	         c1.add(Calendar.DATE, 1);
	      }
	      
	      for (String restdeDe : myDateList) {
	         String at = this.dclzService.restDeList2(restdeDe);
	         
	         if (at != null && at.equals(restdeDe)) {
	            diffDays--;
	         }
	      }
	      
	      return diffDays;
	   }
	   
	
	@Auth
	@RequestMapping(value="/vcatnInsert", method = RequestMethod.POST)
	@ResponseBody
	// 휴가신청 임시저장
	public String vcatnInsert(@RequestParam Map<String,Object> map) {
		int result = 0;
		String vcatnSn = "fail";
		
		result = this.dclzService.vcatnInsert(map);
		
		if (result>0) {
			vcatnSn = String.valueOf(map.get("vcatnSn"));
		}
		
		return vcatnSn;
	}
	
	@Auth
	@RequestMapping(value="/vcatnList")
	// 휴가 임시저장 목록조회 
	public String vcatnList(HttpServletRequest request, Model model,
								@RequestParam(value="currentPage", defaultValue = "1") int currentPage) {
		
		/** 로그인 세션 **/ 
		HttpSession session = request.getSession();
	    EmpVO emp = (EmpVO)session.getAttribute("EMPVO");
	    String empNo = emp.getEmpNo(); 
		
		/** 전자결재 숫자 표시 시작 */
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
		
		int total = this.dclzService.vcatnListCount(empNo);
		
		requestMap.put("empNo", empNo);
		requestMap.put("currentPage", currentPage);
		List<Map<String, Object>> vcatnList = this.dclzService.vcatnList(requestMap);
		
		
		for (Map<String, Object> vcatnMap : vcatnList) {
			String sanctnYn = vcatnMap.get("SANCTN_YN").toString();
			if(sanctnYn.equals("Y")) {
				int elctrnSanctnSn = Integer.parseInt(String.valueOf(vcatnMap.get("ELCTRN_SANCTN_SN")));
				Map<String, Object> electMap = this.dclzService.elctrnSanState(elctrnSanctnSn);
				Boolean last = electMap.containsKey("LAST_STTUS_CODE");
				String stcode = electMap.get("STCODE").toString();
				if(last) {
					String lastcode = electMap.get("LAST_STTUS_CODE").toString();
					if(lastcode.equals("L1")) {
						vcatnMap.put("sanctnStat", "결재완료");
					}else {
						vcatnMap.put("sanctnStat", "반려");
					}
				}else if(stcode.equals("S1")) {
					vcatnMap.put("sanctnStat", "결재대기");
				}else if(stcode.equals("S2")) {
					vcatnMap.put("sanctnStat", "결재진행");
				}
			}
			else {
				vcatnMap.put("sanctnStat", "임시저장");
			}
		}
		
		Pagination pagination = new Pagination(total, currentPage, 10, vcatnList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		} 
		/** 페이징 끝 */
		
		model.addAttribute("pagination", pagination);
	
		return "dclz/vcatnList";
	}
	
	@Auth
	@RequestMapping(value="/vcatnDelete", method= RequestMethod.POST)
	@ResponseBody
	// 휴가 임시저장 삭제 
	public int vcatnbsrpDelete(@RequestParam String[] valueArr) {
		int result = 0;
		
		int size = valueArr.length;
		for(int i=0; i<size; i++) {
			result = this.dclzService.vcatnDelete(valueArr[i]);
		}
		
		return result;
	}
	
	
	@Auth 
	@RequestMapping("/searchVcatnPages")
	@ResponseBody
	// 휴가 임시저장 검색 
	public Pagination searchVcatnPages(HttpServletRequest request, @RequestBody Map<String, Object> data){
		
		/** 로그인 세션 **/ 
		HttpSession session = request.getSession();
	    EmpVO emp = (EmpVO)session.getAttribute("EMPVO");
	    String empNo = emp.getEmpNo(); 
	    
	    /** 페이징 시작 */
		
	    int currentPage= Integer.parseInt(String.valueOf(data.get("page"))) ;
		
		data.put("empNo", empNo);
		data.put("currentPage", currentPage);
		int total = this.dclzService.searchVcatnCn(data);
		List<Map<String, Object>> vcatnList = this.dclzService.searchVcatnPage(data);
		
		for (Map<String, Object> vcatnMap : vcatnList) {
			String sanctnYn = vcatnMap.get("SANCTN_YN").toString();
			if(sanctnYn.equals("Y")) {
				int elctrnSanctnSn = Integer.parseInt(String.valueOf(vcatnMap.get("ELCTRN_SANCTN_SN")));
				Map<String, Object> electMap = this.dclzService.elctrnSanState(elctrnSanctnSn);
				Boolean last = electMap.containsKey("LAST_STTUS_CODE");
				String stcode = electMap.get("STCODE").toString();
				if(last) {
					String lastcode = electMap.get("LAST_STTUS_CODE").toString();
					if(lastcode.equals("L1")) {
						vcatnMap.put("sanctnStat", "결재완료");
					}else {
						vcatnMap.put("sanctnStat", "반려");
					}
				}else if(stcode.equals("S1")) {
					vcatnMap.put("sanctnStat", "결재대기");
				}else if(stcode.equals("S2")) {
					vcatnMap.put("sanctnStat", "결재진행");
				}
			}
			else {
				vcatnMap.put("sanctnStat", "임시저장");
			}
		}
		
		Pagination pagination = new Pagination(total, currentPage, 10, vcatnList);
		
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
	@RequestMapping(value="/vcatnDetail")
	// 휴가 임시저장 상세 출력 
	public String vcatnDetail(@RequestParam String vcatnSn, Model model, HttpServletRequest request) {
		VcatnVO vcatnVO = this.dclzService.vcatnDetail(vcatnSn);
		Map<String,Object> empMap = this.sanctionService.empInfoByEmpNo(vcatnVO.getEmpNo());
		Map<String, Object> map = new HashMap<String, Object>();
		
		model.addAttribute("vcatnVO", vcatnVO);
		model.addAttribute("empMap", empMap);
		
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
		
		/** 현재 년도로 검색 */
		LocalDate localDate = LocalDate.now();
		String searchYear = localDate.format(DateTimeFormatter.ofPattern("yyyy"));
		
		/** 남은 휴가일수 조회 **/
		map.put("empNo", vcatnVO.getEmpNo());
		map.put("searchYear", searchYear);
		
		YrycVO yrycVO = this.dclzService.yrycSelect(map);
		if(yrycVO !=null) {
			model.addAttribute(yrycVO);
		}
		
		return "dclz/vcatnDetail";
	}
	
	@Auth
	@RequestMapping(value="/vcatnDetailDelete", method= RequestMethod.POST)
	@ResponseBody
	// 휴가 상세조회 페이지 임시저장 삭제 
	public int vcatnDetailDelete(@RequestParam String vcatnSn) {
		int result = 0;
		result = this.dclzService.vcatnDelete(vcatnSn);
		
		return result;
	}
	
	@Auth 
	@RequestMapping(value="/vcatnUpdate", method=RequestMethod.POST)
	@ResponseBody
	// 휴가 임시저장 수정 
	public int vcatnUpdate(@RequestParam Map<String,Object> map) {
	  int result = 0;
	  
	  result = this.dclzService.vcatnUpdate(map);
	  
	  return result;
	}
	
	// 주현 
	@PostMapping("/openWindow")
	@ResponseBody
	public Map<String, Object> openWindow(@RequestParam int elctrnSanctnSn) {
		
		Map<String, Object> info = new HashMap<>();
		Map<String, Object> lastSttus = this.sanctionService.lastSttusCodeBySn(elctrnSanctnSn);
		
		String tab = "";
		String btnCode = "";
		String lastSttusCode = "";

		if (lastSttus.get("LAST_STTUS_CODE") != null) {
			lastSttusCode = lastSttus.get("LAST_STTUS_CODE").toString();
		}
		
		if (lastSttusCode == null || lastSttusCode.equals("")) { // 결재대기
			tab = "request";
			btnCode = "bc2";
				
		} else if (lastSttusCode.equals("L1")) { // 결재완료
			tab = "done";
			btnCode = "bc6";
			
		} else if (lastSttusCode.equals("L2")) { // 반려
			tab = "return";
			btnCode = "bc3";
			
		}
		
		info.put("tab", tab);
		info.put("btnCode", btnCode);
		
		return info;
	}
	
	
	
}


