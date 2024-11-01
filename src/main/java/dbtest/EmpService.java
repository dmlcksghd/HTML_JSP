package dbtest;

import java.util.List;
import java.util.Map;

//사용자요청-->Controller--->Service--->DAO--->DB
//DB관련없는 업무로직은 Service에서 수행 
public class EmpService {

	EmpDAO empDAO = new EmpDAO();
	
	// 특정 부서의 직원 찾기 서비스
	public List<EmpDTO> searchTargetService(int deptid) {
	    return empDAO.searchTarget(deptid);
	}
	
	public List<EmpDTO> selectByJob(String job_id) {
		return empDAO.selectByJob(job_id);
	}
	
	public List<EmpDTO> selectBySalary(double salary) {
		return empDAO.selectBySalary(salary);
	}
	
	public List<EmpDTO> selectByCondition(Map<String, Object> map) {
		return empDAO.selectByCondition(map);
	}

	public List<EmpDTO> selectAllService() {
		return empDAO.selectAll();
	}

	public EmpDTO selectByIdService(int empid) {
		// TODO Auto-generated method stub
		return empDAO.selectById(empid);
	}

	// 입력서비스
	public int insertService(EmpDTO emp) {
		return empDAO.insert(emp);

	}

	// 수정서비스
	public int updateService(EmpDTO emp) {
		return empDAO.update(emp);
	}

	// 삭제서비스
	public int deleteService(int empid) {
		return empDAO.delete(empid);
	}
	
	

}







