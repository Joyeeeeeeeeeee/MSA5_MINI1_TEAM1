package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.Book;





/**
 *  데이터 접근 객체
 *  - 게시글 데이터 접근
 */
public class BookDAO extends JDBConnection {
	
	// 데이터 목록
	public List<Book> list() {
	      
	      // 게시글 목록을 담을 컬렉션 객체 생성
	      List<Book> boardList = new ArrayList<Book>();
	      
	      // SQL 작성
	      String sql = " SELECT * FROM BOOk A left join IMG_FILE B on b.isbn=a.isbn order by A.no desc ";
	      try {
	         // 쿼리(SQL) 실행 객체 생성 - Statement (stmt)
	         stmt = con.createStatement();
	         
	         // 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
	         rs = stmt.executeQuery(sql);
	         
	         // 조회 결과를 리스트(boardList)에 추가
	         while( rs.next() ) {      // next() : 실행 결과의 다음 데이터로 이동
	            Book board = new Book();
	            
	            // 결과 데이터 가져오기
	            // rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
	            // * "컬럼명"의 값을 특정 타입으로 변환
	            board.setNo( rs.getInt("no") );
	            board.setBname( rs.getString("bname") );
	            board.setIsbn(rs.getString("isbn"));
	            board.setAuthor( rs.getString("author") );
	            board.setCategory( rs.getString("category") );
	            board.setTotal( rs.getInt("total") );
	            board.setBregDate( rs.getTimestamp("breg_date") );
	            board.setBupdDate( rs.getTimestamp("bupd_date") );
	            board.setFile_no(rs.getInt("file_num"));

	            // 게시글 목록에 추가
	            boardList.add(board);
	         }
	      } catch(SQLException e) {
	         System.err.println("도서 목록 조회 시, 예외 발생");
	         e.printStackTrace();
	      }
	      // 게시글 목록 반환
	      return boardList;
	   }


	
	// 데이터 조회
	public Book select(int no) {
		
		// 게시글 정보 객체 생성
		Book board = new Book();
		
		// SQL 작성
		String sql = " SELECT * "
				   + " FROM book "
				   + " WHERE no = ? ";
		try {
			// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
			psmt = con.prepareStatement(sql);
			
			// psmt.setXXX( 순서번호, 매핑할 값 );
			psmt.setInt( 1, no );		// ?(1) <-- no (글번호)
			
			// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
			rs = psmt.executeQuery();
			
			// 조회 결과를 1건 가져오기
			if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
				// 결과 데이터 가져오기
				// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
				// * "컬럼명"의 값을 특정 타입으로 변환
				board.setBname( rs.getString("bname") );
				board.setIsbn(rs.getString("isbn"));
				board.setAuthor( rs.getString("author") );
				board.setCategory( rs.getString("category") );
				board.setmake_Date(rs.getString("make_Date"));
				board.setTotal( rs.getInt("total") );
				board.setNo( rs.getInt("no") );
				board.setText(rs.getString("text"));
				
				
				
			}
		} catch(SQLException e) {
			System.err.println("도서 조회 시, 예외 발생");
			e.printStackTrace();
		}
		// 게시글 정보 1건 반환
		return board;
	}
	
	
	// 데이터 등록
	public int insert(Book board) {
		int result = 0;		// 결과 : 적용된 데이터 건수
		
		String sql = " INSERT INTO book (no, bname, isbn, author, category, make_Date, total, text) "
				   + " VALUES(SEQ_BOARD.NEXTVAL, ?, ?, ?,?,?,?,? ) ";
		
		try {
			psmt = con.prepareStatement(sql);			// 쿼리 실행 객체 생성
			psmt.setString( 1, board.getBname() );		// 1번 ? 에 책 제목 매핑
			psmt.setString( 2, board.getIsbn() );		// 2번 ? 에 isbn을 매핑
			psmt.setString( 3, board.getAuthor() );		// 3번 ? 에 작가를 매핑
			psmt.setString( 4, board.getCategory() );	// 4번 ? 에 분류를 매핑
			psmt.setString( 5, board.getmake_Date() );	// 5번 ? 에 날짜를 매핑
			psmt.setInt( 6, board.getTotal() );			// 6번 ? 에 수량 매핑
			psmt.setString( 7, board.getText() );			// 7번 ? 에 내용 매핑
			
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 게시글 1개 적용 성공 시, result : 1
												// 				실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("도서 등록 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 데이터 수정
	public int update(Book board) {
		int result = 0;		// 결과 : 적용된 데이터 건수
		
		String sql = " UPDATE book "
				   + " SET bname = ? "
				   + "	   ,isbn = ?"
				   + "    ,author  = ? "
				   + "    ,category = ?"
				   + "	  ,make_Date = ?"
				   + "		,total = ?"
				   + "		,text = ?"	
				   + " WHERE no = ? ";
		
		try {
			psmt = con.prepareStatement(sql);			// 쿼리 실행 객체 생성
			psmt.setString( 1, board.getBname() );		// 1번 ? 에 책 제목 매핑
			psmt.setString( 2, board.getIsbn() );		// 2번 ? 에 isbn을 매핑
			psmt.setString( 3, board.getAuthor() );		// 3번 ? 에 작가를 매핑
			psmt.setString( 4, board.getCategory() );	// 4번 ? 에 분류를 매핑
			psmt.setString( 5, board.getmake_Date() );	// 5번 ? 에 날짜를 매핑
			psmt.setInt( 6, board.getTotal() );			// 6번 ? 에 수량 매핑
			psmt.setString( 7, board.getText() );			// 7번 ? 에 내용 매핑
			psmt.setInt( 8, board.getNo() );			// 8번 ? 에 번호 매핑
			
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 게시글 1개 적용 성공 시, result : 1
												// 				실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("도서 게시글 수정 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 데이터 삭제
	public int delete(int no) {
		int result = 0;		// 결과 : 적용된 데이터 건수
		
		String sql = " DELETE FROM book "
				   + " WHERE no = ? ";
		
		try {
			psmt = con.prepareStatement(sql);	// 쿼리 실행 객체 생성
			psmt.setInt( 1, no );				// 1번 ? 에 게시글 번호를 매핑
			
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 게시글 1개 적용 성공 시, result : 1
												// 				실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("도서 삭제 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	// 데이터 제목으로 검색
	public List<Book> searchByTitle(String title) {
	    List<Book> bookList = new ArrayList<>();

	    String sql = "SELECT * FROM book A left join IMG_FILE B on B.isbn=A.isbn WHERE bname LIKE ?";

	    try {
	        psmt = con.prepareStatement(sql);
	        psmt.setString(1, "%" + title + "%");

	        rs = psmt.executeQuery();

	        while (rs.next()) {
	            Book book = new Book();
	            // 결과 데이터 가져오기
	            book.setNo(rs.getInt("no"));
	            book.setBname(rs.getString("bname"));
	            book.setIsbn(rs.getString("isbn"));
	            book.setAuthor(rs.getString("author"));
	            book.setCategory(rs.getString("category"));
	            book.setmake_Date(rs.getString("make_Date"));
	            book.setTotal(rs.getInt("total"));
	            book.setText(rs.getString("text"));
	            book.setFile_no(rs.getInt("file_num"));

	            bookList.add(book);
	        }
	    } catch (SQLException e) {
	        System.err.println("도서 제목 검색 시, 예외 발생");
	        e.printStackTrace();
	    }

	    return bookList;
	}

	// 작가명으로 검색
	public List<Book> searchByAuthor(String author) {
	    List<Book> bookList = new ArrayList<>();

	    String sql = "SELECT * FROM book A left join IMG_FILE B on B.isbn=A.isbn WHERE author LIKE ?";

	    try {
	        psmt = con.prepareStatement(sql);
	        psmt.setString(1, "%" + author + "%");

	        rs = psmt.executeQuery();

	        while (rs.next()) {
	            Book book = new Book();
	            // 결과 데이터 가져오기
	            book.setNo(rs.getInt("no"));
	            book.setBname(rs.getString("bname"));
	            book.setIsbn(rs.getString("isbn"));
	            book.setAuthor(rs.getString("author"));
	            book.setCategory(rs.getString("category"));
	            book.setmake_Date(rs.getString("make_Date"));
	            book.setTotal(rs.getInt("total"));
	            book.setText(rs.getString("text"));
	            book.setFile_no(rs.getInt("file_num"));

	            bookList.add(book);
	        }
	    } catch (SQLException e) {
	        System.err.println("도서 작가명 검색 시, 예외 발생");
	        e.printStackTrace();
	    }

	    return bookList;
	}
	
	// 데이터 검색
	public List<Book> searchByKeyword(String key, String query) {
	    List<Book> bookList = new ArrayList<>();
	    String sql = "";

	    // 도서명으로 검색
	    if (key.equals("t")) {
	        sql = "SELECT * FROM book WHERE bname LIKE ?";
	    } 
	    // 작가명으로 검색
	    else if (key.equals("w")) {
	        sql = "SELECT * FROM book WHERE author LIKE ?";
	    }

	    try {
	        // PreparedStatement를 사용하여 SQL 쿼리 실행
	        psmt = con.prepareStatement(sql);
	        psmt.setString(1, "%" + query + "%");
	        rs = psmt.executeQuery();

	        // 결과를 리스트에 추가
	        while (rs.next()) {
	            Book book = new Book();
	            // 결과를 Book 객체에 설정
	            book.setNo(rs.getInt("no"));
	            book.setBname(rs.getString("bname"));
	            book.setIsbn(rs.getString("isbn"));
	            book.setAuthor(rs.getString("author"));
	            book.setCategory(rs.getString("category"));
	            book.setmake_Date(rs.getString("make_Date"));
	            book.setTotal(rs.getInt("total"));
	            book.setText(rs.getString("text"));
	            // 리스트에 Book 객체 추가
	            bookList.add(book);
	        }
	    } catch (SQLException e) {
	        System.err.println("도서 검색 중 오류 발생: " + e.getMessage());
	    }

	    return bookList;
	}
	
	// 데이터 조회
		public Book selectByISBN(String isbn) {
			
			// 게시글 정보 객체 생성
			Book board = new Book();
			
			// SQL 작성
			String sql = " SELECT * "
					   + " FROM BOOk A left join IMG_FILE B on b.isbn=a.isbn "
					   + " WHERE A.isbn = ? ";
			try {
				// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
				psmt = con.prepareStatement(sql);
				
				// psmt.setXXX( 순서번호, 매핑할 값 );
				psmt.setString( 1, isbn );		// ?(1) <-- no (글번호)
				
				// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
				rs = psmt.executeQuery();
				
				// 조회 결과를 1건 가져오기
				if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
					// 결과 데이터 가져오기
					// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
					// * "컬럼명"의 값을 특정 타입으로 변환
					board.setBname( rs.getString("bname") );
					board.setIsbn(rs.getString("isbn"));
					board.setAuthor( rs.getString("author") );
					board.setCategory( rs.getString("category") );
					board.setmake_Date(rs.getString("make_Date"));
					board.setTotal( rs.getInt("total") );
					board.setNo( rs.getInt("no") );
					board.setText(rs.getString("text"));
					board.setFile_no(rs.getInt("file_num"));
					
					
					
				}
			} catch(SQLException e) {
				System.err.println("도서 조회 시, 예외 발생");
				e.printStackTrace();
			}
			// 게시글 정보 1건 반환
			return board;
		}
	
		// 대출 시 total 수정
		public int lentUpdate(Book book) {
			int result=0;


			String sql2 = " UPDATE book "
					   + " SET total = total - ? "
					   + " WHERE isbn = ? ";
			try {
				psmt = con.prepareStatement(sql2);
				psmt.setInt(1, book.getTotal());
				psmt.setString(2, book.getIsbn());
				
				result=psmt.executeUpdate();
			} catch (SQLException e) {
				System.err.println("수량 수정 시 예외 발생");
			}
			return result;
			
		}
		
		// 반납 시 total 수정
		public int returnBook(String isbn) {
			int result=0;

			String sql2 = " UPDATE book "
					   + " SET total = total + 1  "
					   + " WHERE isbn = ? ";
			try {
				psmt = con.prepareStatement(sql2);
				psmt.setString(1, isbn);
				
				result=psmt.executeUpdate();
			} catch (SQLException e) {
				System.err.println("반납 시 예외 발생");
			}
			return result;
			
		}
	
}