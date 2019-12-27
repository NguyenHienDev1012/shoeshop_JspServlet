package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

import bean.Category;
import bean.Product;

public class CategoryImpl implements CategoryDao{

	@Override
	public List<Category> getList(Connection conn) {
		ArrayList<Category> listCategorys=new ArrayList<>();
		String sql="select * from category";
		
		try {
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ResultSet rs=ptmt.executeQuery();
			while(rs.next()){
			int id=rs.getInt("id");
			String name=rs.getString("name");
			String description=rs.getString("description");
			Category category=new Category(id, name, description);
			listCategorys.add(category);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		return listCategorys;
	}

	@Override
	public Category getCategory(Connection conn,int id_category) {
		String sql="select * from category where id='"+id_category+"'";
		Category category=new Category();
		try {
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ResultSet rs=ptmt.executeQuery();
			while(rs.next()){
				int id=rs.getInt("id");
				String name=rs.getString("name");
				String description=rs.getString("description");
 				category.setId(id);
 				category.setName(name);
 				category.setDescription(description);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		return category ;
	}

	@Override
	public boolean updateCategory(Connection conn, Category category) {
		PreparedStatement ptmt = null;
		  String sql="update category set id=?, name=?, description=? where id='"+category.getId()+"'";
		try {
			ptmt       = conn.prepareStatement(sql);
			int id     =category.getId();
			String name = category.getName();
			String description = category.getDescription();
			ptmt.setInt(1,id);
			ptmt.setString(2, name);
			ptmt.setString(3, description);
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
	
//	public static void main(String[] args) {
//		Connection conn=(Connection) db.DBConnection.createConnection();
//		CategoryImpl cate=new CategoryImpl();
////		ArrayList<Category> list=(ArrayList<Category>) cate.getList(conn);
////		for (int i = 0; i < list.size(); i++) {
////			System.out.println(list.get(i));
////		}
//		System.out.println(cate.getCategory(conn, 2)); 
//		ProductDaoImpl p=new ProductDaoImpl();
//		System.out.println(p.getList(conn));
//		
//	}

	@Override
	public boolean removeCategory(Connection conn, int id_category) {

		PreparedStatement ptmt = null;
		  String sql="delete from category where id='"+id_category+"'";
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
	public boolean addCategory(Connection conn, Category category) {
		PreparedStatement ptmt = null;
		  String sql="insert into category (name,description) values (?,?)";
		try {
			ptmt       = conn.prepareStatement(sql);
			String name = category.getName();
			String description = category.getDescription();
			ptmt.setString(1, name);
			ptmt.setString(2, description);
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

}
