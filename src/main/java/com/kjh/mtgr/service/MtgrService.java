package com.kjh.mtgr.service;

import java.util.List;
import java.util.Map;

import com.kjh.mtgr.vo.MtgrResveVO;
import com.kjh.mtgr.vo.MtgrVO;
import com.kjh.mtgr.vo.ReservationCalendarVO;

public interface MtgrService {
	// 회의실 목록
	List<Map<String, Object>> mtgrList(Map<String, Object> map);
	
	// 회의실 수
	int mtgrListCount();
	
	// 회의실 등록
	public int insertMtgr(MtgrVO mtgrVo);
	
	// 회의실 등록 여부
	public int selectMtgr(MtgrVO mtgrVo);
		
	// 회의실 삭제
	public int deleteMtgr(int mtgrUnit);
	
	// 회의실 예약 여부
	public int selectMtgrResve(MtgrResveVO mtgrResveVO);
	
	// 예약현황 조회
	public List<ReservationCalendarVO> selectReservationSchdul();
	
	// 회의실 목록 조회(에약현황)
	public List<MtgrVO> mtgrUnitList();
	
	// 회의실 예약 일정등록
	public int insertMtgrResev(MtgrResveVO mtgrResveVO);
	
	// 회의실 예약 수정
	public int updateMtgrResev(MtgrResveVO mtgrResveVO);
	
	// 회의실 예약 취소
	public int deleteMtgrResev(int resveSn);
	
	// 회의실 예약 취소 내역 조회
	public List<Map<String, Object>> mtgrResevCancelList();
	
	// 예약 취소시 작성자인지 확인
	public int selectWriter(MtgrResveVO mtgrResveVO);
	
	// 예약일정 중복인지 확인
	public int selectResev(MtgrResveVO mtgrResveVO);
}
