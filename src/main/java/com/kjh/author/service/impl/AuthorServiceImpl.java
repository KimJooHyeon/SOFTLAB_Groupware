package com.kjh.author.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kjh.author.mapper.AuthorMapper;
import com.kjh.author.service.AuthorService;
import com.kjh.author.vo.AuthorEmpVO;

@Service
public class AuthorServiceImpl implements AuthorService {
	
	@Autowired
	AuthorMapper mapper;

	/** 권한 목록 */
	@Override
	public List<Map<String, Object>> selectAuthor() {
		return this.mapper.selectAuthor();
	}

	/** 직원 검색 */
	@Override
	public List<Map<String, Object>> searchEmp(String keyword) {
		return this.mapper.searchEmp(keyword);
	}

	/** 부서로 직원 목록 */
	@Override
	public List<Map<String, Object>> selectByDept(Map<String, Object> map) {
		return this.mapper.selectByDept(map);
	}

	/** 권한 수정 */
	@Override
	public int updateAuthor(Map<String, Object> map) {
		return this.mapper.updateAuthor(map);
	}
	
}
