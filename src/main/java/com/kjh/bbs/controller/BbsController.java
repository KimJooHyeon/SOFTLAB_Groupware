package com.kjh.bbs.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kjh.bbs.service.AnswerService;
import com.kjh.bbs.service.BbsService;
import com.kjh.bbs.vo.BbsVO;
import com.kjh.bbs.vo.Pagination;
import com.kjh.hr.controller.HrController;
import com.kjh.hr.vo.EmpVO;
import com.kjh.login.interceptor.Auth;
import com.kjh.sanction.service.SanctionService;

@Controller
public class BbsController<V> {
	@Autowired
	BbsService bbsService;
	@Autowired
	AnswerService answerService;
	@Autowired
	SanctionService service;
	
	private static final Logger log = LoggerFactory.getLogger(HrController.class);
	
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
	
	/** ???????????? ?????? **/
	// ???????????? ??????
	@Auth
	@GetMapping("/bbs/noticeList")
	public String noticeAll(Model model, HttpServletRequest request, 
			@RequestParam(value="currentPage",defaultValue = "1") int currentPage) {
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		empNo = emp.getEmpNo();
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// ?????? ???????????? ??????
		int total = this.bbsService.noticeCount();
		
		map.put("currentPage", currentPage);	
		
		int clsfNum = Integer.parseInt(emp.getClsfCode().substring(1));
		boolean auth = false;
		
		if(clsfNum <= 5 ) {
			auth = true;
			model.addAttribute("isAuth", auth);
		}else {
			model.addAttribute("isAuth", auth);
		}
		
		List<Map<String, Object>> list = this.bbsService.noticeAll(map);
		Pagination pagination = new Pagination(total, currentPage, 10, list);
		
		model.addAttribute("list", new Pagination(total, currentPage, 10, list));
		model.addAttribute("loginEmp", empNo);
		return "bbs/noticeList";
	}
	
	// ???????????? ?????? ??????
	@Auth
	@PostMapping("/bbs/noticeSearch")
	@ResponseBody
	public Pagination searchNotice(@RequestBody Map<String, String> data){
		Map<String, String> searchMap = new HashMap<String, String>();
		String filter = data.get("filter");
		String keyword = data.get("keyword");
		int page = Integer.parseInt(data.get("page")) ;
		
		searchMap.put("keyword", keyword);
		searchMap.put("se", "B1");
		searchMap.put("currentPage", page+"");
		
		if(filter.equals("sj_cn")) {
			int total = this.bbsService.searchBySjAndCnCount(searchMap);
			List<Map<String, Object>> searchBySjAndCn = this.bbsService.searchBySjAndCn(searchMap);
			Pagination pagination = new Pagination(total, page, 10, searchBySjAndCn);
			return pagination; 
		}else if (filter.equals("sj")) {
			int total = this.bbsService.searchBySjCount(searchMap);
			List<Map<String,Object>> searchBySj = this.bbsService.searchBySj(searchMap);
			Pagination pagination = new Pagination(total, page, 10, searchBySj);
			return pagination;
		}else if (filter.equals("cn")) {
			List<Map<String,Object>> searchByCn = this.bbsService.searchByCn(searchMap);
			int total = this.bbsService.searchByCnCount(searchMap);
			Pagination pagination = new Pagination(total, page, 10, searchByCn);
			return pagination;
		}else {
			List<Map<String,Object>> searchByEmp = this.bbsService.searchByEmp(searchMap);
			int total = this.bbsService.searchByEmpCount(searchMap);
			Pagination pagination = new Pagination(total, page, 10, searchByEmp);
			return pagination;
		}
	}
	
