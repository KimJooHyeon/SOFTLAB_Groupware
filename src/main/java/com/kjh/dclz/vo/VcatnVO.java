package com.kjh.dclz.vo;

public class VcatnVO {
	
	private int vcatnSn; //휴가일련번호
	private String empNo; //직원번호 
	private String reqstdocSj; //신청서제목
	private String bgnDe; //시작일자
	private String endDe; //종료일자
	private String vcatnPrvonsh; //휴가사유
	private String vcatnSeCode; //휴가구분코드
	private String reqstDe; //신청일자
	private int fileSn; //파일일련번호
	private int elctrnSanctnSn; //전자결재일련번호
	private int vcatnReqstDaycnt; //휴가신청일수
	private String sanctnYn; // 전자결재 신청여부 
	
	public String getSanctnYn() {
		return sanctnYn;
	}
	public void setSanctnYn(String sanctnYn) {
		this.sanctnYn = sanctnYn;
	}
	public int getVcatnSn() {
		return vcatnSn;
	}
	public void setVcatnSn(int vcatnSn) {
		this.vcatnSn = vcatnSn;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getReqstdocSj() {
		return reqstdocSj;
	}
	public void setReqstdocSj(String reqstdocSj) {
		this.reqstdocSj = reqstdocSj;
	}
	public String getBgnDe() {
		return bgnDe;
	}
	public void setBgnDe(String bgnDe) {
		this.bgnDe = bgnDe;
	}
	public String getEndDe() {
		return endDe;
	}
	public void setEndDe(String endDe) {
		this.endDe = endDe;
	}
	public String getVcatnPrvonsh() {
		return vcatnPrvonsh;
	}
	public void setVcatnPrvonsh(String vcatnPrvonsh) {
		this.vcatnPrvonsh = vcatnPrvonsh;
	}
	public String getVcatnSeCode() {
		return vcatnSeCode;
	}
	public void setVcatnSeCode(String vcatnSeCode) {
		this.vcatnSeCode = vcatnSeCode;
	}
	public String getReqstDe() {
		return reqstDe;
	}
	public void setReqstDe(String reqstDe) {
		this.reqstDe = reqstDe;
	}
	
	public int getFileSn() {
		return fileSn;
	}
	public void setFileSn(int fileSn) {
		this.fileSn = fileSn;
	}
	public int getElctrnSanctnSn() {
		return elctrnSanctnSn;
	}
	public void setElctrnSanctnSn(int elctrnSanctnSn) {
		this.elctrnSanctnSn = elctrnSanctnSn;
	}
	public int getVcatnReqstDaycnt() {
		return vcatnReqstDaycnt;
	}
	public void setVcatnReqstDaycnt(int vcatnReqstDaycnt) {
		this.vcatnReqstDaycnt = vcatnReqstDaycnt;
	}
	@Override
	public String toString() {
		return "VcatnVO [vcatnSn=" + vcatnSn + ", empNo=" + empNo + ", reqstdocSj=" + reqstdocSj + ", bgnDe=" + bgnDe
				+ ", endDe=" + endDe + ", vcatnPrvonsh=" + vcatnPrvonsh + ", vcatnSeCode=" + vcatnSeCode + ", reqstDe="
				+ reqstDe + ", fileSn=" + fileSn + ", elctrnSanctnSn=" + elctrnSanctnSn + ", vcatnReqstDaycnt="
				+ vcatnReqstDaycnt + ", sanctYn=" + sanctnYn + "]";
	}

	
	

}
