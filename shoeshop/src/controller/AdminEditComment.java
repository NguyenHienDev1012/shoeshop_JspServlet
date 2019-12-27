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

import bean.Category;
import bean.Comment;
import bean.Product;
import dao.CommentDaoImpl;
import db.DBConnection;

@WebServlet("/AdminEditComment")
public class AdminEditComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommentDaoImpl commentDaoImpl = new CommentDaoImpl();

	public AdminEditComment() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String id_comment_str = request.getParameter("id_comment");
		int id_cmt = Integer.parseInt(id_comment_str);
		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		
		
		Comment comment = (Comment) commentDaoImpl.getComment(conn, id_cmt);
		request.setAttribute("comment", comment);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/editcomment.jsp");
		rd.forward(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		HttpSession session = request.getSession(true);

		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		
		String id_cmt_str = request.getParameter("id_comment");
		int id_cmt = Integer.parseInt(id_cmt_str);
		
		String name_user = request.getParameter("name_user");
		
		String id_product_str = request.getParameter("id_product");
		int id_product = Integer.parseInt(id_product_str);
		
		String content = request.getParameter("content");
		
		Comment comment = new Comment(id_cmt, name_user, content, id_product);
		
		boolean checkUpdateComment = commentDaoImpl.updateComment(conn, comment);
		if(checkUpdateComment){
			ArrayList<Comment> listComment=(ArrayList<Comment>)commentDaoImpl.getListComment(conn);
			request.setAttribute("listComment", listComment);
	    	request.setAttribute("messageAdminActionComment", "Sửa thành công!");
	    	RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listcomment.jsp");
			rd.forward(request, response);
		}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.pool.releaseConnection(conn);
		}
		
	}

}
