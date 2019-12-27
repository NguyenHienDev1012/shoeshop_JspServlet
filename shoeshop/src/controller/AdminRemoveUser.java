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
import db.DBConnection;

@WebServlet("/AdminRemoveUser")
public class AdminRemoveUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDaoImpl userDaoImpl = new UserDaoImpl();

	public AdminRemoveUser() {
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

		String id_user_str = request.getParameter("id_user");
		System.out.println(id_user_str);
		int id_user = Integer.parseInt(id_user_str);
		
		boolean checkAdminRemove = userDaoImpl.removeUser(conn, id_user	);
		if (checkAdminRemove) {
			ArrayList<User> listUser = (ArrayList<User>) userDaoImpl.getListUser(conn);
			request.setAttribute("listUser", listUser);
			request.setAttribute("messageAdminActionUser", "Xóa thành công!");
			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/listuser.jsp");
			rd.forward(request, response);

		} 
	    else{
	    	ArrayList<User> listUser=(ArrayList<User>) userDaoImpl.getListUser(conn);
			request.setAttribute("listUser", listUser);
	    	request.setAttribute("messageAdminActionUser", "Xóa thất bại, hãy thử lại!");
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
