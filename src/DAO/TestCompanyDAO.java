package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestCompanyDAO {

	GeneralConnectionDAO dao = new GeneralConnectionDAO();
	
	public ResultSet getCompanydata(int groupid)
	{
		String query = "select companyid,companyName from companyMaster where groupid="+groupid;
		Statement loginStm = null;
		ResultSet rs = null;
		try {
			loginStm = dao.makeConnection().createStatement();
			rs = loginStm.executeQuery(query);	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

	}
	
}
