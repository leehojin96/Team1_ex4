package T1_BinResServlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import T1_BinResServlet.ResCustomer;

public class ResCustomerDao {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String password = "1234";
	Connection con = null;
	
	private void dbCon() {
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	public void insert(ResCustomer customer) {
		dbCon();
		String sql = "insert into res_info values(  res_seq.nextval ,1000,?,?,?,?,?)";
		PreparedStatement pst;
		try {
			pst = con.prepareStatement(sql);		 
			//pst.setString(1, customer.getPay_code());
			pst.setString(1, customer.getName());
			pst.setString(2, customer.getEng_name());
			pst.setInt(3, customer.getBirth());
			pst.setString(4, customer.getPhone());
			pst.setString(5, customer.getGender());
			pst.executeUpdate();
			
			pst.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public static void main(String[] args) {
		ResCustomerDao  c = new ResCustomerDao();
		ResCustomer cu = new ResCustomer( "dkdk","asdf","aaa","aaa",10,"aaa","aaa");
		c.insert(cu);
		
	}
	
	
}
