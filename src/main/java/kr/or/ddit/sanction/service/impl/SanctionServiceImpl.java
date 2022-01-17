package kr.or.ddit.sanction.service.impl;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.sanction.mapper.SanctionMapper;
import kr.or.ddit.sanction.service.SanctionService;
import kr.or.ddit.sanction.vo.DrftFormVO;
import kr.or.ddit.sanction.vo.ElctrnSanctnVO;

@Service
public class SanctionServiceImpl implements SanctionService {
	
	@Autowired
	SanctionMapper mapper;
	
	@Override
	public List<Map<String, Object>> formList() {
		return this.mapper.formList();
	}

	@Override
	public List<Map<String, Object>> formSearch(String keyword) {
		return this.mapper.formSearch(keyword);
	}

	@Override
	public DrftFormVO formDetail(int drftFormSn) {
		return this.mapper.formDetail(drftFormSn);
	}

	@Override
	public List<Map<String, Object>> tmprList(Map<String, Object> map) {
		return this.mapper.tmprList(map);
	}

	@Override
	public ElctrnSanctnVO tmprDetail(ElctrnSanctnVO elctrnSanctnVO) {
		return this.mapper.tmprDetail(elctrnSanctnVO);
	}

	@Override
	public boolean tmprAdd(Map<String, Object> map) {
		return this.mapper.tmprAdd(map);
	}

	@Override
	public boolean tmprAtModify(Map<String, Object> map) {
		return this.mapper.tmprAtModify(map);
	}

	@Override
	public boolean tmprDelete(int elcrtrnSanctnSn) {
		return this.mapper.tmprDelete(elcrtrnSanctnSn);
	}

	@Override
	public List<Map<String, Object>> requestList(Map<String, Object> map) {
		return this.mapper.requestList(map);
	}

	@Override
	public int requestListCount(String empNo) {
		return this.mapper.requestListCount(empNo);
	}

	@Override
	public List<Map<String, Object>> waitList(Map<String, Object> map) {
		return this.mapper.waitList(map);
	}

	@Override
	public int waitListCount(String empNo) {
		return this.mapper.waitListCount(empNo);
	}

//	@Override
//	public Map<String, Object> nextApproval(int elctrnSanctnSn) {
//		return this.mapper.nextApproval(elctrnSanctnSn);
//	}

	@Override
	public List<Map<String, Object>> underList(Map<String, Object> map) {
		return this.mapper.underList(map);
	}

	@Override
	public int underListCount(String empNo) {
		return this.mapper.underListCount(empNo);
	}

	@Override
	public List<Map<String, Object>> doneList(Map<String, Object> map) {
		return this.mapper.doneList(map);
	}

	@Override
	public boolean sanctnAdd(Map<String, Object> map) {
		return this.mapper.sanctnAdd(map);
	}

	@Override
	public boolean sanctnLineAdd(Map<String, Object> map) {
		return this.mapper.sanctnLineAdd(map);
	}
	
	@Override
	public boolean underSanctnSttusModify(int elctrnSanctnSn) {
		return this.mapper.underSanctnSttusModify(elctrnSanctnSn);
	}
	
	@Override
	public boolean returnSanctnSttusModify(Map<String, Object> map) {
		return this.mapper.returnSanctnSttusModify(map);
	}
	
	@Override
	public boolean rtrvlSanctnLineDelete(Map<String, Object> map) {
		return this.mapper.rtrvlSanctnLineDelete(map);
	}
	
	@Override
	public boolean rtrvlDelete(int elctrnSanctnSn) {
		return this.mapper.rtrvlDelete(elctrnSanctnSn);
	}

	@Override
	public boolean rtrvlAtModify(int elctrnSanctnSn) {
		return this.mapper.rtrvlAtModify(elctrnSanctnSn);
	}

	@Override
	public List<Map<String, Object>> rtrvlList(Map<String, Object> map) {
		return this.mapper.rtrvlList(map);
	}

	@Override
	public ElctrnSanctnVO rtrvlDetail(ElctrnSanctnVO elctrnSanctnVO) {
		return this.mapper.rtrvlDetail(elctrnSanctnVO);
	}

