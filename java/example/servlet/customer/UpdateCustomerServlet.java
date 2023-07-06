package example.servlet.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.dao.CustomerDao;
import example.model.Customer;

@WebServlet("/updateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateCustomerServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		CustomerDao customerDao = new CustomerDao();
		Customer customerEdit= customerDao.getCustomer(id);
		request.setAttribute("customerEdit", customerEdit);
		request.getRequestDispatcher("pages/customer/EditCustomer.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		String gender = request.getParameter("gender");

		
		CustomerDao customerDao = new CustomerDao();
		customerDao.updateCustomer(id,firstname,lastname,email,phonenumber,gender);
		response.sendRedirect("readCustomerServlet");
	}

}
