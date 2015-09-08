package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DesignationMainDAO {
	
	GeneralConnectionDAO dao = new GeneralConnectionDAO();
	
	public ResultSet getDesignationdata()
	{
		String query = "select GroupMaster.groupName groupname,companyMaster.companyName companyname,designationid,designationname,roles from Emp_DesignationMaster " +
				"inner join groupmaster on GroupMaster.groupid=Emp_DesignationMaster.groupid " +
				"inner join companymaster on companyMaster.companyid=Emp_DesignationMaster.companyid where Emp_DesignationMaster.active=1";
		System.out.println(query);
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
	
	public ResultSet getDesignationinfo(int deptid){
		String query = "select groupid,companyid,designationname,roles from Emp_DesignationMaster where designationid="+deptid;
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
	
	public boolean deleteDesignation(int designationid)
	{
		String query = "update Emp_DesignationMaster set active=0 where designationid="+designationid;
		Statement loginStm = null;
		int tupdates=0;
		boolean rs=false;
		try {
			loginStm = dao.makeConnection().createStatement();
			tupdates = loginStm.executeUpdate(query);	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(tupdates!=0)
		{
			rs=true;
		}
		return rs;
		
	}
	
	public boolean insertDesignation(int groupid,int companyid,String designationname,String role)
	{
		String query = "insert into Emp_DesignationMaster(groupid,companyid,designationname,roles) " +
				"values("+groupid+","+companyid+",'"+designationname+"','"+role+"')";
		Statement loginStm = null;
		int tupdates=0;
		boolean rs=false;
		try {
			loginStm = dao.makeConnection().createStatement();
			tupdates = loginStm.executeUpdate(query);	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(tupdates!=0)
		{
			rs=true;
		}
		return rs;
		
	}
	
	public boolean updateDesignation(int designationid,int groupid,int companyid,String designationname,String role)
	{
		String query = "update Emp_DesignationMaster set groupid="+groupid+",companyid="+companyid+",designationname='"+designationname+"',roles='"+role+"' where designationid="+designationid;
		Statement loginStm = null;
		int tupdates=0;
		boolean rs=false;
		try {
			loginStm = dao.makeConnection().createStatement();
			tupdates = loginStm.executeUpdate(query);	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(tupdates!=0)
		{
			rs=true;
		}
		return rs;
		
	}
	

}
