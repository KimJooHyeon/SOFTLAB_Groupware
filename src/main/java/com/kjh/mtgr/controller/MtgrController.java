package com.kjh.mtgr.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kjh.bbs.vo.Pagination;
import com.kjh.hr.vo.EmpVO;
import com.kjh.login.interceptor.Auth;
import com.kjh.mtgr.service.MtgrService;
import com.kjh.mtgr.vo.MtgrResveVO;
import com.kjh.mtgr.vo.MtgrVO;
import com.kjh.mtgr.vo.ReservationCalendarVO;
import com.kjh.sanction.service.SanctionService;
import com.kjh.schdul.vo.CalendarVO;
import com.kjh.schdul.vo.SchdulVO;

@Controller
public class MtgrController {
	private static final Logger logger = LoggerFactory.getLogger(MtgrController.class);
	
	@Autowired
	MtgrService mtgrService;
	
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
	// 회의실 목록
	@Auth
	@GetMapping("/mtgr/mtgrList")
	public String mtgrList(Model model, HttpServletRequest request, 
			@RequestParam(value="currentPage",defaultValue = "1") int currentPage, HttpSession session) throws Exception {
		empNo = getEmpVO(session);
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
			
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);		
		
		String deptCode = emp.getDeptCode();
		logger.info("deptCode : " + deptCode);
		boolean auth = false;
		
		boolean ifTest = deptCode.equals("CEO") || deptCode.equals("DTR") || deptCode.equals("ADD") || deptCode.equals("GAT");
		logger.info("ifTest : " + ifTest);
		if(ifTest) {
			auth = true;
			model.addAttribute("isAuth", auth);
		}else {
			model.addAttribute("isAuth", auth);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int ing = this.mtgrService.mtgrListCount();
		
		map.put("currentPage", currentPage);
		
		List<Map<String, Object>> mtgrList = this.mtgrService.mtgrList(map);
		
		Pagination paginationIng = new Pagination(ing, currentPage, 10, mtgrList);
		
		model.addAttribute("mtgrList", new Pagination(ing, currentPage, 10, mtgrList));
		model.addAttribute("page", currentPage);
		
		
		return "mtgr/mtgrList";
	}
	
