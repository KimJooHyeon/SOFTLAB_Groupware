package com.kjh.schdul.vo;

public class SchdulVO {
	private int schdulSn;
	private String empNo;
	private String schdulSj;
	private String schdulCn;
	private String schdulSeCode;
	private String bgnDe;
	private String endDe;
	private String deleteYn;
	private String alldayYn;
	
	public SchdulVO() {
		// TODO Auto-generated constructor stub
	}
	
	

	public SchdulVO(int schdulSn, String empNo, String schdulSj, String schdulCn, String schdulSeCode, String bgnDe, String endDe) {
		this.schdulSn = schdulSn;
		this.empNo = empNo;
		this.schdulSj = schdulSj;
		this.schdulCn = schdulCn;
		this.schdulSeCode = schdulSeCode;
		this.bgnDe = bgnDe;
		this.endDe = endDe;
	}



	public SchdulVO(int schdulSn, String empNo, String schdulSj, String schdulCn, String schdulSeCode, String bgnDe,
			String endDe, String deleteYn, String alldayYn) {
		this.schdulSn = schdulSn;
		this.empNo = empNo;
		this.schdulSj = schdulSj;
		this.schdulCn = schdulCn;
		this.schdulSeCode = schdulSeCode;
		this.bgnDe = bgnDe;
		this.endDe = endDe;
		this.deleteYn = deleteYn;
		this.alldayYn = alldayYn;
	}

	public int getSchdulSn() {
		return schdulSn;
	}

	public void setSchdulSn(int schdulSn) {
		this.schdulSn = schdulSn;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getSchdulSj() {
		return schdulSj;
	}

	public void setSchdulSj(String schdulSj) {
		this.schdulSj = schdulSj;
	}

	public String getSchdulCn() {
		return schdulCn;
	}

	public void setSchdulCn(String schdulCn) {
		this.schdulCn = schdulCn;
	}

	public String getSchdulSeCode() {
		return schdulSeCode;
	}

	public void setSchdulSeCode(String schdulSeCode) {
		this.schdulSeCode = schdulSeCode;
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

	public String getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	public String getAlldayYn() {
		return alldayYn;
	}

	public void setAlldayYn(String alldayYn) {
		this.alldayYn = alldayYn;
	}

	@Override
	public String toString() {
		return "SchdulVO [schdulSn=" + schdulSn + ", empNo=" + empNo + ", schdulSj=" + schdulSj + ", schdulCn="
				+ schdulCn + ", schdulSeCode=" + schdulSeCode + ", bgnDe=" + bgnDe + ", endDe=" + endDe + ", deleteYn="
				+ deleteYn + ", alldayYn=" + alldayYn + "]";
	}

	
	

	
	
}
