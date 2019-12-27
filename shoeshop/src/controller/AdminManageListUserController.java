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

@WebServlet("/AdminManageListUserController")
public class AdminManageListUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UserDaoImpl userDaoImpl=new UserDaoImpl();
    public AdminManageListUserController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			    
		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		ArrayList<User> listUser=(ArrayList<User>) userDaoImpl.getListUser(conn);
		request.setAttribute("listUser", listUser);
		RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listuser.jsp");
		rd.forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.pool.releaseConnection(conn);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
