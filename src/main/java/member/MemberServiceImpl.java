package member;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired private MemberDAO dao;

	@Override
	   public MemberVO login(HashMap<String, String> map) {
	      // TODO Auto-generated method stub
	      return dao.login(map);
	   }
	
	@Override
	public boolean insert(MemberVO vo) {
		return dao.insert(vo);
	}

	@Override
	public boolean id_check(String user_id) {
		return dao.id_check(user_id);
	}

	@Override
	public List<CarVO> carlist() {
		// TODO Auto-generated method stub
		return dao.carlist();
	}

	@Override
	public List<CarVO> carNameList(String comp_id) {
		// TODO Auto-generated method stub
		return dao.carNameList(comp_id);
	}

	@Override
	public void info_update(MemberVO vo) {
		dao.info_update(vo);
		
	}

	@Override
	public void ktinsert(MemberVO vo) {
		dao.ktinsert(vo);
	}

	@Override
	public void delete(String user_id) {
		dao.delete(user_id);
		
	}
	
	

}
