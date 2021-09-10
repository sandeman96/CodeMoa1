package com.study.codemoa.member.model.vo;

public class Member {
<<<<<<< HEAD
	
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
=======
	private String mId;
	private String mPw;
	private String mName;
	private String mNick;
	private String mPhone;
	private String mEmail;
	private String mStatus;
	private String mAdmin;
	private String mIntroduce;
	
	public Member() {}

	public Member(String mId, String mPw, String mName, String mNick, String mPhone, String mEmail, String mStatus,
			String mAdmin, String mIntroduce) {
		super();
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mNick = mNick;
		this.mPhone = mPhone;
		this.mEmail = mEmail;
		this.mStatus = mStatus;
		this.mAdmin = mAdmin;
		this.mIntroduce = mIntroduce;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmNick() {
		return mNick;
	}

	public void setmNick(String mNick) {
		this.mNick = mNick;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public String getmAdmin() {
		return mAdmin;
	}

	public void setmAdmin(String mAdmin) {
		this.mAdmin = mAdmin;
	}

	public String getmIntroduce() {
		return mIntroduce;
	}

	public void setmIntroduce(String mIntroduce) {
		this.mIntroduce = mIntroduce;
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
	}

	@Override
	public String toString() {
<<<<<<< HEAD
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", nickName=" + nickName + ", phone=" + phone
				+ ", email=" + email + ", status=" + status + ", admin=" + admin + "]";
	}
	
	
}
=======
		return "Member [mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mNick=" + mNick + ", mPhone=" + mPhone
				+ ", mEmail=" + mEmail + ", mStatus=" + mStatus + ", mAdmin=" + mAdmin + ", mIntroduce=" + mIntroduce
				+ "]";
	}

}
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
