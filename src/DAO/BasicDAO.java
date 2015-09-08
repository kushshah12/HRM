package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BasicDAO {

	public ResultSet getData(){
		String query = "select id,cityCode,cityName,stateCode,stateName from Emp_Basic_Details";
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
