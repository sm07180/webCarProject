package mymanage;

import java.util.HashMap;

import myrecord.RecordVO;

public interface ManageService {
	String efficiency(String car_name);
	ManageVO mycar_manage_list(String user_id);
	RecordVO mycar_eff(String user_id);
	String rank(HashMap<String, String> map);
}
