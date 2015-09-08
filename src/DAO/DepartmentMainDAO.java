package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import VO.DepartmentVO;

public class DepartmentMainDAO {
	
	GeneralConnectionDAO dao = new GeneralConnectionDAO();
	
	public ResultSet getDepartmentdata()
	{
		String query = "select GroupMaster.groupName groupname,companyMaster.companyName companyname,depid,depdes from DepartmentMaster " +
				"inner join groupmaster on GroupMaster.groupid=DepartmentMaster.groupid " +
				"inner join companymaster on companyMaster.companyid=DepartmentMaster.companyid where DepartmentMaster.active=1";
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
	
	public ResultSet getDepartmentinfo(int deptid){
		String query = "select groupid,companyid,depdes from DepartmentMaster where depid="+deptid;
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
	
	public boolean deleteDesignation(int deptid)
	{
		String query = "update DepartmentMaster set active=0 where depid="+deptid;
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
	
	public boolean insertDepartment(DepartmentVO vo)
	{
		String query = "insert into DepartmentMaster(groupid,companyid,depdes) " +
				"values("+vo.getGroupid()+","+vo.getCompanyid()+",'"+vo.getDepartmentname()+"')";
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
	
	public boolean updateDepartment(DepartmentVO vo)
	{
		String query = "update DepartmentMaster set groupid="+vo.getGroupid()+",companyid="+vo.getCompanyid()+",depdes='"+vo.getDepartmentname()+"' where depid="+vo.getDepartmentid();
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
