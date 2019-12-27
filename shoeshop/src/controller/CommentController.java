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

import dao.CommentDaoImpl;
import dao.ProductDaoImpl;
import db.DBConnection;
import bean.Comment;
import bean.Product;
import bean.ReplyComment;

@WebServlet("/CommentController")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDaoImpl productDaoImpl=new ProductDaoImpl();

	CommentDaoImpl commentDaoImpl=new CommentDaoImpl();
    public CommentController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		HttpSession session=request.getSession();
		String name= (String) session.getAttribute("sessionName");
		String content=request.getParameter("content");
		String id_product_str=request.getParameter("id_Product");
		int id_product=Integer.parseInt(id_product_str);
		Comment cmt=new Comment(name, content, id_product);
		
		ArrayList<ReplyComment> listReply=(ArrayList<ReplyComment>) commentDaoImpl.getListReply(conn);

		boolean checkInsertComment= commentDaoImpl.comment(conn, cmt);
		if(checkInsertComment){
			Product product=productDaoImpl.getProductById(conn, id_product);
			request.setAttribute("product",product);
	        ArrayList<Comment> listComment=(ArrayList<Comment>) commentDaoImpl.getListComment(conn,id_product);
			
			for (int i = 0; i < listComment.size(); i++) {
				Comment comment=listComment.get(i);
				for (int j = 0; j < listReply.size(); j++) {
					if(comment.getId()==listReply.get(j).getCmt().getId()){
						comment.getListReplyComment().add(listReply.get(j));
					}
					
				}
				
			}
			for (int i = 0; i < listComment.size(); i++) {
				Comment comment=listComment.get(i);
				for (int j = 0; j < listReply.size(); j++) {
					if(comment.getId()==listReply.get(j).getCmt().getId()){
						comment.getListReplyComment().add(listReply.get(j));
					}
					
				}
				
			}
			request.setAttribute("listComment", listComment);
			RequestDispatcher rd=request.getRequestDispatcher("View/single-product.jsp");
			rd.forward(request, response);
	    	
		}else{
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
