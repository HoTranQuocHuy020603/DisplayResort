package example.servlet.contract;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.dao.ContractDao;
import example.model.Contract;

@WebServlet("/readContractServlet")
public class ReadContractServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReadContractServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ContractDao contractDao = new ContractDao();
		List<Contract> listContract = contractDao.selectAllContract();
		request.setAttribute("listContract", listContract);
		request.getRequestDispatcher("pages/contract/ListContract.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
