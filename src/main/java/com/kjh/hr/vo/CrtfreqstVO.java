package com.kjh.hr.vo;

public class CrtfreqstVO {
	private int crtfReqstSn;
	private String crtfSeCode;
	private String empNo;
	private String reqstdocSj;
	private String reqstDe;
	private String confmAt;
	private String confmDe;
	private int elctrnSanctnSn;
	private String crtfCn;
	private String empNm;
	private String sanctnYn;
	private String brthdy;
	private String adres1;
	private String adres2;
	private String deptNm;
	private String clsfCode;
	private String encpnDe;
	private String encpndate;
	private String requestdate;
	private String ceonm;
	
	public CrtfreqstVO() {	}

	public CrtfreqstVO(int crtfReqstSn, String crtfSeCode, String empNo, String reqstdocSj, String reqstDe,
			String confmAt, String confmDe, String crtfCn, String sanctnYn) {
		super();
		this.crtfReqstSn = crtfReqstSn;
		this.crtfSeCode = crtfSeCode;
		this.empNo = empNo;
		this.reqstdocSj = reqstdocSj;
		this.reqstDe = reqstDe;
		this.confmAt = confmAt;
		this.confmDe = confmDe;
		this.crtfCn = crtfCn;
		this.sanctnYn = sanctnYn;
	}

	public int getCrtfReqstSn() {
		return crtfReqstSn;
	}

	public void setCrtfReqstSn(int crtfReqstSn) {
		this.crtfReqstSn = crtfReqstSn;
	}

	public String getCrtfSeCode() {
		return crtfSeCode;
	}

	public void setCrtfSeCode(String crtfSeCode) {
		this.crtfSeCode = crtfSeCode;
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

	public String getReqstDe() {
		return reqstDe;
	}

	public void setReqstDe(String reqstDe) {
		this.reqstDe = reqstDe;
	}

	public String getConfmAt() {
		return confmAt;
	}

	public void setConfmAt(String confmAt) {
		this.confmAt = confmAt;
	}

	public String getConfmDe() {
		return confmDe;
	}

	public void setConfmDe(String confmDe) {
		this.confmDe = confmDe;
	}

	public int getElctrnSanctnSn() {
		return elctrnSanctnSn;
	}

	public void setElctrnSanctnSn(int elctrnSanctnSn) {
		this.elctrnSanctnSn = elctrnSanctnSn;
	}
	
	public String getCrtfCn() {
		return crtfCn;
	}

	public void setCrtfCn(String crtfCn) {
		this.crtfCn = crtfCn;
	}
	
	public String getEmpNm() {
		return empNm;
	}

	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}

	public String getSanctnYn() {
		return sanctnYn;
	}

	public void setSanctnYn(String sanctnYn) {
		this.sanctnYn = sanctnYn;
	}

	public String getBrthdy() {
		return brthdy;
	}

	public void setBrthdy(String brthdy) {
		this.brthdy = brthdy;
	}

	public String getAdres1() {
		return adres1;
	}

	public void setAdres1(String adres1) {
		this.adres1 = adres1;
	}

	public String getAdres2() {
		return adres2;
	}

	public void setAdres2(String adres2) {
		this.adres2 = adres2;
	}

	public String getDeptNm() {
		return deptNm;
	}

	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}

	public String getClsfCode() {
		return clsfCode;
	}

	public void setClsfCode(String clsfCode) {
		this.clsfCode = clsfCode;
	}

	public String getEncpnDe() {
		return encpnDe;
	}

	public void setEncpnDe(String encpnDe) {
		this.encpnDe = encpnDe;
	}

	public String getEncpndate() {
		return encpndate;
	}

	public void setEncpndate(String encpndate) {
		this.encpndate = encpndate;
	}

	public String getRequestdate() {
		return requestdate;
	}

	public void setRequestdate(String requestdate) {
		this.requestdate = requestdate;
	}
	
	public String getCeonm() {
		return ceonm;
	}

	public void setCeonm(String ceonm) {
		this.ceonm = ceonm;
	}

	@Override
	public String toString() {
		return "CrtfreqstVO [crtfReqstSn=" + crtfReqstSn + ", crtfSeCode=" + crtfSeCode + ", empNo=" + empNo
				+ ", reqstdocSj=" + reqstdocSj + ", reqstDe=" + reqstDe + ", confmAt=" + confmAt + ", confmDe="
				+ confmDe + ", elctrnSanctnSn=" + elctrnSanctnSn + ", crtfCn=" + crtfCn + ", empNm=" + empNm
				+ ", sanctnYn=" + sanctnYn + ", brthdy=" + brthdy + ", adres1=" + adres1 + ", adres2=" + adres2
				+ ", deptNm=" + deptNm + ", clsfCode=" + clsfCode + ", encpnDe=" + encpnDe + "encpndate=" + encpndate + "requestdate=" + requestdate + "ceonm=" + ceonm + "]";
	}
	
}
