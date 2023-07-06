package example.servlet.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.dao.CustomerDao;

@WebServlet("/createCustomerServlet")
public class CreateCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CreateCustomerServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		String gender = request.getParameter("gender");
		
		CustomerDao customerDao = new CustomerDao();
		customerDao.insertCustomer(firstname,lastname,email,phonenumber,gender);
		response.sendRedirect("readCustomerServlet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
