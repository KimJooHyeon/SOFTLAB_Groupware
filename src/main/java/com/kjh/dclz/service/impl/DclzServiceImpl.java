package com.kjh.dclz.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kjh.dclz.controller.DclzController;
import com.kjh.dclz.mapper.DclzMapper;
import com.kjh.dclz.service.DclzService;
import com.kjh.dclz.vo.BsrpVO;
import com.kjh.dclz.vo.DclzVO;
import com.kjh.dclz.vo.RestdeVO;
import com.kjh.dclz.vo.VcatnVO;
import com.kjh.dclz.vo.YrycVO;

@Service
public class DclzServiceImpl implements DclzService {

	@Autowired
	private DclzMapper dclzMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(DclzServiceImpl.class);
	
	// 나의 근태 등록 (출근등록) 
	@Override
	public int commuteInsert(Map<String, Object> map) {
		return this.dclzMapper.commuteInsert(map);
	}
	
	// 나의 근태 등록 (퇴근)
	@Override
	public int getoff(Map<String, Object> map) {
		return this.dclzMapper.getoff(map);
	}
	
	// 나의 근태현황 목록조회 (일자별)
	@Override 
	public List<Map<String, Object>> selectDclzList(Map<String, Object> map){
		return this.dclzMapper.selectDclzList(map);
	}

	// 나의 근태현황 목록 개수 조회 
	@Override
	public int dclzListCount(Map<String, Object> map) {
		return this.dclzMapper.dclzListCount(map);
	}
	
	// 나의 근태현황 목록조회 (주차별) 
	@Override
	public List<Map<String, Object>> weekSelectDclz(Map<String,Object> map) {
		
		List<Map<String, Object>> weekSelect = this.dclzMapper.weekSelectDclz(map);
		
		/** 52시간 준수여부 판별 */
		for(Map<String,Object> vmap : weekSelect) {
			String validate ="준수";
			if(vmap.get("TIMETOTAL") != null){
				
				if(Integer.parseInt((vmap.get("TIMETOTAL")).toString())>52) {
					validate="초과";
					vmap.put("VALIDATE", validate);
				}else {
					vmap.put("VALIDATE", validate);
				}
			}
		}
		return weekSelect;
	}
	
	// 나의 근태현황 기간으로 검색 
	@Override
	public List<Map<String, Object>> searchDclzList(Map<String, Object> map){
		return this.dclzMapper.searchDclzList(map);
	}
	
	// 나의 근태현황 기간으로 검색 결과 수
	@Override
	public int searchDclzListCount(String empNo) {
		return this.dclzMapper.searchDclzListCount(empNo);
	}

	// 휴일 목록 조회 
	@Override
	public List<Map<String, Object>> restDeList(Map<String, Object> map){
		return this.dclzMapper.restDeList(map);
	}
	
	// 휴일 등록s
	@Override
	public int restDeInsert(RestdeVO restdeVO) {
		return this.dclzMapper.restDeInsert(restdeVO);
	}
	
	// 휴일 삭제
	@Override
	public int restDeDelete(String restdeSn) {
		return this.dclzMapper.restDeDelete(restdeSn);
	};
	
	// 출장 임시저장
	@Override
	public int bsrpInsert(Map<String, Object> map) {
		return this.dclzMapper.bsrpInsert(map);
	}
	
	// 출장 임시저장 목록조회
	@Override
	public List<Map<String, Object>> bsrpList(Map<String, Object> map){
		return this.dclzMapper.bsrpList(map);
	}
	
	// 출장임시저장 목록 개수 조회
	@Override
	public int bsrpListCount(String empNo) {
		return this.dclzMapper.bsrpListCount(empNo);
	}
	
	// 출장 임시저장 삭제 
	@Override
	public int bsrpDelete(String bsrpSn) {
		return this.dclzMapper.bsrpDelete(bsrpSn);
	}
	
