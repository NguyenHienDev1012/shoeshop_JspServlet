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

import bean.Category;
import bean.Product;

import com.mysql.jdbc.Connection;

import dao.ProductDaoImpl;
import db.DBConnection;

@WebServlet("/AdminEditInfoProduct")
public class AdminEditInfoProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDaoImpl productDaoImpl=new ProductDaoImpl();
    public AdminEditInfoProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		
		String id_product_str = request.getParameter("id_product");
		int id_product = Integer.parseInt(id_product_str);
		Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();

		Product product = productDaoImpl.getProductById(conn, id_product);
		request.setAttribute("product", product);
		RequestDispatcher rd=request.getRequestDispatcher("View/Admin/editproduct.jsp");
		rd.forward(request, response);
		
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.pool.releaseConnection(conn);
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
	    Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
		
	    		
		String id_product_str = request.getParameter("id_product");
		int id_product = Integer.parseInt(id_product_str);
		
		String name_product=request.getParameter("name_product");
		String image_product=request.getParameter("image_product");
		String price_product_str=request.getParameter("price_product");
		double price_product=Double.parseDouble(price_product_str);
		
		String sale_product_str=request.getParameter("sale_product");
		int    sale_product=Integer.parseInt(sale_product_str);
		
		String quantity_product_str=request.getParameter("quantity_product");
		int quantity_product  =Integer.parseInt(quantity_product_str);
		
		String tymNumber_product_str=request.getParameter("tymNumber_product");
		int tymNumber_product =Integer.parseInt(tymNumber_product_str);
		
		String id_category_product_str=request.getParameter("id_category_product");
		int id_category_product =Integer.parseInt(id_category_product_str);
		
		String description_product=request.getParameter("description_product");
		
		Product product 
		        =new Product(id_product, name_product, image_product, 
				price_product, sale_product, quantity_product, 
				description_product, tymNumber_product, id_category_product);
		
		boolean checkAdminEditProduct=productDaoImpl.updateProduct(conn, product);
		if(checkAdminEditProduct){
			
			ArrayList<Product> listProduct=(ArrayList<Product>)productDaoImpl.getList(conn);
			request.setAttribute("listProduct", listProduct);
	    	request.setAttribute("messageAdminActionProduct", "Sửa thành công!");
	    	RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listproduct.jsp");
			rd.forward(request, response);
	    }
	    
	    else{

	    	ArrayList<Product> listProduct=(ArrayList<Product>)productDaoImpl.getList(conn);
			request.setAttribute("listProduct", listProduct);
	    	request.setAttribute("messageAdminActionProduct", "Sửa thất bại, hãy thử lại!");
	    	RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listproduct.jsp");
			rd.forward(request, response);
		}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.pool.releaseConnection(conn);
		}
	}

}
