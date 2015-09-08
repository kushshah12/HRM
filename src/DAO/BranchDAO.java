package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import VO.BranchVO;

public class BranchDAO {

	public ResultSet getData(){
		String query = "select groupname,companyName,branchid,branchdes from GroupMaster gm "+
				"left join companyMaster cm on gm.groupid = cm.groupid "+
				"left join BranchMaster bm on gm.groupid = bm.groupid "+
				"where bm.active = 1";
		System.out.println(query);
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
	
	public ResultSet getData1(String query){
		
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
	
	public int addZoneData(BranchVO vo){
		int result = 0;
		String query = "Insert into BranchMaster "
				+ "(groupid ,"
				+ "companyid,"
				+ "branchdes,"
				+ "createdBy,"
				+ "updatedBy,"
				+ "updatedTime,"
				+ "active) "
				+ "values"
				+ "('"+vo.getGroupid() +"',"
				+ "'"+vo.getCompanyid() + "',"
				+ "'"+vo.getBranchname() + "',"
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
	
	public int editZone(BranchVO vo){
		
		int result = 0;
		String query = "update BranchMaster set "
				+ "branchdes = '" + vo.getBranchname()+"',"
				+ "updatedBy = '"+ vo.getUpdatedBy()+"'," 
				+ "updatedTime = GETDATE()"
				+ " where branchid = " + vo.getBranchid();
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
		String query = "update BranchMaster set active=0 "
				+ "where branchid = " + id;
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
