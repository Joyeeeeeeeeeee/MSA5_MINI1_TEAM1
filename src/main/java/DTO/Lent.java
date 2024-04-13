package DTO;

import java.util.Date;

public class Lent {
	private int lent_num;
	private int user_num;
	private String isbn;
	private String status;
	private Date lent_date;
	private Date late_date;
	private Date plus_date;
	private String file_name;
	private int img_type;
	private String bname;
	
	
	
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getLent_num() {
		return lent_num;
	}
	public void setLent_num(int lent_num) {
		this.lent_num = lent_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getLent_date() {
		return lent_date;
	}
	public void setLent_date(Date lent_date) {
		this.lent_date = lent_date;
	}
	public Date getLate_date() {
		return late_date;
	}
	public void setLate_date(Date late_date) {
		this.late_date = late_date;
	}
	public Date getPlus_date() {
		return plus_date;
	}
	public void setPlus_date(Date plus_date) {
		this.plus_date = plus_date;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getImg_type() {
		return img_type;
	}
	public void setImg_type(int img_type) {
		this.img_type = img_type;
	}
	@Override
	public String toString() {
		return "Lent [lent_num=" + lent_num + ", user_num=" + user_num + ", isbn=" + isbn + ", status=" + status
				+ ", lent_date=" + lent_date + ", late_date=" + late_date + ", plus_date=" + plus_date + ", file_name="
				+ file_name + ", img_type=" + img_type + ", bname=" + bname + "]";
	}
	
	
	
	
}