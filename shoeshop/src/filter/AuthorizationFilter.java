package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthorizationFilter implements Filter{
	private ServletContext context;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context=filterConfig.getServletContext();
	}

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletRespone,
			FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)servletRequest;
		HttpServletResponse respone=(HttpServletResponse)servletRespone;
		String url=request.getRequestURI();
		HttpSession session=request.getSession();
		
		if(url.startsWith("/Admin")|| url.startsWith("/LTW/Admin")|| url.startsWith("/LTW/View/Admin")){
			String usernameAdmin=(String) session.getAttribute("sessionAdmin");
			String nameuser= (String) session.getAttribute("sessionName");
			if(usernameAdmin !=null){
				filterChain.doFilter(servletRequest, servletRespone);
			}
			else{
				if(nameuser!=null){
					request.setAttribute("nopermission", "Bạn không được phép truy cập.");
					RequestDispatcher rd=request.getRequestDispatcher("View/login.jsp");
					rd.forward(request, respone);
				}
				else{
				respone.sendRedirect("LoginController");
				}
			}
		}
		else{
			filterChain.doFilter(servletRequest, servletRespone);
		}
		
	}

}
