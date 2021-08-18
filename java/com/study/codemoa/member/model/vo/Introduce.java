package com.study.codemoa.member.model.vo;

public class Introduce {
	
	private String education;
	private String location;
	private String skill;
	private String note;
	
	public Introduce() {
	}
	
	public Introduce(String education, String location, String skill, String note) {
		super();
		this.education = education;
		this.location = location;
		this.skill = skill;
		this.note = note;
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
		return "Introduce [education=" + education + ", location=" + location + ", skill=" + skill + ", note=" + note
				+ "]";
	}
	
}
