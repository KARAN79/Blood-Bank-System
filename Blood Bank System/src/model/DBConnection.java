package model;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnection {
	private static Connection con=null;
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(getConnection());
	}
	public static Connection getConnection(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","BLOODBANK","12345");
			return con;
		}
		catch(Exception e){
			System.out.println("in dbconnection "+e);
			return null;
		}
	}
	public static ResultSet getCourse(Connection con){
		try{
			PreparedStatement ps=con.prepareStatement("select * from ADDDONAR");
			return ps.executeQuery();	
		}
		catch(Exception e){
			System.out.println(e);
			return null;
		}

	}
	public static ResultSet getHos(Connection con,String loc,String blood){
		try{
			PreparedStatement ps=con.prepareStatement("select * from ADDDONAR where ADDRESS like '%"+loc+"%' and BLOODGROUP = '"+blood+"'");
			System.out.println("in getHos ="+ps);
			return ps.executeQuery();	
		}
		catch(Exception e){
			System.out.println("EXCEPTION"+e);
			return null;
		}

	}
	public static ResultSet getQuery(Connection con){
		try{
			PreparedStatement ps=con.prepareStatement("select * from QUERIES");
			return ps.executeQuery();	
		}
		catch(Exception e){
			System.out.println(e);
			return null;
		}

	}
}
