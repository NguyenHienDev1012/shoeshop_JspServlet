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

import bean.Comment;
import bean.Product;

import com.mysql.jdbc.Connection;

import dao.CommentDaoImpl;
import dao.ProductDaoImpl;
import db.DBConnection;

@WebServlet("/SingleProductController")
public class SingleProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDaoImpl productDaoImpl=new ProductDaoImpl();
	CommentDaoImpl commentDaoImpl=new CommentDaoImpl();

    public SingleProductController() {
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
	    String id_product_str=request.getParameter("id_Product");
     	int id_Product=Integer.parseInt(id_product_str);
	    
		Product product=productDaoImpl.getProductById(conn, id_Product);
		
		request.setAttribute("product",product);
		ArrayList<Comment> listComment=(ArrayList<Comment>) commentDaoImpl.getListComment(conn,id_Product);
		request.setAttribute("listComment", listComment);
		
	    RequestDispatcher rd=request.getRequestDispatcher("View/single-product.jsp");
		rd.forward(request,response);
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
