package mychart;

import java.util.HashMap;
import java.util.List;

public interface ChartService {
	List<HashMap<String, Object>> oil_chart(String user_id); //������
	List<HashMap<String, Object>> oil_cost_chart(String user_id); //���� �ݾ�
	List<HashMap<String, Object>> repair_cost_chart(String user_id); //���� �ݾ�
	List<HashMap<String, Object>> oil_repair_cost(String user_id); // ����/����
}
