package kr.or.ddit.sanction.vo;

public class DrftSeVO {
	private String drftSeCode;
	private String upperDrftSeCode;
	private String drftSeNm;

	public DrftSeVO() {
		// TODO Auto-generated constructor stub
	}

	public DrftSeVO(String drftSeCode, String upperDrftSeCode, String drftSeNm) {
		this.drftSeCode = drftSeCode;
		this.upperDrftSeCode = upperDrftSeCode;
		this.drftSeNm = drftSeNm;
	}

	public String getDrftSeCode() {
		return drftSeCode;
	}

	public void setDrftSeCode(String drftSeCode) {
		this.drftSeCode = drftSeCode;
	}

	public String getUpperDrftSeCode() {
		return upperDrftSeCode;
	}

	public void setUpperDrftSeCode(String upperDrftSeCode) {
		this.upperDrftSeCode = upperDrftSeCode;
	}

	public String getDrftSeNm() {
		return drftSeNm;
	}

	public void setDrftSeNm(String drftSeNm) {
		this.drftSeNm = drftSeNm;
	}

	@Override
	public String toString() {
		return "DrftSeVO [drftSeCode=" + drftSeCode + ", upperDrftSeCode=" + upperDrftSeCode + ", drftSeNm=" + drftSeNm
				+ "]";
	}

}
