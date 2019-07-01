package connectcnt;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.MemberVO;

@Repository
public class ConnectCntDAO {
	
	@Autowired private SqlSession sql;

	public void setTotalCnt() {
		sql.update("connectcnt-mapper.setTotalCnt");
	}
	
	public HashMap<String, Integer> getVisitCnt() {
		return sql.selectOne("connectcnt-mapper.getVisitCnt");
	}
	
	public int getTotalCnt() {
		return sql.selectOne("connectcnt-mapper.getTotalCnt");
	}
	
	public List<MemberVO> memberList() {
		
		return sql.selectList("connectcnt-mapper.memberList");
	}
	
	public void rettalAdmin(String user_id,String admin) {
		if(admin.equals("Y")) {
			sql.update("connectcnt-mapper.rittalAdminN",user_id);
		}else {
			sql.update("connectcnt-mapper.rittalAdminY",user_id);
		}
	}

	public HashMap<String, String> rittalCnt(String user_id) {
		// TODO Auto-generated method stub
		return sql.selectOne("connectcnt-mapper.rittalCnt",user_id);
	}

	public List<ConnectCntVO> writeList(String user_id) {
		
		return sql.selectList("connectcnt-mapper.writeList",user_id);
	}

	public ConnectCntVO writeDetail(ConnectCntVO vo) {
		
		return sql.selectOne("connectcnt-mapper.writeDetail",vo);
	}

	public void userDelete(String user_id) {
		sql.delete("member-mapper.delete",user_id);
		
	}
	
}
