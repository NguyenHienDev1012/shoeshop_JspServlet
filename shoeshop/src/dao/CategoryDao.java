package dao;

import java.util.List;

import com.mysql.jdbc.Connection;

import bean.Category;
public interface CategoryDao {
	public List<Category> getList(Connection conn);
	public Category getCategory(Connection conn,int id_category);
    public boolean updateCategory(Connection conn,Category category);
	public boolean removeCategory(Connection conn, int id_category);
	public boolean addCategory(Connection conn, Category category);
	

}
