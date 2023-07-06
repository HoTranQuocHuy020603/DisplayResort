package example.servlet.contract;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.dao.ContractDao;
import example.model.Contract;

@WebServlet("/searchContractServlet")
public class SearchContractServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchContractServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			String searchValue = request.getParameter("txtSearchValue");
			
			ContractDao schHDdao=new ContractDao();
			List<Contract> result = schHDdao.search(searchValue);
			
			request.setAttribute("listContract", result);
			RequestDispatcher rd=request.getRequestDispatcher("pages/contract/ListContract.jsp");
			rd.forward(request, response);
			
		}catch (Exception ex) {
			ex.getMessage();
		}
	}

}
