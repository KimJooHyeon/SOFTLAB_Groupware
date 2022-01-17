package kr.or.ddit.bbs.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.bbs.vo.BbsVO;

public interface BbsService {
	// 공지사항 다 보기
	public List<Map<String, Object>> noticeAll(Map<String, Object> map);
	// 공지사항 전체 글 수
	public int noticeCount();
	/** 공지사항 검색 시작~!~!~!~!~!~! **/
	// 제목 + 내용
	public List<Map<String, Object>> searchBySjAndCn(Map<String, String> searchMap);
	// 제목 + 내용 검색 결과 리스트 수
	public int searchBySjAndCnCount(Map<String, String> map);
	// 제목
	public List<Map<String, Object>> searchBySj(Map<String, String> searchMap);
	// 제목 검색 결과 리스트 수
	public int searchBySjCount(Map<String, String> map);
	// 내용
	public List<Map<String, Object>> searchByCn(Map<String, String> searchMap);
	// 내용 검색 결과 리스트 수
	public int searchByCnCount(Map<String, String> map);
	// 작성자
	public List<Map<String, Object>> searchByEmp(Map<String, String> searchMap);
	// 작성자 검색 결과 리스트 수
	public int searchByEmpCount(Map<String, String> map);
	/** 공지사항 검색 끝~!~!~!~!~!~! **/
	
	// 게시판 글 보기
	public Map<String, Object> bbsView(String bbscttSn);
	// 조회수 올리기
	public int readCount(String bbscttSn);
	// 게시글 파일 리스트 받기
	public List<Map<String, Object>> bbsFiles(String bbscttSn);
	// 게시글 파일 개수 받기
	public int fileCount(String bbscttSn);
	
	// 자료실 다 보기
	public List<Map<String, Object>> libraryAll(Map<String, Object> map);
	// 자료실 게시글 개수
	public int libraryCount();
	
	// 게시판 글 등록
	public int bbsAdd(BbsVO bbs);
	// 등록한 공지사항 글 번호 가져오기
	public int selectThis(Map<String, Object> map);
	
	// 게시글 수정
	public int updateBbs(BbsVO bbs);
	
	// 게시글 삭제 
	public int deleteBbs(String bbscttSn);
	// 게시글에 포함 된 이미지 삭제 
	public int deleteFileByBbscttSn(String bbscttSn);
	// 게시판 수정할 때 파일 없앨 때 
	public int deleteFileByFileSn(int fileSn);	
	// 특정 파일 삭제
	public int deleteFileByFileSnRealFileNm(Map<String, Object> map);
	
	
	/** 파일 시작 **/
	// 첨부 파일 sn 생성
	public int fileSnSelect();
	// 첨부 파일 insert
	public int fileAdd(Map<String, Object> map);
	// 이미지 파일 리스트 조회 select
	public List<Map<String, Object>> imgFileList(int fileSn);
	// 이미지 외의 파일 리스트 조회 select
	public List<Map<String, Object>> etcFileList(int fileSn);
	/** 파일 끝 **/
}
