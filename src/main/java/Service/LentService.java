package Service;

import java.util.List;

import DTO.Lent;
import DTO.Search;

public interface LentService {
	// 게시글 목록
	List<Lent> lent_search(Search search);
	
	int lent_insert(Lent lent);
	
	int lent_update(Lent lent);
	
	int lent_delete(int no);
	
	int lent_return(int no);

}