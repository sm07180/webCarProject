package myrepair;

import java.util.HashMap;
import java.util.List;

public interface RepairService {
	RepairVO repairCheck(String repair_id);
	List<RepairVO> repairList(String user_id);
	RepairVO repairDetail(HashMap<String, String> map);
	RepairVO recent_mileage(String user_id);
}
