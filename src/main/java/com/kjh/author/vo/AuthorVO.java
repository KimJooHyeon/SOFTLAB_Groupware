package com.kjh.author.vo;

public class AuthorVO {
	private String authorCode;
	private String authorNm;
	
	public AuthorVO() {	}
	
	public AuthorVO(String authorCode, String authorNm) {
		super();
		this.authorCode = authorCode;
		this.authorNm = authorNm;
	}

	public String getAuthorCode() {
		return authorCode;
	}

	public void setAuthorCode(String authorCode) {
		this.authorCode = authorCode;
	}

	public String getAuthorNm() {
		return authorNm;
	}

	public void setAuthorNm(String authorNm) {
		this.authorNm = authorNm;
	}

	@Override
	public String toString() {
		return "AuthorVO [authorCode=" + authorCode + ", authorNm=" + authorNm + "]";
	}
	
}
