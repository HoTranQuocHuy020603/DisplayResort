package example.servlet.employee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.dao.EmployeeDao;
import example.model.Employee;

@WebServlet("/updateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateEmployeeServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		EmployeeDao employeeDao = new EmployeeDao();
		Employee employeeEdit= employeeDao.getEmployee(id);
		request.setAttribute("employeeEdit", employeeEdit);
		request.getRequestDispatcher("pages/employee/EditEmployee.jsp").forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		String gender = request.getParameter("gender");
		String position = request.getParameter("position");

		
		EmployeeDao employeeDao = new EmployeeDao();
		employeeDao.updateEmployee(id,firstname,lastname,email,phonenumber,gender,position);
		response.sendRedirect("readEmployeeServlet");
	}

}
