package com.kjh.bbs.service;

import java.util.List;
import java.util.Map;

import com.kjh.bbs.vo.AnswerVO;

public interface AnswerService {
	// 해당 글 댓글 보기
	public List<Map<String, Object>> selectAnswer(String bbscttSn);
	// 댓글 삭제
	public int deleteAnswer(int answerSn);
	// 댓글 추가
	public int insertAnswer(AnswerVO answer);
	// 댓글 수정
	public int updateAnswer(AnswerVO answer);
}
