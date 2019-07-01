package member;

import java.util.HashMap;
import java.util.List;

public interface MemberService {
	
	MemberVO login(HashMap<String, String> map);
	boolean insert(MemberVO vo);
	void ktinsert(MemberVO vo);
	boolean id_check(String user_id);
	List<CarVO> carlist();
	List<CarVO> carNameList(String comp_id);
	void info_update(MemberVO vo);
	void delete(String user_id);
}
