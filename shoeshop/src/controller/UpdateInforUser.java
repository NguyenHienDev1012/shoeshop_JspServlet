package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;

import com.mysql.jdbc.Connection;

import dao.UserDaoImpl;
import db.DBConnection;
@WebServlet("/UpdateInforUser")
public class UpdateInforUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDaoImpl userDaoImpl=new UserDaoImpl();
    public UpdateInforUser() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
	    HttpSession session=request.getSession(true);
	    String name= (String) session.getAttribute("sessionName");
	    User u=userDaoImpl.getUser(conn, name);
	    request.setAttribute("infoToUserUpdate", u);
	    
		RequestDispatcher rd=request.getRequestDispatcher("View/editinformationuser.jsp");
		rd.forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.pool.releaseConnection(conn);
		}
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
	    
	    HttpSession session=request.getSession(true);
	    String name= (String) session.getAttribute("sessionName");
	    
	    
	    User u=userDaoImpl.getUser(conn, name);
	    // get id user to update
	    User user =new User(u.getId(),username, email, passwordMd5, 1);
	    System.out.println(user);
//	    boolean checkexistsUser=userDaoImpl.checkExistsUser(conn,user);
//	    if(checkexistsUser){
//	    	request.setAttribute("messageupdateInfo", "Đã tồn tại username hoặc email! Mời đăng ký lại.");
//			RequestDispatcher rq=request.getRequestDispatcher("View/editinformationuser.jsp");
//			rq.forward(request, response);
//	    }
//	    else{
	     boolean check=userDaoImpl. updateUser(conn, user);
	  	  if(check)
	  	   {
	  	    request.setAttribute("infoToUserUpdate", user);

	  	    request.setAttribute("messageupdateInfo", "Cập nhật thành công!");
	  		RequestDispatcher rq=request.getRequestDispatcher("View/editinformationuser.jsp");
	  		rq.forward(request, response);
	  	    }else
	  	    {
	  		request.setAttribute("messageupdateInfo", "Cập nhật thất bại. Mời bạn nhập lại.");
	  		RequestDispatcher rq=request.getRequestDispatcher("View/editinformationuser.jsp");
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
	//}
		

}
