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
import javax.servlet.http.HttpSession;

import bean.Category;

import com.mysql.jdbc.Connection;

import dao.CategoryImpl;
import db.DBConnection;
@WebServlet("/AdminManageListCategory")
public class AdminManageListCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryImpl categoryDaoImpl = new CategoryImpl();
	
    public AdminManageListCategory() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		HttpSession session = request.getSession(true);
		ArrayList<Category> listCategory =(ArrayList<Category>) categoryDaoImpl.getList(conn);
		session.setAttribute("listCategory", listCategory);
		RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listcategory.jsp");
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