	// 출장 임시저장 상세조회
	@Override
	public BsrpVO bsrpDetail(String bsrpSn) {
		return this.dclzMapper.bsrpDetail(bsrpSn);
	}
	
	// 출장 임시저장 수정 
	@Override
	public int bsrpUpdate(Map<String, Object> map) {
		return this.dclzMapper.bsrpUpdate(map);
	}
	
	// 출장 임시저장함 검색 
	@Override
	public List<Map<String, Object>> searchBsrpPage(Map<String, Object> map){
		return this.dclzMapper.searchBsrpPage(map);
	}
	
	// 출장 임시저장함 검색 개수 조회 
	@Override
	public int searchBsrpCount(Map<String, Object> map) {
		return this.dclzMapper.searchBsrpCount(map);
	}
	
	// 휴가 신청폼 휴가 조회 
	@Override
	public YrycVO yrycSelect(Map<String, Object> map) {
		return this.dclzMapper.yrycSelect(map);
	}
	
	// 휴가 신청 임시저장 
	@Override
	public int vcatnInsert(Map<String, Object> map) {
		return this.dclzMapper.vcatnInsert(map);
	}
	
	// 휴가 임시저장 목록조회 
	@Override
	public List<Map<String, Object>> vcatnList(Map<String, Object> map){
		return this.dclzMapper.vcatnList(map);
	}
	
	// 휴가 임시저장함 자료 수 
	@Override
	public int vcatnListCount(String empNo) {
		return this.dclzMapper.vcatnListCount(empNo);
	}
	
	// 휴가 임시저장 삭제 
	@Override
	public int vcatnDelete(String vcatnSn) {
		return this.dclzMapper.vcatnDelete(vcatnSn);
	}
	
	// 휴가 임시저장 검색 
	@Override
	public List<Map<String, Object>> searchVcatnPage(Map<String, Object> map){
		return this.dclzMapper.searchVcatnPage(map);
	}
	
	// 휴가 임시저장함 검색 개수 조회
	@Override
	public int searchVcatnCn(Map<String, Object> map) {
		return this.dclzMapper.searchVcatnCn(map);
	}
	
	// 휴가 상세조회 
	@Override
	public VcatnVO vcatnDetail(String vcatnSn) {
		return this.dclzMapper.vcatnDetail(vcatnSn);
	}
	
	// 휴가 임시저장 수정 
	@Override
	public int vcatnUpdate(Map<String, Object> map) {
		return this.dclzMapper.vcatnUpdate(map);
	}
	
	// 관리자 휴가관리 전체 목록 조회 
	@Override
	public List<Map<String, Object>> vcatnadmin(Map<String, Object> map){
		return this.dclzMapper.vcatnadmin(map);
	}
	
	// 관리자 근태관리 전체 목록 조회 
	@Override
	public List<Map<String, Object>> dclzadminSelect(Map<String, Object> map){
		return this.dclzMapper.dclzadminSelect(map);
	}
	
	// 관리자 휴가관리 전체 목록 조회 결과 수 
	@Override
	public int vcatnaminCount(String year) {
	return this.dclzMapper.vcatnaminCount(year);
	};
	
	// 관리자 휴가관리 전체 목록 검색 
	@Override
	public List<Map<String, Object>> vcatnadminSearch(Map<String, Object> map){
		return this.dclzMapper.vcatnadminSearch(map);
	}
	
	// 휴가관리 관리자 전체목록 검색 결과수 
	@Override
    public int searchVcatnCount(Map<String, Object> map) {
    	return this.dclzMapper.searchVcatnCount(map);
    }
	
	// 관리자 휴가관리 부서별 목록 조회 
	@Override
    public List<Map<String, Object>> vcatnSelectByDept(Map<String, Object> map){
		return this.dclzMapper.vcatnSelectByDept(map);
    	
    }
	
	// 관리자 근태관리 부서별 목록 조회 
	@Override
	public List<Map<String, Object>> dclzSelectByDept(Map<String, Object> map){
		return this.dclzMapper.dclzSelectByDept(map);
		
	}
	
