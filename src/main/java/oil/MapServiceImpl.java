package oil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired private MapDAO dao;
	
	

}
