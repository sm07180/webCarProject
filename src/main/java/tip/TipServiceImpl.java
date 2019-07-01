package tip;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TipServiceImpl implements TipService {
	
	@Autowired private TipDAO dao;

	@Override
	public TipPage list(TipPage page) {
		return dao.list(page);
	}

	@Override
	public TipVO detail(int tt_id) {
		return dao.detail(tt_id);
	}

	@Override
	public void read(int tt_id) {
		dao.read(tt_id);
		
	}

	@Override
	public List<TTReplyVO> tt_reply_list(int tt_id) {
		return dao.tt_reply_list(tt_id);
	}

	@Override
	public boolean tt_reply_insert(TTReplyVO vo) {
		return dao.tt_reply_insert(vo);
	}

	@Override
	public void tt_reply_delete(int tt_reply_id) {
		dao.tt_reply_delete(tt_reply_id);
	}

	@Override
	public boolean tt_reply_update(TTReplyVO vo) {
		return dao.tt_reply_update(vo);
	}
}