	// ???????????? ??????
	@Auth
	@GetMapping("/bbs/noticeView")
	public String noticeView(Model model, String bbscttSn, HttpServletRequest request) {
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		Map<String, Object> notice = this.bbsService.bbsView(bbscttSn);
		
		empNo = emp.getEmpNo();
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		// ????????? ?????????
		this.bbsService.readCount(bbscttSn);
		
		/** ???????????? ?????? ?????? ????????? ?????? **/
		int clsfNum = Integer.parseInt(emp.getClsfCode().substring(1));
		boolean auth = false;
		
		if(clsfNum <= 5 ) {
			auth = true;
			model.addAttribute("isAuth", auth);
		}else {
			model.addAttribute("isAuth", auth);
		}
		/** ?????? ?????? ?????? ??? **/
		
		/** ?????? ????????? ????????? ?????? **/
		int count = this.bbsService.fileCount(bbscttSn);
		// ???????????? ?????? ??? ?????? ?????????
		List<Map<String,Object>> imgFileList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> etcFileList = new ArrayList<Map<String, Object>>();
		
		if(count >= 1 ) {
			List<Map<String,Object>> files = this.bbsService.bbsFiles(bbscttSn);
			/* ?????? ????????? ?????? ????????? ????????? ????????? ?????? */
			for (Map<String, Object> data : files) {
				int fileSn = Integer.parseInt(String.valueOf(data.get("FILE_SN"))) ;
//				String fileSnStr = (String) data.get("FILE_SN");
//				int fileSn = Integer.parseInt(fileSnStr);
				String fileNm = (String) data.get("FILE_NM");
				if(fileNm.contains("jpg") || fileNm.contains("jpeg") || fileNm.contains("png") || fileNm.contains("PNG")) {
					Map<String, Object> map1 = new HashMap<String, Object>();
					imgFileList = this.bbsService.imgFileList(fileSn);
//					for (Map<String,Object> map : imgFileList) {
					for(int i=0;i<imgFileList.size();i++) {
						Map<String, Object> map = imgFileList.get(i);
						String path = (String) map.get("FLPTH");
						path = path.substring(path.indexOf("\\resources\\upload"));
						path = path.replace("\\", "/");
						path += "/";
						imgFileList.get(i).put("FLPTH", path);
					}
				}else {
					etcFileList = this.bbsService.etcFileList(fileSn);
				} // ?????? ????????? ?????? ?????? ?????? if
			} // ????????? ?????? for
			/* ?????? ????????? ?????? ????????? ????????? ????????? ??????  ???*/
		} // ?????? ?????? if
		/** ?????? ????????? ????????? ?????? ??? **/
		
		List<Map<String, Object>> answerList = this.answerService.selectAnswer(bbscttSn);
		
		model.addAttribute("imgFiles", imgFileList);
		model.addAttribute("etcFiles", etcFileList);
		model.addAttribute("detail", notice);
		model.addAttribute("answerList", answerList);
		model.addAttribute("loginEmpNo", emp.getEmpNo());
		model.addAttribute("loginEmpNm", emp.getEmpNm());
		return "bbs/noticeView";
	}
	
	// ???????????? ?????? ???
	@Auth
	@GetMapping("/bbs/noticeWriteForm")
	public String noticeWriteForm(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();
		String empNm = emp.getEmpNm();
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		// ?????? ?????? 
		LocalDate now = LocalDate.now();
		// ?????? ??????
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		// ?????? ??????
		String formatedNow = now.format(formatter);
		
		int fileSn = this.bbsService.fileSnSelect();
		
		model.addAttribute("fileSn", fileSn);
		model.addAttribute("now", formatedNow);
		model.addAttribute("empNo", empNo);
		model.addAttribute("empNm", empNm);
		return "bbs/noticeWriteForm";
	}
	
	// ???????????? ?????? ???
	@Auth
	@PostMapping("/bbs/noticeEditForm")
	public String noticeEditForm(Model model, HttpServletRequest request, @RequestParam("bbscttSn") String bbscttSn) {
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();
		String empNm = emp.getEmpNm();
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		Map<String, Object> notice = this.bbsService.bbsView(bbscttSn);
		
		int count = this.bbsService.fileCount(bbscttSn);
		// ???????????? ?????? ??? ?????? ?????????
		List<Map<String,Object>> imgFileList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> etcFileList = new ArrayList<Map<String, Object>>();
		
		if(count >= 1 ) {
			List<Map<String,Object>> files = this.bbsService.bbsFiles(bbscttSn);
			/* ?????? ????????? ?????? ????????? ????????? ????????? ?????? */
			for (Map<String, Object> data : files) {
				int fileSn = Integer.parseInt(String.valueOf(data.get("FILE_SN"))) ;
//				String fileSnStr = (String) data.get("FILE_SN");
//				int fileSn = Integer.parseInt(fileSnStr);
				String fileNm = (String) data.get("FILE_NM");
				if(fileNm.contains("jpg") || fileNm.contains("jpeg") || fileNm.contains("png") || fileNm.contains("PNG")) {
					imgFileList = this.bbsService.imgFileList(fileSn);
				}else {
					etcFileList = this.bbsService.etcFileList(fileSn);
				} // ?????? ????????? ?????? ?????? ?????? if
			} // ????????? ?????? for
			/* ?????? ????????? ?????? ????????? ????????? ????????? ??????  ???*/
		} // ?????? ?????? if
		int fileSn = this.bbsService.fileSnSelect();
		
		model.addAttribute("fileSn", fileSn);
		model.addAttribute("imgFiles", imgFileList);
		model.addAttribute("etcFiles", etcFileList);
		model.addAttribute("detail", notice);
		model.addAttribute("empNo", empNo);
		model.addAttribute("empNm", empNm);
		model.addAttribute("bbscttSn", bbscttSn);
		return "bbs/noticeEditForm";
	}
	
