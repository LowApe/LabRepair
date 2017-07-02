package bean;

import java.util.Date;

public class Info {
	private String location;
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	private String classRoom;
	private String machNumb;
	private String errorType;
	private String errorCause;
	private String repairState;
	private String describe;
	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	private Date reportTime;
	private Date repairTime;
	public Info() {
		super();
	}
	
	public Info(String classRoom, String machNumb, String errorType, String errorCause, String repairState,
			Date reportTime, Date repairTime) {
		super();
		this.classRoom = classRoom;
		this.machNumb = machNumb;
		this.errorType = errorType;
		this.errorCause = errorCause;
		this.repairState = repairState;
		this.reportTime = reportTime;
		this.repairTime = repairTime;
	}

	public String getClassRoom() {
		return classRoom;
	}
	public void setClassRoom(String classRoom) {
		this.classRoom = classRoom;
	}
	public String getMachNumb() {
		return machNumb;
	}
	public void setMachNumb(String machNumb) {
		this.machNumb = machNumb;
	}
	public String getErrorType() {
		return errorType;
	}
	public void setErrorType(String errorType) {
		this.errorType = errorType;
	}
	public String getErrorCause() {
		return errorCause;
	}
	public void setErrorCause(String errorCause) {
		this.errorCause = errorCause;
	}
	public String getRepairState() {
		return repairState;
	}
	public void setRepairState(String repairState) {
		this.repairState = repairState;
	}
	public Date getReportTime() {
		return reportTime;
	}
	public void setReportTime(Date reportTime) {
		this.reportTime = reportTime;
	}
	public Date getRepairTime() {
		return repairTime;
	}
	public void setRepairTime(Date repairTime) {
		this.repairTime = repairTime;
	}

	@Override
	public String toString() {
		return "Info [classRoom=" + classRoom + ", machNumb=" + machNumb + ", errorType=" + errorType + ", errorCause="
				+ errorCause + ", repairState=" + repairState + ", describe=" + describe + ", reportTime=" + reportTime
				+ ", repairTime=" + repairTime + "]";
	}
	

}
