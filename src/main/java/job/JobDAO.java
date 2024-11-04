package job;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbtest.EmpDTO;
import dept.DeptDTO;
import util.DBUtil;

public class JobDAO {
	
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
}
