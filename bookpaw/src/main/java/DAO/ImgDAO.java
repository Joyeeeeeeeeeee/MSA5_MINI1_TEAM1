package DAO;

import java.sql.SQLException;
import DTO.Img;

public class ImgDAO extends JDBConnection {
	public int insert(Img img) {
		int result = 0; // 결과 : 적용된 데이터 건수

		String sql = " INSERT INTO img_file (file_num, isbn, file_name, img_type,user_num) "
				+ " VALUES(FILE_NUM.NEXTVAL,?,?,? ) ";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, img.getIsbn());
			psmt.setString(2, img.getFile_name());
			psmt.setInt(3, img.getImg_type());
			psmt.setInt(4, img.getUser_num());

			result = psmt.executeUpdate();
			System.err.println("도서사진 등록 성공");
		} catch (SQLException e) {
			System.err.println("도서사진 등록 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	public static Img select(int no) {
		Img img = new Img();

		String sql = " SELECT * FROM IMG_FILE WHERE file_num = " + no;

		try {
			psmt = con.prepareStatement(sql);
			// 쿼리(SQL) 실행 -> 결과 - ResultSet (rs)
			rs = psmt.executeQuery();

			// 조회 결과를 1건 가져오기
			if (rs.next()) { // next() : 실행 결과의 다음 데이터로 이동
				// 결과 데이터 가져오기
				// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
				// * "컬럼명"의 값을 특정 타입으로 변환
				img.setFile_name(rs.getString("file_name"));
				img.setImg_type(rs.getInt("file_num"));
				img.setIsbn(rs.getString("isbn"));

			}

		} catch (Exception e) {
			System.err.println("파일 조회시 에러발생");
			e.printStackTrace();
		}

		return img;
	}

}