	@Override
	public List<Map<String, Object>> returnList(Map<String, Object> map) {
		return this.mapper.returnList(map);
	}

	@Override
	public Map<String, Object> empInfoByEmpNo(String empNo) {
		return this.mapper.empInfoByEmpNo(empNo);
	}

	@Override
	public ElctrnSanctnVO requestDetail(ElctrnSanctnVO elctrnSanctnVO) {
		return this.mapper.requestDetail(elctrnSanctnVO);
	}

	@Override
	public int tmprAt(int elctrnSanctnSn) {
		return this.mapper.tmprAt(elctrnSanctnSn);
	}

	@Override
	public List<Map<String, Object>> displayList(Map<String, Object> map) {
		return this.mapper.displayList(map);
	}

	@Override
	public boolean displayAtModify(Map<String, Object> map) {
		return this.mapper.displayAtModify(map);
	}

	@Override
	public int returnListCount(String empNo) {
		return this.mapper.returnListCount(empNo);
	}

	@Override
	public boolean returnAtModify(Map<String, Object> map) {
		return this.mapper.returnAtModify(map);
	}

	@Override
	public boolean returnSanctnLineModify(Map<String, Object> map) {
		return this.mapper.returnSanctnLineModify(map);
	}
	
	@Override
	public Map<String, Object> returnAt(int elctrnSanctnSn) {
		return this.mapper.returnAt(elctrnSanctnSn);
	}

	@Override
	public int nextFileSn() {
		return this.mapper.nextFileSn();
	}

	@Override
	public void fileAdd(Map<String, Object> map) throws  IOException, SQLException {
		
		/** 파라미터 정보 조회 */ 
		String uploadFolder = (String) map.get("uploadFolder");
		MultipartFile[] uploadFiles = (MultipartFile[]) map.get("uploadFiles");
		int serialNumber = (int) map.get("serialNumber");
		
		/** 파라미터 생성 : 폴더 생성 (yyyy/MM/dd folder) */ 
		File uploadPath = new File(uploadFolder, getFolder());
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/** 파일 이동처리 및 DB 저장 */
		List<String> fileNmList = new ArrayList<>();
		List<String> realFileNmList = new ArrayList<>();
		for (MultipartFile multipartFile : uploadFiles) {
			
			/** 변수 조회 ***************************************************************************************/ 
			String uploadFileName = multipartFile.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			{
				uploadFileName = uuid.toString() + "_" + uploadFileName;
			}
			
			File saveFile = new File(uploadPath, uploadFileName); // uploadFolder를 uploadPath로 수정함
			int fileSn = serialNumber;
			String fileNm = uploadFileName;
			String flpth = uploadPath.toString();
			String realFileNm = multipartFile.getOriginalFilename();
			String realFileMG = String.valueOf(multipartFile.getSize());

//			logger.info("――――――――――――――――――――――――――――――――――――");
//			logger.info("Upload File Name : " + multipartFile.getOriginalFilename());
//			logger.info("Upload File Size : " + multipartFile.getSize());
			
			/** 개별 파일 이동처리 및 DB 저장 ********************************************************************/ 
			{
				multipartFile.transferTo(saveFile); // 파일 이동
				fileNmList.add(uploadFileName);
				realFileNmList.add(realFileNm);
				
				/** 파일자료 저장 */
				Map<String, Object> fileMap = new HashMap<>();
				fileMap.put("fileSn", fileSn);
				fileMap.put("fileNm", fileNm);
				fileMap.put("flpth", flpth);
				fileMap.put("realFileNm", realFileNm);
				fileMap.put("realFileMG", realFileMG);
				boolean isSuccess = mapper.fileAdd(fileMap);
				
				if (isSuccess) {
//					logger.info("DB에 업로드 성공 ^_______^");
				}
			}
				
		}
		// ------------------------------------------------------------------------------------------------------------------------
		
//		logger.info("fileNmList : " + fileNmList);
//		logger.info("realFileNmList : " + realFileNmList);
		
		/** 전달자료 저장 */
		map.put("fileNmList", fileNmList);
		map.put("realFileNmList", realFileNmList);
		
		//return this.mapper.fileAdd(map);
	}

