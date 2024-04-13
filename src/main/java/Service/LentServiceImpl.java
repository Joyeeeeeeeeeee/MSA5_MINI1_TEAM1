package Service;

import java.util.List;

import DAO.LentDAO;
import DTO.Lent;
import DTO.Search;

public class LentServiceImpl implements LentService{
	
	private LentDAO lentDAO = new LentDAO();
	
	@Override
	public List<Lent> lent_search(Search search) {
		List<Lent> LnetList = lentDAO.lent_search(search);
		return LnetList;
	}

	@Override
	public int lent_update(Lent lent) {
		int result = lentDAO.lent_update(lent);
		return result;
	}

	@Override
	public int lent_delete(int no) {
		int result = lentDAO.lent_delete(no);
		return 0;
	}

	@Override
	public int lent_insert(Lent lent) {
		int result = lentDAO.lent_insert(lent);
		return result;
	}
	
	@Override
	public int lent_return(int no) {
		int result = lentDAO.lent_return(no);
		return result;
	}

}