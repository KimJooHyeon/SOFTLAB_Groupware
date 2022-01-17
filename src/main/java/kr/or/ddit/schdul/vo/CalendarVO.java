package kr.or.ddit.schdul.vo;

public class CalendarVO {
	private int id;
	private String empNo;
	private String title;
	private String schdulCn;
	private String schdulSeCode;
	private String start;
	private String end;
	private String deleteYn;
	private String allDay;
	private String deptCode;
	private ExtendedPropsVO extendedProps;
	
	public CalendarVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public CalendarVO(int id, String empNo, String title, String schdulCn, String schdulSeCode, String start, String end,
			String deleteYn, String allDay, ExtendedPropsVO extendedProps) {
		this.id = id;
		this.empNo = empNo;
		this.title = title;
		this.schdulCn = schdulCn;
		this.schdulSeCode = schdulSeCode;
		this.start = start;
		this.end = end;
		this.deleteYn = deleteYn;
		this.allDay = allDay;
		this.extendedProps = extendedProps;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSchdulCn() {
		return schdulCn;
	}
	public void setSchdulCn(String schdulCn) {
		this.schdulCn = schdulCn;
	}
	public String getschdulSeCode() {
		return schdulSeCode;
	}
	public void setschdulSeCode(String schdulSeCode) {
		this.schdulSeCode = schdulSeCode;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getAllDay() {
		return allDay;
	}


	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}


	public ExtendedPropsVO getExtendedProps() {
		return extendedProps;
	}
	public void setExtendedProps(ExtendedPropsVO extendedProps) {
		this.extendedProps = extendedProps;
	}
	
	
	public String getDeptCode() {
		return deptCode;
	}


	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}


	@Override
	public String toString() {
		return "CalendarVO [id=" + id + ", empNo=" + empNo + ", title=" + title + ", schdulCn=" + schdulCn
				+ ", schdulSeCode=" + schdulSeCode + ", start=" + start + ", end=" + end + ", deleteYn=" + deleteYn
				+ ", allDay=" + allDay + ", deptCode=" + deptCode + ", extendedProps=" + extendedProps + "]";
	}


	
	
}
