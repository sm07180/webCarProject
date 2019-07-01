package mychart;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChartServiceImpl implements ChartService {
	@Autowired private ChartDAO dao;
	
	@Override
	public List<HashMap<String, Object>> oil_chart(String user_id) {
		return dao.oil_chart(user_id);
	}

	@Override
	public List<HashMap<String, Object>> oil_cost_chart(String user_id) {
		return dao.oil_cost_chart(user_id);
	}

	@Override
	public List<HashMap<String, Object>> repair_cost_chart(String user_id) {
		return dao.repair_cost_chart(user_id);
	}

	@Override
	public List<HashMap<String, Object>> oil_repair_cost(String user_id) {
		return dao.oil_repair_cost(user_id);
	}
}
