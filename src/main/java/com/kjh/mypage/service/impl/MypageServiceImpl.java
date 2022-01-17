package com.kjh.mypage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kjh.hr.vo.EmpVO;
import com.kjh.mypage.mapper.MypageMapper;
import com.kjh.mypage.service.MypageService;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageMapper mapper;

	/** 직급 가져오기 */
	@Override
	public String selectClsf(String clsfCode) {
		return this.mapper.selectClsf(clsfCode);
	}

	/** 비밀번호 수정 */
	@Override
	public boolean updatePassword(EmpVO empVO) {
		return this.mapper.updatePassword(empVO);
	}

	/** 휴대폰번호 수정 */
	@Override
	public boolean updatePhoneNum(EmpVO empVO) {
		return this.mapper.updatePhoneNum(empVO);
	}
 
	/** 직원  휴대폰번호정보 */
	@Override
	public int phoneCheck(String phonenum) {
		return this.mapper.phoneCheck(phonenum);
	}
	
	
}
