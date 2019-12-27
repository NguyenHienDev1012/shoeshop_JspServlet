package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Comment;
import bean.Product;
import bean.ReplyComment;
import bean.User;

import com.mysql.jdbc.Connection;

public class CommentDaoImpl implements CommentDao {
	@Override
	public boolean comment(Connection conn, Comment cmt) {
		PreparedStatement ptmt = null;
		String sql = "insert comment (id_comment, name, content, id_product) values (?,?,?,?)";
		try {
			ptmt = conn.prepareStatement(sql);
			int id_comment = cmt.getId();
			String name = cmt.getName();
			String content = cmt.getContent();
			int id_product = cmt.getId_product();
			ptmt.setInt(1, id_comment);
			ptmt.setString(2, name);
			ptmt.setString(3, content);
			ptmt.setInt(4, id_product);
			int kt = ptmt.executeUpdate();
			if (kt != 0) {
				return true;
			}
			ptmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Comment> getListComment(Connection conn, int id_product) {
		PreparedStatement ptmt = null;
		String sql = "select * from comment where id_product=" + id_product;
		ArrayList<Comment> listComment = new ArrayList<>();
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Comment cmt = new Comment(rs.getInt("id_comment"), rs.getString("name"), rs.getString("content"),
						rs.getInt("id_product"));
				listComment.add(cmt);
			}
			rs.close();
			ptmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listComment;
	}

	@Override
	public boolean replyComment(Connection conn, ReplyComment replycmt) {
		PreparedStatement ptmt = null;
		String sql = "insert replycomment (id_comment, name, content) values (?,?,?)";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, replycmt.getCmt().getId());
			ptmt.setString(2, replycmt.getCmt().getName());
			ptmt.setString(3, replycmt.getCmt().getContent());
			int kt = ptmt.executeUpdate();
			if (kt != 0) {
				return true;
			}
			ptmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<ReplyComment> getListReply(Connection conn, int id_cmt) {
		PreparedStatement ptmt = null;
		String sql = "select * from replycomment where id_comment=" + id_cmt;
		ArrayList<ReplyComment> listReplyComment = new ArrayList<>();
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Comment cmt = new Comment(rs.getInt("id_comment"), rs.getString("name"), rs.getString("content"));
				ReplyComment repcmt = new ReplyComment(rs.getInt("id_reply_comment"), cmt);
				listReplyComment.add(repcmt);
			}
			rs.close();
			ptmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listReplyComment;
	}

	@Override
	public List<ReplyComment> getListReply(Connection conn) {
		PreparedStatement ptmt = null;
		String sql = "select * from replycomment";
		ArrayList<ReplyComment> listReplyComment = new ArrayList<>();
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Comment cmt = new Comment(rs.getInt("id_comment"), rs.getString("name"), rs.getString("content"));
				ReplyComment repcmt = new ReplyComment(rs.getInt("id_reply_comment"), cmt);
				listReplyComment.add(repcmt);
			}
			rs.close();
			ptmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listReplyComment;
	}

	@Override
	public List<Comment> getListComment(Connection conn) {
		PreparedStatement ptmt = null;
		String sql = "select * from comment";
		ArrayList<Comment> listComment = new ArrayList<>();
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Comment cmt = new Comment(rs.getInt("id_comment"), rs.getString("name"), rs.getString("content"),
						rs.getInt("id_product"));
				listComment.add(cmt);
			}
			rs.close();
			ptmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listComment;
	}

	@Override
	public boolean removeComment(Connection conn, int id_cmt) {
		PreparedStatement ptmt = null;
		String sql = "delete from comment where id_comment='" + id_cmt + "'";
		try {
			ptmt = conn.prepareStatement(sql);
			int kt = ptmt.executeUpdate();
			if (kt != 0) {
				return true;
			}
			ptmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Comment> getListCommen(Connection conn, int id_cmt) {
		PreparedStatement ptmt = null;
		String sql = "select * from comment where id_comment=" + id_cmt;
		ArrayList<Comment> listComment = new ArrayList<>();
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Comment cmt = new Comment(rs.getInt("id_comment"), rs.getString("name"), rs.getString("content"),
						rs.getInt("id_product"));
				listComment.add(cmt);
			}
			rs.close();
			ptmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listComment;
	}

	@Override
	public boolean updateComment(Connection conn, Comment cmt) {
		PreparedStatement ptmt = null;
		String sql = "update comment set id_comment=?, name=?, content=? , id_product=? where id_comment='" + cmt.getId() + "'";
		try {
			ptmt = conn.prepareStatement(sql);
			int id_cmt = cmt.getId();
			String name = cmt.getName();
			String description = cmt.getContent();
			int id_product = cmt.getId_product();
			ptmt.setInt(1, id_cmt);
			ptmt.setString(2, name);
			ptmt.setString(3, description);
			ptmt.setInt(4, id_product);
			int kt = ptmt.executeUpdate();
			if (kt != 0) {
				return true;
			}
			ptmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Comment getComment(Connection conn, int id_cmt) {
		String sql = "select * from comment where id_comment='" + id_cmt + "'";
		Comment comment = null;
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			if (rs.next()) {
				comment = new Comment(rs.getInt("id_comment"), rs.getString("name"), rs.getString("content"), rs.getInt("id_product"));
			}

			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return comment;
	}

}