	// ?????? ????????????
	@Auth
	@PostMapping("/bbs/noticeEditProcess")
	public String noticeEditProcess(Model model, @RequestParam Map<String, String> map, @RequestParam("uploadFiles") MultipartFile[] uploadFiles, HttpServletRequest request) {
		String bbscttSn = map.get("sn");
		String bbscttSj = map.get("sj");
		String bbscttCn = map.get("cn");
		String reset = map.get("fileResetBoolean");
		 
		// ?????? ??? ?????? ?????? ??????
		int fileCount = this.bbsService.fileCount(bbscttSn);
		
		// ?????? ?????? ??????(?????? ?????? ?????? ?????? ?????? ??????)
		String str = map.get("fileLength");
		
		// ????????? null??? ?????? ?????? ??????
		if(str != null) {
			int length = Integer.parseInt(str);
			// ?????? ?????? ?????? ??? ??????
			if(length > 0) {
				// ?????? ?????? ?????? ?????? ?????? ????????? ?????? ??? ????????? ??????
				List<String> afterDeleteList = new ArrayList<String>();
				// ?????? ?????? ?????? ????????? ?????? ??? ????????? ??????
				List<String> beforeDeleteList = new ArrayList<String>();
				// ???????????? ?????? ??? ?????? ??????(Sn) ????????????
				List<Map<String, Object>> bbsFiles = this.bbsService.bbsFiles(bbscttSn);
				
				// ?????? ?????? ?????? ?????? ???????????? ??????
				Map<String, Object> deleteMap = new HashMap<String, Object>();
				
				// ?????? ?????? ?????? ?????? ????????? ??????
				for(int i=0;i<length;i++) {
					afterDeleteList.add(map.get("fileLength"+i).trim());
				}
				// ?????? ?????? ?????? ?????? ???????????? ????????????
				for (Map<String, Object> file : bbsFiles) {
					beforeDeleteList.add((String) file.get("REAL_FILE_NM")); 
				}
				beforeDeleteList.removeAll(afterDeleteList);
				afterDeleteList.removeAll(beforeDeleteList);
				
				for(int i=0;i<beforeDeleteList.size();i++) {
					deleteMap.put("realFileNm", beforeDeleteList.get(i));
					deleteMap.put("fileSn", bbsFiles.get(0).get("FILE_SN"));
					this.bbsService.deleteFileByFileSnRealFileNm(deleteMap);
				}
			}
		}
		
		BbsVO bbs = new BbsVO();
		
		/* ?????? ????????? ?????? */
		List<String> fileNmList = new ArrayList<String>();
		List<String> realFileNmList = new ArrayList<String>();
		String uploadFolder = "C:\\dalmuti\\dalmuti\\src\\main\\webapp\\resources\\upload";
		
		// ?????? ??????(???/???/???)
		File uploadPath = new File(uploadFolder, getFolder());
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		int fileSn = 0;
		// ?????? ?????? ????????? ???????????? ??? ????????? ????????? ????????????
		List<Map<String,Object>> bbsFiles = this.bbsService.bbsFiles(bbscttSn);
		if(bbsFiles.size() != 0) {
			fileSn =  Integer.parseInt(String.valueOf(bbsFiles.get(0).get("FILE_SN")));
		}
		// ????????? ??? ?????? ???????????? ???????????? ?????? ????????? 0?????? ?????????.
		if(reset == null) {
			bbs.setFileSn(0);
			this.bbsService.deleteFileByBbscttSn(bbscttSn);
		}
		
		for (MultipartFile file : uploadFiles) {
			int newFileSn = 0;
			if(file.getOriginalFilename().length() == 0 && reset != null) {
				bbs.setFileSn(fileSn);
				break;
			}else {
				this.bbsService.deleteFileByBbscttSn(bbscttSn);
				String uploadFileName = file.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				uploadFileName = uuid.toString() + "@" + uploadFileName;
				
				File saveFile = new File(uploadPath, uploadFileName);
				
				newFileSn = Integer.parseInt(map.get("fileSn"));
				String fileNm = uploadFileName;
				String flpth = uploadPath.toString();
				String realFileNm = file.getOriginalFilename();
				String realFileMG = String.valueOf(file.getSize());
				
				try {
					file.transferTo(saveFile);
					fileNmList.add(uploadFileName);
					realFileNmList.add(realFileNm);
					
					Map<String, Object> fileMap = new HashMap<String, Object>();
					fileMap.put("fileSn", newFileSn);
					fileMap.put("fileNm", fileNm);
					fileMap.put("flpth", flpth);
					fileMap.put("realFileNm", realFileNm);
					fileMap.put("realFileMG", realFileMG);
					
					this.bbsService.fileAdd(fileMap);
					bbs.setFileSn(newFileSn);
				} catch (Exception e) {
				}
			}
		}	// for
		/* ?????? ????????? ??? */
		
		bbs.setBbscttSn(bbscttSn);
		bbs.setBbscttSj(bbscttSj);
		bbs.setBbscttCn(bbscttCn);
		
		this.bbsService.updateBbs(bbs);
		
		// empNm=?????????, writngDe=2021-12-24, sj=?????? 1 , sn=100, cn=<p></p>, fileSn=null
		
		return "redirect:/bbs/noticeView?bbscttSn=" + bbscttSn;
	}
	
