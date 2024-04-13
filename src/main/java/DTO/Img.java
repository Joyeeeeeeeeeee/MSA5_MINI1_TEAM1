package DTO;

public class Img {
	 private int file_num;
	 private int user_num;
	 private int img_type;
	 private String isbn;
	 private String file_name;
	 
	 
	public Img() {
	}
	
	


	public Img(int img_type, String isbn, String file_name) {
		this.img_type = img_type;
		this.isbn = isbn;
		this.file_name = file_name;
	}




	public int getFile_num() {
		return file_num;
	}


	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}


	public int getUser_num() {
		return user_num;
	}


	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}


	public int getImg_type() {
		return img_type;
	}


	public void setImg_type(int img_type) {
		this.img_type = img_type;
	}


	public String getIsbn() {
		return isbn;
	}


	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}


	public String getFile_name() {
		return file_name;
	}


	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}


	@Override
	public String toString() {
		return "Img [file_num=" + file_num + ", user_num=" + user_num + ", img_type=" + img_type + ", isbn=" + isbn
				+ ", file_name=" + file_name + "]";
	}
	 
	 
	 
	 
}
