package T1_Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/resperson.do")
public class ResPersonController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("doget성공");
		
		Integer persons = Integer.valueOf(request.getParameter("option"));
		Integer price = Integer.valueOf(request.getParameter("price"));
		Integer option = persons*price; 
		
		
		
		System.out.print(option);
		
		response.getWriter().print(option);
	}
}
