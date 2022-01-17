package kr.or.ddit.bbs.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.bbs.mapper.AnswerMapper;
import kr.or.ddit.bbs.mapper.BbsMapper;
import kr.or.ddit.bbs.service.AnswerService;
import kr.or.ddit.bbs.vo.AnswerVO;

@Service
public class AnswerServiceImpl implements AnswerService {
	@Autowired
	AnswerMapper mapper;
	
	//  해당 글의 댓글 리스트
	@Override
	public List<Map<String, Object>> selectAnswer(String bbscttSn) {
		// TODO Auto-generated method stub
		return this.mapper.selectAnswer(bbscttSn);
	}
	
	// 댓글 삭제
	@Override
	public int deleteAnswer(int answerSn) {
		// TODO Auto-generated method stub
		return this.mapper.deleteAnswer(answerSn);
	}
	
	// 댓글 추가
	@Override
	public int insertAnswer(AnswerVO answer) {
		// TODO Auto-generated method stub
		return this.mapper.insertAnswer(answer);
	}
	
	// 댓글 수정
	@Override
	public int updateAnswer(AnswerVO answer) {
		// TODO Auto-generated method stub
		return this.mapper.updateAnswer(answer);
	}
	

}
