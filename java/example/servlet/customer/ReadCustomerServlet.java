package example.servlet.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.dao.CustomerDao;
import example.model.Customer;


@WebServlet("/readCustomerServlet")
public class ReadCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReadCustomerServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerDao customerDao = new CustomerDao();
		List<Customer> listCustomer = customerDao.selectAllCustomer();
		request.setAttribute("listCustomer", listCustomer);
		request.getRequestDispatcher("pages/customer/ListCustomer.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
