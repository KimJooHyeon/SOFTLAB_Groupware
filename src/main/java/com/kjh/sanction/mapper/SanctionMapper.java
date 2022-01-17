package com.kjh.sanction.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.kjh.sanction.vo.DrftFormVO;
import com.kjh.sanction.vo.ElctrnSanctnVO;

public interface SanctionMapper {
	
	/* 
	  	양식 
 	*/
	
	// 양식 목록 조회
	List<Map<String, Object>> formList();
	
	// 양식 검색
	List<Map<String, Object>> formSearch(String keyword);
	
	// 양식 상세 조회
	DrftFormVO formDetail(int drftFormSn);
	
	/*
		임시저장
	*/
	
	// 임시저장 목록 조회
	List<Map<String, Object>> tmprList(Map<String, Object> map);
	
	// 임시저장 상세 조회
	ElctrnSanctnVO tmprDetail(ElctrnSanctnVO elctrnSanctnVO);
	
	// 임시저장 문서 추가
	boolean tmprAdd(Map<String, Object> map);
	
	// 임시저장 문서 수정
	boolean tmprAtModify(Map<String, Object> map);
	
	// 임시저장 문서 삭제
	boolean tmprDelete(int elctrnSanctnSn);
	
	// 임시저장 문서 여부 판단
	int tmprAt(int elctrnSanctnSn);
	
	// 임시저장 문서 개수 조회
	int tmprListCount(String empNo);
	
	/*
		전자결재
	*/
	
	// 상세
	// 결재대기상세
	ElctrnSanctnVO waitDetail(ElctrnSanctnVO elctrnSanctnVO);
	
	// 결재진행상세
	ElctrnSanctnVO underDetail(ElctrnSanctnVO elctrnSanctnVO);
	
	// 결재완료문서상세
	ElctrnSanctnVO doneDetail(ElctrnSanctnVO elctrnSanctnVO);
	
	// 결재반려문서상세
	ElctrnSanctnVO returnDetail(ElctrnSanctnVO elctrnSanctnVO);
	
	// 공람문서상세
	ElctrnSanctnVO displayDetail(ElctrnSanctnVO elctrnSanctnVO);
	
	// 결재 요청 문서 목록 조회 (기안자)
	List<Map<String, Object>> requestList(Map<String, Object> map);
	
	// 결재 요청 문서 상세 정보 조회
	ElctrnSanctnVO requestDetail(ElctrnSanctnVO elctrnSanctnVO);
	
	// 결재 요청 문서 개수 조회 (기안자)
	int requestListCount(String empNo);
	
	// 결재 대기 문서 목록 조회 (결재자)
	// 결재 대기 문서 목록은 다음 결재자에게만 보여주기
	// IF문을 통하여 empNo가 '다음 결재자 찾기' 쿼리 실행 결과와 일치할 때 아래 쿼리 실행
	List<Map<String, Object>> waitList(Map<String, Object> map);
	
	// 결재 대기 문서 개수 조회 (결재자)
	int waitListCount(String empNo);
	
	// 결재 대기 문서 목록 검색
	List<Map<String, Object>> waitSearch(Map<String, Object> map);
	
	// 결재 진행 문서 목록 검색
	List<Map<String, Object>> underSearch(Map<String, Object> map);
	
	// 결재 완료 문서 목록 검색
	List<Map<String, Object>> doneSearch(Map<String, Object> map);
	
	// 반려 문서 목록 검색
	List<Map<String, Object>> returnSearch(Map<String, Object> map);
	
	// 결재 요청 문서 목록 검색
	List<Map<String, Object>> requestSearch(Map<String, Object> map);
	
	// 결재 요청 문서 목록 검색 개수 조회
	int requestSearchCount(Map<String, Object> map);
	
	// 임시저장 문서 목록 검색 개수 조회
	int tmprSearchCount(Map<String, Object> map);
	
	// 회수 문서 목록 검색 개수 조회
	int rtrvlSearchCount(Map<String, Object> map);
	
	// 결재 대기 문서 목록 검색 개수 조회
	int waitSearchCount(Map<String, Object> map);
	
	// 결재 진행 문서 목록 검색 개수 조회
	int underSearchCount(Map<String, Object> map);
	
	// 결재 완료 문서 목록 검색 개수 조회
	int doneSearchCount(Map<String, Object> map);
	
	// 참조 문서 목록 검색 개수 조회
	int ccSearchCount(Map<String, Object> map);
	
	// 반려 문서 목록 검색 개수 조회
	int returnSearchCount(Map<String, Object> map);
	
	// 공람 문서 목록 검색 개수 조회
	int displaySearchCount(Map<String, Object> map);
	
	// 임시저장 문서 목록 검색
	List<Map<String, Object>> tmprSearch(Map<String, Object> map);
	
	// 회수문서 목록 검색
	List<Map<String, Object>> rtrvlSearch(Map<String, Object> map);
	
	// 다음 결재자 찾기
//	Map<String, Object> nextApproval(int elctrnSanctnSn);
	
	// 문서의 최종결재일자가 NULL인지 확인하기
	String sanctnComptDeIsNull(int elctrnSanctnSn);
	
	// 결재 진행 문서 목록 조회 (결재자)
	List<Map<String, Object>> underList(Map<String, Object> map);
	
	// 결재 진행 문서 개수 조회 (결재자)
	int underListCount(String empNo);
	
	// 결재 완료 문서 목록 조회 (결재자)
	List<Map<String, Object>> doneList(Map<String, Object> map);
	
	// 결재 완료 문서 개수 조회
	int doneListCount(String empNo);
	
	// 결재 문서 상신 (등록, 추가)
	boolean sanctnAdd(Map<String, Object> map);
	
