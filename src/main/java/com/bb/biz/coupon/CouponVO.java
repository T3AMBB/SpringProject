package com.bb.biz.coupon;

public class CouponVO {
	private int cid;
	private String code;
	private double dcrate;
	private int cstatus;
	private String mid;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public double getDcrate() {
		return dcrate;
	}
	public void setDcrate(double dcrate) {
		this.dcrate = dcrate;
	}
	public int getCstatus() {
		return cstatus;
	}
	public void setCstatus(int cstatus) {
		this.cstatus = cstatus;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	@Override
	public String toString() {
		return "CouponVO [cid=" + cid + ", code=" + code + ", dcrate=" + dcrate + ", cstatus=" + cstatus + ", mid="
				+ mid + "]";
	}
	
}
