package T1_BinResServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String price = request.getParameter("price");
		System.out.println( "price=" + price);
		request.setAttribute("price", price);
		request.getRequestDispatcher("WEB-INF/view/res.jsp").forward(request, response);
		System.out.println("가져와요");
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("가져와요2");
		
		//String pay_code = request.getParameter("pay_code");
		String name = request.getParameter("name");
		String eng_name = request.getParameter("eng_name");
		int birth = Integer.parseInt(request.getParameter("birth"));
		//String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		
		System.out.println("제발아아앙");
		
		ResCustomerDao dao = new ResCustomerDao();
		ResCustomer c = new ResCustomer("10", "임의로넣음",name,eng_name, birth, phone,gender);		
		//CustomerDao dao = new CustomerDao();		
		ResCustomerService service = new ResCustomerService(dao);		
		service.insert(c);
		
		response.sendRedirect("tourMypage");
		
		//데이터 insert 후 보낼 페이지
		//request.getRequestDispatcher("WEB-INF/view/res.jsp").forward(request, response);
			
	}
	
}