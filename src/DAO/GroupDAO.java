package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import VO.GroupVO;

public class GroupDAO {

	public ResultSet getData(){
		String query = "select top 10 groupid,groupname from GroupMaster where active=1";
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
	
	public int addZoneData(GroupVO vo){
		int result = 0;
		String query = "Insert into GroupMaster"
				+ "(groupname ,"
				+ "createdBy,"
				+ "updatedBy,"
				+ "updatedTime,"
				+ "active) "
				+ "values"
				+ "('"+vo.getGroupname() +"',"
				+ "'"+vo.getCreatedBy() + "',"
				+ "'"+vo.getUpdatedBy()+"',"
				+"GETDATE(),"
				+ "1"
				+")";
		System.out.println(query);
		LoginDAO con = new LoginDAO();
		Statement loginStm;
		try {
			loginStm = con.makeConnection().createStatement();
			result = loginStm.executeUpdate(query);
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public int editZone(GroupVO vo){
		
		int result = 0;
		String query = "update GroupMaster set "
				+ "groupname = '" + vo.getGroupname()+"',"
				+ "updatedBy = '"+ vo.getUpdatedBy()+"'," 
				+ "updatedTime = GETDATE()"
				+ " where groupid = " + vo.getGroupid();
		System.out.println(query);
		LoginDAO con = new LoginDAO();
		Statement loginStm;
		try {
			loginStm = con.makeConnection().createStatement();
			result = loginStm.executeUpdate(query);
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteZone(int id){
		int result = 0;
		String query = "update GroupMaster set active=0 "
				+ "where groupid = " + id;
		LoginDAO con = new LoginDAO();
		Statement loginStm;
		try {
			loginStm = con.makeConnection().createStatement();
			result = loginStm.executeUpdate(query);
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
}
