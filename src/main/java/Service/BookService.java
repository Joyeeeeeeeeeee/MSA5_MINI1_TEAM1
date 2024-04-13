package Service;

import java.util.List;

import DTO.Book;

/**
 * 게시판 프로그램의 인터페이스 * 게시판의 기능 메소드 - 게시글 목록 - 게시글 조회 - 게시글 등록 - 게시글 수정 - 게시글 삭제
 * 
 */
public interface BookService {
	// 게시글 목록
	List<Book> list();

	// 게시글 조회
	Book select(int no);

	// 게시글 등록
	int insert(Book book);

	// 게시글 수정
	int update(Book book);

	// 게시글 삭제
	int delete(int no);
	
	// 키워드로 도서 검색
	List<Book> searchByKeyword(String keyword, String condition);
	
	// isbn 으로 조회
	Book selectByISBN(String isbn);
	
	// 대출 시 보유 수량 수정
	int lentTotal(Book book);

	// 반납 시 보유 수량 수정
	int returnTotal(String isbn);
}
