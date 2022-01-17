package com.kjh.mtgr.vo;

public class MtgrVO {
	private int mtgrUnit;
	private String mtgrNm;
	private String mtgrLc;
	private int aceptncNmpr;
	
	public MtgrVO() {}

	public MtgrVO(int mtgrUnit, String mtgrNm, String mtgrLc, int aceptncNmpr) {
		super();
		this.mtgrUnit = mtgrUnit;
		this.mtgrNm = mtgrNm;
		this.mtgrLc = mtgrLc;
		this.aceptncNmpr = aceptncNmpr;
	}

	public int getMtgrUnit() {
		return mtgrUnit;
	}

	public void setMtgrUnit(int mtgrUnit) {
		this.mtgrUnit = mtgrUnit;
	}

	public String getMtgrNm() {
		return mtgrNm;
	}

	public void setMtgrNm(String mtgrNm) {
		this.mtgrNm = mtgrNm;
	}

	public String getMtgrLc() {
		return mtgrLc;
	}

	public void setMtgrLc(String mtgrLc) {
		this.mtgrLc = mtgrLc;
	}

	public int getAceptncNmpr() {
		return aceptncNmpr;
	}

	public void setAceptncNmpr(int aceptncNmpr) {
		this.aceptncNmpr = aceptncNmpr;
	}

	@Override
	public String toString() {
		return "MtgrVO [mtgrUnit=" + mtgrUnit + ", mtgrNm=" + mtgrNm + ", mtgrLc=" + mtgrLc + ", aceptncNmpr="
				+ aceptncNmpr + "]";
	}
	
}
