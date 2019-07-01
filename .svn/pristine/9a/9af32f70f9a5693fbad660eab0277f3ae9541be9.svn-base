package board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	@Autowired private SqlSession sql;
	
	
	//좋아요 등록 하거나 삭제
	public void change(BoardVO vo) {
		String typ =vo.getSympathy();
		
		if(typ.contains("y")) {
			sql.delete("board-mapper.symdelete",vo);
		}else{
			sql.delete("board-mapper.syminsert",vo);
		}
	}
	
	//좋아요 조회
	public String sympathy(BoardVO vo) {
		String result = sql.selectOne("board-mapper.sympathy",vo);
		return result;
	}
	
	public BoardPage list(BoardPage page) {
		page.setTotalList((Integer)sql.selectOne("board-mapper.total", page));
		List<BoardVO> list=sql.selectList("board-mapper.list", page);
		page.setList(list);
		return page;
	}
	
	public List<BoardVO> list() {
		return sql.selectList("board-mapper.list");
	}
	
	public BoardVO detail(int board_id) {
		return sql.selectOne("board-mapper.detail", board_id);
	}

	public void read(int board_id) {
		sql.update("board-mapper.read", board_id);
	}
	
	public void insert(BoardVO vo) {
		sql.insert("board-mapper.insert", vo);
	}

	public void update(BoardVO vo) {	
		sql.update("board-mapper.update", vo);
	}
	
	public void delete(int board_id) {
		sql.delete("board-mapper.delete", board_id);
	}
	
	public List<ReplyVO> replyList(int board_id) {
		return sql.selectList("board-mapper.replyList", board_id);
	}
	
	public boolean replyInsert(ReplyVO vo) {
		return sql.insert("board-mapper.replyInsert", vo) > 0 ? true : false;
	}
	
	public void reply_delete(int reply_id) {
		sql.delete("board-mapper.replyDelete", reply_id);
	}
	
	public boolean reply_update(ReplyVO vo) {
		return sql.update("board-mapper.replyUpdate", vo) > 0 ? true : false;
	}
}
