package com.kjh.schdul.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kjh.schdul.mapper.SchdulMapper;
import com.kjh.schdul.service.SchdulService;
import com.kjh.schdul.vo.CalendarVO;
import com.kjh.schdul.vo.SchdulVO;

@Service
public class SchdulServiceImpl implements SchdulService {
	@Autowired
	SchdulMapper schdulMapper;
	
	//calendar 목록 가져오기
	@Override
	public List<CalendarVO> selectSchdul(String empNo) {
		return this.schdulMapper.selectSchdul(empNo);
	}
	
	// 개인 일정만 보기
	@Override
	public List<CalendarVO> selectPrivate(String empNo) {
		// TODO Auto-generated method stub
		return this.schdulMapper.selectPrivate(empNo);
	}
	
	// 부서 일정만 보기
	@Override
	public List<CalendarVO> selectDepartment(String empNo) {
		// TODO Auto-generated method stub
		return this.schdulMapper.selectDepartment(empNo);
	}
	
	// 회사 전체 일정만 보기
	@Override
	public List<CalendarVO> selectSoftLab() {
		// TODO Auto-generated method stub
		return this.schdulMapper.selectSoftLab();
	}

	@Override
	public int insertSchdul(SchdulVO schdul) {
		// TODO Auto-generated method stub
		return this.schdulMapper.insertSchdul(schdul);
	}

	@Override
	public int updateSchdul(SchdulVO schdul) {
		// TODO Auto-generated method stub
		return this.schdulMapper.updateSchdul(schdul);
	}

	@Override
	public int deleteSchdul(int schdulSn) {
		// TODO Auto-generated method stub
		return this.schdulMapper.deleteSchdul(schdulSn);
	}

	@Override
	public int selectWriter(SchdulVO schdul) {
		// TODO Auto-generated method stub
		return this.schdulMapper.selectWriter(schdul);
	}

	@Override
	public int schdulSnCheck(int schdulSn) {
		// TODO Auto-generated method stub
		return this.schdulMapper.schdulSnCheck(schdulSn);
	}

}
