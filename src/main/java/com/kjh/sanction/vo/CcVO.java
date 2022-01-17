package com.kjh.sanction.vo;

public class CcVO {
	private int elctrnSanctnSn;
	private String empNo;
	private String cnfirmAt;

	public CcVO() {
		// TODO Auto-generated constructor stub
	}

	public CcVO(int elctrnSanctnSn, String empNo, String cnfirmAt) {
		this.elctrnSanctnSn = elctrnSanctnSn;
		this.empNo = empNo;
		this.cnfirmAt = cnfirmAt;
	}

	public int getElctrnSanctnSn() {
		return elctrnSanctnSn;
	}

	public void setElctrnSanctnSn(int elctrnSanctnSn) {
		this.elctrnSanctnSn = elctrnSanctnSn;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getCnfirmAt() {
		return cnfirmAt;
	}

	public void setCnfirmAt(String cnfirmAt) {
		this.cnfirmAt = cnfirmAt;
	}

	@Override
	public String toString() {
		return "CcVO [elctrnSanctnSn=" + elctrnSanctnSn + ", empNo=" + empNo + ", cnfirmAt=" + cnfirmAt + "]";
	}

}
