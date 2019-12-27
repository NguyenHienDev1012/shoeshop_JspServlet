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

import bean.Item;
import bean.Product;
import bean.User;
import dao.ProductDaoImpl;
import dao.UserDaoImpl;
import db.DBConnection;

@WebServlet("/RemoveProductDropHeart")
public class RemoveProductDropHeart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDaoImpl userDaoImpl=new UserDaoImpl();
	ProductDaoImpl productDaoImpl = new ProductDaoImpl();
       
    public RemoveProductDropHeart() {
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

		String id_product_tym_str = request.getParameter("id_product_tym");
		int id_product_tym = Integer.parseInt(id_product_tym_str );
		boolean checkRemove = userDaoImpl.removeProductUserDropHeart(conn, id_product_tym);
		if (checkRemove) {
			 HttpSession session = request.getSession();
			 String username = (String) session.getAttribute("sessionName");
			 User user = userDaoImpl.getUser(conn, username);
			 int id_user = user.getId();
			    Product product = null;
		    	ArrayList<Product> list_product_user_tym = new ArrayList<Product>();
		    	ArrayList<Integer> list_id_product_user_tym = userDaoImpl.getIdProductHeart(conn, id_user);
		    	for (Integer id_product_user_tym : list_id_product_user_tym) {
					product = productDaoImpl.getProductById(conn, id_product_user_tym);
					list_product_user_tym.add(product);
					System.out.println(list_product_user_tym.toString());
				}
			request.setAttribute("list_product_user_tym", list_product_user_tym);
			RequestDispatcher rd = request.getRequestDispatcher("View/mytymproduct.jsp");
			rd.forward(request, response);

		} 
	    else{
	    	RequestDispatcher rd=request.getRequestDispatcher("View/home.jsp");
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
