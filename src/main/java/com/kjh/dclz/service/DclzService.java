package com.kjh.dclz.service;

import java.util.List;
import java.util.Map;

import com.kjh.dclz.vo.BsrpVO;
import com.kjh.dclz.vo.DclzVO;
import com.kjh.dclz.vo.RestdeVO;
import com.kjh.dclz.vo.VcatnVO;
import com.kjh.dclz.vo.YrycVO;

public interface DclzService {
	
	// 나의 근태 등록 (출근등록) 
	int commuteInsert(Map<String, Object> map);
	
	// 나의 근태 등록 (퇴근)
	int getoff(Map<String, Object> map);
	
	// 나의 근태현황 목록조회 (일자별)
	List<Map<String, Object>> selectDclzList(Map<String, Object> map);

	// 나의 근태현황 목록 개수 조회
	int dclzListCount(Map<String, Object> map);
	
	// 나의 근태현황 목록조회 (주차별)
	List<Map<String, Object>> weekSelectDclz(Map<String, Object> map);
	
	// 나의 근태현황 기간으로 검색 
	List<Map<String, Object>> searchDclzList(Map<String, Object> map);
	
	// 나의 근태현황 기간으로 검색 결과 수
	int searchDclzListCount(String empNo);
	
	// 휴일 등록 목록조회
	List<Map<String, Object>> restDeList(Map<String, Object> map);
	
	// 휴일 목록 개수조회 
	int restDeCount(Map<String, Object> map);
	
	// 휴일 등록
	int restDeInsert(RestdeVO restdeVO);
	
	// 휴일 삭제
	int restDeDelete(String restdeSn);
	
	// 출장 임시저장
	int bsrpInsert(Map<String, Object> map);

	// 출장 신청 목록조회
	List<Map<String, Object>> bsrpList(Map<String, Object> map);
	
	// 출장임시저장 목록 개수 조회
	int bsrpListCount(String empNo);

	// 출장 임시저장 삭제 
	int bsrpDelete(String bsrpSn);

	// 출장 임시저장 상세조회
	BsrpVO bsrpDetail(String bsrpSn);

	// 출장 임시저장 
	int bsrpUpdate(Map<String, Object> map);

	// 출장 임시저장함 검색 
	List<Map<String, Object>> searchBsrpPage(Map<String, Object> map);
	
	// 출장 임시저장함 검색 개수 조회 
	int searchBsrpCount(Map<String, Object> map);

	// 휴가신청 폼 휴가일수 조회 
	YrycVO yrycSelect(Map<String, Object> map);

	// 휴가신청 임시저장 
	int vcatnInsert(Map<String, Object> map);

	// 휴가신청 임시저장 목록조회 
	List<Map<String, Object>> vcatnList(Map<String, Object> map);
	
	// 휴가 임시저장함 자료 수 
	int vcatnListCount(String empNo);

	// 휴가신청 임시저장함 삭제 
	int vcatnDelete(String vcatnSn);
	
	// 휴가 임시저장 검색 
	List<Map<String, Object>> searchVcatnPage(Map<String, Object> map);
	
	// 휴가 임시저장함 검색 개수 조회 
	int searchVcatnCn(Map<String, Object> map);

	// 휴가신청 상세조회
	VcatnVO vcatnDetail(String vcatnSn);

	// 휴가신청 수정 
	int vcatnUpdate(Map<String, Object> map);

	// 휴가관리 관리자 전체조회
	List<Map<String, Object>> vcatnadmin(Map<String, Object> map);
	
	// 관리자 근태관리 전체 목록 조회
	List<Map<String, Object>> dclzadminSelect(Map<String, Object> map);
	
	// 관리자 휴가관리 전체 목록 조회 결과 수
	int vcatnaminCount(String year);

	// 휴가관리 관리자 전체목록 검색
	List<Map<String, Object>> vcatnadminSearch(Map<String, Object> map);
	
	// 휴가관리 관리자 전체목록 검색 결과수 
	int searchVcatnCount(Map<String, Object> map);

	// 휴가관리 관리자 부서별 목록 조회 
	List<Map<String, Object>> vcatnSelectByDept(Map<String, Object> map);
	
	// 근태관리 관리자 부서별 목록 조회 
	List<Map<String, Object>> dclzSelectByDept(Map<String, Object> map);

	// 휴가관리 관리자 부서별 목록 조회 결과수
	int vcatnSelectByDeptCount(Map<String, Object> map);
	
	// 근태관리 관리자 부서별 목록 조회 결과수
	int dclzSelectByDeptCount(Map<String, Object> map);

	// 휴가관리 관리자 직원 전체 목록 조회 
	List<Map<String, Object>> vcatnSelectByAll();

	// 휴가관리 관리자 연차 일괄등록 
	int insertVcatnAdmin(Map<String, Object> map);
	
	 // 재직자 전체목록 조회 
    List<Map<String, Object>>selectAllemp();
    
    // 재직자 전체목록 조회 결과 수 
    int selectAllempCount();
    
    // 직원별 근무형태코드 조회 
    List<Map<String, Object>> selectWorkStle(Map<String, Object> map);
	
	// 출근 기록 수 조회 
    int commitCount(Map<String, Object> map);
    
    // 출근 기록 조회 
    List<Map<String, Object>> commitYn(Map<String, Object> map);
    
    //전자결재 양식 코드번호 조회
    String searchSanctnSn(int elctrnSanctnSn);
    
    // 전자결재 상신 후 휴가 테이블 업데이트
    int updateVcatn(Map<String, Object> map);
    
    // 전자결재 상신 후 휴가 테이블 업데이트
    int updateBsrp(Map<String, Object> map);
    
    // 사용 휴가 일수와 휴가 구분 코드 조회
    Map<String,Object> vcatnDaynCode(int elctrnSanctnSn);
    
    // 사용 휴가 일수와 휴가 구분 코드 조회
    Map<String,Object> bsrpDaynCode(int elctrnSanctnSn);
    
    // 연차 테이블 업데이트 
    int yrycUpdate(Map<String,Object> map); 
    
    // 휴일 등록 목록조회 (주현)
    String restDeList2(String restdeDe);
    
    // 전자결재 상태조회 
    Map<String,Object> elctrnSanState(int elctrnSanctnSn);
	
    // 시작일과 종료일 사이의 날짜 구하기 
    List<Map<String, Object>> daySearch(Map<String, Object> map);
    
    // 전자결재 후 근태내역 코드 변경
    int afterSanction(Map<String, Object> map);
    
    // 전자결재 후 근태내역 코드 등록 
    int afterSanctionInsert(Map<String, Object> map);
	




	
	

}
