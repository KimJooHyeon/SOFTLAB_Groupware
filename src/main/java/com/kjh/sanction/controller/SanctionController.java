package com.kjh.sanction.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kjh.dclz.service.DclzService;
import com.kjh.dclz.vo.YrycVO;
import com.kjh.hr.service.EmpService;
import com.kjh.hr.vo.EmpVO;
import com.kjh.sanction.service.SanctionService;
import com.kjh.sanction.vo.DrftFormVO;
import com.kjh.sanction.vo.ElctrnSanctnVO;
import com.kjh.sanction.vo.Pagination;

@Controller
@RequestMapping("/sanction")
public class SanctionController {
	@Autowired
	SanctionService service;

	@Autowired
	EmpService empService;
	
	@Autowired
	DclzService dclzService;

	private static final Logger logger = LoggerFactory.getLogger(SanctionController.class);
	
//	public String empNo = "100101";
	public String empNo = "";
	
	// ???????????? ????????? ??? ????????? ?????? ????????????
	public String getEmpVO(HttpSession session) {
		
		EmpVO vo = (EmpVO) session.getAttribute("EMPVO");
		
		if (vo != null) {
			empNo = vo.getEmpNo();
			return empNo;
			
		} else {
			return "";
		}
	}
	
	// tiles - aisde??? ???????????? ?????? ???????????? ??????
	public Map<String, Object> sanctnCount(String empNo) {
		
		Map<String, Object> sanctnCountMap = this.service.sanctnCount(empNo);
		sanctnCountMap.put("empNo", empNo);
		
		return sanctnCountMap;
	}

	@GetMapping("/sanctnList")
	public String sanctnList(@RequestParam String tab, String btnCode, @RequestParam(value="currentPage", defaultValue = "1") int currentPage) {
		
		String queryString = "?tab=" + tab + "&btnCode=" + btnCode + "&currentPage=" + currentPage;
		
		if (tab.equals("request")) {
			return "redirect:/sanction/elctrnSanctnRequestList" + queryString;
		} else if (tab.equals("tmpr")) {
			return "redirect:/sanction/elctrnSanctnTmprList" + queryString;
		} else if (tab.equals("rtrvl")) {
			return "redirect:/sanction/elctrnSanctnRtrvlList" + queryString;
		} else if (tab.equals("wait")) {
			return "redirect:/sanction/elctrnSanctnWaitList" + queryString;
		} else if (tab.equals("under")) {
			return "redirect:/sanction/elctrnSanctnUnderList" + queryString;
		} else if (tab.equals("done")) {
			return "redirect:/sanction/elctrnSanctnDoneList" + queryString;
		} else if (tab.equals("return")) {
			return "redirect:/sanction/elctrnSanctnReturnList" + queryString;
		} else if (tab.equals("cc")) {
			return "redirect:/sanction/elctrnSanctnCcList" + queryString;
		} else { // tab => ????????????
			return "redirect:/sanction/elctrnSanctnDisplayList" + queryString;
		}
	}
	
	@GetMapping("/sanctnDetail")
	public String sanctnDetail(@RequestParam int elctrnSanctnSn, String tab, String btnCode) {
		
		int fileSn = this.service.fileSnBySn(elctrnSanctnSn);
		String queryString = "?tab=" + tab + "&elctrnSanctnSn=" + elctrnSanctnSn + "&btnCode=" + btnCode + "&fileSn=" + fileSn;

		if (tab.equals("request")) {
			return "redirect:/sanction/requestDetail" + queryString;
		} else if (tab.equals("tmpr")) {
			return "redirect:/sanction/tmprDetail" + queryString;
		} else if (tab.equals("rtrvl")) {
			return "redirect:/sanction/retrieveDetail" + queryString;
		} else if (tab.equals("wait")) {
			return "redirect:/sanction/waitDetail" + queryString;
		} else if (tab.equals("under")) {
			return "redirect:/sanction/underDetail" + queryString;
		} else if (tab.equals("done")) {
			return "redirect:/sanction/doneDetail" + queryString;
		} else if (tab.equals("return")) {
			return "redirect:/sanction/returnDetail" + queryString;
		} else if (tab.equals("cc")) {
			return "redirect:/sanction/ccDetail" + queryString;
		} else { // tab => ????????????
			return "redirect:/sanction/displayDetail" + queryString;
		}
	}
	
	// ??? ???????????? ?????? ??????
	@PostMapping("/elctrnSanctnSearch")
	public String elctrnSanctnSearch(@RequestParam String tab, String keyword, @RequestParam(value="currentPage", defaultValue = "1") int currentPage) throws UnsupportedEncodingException {

		String encodedKeyword = URLEncoder.encode(keyword, "UTF-8");
		String queryString = "?tab=" + tab + "&empNo=" + empNo + "&keyword=" + encodedKeyword + "&currentPage=" + currentPage;;

		if (tab.equals("request")) {
			return "redirect:/sanction/elctrnSanctnDrftRequestSearch" + queryString;
		} else if (tab.equals("tmpr")) {
			return "redirect:/sanction/elctrnSanctnDrftTmprSearch" + queryString;
		} else if (tab.equals("rtrvl")) {
			return "redirect:/sanction/elctrnSanctnDrftRtrvlSearch" + queryString;
		} else if (tab.equals("wait")) {
			return "redirect:/sanction/elctrnSanctnWaitSearch" + queryString;
		} else if (tab.equals("under")) {
			return "redirect:/sanction/elctrnSanctnUnderSearch" + queryString;
		} else if (tab.equals("done")) {
			return "redirect:/sanction/elctrnSanctnDoneSearch" + queryString;
		} else if (tab.equals("return")) {
			return "redirect:/sanction/elctrnSanctnReturnSearch" + queryString;
		} else if (tab.equals("cc")) {
			return "redirect:/sanction/elctrnSanctnCcSearch" + queryString;
		} else { // tab => ????????????
			return "redirect:/sanction/elctrnSanctnDisplaySearch" + queryString;
		}
	}
	
	// ?????? ??? ????????? ?????? ??????
	@PostMapping("/briefLine")
	@ResponseBody
	public List<Map<String, Object>> briefLine(@RequestParam int elctrnSanctnSn) {
		
		List<Map<String, Object>> lineList = this.service.sanctnLineList(elctrnSanctnSn);
		
		return lineList;
	}
	
	// ????????? ????????? ????????? ??????
	@PostMapping("/ccEmpInfoBySn")
	@ResponseBody
	public List<Map<String, Object>> ccEmpInfoBySn(@RequestParam int elctrnSanctnSn) {
		
		List<Map<String, Object>> ccList = this.service.ccEmpInfoBySn(elctrnSanctnSn);
		
		return ccList;
	}
	
	// ????????? ????????? ?????? ??????
	@PostMapping("/briefFile")
	@ResponseBody
	public List<Map<String, Object>> briefFile(@RequestParam int elctrnSanctnSn) {
		
		int fileSn = this.service.fileSnBySn(elctrnSanctnSn);
		List<Map<String, Object>> fileList = this.service.fileList(fileSn);
		
		return fileList;
	}

	// ???????????? ???????????? ?????? ?????? (????????? ????????? ??????)
	@PostMapping("/getSanctnLine")
	@ResponseBody
	public List<Map<String, Object>> getSanctnLine(@RequestParam int elctrnSanctnSn) {
		
		List<Map<String, Object>> lineMap = this.service.sanctnLineList2(elctrnSanctnSn);
		
		return lineMap;
	}
	
	// 1-1. ?????? ??????
	@GetMapping("/elctrnSanctnDrftFormList")
	public String formList(Model model, HttpSession session) {
		
		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);