	// 회의실 추가
	@ResponseBody
	@RequestMapping(value="/mtgr/mtgrInsert", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String insertMtgr(Model model, HttpServletRequest request, @RequestParam Map<String,Object> map) {
		MtgrVO mtgrVO = new MtgrVO();
		
		int mtgrUnit = Integer.parseInt(request.getParameter("mtgrUnit"));
		String mtgrNm = request.getParameter("mtgrNm");
		String mtgrLc = request.getParameter("mtgrLc");
		int aceptncNmpr = Integer.parseInt(request.getParameter("aceptncNmpr"));
		
		// 회의실 중복인지, 아닌지 비교
		MtgrVO mtgr = new MtgrVO();
		mtgr.setMtgrUnit(mtgrUnit);
		
		int selectMtgr = this.mtgrService.selectMtgr(mtgr); // 회의실 중복 비교
		
		if(selectMtgr == 1) { // 0 : 등록 가능, 1 : 중복
			return "";
		}else { // 중복이 아닐경우
			mtgrVO.setMtgrUnit(mtgrUnit);
			mtgrVO.setMtgrNm(mtgrNm);
			mtgrVO.setMtgrLc(mtgrLc);
			mtgrVO.setAceptncNmpr(aceptncNmpr);
			int mtgrInsert = this.mtgrService.insertMtgr(mtgrVO);
			model.addAttribute("mtgr", mtgrInsert);
			return "redirect:/mtgr/mtgrList";
		}
		
	}
	
	// 회의실 삭제
	@ResponseBody
	@RequestMapping("/mtgr/mtgrDelete")
	public int deleteMtgr(Model model, HttpServletRequest request) {
		int result = 0;
		int mtgrUnit = 0;
		int selectMtgr = 0;
		String[] unitArr = request.getParameterValues("valueArr");
		MtgrResveVO mtgtResve = new MtgrResveVO();
		
		int size = unitArr.length;
		for(int i=0; i<size; i++) {
			// ---------------------------------------
			mtgrUnit = Integer.parseInt(unitArr[i]);
			logger.info("mtgrUnit : " + mtgrUnit);
			mtgtResve.setMtgrUnit(mtgrUnit);
			logger.info("mtgtResve : " + mtgtResve);
			selectMtgr = this.mtgrService.selectMtgrResve(mtgtResve); // 회의실 중복 비교
			logger.info("selectMtgr : " + selectMtgr);
			// ---------------------------------------
			if (selectMtgr == 0) {
				result = this.mtgrService.deleteMtgr(Integer.parseInt(unitArr[i]));
			} else {
				result = 0;
			}
		}
		logger.info("result : " + result);
		return result;
	}
	
	// 회의실 일정 목록
	@Auth
	@GetMapping("/mtgr/mtgrSchdulList")
	public String mtgrResveSchdul(Model model, HttpSession session) {
		
		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		List<ReservationCalendarVO> list = this.mtgrService.selectReservationSchdul();
		
		model.addAttribute("list", list);
		
		List<MtgrVO> mtgrUnitList = this.mtgrService.mtgrUnitList();
		
		model.addAttribute("mtgrUnitList", mtgrUnitList);
		
		return "mtgr/mtgrSchdulList";
	}
	
	//메인 캘린더 채우기
	@Auth
	@GetMapping("/mtgr/reservationCalendarMainAjax")
	@ResponseBody
	public List<ReservationCalendarVO> reservationCalendarMainAjax(HttpServletRequest request) {
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();
				
		List<ReservationCalendarVO> resevList = this.mtgrService.selectReservationSchdul();

		return resevList;
	}
	
	// 회의실 예약 일정 추가
	@Auth
	@PostMapping("/mtgr/calendarAddAjax")
	@ResponseBody
	public List<ReservationCalendarVO> reservationCalendarAddAjax(HttpServletRequest request, @RequestBody Map<String, String> newEvent) {
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();
		
		// result : {title=126345, start=2021-12-09, end=2021-12-13, startStr=2021-12-09, endStr=2021-12-13, 
		// calendar=S1, description=}
		Random rd = new Random();
		// 다시 테스트 했을 때 id값이 14에 머물러 있었기 때문에 그거보다 더 많은 수가 나오게 
		int rdNum = rd.nextInt(10000)+14;
		int resveSn = Integer.parseInt(newEvent.get("id")) + rdNum;
		rdNum = rd.nextInt(10000)+14;
		resveSn = Integer.parseInt(newEvent.get("id")) + rdNum;
		
		// result : {id=15, title=실적보고, start=2021-12-27 14:00, end=2021-12-27 18:00, 
		//           startStr=2021-12-27 14:00, endStr=2021-12-27 18:00, display=block, calendar=402, description=실적보고}
		//	logger.info("추가resveSn : " + resveSn);
		String start = newEvent.get("start");
		String end = newEvent.get("end");
		String schdulSj = newEvent.get("title");
		String schdulCn = newEvent.get("description");
		String bgnDe = start;
		bgnDe = start + ":00";
		String endDe = end;  
		endDe = end + ":00";
		String bgnTime = start;
		bgnTime = start.substring(start.length()-5, start.length());
		String endTime = end;
		endTime = end.substring(end.length()-5, end.length());

		int unit = Integer.parseInt(newEvent.get("calendar"));
		MtgrResveVO schdul = new MtgrResveVO(resveSn, schdulSj, unit, empNo, bgnDe, bgnTime, endTime, endDe, schdulCn);

		MtgrResveVO mtgtResve = new MtgrResveVO();
		mtgtResve.setMtgrUnit(unit);
		mtgtResve.setRsvDe(bgnDe);
		mtgtResve.setBeginTime(bgnTime);
		mtgtResve.setEndTime(endTime);
		
		int selectResev = this.mtgrService.selectResev(mtgtResve); // 중복인지 아닌지 일정 비교
		if(selectResev == 0) { // 중복이 아닐 경우
			int result = this.mtgrService.insertMtgrResev(schdul); // 일정 추가
			
			List<ReservationCalendarVO> list = this.mtgrService.selectReservationSchdul();
			return list;
		}else { // 중복일 경우
			ArrayList<ReservationCalendarVO> emptyList = new ArrayList<ReservationCalendarVO>();
			return emptyList;
		}
	}
	
	// 회의실 예약 일정 수정
	@Auth
	@PostMapping("/mtgr/calendarUpdateAjax")
	@ResponseBody
	public List<ReservationCalendarVO> reservationCalendarUpdateAjax(HttpServletRequest request, @RequestBody Map<String, String> eventData) {
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();
				
		int resveSn = Integer.parseInt(eventData.get("id"));
		String start = eventData.get("start");
		String end = eventData.get("end");
		// result : {schdulSj=개발팀 회의, unit=301, bgnDe=2021-12-27 10:48, endDe=2021-12-27 15:48, schdulCn=aaaaa}
		String schdulSj = eventData.get("title");
		String schdulCn = eventData.get("description");
		String bgnDe = start;
		bgnDe = start + ":00";
		String endDe = eventData.get("endDe");  
		endDe = end + ":00";
		String bgnTime = start;
		bgnTime = start.substring(start.length()-5, start.length());
		String endTime = end;
		endTime = end.substring(end.length()-5, end.length());
		
		int unit = Integer.parseInt(eventData.get("calendar"));
		MtgrResveVO schdul = new MtgrResveVO(resveSn, schdulSj, unit, empNo, bgnDe, bgnTime, endTime, endDe, schdulCn);
		
		// 작성자인지, 아닌지 비교
		MtgrResveVO mtgtResve = new MtgrResveVO();
		mtgtResve.setEmpNo(empNo);
		mtgtResve.setResveSn(resveSn);
		
		int selectWriter = this.mtgrService.selectWriter(mtgtResve); // 작성자 비교
		
		if(selectWriter == 1) { // 0 : 작성자 아님, 1 : 작성자일경우 
			int result = this.mtgrService.updateMtgrResev(schdul); // 수정
			
			List<ReservationCalendarVO> list = this.mtgrService.selectReservationSchdul();
			return list;
		}else { // 작성자 아닐경우
			ArrayList<ReservationCalendarVO> emptyList = new ArrayList<ReservationCalendarVO>();
			return emptyList;
		}
	}
	
	// 회의실 예약 일정 취소
	@PostMapping("/mtgr/calendarDeleteAjax")
	@ResponseBody
	public List<ReservationCalendarVO> reservationCalendarDeleteAjax(HttpServletRequest request, @RequestBody Map<String, String> eventData) {
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();
				
		// result : {title=126345, start=2021-12-09, end=2021-12-13, startStr=2021-12-09, endStr=2021-12-13, 
		// calendar=S1, description=}
		int resveSn = Integer.parseInt(eventData.get("id"));

		// 작성자인지, 아닌지 비교
		MtgrResveVO mtgtResve = new MtgrResveVO();
		mtgtResve.setEmpNo(empNo);
		mtgtResve.setResveSn(resveSn);
		
		int selectWriter = this.mtgrService.selectWriter(mtgtResve); // 작성자 비교
		
		if(selectWriter == 1) { // 0 : 작성자 아님, 1 : 작성자
			this.mtgrService.deleteMtgrResev(resveSn); // 삭제
			List<ReservationCalendarVO> list = this.mtgrService.selectReservationSchdul();
			return list;
		}else { // 작성자 아닐경우
			ArrayList<ReservationCalendarVO> emptyList = new ArrayList<ReservationCalendarVO>();
			return emptyList;
		}
	}
	
	@Auth
	@GetMapping("/mtgr/mtgrResevCancelList")
	public String mtgrResevCancelList(Model model, HttpSession session) {
		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		List<Map<String, Object>> mtgrResevCancelList = this.mtgrService.mtgrResevCancelList();
		
		model.addAttribute("mtgrResevCancelList", mtgrResevCancelList);
		
		return "mtgr/mtgrResevCancelList";
	}
}
