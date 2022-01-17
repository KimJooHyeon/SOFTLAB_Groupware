package kr.or.ddit.bbs.controller;


import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.bbs.service.AnswerService;
import kr.or.ddit.bbs.vo.AnswerVO;
import kr.or.ddit.hr.controller.HrController;
import kr.or.ddit.hr.vo.EmpVO;
import kr.or.ddit.login.interceptor.Auth;
import kr.or.ddit.sanction.service.SanctionService;

@Controller
public class AnswerController {
	@Autowired
	AnswerService answerService;
	
	@Auth
	@PostMapping("/answer/answerDelete")
	@ResponseBody
	public List<Map<String, Object>> answerDelete(@RequestBody Map<String, String> data, HttpServletRequest request){
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();
		
		int answerSn = Integer.parseInt(data.get("answerSn"));
		String bbscttSn = data.get("bbscttSn");
		
		int deleteResult = this.answerService.deleteAnswer(answerSn);
		List<Map<String, Object>> answerList = new ArrayList<Map<String,Object>>();
		
		answerList = this.answerService.selectAnswer(bbscttSn);
		
		return answerList;
	}
	
	@Auth
	@PostMapping("/answer/answerAdd")
	@ResponseBody
	public List<Map<String, Object>> answerAdd(@RequestBody Map<String, String> data ,HttpServletRequest request) {
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();
		/** 날짜 **/
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formatedNow = now.format(formatter);
		/** 날짜 끝 **/
		
		String bbscttSn = data.get("bbscttSn");
		String answerCn = data.get("answerCn");
		
		if((answerCn.indexOf("\n")) >= 0){
			answerCn = answerCn.replaceAll("\n", "<br>");
		}
		// {answerCn=123, bbscttSn=102}
		
		AnswerVO answer = new AnswerVO();
		answer.setEmpNo(empNo);
		answer.setWritngDe(formatedNow);
		answer.setAnswerCn(answerCn);
		answer.setBbscttSn(bbscttSn);
		
		this.answerService.insertAnswer(answer);
		
		List<Map<String, Object>> answerList = this.answerService.selectAnswer(bbscttSn);
		
		return answerList;
	}
	
	@Auth
	@PostMapping("/answer/update")
	@ResponseBody
	public List<Map<String, Object>> update(@RequestBody Map<String, String> data ,HttpServletRequest request) {
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();
		/** 날짜 **/
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formatedNow = now.format(formatter);
		/** 날짜 끝 **/
		
		String updateCn = data.get("updateCn");
		String updateSn = data.get("updateSn");
		String bbscttSn = data.get("bbscttSn");
		
		// {updateCn=DSFS<br>DSFAF, updateSn=30, bbscttSn=145}
		
//		if((answerCn.indexOf("\n")) >= 0){
//			log.info("줄바꿈이 포함됨");
//			answerCn = answerCn.replaceAll("\n", "<br>");
//		}
		
		AnswerVO answer = new AnswerVO();
		answer.setUpdDe(formatedNow);
		answer.setAnswerCn(updateCn);
		answer.setAnswerSn(Integer.parseInt(updateSn));
		
		this.answerService.updateAnswer(answer);
		
		List<Map<String, Object>> answerList = this.answerService.selectAnswer(bbscttSn);
		
		return answerList;
	}
}
