package mymanage;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myrecord.RecordVO;

@Service
public class ManageServiceImpl implements ManageService {
	@Autowired private ManageDAO dao;
	
	@Override
	public ManageVO mycar_manage_list(String user_id) {
		return dao.mycar_manage_list(user_id);
	}

	@Override
	public RecordVO mycar_eff(String user_id) {
		return dao.mycar_eff(user_id);
	}

	@Override
	public String efficiency(String car_name) {
		return dao.efficiency(car_name);
	}
	
	@Override
	public String rank(HashMap<String, String> map) {
		return dao.rank(map);
	}
}
