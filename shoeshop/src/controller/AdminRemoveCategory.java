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

import bean.Category;
import bean.Product;
import dao.CategoryDao;
import dao.CategoryImpl;
import db.DBConnection;

@WebServlet("/AdminRemoveCategory")
public class AdminRemoveCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryImpl categoryDaoImpl = new CategoryImpl();
	public AdminRemoveCategory() {
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

			String id_category_str = request.getParameter("id_category");
			int id_category = Integer.parseInt(id_category_str);
			
			boolean checkAdminRemove = categoryDaoImpl.removeCategory(conn, id_category);
			if (checkAdminRemove) {
				ArrayList<Category> listCategory = (ArrayList<Category>) categoryDaoImpl.getList(conn);
				request.setAttribute("listCategory", listCategory);
				request.setAttribute("messageAdminActionCategory", "Xóa thành công!");
				RequestDispatcher rd = request.getRequestDispatcher("View/Admin/listcategory.jsp");
				rd.forward(request, response);

			} 
		    else{
		    	ArrayList<Category> listCategory=(ArrayList<Category>) categoryDaoImpl.getList(conn);
				request.setAttribute("listCategory", listCategory);
		    	request.setAttribute("messageAdminActionCategory", "Xóa thất bại, hãy thử lại!");
		    	RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listcategory.jsp");
				rd.forward(request, response);
		    }
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			finally {
				DBConnection.pool.releaseConnection(conn);
			}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
