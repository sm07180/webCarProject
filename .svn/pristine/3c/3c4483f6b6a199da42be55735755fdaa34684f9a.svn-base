package myrecord;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oil.MapVO;

@Service
public class RecordServiceImpl implements RecordService {
	
	@Autowired private RecordDAO dao;

	@Override
	public void oilInsert(MapVO vo) {
		dao.oilInsert(vo);
	}

	@Override
	public void repairInsert(RecordVO vo) {
		dao.repairInsert(vo);
	}

	@Override
	public List<RecordVO> year_month(String user_id) {
		return dao.year_month(user_id);
	}

	@Override
	public List<RecordVO> myRecord(RecordVO vo) {
		return dao.myRecord(vo);
	}

	@Override
	public void record_delete(String record_id) {
		dao.record_delete(record_id);
	}
}
