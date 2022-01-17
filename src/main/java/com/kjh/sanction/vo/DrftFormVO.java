package com.kjh.sanction.vo;

public class DrftFormVO {
	private int drftFormSn;
	private String formNm;
	private String drftCn;
	private String drftSeCode;

	public DrftFormVO() {
		// TODO Auto-generated constructor stub
	}

	public DrftFormVO(int drftFormSn, String formNm, String drftCn, String drftSeCode) {
		this.drftFormSn = drftFormSn;
		this.formNm = formNm;
		this.drftCn = drftCn;
		this.drftSeCode = drftSeCode;
	}

	public int getDrftFormSn() {
		return drftFormSn;
	}

	public void setDrftFormSn(int drftFormSn) {
		this.drftFormSn = drftFormSn;
	}

	public String getFormNm() {
		return formNm;
	}

	public void setFormNm(String formNm) {
		this.formNm = formNm;
	}

	public String getDrftCn() {
		return drftCn;
	}

	public void setDrftCn(String drftCn) {
		this.drftCn = drftCn;
	}

	public String getDrftSeCode() {
		return drftSeCode;
	}

	public void setDrftSeCode(String drftSeCode) {
		this.drftSeCode = drftSeCode;
	}

	@Override
	public String toString() {
		return "DrftForm [drftFormSn=" + drftFormSn + ", formNm=" + formNm + ", drftCn=" + drftCn + ", drftSeCode="
				+ drftSeCode + "]";
	}

}
