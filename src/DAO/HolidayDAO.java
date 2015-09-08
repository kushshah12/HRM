package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import VO.HolidayVO;


public class HolidayDAO {
	GeneralConnectionDAO dao = new GeneralConnectionDAO();
	
	public int addHoliday(HolidayVO vo){
		String query = "insert into HolidayMaster (H_Date,leaveCategory,leaveName,remark,FYEAR,active) values ('"+vo.getDate()+"','"+vo.getLeaveCastegory()+"','"+vo.getLeaveName()+"','"+vo.getRemark()+"','"+vo.getFyear()+"',1)";
		System.out.println(query);
		Statement loginStm = null;
		int result=0;
		try {
			loginStm = dao.makeConnection().createStatement();
			result = loginStm.executeUpdate(query);	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public ResultSet getHolidays(){
		String query = "select * from HolidayMaster where active=1";
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
	
	public int deleteHoliday(int id){
		String query = "update HolidayMaster set active=0 where id = "+id;
		Statement loginStm = null;
		int result=0;
		try {
			loginStm = dao.makeConnection().createStatement();
			result = loginStm.executeUpdate(query);	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public int editHolidayDetails(HolidayVO vo){
		String query = "update HolidayMaster set H_Date = '"+vo.getDate()+"', leaveCategory = '"+vo.getLeaveCastegory()+"', leaveName = '"+vo.getLeaveName()+"', remark = '"+vo.getRemark()+"' where id = "+vo.getId();
				System.out.println(query);
		Statement loginStm = null;
		int result=0;
		try {
			loginStm = dao.makeConnection().createStatement();
			result = loginStm.executeUpdate(query);	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public ResultSet editFetchData(int id){
		String query = "select * from HolidayMaster where id = "+id+" and active=1";
		Statement loginStm = null;
		ResultSet result= null;
		try {
			loginStm = dao.makeConnection().createStatement();
			result = loginStm.executeQuery(query);	
		} catch (SQLException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
