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

import com.mysql.jdbc.Connection;

import bean.Category;
import dao.CategoryImpl;
import db.DBConnection;

@WebServlet("/AdminAddCategory")
public class AdminAddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryImpl categoryDaoImpl = new CategoryImpl();
    public AdminAddCategory() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		RequestDispatcher rd=request.getRequestDispatcher("View/Admin/addcategory.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    HttpSession session=request.getSession(true);
	    
	    Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		String name_category = request.getParameter("name_category");
		String description_category = request.getParameter("description_category");
		
		Category category=new Category(name_category, description_category);
		boolean checkAddCategory=categoryDaoImpl.addCategory(conn, category);
		if(checkAddCategory){
			
			ArrayList<Category> listCategory=(ArrayList<Category>) categoryDaoImpl.getList(conn);
			session.setAttribute("listCategory", listCategory);
	    	request.setAttribute("messageAdminActionCategory", "Thêm thành công!");
	    	RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listcategory.jsp");
			rd.forward(request, response);
	    	
	    }
	    
	    else{

			ArrayList<Category> listCategory=(ArrayList<Category>) categoryDaoImpl.getList(conn);
			session.setAttribute("listCategory", listCategory);
	    	request.setAttribute("messageAdminActionCategory", "Thêm thất bại, hãy thử lại!");
	    	RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listcategory.jsp");
			rd.forward(request, response);
	    	
			
		}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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
