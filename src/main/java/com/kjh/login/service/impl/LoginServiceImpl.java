package com.kjh.login.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kjh.hr.vo.EmpVO;
import com.kjh.login.mapper.LoginMapper;
import com.kjh.login.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	LoginMapper loginMapper;

	/** 로그인 체크 */
	@Override
	public EmpVO get(EmpVO empVO) {
		return loginMapper.get(empVO);
	}

	/** 직원 휴대폰번호 정보 */
	@Override
	public int phoneCheck(String phonenum) {
		return loginMapper.phoneCheck(phonenum);
	}

	/** 임시 비밀번호로 변경 */
	@Override
	public int updatePW(EmpVO empVO) {
		return loginMapper.updatePW(empVO);
	}

	/** 직원 권한 정보 */
	@Override
	public List<Map<String, Object>> selectAuthor(String empNo) {
		return loginMapper.selectAuthor(empNo);
	}
	
}
