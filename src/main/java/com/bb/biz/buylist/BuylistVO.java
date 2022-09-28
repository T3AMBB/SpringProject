package com.bb.biz.buylist;

public class BuylistVO {
	private int buyid;
	private String mid;
	private int pid;
	private String buydate;
	private int buycnt;
	private String shipping;
	
	public int getBuyid() {
		return buyid;
	}
	public void setBuyid(int buyid) {
		this.buyid = buyid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getBuydate() {
		return buydate;
	}
	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}
	public int getBuycnt() {
		return buycnt;
	}
	public void setBuycnt(int buycnt) {
		this.buycnt = buycnt;
	}
	public String getShipping() {
		return shipping;
	}
	public void setShipping(String shipping) {
		this.shipping = shipping;
	}
	@Override
	public String toString() {
		return "BuylistVO [buyid=" + buyid + ", mid=" + mid + ", pid=" + pid + ", buydate=" + buydate + ", buycnt="
				+ buycnt + ", shipping=" + shipping + "]";
	}
	
	
}
