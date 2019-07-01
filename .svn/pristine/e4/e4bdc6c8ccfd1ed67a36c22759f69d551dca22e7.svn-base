package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired private BoardDAO dao;

	@Override
	public List<BoardVO> list() {
		return dao.list();
	}

	@Override
	public BoardVO detail(int board_id) {
		return dao.detail(board_id);
	}

	@Override
	public void read(int board_id) {
		dao.read(board_id);
	}

	@Override
	public void insert(BoardVO vo) {
		dao.insert(vo);
	}

	@Override
	public void update(BoardVO vo) {
		dao.update(vo);
	}

	@Override
	public void delete(int board_id) {
		dao.delete(board_id);
	}

	@Override
	public BoardPage list(BoardPage page) {
		return dao.list(page);
	}

	@Override
	public List<ReplyVO> replyList(int board_id) {
		return dao.replyList(board_id);
	}

	@Override
	public boolean replyInsert(ReplyVO vo) {
		return dao.replyInsert(vo);
	}

	@Override
	public void reply_delete(int reply_id) {
		dao.reply_delete(reply_id);
	}

	@Override
	public boolean reply_update(ReplyVO vo) {
		return dao.reply_update(vo);
	}

	@Override
	public String sympathy(BoardVO vo) {
		return dao.sympathy(vo);
	}

	@Override
	public void change(BoardVO vo) {
		dao.change(vo);
		
	}
}
