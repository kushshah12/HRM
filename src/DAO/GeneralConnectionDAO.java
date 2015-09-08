package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import Extra.GetProperties;

public class GeneralConnectionDAO {
	
	
	public Connection makeConnection() {
		Connection conn = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").getClass();
			System.out.println("Driver Loaded");
		/*	Properties prop = GetProperties.getPropertiesValues(getClass().getClassLoader().getResource("resources/DatabaseConnection.properties").getPath());
			String user = prop.getProperty("user");
			String password = prop.getProperty("password");
			String database = prop.getProperty("database");*/
			String url = "jdbc:sqlserver://182.18.145.136:1433;instanceName=MSSQLSERVER;databaseName="+"his-erp"+";user="+"infoway"+";password="+"SYSADMIN@7966";
			//String url = "jdbc:sqlserver://182.18.145.136:1433;instanceName=MSSQLSERVER;databaseName="+database+";user="+user+";password="+password;
			//String url = "Data Source=182.18.145.136,1433;Initial Catalog=his-erp;Integrated Security=False;User ID=infoway; pwd=SYSADMIN@7966;Connect Timeout=15;Encrypt=False;Packet Size=4096;" providerName="System.Data.SqlClient"
					
			conn = DriverManager.getConnection(url);
			System.out.println("connection done");
			return conn;
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}

	

}
