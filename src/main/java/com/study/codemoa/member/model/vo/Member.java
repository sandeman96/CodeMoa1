package com.study.codemoa.member.model.vo;

public class Member {
	
	private String id;
	private String pwd;
	private String name;
	private String nickName;
	private String phone;
	private String email;
	private String status;
	private String admin;
	
	public Member() {
	}
	
	public Member(String id, String pwd, String name, String nickName, String phone, String email, String status,
			String admin) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nickName = nickName;
		this.phone = phone;
		this.email = email;
		this.status = status;
		this.admin = admin;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", nickName=" + nickName + ", phone=" + phone
				+ ", email=" + email + ", status=" + status + ", admin=" + admin + "]";
	}
	
	
}