package com.bb.biz.member;

public class MemberVO {
	private String mid;
	private String mpw;
	private String mname;
	private String streetaddress;
	private String zipcode;
	private String address;
	private String mphone;
	private int mileage;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public String getStreetaddress() {
		return streetaddress;
	}
	public void setStreetaddress(String streetadress) {
		this.streetaddress = streetadress;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	@Override
	public String toString() {
		return "MemberVO [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", address=" + address + ", mphone="
				+ mphone + ", mileage=" + mileage + "]";
	}
	
	
}
