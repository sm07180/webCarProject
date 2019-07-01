package connectcnt;

import java.util.HashMap;
import java.util.List;

import member.MemberVO;

public interface ConnectCntService {
	void setTotalCnt();
	HashMap<String, Integer> getVisitCnt();
	int getTotalCount();
	List<MemberVO> memberList();
	void rettalAdmin(String user_id,String admin);
	HashMap<String, String> rittalCnt(String user_id);
	List<ConnectCntVO> writeList(String user_id);
	ConnectCntVO writeDetail(ConnectCntVO vo);
	void userDelete(String user_id);
}
