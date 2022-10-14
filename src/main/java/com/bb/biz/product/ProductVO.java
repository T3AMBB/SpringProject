package com.bb.biz.product;

import java.util.ArrayList;
import java.util.List;

public class ProductVO {
	private int pid;
	private String pname;
	private int price;
	private int price2;
	private int pcnt;
	private String pcom;
	private String pmade;
	private String pmat;
	private String psize;
	private String psize2;
	private String pdetail;
	private int cnt;
	private String pimg;
	private int fav;
	private int status;

	private ArrayList<String> pname1;
	private ArrayList<String> pmat1;
	private ArrayList<String> pmade1;
	private ArrayList<String> pcom1;
	
	
	
	@Override
	public String toString() {
		return "ProductVO [pid=" + pid + ", pname=" + pname + ", price=" + price + ", price2=" + price2 + ", pcnt="
				+ pcnt + ", pcom=" + pcom + ", pmade=" + pmade + ", pmat=" + pmat + ", psize=" + psize + ", psize2="
				+ psize2 + ", pdetail=" + pdetail + ", cnt=" + cnt + ", pimg=" + pimg + ", fav=" + fav + ", status="
				+ status + ", pname1=" + pname1 + ", pmat1=" + pmat1 + ", pmade1=" + pmade1 + ", pcom1=" + pcom1 + "]";
	}
	public ArrayList<String> getPname1() {
		return pname1;
	}
	public void setPname1(ArrayList<String> pname1) {
		this.pname1 = pname1;
	}
	public ArrayList<String> getPmat1() {
		return pmat1;
	}
	public void setPmat1(ArrayList<String> pmat1) {
		this.pmat1 = pmat1;
	}
	public ArrayList<String> getPmade1() {
		return pmade1;
	}
	public void setPmade1(ArrayList<String> pmade1) {
		this.pmade1 = pmade1;
	}
	public ArrayList<String> getPcom1() {
		return pcom1;
	}
	public void setPcom1(ArrayList<String> pcom1) {
		this.pcom1 = pcom1;
	}
	public int getPrice2() {
		return price2;
	}
	public void setPrice2(int price2) {
		this.price2 = price2;
	}
	public String getPsize2() {
		return psize2;
	}
	public void setPsize2(String psize2) {
		this.psize2 = psize2;
	}
	public int getFav() {
		return fav;
	}
	public void setFav(int fav) {
		this.fav = fav;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public String getPdetail() {
		return pdetail;
	}
	public void setPdetail(String pdetail) {
		this.pdetail = pdetail;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
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
	public int getPcnt() {
		return pcnt;
	}
	public void setPcnt(int pcnt) {
		this.pcnt = pcnt;
	}
	public String getPcom() {
		return pcom;
	}
	public void setPcom(String pcom) {
		this.pcom = pcom;
	}
	public String getPmade() {
		return pmade;
	}
	public void setPmade(String pmade) {
		this.pmade = pmade;
	}
	public String getPmat() {
		return pmat;
	}
	public void setPmat(String pmat) {
		this.pmat = pmat;
	}
	public String getPsize() {
		return psize;
	}
	public void setPsize(String psize) {
		this.psize = psize;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
	
}
