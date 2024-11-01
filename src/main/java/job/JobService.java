package job;

import java.util.List;

public class JobService {
JobDAO jobDAO = new JobDAO();
	
	public List<JobDTO> selectAllService() {
		return jobDAO.selectAll();
	}
}
