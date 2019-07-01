package myrecord;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oil.MapVO;

@Repository
public class RecordDAO {
	@Autowired
	private SqlSession sql;

	public void oilInsert(MapVO vo) {
		sql.insert("record-mapper.oilinsert",vo);
	}

	public void repairInsert(RecordVO vo) {
		sql.insert("record-mapper.repairInsert", vo);
	}
	
	public List<RecordVO> year_month(String user_id) {
		return sql.selectList("record-mapper.year_month", user_id);
	}
	
	public List<RecordVO> myRecord(RecordVO vo) {
		return sql.selectList("record-mapper.myRecord", vo);
	}
	
	public void record_delete(String record_id) {
		sql.delete("record-mapper.record_delete", record_id);
	}
}
