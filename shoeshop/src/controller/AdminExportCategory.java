package controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Category;
import java.io.*;

@WebServlet("/AdminExportCategory")
public class AdminExportCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminExportCategory() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession(true);
		ArrayList<Category> listCategory = (ArrayList<Category>) session.getAttribute("listCategory");
		String header = "Mã loại\tTên loại\tMô tả";
		String dFile = "C:\\Users\\DELL\\Desktop\\Export\\export1.txt";
		if(!listCategory.isEmpty()){
			PrintWriter pw = new PrintWriter(new OutputStreamWriter(new FileOutputStream(dFile), StandardCharsets.UTF_8));
			
			for (Category category : listCategory) {
				pw.println(category.getId()+"\t"+category.getName()+"\t"+category.getDescription());
			}
			pw.flush();
			pw.close();
		
		}
		
		RequestDispatcher rd=request.getRequestDispatcher("View/Admin/listcategory.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
