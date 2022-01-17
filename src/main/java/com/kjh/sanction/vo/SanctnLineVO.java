package com.kjh.sanction.vo;

public class SanctnLineVO {
	private int elctrnSanctnSn;
	private int step;
	private String empNo;
	private String sanctnMthCode;
	private String sanctnDe;
	private String sanctnSttusCode;
	private String returnPrvonsh;
	private String cnfirmAt;

	public SanctnLineVO() {
		// TODO Auto-generated constructor stub
	}

	public SanctnLineVO(int elctrnSanctnSn, int step, String empNo, String sanctnMthCode, String sanctnDe,
			String sanctnSttusCode, String returnPrvonsh, String cnfirmAt) {
		super();
		this.elctrnSanctnSn = elctrnSanctnSn;
		this.step = step;
		this.empNo = empNo;
		this.sanctnMthCode = sanctnMthCode;
		this.sanctnDe = sanctnDe;
		this.sanctnSttusCode = sanctnSttusCode;
		this.returnPrvonsh = returnPrvonsh;
		this.cnfirmAt = cnfirmAt;
	}

	public int getElctrnSanctnSn() {
		return elctrnSanctnSn;
	}

	public void setElctrnSanctnSn(int elctrnSanctnSn) {
		this.elctrnSanctnSn = elctrnSanctnSn;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getSanctnMthCode() {
		return sanctnMthCode;
	}

	public void setSanctnMthCode(String sanctnMthCode) {
		this.sanctnMthCode = sanctnMthCode;
	}

	public String getSanctnDe() {
		return sanctnDe;
	}

	public void setSanctnDe(String sanctnDe) {
		this.sanctnDe = sanctnDe;
	}

	public String getSanctnSttusCode() {
		return sanctnSttusCode;
	}

	public void setSanctnSttusCode(String sanctnSttusCode) {
		this.sanctnSttusCode = sanctnSttusCode;
	}

	public String getReturnPrvonsh() {
		return returnPrvonsh;
	}

	public void setReturnPrvonsh(String returnPrvonsh) {
		this.returnPrvonsh = returnPrvonsh;
	}

	public String getCnfirmAt() {
		return cnfirmAt;
	}

	public void setCnfirmAt(String cnfirmAt) {
		this.cnfirmAt = cnfirmAt;
	}

	@Override
	public String toString() {
		return "SanctnLineVO [elctrnSanctnSn=" + elctrnSanctnSn + ", step=" + step + ", empNo=" + empNo
				+ ", sanctnMthCode=" + sanctnMthCode + ", sanctnDe=" + sanctnDe + ", sanctnSttusCode=" + sanctnSttusCode
				+ ", returnPrvonsh=" + returnPrvonsh + ", cnfirmAt=" + cnfirmAt + "]";
	}

}