	/** ???????????? ??? **/
	
	
	/** ????????? ?????? **/
	// ????????? ??????
	@Auth
	@GetMapping("/bbs/libraryList")
	public String libAll(Model model, HttpServletRequest request, @RequestParam(value="currentPage",defaultValue = "1") int currentPage) {
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
		
		// ?????? ???????????? ??????
		int total = this.bbsService.libraryCount();
		
		map.put("currentPage", currentPage);	
		
		List<Map<String, Object>> list = this.bbsService.libraryAll(map);
		Pagination pagination = new Pagination(total, currentPage, 10, list);
		
		model.addAttribute("list", new Pagination(total, currentPage, 10, list));
		model.addAttribute("loginEmp", empNo);
		
		return "bbs/libraryList";
	}
	
	// ????????? ?????? ??????
	@Auth
	@PostMapping("/bbs/librarySearch")
	@ResponseBody
	public Pagination librarySearch(@RequestBody Map<String, String> data){
		Map<String, String> searchMap = new HashMap<String, String>();
		String filter = data.get("filter");
		String keyword = data.get("keyword");
		int page = Integer.parseInt(data.get("page")) ;
		
		searchMap.put("keyword", keyword);
		searchMap.put("se", "B2");
		searchMap.put("currentPage", page+"");
		
		if(filter.equals("sj_cn")) {
			Map<String, Object> map = new HashMap<String, Object>();
			int total = this.bbsService.searchBySjAndCnCount(searchMap);
			map.put("currentPage", page);
			List<Map<String, Object>> searchBySjAndCn = this.bbsService.searchBySjAndCn(searchMap);
			Pagination pagination = new Pagination(total, page, 10, searchBySjAndCn);
			return pagination; 
		}else if (filter.equals("sj")) {
			Map<String, Object> map = new HashMap<String, Object>();
			int total = this.bbsService.searchBySjCount(searchMap);
			map.put("currentPage", page);
			List<Map<String,Object>> searchBySj = this.bbsService.searchBySj(searchMap);
			Pagination pagination = new Pagination(total, page, 10, searchBySj);
			return pagination;
		}else if (filter.equals("cn")) {
			List<Map<String,Object>> searchByCn = this.bbsService.searchByCn(searchMap);
			Map<String, Object> map = new HashMap<String, Object>();
			int total = this.bbsService.searchByCnCount(searchMap);
			map.put("currentPage", page);
			Pagination pagination = new Pagination(total, page, 10, searchByCn);
			return pagination;
		}else {
			List<Map<String,Object>> searchByEmp = this.bbsService.searchByEmp(searchMap);
			Map<String, Object> map = new HashMap<String, Object>();
			int total = this.bbsService.searchByEmpCount(searchMap);
			map.put("currentPage", page);
			Pagination pagination = new Pagination(total, page, 10, searchByEmp);
			return pagination;
		}
	}
	
