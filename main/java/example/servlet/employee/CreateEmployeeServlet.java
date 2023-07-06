package example.servlet.employee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.dao.EmployeeDao;

@WebServlet("/createEmployeeServlet")
public class CreateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateEmployeeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		String gender = request.getParameter("gender");
		String position = request.getParameter("position");
		
		EmployeeDao employeeDao = new EmployeeDao();
		employeeDao.insertEmployee(firstname,lastname,email,phonenumber,gender,position);
		response.sendRedirect("readEmployeeServlet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
