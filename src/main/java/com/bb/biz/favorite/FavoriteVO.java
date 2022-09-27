package com.bb.biz.favorite;

public class FavoriteVO {
	private int fid;
	private String mid;
	private int pid;
	private boolean flag;
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
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	@Override
	public String toString() {
		return "FavoriteVO [fid=" + fid + ", mid=" + mid + ", pid=" + pid + ", flag=" + flag + "]";
	}
	
	
}
