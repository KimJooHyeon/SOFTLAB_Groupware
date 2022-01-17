package kr.or.ddit.hr.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.hr.mapper.EmpMapper;
import kr.or.ddit.hr.service.EmpService;
import kr.or.ddit.hr.vo.CrtfreqstVO;
import kr.or.ddit.hr.vo.DeptVO;
import kr.or.ddit.hr.vo.EmpVO;

@Service
public class EmpServiceImpl implements EmpService {
	@Autowired
	EmpMapper mapper;
	// 재직자 직원 목록
	@Override
	public List<Map<String, Object>> selectIng(Map<String, Object> map) throws Exception {
		return this.mapper.selectIng(map);
	}
	// 재직자 수
	@Override
	public int selectIngCount() {
		// TODO Auto-generated method stub
		return this.mapper.selectIngCount();
	}

	// 퇴직자 직원 목록
	@Override
	public List<Map<String, Object>> selectRetire(Map<String, Object> map) throws Exception {
		return this.mapper.selectRetire(map);
	}
	// 퇴직자 수
	@Override
	public int selectRetireCount() {
		// TODO Auto-generated method stub
		return this.mapper.selectRetireCount();
	}
	
	// 직원 검색
	@Override
	public List<Map<String, Object>> searchEmp(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.mapper.searchEmp(map);
	}
	// 직원 검색 결과 수
	@Override
	public int searchEmpCount(String keyword) {
		return this.mapper.searchEmpCount(keyword);
	}
	
	// 부서로 직원 목록
	@Override
	public List<Map<String, Object>> selectByDept(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.mapper.selectByDept(map);
	}
	// 부서 구분 결과 수
	@Override
	public int selectByDeptCount(Map<String, Object> map) {
		return this.mapper.selectByDeptCount(map);
	}
	
	// 직원 정보
	@Override
	public EmpVO detailEmp(String empNo) {
		// TODO Auto-generated method stub
		return this.mapper.detailEmp(empNo);
	}
	
	// 직원 등록
	@Override
	public int insertEmp(EmpVO emp) {
		// TODO Auto-generated method stub
		return this.mapper.insertEmp(emp);
	}
	// 직원 등록 시 기본 권한 부여
	@Override
	public int insertAuthor(Map<String, Object> map) {
		return this.mapper.insertAuthor(map);
	};
	
	// 직원번호 자동생성
	@Override
	public String createEmpNo() throws Exception {
		return this.mapper.createEmpNo();
	}
	// 내선번호 자동생성
	@Override
	public String createLxtnNo() throws Exception {
		return this.mapper.createLxtnNo();
	}
	
	// 직원의 부서 정보 불러오기
	@Override
	public DeptVO selectDept(String empNo) {
		// TODO Auto-generated method stub
		return this.mapper.selectDept(empNo);
	}
	
	// 직원 정보 수정
	@Override
	public int updateEmp(EmpVO emp) {
		// TODO Auto-generated method stub
		return this.mapper.updateEmp(emp);
	}
	
	// 직원 퇴사 처리
	@Override
	public int retireEmp(EmpVO emp) {
		// TODO Auto-generated method stub
		return this.mapper.retireEmp(emp);
	}

	// 조직도 - 부서 목록
	@Override
	public List<Map<String, Object>> deptList(Map<String, Object> map) throws Exception {
		return this.mapper.deptList(map);
	}

	// 조직도 - 팀 목록
	@Override
	public List<Map<String, Object>> teamList(Map<String, Object> map) throws Exception {
		return this.mapper.teamList(map);
	}
	
	// 조직도 - 직원 목록
	@Override
	public List<Map<String, Object>> deptEmpList(Map<String, Object> map) throws Exception {
		return this.mapper.deptEmpList(map);
	}
	
	// 조직도 - 직원 상세정보
	@Override
	public EmpVO empDetail(String empNo) throws Exception {
		return this.mapper.empDetail(empNo);
	}

	@Override
	public EmpVO empDetail(EmpVO empList) {
		return this.mapper.empDetail(empList);
	}
	
	// 직원 검색
	@Override
	public List<EmpVO> empSearch(String keyword) {
		return this.mapper.empSearch(keyword);
	}

	// 증명서 임시저장
	@Override
	public int insertCrtf(Map<String, Object> map) {
		return this.mapper.insertCrtf(map);
	}
	
	// 증명서 목록(발급대장)
	@Override
	public List<Map<String, Object>> crtfList(Map<String, Object> map) {
		return this.mapper.crtfList(map);
	}
	
	// 증명서 발급대장 수
	@Override
	public int crtfListCount(String empNo) {
		return this.mapper.crtfListCount(empNo);
	}
	
	// 증명서 신청 취소
	@Override
	public int deleteCrtf(int crtfReqstSn) {
		return this.mapper.deleteCrtf(crtfReqstSn);
	}

	// 증명서 출력
	@Override
	public CrtfreqstVO crtfDetail(int crtfReqstSn) {
		return this.mapper.crtfDetail(crtfReqstSn);
	}
	
	// 전직원 증명서 신청 내역 조회(관리자)
	@Override
	public List<CrtfreqstVO> adminCrtfList(CrtfreqstVO crtfreqstVO) {
		return this.mapper.adminCrtfList(crtfreqstVO);
	}
	
	// 증명서 반려
	@Override
	public int returnCrtf(int crtfReqstSn) {
		return this.mapper.returnCrtf(crtfReqstSn);
	}
	
	// 증명서 승인
	@Override
	public int confmCrtf(int crtfReqstSn) {
		return this.mapper.confmCrtf(crtfReqstSn);
	}
	
	// 증명서 신청 페이징(관리자)
	@Override
	public List<Map<String, Object>> adminCrtfPaging(Map<String, Object> map) {
		return this.mapper.adminCrtfPaging(map);
	}
	
	// 증명서 신청 페이징(관리자)
	@Override
	public int adminCrtfPagingCount() {
		return this.mapper.adminCrtfPagingCount();
	}
	
	// 근무 형태 조회
    @Override
	public String selectWorkStleCode(String empNo) {
    	return this.mapper.selectWorkStleCode(empNo);
    }
}
