package notify;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tip.TipPage;
import tip.TipVO;

@Repository
public class NotifyDAO {
	@Autowired private SqlSession sql;
	
	public NotifyPage list(NotifyPage page) {
		//총 목록수 조회
		page.setTotalList((Integer)sql.selectOne("notify-mapper.total",page));
		List<NotifyVO> list = sql.selectList("notify-mapper.list",page);
		page.setList(list);
		return page;
	}
	public List<NotifyVO> fullselect(NotifyVO notifyVO) {
		//총 목록수 조회
		List<NotifyVO> list = sql.selectList("notify-mapper.fullselect",notifyVO);
		return list;
	}
	public NotifyVO detail(int notify_id) {
		return sql.selectOne("notify-mapper.detail",notify_id);
	}
	
	public void update(NotifyVO vo) {
		sql.update("notify-mapper.update",vo);
	}
	
	public void delete(int notify_id) {
		sql.delete("notify-mapper.delete",notify_id);
	}
	
	public void insert(NotifyVO vo) {
		sql.insert("notify-mapper.insert",vo);
		
	}
	
	public void read(int notify_id) {
		sql.update("notify-mapper.read",notify_id);
		
	}
	
	//팁 게시판
	/*public void testText(String text) {
		sql.insert("notify-mapper.textinsert",text);
		
	}*/
	
	public TipPage honeytip_list(TipPage page) {
		page.setTotalList((Integer)sql.selectOne("tip-mapper.total2",page));
		List<TipVO> list = sql.selectList("tip-mapper.list2",page);
		page.setList(list);
		return page;
	}
	public List<TipVO> honeytip_select(TipVO tipvo) {
		//총 목록수 조회
		List<TipVO> list = sql.selectList("tip-mapper.fullselect2",tipvo);
		return list;
	}

	public TipVO honeytip_detail(int tt_id) {
		return sql.selectOne("tip-mapper.detail2",tt_id);
	}

	public void honeytip_update(TipVO tipvo) {
		sql.update("tip-mapper.update2",tipvo);
	}
	
	public void honeytip_delete(int tt_id,String title_name) {
		if(title_name.contains("board")) {
			sql.delete("tip-mapper.boarddelete",tt_id);
		}else {
			sql.delete("tip-mapper.delete2",tt_id);
		}
	}

	public void honeytip_insert(TipVO tipvo) {
		sql.insert("tip-mapper.insert2",tipvo);
	}
	
	
	
}