	@Override
	public List<Map<String, Object>> fileList(int fileSn) {
		return this.mapper.fileList(fileSn);
	}

	@Override
	public List<Map<String, Object>> waitSearch(Map<String, Object> map) {
		return this.mapper.waitSearch(map);
	}

	@Override
	public List<Map<String, Object>> underSearch(Map<String, Object> map) {
		return this.mapper.underSearch(map);
	}

	@Override
	public List<Map<String, Object>> doneSearch(Map<String, Object> map) {
		return this.mapper.doneSearch(map);
	}

	@Override
	public List<Map<String, Object>> returnSearch(Map<String, Object> map) {
		return this.mapper.returnSearch(map);
	}

	@Override
	public List<Map<String, Object>> requestSearch(Map<String, Object> map) {
		return this.mapper.requestSearch(map);
	}

	@Override
	public List<Map<String, Object>> rtrvlSearch(Map<String, Object> map) {
		return this.mapper.rtrvlSearch(map);
	}

	@Override
	public List<Map<String, Object>> tmprSearch(Map<String, Object> map) {
		return this.mapper.tmprSearch(map);
	}

	@Override
	public List<Map<String, Object>> displaySearch(Map<String, Object> map) {
		return this.mapper.displaySearch(map);
	}
	
	@Override
	public Map<String, Object> sanctnCount(String empNo) {
		return this.mapper.sanctnCount(empNo);
	}

	@Override
	public ElctrnSanctnVO waitDetail(ElctrnSanctnVO elctrnSanctnVO) {
		return this.mapper.waitDetail(elctrnSanctnVO);
	}

	@Override
	public ElctrnSanctnVO underDetail(ElctrnSanctnVO elctrnSanctnVO) {
		return this.mapper.underDetail(elctrnSanctnVO);
	}

	@Override
	public ElctrnSanctnVO doneDetail(ElctrnSanctnVO elctrnSanctnVO) {
		return this.mapper.doneDetail(elctrnSanctnVO);
	}

	@Override
	public ElctrnSanctnVO returnDetail(ElctrnSanctnVO elctrnSanctnVO) {
		return this.mapper.returnDetail(elctrnSanctnVO);
	}

	@Override
	public ElctrnSanctnVO displayDetail(ElctrnSanctnVO elctrnSanctnVO) {
		return this.mapper.displayDetail(elctrnSanctnVO);
	}
	
	// 파일 업로드 폴더 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}

	@Override
	public List<Map<String, Object>> sanctnLineList(int elctrnSanctnSn) {
		return this.mapper.sanctnLineList(elctrnSanctnSn);
	}	
	@Override
	public int findElctrnSanctnSn() {
		return this.mapper.findElctrnSanctnSn();
	}
	
	@Override
	public String formName(int elctrnSanctnSn) {
		return this.mapper.formName(elctrnSanctnSn);
	}
	
	@Override
	public boolean addFileSnToSanctn(Map<String, Object> map) {
		return this.mapper.addFileSnToSanctn(map);
	}
	
	@Override
	public int fileSnBySn(int elctrnSanctnSn) {
		return this.mapper.fileSnBySn(elctrnSanctnSn);
	}
	
	@Override
	public Map<String, Object> drftEmpNameBySn(int elctrnSanctnSn) {
		return this.mapper.drftEmpNameBySn(elctrnSanctnSn);
	}
	
	@Override
	public boolean drftSanctnLineAdd(String empNo) {
		return this.mapper.drftSanctnLineAdd(empNo);
	}
	
	@Override
	public boolean sanctnConfirm(Map<String, Object> map) {
		return this.mapper.sanctnConfirm(map);
	}
	
	@Override
	public String sanctnComptDeIsNull(int elctrnSanctnSn) {
		return this.mapper.sanctnComptDeIsNull(elctrnSanctnSn);
	}
	
	@Override
	public String lastSanctnSttus(int elctrnSanctnSn) {
		return this.mapper.lastSanctnSttus(elctrnSanctnSn);
	}
	
	@Override
	public boolean doneSanctnSttusModify(Map<String, Object> map) {
		return this.mapper.doneSanctnSttusModify(map);
	}
	
