package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.Lent;
import DTO.Search;

public class LentDAO extends JDBConnection {

	public List<Lent> lent_search(Search search) {
		// 게시글 목록을 담을 컬렉션 객체 생성
		List<Lent> LnetList = new ArrayList<Lent>();
		
		// SQL 작성
		String sql = " SELECT *  FROM lent A left join book B on b.isbn=a.isbn left JOIN img_file C on c.isbn=a.isbn WHERE 1=1 ";
		if(search.getUser_num()>0 && search.getUser_level()==1) {
			sql += " and A.user_num='"+search.getUser_num()+"' ";
		}
		if(search.getStatus()!=null) {
			sql += " and A.STATUS='"+search.getStatus()+"' ";
		}
		
		sql += " order by lent_num desc";
				
		try {
			// 쿼리(SQL) 실행 객체 생성 - Statement (stmt)
			stmt = con.createStatement();

			// 쿼리(SQL) 실행 -> 결과 - ResultSet (rs)
			rs = stmt.executeQuery(sql);

			// 조회 결과를 리스트(boardList)에 추가
			while (rs.next()) { // next() : 실행 결과의 다음 데이터로 이동
				
				Lent lent = new Lent();

				lent.setLent_num(rs.getInt("lent_num"));
				lent.setUser_num(rs.getInt("user_num"));
				lent.setIsbn(rs.getString("isbn"));
				lent.setStatus(rs.getString("status"));
				lent.setLent_date(rs.getDate("lent_date"));
				lent.setLate_date(rs.getDate("late_date"));
				lent.setPlus_date(rs.getDate("plus_date"));
				lent.setBname(rs.getString("bname"));

				// 게시글 목록에 추가
				LnetList.add(lent);
			}
		} catch (SQLException e) {
			System.err.println("예약 목록 조회 시, 예외 발생");
			e.printStackTrace();
		}
		// 게시글 목록 반환
		return LnetList;
	}
	
	
	public int lent_insert(Lent lent) {
		int result = 0; // 결과 : 적용된 데이터 건수
		
		String sql = " INSERT INTO lent (LENT_NUM,USER_NUM,ISBN,STATUS,LENT_DATE,LATE_DATE,PLUS_DATE) "
				+ " VALUES(LENT_NUM.NEXTVAL,?, ?, ?, sysdate, sysdate, sysdate) ";

		try {
			psmt = con.prepareStatement(sql); // 쿼리 실행 객체 생성
			psmt.setInt(1, lent.getUser_num());
			psmt.setString(2, lent.getIsbn());
			psmt.setString(3, "대여중");				// TODO: 나중에 DB 에서 DEFAULT 로 바꾸기
			result = psmt.executeUpdate(); // SQL 실행 요청, 적용된 데이터 개수를 받아온다.
											// 게시글 1개 적용 성공 시, result : 1
											// 실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("대출 등록 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	
	public int lent_update(Lent lent) {
		int result = 0; // 결과 : 적용된 데이터 건수

		String sql = " UPDATE book " + " SET bname = ? WHERE isbn = ? ";

		try {
			psmt = con.prepareStatement(sql); // 쿼리 실행 객체 생성
			psmt.setString(1, lent.getBname()); // 1번 ? 에 책 제목 매핑
			psmt.setString(2, lent.getIsbn()); // 2번 ? 에 isbn을 매핑

			result = psmt.executeUpdate(); // SQL 실행 요청, 적용된 데이터 개수를 받아온다.
											// 게시글 1개 적용 성공 시, result : 1
											// 실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("도서 수정 시, 예외 발생");
			e.printStackTrace();
		}
		
		String sql2 = " UPDATE lent " + " SET status = ?, lent_date = ?, late_date = ?  WHERE lent_num = ? ";

		try {
			psmt = con.prepareStatement(sql2); // 쿼리 실행 객체 생성
			psmt.setString(1, lent.getStatus()); // 1번 ? 에 책 제목 매핑
			psmt.setDate(2, new java.sql.Date(lent.getLent_date().getTime()));
			psmt.setDate(3, new java.sql.Date(lent.getLate_date().getTime()));
			psmt.setInt(4, lent.getLent_num());

			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("도서 수정 시, 예외 발생");
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	
	
	// 데이터 삭제
		public int lent_delete(int no) {
			int result = 0; // 결과 : 적용된 데이터 건수

			String sql = " DELETE FROM lent " + " WHERE lent_num = ? ";

			try {
				psmt = con.prepareStatement(sql); // 쿼리 실행 객체 생성
				psmt.setInt(1, no); // 1번 ? 에 게시글 번호를 매핑

				result = psmt.executeUpdate(); // SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 게시글 1개 적용 성공 시, result : 1
												// 실패 시, result : 0
				// executeUpdate()
				// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
			} catch (SQLException e) {
				System.err.println("대출 삭제 시, 예외 발생");
				e.printStackTrace();
			}
			return result;
		}
	
}
