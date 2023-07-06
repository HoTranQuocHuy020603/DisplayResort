package example.servlet.contract;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.dao.ContractDao;

@WebServlet("/deleteContractServlet")
public class DeleteContractServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteContractServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("cid");
		ContractDao contractDao = new ContractDao();
		contractDao.deleteContract(cid);
		response.sendRedirect("readContractServlet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
