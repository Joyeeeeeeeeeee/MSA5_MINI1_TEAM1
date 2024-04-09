package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.Book;
import DTO.Users;

public class UserDAO extends JDBConnection {

	/**
	 * 회원 가입
	 * 
	 * @param user
	 * @return
	 */
	public int join(Users user) {
		int result = 0; // 결과 : 적용된 데이터 건수

		String sql = " INSERT INTO users (user_num,id, password, name, Address, birth, Phone) "
				+ " VALUES(USER_NUM.NEXTVAL,?, ?, ?, ?, ?, ?) ";

		try {
			psmt = con.prepareStatement(sql); // 쿼리 실행 객체 생성
			psmt.setString(1, user.getId());
			psmt.setString(2, user.getPassword());
			psmt.setString(3, user.getName());
			psmt.setString(4, user.getAddress());
			psmt.setString(5, user.getBirth());
			psmt.setString(6, user.getPhone());
			result = psmt.executeUpdate(); // SQL 실행 요청, 적용된 데이터 개수를 받아온다.
											// 게시글 1개 적용 성공 시, result : 1
											// 실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("회원 등록 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 로그인
	 * 
	 * @param user
	 * @return
	 */
	public Users login(Users user) {

		// SQL 작성
		String sql = " SELECT * " + " FROM users " + " WHERE id = ? and password = ? ";
		try {
			psmt = con.prepareStatement(sql);

			// psmt.setXXX( 순서번호, 매핑할 값 );
			psmt.setString(1, user.getId());
			psmt.setString(2, user.getPassword());

			rs = psmt.executeQuery();

			// 조회 결과를 1건 가져오기
			if (rs.next()) { // next() : 실행 결과의 다음 데이터로 이동
				user.setUser_num(rs.getInt("user_num"));
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setAddress(rs.getString("address"));
				user.setBirth(rs.getString("birth"));
				user.setPhone(rs.getString("phone"));
				user.setJoinDate(rs.getDate("join_date"));
				user.setRegDate(rs.getDate("reg_date"));
				user.setUpdDate(rs.getDate("upd_date"));
				return user; // 로그인 성공
			}
			return null;
		} catch (SQLException e) {
			System.err.println("로그인 시, 예외 발생");
			e.printStackTrace();
		}
		return null;
	}

	public Users member(String userId) {
		// SQL 작성
		String sql = " SELECT * " + " FROM users " + " WHERE id = ? ";
		try {
			psmt = con.prepareStatement(sql);

			// psmt.setXXX( 순서번호, 매핑할 값 );
			psmt.setString(1, userId);

			rs = psmt.executeQuery();

			// 조회 결과를 1건 가져오기
			if (rs.next()) { // next() : 실행 결과의 다음 데이터로 이동

				Users user = new Users();

				user.setUser_num(rs.getInt("user_num"));
				user.setUser_level(rs.getInt("user_level"));
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
				user.setAddress(rs.getString("address"));
				user.setBirth(rs.getString("birth"));
				user.setPhone(rs.getString("phone"));
				user.setJoinDate(rs.getDate("join_date"));
				user.setRegDate(rs.getDate("reg_date"));
				user.setUpdDate(rs.getDate("upd_date"));
				return user; // 로그인 성공
			}
			return null;
		} catch (SQLException e) {
			System.err.println("회원정보가져오기, 예외 발생");
			e.printStackTrace();
		}
		return null;
	}

	public List<Users> list() {
		List<Users> userList = new ArrayList<Users>();
		
		String sql = " SELECT * " + " FROM users order by user_num desc";
		
		try {
			stmt = con.createStatement();

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				Users users = new Users();
				users.setAddress(rs.getString("address"));
				users.setBirth(rs.getString("birth"));
				users.setId(rs.getString("id"));
				users.setName(rs.getString("name"));
				users.setPhone(rs.getString("phone"));
				users.setUser_num(rs.getInt("user_num"));
				users.setUser_level(rs.getInt("user_level"));

				// 게시글 목록에 추가
				userList.add(users);
			}
		} catch (SQLException e) {
			System.err.println("도서 목록 조회 시, 예외 발생");
			e.printStackTrace();
		}
		// 게시글 목록 반환
		return userList;
	}

	public int user_update(Users user) {
		int result = 0; // 결과 : 적용된 데이터 건수

		String sql = " UPDATE users  SET name = ?, birth = ?, address = ?, phone = ?, user_level = ?  WHERE user_num = ? ";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getBirth());
			psmt.setString(3, user.getAddress());
			psmt.setString(4, user.getPhone());
			psmt.setInt(5, user.getUser_level());
			psmt.setInt(6, user.getUser_num());

			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("회원 수정 시, 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}

	public int user_delete(int no) {
		int result = 0; // 결과 : 적용된 데이터 건수

		String sql = " DELETE FROM users " + " WHERE user_num = ? ";

		try {
			psmt = con.prepareStatement(sql); // 쿼리 실행 객체 생성
			psmt.setInt(1, no); // 1번 ? 에 게시글 번호를 매핑

			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("회원삭제 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

}
