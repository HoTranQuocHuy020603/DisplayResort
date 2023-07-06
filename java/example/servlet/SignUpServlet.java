package example.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.dao.AccountDao;
import example.model.Account;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("signup.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		String username = request.getParameter("login-username");
		String password = request.getParameter("login-password");

		AccountDao dao = new AccountDao();
		Account acc = dao.checkAccount(username);
		if (acc == null) {
			dao.signUpAccount(username, password);
			request.setAttribute("messe","Signing is successful !!!");
			RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
			rd.forward(request, response);	
		}else {
			request.setAttribute("mess","Already have an account !!!");
			RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
			rd.forward(request, response);	
		}
	}
	
}
