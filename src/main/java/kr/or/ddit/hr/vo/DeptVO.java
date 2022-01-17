package kr.or.ddit.hr.vo;

public class DeptVO {
	private String deptCode;
	private String dprlrEmpNo;
	private String upperDeptCode;
	private String deptNm;
	private String lvl;
	private int deptOrd;
	
	public DeptVO() {
		// TODO Auto-generated constructor stub
	}

	public DeptVO(String deptCode, String dprlrEmpNo, String upperDeptCode, String deptNm, String lvl, int deptOrd) {
		this.deptCode = deptCode;
		this.dprlrEmpNo = dprlrEmpNo;
		this.upperDeptCode = upperDeptCode;
		this.deptNm = deptNm;
		this.lvl = lvl;
		this.deptOrd = deptOrd;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getDprlrEmpNo() {
		return dprlrEmpNo;
	}

	public void setDprlrEmpNo(String dprlrEmpNo) {
		this.dprlrEmpNo = dprlrEmpNo;
	}

	public String getUpperDeptCode() {
		return upperDeptCode;
	}

	public void setUpperDeptCode(String upperDeptCode) {
		this.upperDeptCode = upperDeptCode;
	}

	public String getDeptNm() {
		return deptNm;
	}

	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}

	public String getLvl() {
		return lvl;
	}

	public void setLvl(String lvl) {
		this.lvl = lvl;
	}

	public int getDeptOrd() {
		return deptOrd;
	}

	public void setDeptOrd(int deptOrd) {
		this.deptOrd = deptOrd;
	}

	@Override
	public String toString() {
		return "DeptVO [deptCode=" + deptCode + ", dprlrEmpNo=" + dprlrEmpNo + ", upperDeptCode=" + upperDeptCode
				+ ", deptNm=" + deptNm + ", lvl=" + lvl + ", deptOrd=" + deptOrd + "]";
	}
	
	
	
}
