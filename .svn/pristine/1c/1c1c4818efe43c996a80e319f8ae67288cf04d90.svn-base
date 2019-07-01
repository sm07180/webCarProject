package tip;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TipDAO {
	
	@Autowired private SqlSession sql;
	
	public TipPage list(TipPage page) {
		page.setTotalList((Integer)sql.selectOne("tip-mapper.total", page));
		List<TipVO> list=sql.selectList("tip-mapper.list", page);
		page.setList(list);
		return page;
	}

	public TipVO detail(int tt_id) {
		return sql.selectOne("tip-mapper.detail", tt_id);
		
	}

	public void read(int tt_id) {
		sql.update("tip-mapper.read",tt_id);
	}
	
	public List<TTReplyVO> tt_reply_list(int tt_id) {
		return sql.selectList("tip-mapper.tt_reply_list", tt_id);
	}

	public boolean tt_reply_insert(TTReplyVO vo) {
		return sql.insert("tip-mapper.tt_reply_insert", vo) > 0 ? true : false;
	}

	public void tt_reply_delete(int tt_reply_id) {
		sql.delete("tip-mapper.tt_reply_delete", tt_reply_id);
	}

	public boolean tt_reply_update(TTReplyVO vo) {
		return sql.update("tip-mapper.tt_reply_update", vo) > 0 ? true : false;
	}
}
