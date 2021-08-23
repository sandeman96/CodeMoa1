package com.study.codemoa.member.model.vo;

public class Member {

	private String email;
	private String pwd;
	private String name;
	private String nickName;
	private String status;
	private String admin;
	private String education;
	private String location;
	private String skill;
	private String note;

	public Member() {
	}

//	public Member(String education, String location, String skill, String note) {
//		super();
//		this.education = education;
//		this.location = location;
//		this.skill = skill;
//		this.note = note;
//	}

	public Member(String email, String pwd, String name, String nickName, String status, String admin, String education,
			String location, String skill, String note) {
		super();
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.nickName = nickName;
		this.status = status;
		this.admin = admin;
		this.education = education;
		this.location = location;
		this.skill = skill;
		this.note = note;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Override
	public String toString() {
		return "Member [email=" + email + ", pwd=" + pwd + ", name=" + name + ", nickName=" + nickName + ", status="
				+ status + ", admin=" + admin + ", education=" + education + ", location=" + location + ", skill="
				+ skill + ", note=" + note + "]";
	}

}
