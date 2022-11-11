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
		
		String[] names = request.getParameterValues("name");
		String[] eng_names = request.getParameterValues("eng_name");
		String[] births = request.getParameterValues("birth");
		String[] phones = request.getParameterValues("phone");
		String[] genders = request.getParameterValues("genders");
		
		/*
		*/
		for(int i=0; i < names.length ;i++) {
			
			String name = names[i];
			String eng_name = eng_names[i];
			String birth = births[i];
			String phone = phones[i];
			String gender = genders[i];
			
			ResCustomerDao dao = new ResCustomerDao();
			ResCustomer rescustomer = new ResCustomer(name,eng_name, Integer.valueOf(birth), phone,gender);		
			ResCustomerService service = new ResCustomerService(dao);		
			service.insert(rescustomer);
			
			System.out.print(name);
			System.out.print(eng_name);
			System.out.print(birth);
			System.out.print(phone);
			System.out.print(gender);
		}
		
		response.sendRedirect("tourMypage");
			
	}
	
}