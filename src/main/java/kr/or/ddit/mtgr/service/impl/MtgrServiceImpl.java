package kr.or.ddit.mtgr.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mtgr.mapper.MtgrMapper;
import kr.or.ddit.mtgr.service.MtgrService;
import kr.or.ddit.mtgr.vo.MtgrResveVO;
import kr.or.ddit.mtgr.vo.MtgrVO;
import kr.or.ddit.mtgr.vo.ReservationCalendarVO;

@Service
public class MtgrServiceImpl implements MtgrService {
	@Autowired
	MtgrMapper mtgrMapper;

	// 회의실 목록
	@Override
	public List<Map<String, Object>> mtgrList(Map<String, Object> map) {
		return this.mtgrMapper.mtgrList(map);
	}
	
	// 회의실 수
	@Override
	public int mtgrListCount() {
		return this.mtgrMapper.mtgrListCount();
	}
	
	// 회의실 등록
	@Override
	public int insertMtgr(MtgrVO mtgrVo) {
		return this.mtgrMapper.insertMtgr(mtgrVo);
	}
	
	// 회의실 중복 여부
	@Override
	public int selectMtgr(MtgrVO mtgrVo) {
		return this.mtgrMapper.selectMtgr(mtgrVo);
	}
	
	// 회의실 삭제
	@Override
	public int deleteMtgr(int mtgrUnit) {
		return this.mtgrMapper.deleteMtgr(mtgrUnit);
	}
	
	// 회의실 예약 여부
	@Override
	public int selectMtgrResve(MtgrResveVO mtgrResveVO) {
		return this.mtgrMapper.selectMtgrResve(mtgrResveVO);
	}
		
	// 예약현황 조회
	@Override
	public List<ReservationCalendarVO> selectReservationSchdul() {
		return this.mtgrMapper.selectReservationSchdul();
	}
	
	// 회의실 목록 조회(예약현황)
	@Override
	public List<MtgrVO> mtgrUnitList() {
		return this.mtgrMapper.mtgrUnitList();
	}

	// 회의실 예약 일정등록
	@Override
	public int insertMtgrResev(MtgrResveVO mtgrResveVO) {
		return this.mtgrMapper.insertMtgrResev(mtgrResveVO);
	}

	// 회의실 예약 수정
	@Override
	public int updateMtgrResev(MtgrResveVO mtgrResveVO) {
		return this.mtgrMapper.updateMtgrResev(mtgrResveVO);
	}
	
	// 회의실 예약 취소
	@Override
	public int deleteMtgrResev(int resveSn) {
		return this.mtgrMapper.deleteMtgrResev(resveSn);
	}
	
	// 회의실 예약 취소 내역 조회
	@Override
	public List<Map<String, Object>> mtgrResevCancelList() {
		return this.mtgrMapper.mtgrResevCancelList();
	}
	
	// 예약 취소시 작성자인지 확인
	@Override
	public int selectWriter(MtgrResveVO mtgrResveVO) {
		return this.mtgrMapper.selectWriter(mtgrResveVO);
	}
	
	// 예약일정 중복인지 확인
	@Override
	public int selectResev(MtgrResveVO mtgrResveVO) {
		return this.mtgrMapper.selectResev(mtgrResveVO);
	}
	
}
