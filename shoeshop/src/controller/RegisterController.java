package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;

import com.mysql.jdbc.Connection;

import dao.UserDaoImpl;
import db.DBConnection;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UserDaoImpl userDaoImpl=new UserDaoImpl();
    public RegisterController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		RequestDispatcher rd=request.getRequestDispatcher("View/register.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
	    Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
	   
	    String username= request.getParameter("name");
	    String email =request.getParameter("email");
	    String password=request.getParameter("password");
	    String passwordMd5=userDaoImpl.getMD5(password);
	    
	    User user =new User(username, email, passwordMd5, 1);
	    boolean checkexistsUser=userDaoImpl.checkExistsUser(conn,user);
	    if(checkexistsUser){
	    	request.setAttribute("messageregister", "Đã tồn tại username hoặc email! Mời đăng ký lại.");
			RequestDispatcher rq=request.getRequestDispatcher("View/register.jsp");
			rq.forward(request, response);
	    }
	    else{
	     boolean check=userDaoImpl.register(conn, user);
	  	  if(check)
	  	   {
	  	    request.setAttribute("messageregister", "Đăng ký thành công! Hãy đăng nhập ngay. ");
	  		RequestDispatcher rq=request.getRequestDispatcher("View/register.jsp");
	  		rq.forward(request, response);
	  	    }
	  	     else
	  	    {
	  		request.setAttribute("messageregister", "Đăng ký thất bại! Hãy đăng ký lại.");
	  		RequestDispatcher rq=request.getRequestDispatcher("View/register.jsp");
	  		rq.forward(request, response);
	  		
	  	    }
	    	
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
