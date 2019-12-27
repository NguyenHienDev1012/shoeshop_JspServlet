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

import bean.Product;

import com.mysql.jdbc.Connection;

import dao.ProductDaoImpl;
import db.DBConnection;
@WebServlet("/LogoutController")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDaoImpl productDaoImpl=new ProductDaoImpl();
       
    public LogoutController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		HttpSession session=request.getSession(false);
//		session.removeAttribute("sessionName");
//		session.removeAttribute("sessionAdmin");
		session.invalidate();

	    String pageidstr=request.getParameter("pageid");
	    if(pageidstr!=null){
	    int pageid=Integer.parseInt(pageidstr);
	    request.setAttribute("pageidnumber",pageid);

		int count =8;
		if(pageid==1) {}
		else {
			pageid = pageid - 1;
			pageid = pageid * count+1;
		}
		
		ArrayList<Product> listProductPagination=(ArrayList<Product>) productDaoImpl.listProductPagination(conn, pageid, count, request);
		request.setAttribute("listProducts", listProductPagination);
		RequestDispatcher rd=request.getRequestDispatcher("View/home.jsp");
		rd.forward(request, response);
	    }
	    else{
	    	ArrayList<Product> listProductPagination=(ArrayList<Product>) productDaoImpl.listProductPagination(conn,1,8, request);
	    	request.setAttribute("listProducts", listProductPagination);
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
