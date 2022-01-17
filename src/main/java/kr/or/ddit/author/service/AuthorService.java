package kr.or.ddit.author.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.author.vo.AuthorEmpVO;

public interface AuthorService {
	
	/** 권한 목록 */
	List<Map<String, Object>> selectAuthor();
	
	/** 직원 검색 */
	List<Map<String, Object>> searchEmp(String keyword);
	
	/** 부서로 직원 목록 */
	List<Map<String, Object>> selectByDept(Map<String, Object> map);
	
	/** 권한 수정 */
	int updateAuthor(Map<String, Object> map);
}
