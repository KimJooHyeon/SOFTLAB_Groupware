package com.kjh.schdul.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kjh.hr.vo.EmpVO;
import com.kjh.login.interceptor.Auth;
import com.kjh.sanction.service.SanctionService;
import com.kjh.schdul.service.SchdulService;
import com.kjh.schdul.vo.CalendarVO;
import com.kjh.schdul.vo.SchdulVO;

@Controller
public class SchdulController<E> {
	
	private static final Logger logger = LoggerFactory.getLogger(SchdulController.class);
	
	@Autowired
	SchdulService schdulService;
	
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
	@Auth
	@GetMapping("/schdul/calendar")
	public String calendar(HttpSession session, Model model) {
		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		return "schdul/calendar";
	}
	
	@Auth
	@GetMapping("/schdul/calendarMain")
	public String calendarMain(Model model, HttpSession session) {
		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		List<CalendarVO> list = this.schdulService.selectSchdul("100301");
		
		model.addAttribute("list", list);
		
		return "schdul/calendarMain";
	}
	
	@Auth
	@GetMapping("/schdul/calendarMainAjax")
	@ResponseBody
	public List<CalendarVO> calendarMainAjax(HttpServletRequest request, @RequestParam(value = "checkList[]",required = false) List<String> checkList, @RequestParam(value = "selectAll") String selectAll) {
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();
		List<CalendarVO> list = new ArrayList<CalendarVO>();
		
		if(checkList!=null) {
			for (String checked : checkList) {
				if(checked.equals("private")) {
					List<CalendarVO> privateList = this.schdulService.selectPrivate(empNo);
					list.addAll(0, privateList);
				}else if(checked.equals("dept")) {
					List<CalendarVO> departmentList = this.schdulService.selectDepartment(empNo);
					list.addAll(departmentList);
				}else if(checked.equals("softlab")) {
					List<CalendarVO> softLabList = this.schdulService.selectSoftLab();
					list.addAll(softLabList);
				}else {
					list = new ArrayList<CalendarVO>();
				}
			}
		}//end if
		return list;
	}
	
	@Auth
	@PostMapping("/schdul/calendarAddAjax")
	@ResponseBody
	public List<CalendarVO> calendarAddAjax(HttpServletRequest request, @RequestBody Map<String, String> newEvent) {
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();
		
		// result : {title=126345, start=2021-12-09, end=2021-12-13, startStr=2021-12-09, endStr=2021-12-13, 
		// calendar=S1, description=}
		Random rd = new Random();
		// 다시 테스트 했을 때 id값이 14에 머물러 있었기 때문에 그거보다 더 많은 수가 나오게 
		int rdNum = rd.nextInt(10000)+14;
		int id = Integer.parseInt(newEvent.get("id")) + rdNum;
		int check = this.schdulService.schdulSnCheck(id);
		
		boolean flag = true;
		
		while(flag) {
			if(check != 0) {
				rdNum = rd.nextInt(10000)+14;
				id = Integer.parseInt(newEvent.get("id")) + rdNum;
			}else {
				flag = false;
			}
		}
		
		String schdulSj = newEvent.get("title");
		String schdulCn = newEvent.get("description");
		String bgnDe = newEvent.get("start");
		String endDe = newEvent.get("end");
		String schdulSeCode = newEvent.get("calendar");
		SchdulVO schdul = new SchdulVO(id, empNo, schdulSj, schdulCn, schdulSeCode, bgnDe, endDe);
		
		int result = this.schdulService.insertSchdul(schdul);
		
		List<CalendarVO> list = this.schdulService.selectSchdul(empNo);
		return list;
	}
	
	@Auth
	@PostMapping("/schdul/calendarUpdateAjax")
	@ResponseBody
	public List<CalendarVO> calendarUpdateAjax(HttpServletRequest request, @RequestBody Map<String, String> eventData) {
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();
		// result : {title=126345, start=2021-12-09, end=2021-12-13, startStr=2021-12-09, endStr=2021-12-13, 
		// calendar=S1, description=}
		int id = Integer.parseInt(eventData.get("id"));
		String schdulSj = eventData.get("title");
		String schdulCn = eventData.get("description");
		String bgnDe = eventData.get("start");
		String endDe = eventData.get("end");
		String schdulSeCode = eventData.get("calendar");
		SchdulVO schdul = new SchdulVO(id, empNo, schdulSj, schdulCn, schdulSeCode, bgnDe, endDe);
		
		int result = this.schdulService.updateSchdul(schdul);
		
		List<CalendarVO> list = this.schdulService.selectSchdul(empNo);
		return list;
	}
	
	@Auth
	@PostMapping("/schdul/calendarDeleteAjax")
	@ResponseBody
	public List<CalendarVO> calendarDeleteAjax(HttpServletRequest request, @RequestBody Map<String, String> eventData) {
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();
		// result : {title=126345, start=2021-12-09, end=2021-12-13, startStr=2021-12-09, endStr=2021-12-13, 
		// calendar=S1, description=}
		int schdulSn = Integer.parseInt(eventData.get("id"));
		String schdulSeCode = eventData.get("calendar");
		SchdulVO schdul = new SchdulVO();
		schdul.setEmpNo(empNo);
		schdul.setSchdulSn(schdulSn);
		
		int selectWriter = this.schdulService.selectWriter(schdul);
		
		if(schdulSeCode.equals("S1") || selectWriter == 1) {
			this.schdulService.deleteSchdul(schdulSn);
			List<CalendarVO> list = this.schdulService.selectSchdul(empNo);
			return list;
		}else {
			ArrayList<CalendarVO> emptyList = new ArrayList<CalendarVO>();
			return emptyList;
		}
	}
}
