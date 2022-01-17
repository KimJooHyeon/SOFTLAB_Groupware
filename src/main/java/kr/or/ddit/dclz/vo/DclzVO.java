package kr.or.ddit.dclz.vo;

import kr.or.ddit.hr.vo.EmpVO;

public class DclzVO {
	
	private int dclzSn; //근태일련번호
	private String empNo; //직원번호
	private String workDe; //근무일자
	private String attendTime; //출근시간
	private String lvffcTime; //퇴근시간
	private int workTime; //근무시간
	private String attendIp; //출근IP
	private String lvffcIp; //퇴근IP
	private String workStleCode; //근무형태코드

	
	private EmpVO empVO;

	public int getDclzSn() {
		return dclzSn;
	}

	public void setDclzSn(int dclzSn) {
		this.dclzSn = dclzSn;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getWorkDe() {
		return workDe;
	}

	public void setWorkDe(String workDe) {
		this.workDe = workDe;
	}

	public String getAttendTime() {
		return attendTime;
	}

	public void setAttendTime(String attendTime) {
		this.attendTime = attendTime;
	}

	public String getLvffcTime() {
		return lvffcTime;
	}

	public void setLvffcTime(String lvffcTime) {
		this.lvffcTime = lvffcTime;
	}

	public int getWorkTime() {
		return workTime;
	}

	public void setWorkTime(int workTime) {
		this.workTime = workTime;
	}

	public String getAttendIp() {
		return attendIp;
	}

	public void setAttendIp(String attendIp) {
		this.attendIp = attendIp;
	}

	public String getLvffcIp() {
		return lvffcIp;
	}

	public void setLvffcIp(String lvffcIp) {
		this.lvffcIp = lvffcIp;
	}

	public String getWorkStleCode() {
		return workStleCode;
	}

	public void setWorkStleCode(String workStleCode) {
		this.workStleCode = workStleCode;
	}


	public EmpVO getEmpVO() {
		return empVO;
	}

	public void setEmpVO(EmpVO empVO) {
		this.empVO = empVO;
	}

	@Override
	public String toString() {
		return "DclzVO [dclzSn=" + dclzSn + ", empNo=" + empNo + ", workDe=" + workDe + ", attendTime=" + attendTime
				+ ", lvffcTime=" + lvffcTime + ", workTime=" + workTime + ", attendIp=" + attendIp + ", lvffcIp="
				+ lvffcIp + ", workStleCode=" + workStleCode + ", empVO=" + empVO + "]";
	}

	
	
	
	
	
	
	

}
