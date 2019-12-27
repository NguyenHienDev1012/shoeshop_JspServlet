package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Product;

import com.mysql.jdbc.Connection;

import dao.ProductDaoImpl;
import db.DBConnection;

@WebServlet("/SearchProductByNameController")
public class SearchProductByNameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDaoImpl productDaoImpl=new ProductDaoImpl();

    public SearchProductByNameController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		
		String nameProduct=request.getParameter("name_Product").trim();
		ArrayList<Product> listproductSearchByName=(ArrayList<Product>) productDaoImpl.searchProductByName(conn, nameProduct, request);
		ServletContext context=request.getServletContext();
		context.setAttribute("listproductSearchByName", listproductSearchByName);
		RequestDispatcher rd=request.getRequestDispatcher("View/displaySearch.jsp");
		rd.forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
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
