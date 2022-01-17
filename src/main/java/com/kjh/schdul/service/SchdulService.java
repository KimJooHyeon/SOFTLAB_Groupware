package com.kjh.schdul.service;

import java.util.List;

import com.kjh.schdul.vo.CalendarVO;
import com.kjh.schdul.vo.SchdulVO;

public interface SchdulService {
	// calendar 목록 가져오기
	public List<CalendarVO> selectSchdul(String empNo);
	// 개인 일정만 보기
	public List<CalendarVO> selectPrivate(String empNo);
	// 부서 일정만 보기
	public List<CalendarVO> selectDepartment(String empNo);
	// 회사 전체 일정만 보기
	public List<CalendarVO> selectSoftLab();
	
	// 일정 추가
	public int insertSchdul(SchdulVO schdul);
	// 일정 수정
	public int updateSchdul(SchdulVO schdul);
	// 일정 삭제
	public int deleteSchdul(int schdulSn);
	// 작성자 찾기
	public int selectWriter(SchdulVO schdul);
	
	// 일정 번호 존재 여부 체크하기
	public int schdulSnCheck(int schdulSn);
	
}
