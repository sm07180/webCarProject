package member;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired private SqlSession sql;
	
	public MemberVO login(HashMap<String, String> map) {
	   
	      MemberVO vo = sql.selectOne("member-mapper.login", map);
	      return vo;
	   }
	
	public boolean insert(MemberVO vo) {
		
		sql.insert("member-mapper.insert", vo);
		sql.insert("member-mapper.recordinsert",vo);
		return sql.insert("member-mapper.carinfo_insert",vo)>0 ? true: false;
	}
	
	public void ktinsert(MemberVO vo) {
		
		sql.insert("member-mapper.insert",vo);
		
	}

	
	public boolean id_check(String user_id) {
		return (Integer)sql.selectOne("member-mapper.id_check", user_id)==0 ? true: false;
	}
	
	public List<CarVO> carlist() {
		
		return sql.selectList("member-mapper.carlist");
	}

	public List<CarVO> carNameList(String comp_id) {
		// TODO Auto-generated method stub
		return sql.selectList("member-mapper.carNameList",comp_id);
	}
	
	public void info_update(MemberVO vo) {
		sql.update("member-mapper.info_update",vo);
		sql.update("member-mapper.car_update",vo);
	}

	public void delete(String user_id) {
		sql.delete("member-mapper.delete",user_id);
		
	}
	
}
