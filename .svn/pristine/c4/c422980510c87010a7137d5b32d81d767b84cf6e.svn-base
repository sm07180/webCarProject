package myrepair;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RepairDAO {
	@Autowired private SqlSession sql;

	public List<RepairVO> repairList(String user_id) {
		return sql.selectList("repair-mapper.repairList", user_id);
	}
	
	public RepairVO repairDetail(HashMap<String, String> map) {
		//정비한적이 있는경우 repair_term과 repair_mileage값이 null이 아니다  --> 바로 리턴
		RepairVO vo = sql.selectOne("repair-mapper.repairDetail", map);
		
		//null인경우 정비한적이 없으므로 다시 조회
		if(vo.getGoal_date() == null) {
			vo = sql.selectOne("repair-mapper.repairDetail2", map);
		}
		
		return vo;
	}
	
	public RepairVO repairCheck(String repair_id) {
		return sql.selectOne("repair-mapper.repairCheck", repair_id);
	}
	
	public RepairVO recent_mileage(String user_id) {
		return sql.selectOne("repair-mapper.recent_mileage", user_id);
	}
}
