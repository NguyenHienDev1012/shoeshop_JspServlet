package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Product;

import com.mysql.jdbc.Connection;

import dao.ProductDaoImpl;
import dao.UserDaoImpl;
import db.DBConnection;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDaoImpl userDaoImpl=new UserDaoImpl();
	ProductDaoImpl productDaoImpl=new ProductDaoImpl();

    public LoginController() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		RequestDispatcher rd=request.getRequestDispatcher("View/login.jsp");
		rd.forward(request, response);
		
	}

	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String passwordMd5=userDaoImpl.getMD5(password);
		
		boolean checkLogin=userDaoImpl.login(conn, username, passwordMd5);
		if(checkLogin){
			int authorization=userDaoImpl.authorization(conn, username, passwordMd5);
			if (authorization == 2) {
				HttpSession session = request.getSession(true);
				session.setAttribute("sessionAdmin", username);
				String encodeUrl=response.encodeRedirectURL("View/Admin/statistic.jsp");
				session.setMaxInactiveInterval(60*15);
				RequestDispatcher rd = request.getRequestDispatcher(encodeUrl);
				rd.forward(request, response);

			}
		 if(authorization==1){
				HttpSession session = request.getSession(true);
				System.out.println(request.getSession().getId());
				session.setAttribute("sessionName", username);
				Cookie cookies = new Cookie("JSESSIONID", session.getId());
				cookies.setMaxAge(Integer.MAX_VALUE);
				response.addCookie(cookies);
			    session.setMaxInactiveInterval(60*15);
				

			    String pageidstr=request.getParameter("pageid");
			    if(pageidstr!=null){
			    int pageid=Integer.parseInt(pageidstr);
			    request.setAttribute("pageidnumber",pageid);

				int count =8;
				if(pageid==1) {}
				else {
					pageid = pageid - 1;
					pageid = pageid * count+1;
				}
				
				ArrayList<Product> listProductPagination=(ArrayList<Product>) productDaoImpl.listProductPagination(conn, pageid, count, request);
				request.setAttribute("listProducts", listProductPagination);
				String encodeUrl=response.encodeRedirectURL("View/home.jsp");
				RequestDispatcher rq=request.getRequestDispatcher(encodeUrl);
				rq.forward(request, response);
			    }
			    else{
			    	ArrayList<Product> listProductPagination=(ArrayList<Product>) productDaoImpl.listProductPagination(conn,1,8, request);
			    	request.setAttribute("listProducts", listProductPagination);
			    	String encodeUrl=response.encodeRedirectURL("View/home.jsp");
					RequestDispatcher rq=request.getRequestDispatcher(encodeUrl);
					rq.forward(request, response);
			    }
			}
			
			
			
		}
		else{
			request.setAttribute("messagelogin", "Sai tên đăng nhập hoặc mật khẩu.");
			RequestDispatcher rq=request.getRequestDispatcher("View/login.jsp");
			rq.forward(request, response);
			
		}
		
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		catch (RuntimeException e) {
			response.sendRedirect("View/outofconnectionpool.jsp");
	    }
		finally {
			DBConnection.pool.releaseConnection(conn);
		}
		
	}

}
