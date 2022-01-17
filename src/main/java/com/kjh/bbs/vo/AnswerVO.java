package com.kjh.bbs.vo;

public class AnswerVO {
	private int answerSn;
	private String bbscttSn;
	private String empNo;
	private String answerCn;
	private String writngDe;
	private String updDe;
	
	public AnswerVO() {
		// TODO Auto-generated constructor stub
	}

	public AnswerVO(int answerSn, String bbscttSn, String empNo, String answerCn, String writngDe, String updDe) {
		this.answerSn = answerSn;
		this.bbscttSn = bbscttSn;
		this.empNo = empNo;
		this.answerCn = answerCn;
		this.writngDe = writngDe;
		this.updDe = updDe;
	}

	public int getAnswerSn() {
		return answerSn;
	}

	public void setAnswerSn(int answerSn) {
		this.answerSn = answerSn;
	}

	public String getBbscttSn() {
		return bbscttSn;
	}

	public void setBbscttSn(String bbscttSn) {
		this.bbscttSn = bbscttSn;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getAnswerCn() {
		return answerCn;
	}

	public void setAnswerCn(String answerCn) {
		this.answerCn = answerCn;
	}

	public String getWritngDe() {
		return writngDe;
	}

	public void setWritngDe(String writngDe) {
		this.writngDe = writngDe;
	}

	public String getUpdDe() {
		return updDe;
	}

	public void setUpdDe(String updDe) {
		this.updDe = updDe;
	}

	@Override
	public String toString() {
		return "AnswerVO [answerSn=" + answerSn + ", bbscttNo=" + bbscttSn + ", empNo=" + empNo + ", answerCn="
				+ answerCn + ", writngDe=" + writngDe + ", updDe=" + updDe + "]";
	}
	
}
