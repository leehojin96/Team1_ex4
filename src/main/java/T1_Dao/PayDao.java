package T1_Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import T1_Dto.Pay;

public class PayDao {

	// db작업 
	// 연결정보
	String driver = "oracle.jdbc.driver.OracleDriver" ;
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="system";
	String password="1234";
	Connection con = null; // Connection(전역변수) 초기화
			
	// controller -> service -> DAO -> view 순서
	
	// db연결
	private void dbCon() {
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
				e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.print("연결성공");
		
	}

	public ArrayList<Pay> cus_paylist(String loginid){
		
		ArrayList<Pay> list = new ArrayList<>();
		dbCon();
		String sql = "select * from pay_info where Id = ?";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, loginid);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				String pay_code = rs.getString(1);
				String id = rs.getString(2);
				String pk_num = rs.getString(3);
				int price = rs.getInt(4);
				int persons = rs.getInt(5);
				
				Pay pay = new Pay(pay_code, id, pk_num, price, persons);
				list.add(pay);
			}
			
			rs.close();
			pst.close();
			con.close();
			
		} catch (SQLException e) {
				e.printStackTrace();
		}
		return list;
	}
}
