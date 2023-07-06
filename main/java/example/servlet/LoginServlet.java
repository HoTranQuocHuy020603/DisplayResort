package example.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import example.dao.AccountDao;
import example.model.Account;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("login-username");
		String password = request.getParameter("login-password");

		AccountDao dao = new AccountDao();
		//chuyen den cac view can cu vao ket qua dang nhap
		try {
			//goi Dao de kiem tra dang nhap trong Database 
			Account isValid = dao.checkLogin(username, password);
			if (isValid != null) {
				//khoi tao session
				HttpSession session = request.getSession();
				//thiet lap gia tri trong session
				session.setAttribute("username", isValid);
				//chuyen den view trang home
				response.sendRedirect("home.jsp");
			}else {
				//truong hop dang nhap that bai 
				request.setAttribute("mess","Wrong username or pass !!!");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		} finally {
		     response.getWriter().close();
		}
	}
	
}
