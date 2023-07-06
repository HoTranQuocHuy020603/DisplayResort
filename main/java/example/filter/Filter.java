package example.filter;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.model.Account;

@WebFilter("/Filter")
public class Filter implements javax.servlet.Filter {

    public Filter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		String url = request.getServletPath();
		if (url.startsWith("/readAccountServlet") || url.startsWith("/readEmployeeServlet")
				|| url.startsWith("/readCustomerServlet") || url.startsWith("/readContractServlet")
			|| url.startsWith("/updateAccountServlet") || url.startsWith("/updateEmployeeServlet")
				|| url.startsWith("/updateCustomerServlet") || url.startsWith("/updateContractServlet")) {
			
			Account acc = (Account) request.getSession().getAttribute("username");
			
			if (acc != null) {
				if (url.startsWith("/readAccountServlet") 
						&& acc.getIsAdmin() == false) {
					
					response.sendRedirect("404.jsp");	
				
				}else if (url.startsWith("/updateAccountServlet") 
						&& acc.getIsAdmin() == false) {
					
					response.sendRedirect("404.jsp");	
				
				}else if (url.startsWith("/updateContractServlet") 
						&& acc.getIsEmployee() == false) {
					
					response.sendRedirect("404.jsp");
				}else {
					chain.doFilter(servletRequest, servletResponse);
				}
			} else {
				response.sendRedirect("404.jsp");
			}
		} else if (url.startsWith("/pages")) {
			Account user = (Account) request.getSession().getAttribute("username");
			if (user != null) {

                if (url.startsWith("/pages/account")&& user.getIsAdmin() == false) {
					
					response.sendRedirect("../../404.jsp");
					
				}else {
					chain.doFilter(servletRequest, servletResponse);
				}
			} 
			else {
				response.sendRedirect("../../404.jsp");
			}
		} else if (url.startsWith("contact.jsp")) {
			Account user = (Account) request.getSession().getAttribute("username");
			if (user != null) {
              	chain.doFilter(servletRequest, servletResponse);
			} 
			else {
				response.sendRedirect("404.jsp");
			}
		}else {
			chain.doFilter(servletRequest, servletResponse);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
