package tip;

import java.util.List;

public interface TipService {
	TipPage list(TipPage page);
	TipVO detail(int tt_id);
	void read(int tt_id);
	List<TTReplyVO> tt_reply_list(int tt_id);
	boolean tt_reply_insert(TTReplyVO vo);
	void tt_reply_delete(int tt_reply_id);
	boolean tt_reply_update(TTReplyVO vo);
}
