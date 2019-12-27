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

import bean.Product;
import bean.User;
import dao.ProductDaoImpl;
import dao.UserDaoImpl;
import db.DBConnection;

@WebServlet("/UserTymController")
public class UserTymController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDaoImpl userDaoImpl = new UserDaoImpl();
	ProductDaoImpl productDaoImpl = new ProductDaoImpl();
    public UserTymController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
	    HttpSession session = request.getSession();
	    String username = (String) session.getAttribute("sessionName");
	    String id_product_str = request.getParameter("id_Product");
	    int id_product = Integer.parseInt(id_product_str);
	    Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
	    User user = userDaoImpl.getUser(conn, username);
	    int id_user = user.getId();
	    boolean check=false;
    	ArrayList<Integer> list_id_product_user_tym_tocheck_exists = userDaoImpl.getIdProductHeart(conn, id_user);
	    	for (int i = 0; i < list_id_product_user_tym_tocheck_exists.size(); i++) {
	    	  if(list_id_product_user_tym_tocheck_exists.get(i)==id_product){
	    		 ArrayList<Product> listProducts=(ArrayList<Product>) productDaoImpl.getList(conn);
	  			 request.setAttribute("listProducts", listProducts);
	    		 RequestDispatcher rd=request.getRequestDispatcher("View/category.jsp"); //category
	 		     rd.forward(request, response);
	 		     return;
	    	  }
		  }
	    check = userDaoImpl.dropHeart(conn, id_user, id_product);
	    if(check){
	    	Product product = null;
	    	ArrayList<Product> list_product_user_tym = new ArrayList<Product>();
	    	ArrayList<Integer> list_id_product_user_tym = userDaoImpl.getIdProductHeart(conn, id_user);
	    	for (Integer id_product_tym : list_id_product_user_tym) {
				product = productDaoImpl.getProductById(conn, id_product_tym);
				list_product_user_tym.add(product);
				System.out.println(list_product_user_tym.toString());
			}
	    	
	    	request.setAttribute("list_product_user_tym", list_product_user_tym);
	    	RequestDispatcher rd=request.getRequestDispatcher("View/mytymproduct.jsp"); //category
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
