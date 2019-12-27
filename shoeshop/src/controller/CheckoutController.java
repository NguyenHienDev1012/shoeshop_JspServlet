package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mysql.jdbc.Connection;

import bean.Bill;
import bean.Item;
import bean.Product;
import bean.User;
import dao.UserDaoImpl;
import db.DBConnection;

@WebServlet("/CheckoutController")
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDaoImpl userDaoImpl = new UserDaoImpl();
    public CheckoutController() {
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
		HttpSession session = request.getSession();
		String nameStr = (String) session.getAttribute("sessionName");
		User user = userDaoImpl.getUser(conn, nameStr);
		
		request.setAttribute("user", user);
		
		RequestDispatcher rd=request.getRequestDispatcher("View/checkout.jsp");
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		String name = request.getParameter("fullname");
		String numberPhone = request.getParameter("phonenumber");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String note = request.getParameter("notes");
		String payment_str = request.getParameter("payment");
		int payment = Integer.parseInt(payment_str);
	
		HttpSession session = request.getSession();
		Random rand=new Random();
		int idBill=rand.nextInt(500);
		ArrayList<Item> listItem = (ArrayList<Item>) session.getAttribute("order");
	    Bill bill =new Bill(idBill,name, numberPhone, email, address, note, payment, listItem);

	     System.out.println(bill.toString());
			 boolean checkInsertBill=userDaoImpl.checkout(conn, bill);
			 if(checkInsertBill){
				 session.removeAttribute("order");
				 RequestDispatcher rd=request.getRequestDispatcher("View/contact.jsp");
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

}
