package example.servlet.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.dao.CustomerDao;
import example.model.Customer;

@WebServlet("/searchCustomerServlet")
public class SearchCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchCustomerServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			String searchValue = request.getParameter("txtSearchValue");
			
			CustomerDao schCdao=new CustomerDao();
			List<Customer> result = schCdao.search(searchValue);
			
			request.setAttribute("listCustomer", result);
			RequestDispatcher rd=request.getRequestDispatcher("pages/customer/ListCustomer.jsp");
			rd.forward(request, response);
			
		}catch (Exception ex) {
			ex.getMessage();
		}
	}

}
