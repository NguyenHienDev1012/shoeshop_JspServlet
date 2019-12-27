package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Item;

@WebServlet("/UpdateCartController")
public class UpdateCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateCartController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String id_product_str=request.getParameter("id_product");
		int id_product=Integer.parseInt(id_product_str);
		String quantity_str=request.getParameter("quantity");
		int quantity=Integer.parseInt(quantity_str);
		ArrayList<Item> listItem = (ArrayList<Item>)session.getAttribute("order");
	    for(Item  item: listItem){
	    	if(item.getProduct().getId()==id_product){
	    		item.setQuantity(quantity);
	    	}
	    }
		RequestDispatcher rd = request.getRequestDispatcher("View/cart.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
