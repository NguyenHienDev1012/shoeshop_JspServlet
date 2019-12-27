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

import bean.Comment;
import bean.User;
import dao.CommentDaoImpl;
import db.DBConnection;

@WebServlet("/AdminRemoveComment")
public class AdminRemoveComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommentDaoImpl commentDaoImpl = new CommentDaoImpl();
       
    public AdminRemoveComment() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		String id_comment_str = request.getParameter("id_comment");
		int id_cmt = Integer.parseInt(id_comment_str);
		
		boolean checkAdminRemove = commentDaoImpl.removeComment(conn, id_cmt);
		if(checkAdminRemove){
//			ArrayList<User> listUser = (ArrayList<User>) userDaoImpl.getListUser(conn);
//			request.setAttribute("listUser", listUser);
//			request.setAttribute("messageAdminActionUser", "Xóa thành công!");
//			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/listuser.jsp");
//			rd.forward(request, response);
			ArrayList<Comment> listComment = (ArrayList<Comment>) commentDaoImpl.getListComment(conn);
			request.setAttribute("listComment", listComment);
			request.setAttribute("messageAdminActionComment","Xóa thành công!");
			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/listcomment.jsp");
			rd.forward(request, response);
		}
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