	// ????????? ??? ??????
	@Auth
	@GetMapping("/bbs/libraryView")
	public String libraryView(Model model, String bbscttSn, HttpServletRequest request) {
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		Map<String, Object> notice = this.bbsService.bbsView(bbscttSn);
		
		empNo = emp.getEmpNo();
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		// ????????? ?????????
		this.bbsService.readCount(bbscttSn);
		
		/** ?????? ????????? ????????? ?????? **/
		int count = this.bbsService.fileCount(bbscttSn);
		// ???????????? ?????? ??? ?????? ?????????
		List<Map<String,Object>> imgFileList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> etcFileList = new ArrayList<Map<String, Object>>();
		
		if(count >= 1 ) {
			List<Map<String,Object>> files = this.bbsService.bbsFiles(bbscttSn);
			/* ?????? ????????? ?????? ????????? ????????? ????????? ?????? */
			for (Map<String, Object> data : files) {
				int fileSn = Integer.parseInt(String.valueOf(data.get("FILE_SN"))) ;
//					String fileSnStr = (String) data.get("FILE_SN");
//					int fileSn = Integer.parseInt(fileSnStr);
				String fileNm = (String) data.get("FILE_NM");
				if(fileNm.contains("jpg") || fileNm.contains("jpeg") || fileNm.contains("png") || fileNm.contains("PNG")) {
					Map<String, Object> map1 = new HashMap<String, Object>();
					imgFileList = this.bbsService.imgFileList(fileSn);
//						for (Map<String,Object> map : imgFileList) {
					for(int i=0;i<imgFileList.size();i++) {
						Map<String, Object> map = imgFileList.get(i);
						String path = (String) map.get("FLPTH");
						path = path.substring(path.indexOf("\\resources\\upload"));
						path = path.replace("\\", "/");
						path += "/";
//							log.info("result : " + path);
						imgFileList.get(i).put("FLPTH", path);
					}
				}else {
					etcFileList = this.bbsService.etcFileList(fileSn);
				} // ?????? ????????? ?????? ?????? ?????? if
			} // ????????? ?????? for
			/* ?????? ????????? ?????? ????????? ????????? ????????? ??????  ???*/
		} // ?????? ?????? if
		/** ?????? ????????? ????????? ?????? ??? **/
		
		List<Map<String, Object>> answerList = this.answerService.selectAnswer(bbscttSn);
		
		model.addAttribute("imgFiles", imgFileList);
		model.addAttribute("etcFiles", etcFileList);
		model.addAttribute("detail", notice);
		model.addAttribute("answerList", answerList);
		model.addAttribute("loginEmpNo", emp.getEmpNo());
		model.addAttribute("loginEmpNm", emp.getEmpNm());
		return "bbs/libraryView";
	}
	
	
	// ????????? ??? ?????? ???
	@Auth
	@GetMapping("/bbs/libraryWriteForm")
	public String libraryWriteForm(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();
		String empNm = emp.getEmpNm();
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		// ?????? ?????? 
		LocalDate now = LocalDate.now();
		// ?????? ??????
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		// ?????? ??????
		String formatedNow = now.format(formatter);
		
		int fileSn = this.bbsService.fileSnSelect();
		
		model.addAttribute("fileSn", fileSn);
		model.addAttribute("now", formatedNow);
		model.addAttribute("empNo", empNo);
		model.addAttribute("empNm", empNm);
		return "bbs/libraryWriteForm";
	}
	
