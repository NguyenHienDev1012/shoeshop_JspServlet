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

import com.mysql.jdbc.Connection;

import bean.User;
import dao.UserDaoImpl;

@WebServlet("/AdminAddUser")
public class AdminAddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDaoImpl userDaoImpl = new UserDaoImpl();
	public AdminAddUser() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher rd=request.getRequestDispatcher("View/Admin/adduser.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
	    Connection conn;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		
		
	    

	    String username= request.getParameter("username");
	    String email =request.getParameter("email");
	    String password=request.getParameter("password");
	    String passwordMd5=userDaoImpl.getMD5(password);
	    String role_str=request.getParameter("role");
	    int role=Integer.parseInt(role_str);
	    
	    User user=new User( username, email, passwordMd5, role);
	    boolean checkAddUser=userDaoImpl.addUser(conn, user);
	    if(checkAddUser){
	    	ArrayList<User> listUser=(ArrayList<User>) userDaoImpl.getListUser(conn);
			request.setAttribute("listUser", listUser);
	    	request.setAttribute("messageAdminActionUser", "Thêm thành công!");
	    	RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listuser.jsp");
			rd.forward(request, response);
	    	
	    }
	    
	    else{
	    	ArrayList<User> listUser=(ArrayList<User>) userDaoImpl.getListUser(conn);
	    	listUser.add(user);
			request.setAttribute("listUser", listUser);
	    	request.setAttribute("messageAdminActionUser", "Thêm thất bại, hãy thử lại!");
	    	RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listuser.jsp");
			rd.forward(request, response);
	    	
	    }
	    
	    
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    
	    
	}

}
