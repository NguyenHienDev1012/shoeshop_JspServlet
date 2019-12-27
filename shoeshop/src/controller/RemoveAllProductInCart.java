package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/RemoveAllProductInCart")
public class RemoveAllProductInCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RemoveAllProductInCart() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session = request.getSession(true);
	session.removeAttribute("order");
	RequestDispatcher rd=request.getRequestDispatcher("View/cart.jsp");
	rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