	// ????????? ?????? ???
	@Auth
	@PostMapping("/bbs/libraryEditForm")
	public String libraryEditForm(Model model, HttpServletRequest request, @RequestParam("bbscttSn") String bbscttSn) {
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();
		String empNm = emp.getEmpNm();
		
		if (empNo == null || empNo.equals("")) {
			return "redirect:/login";
		}
		
		Map<String, Object> sanctnCountMap = sanctnCount(empNo);
		List<Map<String, Object>> mapList = this.service.formList();

		model.addAttribute("sanctnCountMap", sanctnCountMap);
		model.addAttribute("mapList", mapList);
		
		Map<String, Object> notice = this.bbsService.bbsView(bbscttSn);
		
		int count = this.bbsService.fileCount(bbscttSn);
		// ???????????? ?????? ??? ?????? ?????????
		List<Map<String,Object>> imgFileList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> etcFileList = new ArrayList<Map<String, Object>>();
		
		if(count >= 1 ) {
			List<Map<String,Object>> files = this.bbsService.bbsFiles(bbscttSn);
			/* ?????? ????????? ?????? ????????? ????????? ????????? ?????? */
			for (Map<String, Object> data : files) {
				int fileSn = Integer.parseInt(String.valueOf(data.get("FILE_SN"))) ;
//					String fileSnStr = (String) data.get("FILE_SN");
//					int fileSn = Integer.parseInt(fileSnStr);
				String fileNm = (String) data.get("FILE_NM");
				if(fileNm.contains("jpg") || fileNm.contains("jpeg") || fileNm.contains("png") || fileNm.contains("PNG")) {
					imgFileList = this.bbsService.imgFileList(fileSn);
				}else {
					etcFileList = this.bbsService.etcFileList(fileSn);
				} // ?????? ????????? ?????? ?????? ?????? if
			} // ????????? ?????? for
			/* ?????? ????????? ?????? ????????? ????????? ????????? ??????  ???*/
		} // ?????? ?????? if
		int fileSn = this.bbsService.fileSnSelect();
		
		model.addAttribute("fileSn", fileSn);
		model.addAttribute("imgFiles", imgFileList);
		model.addAttribute("etcFiles", etcFileList);
		model.addAttribute("detail", notice);
		model.addAttribute("empNo", empNo);
		model.addAttribute("empNm", empNm);
		model.addAttribute("bbscttSn", bbscttSn);
		return "bbs/libraryEditForm";
	}
	
