package Service;


import DAO.ImgDAO;
import DTO.Img;

public class ImgServicelmpl implements ImgService  {
	
	private ImgDAO imgDAO = new ImgDAO();
	
	@Override
	public int insert(Img img) {
		int result = imgDAO.insert(img);
		return result;
	}

	@Override
	public Img select(int no) {
		Img file = ImgDAO.select(no);
		return file;
	}

}
