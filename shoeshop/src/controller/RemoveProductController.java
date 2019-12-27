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

import bean.Item;
import bean.Product;

import com.mysql.jdbc.Connection;

import dao.CartDaoImpl;
import dao.ProductDaoImpl;
import db.DBConnection;

@WebServlet("/RemoveProductController")
public class RemoveProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CartDaoImpl cartDaoImpl = new CartDaoImpl();
       
    public RemoveProductController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		Connection conn=null;
		try {
			conn = (Connection) db.DBConnection.createConnection();

		String id_product_str = request.getParameter("id_product");
		int id_product = Integer.parseInt(id_product_str);
		HttpSession session=request.getSession(true);
		ArrayList<Item> listProductInCart = (ArrayList<Item>) session.getAttribute("order");
		boolean checkRemove = cartDaoImpl.removeProductOutCart(listProductInCart, id_product);
		if (checkRemove) {
			session.setAttribute("order", listProductInCart);
			RequestDispatcher rd = request.getRequestDispatcher("View/cart.jsp");
			rd.forward(request, response);

		} 
	    else{
	    	RequestDispatcher rd=request.getRequestDispatcher("View/cart.jsp");
			rd.forward(request, response);
	    }
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

		
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
