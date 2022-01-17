package com.kjh.common.vo;

public class AtchmnflVO {
	private String deleteYn;
	private int fileSn;
	private int fileOrdr;
	private String fileNm;
	private String flpth;
	private String realFileNm;
	private String realFileMg;
	private String fileTy;
	
	public AtchmnflVO() {
		super();
	}

	public AtchmnflVO(String deleteYn, int fileSn, int fileOrdr, String fileNm, String flpth, String realFileNm,
			String realFileMg, String fileTy) {
		super();
		this.deleteYn = deleteYn;
		this.fileSn = fileSn;
		this.fileOrdr = fileOrdr;
		this.fileNm = fileNm;
		this.flpth = flpth;
		this.realFileNm = realFileNm;
		this.realFileMg = realFileMg;
		this.fileTy = fileTy;
	}

	public String getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	public int getFileSn() {
		return fileSn;
	}

	public void setFileSn(int fileSn) {
		this.fileSn = fileSn;
	}

	public int getFileOrdr() {
		return fileOrdr;
	}

	public void setFileOrdr(int fileOrdr) {
		this.fileOrdr = fileOrdr;
	}

	public String getFileNm() {
		return fileNm;
	}

	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}

	public String getFlpth() {
		return flpth;
	}

	public void setFlpth(String flpth) {
		this.flpth = flpth;
	}

	public String getRealFileNm() {
		return realFileNm;
	}

	public void setRealFileNm(String realFileNm) {
		this.realFileNm = realFileNm;
	}

	public String getRealFileMg() {
		return realFileMg;
	}

	public void setRealFileMg(String realFileMg) {
		this.realFileMg = realFileMg;
	}

	public String getFileTy() {
		return fileTy;
	}

	public void setFileTy(String fileTy) {
		this.fileTy = fileTy;
	}

	@Override
	public String toString() {
		return "AtchmnFlVO [deleteYn=" + deleteYn + ", fileSn=" + fileSn + ", fileOrdr=" + fileOrdr + ", fileNm="
				+ fileNm + ", flpth=" + flpth + ", realFileNm=" + realFileNm + ", realFileMg=" + realFileMg
				+ ", fileTy=" + fileTy + "]";
	}
	
}
