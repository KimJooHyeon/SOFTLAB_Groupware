package com.kjh.sanction.vo;

public class ElctrnSanctnVO {
	private int elctrnSanctnSn;
	private String empNo;
	private String docSj;
	private String docCn;
	private String drftDe;
	private String sanctnComptDe;
	private String lastSttusCode;
	private String dsplayAt;
	private int fileSn;
	private String deleteYn;
	private String rtrvlAt;
	private String tmprAt;
	private String empNm;
	private String deptNm;
	private String sanctnFormCode;
	private int step;
	private String sanctnMthCode;
	private String sanctnDe;
	private String sanctnSttusCode;
	private String returnPrvonsh;

	public ElctrnSanctnVO() {
		// TODO Auto-generated constructor stub
	}

	public ElctrnSanctnVO(int elctrnSanctnSn, String empNo, String docSj, String docCn, String drftDe,
			String sanctnComptDe, String lastSttusCode, String dsplayAt, int fileSn, String deleteYn, String rtrvlAt,
			String tmprAt, String empNm, String deptNm, String sanctnFormCode, int step, String sanctnMthCode,
			String sanctnDe, String sanctnSttusCode, String returnPrvonsh) {
		this.elctrnSanctnSn = elctrnSanctnSn;
		this.empNo = empNo;
		this.docSj = docSj;
		this.docCn = docCn;
		this.drftDe = drftDe;
		this.sanctnComptDe = sanctnComptDe;
		this.lastSttusCode = lastSttusCode;
		this.dsplayAt = dsplayAt;
		this.fileSn = fileSn;
		this.deleteYn = deleteYn;
		this.rtrvlAt = rtrvlAt;
		this.tmprAt = tmprAt;
		this.empNm = empNm;
		this.deptNm = deptNm;
		this.sanctnFormCode = sanctnFormCode;
		this.step = step;
		this.sanctnMthCode = sanctnMthCode;
		this.sanctnDe = sanctnDe;
		this.sanctnSttusCode = sanctnSttusCode;
		this.returnPrvonsh = returnPrvonsh;
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

	public String getDocSj() {
		return docSj;
	}

	public void setDocSj(String docSj) {
		this.docSj = docSj;
	}

	public String getDocCn() {
		return docCn;
	}

	public void setDocCn(String docCn) {
		this.docCn = docCn;
	}

	public String getDrftDe() {
		return drftDe;
	}

	public void setDrftDe(String drftDe) {
		this.drftDe = drftDe;
	}

	public String getSanctnComptDe() {
		return sanctnComptDe;
	}

	public void setSanctnComptDe(String sanctnComptDe) {
		this.sanctnComptDe = sanctnComptDe;
	}

	public String getLastSttusCode() {
		return lastSttusCode;
	}

	public void setLastSttusCode(String lastSttusCode) {
		this.lastSttusCode = lastSttusCode;
	}

	public String getDsplayAt() {
		return dsplayAt;
	}

	public void setDsplayAt(String dsplayAt) {
		this.dsplayAt = dsplayAt;
	}

	public int getFileSn() {
		return fileSn;
	}

	public void setFileSn(int fileSn) {
		this.fileSn = fileSn;
	}

	public String getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	public String getRtrvlAt() {
		return rtrvlAt;
	}

	public void setRtrvlAt(String rtrvlAt) {
		this.rtrvlAt = rtrvlAt;
	}

	public String getTmprAt() {
		return tmprAt;
	}

	public void setTmprAt(String tmprAt) {
		this.tmprAt = tmprAt;
	}

	public String getEmpNm() {
		return empNm;
	}

	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}

	public String getDeptNm() {
		return deptNm;
	}

	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}

	public String getSanctnFormCode() {
		return sanctnFormCode;
	}

	public void setSanctnFormCode(String sanctnFormCode) {
		this.sanctnFormCode = sanctnFormCode;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
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

	@Override
	public String toString() {
		return "ElctrnSanctnVO [elctrnSanctnSn=" + elctrnSanctnSn + ", empNo=" + empNo + ", docSj=" + docSj + ", docCn="
				+ docCn + ", drftDe=" + drftDe + ", sanctnComptDe=" + sanctnComptDe + ", lastSttusCode=" + lastSttusCode
				+ ", dsplayAt=" + dsplayAt + ", fileSn=" + fileSn + ", deleteYn=" + deleteYn + ", rtrvlAt=" + rtrvlAt
				+ ", tmprAt=" + tmprAt + ", empNm=" + empNm + ", deptNm=" + deptNm + ", sanctnFormCode="
				+ sanctnFormCode + ", step=" + step + ", sanctnMthCode=" + sanctnMthCode + ", sanctnDe=" + sanctnDe
				+ ", sanctnSttusCode=" + sanctnSttusCode + ", returnPrvonsh=" + returnPrvonsh + "]";
	}

}
