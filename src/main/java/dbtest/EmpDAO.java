package dbtest;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import job.JobDTO;
import util.DBUtil;

//DAO(Data Access Object)
//Service---->DB에간다. 
//       <--- 
public class EmpDAO {
	
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	
	// 1. 특정 부서의 직원 조회 WHERE DEPARTMENT_ID = ?
		public List<JobDTO> selectAllJob() {
			String sql = """
					SELECT *
					FROM jobs
					""";
			List<JobDTO> jobList = new ArrayList<>();
			conn = DBUtil.getConnection();
			try {
				st = conn.prepareStatement(sql);
				rs = st.executeQuery();
				while (rs.next()) {
					JobDTO job = makeJob(rs);
					jobList.add(job);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.dbDisconnect(conn, st, rs);
			}
			return jobList;
		}
		
		private JobDTO makeJob(ResultSet rs) throws SQLException {
			JobDTO job = new JobDTO();
			job.setJob_id(rs.getString("job_id"));
			job.setJob_title(rs.getString("job_title"));
			job.setMin_salary(rs.getInt("min_salary"));
			job.setMax_salary(rs.getInt("max_salary"));
	        return job;
		}
	
	// 1. 특정 부서의 직원 조회	WHERE DEPARTMENT_ID = ?
	public List<EmpDTO> searchTarget(int deptid) {
	    String sql = """
	            SELECT * 
	            FROM employees 
	            WHERE department_id = ?
	            """;
	    Connection conn = DBUtil.getConnection();
	    PreparedStatement st = null;
	    ResultSet rs = null;
	    List<EmpDTO> empList = new ArrayList<>();
	    try {
	        st = conn.prepareStatement(sql);
	        st.setInt(1, deptid);
	        rs = st.executeQuery();
	        while (rs.next()) {
	            EmpDTO emp = makeEmp(rs);
	            empList.add(emp);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBUtil.dbDisconnect(conn, st, rs);
	    }
	    return empList;
	}

	// 2. 특정 job_id인 직원 조회	WHERE JOB_ID = ?
	public List<EmpDTO> selectByJob(String job_id) {
		// 특정 직원을 조회하기
		String sql = "select * from employees WHERE JOB_ID = ? ";
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		List<EmpDTO> empList = new ArrayList<>();
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, job_id); 	// ?에 값을 채우기
			rs = st.executeQuery();	// DB에 가서 실행하고 결과를 가져온다.
			while (rs.next()) {
				EmpDTO emp = makeEmp(rs);
	            empList.add(emp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbDisconnect(conn, st, rs);
		}
		return empList;
	}
	
	// 3. 급여가 ?이상인 직원 조회		WHERE SALARY >= ?
	public List<EmpDTO> selectBySalary(double salary) {
		// 특정 직원을 조회하기
		String sql = "select * from employees WHERE SALARY >= ? ";
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		List<EmpDTO> empList = new ArrayList<>();
		try {
			st = conn.prepareStatement(sql);
			st.setDouble(1, salary);	// ?에 값을 채우기
			rs = st.executeQuery();
			
			while (rs.next()) {
				EmpDTO emp = makeEmp(rs);
	            empList.add(emp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbDisconnect(conn, st, rs);
		}
		return empList;
	}
	// 4. 부서, 직책, 급여, 입사일 조건으로 조회	WHERE DEPARTMENT_ID = ? AND JOB_ID = ? AND SALARY = ? AND HIRE_DATE >= ?
	public List<EmpDTO> selectByCondition(Map<String, Object> map) {
		// 특정 직원을 조회하기
		String sql = """
				select * 
				from employees 
				WHERE DEPARTMENT_ID = ? 
				AND JOB_ID = ? 
				AND SALARY = ? 
				AND HIRE_DATE >= ?
				""";
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		List<EmpDTO> empList = new ArrayList<>();
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, (Integer)map.get("DEPARTMENT_ID"));
			st.setString(2, (String)map.get("JOB_ID"));
			st.setDouble(3, (Double)map.get("SALARY"));
			st.setDate(4, (Date)map.get("HIRE_DATE"));
			rs = st.executeQuery();
			while (rs.next()) {
				EmpDTO emp = makeEmp(rs);
	            empList.add(emp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbDisconnect(conn, st, rs);
		}
		return empList;
	}
	public List<EmpDTO> selectAll() {
		// 모든 직원을 조회하기
		String sql = "select * from employees order by 1";
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		List<EmpDTO> emplist = new ArrayList<EmpDTO>();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				EmpDTO emp = makeEmp(rs);
				emplist.add(emp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbDisconnect(conn, st, rs);
		}
		return emplist;
	}

	public EmpDTO selectById(int empid) {
		// 특정 직원을 조회하기
		String sql = "select * from employees where employee_id = " + empid;
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		EmpDTO emp = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()) {
				emp = makeEmp(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbDisconnect(conn, st, rs);
		}
		return emp;
	}

	// DB에 입력
	public int insert(EmpDTO emp) {
		int result = 0;
		String sql = "insert into employees values (?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn = DBUtil.getConnection();
		// Statement는 ?(binding변수 지원안함) <------PreparedStatement는 지원
		PreparedStatement st = null;
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, emp.getEmployee_id());
			st.setString(2, emp.getFirst_name());
			st.setString(3, emp.getLast_name());
			st.setString(4, emp.getEmail());
			st.setString(5, emp.getPhone_number());
			st.setDate(6, emp.getHire_date());
			st.setString(7, emp.getJob_id());
			st.setDouble(8, emp.getSalary());
			st.setDouble(9, emp.getCommission_pct());
			st.setInt(10, emp.getManager_id());
			st.setInt(11, emp.getDepartment_id());

			result = st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbDisconnect(conn, st, null);
		}

		return result;
	}

	// 수정
	public int update(EmpDTO emp) {
		int result = 0;
		String sql = """
				update employees set
						FIRST_NAME=?,
						LAST_NAME=?,
						EMAIL=?,
						PHONE_NUMBER=?,
						HIRE_DATE=?,
						JOB_ID=?,
						SALARY=?,
						COMMISSION_PCT=?,
						MANAGER_ID=?,
						DEPARTMENT_ID=?
				where EMPLOYEE_ID=?
				""";
		Connection conn = DBUtil.getConnection();
		// Statement는 ?(binding변수 지원안함) <------PreparedStatement는 지원
		PreparedStatement st = null;
		try {
			st = conn.prepareStatement(sql);
			st.setInt(11, emp.getEmployee_id());
			st.setString(1, emp.getFirst_name());
			st.setString(2, emp.getLast_name());
			st.setString(3, emp.getEmail());
			st.setString(4, emp.getPhone_number());
			st.setDate(5, emp.getHire_date());
			st.setString(6, emp.getJob_id());
			st.setDouble(7, emp.getSalary());
			st.setDouble(8, emp.getCommission_pct());
			st.setInt(9, emp.getManager_id());
			st.setInt(10, emp.getDepartment_id());

			result = st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbDisconnect(conn, st, null);
		}

		return result;
	}

	// 삭제
	public int delete(int empid) {
		int result = 0;
		String sql = """
				delete from employees  
				where EMPLOYEE_ID=?
				""";
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, empid);
			result = st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbDisconnect(conn, st, null);
		}

		return result;
	}

