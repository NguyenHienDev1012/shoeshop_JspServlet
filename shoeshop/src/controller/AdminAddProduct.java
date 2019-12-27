package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.Product;

import com.mysql.jdbc.Connection;

import dao.ProductDaoImpl;
import db.DBConnection;

@WebServlet("/AdminAddProduct")
public class AdminAddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDaoImpl productDaoImpl = new ProductDaoImpl();

	public AdminAddProduct() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		RequestDispatcher rd = request
				.getRequestDispatcher("View/Admin/addproduct.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {request.setCharacterEncoding("UTF-8");
			request.setCharacterEncoding("UTF-8");
		    response.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html; charset=UTF-8");
		    Connection conn=null;
		    try {  
		    	conn=(Connection) db.DBConnection.createConnection();
		    		
//			String id_product_str = request.getParameter("id_product");
//			int id_product = Integer.parseInt(id_product_str);
		    String image_product="";
		    
		    ServletContext context=getServletContext();
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			Product product=new Product();
			System.out.println(isMultipart);
			if (isMultipart) {
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
					List<FileItem> fieldList = null;
					
						fieldList = servletFileUpload.parseRequest(request);
					    for(FileItem item:fieldList){
						if(item.getFieldName().equals("name_product")){
							product.setName(new String(item.getString().getBytes("iso-8859-1"),"UTF-8"));
						}
						if(item.getFieldName().equals("image_product")){
							image_product = new File(item.getName()).getName();
							product.setImages(image_product);
							
							System.out.println("file:" + image_product);
							String root = getServletContext().getRealPath("/");
							
							System.out.println("root:" + root);
							File path = new File(root+"Image");
							
							File uploadedFile = new File(path + "/" + image_product);
								item.write(uploadedFile);
								
							System.out.println(uploadedFile.getAbsolutePath());
							
						}
						if(item.getFieldName().equals("price_product")){
						    product.setPrice(Double.parseDouble(item.getString()));
						}
						if(item.getFieldName().equals("sale_product")){
							product.setSale(Integer.parseInt(item.getString()));
						}
						if(item.getFieldName().equals("quantity_product")){
							product.setQuantity(Integer.parseInt(item.getString()));
						}
						if(item.getFieldName().equals("tymNumber_product")){
							product.setTymNumber(Integer.parseInt(item.getString()));
						}
						if(item.getFieldName().equals("id_category_product")){
							product.setId_Category(Integer.parseInt(item.getString()));
						}
						if(item.getFieldName().equals("description_product")){
							product.setDescription(new String(item.getString().getBytes("iso-8859-1"),"UTF-8"));
						}
						
						
					    }
						
					}
					
					boolean checkAdminAddProduct=productDaoImpl.addProduct(conn, product);
					if(checkAdminAddProduct){
						
						ArrayList<Product> listProduct=(ArrayList<Product>)productDaoImpl.getList(conn);
						request.setAttribute("listProduct", listProduct);
				    	request.setAttribute("messageAdminActionProduct", "Thêm thành công!");
				    	RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listproduct.jsp");
						rd.forward(request, response);
				    }
				    
				    else{

				    	ArrayList<Product> listProduct=(ArrayList<Product>)productDaoImpl.getList(conn);
						request.setAttribute("listProduct", listProduct);
				    	request.setAttribute("messageAdminActionProduct", "Thêm thất bại, hãy thử lại!");
				    	RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listproduct.jsp");
						rd.forward(request, response);
					}
			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		    finally {
		    	DBConnection.pool.releaseConnection(conn);
				
			}
		}

}
