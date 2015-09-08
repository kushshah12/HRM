package DAO;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.Properties;

import VO.LoginVO;
import Extra.GetProperties;
import Extra.PropertiesData;

public class LoginDAO {

	public Connection makeConnection() {
		Connection conn = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").getClass();
			Properties prop = GetProperties.getPropertiesValues(getClass().getClassLoader().getResource("resources/DatabaseConnection.properties").getPath());
			System.out.println(getClass().getClassLoader().getResource("resources/DatabaseConnection.properties").getPath());
			String user = prop.getProperty("user");
			String password = prop.getProperty("password");
			String database = prop.getProperty("database");
			String url = "jdbc:sqlserver://localhost;instanceName=MSSQLSERVER;databaseName="+database+";user="+user+";password="+password;
			
			//String url = "jdbc:sqlserver://182.18.145.136:1433;instanceName=MSSQLSERVER;databaseName="+"his-erp"+";user="+"infoway"+";password="+"SYSADMIN@7966";
			conn = DriverManager.getConnection(url);
			System.out.println("connection done");
			return conn;
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}
	
	
	public int checkUserDetails(LoginVO vo){
		try {
			String query = "select Password from Emp_Login_Master where UserName = '"+vo.getUserName()+"'";
			String passwd = null;
			Statement loginStm = this.makeConnection().createStatement();
			ResultSet rs = loginStm.executeQuery(query);
				while(rs.next()){
					passwd = rs.getString("Password");
					if(passwd.equals(vo.getPassword())){
						return 1;
					}
					else {
						System.out.println("password is incorrect.");
						return 2;
					}
				}
			return 2;
		}catch(Exception e){
				e.printStackTrace();
				return 5;
			}
	}
}
