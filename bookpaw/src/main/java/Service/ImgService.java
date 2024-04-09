package Service;

import DTO.Img;

public interface ImgService {
	int insert(Img img);
	
	
	Img select(int no);
}
