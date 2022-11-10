package T1_Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import T1_Dto.Res;

public class ResDao {
	// db작업 
		// 연결정보
		String driver = "oracle.jdbc.driver.OracleDriver" ;
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="system";
		String password="1234";
		Connection con = null; // Connection(전역변수) 초기화
				
		// controller -> service -> DAO -> view 순서
		
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
		
		public ArrayList<Res> res(String login_pay_code){
			ArrayList<Res> list = new ArrayList<>();
			dbCon();
			String sql = "select * from res_info where pay_code=?";
			
			try {
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1, login_pay_code);
				ResultSet rs = pst.executeQuery();
				
				while(rs.next()) {
					
					String res_code = rs.getString(1);
					String pay_code = rs.getString(2);
					String name = rs.getString(3);
					String eng_name = rs.getString(4);
					int birth = rs.getInt(5);
					String phone = rs.getString(6);
					String gender = rs.getString(7);
					Res res = new Res(res_code,pay_code,name,eng_name,birth,phone,gender);
					list.add(res);
					
				}
				
				rs.close();
				pst.close();
				con.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return list;
			
		}

}
