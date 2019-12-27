package dao;

import java.util.List;
import bean.Comment;
import bean.ReplyComment;

import com.mysql.jdbc.Connection;

public interface CommentDao {
	  public boolean comment(Connection conn, Comment cmt);
	  public List<Comment> getListComment(Connection conn, int id_product);
	  public List<Comment> getListComment(Connection conn);
	  public Comment getComment(Connection conn, int id_cmt);
	  public boolean replyComment(Connection conn, ReplyComment replycmt);
	  public List<ReplyComment> getListReply(Connection conn, int id_cmt);
	  public List<ReplyComment> getListReply(Connection conn);
	  public List<Comment> getListCommen(Connection conn, int id_cmt);
	  public boolean removeComment(Connection conn, int id_cmt);
	  public boolean updateComment(Connection conn, Comment cmt);

}
