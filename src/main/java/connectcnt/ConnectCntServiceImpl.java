package connectcnt;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.MemberVO;

@Service
public class ConnectCntServiceImpl implements ConnectCntService {

	@Autowired private ConnectCntDAO dao;
	
	@Override
	public void setTotalCnt() {
		
		dao.setTotalCnt();
	}

	@Override
	public HashMap<String, Integer> getVisitCnt() {
		return dao.getVisitCnt();
		
	}
	@Override
	public int getTotalCount() {
		return dao.getTotalCnt();
	}

	@Override
	public List<MemberVO> memberList() {
		// TODO Auto-generated method stub
		return dao.memberList();
	}

	@Override
	public void rettalAdmin(String user_id,String admin) {
		dao.rettalAdmin(user_id,admin);
		
	}

	@Override
	public HashMap<String, String> rittalCnt(String user_id) {
		// TODO Auto-generated method stub
		return dao.rittalCnt(user_id);
	}

	@Override
	public List<ConnectCntVO> writeList(String user_id) {
		// TODO Auto-generated method stub
		return dao.writeList(user_id);
	}

	@Override
	public ConnectCntVO writeDetail(ConnectCntVO vo) {
		// TODO Auto-generated method stub
		return dao.writeDetail(vo);
	}

	@Override
	public void userDelete(String user_id) {
		dao.userDelete(user_id);
		
	}

}
