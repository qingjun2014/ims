package cn.edu.hbcit.pojo;

/**
 * @author 武佳男
 *
 * 2014-6-14
 */
public class Listen_plan {
	private int PK_listen_plan;
	private String FK_users_listener;
	private String section;
	private String FK_course_listen;
	private String listen_date;
	private String classroom;
	private String classes;
	private int FK_terms_listen;
	public int getPK_listen_plan() {
		return PK_listen_plan;
	}
	public void setPK_listen_plan(int pKListenPlan) {
		PK_listen_plan = pKListenPlan;
	}
	public String getFK_users_listener() {
		return FK_users_listener;
	}
	public void setFK_users_listener(String fKUsersListener) {
		FK_users_listener = fKUsersListener;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getFK_course_listen() {
		return FK_course_listen;
	}
	public void setFK_course_listen(String fKCourseListen) {
		FK_course_listen = fKCourseListen;
	}
	public String getListen_date() {
		return listen_date;
	}
	public void setListen_date(String listenDate) {
		listen_date = listenDate;
	}
	public String getClassroom() {
		return classroom;
	}
	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}
	public String getClasses() {
		return classes;
	}
	public void setClasses(String classes) {
		this.classes = classes;
	}
	public int getFK_terms_listen() {
		return FK_terms_listen;
	}
	public void setFK_terms_listen(int fKTermsListen) {
		FK_terms_listen = fKTermsListen;
	}
	

}
