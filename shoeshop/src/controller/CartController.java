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


@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ProductDaoImpl productDaoImpl=new ProductDaoImpl();
    CartDaoImpl cartDaoImpl=new CartDaoImpl();

    
    public CartController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		  int quantity=1;
		  int id_Product =Integer.parseInt(request.getParameter("id_Product"));
	      
          Connection conn = null;
		try {
			conn = (Connection)db.DBConnection.createConnection();
          Product product=productDaoImpl.getProductById(conn, id_Product);
          
          ArrayList<Product> listProducts=(ArrayList<Product>) productDaoImpl.getList(conn);

          if(session.getAttribute("order")==null){
        	  ArrayList<Item> listProductsInCart=new ArrayList<>();
        	  listProductsInCart.add(new Item(product, quantity));
        	  session.setAttribute("order",listProductsInCart);
        	  RequestDispatcher rd=request.getRequestDispatcher("View/cart.jsp");
      		  rd.forward(request, response);
          }
          
          else{
        	 ArrayList<Item> listProductsInCart=(ArrayList<Item>)session.getAttribute("order");
        	 boolean addStatus=cartDaoImpl.addProductInCart(listProducts,listProductsInCart, id_Product);
        	 if(addStatus){
        		 RequestDispatcher rd=request.getRequestDispatcher("View/cart.jsp");
        	     rd.forward(request, response);
        		 
        	 }
        	 else{
        		 RequestDispatcher rd=request.getRequestDispatcher("View/cart.jsp");
        	     rd.forward(request, response);
        		 
        	 }
        	  
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