	@Override
	public boolean returnDelete(int elctrnSanctnSn) {
		return this.mapper.returnDelete(elctrnSanctnSn);
	}
	
	@Override
	public boolean ccAdd(Map<String, Object> map) {
		return this.mapper.ccAdd(map);
	}
	
	@Override
	public List<Map<String, Object>> ccList(Map<String, Object> map) {
		return this.mapper.ccList(map);
	}
	
	@Override
	public List<Map<String, Object>> ccSearch(Map<String, Object> map) {
		return this.mapper.ccSearch(map);
	}
	
	@Override
	public ElctrnSanctnVO ccDetail(ElctrnSanctnVO elctrnSanctnVO) {
		return this.mapper.ccDetail(elctrnSanctnVO);
	}
	
	@Override
	public boolean rtrvlCcDelete(Map<String, Object> map) {
		return this.mapper.rtrvlCcDelete(map);
	}
	
	@Override
	public boolean ccCnfirmAtModify(Map<String, Object> map) {
		return this.mapper.ccCnfirmAtModify(map);
	}
	
	@Override
	public List<Map<String, Object>> ccEmpInfoBySn(int elctrnSanctnSn) {
		return this.mapper.ccEmpInfoBySn(elctrnSanctnSn);
	}
	
	@Override
	public List<Map<String, Object>> fileListName(String keyword) {
		return this.mapper.fileListName(keyword);
	}
	
	@Override
	public int findSanctnStep(Map<String, Object> map) {
		return this.mapper.findSanctnStep(map);
	}
	
	@Override
	public List<Map<String, Object>> sanctnLineList2(int elctrnSanctnSn) {
		return this.mapper.sanctnLineList2(elctrnSanctnSn);
	}
	
	@Override
	public String rtrvlSanctnConfirmAt(int elctrnSanctnSn) {
		return this.mapper.rtrvlSanctnConfirmAt(elctrnSanctnSn);
	}
	
	@Override
	public String displayAt(int elctrnSanctn) {
		return this.mapper.displayAt(elctrnSanctn);
	}
	
	@Override
	public String ccCnfirmAt(Map<String, Object> map) {
		return this.mapper.ccCnfirmAt(map);
	}

	@Override
	public int tmprListCount(String empNo) {
		return this.mapper.tmprListCount(empNo);
	}

	@Override
	public int doneListCount(String empNo) {
		return this.mapper.doneListCount(empNo);
	}

	@Override
	public int rtrvlListCount(String empNo) {
		return this.mapper.rtrvlListCount(empNo);
	}

	@Override
	public int ccListCount(String empNo) {
		return this.mapper.ccListCount(empNo);
	}

	@Override
	public int displayListCount(String empNo) {
		return this.mapper.displayListCount(empNo);
	}

	@Override
	public int requestSearchCount(Map<String, Object> map) {
		return this.mapper.requestSearchCount(map);
	}

	@Override
	public int tmprSearchCount(Map<String, Object> map) {
		return this.mapper.tmprSearchCount(map);
	}

	@Override
	public int rtrvlSearchCount(Map<String, Object> map) {
		return this.mapper.rtrvlSearchCount(map);
	}

	@Override
	public int waitSearchCount(Map<String, Object> map) {
		return this.mapper.waitSearchCount(map);
	}

	@Override
	public int underSearchCount(Map<String, Object> map) {
		return this.mapper.underSearchCount(map);
	}

	@Override
	public int doneSearchCount(Map<String, Object> map) {
		return this.mapper.doneSearchCount(map);
	}

	@Override
	public int ccSearchCount(Map<String, Object> map) {
		return this.mapper.ccSearchCount(map);
	}

	@Override
	public int returnSearchCount(Map<String, Object> map) {
		return this.mapper.returnSearchCount(map);
	}

	@Override
	public int displaySearchCount(Map<String, Object> map) {
		return this.mapper.displaySearchCount(map);
	}
	
	@Override
	public Map<String, Object> lastSttusCodeBySn(int elctrnSanctnSn) {
		return this.mapper.lastSttusCodeBySn(elctrnSanctnSn);
	}
	
	
}
