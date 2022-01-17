package com.kjh.mtgr.vo;

public class MtgrResveVO {
	private int resveSn;
	private String resveSj;
	private int mtgrUnit;
	private String empNo;
	private String rsvDe;
	private String beginTime;
	private String endTime;
	private String endDe;
	private String usePurps;
	private String empNm;
	private String mtgrNm;
	
	public MtgrResveVO() {	}

	public MtgrResveVO(int resveSn, String resveSj, int mtgrUnit, String empNo, String rsvDe, String beginTime,
			String endTime,String endDe, String usePurps) {
		this.resveSn = resveSn;
		this.resveSj = resveSj;
		this.mtgrUnit = mtgrUnit;
		this.empNo = empNo;
		this.rsvDe = rsvDe;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.endDe = endDe;
		this.usePurps = usePurps;
	}

	public int getResveSn() {
		return resveSn;
	}

	public void setResveSn(int resveSn) {
		this.resveSn = resveSn;
	}

	public String getResveSj() {
		return resveSj;
	}

	public void setResveSj(String resveSj) {
		this.resveSj = resveSj;
	}

	public int getMtgrUnit() {
		return mtgrUnit;
	}

	public void setMtgrUnit(int mtgrUnit) {
		this.mtgrUnit = mtgrUnit;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getRsvDe() {
		return rsvDe;
	}

	public void setRsvDe(String rsvDe) {
		this.rsvDe = rsvDe;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getEndDe() {
		return endDe;
	}

	public void setEndDe(String endDe) {
		this.endDe = endDe;
	}

	public String getUsePurps() {
		return usePurps;
	}

	public void setUsePurps(String usePurps) {
		this.usePurps = usePurps;
	}
	
	public String getEmpNm() {
		return empNm;
	}

	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}

	public String getMtgrNm() {
		return mtgrNm;
	}

	public void setMtgrNm(String mtgrNm) {
		this.mtgrNm = mtgrNm;
	}

	@Override
	public String toString() {
		return "MtgrResveVO [resveSn=" + resveSn + ", resveSj=" + resveSj + ", mtgrUnit=" + mtgrUnit + ", empNo="
				+ empNo + ", rsvDe=" + rsvDe + ", beginTime=" + beginTime + ", endTime=" + endTime + ", endDe=" + endDe
				+ ", usePurps=" + usePurps + ", empNm=" + empNm + ", mtgrNm=" + mtgrNm + "]";
	}

}