	// ?????? ????????????
	@Auth
	@PostMapping("/bbs/libraryEditProcess")
	public String libraryEditProcess(Model model, @RequestParam Map<String, String> map, @RequestParam("uploadFiles") MultipartFile[] uploadFiles, HttpServletRequest request) {
		String bbscttSn = map.get("sn");
		String bbscttSj = map.get("sj");
		String bbscttCn = map.get("cn");
		String reset = map.get("fileResetBoolean");
		
		// ?????? ??? ?????? ?????? ??????
		int fileCount = this.bbsService.fileCount(bbscttSn);
		
		// ?????? ?????? ??????(?????? ?????? ?????? ?????? ?????? ??????)
		String str = map.get("fileLength");
		
		// ????????? null??? ?????? ?????? ??????
		if(str != null) {
			int length = Integer.parseInt(str);
			// ?????? ?????? ?????? ??? ??????
			if(length > 0) {
				// ?????? ?????? ?????? ?????? ?????? ????????? ?????? ??? ????????? ??????
				List<String> afterDeleteList = new ArrayList<String>();
				// ?????? ?????? ?????? ????????? ?????? ??? ????????? ??????
				List<String> beforeDeleteList = new ArrayList<String>();
				// ???????????? ?????? ??? ?????? ??????(Sn) ????????????
				List<Map<String, Object>> bbsFiles = this.bbsService.bbsFiles(bbscttSn);
				
				// ?????? ?????? ?????? ?????? ???????????? ??????
				Map<String, Object> deleteMap = new HashMap<String, Object>();
				
				// ?????? ?????? ?????? ?????? ????????? ??????
				for(int i=0;i<length;i++) {
					afterDeleteList.add(map.get("fileLength"+i).trim());
				}
				// ?????? ?????? ?????? ?????? ???????????? ????????????
				for (Map<String, Object> file : bbsFiles) {
					beforeDeleteList.add((String) file.get("REAL_FILE_NM")); 
				}
				beforeDeleteList.removeAll(afterDeleteList);
				afterDeleteList.removeAll(beforeDeleteList);
				
				for(int i=0;i<beforeDeleteList.size();i++) {
					deleteMap.put("realFileNm", beforeDeleteList.get(i));
					deleteMap.put("fileSn", bbsFiles.get(0).get("FILE_SN"));
					this.bbsService.deleteFileByFileSnRealFileNm(deleteMap);
				}
			}
		}
		BbsVO bbs = new BbsVO();
		
		/* ?????? ????????? ?????? */
		List<String> fileNmList = new ArrayList<String>();
		List<String> realFileNmList = new ArrayList<String>();
		String uploadFolder = "C:\\dalmuti\\dalmuti\\src\\main\\webapp\\resources\\upload";
		
		// ?????? ??????(???/???/???)
		File uploadPath = new File(uploadFolder, getFolder());
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		int fileSn = 0;
		
		// ?????? ?????? ????????? ???????????? ??? ????????? ????????? ????????????
		List<Map<String,Object>> bbsFiles = this.bbsService.bbsFiles(bbscttSn);
		if(bbsFiles.size() != 0) {
			fileSn =  Integer.parseInt(String.valueOf(bbsFiles.get(0).get("FILE_SN")));
		}
		// ????????? ??? ?????? ???????????? ???????????? ?????? ????????? 0?????? ?????????.
		if(reset == null) {
			bbs.setFileSn(0);
			this.bbsService.deleteFileByBbscttSn(bbscttSn);
		}
		
		for (MultipartFile file : uploadFiles) {
			int newFileSn = 0;
			if(file.getOriginalFilename().length() == 0 && reset != null) {
				bbs.setFileSn(fileSn);
				break;
			}else {
				this.bbsService.deleteFileByBbscttSn(bbscttSn);
				String uploadFileName = file.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				uploadFileName = uuid.toString() + "@" + uploadFileName;
				
				File saveFile = new File(uploadPath, uploadFileName);
				
				newFileSn = Integer.parseInt(map.get("fileSn"));
				String fileNm = uploadFileName;
				String flpth = uploadPath.toString();
				String realFileNm = file.getOriginalFilename();
				String realFileMG = String.valueOf(file.getSize());
				
				try {
					file.transferTo(saveFile);
					fileNmList.add(uploadFileName);
					realFileNmList.add(realFileNm);
					
					Map<String, Object> fileMap = new HashMap<String, Object>();
					fileMap.put("fileSn", newFileSn);
					fileMap.put("fileNm", fileNm);
					fileMap.put("flpth", flpth);
					fileMap.put("realFileNm", realFileNm);
					fileMap.put("realFileMG", realFileMG);
					
					this.bbsService.fileAdd(fileMap);
					bbs.setFileSn(newFileSn);
				} catch (Exception e) {
					log.error(e.getMessage());
				}
			}
		}	// for
		/* ?????? ????????? ??? */
		
		bbs.setBbscttSn(bbscttSn);
		bbs.setBbscttSj(bbscttSj);
		bbs.setBbscttCn(bbscttCn);
		
		this.bbsService.updateBbs(bbs);
		
		// empNm=?????????, writngDe=2021-12-24, sj=?????? 1 , sn=100, cn=<p></p>, fileSn=null
		
		return "redirect:/bbs/libraryView?bbscttSn=" + bbscttSn;
	}
	
	/** ????????? ??? **/
	
	
	
	/** ????????? ?????? ?????? **/
	// ??? ?????????
	@Auth
	@GetMapping("/bbs/bbsDelete")
	public String bbsDeleteProcess(String bbscttSn, String se) {
		this.bbsService.deleteBbs(bbscttSn);
		this.bbsService.deleteFileByBbscttSn(bbscttSn);
		
		if(se.equals("B1")) {
			return "redirect:/bbs/noticeList";
		}else {
			return "redirect:/bbs/libraryList?currentPage=1";
		}
		
	}
	
