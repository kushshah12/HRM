package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import VO.QualificationVO;

public class QualificationDAO {

	public ResultSet getData(){
		String query = "select groupname,companyName,qualificationid,qualificationdes from GroupMaster gm "+
				"left join companyMaster cm on gm.groupid = cm.groupid "+
				"left join QualificationMaster qm on gm.groupid = qm.groupid "+
				"where qm.active = 1";
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
	
	public int addZoneData(QualificationVO vo){
		int result = 0;
		String query = "Insert into QualificationMaster "
				+ "(groupid ,"
				+ "companyid,"
				+ "qualificationdes,"
				+ "createdBy,"
				+ "updatedBy,"
				+ "updatedDate,"
				+ "active) "
				+ "values"
				+ "('"+vo.getGroupid()+"',"
				+ "'"+vo.getCompanyid() + "',"
				+ "'"+vo.getQualificationdes() + "',"
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
	
	public int editZone(QualificationVO vo){
		
		int result = 0;
		String query = "update QualificationMaster set "
				+ "qualificationdes = '" + vo.getQualificationdes()+"',"
				+ "updatedBy = '"+ vo.getUpdatedBy()+"'," 
				+ "updatedTime = GETDATE()"
				+ " where qualificationid = " + vo.getQualificationid();
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
		String query = "update QualificationMaster set active=0 "
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
