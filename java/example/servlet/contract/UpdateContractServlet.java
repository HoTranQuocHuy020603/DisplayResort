package example.servlet.contract;

import java.io.IOException;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.dao.ContractDao;
import example.model.Contract;

@WebServlet("/updateContractServlet")
public class UpdateContractServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateContractServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cid = request.getParameter("cid");
		ContractDao contractDao = new ContractDao();
		Contract contractEdit = contractDao.getContract(cid);
		request.setAttribute("contractEdit", contractEdit);
		request.getRequestDispatcher("pages/contract/EditContract.jsp").forward(request, response);
	    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		String cid = request.getParameter("cid");
		
		ContractDao contractDao = new ContractDao();
		contractDao.updateContract(falname,id,email,phonenumber,gender,arrivaldate,
				departuredate,adults,children,roomtype,totalprice,category,cid);
		 response.sendRedirect("readContractServlet");
		 
		
//		request.setAttribute("messe","UpdateContract");
//		System.out.println(String.format("mess" ,"UpdateContract"));
//		RequestDispatcher rd = request.getRequestDispatcher("test.jsp");
//		rd.forward(request, response);	
//		 response.sendRedirect("test.jsp");
		 

		
		 
	}

}
