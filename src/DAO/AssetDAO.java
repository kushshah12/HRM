package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import VO.AssetVO;
import VO.QualificationVO;

public class AssetDAO {

	public ResultSet getData(){
		String query = "select groupname,companyName,assetid,assetdes from GroupMaster gm "+
				"left join companyMaster cm on gm.groupid = cm.groupid "+
				"left join AssetMaster am on gm.groupid = am.groupid "+
				"where am.active = 1";
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
	
	public int addZoneData(AssetVO vo){
		int result = 0;
		String query = "Insert into AssetMaster "
				+ "(groupid ,"
				+ "companyid,"
				+ "assetdes,"
				+ "createdBy,"
				+ "updatedBy,"
				+ "updatedDate,"
				+ "active) "
				+ "values"
				+ "('"+vo.getGroupid()+"',"
				+ "'"+vo.getCompanyid() + "',"
				+ "'"+vo.getAssetdes() + "',"
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
	
	public int editZone(AssetVO vo){
		
		int result = 0;
		String query = "update AssetMaster set "
				+ "assetdes = '" + vo.getAssetdes()+"',"
				+ "updatedBy = '"+ vo.getUpdatedBy()+"'," 
				+ "updatedTime = GETDATE()"
				+ " where assetid = " + vo.getAssetid();
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
		String query = "update AssetMaster set active=0 "
				+ "where assetid = " + id;
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
