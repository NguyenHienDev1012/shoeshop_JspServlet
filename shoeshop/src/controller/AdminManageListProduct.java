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

import bean.Category;
import bean.Product;

import com.mysql.jdbc.Connection;

import dao.ProductDaoImpl;
import db.DBConnection;

@WebServlet("/AdminManageListProduct")
public class AdminManageListProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDaoImpl productDaoImpl=new ProductDaoImpl();
       
    public AdminManageListProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		ArrayList<Product> listProduct =(ArrayList<Product>) productDaoImpl.getList(conn);
		request.setAttribute("listProduct", listProduct);
		RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listproduct.jsp");
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
		doGet(request, response);
	}

}
