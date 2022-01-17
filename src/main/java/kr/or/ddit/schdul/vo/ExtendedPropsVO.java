package kr.or.ddit.schdul.vo;

public class ExtendedPropsVO {
	//일정의 색상을 보여줌
	private String calendar;

	public String getCalendar() {
		return calendar;
	}

	public void setCalendar(String calendar) {
		this.calendar = calendar;
	}

	@Override
	public String toString() {
		return "ExtendedPropsVO [calendar=" + calendar + "]";
	}
	
	
}
