package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class HomeGroupMasterDAO {
	
GeneralConnectionDAO dao = new GeneralConnectionDAO();
	
	public ResultSet getGroups(){
	
		String query = "select groupid,groupName from GroupMaster ";
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
	
	public ResultSet getCompanies(String groupid){
		String query = "select companyid,companyName from companyMaster where groupid = '"+groupid+"'";
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
	
	public ResultSet getProjects(String groupid, String companyid){
		String query = "select projectid,projectName from projectMaster where groupid = '"+groupid +"' and companyid = '"+companyid+"'";
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
	

}
