package myrecord;

import java.util.List;

import oil.MapVO;

public interface RecordService {
	void repairInsert(RecordVO vo);
	void oilInsert(MapVO vo);
	List<RecordVO> year_month(String user_id);
	List<RecordVO> myRecord(RecordVO vo);
	void record_delete(String record_id);
}
