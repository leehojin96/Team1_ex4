package T1_Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import T1_Dto.Package;

public class PackageDao {

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

	public ArrayList<Package> packagelist(){
		
		ArrayList<Package> list = new ArrayList<>();
		dbCon();
		String sql = "select * from package_info";
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()) {
				String pk_num = rs.getString(1);
				String pk_name = rs.getString(2);
				String schedule = rs.getString(3);
				String departure = rs.getString(4);
				String destination = rs.getString(5);
				int price = rs.getInt(6);
				String trv_place = rs.getString(7);
				String ht_key = rs.getString(8);
				
				Package pack_age = new Package(pk_num,pk_name,schedule,departure,destination,price,trv_place,ht_key);
				list.add(pack_age);
			}
			
			rs.close();
			st.close();
			con.close();
			
		} catch (SQLException e) {
				e.printStackTrace();
		}
		return list;
	}
public Package package_where_pk_num(String input_pk_num){
		
		dbCon();
		Package package1=null;
		String sql = "select * from package_info where pk_num=?";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, input_pk_num);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				String pk_name = rs.getString(2);
				String schedule = rs.getString(3);
				String departure = rs.getString(4);
				String destination = rs.getString(5);
				int price = rs.getInt(6);
				String trv_place = rs.getString(7);
				String ht_key = rs.getString(8);
				
				package1 = new Package(input_pk_num, pk_name, schedule, departure, destination, price, trv_place, ht_key);
			}
			
			rs.close();
			pst.close();
			con.close();
			
		} catch (SQLException e) {
				e.printStackTrace();
		}
		return package1;
	}

}