	private static EmpDTO makeEmp(ResultSet rs) throws SQLException {
		EmpDTO emp = new EmpDTO();
		emp.setCommission_pct(rs.getDouble("Commission_pct"));
		emp.setDepartment_id(rs.getInt("Department_id"));
		emp.setEmail(rs.getString("email"));
		emp.setEmployee_id(rs.getInt("Employee_id"));
		emp.setFirst_name(rs.getString("First_name"));
		emp.setLast_name(rs.getString("Last_name"));
		emp.setHire_date(rs.getDate("Hire_date"));
		emp.setJob_id(rs.getString("job_id"));
		emp.setManager_id(rs.getInt("Manager_id"));
		emp.setPhone_number(rs.getString("Phone_number"));
		emp.setSalary(rs.getDouble("salary"));
		return emp;
	}
//	private static EmpDTO makeEmp2(ResultSet rs) throws SQLException {
//		EmpDTO emp = EmpDTO.builder()
//				.commission_pct(rs.getDouble("Commission_pct"))
//				.department_id(rs.getInt("Department_id"))
//				.email(rs.getString("email"))
//				.first_name(rs.getString("First_name"))
//				.last_name(rs.getString("Last_name"))
//				.hire_date(rs.getDate("Hire_date"))
//				.job_id(rs.getString("job_id"))
//				.phone_number(rs.getString("Phone_number"))
//				.salary(rs.getDouble("salary"))
//				.build();
//		return emp;
//	}

}
