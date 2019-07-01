package board;

import java.util.List;

public interface BoardService {
	
	BoardPage list(BoardPage page);
	List<BoardVO> list();
	BoardVO detail(int board_id);
	void read(int board_id);
	void insert (BoardVO vo);
	void update(BoardVO vo);
	void delete(int board_id);
	List<ReplyVO> replyList(int board_id);
	boolean replyInsert(ReplyVO vo);
	void reply_delete(int reply_id);
	boolean reply_update(ReplyVO vo);
	String sympathy(BoardVO vo);
	void change(BoardVO vo);
}
