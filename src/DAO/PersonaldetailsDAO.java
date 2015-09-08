package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PersonaldetailsDAO {
	
	public ResultSet getData(){
		String query = "select PassportNumber,DateofIssue,ValidUpto,PlaceofIssue,MaritalStatus,BloodGroup,HealthDetails from Emp_Personal_Details where EmpID";
		LoginDAO con = new LoginDAO();
		Statement loginStm;
		ResultSet rs = null;
		try {
			loginStm = con.makeConnection().createStatement();
			rs = loginStm.executeQuery(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

}
