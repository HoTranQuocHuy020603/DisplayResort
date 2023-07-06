package example.servlet.account;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.dao.AccountDao;
import example.model.Account;

@WebServlet("/readAccountServlet")
public class ReadAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReadAccountServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDao accountDao = new AccountDao();
		List<Account> listAccount = accountDao.selectAllAccount();
		request.setAttribute("listAccount", listAccount);
		request.getRequestDispatcher("pages/account/ListAccount.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
