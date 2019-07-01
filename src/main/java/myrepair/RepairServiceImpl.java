package myrepair;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RepairServiceImpl implements RepairService {
	
	@Autowired private RepairDAO dao;

	@Override
	public List<RepairVO> repairList(String user_id) {
		return dao.repairList(user_id);
	}

	@Override
	public RepairVO repairDetail(HashMap<String, String> map) {
		return dao.repairDetail(map);
	}

	@Override
	public RepairVO repairCheck(String repair_id) {
		return dao.repairCheck(repair_id);
	}

	@Override
	public RepairVO recent_mileage(String user_id) {
		return dao.recent_mileage(user_id);
	}
}
