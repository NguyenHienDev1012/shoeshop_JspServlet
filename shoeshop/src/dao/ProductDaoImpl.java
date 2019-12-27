package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.mysql.jdbc.Connection;

import bean.Product;

public class ProductDaoImpl implements ProductDao{

	@Override
	public List<Product> getList(Connection conn) {
		ArrayList<Product> listProducts=new ArrayList<>();
		String sql="select * from product";
		try {
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ResultSet rs=ptmt.executeQuery();
			while(rs.next()){
				Product product=new Product(rs.getInt("id"), rs.getString("name"), rs.getString("images"), 
						rs.getDouble("price"), rs.getInt("sale"), rs.getInt("quantity"), rs.getString("description"),
						rs.getInt("tymNumber"), rs.getInt("id_category"));
				 listProducts.add(product);
				
			}
			
			ptmt.close();
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listProducts;
	}
	@Override
	public Product getProductById(Connection conn, int id_Product) {
		String sql="select * from product where id='"+id_Product+"'";
		Product product=null;
		try {
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ResultSet rs=ptmt.executeQuery();
			if(rs.next()){
				 product=new Product(rs.getInt("id"), rs.getString("name"), rs.getString("images"), 
						rs.getDouble("price"), rs.getInt("sale"), rs.getInt("quantity"), rs.getString("description"),
						rs.getInt("tymNumber"), rs.getInt("id_category"));
			}

			ptmt.close();
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}
	
	@Override
	public List<Product> sortbyPrice(ArrayList<Product> listproducts,Connection conn,
			Comparator<Product> cmp) {
          Collections.sort(listproducts, cmp);
		return listproducts;
	}
	@Override
	public List<Product> searchProductByName(Connection conn,String nameProduct, HttpServletRequest request) {
		ArrayList<Product>  listProduct=new ArrayList<>();
		String sql="select * from product where name like'%"+nameProduct+"%'";
		
		try {
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ResultSet rs=ptmt.executeQuery();
			if(!rs.isBeforeFirst()){
				request.setAttribute("result", "Không có sản phẩm nào được tìm thấy.");
			}
			else{
				while(rs.next()){
					Product product=new Product(rs.getInt("id"), rs.getString("name"), rs.getString("images"), 
							rs.getDouble("price"), rs.getInt("sale"), rs.getInt("quantity"), rs.getString("description"),
							rs.getInt("tymNumber"), rs.getInt("id_category"));
					 listProduct.add(product);
				}
				//conn.close();
				ptmt.close();
				rs.close();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listProduct;
	}
	@Override
	public List<Product> listProductPagination(Connection conn, int start,
			int count, HttpServletRequest request) {
		/* Offset = start -1;
		 * pageid=pageid-1;
		 * padgeid=pageid*count-1;
		 * */
		ArrayList<Product> listProductPagination=new ArrayList<>();
		String sql="select * from product limit "+(start-1)+", "+count+"";
		try {
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ResultSet rs=ptmt.executeQuery();
			if(rs.isBeforeFirst()){
				while(rs.next()){
					Product product=new Product(rs.getInt("id"), rs.getString("name"), rs.getString("images"), 
							rs.getDouble("price"), rs.getInt("sale"), rs.getInt("quantity"), rs.getString("description"),
							rs.getInt("tymNumber"), rs.getInt("id_category"));
					 listProductPagination.add(product);
				}
				
			}
			else{
				request.setAttribute("messageProductPagination", "Bạn chưa có sản phẩm nào");
			}
			ptmt.close();
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listProductPagination;
	}
	@Override
	public List<Product> findByCategory(Connection conn, int category) {
		
		String sql="select * from product inner join category on product.id_category= category.id where  product.id_category='"+category+"'";
		
		ArrayList<Product> listProdctByCategory=new ArrayList<>();
		
		try {
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ResultSet rs=ptmt.executeQuery();
			while(rs.next()){
			Product product=new Product(rs.getInt("id"), rs.getString("name"), rs.getString("images"), 
					rs.getDouble("price"), rs.getInt("sale"), rs.getInt("quantity"), rs.getString("description"),
					rs.getInt("tymNumber"), rs.getInt("id_category"));
			 listProdctByCategory.add(product);
			}

			ptmt.close();
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listProdctByCategory;
	}
	@Override
	public List<Product> getListProductByPrice(Connection conn, int a, int b) {
		String sql="select * from product where price between '" + a + "' and '" + b + "'";
		ArrayList<Product> listProductByPrice=new ArrayList<>();
		
		try {
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ResultSet rs=ptmt.executeQuery();
			while(rs.next()){
				Product product=new Product(rs.getInt("id"), rs.getString("name"), rs.getString("images"), 
						rs.getDouble("price"), rs.getInt("sale"), rs.getInt("quantity"), rs.getString("description"),
						rs.getInt("tymNumber"), rs.getInt("id_category"));
				listProductByPrice.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listProductByPrice;
	}

	@Override
	public boolean removeProduct(Connection conn, int id_product) {
		
		PreparedStatement ptmt = null;
		  String sql="delete from product where id='"+id_product+"'";
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
	public boolean updateProduct(Connection conn, Product product) {
		PreparedStatement ptmt = null;
		  String sql="update product set id=?, name=?, images=?, price=?, sale=?, " +
		  		"quantity=?,description=?,tymNumber=?, id_category=? where " +
		  		"id='"+product.getId()+"'";
		try {
			ptmt       = conn.prepareStatement(sql);
			ptmt.setInt(1,product.getId());
			ptmt.setString(2, product.getName());
			ptmt.setString(3, product.getImages());
			ptmt.setDouble(4, product.getPrice());
			ptmt.setInt(5, product.getSale());
			ptmt.setInt(6, product.getQuantity());
			ptmt.setString(7, product.getDescription());
			ptmt.setInt(8, product.getTymNumber());
			ptmt.setInt(9, product.getId_Category());
			
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
	public boolean addProduct(Connection conn, Product product) {
		PreparedStatement ptmt = null;
		String sql = "insert into product (name,images,price,sale,quantity,description,tymNumber,id_category) values (?,?,?,?,?,?,?,?)";
		try {
			ptmt       = conn.prepareStatement(sql);
			ptmt.setString(1, product.getName());
			ptmt.setString(2, product.getImages());
			ptmt.setDouble(3, product.getPrice());
			ptmt.setInt(4, product.getSale());
			ptmt.setInt(5, product.getQuantity());
			ptmt.setString(6, product.getDescription());
			ptmt.setInt(7, product.getTymNumber());
			ptmt.setInt(8, product.getId_Category());
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
