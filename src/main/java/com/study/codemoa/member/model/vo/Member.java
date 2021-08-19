package com.study.codemoa.member.model.vo;

public class Member {
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
	}

	@Override
	public String toString() {
		return "Member [mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mNick=" + mNick + ", mPhone=" + mPhone
				+ ", mEmail=" + mEmail + ", mStatus=" + mStatus + ", mAdmin=" + mAdmin + ", mIntroduce=" + mIntroduce
				+ "]";
	}

}
