package dao;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.mysql.jdbc.Connection;

import bean.Product;

public interface ProductDao {
	public List<Product> getList(Connection conn);
	public Product getProductById(Connection conn, int id_Product);
	public List<Product> sortbyPrice(ArrayList<Product>listproducts,Connection conn, Comparator<Product>cmp);
	public List<Product> searchProductByName(Connection conn,String nameProduct,HttpServletRequest request);
    public List<Product> listProductPagination(Connection conn, int start, int count, HttpServletRequest request);
    
    public List<Product> findByCategory(Connection conn, int category);
    public List<Product> getListProductByPrice(Connection conn, int a, int b);
    public boolean addProduct(Connection conn,Product product);
    public boolean removeProduct(Connection conn, int id_product); 
    public boolean updateProduct(Connection conn, Product product);
}
