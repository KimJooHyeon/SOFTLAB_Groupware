package kr.or.ddit.author.vo;

public class AuthorEmpVO {
	private String authorCode;
	private String empNo;
	private String authorAt;
	
	public AuthorEmpVO() {}
	
	public AuthorEmpVO(String authorCode, String empNo, String authorAt) {
		this.authorCode = authorCode;
		this.empNo = empNo;
		this.authorAt = authorAt;
	}

	public String getAuthorCode() {
		return authorCode;
	}

	public void setAuthorCode(String authorCode) {
		this.authorCode = authorCode;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getAuthorAt() {
		return authorAt;
	}

	public void setAuthorAt(String authorAt) {
		this.authorAt = authorAt;
	}

	@Override
	public String toString() {
		return "AuthorEmpVO [authorCode=" + authorCode + ", empNo=" + empNo + ", authorAt=" + authorAt + "]";
	}

}
