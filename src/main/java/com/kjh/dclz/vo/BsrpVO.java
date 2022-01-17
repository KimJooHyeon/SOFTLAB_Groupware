package com.kjh.dclz.vo;

import com.kjh.hr.vo.EmpVO;

public class BsrpVO {
	private int bsrpSn; // 출장일련번호
	private String empNo; // 직원번호
	private String reqstdocSj; //신청서제목
	private String bgnDe; // 시작일자
	private String endDe; // 종료일자
	private String bsrpPrvonsh; //출장사유
	private String bsrpPlace; // 출장장소
	private String reqstDe; // 신청일자
	private int elctrnSanctnSn; // 전자결재일련번호
	private String bsrpCn; // 출장내용
	private String sanctnYn; // 전자결재신청여부  
	
	private EmpVO empVO;

	public int getBsrpSn() {
		return bsrpSn;
	}

	public void setBsrpSn(int bsrpSn) {
		this.bsrpSn = bsrpSn;
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

	public String getBsrpPrvonsh() {
		return bsrpPrvonsh;
	}

	public void setBsrpPrvonsh(String bsrpPrvonsh) {
		this.bsrpPrvonsh = bsrpPrvonsh;
	}

	public String getBsrpPlace() {
		return bsrpPlace;
	}

	public void setBsrpPlace(String bsrpPlace) {
		this.bsrpPlace = bsrpPlace;
	}

	public String getReqstDe() {
		return reqstDe;
	}

	public void setReqstDe(String reqstDe) {
		this.reqstDe = reqstDe;
	}

	public int getElctrnSanctnSn() {
		return elctrnSanctnSn;
	}

	public void setElctrnSanctnSn(int elctrnSanctnSn) {
		this.elctrnSanctnSn = elctrnSanctnSn;
	}

	public String getBsrpCn() {
		return bsrpCn;
	}

	public void setBsrpCn(String bsrpCn) {
		this.bsrpCn = bsrpCn;
	}

	public String getSanctnYn() {
		return sanctnYn;
	}

	public void setSanctnYn(String sanctnYn) {
		this.sanctnYn = sanctnYn;
	}

	public EmpVO getEmpVO() {
		return empVO;
	}

	public void setEmpVO(EmpVO empVO) {
		this.empVO = empVO;
	}

	@Override
	public String toString() {
		return "BsrpVO [bsrpSn=" + bsrpSn + ", empNo=" + empNo + ", reqstdocSj=" + reqstdocSj + ", bgnDe=" + bgnDe
				+ ", endDe=" + endDe + ", bsrpPrvonsh=" + bsrpPrvonsh + ", bsrpPlace=" + bsrpPlace + ", reqstDe="
				+ reqstDe + ", elctrnSanctnSn=" + elctrnSanctnSn + ", bsrpCn=" + bsrpCn + ", sanctnYn=" + sanctnYn
				+ ", empVO=" + empVO + "]";
	}
	

}