		return "sanction/elctrnSanctnDrftFormList";
	}

	// 1-2. ?????? ??????
	@PostMapping("/elctrnSanctnDrftFormSearch")
	public String formSearch(Model model, HttpSession session, @RequestParam String keyword) {

		empNo = getEmpVO(session);
		
		if (empNo == null) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formSearch(keyword);

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);

		return "sanction/elctrnSanctnDrftFormList";
	}

	// 1-3. ?????? ??????
	@GetMapping("/elctrnSanctnDrftFormDetail")
	public String formDetail(Model model, HttpSession session, @RequestParam int drftFormSn, int snNumber,
							@RequestParam(required = false) String docSj, @RequestParam(required = false) String docCn) throws Exception {

		empNo = getEmpVO(session);
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);

		DrftFormVO vo = this.service.formDetail(drftFormSn);

		Map<String, Object> map = this.service.empInfoByEmpNo(empNo);

		model.addAttribute("vo", vo);
		model.addAttribute("map", map);
		model.addAttribute("formNm", vo.getFormNm());
		model.addAttribute("snNumber", snNumber);

		// ????????????
		List<Map<String, Object>> deptList = empService.deptList(map);
		model.addAttribute("deptList", deptList);

		// ????????????
		List<Map<String, Object>> empList = empService.deptEmpList(map);
		model.addAttribute("deptEmpList", empList);

		// ????????????
		List<Map<String, Object>> teamList = empService.teamList(map);
		model.addAttribute("teamList", teamList);
		
		if (docSj != null && docCn != null) {
			model.addAttribute("docSj", docSj);
			model.addAttribute("docCn", docCn);
		} else if (docSj != null) {
			model.addAttribute("docSj", docSj);
		} else if (docCn != null) {
			model.addAttribute("docCn", docCn);
		} 

		return "sanction/elctrnSanctnDrftFormDetail";
	}
	
	// 1-3-2. ?????? ?????? (POST)
	@PostMapping("/elctrnSanctnDrftFormDetailPost")
	public String formDetailPost(Model model, HttpSession session, @RequestParam int drftFormSn, 
							@RequestParam(required = false) String docSj, @RequestParam(required = false) String docCn) throws Exception {
		
		empNo = getEmpVO(session);
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);

		DrftFormVO vo = this.service.formDetail(drftFormSn);

		Map<String, Object> map = this.service.empInfoByEmpNo(empNo);

		model.addAttribute("vo", vo);
		model.addAttribute("map", map);
		model.addAttribute("formNm", vo.getFormNm());
		model.addAttribute("drftFormSn", drftFormSn); // ??????

		// ????????????
		List<Map<String, Object>> deptList = empService.deptList(map);
		model.addAttribute("deptList", deptList);

		// ????????????
		List<Map<String, Object>> empList = empService.deptEmpList(map);
		model.addAttribute("deptEmpList", empList);

		// ????????????
		List<Map<String, Object>> teamList = empService.teamList(map);
		model.addAttribute("teamList", teamList);
		
		if (docSj != null && docCn != null) {
			model.addAttribute("docSj", docSj);
			model.addAttribute("docCn", docCn);
		} else if (docSj != null) {
			model.addAttribute("docSj", docSj);
		} else if (docCn != null) {
			model.addAttribute("docCn", docCn);
		} 

		return "sanction/elctrnSanctnDrftFormDetail";
	}
	
	// 1-4. ?????? ?????? ?????? (??????, ??????)
	@PostMapping("/sanctnAdd")
	@Transactional
	public String sanctnAdd(RedirectAttributes redirectAttributes, HttpSession session, 
			@RequestParam Map<String, Object> map, MultipartFile[] uploadFiles) throws IOException, SQLException {
		
		empNo = getEmpVO(session);
		
		String formNm = map.get("formNm").toString();
		String docSj = map.get("docSj").toString();
		String docCn = map.get("docCn").toString();
		String sanctnFormCode = "";
		
		if (formNm.equals("?????????")) {
			sanctnFormCode = "S1";
			
		} else if (formNm.equals("???????????????") && !docSj.contains("[???????????????]")) {
			docSj = "[???????????????] " + docSj;
			sanctnFormCode = "S2";
			
		} else if (formNm.equals("???????????????") && !docSj.contains("[???????????????]")) {
			docSj = "[???????????????] " + docSj;
			sanctnFormCode = "S3";
			
		} else if (formNm.equals("????????????????????????") && !docSj.contains("[????????????????????????]")) {
			docSj = "[????????????????????????] " + docSj;
			sanctnFormCode = "S4";
		}

		// ???????????? ?????? ???????????? ??????
		Map<String, Object> addDocMap = new HashMap<>();
		addDocMap.put("empNo", empNo);
		addDocMap.put("docSj", docSj);
		addDocMap.put("docCn", docCn); 
		addDocMap.put("sanctnFormCode", sanctnFormCode);
		addDocMap.put("fileSn", 0);
		
		boolean isAddSuccess = this.service.sanctnAdd(addDocMap);
//		logger.info("????????? ???????????? : " + addDocMap.get("elctrnSanctnSn"));
		
		int elctrnSanctnSn = Integer.parseInt(addDocMap.get("elctrnSanctnSn").toString());
		
		if(sanctnFormCode.equals("S2")) { // ????????? ????????? ?????? 
			Map<String, Object> searchMap = new HashMap<>();
			searchMap.put("elctrnSanctnSn", elctrnSanctnSn);
			searchMap.put("vcatnSn", map.get("snNumber"));
			
			// ??????????????? ????????? ???????????? ???????????? ?????? 
			this.dclzService.updateVcatn(searchMap);
			
		}else if(sanctnFormCode.equals("S3")) { // ????????? ????????? ?????? 
			Map<String, Object> searchMap = new HashMap<>();
			searchMap.put("elctrnSanctnSn", elctrnSanctnSn);
			searchMap.put("bsrpSn", map.get("snNumber"));
			
			// ??????????????? ????????? ???????????? ???????????? ??????
			this.dclzService.updateBsrp(searchMap);
		}
		
		// ???????????? ???????????? ??????
		String nm1 = map.get("nm1").toString();
		String nm2 = map.get("nm2").toString();
		String nm3 = map.get("nm3").toString();
		
		boolean addLineMapSuccess = this.service.drftSanctnLineAdd(empNo);
		if (addLineMapSuccess) {
//			logger.info("????????? ???????????? ?????? ??????");
		}
		
		Map<String, Object> lineAddMap = new HashMap<>();
		
		if (nm1.length() != 0) {
			lineAddMap.put("empNo", nm1);
			lineAddMap.put("sanctnSttusCode", "S1");
			this.service.sanctnLineAdd(lineAddMap);
//			logger.info("nm1 ???????????? ?????? ??????");
		}
		
		if (nm2.length() != 0) {
			lineAddMap.put("empNo", nm2);
			lineAddMap.put("sanctnSttusCode", "S4");
			this.service.sanctnLineAdd(lineAddMap);
//			logger.info("nm2 ???????????? ?????? ??????");
		}
		
		if (nm3.length() != 0) {
			lineAddMap.put("empNo", nm3);
			lineAddMap.put("sanctnSttusCode", "S4");
			this.service.sanctnLineAdd(lineAddMap);
//			logger.info("nm3 ???????????? ?????? ??????");
		}
		
		// ?????? ?????? ????????? ????????? ???????????? ?????? ?????? ????????? ?????????
		if (isAddSuccess) {
			
			if (map.containsKey("elctrnSanctnSn")) {
				String beforeSn = map.get("elctrnSanctnSn").toString();
				int tmprAt = this.service.tmprAt(Integer.valueOf(beforeSn));
				
				if (tmprAt != 0) {
					this.service.tmprDelete(Integer.valueOf(beforeSn));
				}
			}
		}
		
		// ???????????? ????????? ?????? ??????======================================
//		logger.info("?????? ????????? ?????? ??????");
		
		/** 1.???????????? ??????(??????????????????, ??????, ?????????, ????????????) */
		String uploadFolder = "C:\\dalmuti\\dalmuti\\src\\main\\webapp\\resources\\upload";
		
		/** 2.???????????? ?????? */
		// ??????????????? ????????? ??????, ????????? ?????????
//		logger.info("uploadFiles?????? : " + uploadFiles.length);
		String[] originalFileNameArr = new String[uploadFiles.length];
		int originalFileNameCnt = 0;
		
		// ???????????? ??????
		for (MultipartFile multipartFile : uploadFiles) {
//			logger.info("???????????? ?????? ????????? ????????? >> ");
			if (multipartFile.getOriginalFilename().length() < 1) {
				originalFileNameArr[originalFileNameCnt] = "nodata";
				originalFileNameCnt++;
				
			} else {
				originalFileNameArr[originalFileNameCnt] = multipartFile.getOriginalFilename();
				originalFileNameCnt++;
			}
		}
		
//		logger.info("originalFileNameArr.length : " + originalFileNameArr.length + ", originalFileNameArr[0] : " + originalFileNameArr[0]);
		
		// ????????? ?????? ?????? ?????????
		if (!originalFileNameArr[0].equals("nodata")) {
			int fileSn = this.service.nextFileSn();
			
			/** 3.????????? ?????? ???????????? ?????? */
			Map<String, Object> param = new HashMap<>();
			param.put("uploadFiles", uploadFiles);
			param.put("serialNumber", fileSn);
			param.put("uploadFolder", uploadFolder); 
			
			/** 4.????????? ??????(2??? ????????? ?????? ???????????? ??????) */
			Map<String, Object> updateFileMap = new HashMap<>();
			updateFileMap.put("fileSn", fileSn);
			updateFileMap.put("elctrnSanctnSn", elctrnSanctnSn);
			
			this.service.fileAdd(param);
			this.service.addFileSnToSanctn(updateFileMap);
			
			/** 5.??????????????? ??????????????????(??????????????????, ??????) */
			redirectAttributes.addAttribute("fileSn", fileSn);
//			redirectAttributes.addAttribute("fileNmList", param.get("fileNmList"));
//			redirectAttributes.addAttribute("realFileNmList", param.get("realFileNmList"));
			
		}
		// ???????????? ????????? ?????? ???======================================
		
		redirectAttributes.addAttribute("formNm", formNm);
		redirectAttributes.addAttribute("nm1", nm1);
		redirectAttributes.addAttribute("nm2", nm2);
		redirectAttributes.addAttribute("nm3", nm3);
		
		return "redirect:/sanction/requestDetail?elctrnSanctnSn=" + elctrnSanctnSn + "&btnCode=bc2";
	}

	// 2-1. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnRequestList")
	public String requestList(Model model, HttpSession session, @RequestParam String tab, String btnCode,
								@RequestParam(value="currentPage", defaultValue = "1") int currentPage) {
		
		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		
		/** ????????? ?????? */
		Map<String, Object> requestMap = new HashMap<>();
		
		int total = this.service.requestListCount(empNo); // ????????? ???
		
		requestMap.put("empNo", empNo);
		requestMap.put("currentPage", currentPage);
		List<Map<String, Object>> mapList = this.service.requestList(requestMap);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */
		
		model.addAttribute("mapList", pagination);
		model.addAttribute("tab", tab);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("btnCode", btnCode);

		return "sanction/elctrnSanctnDrftList";
	}
	
	// 2-2. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnDrftRequestSearch")
	public String requestSearch(Model model, @RequestParam String empNo, String keyword, String tab,
								@RequestParam(value="currentPage",defaultValue = "1") int currentPage) {

		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);

		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("keyword", keyword);
		
		/** ????????? ?????? */
		map.put("currentPage", currentPage);
		
		int total = this.service.requestSearchCount(map);
		
		List<Map<String, Object>> mapList = this.service.requestSearch(map);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */

		model.addAttribute("mapList", pagination);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("tab", tab);

		return "sanction/elctrnSanctnDrftList";
	}

	// 2-3. ?????? ?????? ??????
	@GetMapping("/requestDetail")
	public String requestDetail(Model model, HttpSession session, @RequestParam int elctrnSanctnSn, String btnCode, String nm1, String nm2, String nm3, String fileSn) {
		
		empNo = getEmpVO(session);
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		
		String formNm = this.service.formName(elctrnSanctnSn);
		model.addAttribute("formNm", formNm);
		
		Map<String, Object> drftEmpMap = this.service.drftEmpNameBySn(elctrnSanctnSn);
		model.addAttribute("drftEmpMap", drftEmpMap);
		
		ElctrnSanctnVO vo = new ElctrnSanctnVO();
		vo.setElctrnSanctnSn(elctrnSanctnSn);
		vo.setEmpNo(empNo);
		vo = this.service.requestDetail(vo);
		
		// ???????????? ?????? ????????????
		List<Map<String, Object>> lineInfoList = this.service.sanctnLineList(elctrnSanctnSn);
		
		Map<String, Object> lineMap = new HashMap<>();
		int count = 0;
		for (Map<String, Object> list : lineInfoList) {
			lineMap.put("nm" + String.valueOf(count), list);
			count++;
		} 
		model.addAttribute("lineMap", lineMap);
		
		List<Map<String, Object>> fileList = new ArrayList<>();
		
		if (fileSn == null) {
//			logger.info("??????");
		}
		
		if (fileSn != null) {
//			logger.info("??????");
			fileList = this.service.fileList(Integer.valueOf(fileSn));
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("btnCode", btnCode);
		model.addAttribute("fileSn", fileSn);
		model.addAttribute("fileList", fileList);
		
		return "sanction/elctrnSanctnDetail";
	}

	// 3-1. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnTmprList")
	public String tmprList(Model model, HttpSession session, @RequestParam String tab, String btnCode,
							@RequestParam(value="currentPage", defaultValue = "1") int currentPage) {

		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		
		/** ????????? ?????? */
		Map<String, Object> tmprMap = new HashMap<>();
		
		int total = this.service.tmprListCount(empNo); // ????????? ???
		
		tmprMap.put("empNo", empNo);
		tmprMap.put("currentPage", currentPage);
		List<Map<String, Object>> mapList = this.service.tmprList(tmprMap);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */


		model.addAttribute("mapList", pagination);
		model.addAttribute("tab", tab);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("btnCode", btnCode);
		model.addAttribute("deleteCheckBox", "yes");

		return "sanction/elctrnSanctnDrftList";
	}

	// 3-2. ?????? ?????? ?????? (????????????)
	@PostMapping("deleteCheckBoxTmpr")
	@ResponseBody
	public boolean deleteCheckBoxTmpr(@RequestParam String[] checkedArray) {
		
		boolean isSuccess = false;
		
		if (checkedArray != null) {
			for (String serialNumber : checkedArray) {
				int elctrnSanctnSn = Integer.valueOf(serialNumber);
				isSuccess = this.service.tmprDelete(elctrnSanctnSn);
			}
		}
		
		return isSuccess;
	}

	// 3-3. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnDrftTmprSearch")
	public String tmprSearch(Model model, @RequestParam String empNo, String keyword, String tab,
							@RequestParam(value="currentPage",defaultValue = "1") int currentPage) {
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);

		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("keyword", keyword);
		
		/** ????????? ?????? */
		map.put("currentPage", currentPage);
		
		int total = this.service.requestSearchCount(map);
		
		List<Map<String, Object>> mapList = this.service.tmprSearch(map);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */
		
		
		model.addAttribute("mapList", pagination);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("btnCode", "bc3");
		model.addAttribute("tab", tab);
		model.addAttribute("deleteCheckBox", "yes");

		return "sanction/elctrnSanctnDrftList";
	}
	
	// 3-4. ?????? ?????? ?????? ??????
	@PostMapping("/tmprAdd")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> tmprAdd(Model model, HttpSession session, @RequestParam Map<String, Object> map) {
		
		empNo = getEmpVO(session);
		
		String sj = map.get("docSj").toString();
		String cn = map.get("docCn").toString();
		
		Map<String, Object> addMap = new HashMap<>();
		addMap.put("docSj", sj);
		addMap.put("docCn", cn);
		addMap.put("empNo", empNo);

		this.service.tmprAdd(addMap);
		
		return ResponseEntity.ok(addMap);
	}

	// 3-5. ?????? ?????? ?????? ??????
	@GetMapping("/tmprDetail")
	public String tmprDetail(Model model, HttpSession session, @RequestParam int elctrnSanctnSn, String btnCode) throws Exception {

		empNo = getEmpVO(session);
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		
		String formNm = this.service.formName(elctrnSanctnSn);
		model.addAttribute("formNm", formNm);
		
		Map<String, Object> drftEmpMap = this.service.drftEmpNameBySn(elctrnSanctnSn);
		model.addAttribute("drftEmpMap", drftEmpMap);
		
		ElctrnSanctnVO vo = new ElctrnSanctnVO();
		vo.setElctrnSanctnSn(elctrnSanctnSn);
		vo.setEmpNo(empNo);
		vo = this.service.tmprDetail(vo);

		Map<String, Object> map = this.service.empInfoByEmpNo(empNo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("map", map);
		model.addAttribute("btnCode", btnCode);

		// ????????????
		List<Map<String, Object>> deptList = empService.deptList(map);
		model.addAttribute("deptList", deptList);

		// ????????????
		List<Map<String, Object>> empList = empService.deptEmpList(map);
		model.addAttribute("deptEmpList", empList);

		// ????????????
		List<Map<String, Object>> teamList = empService.teamList(map);
		model.addAttribute("teamList", teamList);

		return "sanction/elctrnSanctnDrftTmprDetail";
	}

	// 3-6. ?????? ?????? ?????? ??????
	@PostMapping("/tmprAtModify")
	@ResponseBody
	public boolean tmprAtModify(@RequestParam Map<String, Object> map) {
		
		boolean isSuccess = this.service.tmprAtModify(map);
		
		return isSuccess;
	}

	// 3-7. ?????? ?????? ?????? ??????
	@PostMapping("/tmprDelete")
	@ResponseBody
	public boolean tmprDelete(@RequestParam int elctrnSanctnSn) {
		
		boolean isSuccess = this.service.tmprDelete(elctrnSanctnSn);
		
		return isSuccess;
	}

	// 4-1. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnRtrvlList")
	public String retrieveList(Model model, HttpSession session, @RequestParam String tab, String btnCode,
								@RequestParam(value="currentPage", defaultValue = "1") int currentPage) {

		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		
		/** ????????? ?????? */
		Map<String, Object> rtrvlMap = new HashMap<>();
		
		int total = this.service.rtrvlListCount(empNo); // ????????? ???
		
		rtrvlMap.put("empNo", empNo);
		rtrvlMap.put("currentPage", currentPage);
		List<Map<String, Object>> mapList = this.service.rtrvlList(rtrvlMap);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */

		model.addAttribute("mapList", pagination);
		model.addAttribute("tab", tab);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("btnCode", btnCode);
		model.addAttribute("deleteCheckBox", "yes");

		return "sanction/elctrnSanctnDrftList";
	}

	// 4-2. ?????? ?????? ?????? ?????? (???????????? ???????????? ????????? ??????)
	@PostMapping("/sanctionLineDelete")
	@ResponseBody
	public boolean rtrvlSanctnLineDelete(HttpSession session, @RequestParam int elctrnSanctnSn) {
		
		empNo = getEmpVO(session);
		
		String sanctnDe = this.service.rtrvlSanctnConfirmAt(elctrnSanctnSn);
		
		if (sanctnDe != null) {
			return false;
			
		} else {
			Map<String, Object> map = new HashMap<>();
			map.put("elctrnSanctnSn", elctrnSanctnSn);
			map.put("empNo", empNo);
			
			boolean isSuccess = this.service.rtrvlSanctnLineDelete(map);
//		logger.info("isSuccess : " + isSuccess);
			
			boolean isModifySuccess = false;
			boolean isCcDeleteSuccess = false;
			
			if (isSuccess) {
//			logger.info("???????????? ?????? ??????");
				isCcDeleteSuccess = this.service.rtrvlCcDelete(map);
				isModifySuccess = this.service.rtrvlAtModify(elctrnSanctnSn);
				
				if (isCcDeleteSuccess) {
//				logger.info("????????? ?????? ??????");
				}
				
				if (isModifySuccess) {
//				logger.info("???????????? ?????? ??????");
				}
			}
			return isModifySuccess;
		}
	}
	
	// 4-3. ?????? ?????? ?????? (????????????)
	@PostMapping("deleteCheckBoxRtrvl")
	@ResponseBody
	public boolean deleteCheckBoxRtrvl(@RequestParam String[] checkedArray) {
		
		boolean isSuccess = false;
		
		if (checkedArray != null) {
			for (String serialNumber : checkedArray) {
				int elctrnSanctnSn = Integer.valueOf(serialNumber);
				isSuccess = this.service.rtrvlDelete(elctrnSanctnSn);
			}
		}
		
		return isSuccess;
	}
	
	// 4-4. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnDrftRtrvlSearch")
	public String rtrvlSearch(Model model, @RequestParam String empNo, String keyword, String tab,
								@RequestParam(value="currentPage",defaultValue = "1") int currentPage) {

		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);

		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("keyword", keyword);

		/** ????????? ?????? */
		map.put("currentPage", currentPage);
		
		int total = this.service.requestSearchCount(map);
		
		List<Map<String, Object>> mapList = this.service.rtrvlSearch(map);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */

		model.addAttribute("mapList", pagination);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("btnCode", "bc3");
		model.addAttribute("tab", tab);
		model.addAttribute("deleteCheckBox", "yes");

		return "sanction/elctrnSanctnDrftList";
	}

	// 4-5. ?????? ?????? ??????
	@GetMapping("/retrieveDetail")
	public String retrieveDetail(Model model, HttpSession session, @RequestParam int elctrnSanctnSn, String btnCode) {

		empNo = getEmpVO(session);
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		
		String formNm = this.service.formName(elctrnSanctnSn);
		model.addAttribute("formNm", formNm);
		
		Map<String, Object> drftEmpMap = this.service.drftEmpNameBySn(elctrnSanctnSn);
		model.addAttribute("drftEmpMap", drftEmpMap);

		ElctrnSanctnVO vo = new ElctrnSanctnVO();
		vo.setElctrnSanctnSn(elctrnSanctnSn);
		vo.setEmpNo(empNo);
		vo = this.service.rtrvlDetail(vo);
		
		// ???????????? ?????? ????????????
		List<Map<String, Object>> lineInfoList = this.service.sanctnLineList(elctrnSanctnSn);
		
		Map<String, Object> lineMap = new HashMap<>();
		int count = 0;
		for (Map<String, Object> list : lineInfoList) {
			lineMap.put("nm" + String.valueOf(count), list);
			count++;
		} 
		model.addAttribute("lineMap", lineMap);

		int fileSn = vo.getFileSn();
		List<Map<String, Object>> fileList = this.service.fileList(fileSn);

		model.addAttribute("fileList", fileList);
		model.addAttribute("vo", vo);
		model.addAttribute("btnCode", btnCode);
		model.addAttribute("deleteBox", "yes");

		return "sanction/elctrnSanctnDetail";
	}
	
	// 4-6. ?????? ?????? ??????
	@PostMapping("/rtrvlDelete")
	@ResponseBody
	public boolean rtrvlDelete(@RequestParam int elctrnSanctnSn) {
		
		boolean isSuccess = this.service.rtrvlDelete(elctrnSanctnSn);
		
		return isSuccess;
	}
	
	// 5-1. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnWaitList")
	public String waitList(Model model, HttpSession session, @RequestParam String tab, String btnCode,
						@RequestParam(value="currentPage", defaultValue = "1") int currentPage) {

		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		
		/** ????????? ?????? */
		Map<String, Object> waitMap = new HashMap<>();
		
		int total = this.service.waitListCount(empNo); // ????????? ???
		
		waitMap.put("empNo", empNo);
		waitMap.put("currentPage", currentPage);
		List<Map<String, Object>> mapList = this.service.waitList(waitMap);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */

		model.addAttribute("mapList", pagination);
		model.addAttribute("tab", tab);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("btnCode", btnCode);

		return "sanction/elctrnSanctnList";
	}
	
	// 5-2. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnWaitSearch")
	public String waitSearch(Model model, @RequestParam String empNo, String keyword, String tab,
							@RequestParam(value="currentPage",defaultValue = "1") int currentPage) {

		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);

		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("keyword", keyword);

		/** ????????? ?????? */
		map.put("currentPage", currentPage);
		
		int total = this.service.requestSearchCount(map);
		
		List<Map<String, Object>> mapList = this.service.waitSearch(map);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */

		model.addAttribute("mapList", pagination);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("tab", tab);

		return "sanction/elctrnSanctnList";
	}

	// 5-3. ?????? ?????? ??????
	@GetMapping("/waitDetail")
	public String waitDetail(Model model, HttpSession session, @RequestParam int elctrnSanctnSn, String btnCode) {

		empNo = getEmpVO(session);
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		
		String formNm = this.service.formName(elctrnSanctnSn);
		model.addAttribute("formNm", formNm);
		
		Map<String, Object> drftEmpMap = this.service.drftEmpNameBySn(elctrnSanctnSn);
		model.addAttribute("drftEmpMap", drftEmpMap);
		
		ElctrnSanctnVO vo = new ElctrnSanctnVO();
		vo.setElctrnSanctnSn(elctrnSanctnSn);
		vo.setEmpNo(empNo);
		vo = this.service.waitDetail(vo);
		
		// ???????????? ?????? ????????????
		List<Map<String, Object>> lineInfoList = this.service.sanctnLineList(elctrnSanctnSn);
		
		Map<String, Object> lineMap = new HashMap<>();
		int count = 0;
		for (Map<String, Object> list : lineInfoList) {
			lineMap.put("nm" + String.valueOf(count), list);
			count++;
		} 
		model.addAttribute("lineMap", lineMap);
		logger.info("lineMap : " + lineMap);
		
		int fileSn = vo.getFileSn();
		List<Map<String, Object>> fileList = this.service.fileList(fileSn);
		
		model.addAttribute("fileList", fileList);
		model.addAttribute("vo", vo);
		model.addAttribute("btnCode", btnCode);

		return "sanction/elctrnSanctnDetail";
	}
	
	// 5-4. ????????? ?????? (??????)
	@PostMapping("/sanctionConfirm")
	@ResponseBody
	public int sanctionConfirm(HttpSession session, @RequestParam int elctrnSanctnSn) {
		
		empNo = getEmpVO(session);
		
		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("elctrnSanctnSn", elctrnSanctnSn);
		
		boolean isSuccess = this.service.sanctnConfirm(map);
		int step = 0;
		String sanctnSn = this.dclzService.searchSanctnSn(elctrnSanctnSn); // ?????? ???????????? ??????
		
		if (isSuccess) {
//			logger.info("?????? ?????? ??????");
			
			// ???????????? step ????????????
			// step ????????????
			// 1?????? ?????????, 2?????? 1??????, 3?????? 2??????, 4?????? 3??????
			step = this.service.findSanctnStep(map);
			
			String sttusCode = this.service.lastSanctnSttus(elctrnSanctnSn);
			
			Map<String, Object> sttusMap = new HashMap<>();
			sttusMap.put("elctrnSanctnSn", elctrnSanctnSn);
			
			if (sttusCode.equals("S2")) {
				sttusMap.put("lastSttusCode", "L1");
				this.service.doneSanctnSttusModify(sttusMap);
				
				/** ???????????? ??? ?????? **/
				if(sanctnSn.equals("S2")) { // ????????? ??????????????? ?????? 
					/*** 1. ?????? ?????? ?????? ***/
					Map<String,Object> result = this.dclzService.vcatnDaynCode(elctrnSanctnSn);
					logger.info("result : " + result);
					String vcatnCode =  result.get("VCATN_SE_CODE").toString();
					int dayCnt = Integer.parseInt(result.get("VCATN_REQST_DAYCNT").toString());
					Map<String,Object> drftNoMap = this.service.drftEmpNameBySn(elctrnSanctnSn);
					String drftNo = drftNoMap.get("EMP_NO").toString();
						// ?????? ????????? ????????????
						if(vcatnCode.equals("V1") || vcatnCode.equals("V2")) { 
							/** ?????? ?????? ?????? **/
							LocalDate now = LocalDate.now();
							String searchYear = now.format(DateTimeFormatter.ofPattern("yyyy"));
							
							result.put("empNo", drftNo);
							result.put("searchYear",searchYear);
							result.put("occrrncYear",searchYear);
						
							YrycVO yrycVO = this.dclzService.yrycSelect(result);
							int remnrDay = yrycVO.getRemndrDaycnt();
							int useDay = yrycVO.getUseDaycnt();
							int useresultCnt = useDay + dayCnt;
							int resultCnt = remnrDay - dayCnt;
							
							result.put("remnrDaycnt", resultCnt);
							result.put("useDaycnt", useresultCnt);
							
							this.dclzService.yrycUpdate(result);
							logger.info("1. ??????????????? ????????? : " + result);
						}
				    /*** 2. ?????? ????????? ????????? ?????? ***/	
					List<Map<String, Object>> dayList =this.dclzService.daySearch(result);
					logger.info("dayList :" + dayList);
					for (Map<String, Object> map2 : dayList) {
						Map<String, Object> searchmap = new HashMap<String, Object>();
						String Day = map2.get("DAY").toString();
						searchmap.put("empNo", drftNo);
						searchmap.put("workDe", Day);
						searchmap.put("workStleCode", "W4");
						List<Map<String, Object>> already = dclzService.commitYn(searchmap);
						if(already.size()>0) {
							dclzService.afterSanction(searchmap);
						}else {
							dclzService.afterSanctionInsert(searchmap);
						}
						searchmap.clear();
					}
					
				}else if(sanctnSn.equals("S3")) { // ????????? ??????????????? ?????? 
					
					  /*** 1. ?????? ????????? ???????????? ?????? ***/	
					Map<String,Object> result = this.dclzService.bsrpDaynCode(elctrnSanctnSn);
					Map<String,Object> drftNoMap = this.service.drftEmpNameBySn(elctrnSanctnSn);
					String drftNo = drftNoMap.get("EMP_NO").toString();
					
					List<Map<String, Object>> dayList =this.dclzService.daySearch(result);
					logger.info("dayList :" + dayList);
					for (Map<String, Object> map2 : dayList) {
						Map<String, Object> searchmap = new HashMap<String, Object>();
						String Day = map2.get("DAY").toString();
						searchmap.put("empNo", drftNo);
						searchmap.put("workDe", Day);
						searchmap.put("workStleCode", "W6");
						List<Map<String, Object>> already = dclzService.commitYn(searchmap);
						if(already.size()>0) {
							dclzService.afterSanction(searchmap);
						}else {
							dclzService.afterSanctionInsert(searchmap);
						}
						searchmap.clear();
					}
				}
				
			} else if (sttusCode.equals("S3")) {
				sttusMap.put("lastSttusCode", "L2");
				this.service.doneSanctnSttusModify(sttusMap);

			} else {
				this.service.underSanctnSttusModify(elctrnSanctnSn);
			}
		}
		
		return step;
	}

	// 6-1. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnUnderList")
	public String underList(Model model, HttpSession session, @RequestParam String tab, String btnCode,
								@RequestParam(value="currentPage", defaultValue = "1") int currentPage) {

		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		/** ????????? ?????? */
		Map<String, Object> underMap = new HashMap<>();
		
		int total = this.service.underListCount(empNo); // ????????? ???
		
		underMap.put("empNo", empNo);
		underMap.put("currentPage", currentPage);
		List<Map<String, Object>> mapList = this.service.underList(underMap);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */

		model.addAttribute("mapList", pagination);
		model.addAttribute("tab", tab);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("btnCode", btnCode);

		return "sanction/elctrnSanctnList";
	}

	// 6-2. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnUnderSearch")
	public String underSearch(Model model, @RequestParam String empNo, String keyword, String tab,
								@RequestParam(value="currentPage",defaultValue = "1") int currentPage) {

		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		
		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("keyword", keyword);
		
		/** ????????? ?????? */
		map.put("currentPage", currentPage);
		
		int total = this.service.requestSearchCount(map);
		
		List<Map<String, Object>> mapList = this.service.underSearch(map);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */

		model.addAttribute("mapList", pagination);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("tab", tab);

		return "sanction/elctrnSanctnList";
	}

	// 6-3. ?????? ?????? ??????
	@GetMapping("/underDetail")
	public String underDetail(Model model, HttpSession session, @RequestParam int elctrnSanctnSn, String btnCode) {

		empNo = getEmpVO(session);
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		
		String formNm = this.service.formName(elctrnSanctnSn);
		model.addAttribute("formNm", formNm);
		
		Map<String, Object> drftEmpMap = this.service.drftEmpNameBySn(elctrnSanctnSn);
		model.addAttribute("drftEmpMap", drftEmpMap);

		ElctrnSanctnVO vo = new ElctrnSanctnVO();
		vo.setElctrnSanctnSn(elctrnSanctnSn);
		vo.setEmpNo(empNo);
		vo = this.service.underDetail(vo);
		
		// ???????????? ?????? ????????????
		List<Map<String, Object>> lineInfoList = this.service.sanctnLineList(elctrnSanctnSn);
		
		Map<String, Object> lineMap = new HashMap<>();
		int count = 0;
		for (Map<String, Object> list : lineInfoList) {
			lineMap.put("nm" + String.valueOf(count), list);
			count++;
		} 
		model.addAttribute("lineMap", lineMap);

		int fileSn = vo.getFileSn();
		List<Map<String, Object>> fileList = this.service.fileList(fileSn);

		model.addAttribute("fileList", fileList);
		model.addAttribute("vo", vo);
		model.addAttribute("btnCode", btnCode);

		return "sanction/elctrnSanctnDetail";
	}

	// 7-1. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnDoneList")
	public String doneList(Model model, HttpSession session, @RequestParam String tab, String btnCode,
							@RequestParam(value="currentPage", defaultValue = "1") int currentPage) {

		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		
		/** ????????? ?????? */
		Map<String, Object> doneMap = new HashMap<>();
		
		int total = this.service.doneListCount(empNo); // ????????? ???
		
		doneMap.put("empNo", empNo);
		doneMap.put("currentPage", currentPage);
		List<Map<String, Object>> mapList = this.service.doneList(doneMap);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */

		model.addAttribute("mapList", pagination);
		model.addAttribute("tab", tab);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("btnCode", btnCode);

		return "sanction/elctrnSanctnList";
	}
	
	// 7-2. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnDoneSearch")
	public String doneSearch(Model model, @RequestParam String empNo, String keyword, String tab,
							@RequestParam(value="currentPage",defaultValue = "1") int currentPage) {

		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);

		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("keyword", keyword);
		
		/** ????????? ?????? */
		map.put("currentPage", currentPage);
		
		int total = this.service.requestSearchCount(map);
		
		List<Map<String, Object>> mapList = this.service.doneSearch(map);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */

		model.addAttribute("mapList", pagination);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("tab", tab);

		return "sanction/elctrnSanctnList";
	}

	// 7-3. ?????? ?????? ??????
	@GetMapping("/doneDetail")
	public String doneDetail(Model model, HttpSession session, @RequestParam int elctrnSanctnSn, String btnCode) throws Exception {

		empNo = getEmpVO(session);
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		
		String formNm = this.service.formName(elctrnSanctnSn);
		model.addAttribute("formNm", formNm);	
		
		Map<String, Object> drftEmpMap = this.service.drftEmpNameBySn(elctrnSanctnSn);
		model.addAttribute("drftEmpMap", drftEmpMap);

		ElctrnSanctnVO vo = new ElctrnSanctnVO();
		vo.setElctrnSanctnSn(elctrnSanctnSn);
		vo.setEmpNo(empNo);
		vo = this.service.doneDetail(vo);
		
		// ???????????? ?????? ????????????
		List<Map<String, Object>> lineInfoList = this.service.sanctnLineList(elctrnSanctnSn);
		
		Map<String, Object> lineMap = new HashMap<>();
		int count = 0;
		for (Map<String, Object> list : lineInfoList) {
			lineMap.put("nm" + String.valueOf(count), list);
			count++;
		} 
		model.addAttribute("lineMap", lineMap);
		
		int fileSn = vo.getFileSn();
		List<Map<String, Object>> fileList = this.service.fileList(fileSn);
		
		Map<String, Object> returnMap = this.service.returnAt(elctrnSanctnSn);
		if (returnMap != null) {
			String sanctnSttusCode = returnMap.get("SANCTN_STTUS_CODE").toString();
			if (sanctnSttusCode.equals("S3")) {
				model.addAttribute("returnMap", returnMap);
			} 
		}
		
		model.addAttribute("fileList", fileList);
		model.addAttribute("vo", vo);
		model.addAttribute("btnCode", btnCode);

		Map<String, Object> map = this.service.empInfoByEmpNo(empNo);

		// ????????????
		List<Map<String, Object>> deptList = empService.deptList(map);
		model.addAttribute("deptList", deptList);

		// ????????????
		List<Map<String, Object>> empList = empService.deptEmpList(map);
		model.addAttribute("deptEmpList", empList);

		// ????????????
		List<Map<String, Object>> teamList = empService.teamList(map);
		model.addAttribute("teamList", teamList);
		
		return "sanction/elctrnSanctnDetail";
	}
	
	// 8-1. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnReturnList")
	public String returnList(Model model, HttpSession session, @RequestParam String tab, String btnCode,
								@RequestParam(value="currentPage", defaultValue = "1") int currentPage) {

		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);

		/** ????????? ?????? */
		Map<String, Object> returnMap = new HashMap<>();
		
		int total = this.service.returnListCount(empNo); // ????????? ???
		
		returnMap.put("empNo", empNo);
		returnMap.put("currentPage", currentPage);
		List<Map<String, Object>> mapList = this.service.returnList(returnMap);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */

		model.addAttribute("mapList", pagination);
		model.addAttribute("tab", tab);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("btnCode", btnCode);
		model.addAttribute("deleteCheckBox", "yes");

		return "sanction/elctrnSanctnList";
	}

	// 8-2. ?????? ????????? ?????? (??????????????? ??????)
	@PostMapping("/returnAtModify")
	@ResponseBody
	public boolean returnAtModify(HttpSession session, @RequestParam int elctrnSanctnSn, String returnPrvonsh) {
		
		empNo = getEmpVO(session);
		
		Map<String, Object> lineMap = new HashMap<>();
		lineMap.put("empNo", empNo);
		lineMap.put("elctrnSanctnSn", elctrnSanctnSn);
		lineMap.put("returnPrvonsh", returnPrvonsh);
		
		boolean isLineSuccess = this.service.returnSanctnLineModify(lineMap);
		boolean isSuccess = false;
		
		if (isLineSuccess) {
//			logger.info("???????????? ????????? ?????? ??????");
			
			Map<String, Object> map = new HashMap<>();
			map.put("empNo", empNo);
			map.put("elctrnSanctnSn", elctrnSanctnSn);
			
			isSuccess = this.service.returnAtModify(map);
			if (isSuccess) {
//				logger.info("???????????? ????????? ?????? ??????");
				
				// ?????? ?????? ???????????? ?????????
				Map<String, Object> lastSttusMap = this.service.returnAt(elctrnSanctnSn);
				String sanctnSttusCode = lastSttusMap.get("SANCTN_STTUS_CODE").toString();
				
				if (sanctnSttusCode != "S3") {
					List<Map<String, Object>> lineList = this.service.sanctnLineList(elctrnSanctnSn);
					List<String> sttusCodeList = new ArrayList<>();
					
					for (Map<String, Object> map2 : lineList) {
						String code = map2.get("SANCTN_STTUS_CODE").toString();
						
						if (code.equals("??????")) {
							sttusCodeList.add("1");
						}
					}
					
					Map<String, Object> returnMap = new HashMap<>();
					returnMap.put("elctrnSanctnSn", elctrnSanctnSn);
					
					int count = sttusCodeList.size();
					
					for (int i = 0; i < count; i++) {
						returnMap.put("cnt", i + 1);
						this.service.returnSanctnSttusModify(returnMap);
					}
				}
			}
		}

		return isSuccess;
	}

	// 8-3. ?????? ?????? ?????? (????????????)
	@PostMapping("deleteCheckBoxReturn")
	@ResponseBody
	public boolean deleteCheckBoxReturn(@RequestParam String[] checkedArray) {
		
		boolean isSuccess = false;
		
		if (checkedArray != null) {
			for (String serialNumber : checkedArray) {
				int elctrnSanctnSn = Integer.valueOf(serialNumber);
				isSuccess = this.service.returnDelete(elctrnSanctnSn);
			}
		}
		
		return isSuccess;
	}
	
	// 8-4. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnReturnSearch")
	public String returnSearch(Model model, @RequestParam String empNo, String keyword, String tab,
								@RequestParam(value="currentPage",defaultValue = "1") int currentPage) {

		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);

		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("keyword", keyword);

		/** ????????? ?????? */
		map.put("currentPage", currentPage);
		
		int total = this.service.requestSearchCount(map);
		
		List<Map<String, Object>> mapList = this.service.returnSearch(map);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */

		model.addAttribute("mapList", pagination);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("tab", tab);

		return "sanction/elctrnSanctnList";
	}
	
	// 8-5. ?????? ?????? ??????
	@GetMapping("/returnDetail")
	public String returnDetail(Model model, HttpSession session, @RequestParam int elctrnSanctnSn, String btnCode) {

		empNo = getEmpVO(session);
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		
		String formNm = this.service.formName(elctrnSanctnSn);
		model.addAttribute("formNm", formNm);
		
		Map<String, Object> drftEmpMap = this.service.drftEmpNameBySn(elctrnSanctnSn);
		model.addAttribute("drftEmpMap", drftEmpMap);
		
		ElctrnSanctnVO vo = new ElctrnSanctnVO();
		vo.setElctrnSanctnSn(elctrnSanctnSn);
		vo.setEmpNo(empNo);
		vo = this.service.returnDetail(vo);
		
		// ???????????? ?????? ????????????
		List<Map<String, Object>> lineInfoList = this.service.sanctnLineList(elctrnSanctnSn);
		
		Map<String, Object> lineMap = new HashMap<>();
		int count = 0;
		for (Map<String, Object> list : lineInfoList) {
			lineMap.put("nm" + String.valueOf(count), list);
			count++;
		} 
		model.addAttribute("lineMap", lineMap);

		Map<String, Object> returnMap = this.service.returnAt(elctrnSanctnSn);
		if (returnMap != null) {
			String sanctnSttusCode = returnMap.get("SANCTN_STTUS_CODE").toString();
			if (sanctnSttusCode.equals("S3")) {
				model.addAttribute("returnMap", returnMap);
			} 
		}
		
		int fileSn = vo.getFileSn();
		List<Map<String, Object>> fileList = this.service.fileList(fileSn);
		
		model.addAttribute("fileList", fileList);
		model.addAttribute("vo", vo);
		model.addAttribute("btnCode", btnCode);
		model.addAttribute("deleteBox", "yes");

		return "sanction/elctrnSanctnDetail";
	}

	// 8-6. ?????? ?????? ??????
	@PostMapping("/returnDelete")
	@ResponseBody
	public boolean returnDelete(@RequestParam int elctrnSanctnSn) {
		
		boolean isSuccess = this.service.returnDelete(elctrnSanctnSn);
		
		return isSuccess;
	}
	
	// 9-1. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnDisplayList")
	public String displayList(Model model, HttpSession session, @RequestParam String tab, String btnCode,
								@RequestParam(value="currentPage", defaultValue = "1") int currentPage) {

		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);

		/** ????????? ?????? */
		Map<String, Object> displayMap = new HashMap<>();
		
		int total = this.service.displayListCount(empNo); // ????????? ???
		
		displayMap.put("empNo", empNo);
		displayMap.put("currentPage", currentPage);
		List<Map<String, Object>> mapList = this.service.displayList(displayMap);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */

		model.addAttribute("mapList", pagination);
		model.addAttribute("tab", tab);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("btnCode", btnCode);
		model.addAttribute("dsplayAt", "yes");
