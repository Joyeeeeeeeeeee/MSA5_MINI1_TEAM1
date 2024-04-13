package Service;

import java.util.List;

import DAO.BookDAO;
import DTO.Book;




/**
 * 게시판 기능 - 비즈니스 로직 클래스
 */
public class BookServiceImpl implements BookService {
	
	private BookDAO bookDAO = new BookDAO();

	@Override
	public List<Book> list() {
		// 1. DAO 객체에 게시글 목록 요청
		List<Book> boardList = bookDAO.list();
		// 2. 게시글 목록 데이터 가공
		// pass
		
		// 3. 게시글 목록 반환
		return boardList;
	}

	@Override
	public Book select(int no) {
		// 1. 게시글 번호에 대한 게시글 정보 데이터 요청
		Book board = bookDAO.select(no);
		
		// 2. 게시글 정보 반환
		return board;
	}

	@Override
	public int insert(Book board) {
		// 1. 게시글 정보를 전달하여 게시글 데이터 등록 요청
		int result = bookDAO.insert(board);
		
		// 2. 적용된 데이터 건수를 반환
		//   - 결과 : 0 --> 데이터 등록 실패
		//           1 --> 데이터 등록 성공
		// * 비즈니스 로직 예시 - if( result > 0 ) 포인트 추가
		return result;
	}

	@Override
	public int update(Book book) {
		// 1. 게시글 정보를 전달하여 게시글 데이터 수정 요청
		int result = bookDAO.update(book);
		// 2. 적용된 데이터 건수를 반환
		//   - 결과 : 0 --> 데이터 수정 실패
		//           1 --> 데이터 수정 성공
		return result;
	}

	@Override
	public int delete(int no) {
		// 1. 게시글 번호를 전달하여 게시글 데이터 삭제 요청
		int result = bookDAO.delete(no);
		// 2. 적용된 데이터 건수를 반환
		//   - 결과 : 0 --> 데이터 삭제 실패
		//           1 --> 데이터 삭제 성공
		return result;
	}

	@Override
	public List<Book> searchByKeyword(String keyword, String condition) {
	    return bookDAO.searchByKeyword(keyword, condition);
	}

	@Override
	public Book selectByISBN(String isbn) {
		Book board = bookDAO.selectByISBN(isbn);
		return board;
	}
	
	// 대출 시 보유수량 수정
	@Override
	public int lentTotal(Book book) {
		int result = bookDAO.lentUpdate(book);
		return result;
	}

	// 반납 시 보유수량 수정
	@Override
	public int returnTotal(String isbn) {
		int result=bookDAO.returnBook(isbn);
		return result;
	}

}