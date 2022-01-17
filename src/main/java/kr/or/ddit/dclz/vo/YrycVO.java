package kr.or.ddit.dclz.vo;

public class YrycVO {
	
	private String occrrncYear;
	private int occrrncDaycnt;
	private int useDaycnt;
	private int remndrDaycnt;
	private String empNo;
	private int yrycSn;
	public String getOccrrncYear() {
		return occrrncYear;
	}
	public void setOccrrncYear(String occrrncYear) {
		this.occrrncYear = occrrncYear;
	}
	public int getOccrrncDaycnt() {
		return occrrncDaycnt;
	}
	public void setOccrrncDaycnt(int occrrncDaycnt) {
		this.occrrncDaycnt = occrrncDaycnt;
	}
	public int getUseDaycnt() {
		return useDaycnt;
	}
	public void setUseDaycnt(int useDaycnt) {
		this.useDaycnt = useDaycnt;
	}
	public int getRemndrDaycnt() {
		return remndrDaycnt;
	}
	public void setRemndrDaycnt(int remndrDaycnt) {
		this.remndrDaycnt = remndrDaycnt;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public int getYrycSn() {
		return yrycSn;
	}
	public void setYrycSn(int yrycSn) {
		this.yrycSn = yrycSn;
	}
	@Override
	public String toString() {
		return "YrycVO [occrrncYear=" + occrrncYear + ", occrrncDaycnt=" + occrrncDaycnt + ", useDaycnt=" + useDaycnt
				+ ", remndrDaycnt=" + remndrDaycnt + ", empNo=" + empNo + ", yrycSn=" + yrycSn + "]";
	}

	
}
