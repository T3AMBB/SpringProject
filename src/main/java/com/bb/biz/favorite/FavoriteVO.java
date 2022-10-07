package com.bb.biz.favorite;

public class FavoriteVO {
	private int fid;
	private String mid;
	private int pid;
	private String pimg;
	private String pname;
	private int price;
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
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
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "FavoriteVO [fid=" + fid + ", mid=" + mid + ", pid=" + pid + ", pimg=" + pimg + ", pname=" + pname
				+ ", price=" + price + "]";
	}
}
