package T1_Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import T1_Dto.Flight;
import T1_Dto.Package;

public class FlightDao {

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

	public ArrayList<Flight> list(){
		
		ArrayList<Flight> list = new ArrayList<>();
		dbCon();
		String sql = "select flight_num, to_char( dep_date, 'yyyy-mm-dd dy' ), dep_time, to_char( des_date, 'yyyy-mm-dd dy' ), des_time, flight_time, airline, alrline_class, dep_place, des_place from flight_info";
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()) {
				String flight_num = rs.getString(1);
				String dep_date = rs.getString(2);
				String dep_time = rs.getString(3);
				String des_date = rs.getString(4);
				String des_time = rs.getString(5);
				String flight_time = rs.getString(6);
				String airline = rs.getString(7);
				String alrline_class = rs.getString(8);
				String dep_place = rs.getString(9);
				String des_place = rs.getString(10);
				
				Flight flight = new Flight(flight_num,dep_date,dep_time,des_date,des_time,flight_time,airline,alrline_class,dep_place,des_place);
				list.add(flight);
			}
			
			rs.close();
			st.close();
			con.close();
			
		} catch (SQLException e) {
				e.printStackTrace();
		}
		return list;
	}

}