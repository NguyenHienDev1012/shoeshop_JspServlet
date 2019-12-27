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

import com.mysql.jdbc.Connection;

import bean.Bill;
import bean.Item;
import bean.User;
import dao.BillDaoImpl;
import db.DBConnection;

@WebServlet("/AdminManageListBill")
public class AdminManageListBill extends HttpServlet {
	private static final long serialVersionUID = 1L;
       BillDaoImpl billDaoImpl = new BillDaoImpl();
    public AdminManageListBill() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		ArrayList<Bill> listBill=(ArrayList<Bill>) billDaoImpl.getListBill(conn);
		for (int i = 0; i < listBill.size(); i++) {
			int  id_Bill =listBill.get(i).getiDBill();
			listBill.get(i).setListItemInBill((ArrayList<Item>) billDaoImpl.getListItemBillDetails(conn, id_Bill));
		}
		System.out.println("List Bill Manage"+listBill);
		request.setAttribute("listBill", listBill);
		RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listbill.jsp");
		rd.forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.pool.releaseConnection(conn);
		}
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
