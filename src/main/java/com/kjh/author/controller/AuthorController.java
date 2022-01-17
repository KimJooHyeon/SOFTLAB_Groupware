package com.kjh.author.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kjh.author.service.AuthorService;
import com.kjh.hr.service.EmpService;
import com.kjh.hr.vo.EmpVO;
import com.kjh.login.interceptor.Auth;
import com.kjh.login.interceptor.Auth.Role;
import com.kjh.sanction.service.SanctionService;

@Auth(role=Role.ADMIN)
@Controller
public class AuthorController {
	
	@Autowired
	EmpService empService;
	
	@Autowired
	AuthorService authorService;
	
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
	
	/** 직원 목록 */
	@Auth
	@RequestMapping("/author")
	public String selectAll(Model model, HttpSession session) throws Exception {
		List<Map<String, Object>> empList = this.authorService.selectAuthor();
		
		empList.get(0);
		model.addAttribute("empList", empList);

		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		return "author/author";
	}
	
	/** 부서로 분류 */
	@Auth
	@PostMapping("/author/empListDeptAjax")
	@ResponseBody
	public List<Map<String,Object>> selectByDeptAjax(@RequestBody Map<String, String> dept, Model model) {
		String deptCode = dept.get("deptCode");
		String deptNm = dept.get("deptNm");
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		if(deptCode.equals("QCT")) {
			map.put("dept", "MND");
			map.put("team", deptCode);
		} else if(deptCode.equals("SLT") || deptCode.equals("CMT")){
			map.put("dept", "BSD");
			map.put("team", deptCode);
		} else if(deptCode.equals("RDT") || deptCode.equals("DST")){
			map.put("dept", "RDD");
			map.put("team", deptCode);
		} else if(deptCode.equals("GAT") || deptCode.equals("ACT") || deptCode.equals("HRT")){
			map.put("dept", "ADD");
			map.put("team", deptCode);
		}
		
		List<Map<String,Object>> selectByDept = this.authorService.selectByDept(map);

		return selectByDept;
	}
	
	/** 직원 검색(관리자) */
	@Auth
	@PostMapping("/author/search")
	@ResponseBody
	public List<Map<String, Object>> search(@RequestBody String keyword, Model model) {
		
		List<Map<String, Object>> searchResult = this.authorService.searchEmp(keyword);
		
		return searchResult;
	}
	
	/** 부서 목록에서 직원 검색(관리자) */
	@Auth
	@PostMapping("/author/searchDeptEmp")
	@ResponseBody
	public List<Map<String, Object>> searchDeptEmp(@RequestBody String keyword, Model model) {
		
		List<Map<String, Object>> searchResult = this.authorService.searchEmp(keyword);

		return searchResult;
	}
	
	/** 권한 수정 **/
	@Auth
	@PostMapping("/author/updateAuthor")
	@ResponseBody
	public boolean updateAuthor(@RequestBody String data) {
		
		int update = 0;
		
		try {
			List<Map<String, Object>> info = new ArrayList<Map<String,Object>>();
			info = JSONArray.fromObject(data);
			
			List<Map<String, Object>> addAuthorList = new ArrayList<Map<String,Object>>(); 
			Map<String, Object> addAuthorMap = new HashMap<>();
			
			for (Map<String, Object> memberInfo : info) {
				
				addAuthorMap.put("empNo", (String) memberInfo.get("id"));
				addAuthorMap.put("authorCode", (String) memberInfo.get("division"));
				addAuthorMap.put("authorAt", (String) memberInfo.get("isAuthor"));
				
				update = authorService.updateAuthor(addAuthorMap);
			} 
			
			if (update == 1) {
				return true;
				
			} else {
				return false;
			}
			
		} catch (Exception e) {
			
		}
		
		return false;
	}
}