	// ??? ?????? ????????????
	@Auth
	@PostMapping("/bbs/bbsAddProcess")
	public String bbsAddProcess(Model model, @RequestParam Map<String, String> map, @RequestParam("uploadFiles") MultipartFile[] uploadFiles, HttpServletRequest request) {
		HttpSession session = request.getSession();
		EmpVO emp = (EmpVO) session.getAttribute("EMPVO");
		String empNo = emp.getEmpNo();
		
		/* ?????? ????????? ?????? */
		List<String> fileNmList = new ArrayList<String>();
		List<String> realFileNmList = new ArrayList<String>();
		String uploadFolder = "C:\\dalmuti\\dalmuti\\src\\main\\webapp\\resources\\upload";
		
		// ?????? ??????(???/???/???)
		File uploadPath = new File(uploadFolder, getFolder());
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		int fileSn = 0;
		for (MultipartFile file : uploadFiles) {
			if(file.getOriginalFilename().length() == 0) {
				break;
			}else {
//				log.info("?????? ?????? " + file.getOriginalFilename());
				String uploadFileName = file.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				uploadFileName = uuid.toString() + "@" + uploadFileName;
				
				File saveFile = new File(uploadPath, uploadFileName);
				
				fileSn = Integer.parseInt(map.get("fileSn"));
				String fileNm = uploadFileName;
				String flpth = uploadPath.toString();
				String realFileNm = file.getOriginalFilename();
				String realFileMG = String.valueOf(file.getSize());
				
				try {
					file.transferTo(saveFile);
					fileNmList.add(uploadFileName);
					realFileNmList.add(realFileNm);
					
					Map<String, Object> fileMap = new HashMap<String, Object>();
					fileMap.put("fileSn", fileSn);
					fileMap.put("fileNm", fileNm);
					fileMap.put("flpth", flpth);
					fileMap.put("realFileNm", realFileNm);
					fileMap.put("realFileMG", realFileMG);
					
					this.bbsService.fileAdd(fileMap);
					
				} catch (Exception e) {
				}
			}
		}	// for
		/* ?????? ????????? ??? */
		
		// {empNm=?????????, writngDe=2021-12-22, sj=, cn=<p>&nbsp;</p>}
		String writngDe = map.get("writngDe");
		String bbscttSj = map.get("sj");
		String bbscttCn = map.get("cn");
		
		BbsVO bbs = new BbsVO();
		bbs.setBbscttSj(bbscttSj);
		bbs.setBbscttCn(bbscttCn);
		bbs.setEmpNo(empNo);
		bbs.setWritngDe(writngDe);
		bbs.setBbsSeCode(map.get("se"));
		bbs.setFileSn(fileSn);
		this.bbsService.bbsAdd(bbs);
		
		String se = map.get("se");
		
		Map<String, Object> snMap = new HashMap<String, Object>();
		snMap.put("empNo", empNo);
		snMap.put("code", se);
		
		int bbscttSn = this.bbsService.selectThis(snMap);
		
		if(map.get("se").equals("B1")) {
			return "redirect:/bbs/noticeView?bbscttSn=" + bbscttSn;
		}else {
			return "redirect:/bbs/libraryView?bbscttSn=" + bbscttSn;
		}
	}
	
	// ?????? ????????? ?????? ??????
	public String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	
	// ?????? ????????????
	@GetMapping(value = "/bbs/bbsFileDownload", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName, @RequestParam int fileSn) {
		
		// ?????? ?????? ?????? ?????? ??????
		// ?????? ?????? ???????????? ?????? ?????? + "\\" + fileName !!
		List<Map<String, Object>> mapList = this.bbsService.imgFileList(fileSn);
		mapList.addAll(this.bbsService.etcFileList(fileSn));
		/*
		 * mapList : [{FLPTH=C:\\upload\\2021\\12\\14, REAL_FILE_NM=404.png, FILE_ORDR=1, FILE_NM=2a13f218-8979-419e-9759-9f39017bea35_404.png, FILE_SN=6, REAL_FILE_MG=63741}, 
		 * {FLPTH=C:\\upload\\2021\\12\\14, REAL_FILE_NM=500.jpg, FILE_ORDR=2, FILE_NM=7774e9d4-f359-40ad-94c1-c3772610c8b2_500.jpg, FILE_SN=6, REAL_FILE_MG=10708}]
		 */
		
		String flpth = mapList.get(0).get("FLPTH").toString();
		
		String uploadFolder = flpth.replace("\\", "\\\\");
		
//			String uploadFolder = "C:\\upload";
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
				int index = downloadName.lastIndexOf("@");
				downloadName = downloadName.substring(index + 1);
			}
			headers.add("Content-disposition", "attachment;filename=" + downloadName);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	/** ????????? ?????? ??? **/
	
	
}
