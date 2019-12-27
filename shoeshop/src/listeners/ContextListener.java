package listeners;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

import com.mysql.jdbc.Connection;

import bean.Product;
import dao.ProductDaoImpl;
import db.DBConnection;

public final class ContextListener implements ServletContextListener {
	private ServletContext context = null;
	ProductDaoImpl productDaoImpl=new ProductDaoImpl();
	HttpServletRequest request;

	public void contextInitialized(ServletContextEvent event) {
		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		context = event.getServletContext();

		try {
	    	ArrayList<Product> listProductPagination=(ArrayList<Product>) productDaoImpl.listProductPagination(conn,1,8, request);
			context.setAttribute("listProducts", listProductPagination);
		} catch (Exception ex) {
			System.out.println("Couldn't create list products: "
					+ ex.getMessage());
		}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.pool.releaseConnection(conn);
			
		}
	}

	public void contextDestroyed(ServletContextEvent event) {
		context = event.getServletContext();

		ArrayList<Product> listProductPagination = (ArrayList<Product>) context.getAttribute("listProducts");

		if (listProductPagination != null) {
			listProductPagination.removeAll(listProductPagination);
		}
    	context.removeAttribute("listProducts");
	}
}
