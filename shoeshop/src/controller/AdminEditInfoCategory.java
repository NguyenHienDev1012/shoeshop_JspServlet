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
import bean.User;

import com.mysql.jdbc.Connection;

import dao.CategoryImpl;
import db.DBConnection;

@WebServlet("/AdminEditInfoCategory")
public class AdminEditInfoCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryImpl categoryDaoImpl = new CategoryImpl();

    public AdminEditInfoCategory() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String id_category_str = request.getParameter("id_category");
		int id_category = Integer.parseInt(id_category_str);
		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		Category category = categoryDaoImpl.getCategory(conn, id_category);
		request.setAttribute("category", category);
		RequestDispatcher rd=request.getRequestDispatcher("View/Admin/editcategory.jsp");
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
	    HttpSession session=request.getSession(true);
	    
	    Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
	    String id_category_str = request.getParameter("id_category");
		int id_category = Integer.parseInt(id_category_str);
		String name_category = request.getParameter("name_category");
		String description_category = request.getParameter("description_category");
		
		Category category=new Category(id_category, name_category, description_category);
		boolean checkAdminUpdateCategory=categoryDaoImpl.updateCategory(conn, category);
		if(checkAdminUpdateCategory){
			
			ArrayList<Category> listCategory=(ArrayList<Category>) categoryDaoImpl.getList(conn);
			session.setAttribute("listCategory", listCategory);
	    	request.setAttribute("messageAdminActionCategory", "Sửa thành công!");
	    	RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listcategory.jsp");
			rd.forward(request, response);
	    	
	    }
	    
	    else{

			ArrayList<Category> listCategory=(ArrayList<Category>) categoryDaoImpl.getList(conn);
			session.setAttribute("listCategory", listCategory);
	    	request.setAttribute("messageAdminActionCategory", "Sửa thất bại, hãy thử lại!");
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

}
