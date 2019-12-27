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
import dao.CommentDaoImpl;
import db.DBConnection;

@WebServlet("/AdminManageListComment")
public class AdminManageListComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommentDaoImpl commentDaoImpl = new CommentDaoImpl();
    public AdminManageListComment() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		ArrayList<Comment> listComment = (ArrayList<Comment>) commentDaoImpl.getListComment(conn);
		request.setAttribute("listComment", listComment);
		RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listcomment.jsp");
		rd.forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.pool.releaseConnection(conn);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		
		
	}

}
