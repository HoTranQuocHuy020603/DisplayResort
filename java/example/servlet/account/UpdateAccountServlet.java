package example.servlet.account;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.dao.AccountDao;
import example.model.Account;

@WebServlet("/updateAccountServlet")
public class UpdateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateAccountServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		AccountDao accountDao = new AccountDao();
		Account accountEdit= accountDao.getAccount(id);
		request.setAttribute("accountEdit", accountEdit);
		request.getRequestDispatcher("pages/account/EditAccount.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String isAdmin = request.getParameter("isAdmin");
		String isEmployee = request.getParameter("isEmployee");

		
		AccountDao accountDao = new AccountDao();
		accountDao.updateAccount(id, username, password, isAdmin, isEmployee);
		request.getRequestDispatcher("readAccountServlet").forward(request, response);


	}

}
