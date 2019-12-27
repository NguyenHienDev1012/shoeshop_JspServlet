package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

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

@WebServlet("/AdminEditInforUser")
public class AdminEditInforUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDaoImpl userDaoImpl=new UserDaoImpl();
	
    public AdminEditInforUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		String id_user_str=request.getParameter("id_user");
		int id_user=Integer.parseInt(id_user_str);
	    User user=userDaoImpl.getUser(conn, id_user);
	    request.setAttribute("user", user);
		RequestDispatcher rd=request.getRequestDispatcher("View/Admin/edituser.jsp");
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
		String id_user_str=request.getParameter("id_user_str");   
		int id_user=Integer.parseInt(id_user_str);
	    String username= request.getParameter("username");
	    String email =request.getParameter("email");
	    String password=request.getParameter("password");
	    String passwordMd5=userDaoImpl.getMD5(password);
	    String role_str=request.getParameter("role");
	    int role=Integer.parseInt(role_str);
	    
	    
	    User user=new User(id_user, username, email, passwordMd5, role);
	    System.out.println(user);
	    boolean checkAdminUpdate=userDaoImpl.updateUser(conn, user);
	    if(checkAdminUpdate){
	    	ArrayList<User> listUser=(ArrayList<User>) userDaoImpl.getListUser(conn);
			request.setAttribute("listUser", listUser);
	    	request.setAttribute("messageAdminActionUser", "Sửa thành công!");
	    	RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listuser.jsp");
			rd.forward(request, response);
	    	
	    }
	    
	    else{
	    	ArrayList<User> listUser=(ArrayList<User>) userDaoImpl.getListUser(conn);
			request.setAttribute("listUser", listUser);
	    	request.setAttribute("messageAdminActionUser", "Sửa thất bại, hãy thử lại!");
	    	RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listuser.jsp");
			rd.forward(request, response);
	    	
	    }
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.pool.releaseConnection(conn);
		}
	    
	}

}
