package kr.or.ddit.login.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.hr.vo.EmpVO;

public interface LoginService {

	/** 로그인 체크 */
	EmpVO get(EmpVO empVO);	
	
	/** 직원 휴대폰번호 정보 */
	int phoneCheck(String phonenum);
	
	/** 임시 비밀번호로 변경 */
	int updatePW(EmpVO empVO);
	
	/** 직원 권한 정보 */
	List<Map<String, Object>> selectAuthor(String empNo);
}
