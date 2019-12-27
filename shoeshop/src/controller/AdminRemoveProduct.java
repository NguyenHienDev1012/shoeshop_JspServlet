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

import bean.Product;
import bean.User;
import dao.ProductDaoImpl;
import db.DBConnection;

@WebServlet("/AdminRemoveProduct")
public class AdminRemoveProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDaoImpl productDaoImpl = new ProductDaoImpl();
       
    public AdminRemoveProduct() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();

		String id_product_str = request.getParameter("id_product");
		int id_product = Integer.parseInt(id_product_str);
		
		boolean checkAdminRemove = productDaoImpl.removeProduct(conn, id_product);
		if (checkAdminRemove) {
			ArrayList<Product> listProduct = (ArrayList<Product>) productDaoImpl.getList(conn);
			request.setAttribute("listProduct", listProduct);
			request.setAttribute("messageAdminActionProduct", "Xóa thành công!");
			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/listproduct.jsp");
			rd.forward(request, response);

		} 
	    else{
	    	ArrayList<Product> listProduct=(ArrayList<Product>) productDaoImpl.getList(conn);
			request.setAttribute("listProduct", listProduct);
	    	request.setAttribute("messageAdminActionProduct", "Xóa thất bại, hãy thử lại!");
	    	RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listproduct.jsp");
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
