package example.servlet.contract;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.dao.ContractDao;

@WebServlet("/createContractServlet")
public class CreateContractServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CreateContractServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String falname = request.getParameter("falname");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		String gender = request.getParameter("gender");
		String arrivaldate = request.getParameter("arrivaldate");
		String departuredate = request.getParameter("departuredate");
		String adults = request.getParameter("adults");
		String children = request.getParameter("children");
		String roomtype = request.getParameter("roomtype");
		String totalprice = request.getParameter("totalprice");
		String category = request.getParameter("category");
		
		ContractDao contractDao = new ContractDao();
		contractDao.insertContract(falname,id,email,phonenumber,gender,arrivaldate,
				departuredate,adults,children,roomtype,totalprice,category);
		response.sendRedirect("readContractServlet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
