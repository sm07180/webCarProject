package notify;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tip.TipPage;
import tip.TipVO;


@Service
public class NotifyServiceImpl implements NotifyService {
	
	@Autowired private NotifyDAO dao;
	
	@Override
	public NotifyPage list(NotifyPage page) {
		// TODO Auto-generated method stub
		return dao.list(page);
	}
	@Override
	public List<NotifyVO> fullselect(NotifyVO notifyVO) {
		// TODO Auto-generated method stub
		return dao.fullselect(notifyVO);
	}

	@Override
	public NotifyVO detail(int notify_id) {
		return dao.detail(notify_id);
	}

	@Override
	public void update(NotifyVO vo) {
		dao.update(vo);
	}
	
	@Override
	public void delete(int notify_id) {
		dao.delete(notify_id);
	}

	@Override
	public void insert(NotifyVO vo) {
		dao.insert(vo);
	}

	
	///////////////////////////////////////////////////
	
	
	
	@Override
	public TipPage honeytip_list(TipPage page) {
		return dao.honeytip_list(page);
	}
	@Override
	public List<TipVO> honeytip_select(TipVO tipvo) {
		return dao.honeytip_select(tipvo);
	}

	@Override
	public TipVO honeytip_detail(int tt_id) {
		return dao.honeytip_detail(tt_id);
	}

	@Override
	public void honeytip_update(TipVO tipvo) {
		dao.honeytip_update(tipvo);
	}
	
	@Override
	public void honeytip_delete(int tt_id,String title_name) {
		dao.honeytip_delete(tt_id,title_name);
	}

	@Override
	public void honeytip_insert(TipVO tipvo) {
		dao.honeytip_insert(tipvo);
	}
	@Override
	public void read(int notify_id) {
		dao.read(notify_id);
		
	}
	
	
	
	
	
}