//		model.addAttribute("dsplayEmp", dsplayEmp);
		
		return "sanction/elctrnSanctnList";
	}

	// 9-2. ?????? ?????? ?????? ??????
	@PostMapping("/displayAtModify")
	@ResponseBody
	public boolean displayAtModify(HttpSession session, @RequestParam int elctrnSanctnSn) {
		
		empNo = getEmpVO(session);
		
		String displayAt = this.service.displayAt(elctrnSanctnSn);
		
		if (displayAt.equals("Y")) {
			return false;
			
		} else {
			Map<String, Object> map = new HashMap<>();
			map.put("empNo", empNo);
			map.put("elctrnSanctnSn", elctrnSanctnSn);
			
			boolean isSuccess = this.service.displayAtModify(map);
			
			return isSuccess;
		}
	}
	
	// 9-3. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnDisplaySearch")
	public String displaySearch(Model model, @RequestParam String empNo, String keyword, String tab,
								@RequestParam(value="currentPage",defaultValue = "1") int currentPage) {

		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);

		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("keyword", keyword);
		
		/** ????????? ?????? */
		map.put("currentPage", currentPage);
		
		int total = this.service.requestSearchCount(map);
		
		List<Map<String, Object>> mapList = this.service.displaySearch(map);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */

		model.addAttribute("mapList", pagination);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("tab", tab);

		return "sanction/elctrnSanctnList";
	}
	
	// 9-4. ?????? ?????? ??????
	@GetMapping("/displayDetail")
	public String displayDetail(Model model, HttpSession session, @RequestParam int elctrnSanctnSn, String btnCode) {

		empNo = getEmpVO(session);
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		
		String formNm = this.service.formName(elctrnSanctnSn);
		model.addAttribute("formNm", formNm);
		
		Map<String, Object> drftEmpMap = this.service.drftEmpNameBySn(elctrnSanctnSn);
		model.addAttribute("drftEmpMap", drftEmpMap);

		ElctrnSanctnVO vo = new ElctrnSanctnVO();
		vo.setElctrnSanctnSn(elctrnSanctnSn);
		vo = this.service.displayDetail(vo);
		
		// ???????????? ?????? ????????????
		List<Map<String, Object>> lineInfoList = this.service.sanctnLineList(elctrnSanctnSn);
		
		Map<String, Object> lineMap = new HashMap<>();
		int count = 0;
		for (Map<String, Object> list : lineInfoList) {
			lineMap.put("nm" + String.valueOf(count), list);
			count++;
		} 
		model.addAttribute("lineMap", lineMap);

		int fileSn = vo.getFileSn();
		List<Map<String, Object>> fileList = this.service.fileList(fileSn);

		model.addAttribute("fileList", fileList);
		model.addAttribute("vo", vo);
		model.addAttribute("btnCode", btnCode);

		return "sanction/elctrnSanctnDetail";
	}
	
	// 10-1. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnCcList")
	public String ccList(Model model, HttpSession session, @RequestParam String tab, String btnCode,
							@RequestParam(value="currentPage", defaultValue = "1") int currentPage) {
		
		empNo = getEmpVO(session);
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		
		/** ????????? ?????? */
		Map<String, Object> ccMap = new HashMap<>();
		
		int total = this.service.ccListCount(empNo); // ????????? ???
		
		ccMap.put("empNo", empNo);
		ccMap.put("currentPage", currentPage);
		List<Map<String, Object>> mapList = this.service.ccList(ccMap);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */
		
		model.addAttribute("mapList", pagination);
		model.addAttribute("tab", tab);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("btnCode", btnCode);

		return "sanction/elctrnSanctnList";
	}
	
	// 10-2. ?????? ?????? ??????
	@GetMapping("/elctrnSanctnCcSearch")
	public String ccSearch(Model model, @RequestParam String empNo, String keyword, String tab,
							@RequestParam(value="currentPage",defaultValue = "1") int currentPage) {

		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);

		Map<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("keyword", keyword);

		/** ????????? ?????? */
		map.put("currentPage", currentPage);
		
		int total = this.service.requestSearchCount(map);
		
		List<Map<String, Object>> mapList = this.service.ccSearch(map);
		
		Pagination pagination = new Pagination(total, currentPage, 10, mapList);
		
		if (pagination.getStartPage() == 0) {
			pagination.setStartPage(1);
		}
		
		if (pagination.getEndPage() == 0) {
			pagination.setEndPage(1);
		}
		/** ????????? ??? */

		model.addAttribute("mapList", pagination);
		model.addAttribute("tabKo", "????????????");
		model.addAttribute("tab", tab);

		return "sanction/elctrnSanctnList";
	}
	
	// 10-3. ?????? ?????? ??????
	@GetMapping("/ccDetail")
	public String ccDetail(Model model, HttpSession session, @RequestParam int elctrnSanctnSn, String btnCode) throws Exception {

		empNo = getEmpVO(session);
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		model.addAttribute("sanctnCountMap", sanctnCountMap);
		
		String formNm = this.service.formName(elctrnSanctnSn);
		model.addAttribute("formNm", formNm);	
		
		Map<String, Object> drftEmpMap = this.service.drftEmpNameBySn(elctrnSanctnSn);
		model.addAttribute("drftEmpMap", drftEmpMap);

		ElctrnSanctnVO vo = new ElctrnSanctnVO();
		vo.setElctrnSanctnSn(elctrnSanctnSn);
		vo.setEmpNo(empNo);
		vo = this.service.ccDetail(vo);
		
		// ???????????? ?????? ????????????
		List<Map<String, Object>> lineInfoList = this.service.sanctnLineList(elctrnSanctnSn);
		
		Map<String, Object> lineMap = new HashMap<>();
		int count = 0;
		for (Map<String, Object> list : lineInfoList) {
			lineMap.put("nm" + String.valueOf(count), list);
			count++;
		} 
		model.addAttribute("lineMap", lineMap);
		
		int fileSn = vo.getFileSn();
		List<Map<String, Object>> fileList = this.service.fileList(fileSn);
		
		Map<String, Object> returnMap = this.service.returnAt(elctrnSanctnSn);
		if (returnMap != null) {
			String sanctnSttusCode = returnMap.get("SANCTN_STTUS_CODE").toString();
			if (sanctnSttusCode.equals("S3")) {
				model.addAttribute("returnMap", returnMap);
			} 
		}
		
		model.addAttribute("fileList", fileList);
		model.addAttribute("vo", vo);
		model.addAttribute("btnCode", btnCode);
		
		return "sanction/elctrnSanctnDetail";
	}
	
	// 10-4. ?????? ?????? ?????? ?????? ??????
	@PostMapping("/ccCnfirmAtModify")
	@ResponseBody
	public boolean ccCnfirmAtModify(@RequestParam int elctrnSanctnSn) {
		
		boolean isSuccess = false;
		Map<String, Object> map = new HashMap<>();
		map.put("elctrnSanctnSn", elctrnSanctnSn);
		map.put("empNo", empNo);
		
		String cnfirmAt = this.service.ccCnfirmAt(map);
		if (cnfirmAt.equals("Y")) {
			return false;
			
		} else if (this.service.ccCnfirmAtModify(map)) {
			isSuccess = true;
		}
		
		return isSuccess;
	}
	
	// 10-5. ?????? ?????? ???????????? ????????? ??????
	@PostMapping("/addCc")
	@ResponseBody
	public boolean addCc(@RequestParam(required = false) String cc1, @RequestParam(required = false) String cc2, 
						@RequestParam(required = false) String cc3, @RequestParam(required = false) String cc4, 
						@RequestParam(required = false) String cc5, @RequestParam int elctrnSanctnSn) {
		
		boolean isSuccess = false;
		Map<String, Object> map = new HashMap<>();
		map.put("elctrnSanctnSn", elctrnSanctnSn);
		
		List<Map<String, Object>> ccEmpInfoMap = this.service.ccEmpInfoBySn(elctrnSanctnSn);
		List<String> ccEmpNoList = new ArrayList<>();
		
		for (Map<String, Object> map2 : ccEmpInfoMap) {
			ccEmpNoList.add(map2.get("EMP_NO").toString());
		}
		
		for (String empNo : ccEmpNoList) {
			if (cc1.equals(empNo)) {
				cc1 = "";
			}
			if (cc2.equals(empNo)) {
				cc2 = "";
			}
			if (cc3.equals(empNo)) {
				cc3 = "";
			}
			if (cc4.equals(empNo)) {
				cc4 = "";
			}
			if (cc5.equals(empNo)) {
				cc5 = "";
			}
		}
		
		if (!cc1.equals("")) {
			map.put("empNo", cc1);
			
			if (this.service.ccAdd(map)) {
				isSuccess = true;
			}
		}
		
		if (!cc2.equals("")) {
			map.put("empNo", cc2);
			
			if (this.service.ccAdd(map)) {
				isSuccess = true;
			}
		}
		
		if (!cc3.equals("")) {
			
			map.put("empNo", cc3);
			
			if (this.service.ccAdd(map)) {
				isSuccess = true;
			}
		}
		
		if (!cc4.equals("")) {
			map.put("empNo", cc4);
			
			if (this.service.ccAdd(map)) {
				isSuccess = true;
			}
		}
		
		if (!cc5.equals("")) {
			map.put("empNo", cc5);
			
			if (this.service.ccAdd(map)) {
				isSuccess = true;
			}
		}
		
		return isSuccess;
	}
	
	// ?????? ???????????? (???????????????)
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName,
			@RequestParam int fileSn) {

		// ?????? ?????? ?????? ?????? ??????
		// ?????? ?????? ???????????? ?????? ?????? + "\\" + fileName !!
		List<Map<String, Object>> mapList = this.service.fileList(fileSn);

		String flpth = mapList.get(0).get("FLPTH").toString();

		String uploadFolder = flpth.replace("\\", "\\\\");

//		String uploadFolder = "C:\\upload";
		Resource resource = new FileSystemResource(uploadFolder + "\\" + fileName);

		String resourceName = resource.getFilename();
		HttpHeaders headers = new HttpHeaders();

		try {
			String downloadName = null;

			if (userAgent.contains("Trident")) { // IE ?????? 11
				downloadName = URLEncoder.encode(resourceName, "UTF-8").replaceAll("\\+", " ");

			} else if (userAgent.contains("Edge")) {
				downloadName = URLEncoder.encode(resourceName, "UTF-8");

			} else {
				downloadName = new String(resourceName.getBytes("UTF-8"), "ISO-8859-1");
				int index = downloadName.lastIndexOf("_");
				downloadName = downloadName.substring(index + 1);
			}
			headers.add("Content-disposition", "attachment;filename=" + downloadName);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	// ?????? ???????????? (???????????????)
	@GetMapping(value = "/downloadNm", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> downloadNm(@RequestHeader("User-Agent") String userAgent,
			@RequestParam String keyword) {
		
//		logger.info("download File : " + keyword);
		
		// ?????? ?????? ?????? ?????? ??????
		// ?????? ?????? ???????????? ?????? ?????? + "\\" + fileName !!
		List<Map<String, Object>> mapList = this.service.fileListName(keyword);
		
		String flpth = mapList.get(0).get("FLPTH").toString();
		
		String uploadFolder = flpth.replace("\\", "\\\\");
		
//		String uploadFolder = "C:\\upload";
		Resource resource = new FileSystemResource(uploadFolder + "\\" + keyword);
		
		String resourceName = resource.getFilename();
		HttpHeaders headers = new HttpHeaders();
		
		try {
			String downloadName = null;
			
			if (userAgent.contains("Trident")) { // IE ?????? 11
				downloadName = URLEncoder.encode(resourceName, "UTF-8").replaceAll("\\+", " ");
				
			} else if (userAgent.contains("Edge")) {
				downloadName = URLEncoder.encode(resourceName, "UTF-8");
				
			} else {
				downloadName = new String(resourceName.getBytes("UTF-8"), "ISO-8859-1");
				int index = downloadName.lastIndexOf("_");
				downloadName = downloadName.substring(index + 1);
			}
			headers.add("Content-disposition", "attachment;filename=" + downloadName);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}

}