package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import VO.EmployeeTypeVO;

public class EmployeeTypeDAO {

	public ResultSet getData(){
		String query = "select top 10 Emp_Type_id,Emp_Type_Des from Emp_Type" ;
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
	
	public int addZoneData(EmployeeTypeVO vo){
		int result = 0;
		String query = "Insert into Emp_Type "
				+ "("
				+ "Emp_Type_Des) "
				+ "values"
				+ "('"+vo.getEmpTypeDes() +"'"
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
	
	public int editZone(EmployeeTypeVO vo){
		
		int result = 0;
		String query = "update Emp_Type set "
				+ "Emp_Type_Des = '" + vo.getEmpTypeDes()+"'"
				+ " where Emp_Type_id = " + vo.getEmpTypeId();
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
		String query = "delete from Emp_Type"
				+ "where Emp_Type_id = " + id;
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