	// 결재완료 문서의 경우 결재문서의 상태 수정
	boolean doneSanctnSttusModify(Map<String, Object> map);
	
	// 문서의 마지막 결재자의 결재상태코드 조회
	String lastSanctnSttus(int elctrnSanctnSn);
	
	// 다음 결재자의 결재상태코드를 진행중으로 수정
	boolean underSanctnSttusModify(int elctrnSanctnSn);
	
	// 반려 문서의 경우 이후 결재자들의 결재상태코드 수정
	boolean returnSanctnSttusModify(Map<String, Object> map);
	
	// 결재자의 결재 단계 조회
	int findSanctnStep(Map<String, Object> map);
	
	// 기안자 결재라인 추가
	boolean drftSanctnLineAdd(String empNo);
	
	// 결재라인 추가
	boolean sanctnLineAdd(Map<String, Object> map);
	
	// 참조자 추가
	boolean ccAdd(Map<String, Object> map);
	
	// 참조자 조회
	List<Map<String, Object>> ccEmpInfoBySn(int elctrnSanctnSn);
	
	// 참조 문서 목록
	List<Map<String, Object>> ccList(Map<String, Object> map);
	
	// 참조 문서 목록 검색
	List<Map<String, Object>> ccSearch(Map<String, Object> map);
	
	// 참조 문서 상세
	ElctrnSanctnVO ccDetail(ElctrnSanctnVO elctrnSanctnVO);
	
	// 참조 문서 확인 여부 수정
	boolean ccCnfirmAtModify(Map<String, Object> map);
	
	// 참조 문서 확인 여부
	String ccCnfirmAt(Map<String, Object> map);
	
	// 참조 문서 개수 조회
	int ccListCount(String empNo);
	
	// 결재양식명 구하기
	String formName(int elctrnSanctnSn);
	
	// 결재 요청 문서 회수 (결재자가 결재하지 않았을 경우)
	boolean rtrvlSanctnLineDelete(Map<String, Object> map);
	
	// 결재 요청 문서 회수(참조자)
	boolean rtrvlCcDelete(Map<String, Object> map);
	
	// 결재 문서 회수 여부 수정
	boolean rtrvlAtModify(int elctrnSanctnSn);
	
	// 회수 문서 삭제
	boolean rtrvlDelete(int elctrnSanctnSn);
	
	// 회수 문서 목록 조회
	List<Map<String, Object>> rtrvlList(Map<String, Object> map);
	
	// 회수 문서 상세 정보 조회
	ElctrnSanctnVO rtrvlDetail(ElctrnSanctnVO elctrnSanctnVO);
	
	// 회수 문서 개수 조회
	int rtrvlListCount(String empNo);
	
	// 첫 번째 결재자의 결재여부 확인 (기결재 문서라면 회수 불가)
	String rtrvlSanctnConfirmAt(int elctrnSanctnSn);

	// 결재자 결재(승인)
	boolean sanctnConfirm(Map<String, Object> map);
	
	// 반려 문서 목록 조회
	List<Map<String, Object>> returnList(Map<String, Object> map);
	
	// 반려 문서 삭제
	boolean returnDelete(int elctrnSanctnSn);
	
	// 반려 문서 개수 조회
	int returnListCount(String empNo);
	
	// 반려 문서로 수정
	boolean returnAtModify(Map<String, Object> map);
	
	// 반려 문서로 수정에 따른 결재라인 내 결재자의 코드 등 수정
	boolean returnSanctnLineModify(Map<String, Object> map);
	
	// 공람 문서 목록 조회
	List<Map<String, Object>> displayList(Map<String, Object> map);
	
	// 공람 문서 여부 수정
	boolean displayAtModify(Map<String, Object> map);
	
	// 공람 문서 목록 검색
	List<Map<String, Object>> displaySearch(Map<String, Object> map);
	
	// 공람 여부 확인
	String displayAt(int elctrnSanctn);
	
	// 공람 문서 개수 조회
	int displayListCount(String empNo);
	
	// 결재라인 상세정보 조회
	List<Map<String, Object>> sanctnLineList(int elctrnSanctnSn);
	
	// 기결재자 결재라인 상세 정보 조회
	List<Map<String, Object>> sanctnLineList2(int elctrnSanctnSn);
	
	
	// 반려문서인지 확인하기
	Map<String, Object> returnAt(int elctrnSanctnSn);
	
	/*
	 	파일
	*/
	// 문서번호로 파일번호 찾기
	int fileSnBySn(int elctrnSanctnSn);
	
	// 결재문서에 파일번호 추가
	boolean addFileSnToSanctn(Map<String, Object> map);
	
	// 다음에 추가될 파일의 file_sn 조회
	int nextFileSn();
	
	// 파일 추가
	boolean fileAdd(Map<String, Object> map) throws SQLException;
	
	// 파일 상세 조회
	List<Map<String, Object>> fileList(int fileSn);
	
	// 파일 목록 조회 (파일명으로)
	List<Map<String, Object>> fileListName(String keyword);
	
	
	/*
		기타
	*/
	// 	문서번호로 기안자 찾기
	Map<String, Object> drftEmpNameBySn(int elctrnSanctnSn);
	
	// 문서의 결재상태 찾기
	Map<String, Object> lastSttusCodeBySn(int elctrnSanctnSn);
	
	// emp_no로 emp_nm, dept_nm 찾기
	Map<String, Object> empInfoByEmpNo(String empNo);
	
	// tiles - aisde에 전자결재 개수 표시하기 위함
	Map<String, Object> sanctnCount(String empNo);
	
	// 현재 문서일련번호 찾기
	int findElctrnSanctnSn();
	
}













