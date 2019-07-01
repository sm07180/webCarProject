package notify;

import java.util.List;

import tip.TipPage;
import tip.TipVO;

public interface NotifyService {

	NotifyPage list(NotifyPage page);

	NotifyVO detail(int id);
	
	void read(int notify_id);

	void update(NotifyVO vo);

	void delete(int notify_id);

	void insert(NotifyVO vo);
	
	List<NotifyVO> fullselect(NotifyVO notifyVO);
	
	/*void testText(String text);*/
	
	TipPage honeytip_list(TipPage page);
	
	List<TipVO> honeytip_select(TipVO tipvo);
	
	TipVO honeytip_detail(int tt_id);
	
	void honeytip_update(TipVO tipvo);
	
	void honeytip_delete(int tt_id,String title_name);
	
	void honeytip_insert(TipVO tipvo);
	
}
