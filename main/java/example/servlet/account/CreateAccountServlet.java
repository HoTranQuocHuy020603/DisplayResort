package example.servlet.account;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.dao.AccountDao;
import example.model.Account;

@WebServlet("/createAccountServlet")
public class CreateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CreateAccountServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String isAdmin = request.getParameter("isAdmin");
		String isEmployee = request.getParameter("isEmployee");
		
		AccountDao accountDao = new AccountDao();
		Account acc = accountDao.checkAccount(username);
		if (acc == null) {
			accountDao.insertAccount(username,password,isAdmin,isEmployee);
			request.setAttribute("messe","Creating is successful !!!");
			RequestDispatcher rd = request.getRequestDispatcher("readAccountServlet");
			rd.forward(request, response);	
		}else {
			request.setAttribute("mess","Already have an account !!!");
			RequestDispatcher rd = request.getRequestDispatcher("readAccountServlet");
			rd.forward(request, response);	
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
