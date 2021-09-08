package com.study.codemoa.dto;

public class CodeMoaDTO {
	private String company;
	private String href;
	private String title;
	private String position;
	private String day;
	private int closeDay;
	private String linker;

	public CodeMoaDTO(String company, String href, String title, String position, String day, String linker) {
		this.company = company;
		this.href = href;
		this.title = title;
		this.position = position;
		this.day = day;
		this.linker = linker;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public int getCloseDay() {
		return closeDay;
	}

	public void setCloseDay(int closeDay) {
		this.closeDay = closeDay;
	}

	public String getLinker() {
		return linker;
	}

	public void setLinker(String linker) {
		this.linker = linker;
	}

}
