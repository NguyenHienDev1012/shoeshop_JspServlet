package bean;

public class ReplyComment {
	private int id;
	private Comment cmt;
	
	
	public ReplyComment(int id, Comment cmt) {
		this.id = id;
		this.cmt = cmt;
	}
	public ReplyComment(Comment cmt) {
		this.cmt = cmt;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Comment getCmt() {
		return cmt;
	}
	public void setCmt(Comment cmt) {
		this.cmt = cmt;
	}
	@Override
	public String toString() {
		return "ReplyComment [id=" + id + ", cmt=" + cmt + "]";
	}
	

}
