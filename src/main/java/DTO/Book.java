package DTO;

import java.util.Date;

public class Book {

	private String bname;
	private String isbn;
	private String author;
	private String category;
	private String make_Date;
	private int total;
	private Date bregDate;
	private Date bupdDate;
	private int no;
	private String text;
	private String file;
	private int file_no;



   

	public String getMake_Date() {
			return make_Date;
		}

		public void setMake_Date(String make_Date) {
			this.make_Date = make_Date;
		}

		public String getFile() {
			return file;
		}

		public void setFile(String file) {
			this.file = file;
		}

		public int getFile_no() {
			return file_no;
		}

		public void setFile_no(int file_no) {
			this.file_no = file_no;
		}

	public Book() {

    }

    public Book(String bname, String isbn, String author, String category, String make_Date, int total, String text) {
    	this.bname= bname;
    	this.isbn = isbn;
        this.author = author;
        this.category = category;
        this.make_Date = make_Date;
        this.total = total;
        this.text = text;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getmake_Date() {
        return make_Date;
    }

    public void setmake_Date(String make_Date) {
        this.make_Date = make_Date;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
    
    public Date getBregDate() {
		return bregDate;
	}

	public void setBregDate(Date bregDate) {
		this.bregDate = bregDate;
	}

	public Date getBupdDate() {
		return bupdDate;
	}

	public void setBupdDate(Date bupdDate) {
		this.bupdDate = bupdDate;
	}
	
	 public String getText() {
			return text;
	}

	public void setText(String text) {
			this.text = text;
	}

	@Override
	public String toString() {
		return "Book [bname=" + bname + ", isbn=" + isbn + ", author=" + author + ", category=" + category
				+ ", make_Date=" + make_Date + ", total=" + total + ", bregDate=" + bregDate + ", bupdDate="
				+ bupdDate + ", no=" + no + ", text=" + text + "]";

	
	}



}