package kr.or.ddit.hr.controller;

import java.io.File;
import java.util.ArrayList;
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
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.bbs.vo.Pagination;
import kr.or.ddit.hr.service.EmpService;
import kr.or.ddit.hr.vo.CrtfreqstVO;
import kr.or.ddit.hr.vo.DeptVO;
import kr.or.ddit.hr.vo.EmpVO;
import kr.or.ddit.login.interceptor.Auth;
import kr.or.ddit.login.interceptor.SHA256Util;
import kr.or.ddit.login.interceptor.Auth.Role;

@Auth(role=Role.HR)
@Controller
public class HrController{
	private static final Logger log = LoggerFactory.getLogger(HrController.class);
	@Autowired
	EmpService empService;
	
	// 직원 목록 시작------------------------------------------------------------------
	
	// 직원 목록
	@Auth
	@GetMapping("/hr/empList")
	public String selectAll(Model model, @RequestParam(value="currentPage",defaultValue = "1") int currentPage) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int ing = this.empService.selectIngCount();
		int retire = this.empService.selectRetireCount();
		
		
		map.put("currentPage", currentPage);
		
		List<Map<String, Object>> empList = this.empService.selectIng(map);
		List<Map<String, Object>> retireList = this.empService.selectRetire(map);
		
		Pagination paginationIng = new Pagination(ing, currentPage, 10, empList);
		Pagination paginationRetire = new Pagination(retire, currentPage, 10, retireList);
		
		model.addAttribute("empList", paginationIng);
		model.addAttribute("retireList", paginationRetire);
		model.addAttribute("page", currentPage);
		
