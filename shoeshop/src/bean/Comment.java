package bean;

import java.util.ArrayList;

public class Comment {
	    private int id;
	    private String name;
	    private String content;
	    private int id_product;
    private ArrayList<ReplyComment> listReplyComment=new ArrayList<>();
    
	public Comment(int id, String name, String content, int id_product) {
		this.id = id;
		this.name = name;
		this.content = content;
		this.id_product = id_product;
	}
	public Comment(String name, String content, int id_product) {
		this.name = name;
		this.content = content;
		this.id_product = id_product;
	}
	public Comment(int id, String name, String content) {
		this.id = id;
		this.name = name;
		this.content = content;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
	public ArrayList<ReplyComment> getListReplyComment() {
		return listReplyComment;
	}
	public void setListReplyComment(ArrayList<ReplyComment> listReplyComment) {
		this.listReplyComment = listReplyComment;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", name=" + name + ", content=" + content
				+ ", id_product=" + id_product + ", listReplyComment="
				+ listReplyComment + "]";
	}
	
    
    
}
