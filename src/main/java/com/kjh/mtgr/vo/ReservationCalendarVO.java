package com.kjh.mtgr.vo;

public class ReservationCalendarVO {
	private int id;
	private String title;
	private int unit;
	private String empNo;
	private String rsvDate;
	private String start;
	private String end;
	private String schdulCn;
	private ReservationExtendedPropsVO extendedProps;
	
	public ReservationCalendarVO() {}

	public ReservationCalendarVO(int id, String title, int unit, String empNo, String rsvDate, String start, String end,
			String schdulCn, ReservationExtendedPropsVO extendedProps) {
		this.id = id;
		this.unit = unit;
		this.empNo = empNo;
		this.rsvDate = rsvDate;
		this.start = start;
		this.end = end;
		this.schdulCn = schdulCn;
		this.extendedProps = extendedProps;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getUnit() {
		return unit;
	}

	public void setUnit(int unit) {
		this.unit = unit;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getRsvDate() {
		return rsvDate;
	}

	public void setRsvDate(String rsvDate) {
		this.rsvDate = rsvDate;
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

	public String getSchdulCn() {
		return schdulCn;
	}

	public void setSchdulCn(String schdulCn) {
		this.schdulCn = schdulCn;
	}

	public ReservationExtendedPropsVO getExtendedProps() {
		return extendedProps;
	}

	public void setExtendedProps(ReservationExtendedPropsVO extendedProps) {
		this.extendedProps = extendedProps;
	}

	@Override
	public String toString() {
		return "ReservationCalendarVO [id=" + id + ", title=" + title + ", unit=" + unit + ", empNo=" + empNo
				+ ", rsvDate=" + rsvDate + ", start=" + start + ", end=" + end + ", schdulCn=" + schdulCn + ", extendedProps="
				+ extendedProps + "]";
	}

}