		return "hr/empList";
	}
	// 재직 직원 목록
	@Auth
	@PostMapping("/hr/ingEmpList")
	@ResponseBody
	public Pagination ingEmpList(@RequestBody Map<String, Object> data) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int retire = this.empService.selectIngCount();
		int page = (int) data.get("page");
		map.put("currentPage", page);
		
		List<Map<String, Object>> retireList = this.empService.selectIng(map);
		Pagination paginationRetire = new Pagination(retire, page, 10, retireList);
		
		
		return paginationRetire;
	}
	
	// 퇴사 직원 목록
	@Auth
	@PostMapping("/hr/retireEmpList")
	@ResponseBody
	public Pagination retireEmpList(@RequestBody Map<String, Object> data) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int retire = this.empService.selectRetireCount();
		int page = (int) data.get("page");
		map.put("currentPage", page);
		
		List<Map<String, Object>> retireList = this.empService.selectRetire(map);
		Pagination paginationRetire = new Pagination(retire, page, 10, retireList);
		
		
		return paginationRetire;
	}
	
	
	// 부서로 분류
	@Auth
	@PostMapping("/hr/empListDeptAjax")
	@ResponseBody
	public Pagination selectByDeptAjax(@RequestBody Map<String, String> dept) {
		String deptCode = dept.get("deptCode");
		String deptNm = dept.get("deptNm");
		int page = Integer.parseInt((String)dept.get("page"));
		
		Map<String, Object> map = new HashMap<String, Object>(); 
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
		
		List<Map<String,Object>> selectByDept = this.empService.selectByDept(map);
		int count = this.empService.selectByDeptCount(map);
		
		Pagination pagination = new Pagination(count, page, 10, selectByDept);
		
		return pagination;
	}
	
	// 직원 검색(관리자)
	@Auth
	@PostMapping("/hr/search")
	@ResponseBody
	public Pagination search(@RequestBody Map<String, String> data) {
		String keyword = data.get("keyword");
		int page = Integer.parseInt((String)data.get("page"));
		String team = data.get("dept");
		String dept = "";
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(team.equals("default")) {
			map.put("dept", null);
			map.put("team", null);
			map.put("currentPage", page);
		}
		
		if(team.equals("QCT")) {
			map.put("dept", "MND");
			map.put("team", team);
			map.put("currentPage", page);
		}else if(team.equals("SLT") || team.equals("CMT")){
			map.put("dept", "BSD");
			map.put("team", team);
			map.put("currentPage", page);
		}else if(team.equals("RDT") || team.equals("DST")){
			map.put("dept", "RDD");
			map.put("team", team);
			map.put("currentPage", page);
		}else if(team.equals("GAT") || team.equals("ACT") || team.equals("HRT")){
			map.put("dept", "ADD");
			map.put("team", team);
			map.put("currentPage", page);
		}
		
		map.put("keyword", keyword);
		map.put("currentPage", page);
		
		List<Map<String, Object>> searchResult = this.empService.searchEmp(map);
		int total = this.empService.searchEmpCount(keyword);
		
		Pagination pagination = new Pagination(total, page, 10, searchResult);
		
		return pagination;
	}
	
	// 직원 목록 끝-------------------------------------------------------------------
	
	
	// 직원 등록 시작
	@Auth
	@GetMapping("/hr/empAddForm")
	public String empAddForm(Model model) throws Exception {
		EmpVO empVO = new EmpVO();
		
		String empNo = this.empService.createEmpNo();
		String lxtnNo = this.empService.createLxtnNo();
		
		empVO.setEmpNo(empNo);
		empVO.setLxtnNo(lxtnNo);
		
		model.addAttribute("emp", empVO);
		
		return "hr/empAddForm";
	}
	
	@Auth
	@PostMapping("/hr/empAddProcess")
	public String empAddProcess(@ModelAttribute("emp") @Validated EmpVO emp, Model model, @RequestParam("photoFlpthFile") MultipartFile[] photoFlpthFile, HttpSession session) throws Exception {
		String uploadFolder = "C:\\dalmuti\\dalmuti\\src\\main\\webapp\\resources\\images\\emp";
		
		File saveFile = new File(uploadFolder, emp.getEmpNo() + ".jpg");
		
		photoFlpthFile[0].transferTo(saveFile);
		
		emp.setPassword(SHA256Util.encrypt(emp.getPassword())); 
		
		log.info("saveFileNm : " + saveFile.getName());
		
		// emp : EmpVO [empNo=100402, deptVO=DeptVO [deptCode=CMT, dprlrEmpNo=null, upperDeptCode=null, deptNm=null], clsfCode=C7, empNm=박명수, phonenum=, 
		// adres1=제주특별자치도 제주시 첨단로 242, adres2=, zip=63309, brthdy=2021-12-09, password=100402, email=eheh2233@naver.com, lxtnNo=0422821701, encpnDe=2021-12-10, retireDe=null, photoFlpth=null, photoFlpthFile=[org.springframework.web.multipart.commons.CommonsMultipartFile@34bc3532]]
		emp.setPhotoFlpth(saveFile.getName());
		
		int result = this.empService.insertEmp(emp);
		Map<String, Object> authorMap = new HashMap<String, Object>();
		
		if(result > 0) {
			for(int i=0;i<=5;i++) {
				switch(i) {
				case 0:
					authorMap.put("authorCode", "USER");
					authorMap.put("authorAt", "Y");
					break;
				case 1:
					authorMap.put("authorCode", "ADMIN");
					authorMap.put("authorAt", "N");
					break;
				case 2:
					authorMap.put("authorCode", "BNT");
					authorMap.put("authorAt", "N");
					break;
				case 3:
					authorMap.put("authorCode", "HR");
					authorMap.put("authorAt", "N");
					break;
				case 4:
					authorMap.put("authorCode", "INT");
					authorMap.put("authorAt", "N");
					break;
				case 5:
					authorMap.put("authorCode", "VCT");
					authorMap.put("authorAt", "N");
					break;
				}
				authorMap.put("empNo", emp.getEmpNo());
				this.empService.insertAuthor(authorMap);
			}
		}
		String path = session.getServletContext().getRealPath("/");
		
		
		return "redirect:/hr/empEditForm?empNo="+emp.getEmpNo();
	}
	// 직원 등록 끝
	
	
	// 직원 상세 & 수정 페이지
	@Auth
	@GetMapping("/hr/empEditForm")
	public String empEditForm(String empNo, Model model) throws Exception {
		EmpVO emp = this.empService.detailEmp(empNo);
		DeptVO dept = this.empService.selectDept(empNo);
		emp.setDeptVO(dept);
		model.addAttribute("emp", emp);
		
		if(emp.getRetireDe() != null) {
			return "hr/retireEmpView";
		}
		
		return "hr/empEditForm";
	}
	
	
	@Auth
	@PostMapping("/hr/empEditProcess")
	public String empEditProcess(@ModelAttribute("emp") @Validated EmpVO emp, @ModelAttribute("empRetire") @Validated EmpVO retire, Model model, @RequestParam("photoFlpthFile") MultipartFile[] photoFlpthFile) throws Exception {
		// EmpVO [empNo=100103, deptVO=DeptVO [deptCode=RDD, dprlrEmpNo=null, upperDeptCode=null, deptNm=null], clsfCode=C3, empNm=윤재선, phonenum=01029327470, adres1=대전광역시 대덕구 송촌북로, adres2=18, zip=16013, brthdy=1973-04-20, password=null, email=jaesun@gmail.com, lxtnNo=0422821412, 
		// encpnDe=2019-09-01, retireDe=null, photoFlpth=null, photoFlpthFile=[org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@2a29512e], clsf=null]
		if(photoFlpthFile != null) {
			String uploadFolder = "C:\\dalmuti\\dalmuti\\src\\main\\webapp\\resources\\images\\emp";
			
			File saveFile = new File(uploadFolder, emp.getEmpNo() + ".jpg");
			
			photoFlpthFile[0].transferTo(saveFile);
		}
		if(retire.getRetireDe() != null) {
			this.empService.retireEmp(emp);
		}
		int result = this.empService.updateEmp(emp);
		
		return "redirect:/hr/empEditForm?empNo="+emp.getEmpNo();
	}
	
	// ----------------------------------------다윤-------------------------------------------------
	
	// 증명서 관리자 창
	@Auth
	@RequestMapping("/hr/adminCrtfList")
	public String adminCrtfList(HttpServletRequest request, Model model, 
			@RequestParam(value="currentPage",defaultValue = "1") int currentPage) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int ing = this.empService.adminCrtfPagingCount();
		
		map.put("currentPage", currentPage);
		List<Map<String, Object>> adminCrtfList = this.empService.adminCrtfPaging(map);
		
		Pagination paginationIng = new Pagination(ing, currentPage, 10, adminCrtfList);
		
		model.addAttribute("adminCrtfList", new Pagination(ing, currentPage, 10, adminCrtfList));
		model.addAttribute("page", currentPage);
		
		return "hr/adminCrtfList";
	}
	
	
	
	// 관리자 권한에 넣어도 되는지 테스트x
	// 관리자에 넣어도 될거같아,,,,,,,,,
	// 증명서 목록 - 반려
	@ResponseBody
	@PostMapping("/hr/returnCrtfList")
	public int returnCrtfList(HttpServletRequest request) {
		int result = 0;
		  
		String[] crtfArr = request.getParameterValues("valueArr");
		
		int size = crtfArr.length;
		for(int i=0; i<size; i++) {
			result = this.empService.returnCrtf(Integer.parseInt(crtfArr[i]));
		}
		
		return result;
	}
	
	// 관리자 권한에 넣어도 되는지 테스트x
	// 관리자에 넣어도 될거같아,,,,,,,,,
	// 증명서 승인(목록)
	@ResponseBody
	@PostMapping("/hr/confmCrtfList")
	public int confmCrtfList(HttpServletRequest request) {
		int result = 0;
		
		String[] crtfArr = request.getParameterValues("valueArr");
		
		int size = crtfArr.length;
		for(int i=0; i<size; i++) {
			result = this.empService.confmCrtf(Integer.parseInt(crtfArr[i]));
		}
		
		return result;
	}

}
