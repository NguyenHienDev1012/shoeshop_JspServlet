package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Product;

import com.mysql.jdbc.Connection;

import dao.ProductDaoImpl;
import db.DBConnection;


@WebServlet("/CategoryController")
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDaoImpl productDaoImpl=new ProductDaoImpl();

    
    public CategoryController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
      	Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
      	

	    String userchoosecategory=request.getParameter("choosecategory");
	    // System.out.println(userchoosecategory);
	    
		String arrangeuserchoose=(String) request.getParameter("arrangeuserchoose");
		//System.out.println(arrangeuserchoose);
		
		String gia1=(String) request.getParameter("gia1");
		String gia2=(String) request.getParameter("gia2");
		if(userchoosecategory==null && arrangeuserchoose==null && gia1==null && gia2==null){
			ArrayList<Product> listProducts=(ArrayList<Product>) productDaoImpl.getList(conn);
			request.setAttribute("listProducts", listProducts);
			RequestDispatcher rd=request.getRequestDispatcher("View/category.jsp");
			rd.forward(request, response);
			
		}
		else{
		
		ArrayList<Product> listProductInit=(ArrayList<Product>) productDaoImpl.getList(conn);
        
        if(userchoosecategory!=null){
        	int category;
        	if(userchoosecategory.equals("adidas")){
        		category =1;
    	    ArrayList<Product> listProducts=(ArrayList<Product>) productDaoImpl.findByCategory(conn, category);
    	    
    	    request.setAttribute("listProducts", listProducts);
        	}
            if(userchoosecategory.equals("converse")){
            	category =2;
        	    ArrayList<Product> listProducts=(ArrayList<Product>) productDaoImpl.findByCategory(conn, category);
        	    request.setAttribute("listProducts", listProducts);
        		
        	}
            if(userchoosecategory.equals("vans")){
            	category =3;
        	    ArrayList<Product> listProducts=(ArrayList<Product>) productDaoImpl.findByCategory(conn, category);
        	    request.setAttribute("listProducts", listProducts);
        		
        	}
        		
            	
         }
        	
        if(arrangeuserchoose!=null){
        	
        	if(arrangeuserchoose.equals("lowtohigh")){
    			Comparator<Product> lowtohigh=new Comparator<Product>() {
    				
    							@Override
    							public int compare(Product p1, Product p2) {
    								if(p1.getPrice()>p2.getPrice()) return 1;
    								if(p1.getPrice()<p2.getPrice()) return -1;
    								return 0;
    							}
    				
    						};
    			
    			ArrayList<Product> listProducts=(ArrayList<Product>) productDaoImpl.sortbyPrice(listProductInit, conn, lowtohigh);
    			request.setAttribute("listProducts",listProducts);
    			
    		}
    		else{
    			if(arrangeuserchoose.equals("hightolow")){
    				Comparator<Product> hightolow=new Comparator<Product>() {
    					
    								@Override
    								public int compare(Product p1, Product p2) {
    									if(p1.getPrice()<p2.getPrice()) return 1;
    									if(p1.getPrice()>p2.getPrice()) return -1;
    									return 0;
    								}
    				};
    				ArrayList<Product> listProducts=(ArrayList<Product>) productDaoImpl.sortbyPrice(listProductInit, conn, hightolow);
    				request.setAttribute("listProducts",listProducts);
    			}
    			
    		}
    		
        	
        }
        		
        if(gia1 !=null && gia2 !=null){
        	int a = Integer.parseInt(gia1);
    		int b = Integer.parseInt(gia2);
			ArrayList<Product> listProducts=(ArrayList<Product>) productDaoImpl.getListProductByPrice(conn, a, b);
			request.setAttribute("listProducts", listProducts);
		}
        RequestDispatcher rd=request.getRequestDispatcher("View/category.jsp");
		rd.forward(request, response);
      	
	}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
       	} 
		catch (RuntimeException e) {
			response.sendRedirect("View/outofconnectionpool.jsp");
	    }
		finally {
			DBConnection.pool.releaseConnection(conn);
		}
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
