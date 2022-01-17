package com.kjh.bbs.vo;

public class BbsVO {
	private String bbscttSn;
	private String empNo;
	private String bbscttSj;
	private String bbscttCn;
	private String writngDe;
	private int bbscttRdcnt;
	private String bbsSeCode;
	private String deleteYn;
	private int fileSn;
	
	private int startIndex;
	private int cntPerPage;
	
	
	
	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public BbsVO() {
		// TODO Auto-generated constructor stub
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

	public String getBbscttSj() {
		return bbscttSj;
	}

	public void setBbscttSj(String bbscttSj) {
		this.bbscttSj = bbscttSj;
	}

	public String getBbscttCn() {
		return bbscttCn;
	}

	public void setBbscttCn(String bbscttCn) {
		this.bbscttCn = bbscttCn;
	}

	public String getWritngDe() {
		return writngDe;
	}

	public void setWritngDe(String writngDe) {
		this.writngDe = writngDe;
	}

	public int getBbscttRdcnt() {
		return bbscttRdcnt;
	}

	public void setBbscttRdcnt(int bbscttRdcnt) {
		this.bbscttRdcnt = bbscttRdcnt;
	}

	public String getBbsSeCode() {
		return bbsSeCode;
	}

	public void setBbsSeCode(String bbsSeCode) {
		this.bbsSeCode = bbsSeCode;
	}


	public String getDeleteYn() {
		return deleteYn;
	}


	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	public int getFileSn() {
		return fileSn;
	}

	public void setFileSn(int fileSn) {
		this.fileSn = fileSn;
	}

	@Override
	public String toString() {
		return "BbsVO [bbscttSn=" + bbscttSn + ", empNo=" + empNo + ", bbscttSj=" + bbscttSj + ", bbscttCn=" + bbscttCn
				+ ", writngDe=" + writngDe + ", bbscttRdcnt=" + bbscttRdcnt + ", bbsSeCode=" + bbsSeCode + ", deleteYn="
				+ deleteYn + ", fileSn=" + fileSn + "]";
	}
	
	


	
}
