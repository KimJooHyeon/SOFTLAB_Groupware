package kr.or.ddit.bbs.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.bbs.mapper.BbsMapper;
import kr.or.ddit.bbs.service.BbsService;
import kr.or.ddit.bbs.vo.BbsVO;

@Service
public class BbsServiceImpl implements BbsService {
	@Autowired
	BbsMapper mapper;
	
	// 공지사항 다 보기
	@Override
	public List<Map<String, Object>> noticeAll(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.mapper.noticeAll(map);
	}
	// 공지사항 전체 글 수
	public int noticeCount() {
		return this.mapper.noticeCount();
	};
	
	/** 공지사항 검색 시작~!~!~!~!~!~! **/
	// 제목 + 내용
	public List<Map<String, Object>> searchBySjAndCn(Map<String, String> searchMap){
		return this.mapper.searchBySjAndCn(searchMap);
	};
	// 제목 + 내용 검색 결과 리스트 수
	public int searchBySjAndCnCount(Map<String, String> map) {
		return this.mapper.searchBySjAndCnCount(map);
	};
	// 제목
	public List<Map<String, Object>> searchBySj(Map<String, String> searchMap){
		return this.mapper.searchBySj(searchMap);
	};
	// 제목 검색 결과 리스트 수
	public int searchBySjCount(Map<String, String> map) {
		return this.mapper.searchBySjCount(map);
	};
	// 내용
	public List<Map<String, Object>> searchByCn(Map<String, String> searchMap){
		return this.mapper.searchByCn(searchMap);
	};
	// 내용 검색 결과 리스트 수
	public int searchByCnCount(Map<String, String> map) {
		return this.mapper.searchByCnCount(map);
	};
	// 작성자
	public List<Map<String, Object>> searchByEmp(Map<String, String> searchMap){
		return this.mapper.searchByEmp(searchMap);
	};
	// 작성자 검색 결과 리스트 수
	public int searchByEmpCount(Map<String, String> map) {
		return this.mapper.searchByEmpCount(map);
	};
	/** 공지사항 검색 끝~!~!~!~!~!~! **/
	
	// 게시판 글 보기
	@Override
	public Map<String, Object> bbsView(String bbscttSn) {
		// TODO Auto-generated method stub
		return this.mapper.bbsView(bbscttSn);
	}
	// 조회수 올리기
	@Override
	public int readCount(String bbscttSn) {
		return this.mapper.readCount(bbscttSn);
	};
	// 게시글 파일 리스트 받기
	public List<Map<String, Object>> bbsFiles(String bbscttSn){
		return this.mapper.bbsFiles(bbscttSn);
	}
	// 게시글 파일 개수 받기
	public int fileCount(String bbscttSn) {
		return this.mapper.fileCount(bbscttSn);
	};
	

	
	// 게시판 글 등록
	@Override
	public int bbsAdd(BbsVO bbs) {
		// TODO Auto-generated method stub
		return this.mapper.bbsAdd(bbs);
	}
	// 등록한 게시글 바로 보기
	@Override
	public int selectThis(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.mapper.selectThis(map);
	}
	
	// 게시글 수정
	public int updateBbs(BbsVO bbs) {
		return this.mapper.updateBbs(bbs);
	};
	
	
	// 게시글 삭제 
	public int deleteBbs(String bbscttSn) {
		return this.mapper.deleteBbs(bbscttSn);
	};
	// 게시글에 포함 된 이미지 삭제 
	public int deleteFileByBbscttSn(String bbscttSn) {
		return this.mapper.deleteFileByBbscttSn(bbscttSn);
	};
	// 게시판 수정할 때 파일 없앨 때 
	public int deleteFileByFileSn(int fileSn) {
		return this.mapper.deleteFileByFileSn(fileSn);
	};
	// 특정 파일 삭제
	public int deleteFileByFileSnRealFileNm(Map<String, Object> map) {
		return this.mapper.deleteFileByFileSnRealFileNm(map);
	};
	
	
	// 자료실 다 보기
	@Override
	public List<Map<String, Object>> libraryAll(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.mapper.libraryAll(map);
	}
	// 자료실 게시글 개수
	public int libraryCount() {
		return this.mapper.libraryCount();
	};
	
	
	
	
	
	
	
//-------------------------------------------------------------------------------------------------	
	
	/** 파일 시작 **/
	
	// 첨부파일 sn 생성
	@Override
	public int fileSnSelect() {
		// TODO Auto-generated method stub
		return this.mapper.fileSnSelect();
	}
	// 첨부파일 insert
	@Override
	public int fileAdd(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.mapper.fileAdd(map);
	}
	// 이미지 파일 리스트 조회 select
	@Override
	public List<Map<String, Object>> imgFileList(int fileSn){
		return this.mapper.imgFileList(fileSn);
	};
	// 이미지 외의 파일 리스트 조회 select
	@Override
	public List<Map<String, Object>> etcFileList(int fileSn){
		return this.mapper.etcFileList(fileSn);
	};
	/** 파일 끝 **/

}
