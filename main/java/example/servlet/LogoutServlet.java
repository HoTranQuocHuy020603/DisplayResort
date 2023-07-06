package example.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			//lay ve session hien tai
				HttpSession session = request.getSession();
				//huy session
				session.invalidate();
				//quay ve form dang nhap
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);

		}finally {
			out.close();
		}
	}
}