package kr.or.ddit.common.vo;

public class CmmncodeVO {
	private String groupCode;
	private String code;
	private String codeNm;
	private int outptOrdr;
	private String useAt;
	
	public CmmncodeVO() {
		super();
	}

	public CmmncodeVO(String groupCode, String code, String codeNm, int outptOrdr, String useAt) {
		super();
		this.groupCode = groupCode;
		this.code = code;
		this.codeNm = codeNm;
		this.outptOrdr = outptOrdr;
		this.useAt = useAt;
	}

	public String getGroupCode() {
		return groupCode;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCodeNm() {
		return codeNm;
	}

	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}

	public int getOutptOrdr() {
		return outptOrdr;
	}

	public void setOutptOrdr(int outptOrdr) {
		this.outptOrdr = outptOrdr;
	}

	public String getUseAt() {
		return useAt;
	}

	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}

	@Override
	public String toString() {
		return "CmmncodeVO [groupCode=" + groupCode + ", code=" + code + ", codeNm=" + codeNm + ", outptOrdr="
				+ outptOrdr + ", useAt=" + useAt + "]";
	}
	
}   
