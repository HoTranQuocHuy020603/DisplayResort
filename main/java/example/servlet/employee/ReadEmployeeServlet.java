package example.servlet.employee;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.dao.EmployeeDao;
import example.model.Employee;

@WebServlet("/readEmployeeServlet")
public class ReadEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReadEmployeeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EmployeeDao employeeDao = new EmployeeDao();
		List<Employee> listEmployee = employeeDao.selectAllEmployee();
		request.setAttribute("listEmployee", listEmployee);
		request.getRequestDispatcher("pages/employee/ListEmployee.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
