package kr.or.ddit.dclz.vo;

public class RestdeVO {
	
	private int restdeSn; //휴일일련번호
	private String restdeDe; //휴일일자
	private String dfkSe; //요일구분
	private String restdeSeCode; //휴일구분코드
	private String restdeNm; //휴일명
	public int getRestdeSn() {
		return restdeSn;
	}
	public void setRestdeSn(int restdeSn) {
		this.restdeSn = restdeSn;
	}
	public String getRestdeDe() {
		return restdeDe;
	}
	public void setRestdeDe(String restdeDe) {
		this.restdeDe = restdeDe;
	}
	public String getDfkSe() {
		return dfkSe;
	}
	public void setDfkSe(String dfkSe) {
		this.dfkSe = dfkSe;
	}
	public String getRestdeSeCode() {
		return restdeSeCode;
	}
	public void setRestdeSeCode(String restdeSeCode) {
		this.restdeSeCode = restdeSeCode;
	}
	public String getRestdeNm() {
		return restdeNm;
	}
	public void setRestdeNm(String restdeNm) {
		this.restdeNm = restdeNm;
	}
	@Override
	public String toString() {
		return "RestdeVO [restdeSn=" + restdeSn + ", restdeDe=" + restdeDe + ", dfkSe=" + dfkSe + ", restdeSeCode="
				+ restdeSeCode + ", restdeNm=" + restdeNm + "]";
	}
	
	
	

}
