package com.kjh.hr.vo;

import java.io.Serializable;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class EmpVO implements Serializable{
	public String empNo;
	public DeptVO deptVO;
	public String clsfCode;
	public String empNm;
	public String phonenum;
	public String adres1;
	public String adres2;
	public String zip;
	public String brthdy;
	public String password;
	public String email;
	public String lxtnNo;
	public String encpnDe;
	public String retireDe;
	public String photoFlpth;
	
	public MultipartFile[] photoFlpthFile;
	public String clsf;
	private String lvl;
	private String deptOrd;
	private String upperDeptCode;
	private String deptNm;	
	public String deptCode;
	
	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public EmpVO() {
		// TODO Auto-generated constructor stub
	}

	public EmpVO(String empNo, DeptVO deptVO, String clsfCode, String empNm, String phonenum, String adres1,
			String adres2, String zip, String brthdy, String password, String email, String lxtnNo, String encpnDe,
			String retireDe, String photoFlpth, MultipartFile[] photoFlpthFile, String clsf, String lvl, String deptOrd,
			String upperDeptCode, String deptNm) {
		this.empNo = empNo;
		this.deptVO = deptVO;
		this.clsfCode = clsfCode;
		this.empNm = empNm;
		this.phonenum = phonenum;
		this.adres1 = adres1;
		this.adres2 = adres2;
		this.zip = zip;
		this.brthdy = brthdy;
		this.password = password;
		this.email = email;
		this.lxtnNo = lxtnNo;
		this.encpnDe = encpnDe;
		this.retireDe = retireDe;
		this.photoFlpth = photoFlpth;
		this.photoFlpthFile = photoFlpthFile;
		this.clsf = clsf;
		this.lvl = lvl;
		this.deptOrd = deptOrd;
		this.upperDeptCode = upperDeptCode;
		this.deptNm = deptNm;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public DeptVO getDeptVO() {
		return deptVO;
	}

	public void setDeptVO(DeptVO deptVO) {
		this.deptVO = deptVO;
	}

	public String getClsfCode() {
		return clsfCode;
	}

	public void setClsfCode(String clsfCode) {
		this.clsfCode = clsfCode;
	}

	public String getEmpNm() {
		return empNm;
	}

	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getAdres1() {
		return adres1;
	}

	public void setAdres1(String adres1) {
		this.adres1 = adres1;
	}

	public String getAdres2() {
		return adres2;
	}

	public void setAdres2(String adres2) {
		this.adres2 = adres2;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getBrthdy() {
		return brthdy;
	}

	public void setBrthdy(String brthdy) {
		this.brthdy = brthdy;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLxtnNo() {
		return lxtnNo;
	}

	public void setLxtnNo(String lxtnNo) {
		this.lxtnNo = lxtnNo;
	}

	public String getEncpnDe() {
		return encpnDe;
	}

	public void setEncpnDe(String encpnDe) {
		this.encpnDe = encpnDe;
	}

	public String getRetireDe() {
		return retireDe;
	}

	public void setRetireDe(String retireDe) {
		this.retireDe = retireDe;
	}

	public String getPhotoFlpth() {
		return photoFlpth;
	}

	public void setPhotoFlpth(String photoFlpth) {
		this.photoFlpth = photoFlpth;
	}

	public MultipartFile[] getPhotoFlpthFile() {
		return photoFlpthFile;
	}

	public void setPhotoFlpthFile(MultipartFile[] photoFlpthFile) {
		this.photoFlpthFile = photoFlpthFile;
	}

	public String getClsf() {
		return clsf;
	}

	public void setClsf(String clsf) {
		this.clsf = clsf;
	}

	public String getLvl() {
		return lvl;
	}

	public void setLvl(String lvl) {
		this.lvl = lvl;
	}

	public String getDeptOrd() {
		return deptOrd;
	}

	public void setDeptOrd(String deptOrd) {
		this.deptOrd = deptOrd;
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

	@Override
	public String toString() {
		return "EmpVO [empNo=" + empNo + ", deptVO=" + deptVO + ", clsfCode=" + clsfCode + ", empNm=" + empNm
				+ ", phonenum=" + phonenum + ", adres1=" + adres1 + ", adres2=" + adres2 + ", zip=" + zip + ", brthdy="
				+ brthdy + ", password=" + password + ", email=" + email + ", lxtnNo=" + lxtnNo + ", encpnDe=" + encpnDe
				+ ", retireDe=" + retireDe + ", photoFlpth=" + photoFlpth + ", photoFlpthFile="
				+ Arrays.toString(photoFlpthFile) + ", clsf=" + clsf + ", lvl=" + lvl + ", deptOrd=" + deptOrd
				+ ", upperDeptCode=" + upperDeptCode + ", deptNm=" + deptNm + "]";
	}
	
	

	
	
}
