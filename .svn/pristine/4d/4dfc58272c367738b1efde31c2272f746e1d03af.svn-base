package mychart;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDAO {
	@Autowired private SqlSession sql;
	
	public List<HashMap<String, Object>> oil_chart(String user_id) {
		return sql.selectList("chart-mapper.oil_chart", user_id);
	}

	public List<HashMap<String, Object>> oil_cost_chart(String user_id) {
		return sql.selectList("chart-mapper.oil_cost_chart", user_id);
	}

	public List<HashMap<String, Object>> repair_cost_chart(String user_id) {
		return sql.selectList("chart-mapper.repair_cost_chart", user_id);
	}

	public List<HashMap<String, Object>> oil_repair_cost(String user_id) {
		return sql.selectList("chart-mapper.oil_repair_cost", user_id);
	}
}