	// 관리자 휴가관리 부서별 목록조회 결과수 
	@Override
    public int vcatnSelectByDeptCount(Map<String, Object> map){
    	return this.dclzMapper.vcatnSelectByDeptCount(map);
    }
	
	// 관리자 근태관리 부서별 목록조회 결과수 
	@Override
	public int dclzSelectByDeptCount(Map<String, Object> map){
		return this.dclzMapper.dclzSelectByDeptCount(map);
	}
	
	// 관리자 휴가관리 전체 목록 조회 
	@Override
    public List<Map<String, Object>> vcatnSelectByAll(){
    	return this.dclzMapper.vcatnSelectByAll();
    }
	
	// 관리자 휴가관리 연차 일괄등록 
	@Override
	public int insertVcatnAdmin(Map<String, Object> map) {
		return this.dclzMapper.insertVcatnAdmin(map);
	}

	 // 재직자 전체목록 조회 
	@Override
    public List<Map<String, Object>>selectAllemp(){
    	return this.dclzMapper.selectAllemp();
    }
    
    // 재직자 전체목록 조회 결과 수 
	@Override
    public int selectAllempCount() {
    	return this.dclzMapper.selectAllempCount();
    }
	
	// 직원별 근무형태 코드 조회 
	@Override
	public List<Map<String, Object>> selectWorkStle(Map<String, Object> map) {
		return this.dclzMapper.selectWorkStle(map);
	}

	// 출근 기록 수 조회 
	@Override
	public int commitCount(Map<String, Object> map) {
		return this.dclzMapper.commitCount(map);
	}

	// 출근 기록 조회 
	@Override
	public List<Map<String, Object>> commitYn(Map<String, Object> map) {
		return this.dclzMapper.commitYn(map);
	}
	
	//전자결재 양식 코드번호 조회
	@Override
	public String searchSanctnSn(int elctrnSanctnSn) {
		return this.dclzMapper.searchSanctnSn(elctrnSanctnSn);
	}

	// 전자결재 상신 후 휴가 테이블 update
	@Override
	public int updateVcatn(Map<String, Object> map) {
		return this.dclzMapper.updateVcatn(map);
	}
	
	// 전자결재 상신 후 출장 테이블 update
	@Override
	public int updateBsrp(Map<String, Object> map) {
		return this.dclzMapper.updateBsrp(map);
	}

	// 사용 휴가 일수와 휴가 구분 코드 조회
	@Override
	public Map<String, Object> vcatnDaynCode(int elctrnSanctnSn) {
		return this.dclzMapper.vcatnDaynCode(elctrnSanctnSn);
	}

	// 연차 테이블 업데이트 
	@Override
	public int yrycUpdate(Map<String, Object> map) {
		return this.dclzMapper.yrycUpdate(map);
	}
	
   // 휴일 목록 조회 (주현)
   @Override
   public String restDeList2(String restdeDe) {
      return this.dclzMapper.restDeList2(restdeDe);
   }

   // 전자결재 상태조회 
	@Override
	public Map<String, Object> elctrnSanState(int elctrnSanctnSn) {
		return this.dclzMapper.elctrnSanState(elctrnSanctnSn);
	}

	@Override
	public int restDeCount(Map<String, Object> map) {
		return this.dclzMapper.restDeCount(map);
	}

	@Override
	public List<Map<String, Object>> daySearch(Map<String, Object> map) {
		return this.dclzMapper.daySearch(map);
	}

	@Override
	public int afterSanction(Map<String, Object> map) {
		return this.dclzMapper.afterSanction(map);
	}

	@Override
	public int afterSanctionInsert(Map<String, Object> map) {
		return this.dclzMapper.afterSanctionInsert(map);
	}

	@Override
	public Map<String, Object> bsrpDaynCode(int elctrnSanctnSn) {
		return this.dclzMapper.bsrpDaynCode(elctrnSanctnSn);
	}
	
 
}
