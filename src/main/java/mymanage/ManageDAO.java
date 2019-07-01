package mymanage;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myrecord.RecordVO;

@Repository
public class ManageDAO {
	@Autowired private SqlSession sql;
	
	public ManageVO mycar_manage_list(String user_id) {
		return sql.selectOne("mycar-mapper.carinfo", user_id);
	}
	
	public RecordVO mycar_eff(String user_id) {
		RecordVO vo = sql.selectOne("mycar-mapper.myCarEff", user_id);
		if(Integer.parseInt(vo.getOil()) != 0) {
			vo.setAvg_mileage(Integer.parseInt(vo.getCar_mileage()) / Integer.parseInt(vo.getOil()));
		}else {
			vo.setAvg_mileage(0);
		}
		return vo;
	}
	
	public String efficiency(String car_name) {
		return sql.selectOne("mycar-mapper.efficiency", car_name);
	}
	
	public String rank(HashMap<String, String> map) {
		return sql.selectOne("mycar-mapper.rank", map);
	}
}
