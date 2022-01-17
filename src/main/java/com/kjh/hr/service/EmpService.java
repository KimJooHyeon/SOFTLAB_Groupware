package com.kjh.hr.service;

import java.util.List;
import java.util.Map;

import com.kjh.hr.vo.CrtfreqstVO;
import com.kjh.hr.vo.DeptVO;
import com.kjh.hr.vo.EmpVO;

public interface EmpService {
	// 재직자 직원 목록
	public List<Map<String, Object>> selectIng(Map<String, Object> map) throws Exception;
	// 재직자 수
	public int selectIngCount();

	// 퇴직자 직원 목록
	public List<Map<String, Object>> selectRetire(Map<String, Object> map) throws Exception;
	// 퇴직자 수
	public int selectRetireCount();
	
	// 직원 검색
	public List<Map<String, Object>> searchEmp(Map<String, Object> map);
	// 직원 검색 결과 수
	public int searchEmpCount(String keyword);
	
	// 부서로 직원 목록
	public List<Map<String, Object>> selectByDept(Map<String, Object> map);
	// 부서 구분 결과 수
	public int selectByDeptCount(Map<String, Object> map);
	
	// 직원번호 자동생성
	public String createEmpNo() throws Exception;
	
	// 직원 내선번호 자동생성
	public String createLxtnNo() throws Exception;
	
	// 직원 상세 정보
	public EmpVO detailEmp(String empNo);
	
	// 직원 등록
	public int insertEmp(EmpVO emp);
	// 기본 권한 부여
	public int insertAuthor(Map<String, Object> map);
	
	
	// 해당직원 부서 가져오기
	public DeptVO selectDept(String empNo);
	
	// 직원 정보 수정
	public int updateEmp(EmpVO emp);
	
	// 퇴사 처리
	public int retireEmp(EmpVO emp);
	
	// 조직도 - 부서 목록
	List<Map<String, Object>> deptList(Map<String, Object> map) throws Exception;

	// 조직도 - 팀 목록
	List<Map<String, Object>> teamList(Map<String, Object> map) throws Exception;
	
	// 조직도 - 직원 목록
	List<Map<String, Object>> deptEmpList(Map<String, Object> map) throws Exception;
	
	// 조직도 - 직원 상세정보
	EmpVO empDetail(String empNo) throws Exception;
	EmpVO empDetail(EmpVO empList);

	// 직원 검색
	List<EmpVO> empSearch(String keyword);
	
	// 증명서 임시저장
	int insertCrtf(Map<String, Object> map);
	
	// 증명서 목록(발급대장)
	List<Map<String, Object>> crtfList(Map<String, Object> map);
	
	// 증명서 신청 수
	int crtfListCount(String empNo);
	
	// 증명서 취소
	int deleteCrtf(int crtfReqstSn);
	
	// 증명서 출력
	CrtfreqstVO crtfDetail(int crtfReqstSn);
	
	// 전직원 증명서 신청내역 조회
	List<CrtfreqstVO> adminCrtfList(CrtfreqstVO crtfreqstVO);
	
	// 증명서 반려
	int returnCrtf(int crtfReqstSn);
	
	// 증명서 승인
	int confmCrtf(int crtfReqstSn);
	
	// 증명서 신청 직원 목록
	List<Map<String, Object>> adminCrtfPaging(Map<String, Object> map);
	
	// 증명서 신청 수
	int adminCrtfPagingCount();
	
	// 근무 형태 조회
    String selectWorkStleCode(String empNo);
}
