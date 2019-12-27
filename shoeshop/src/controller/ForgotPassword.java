package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Captcha;
import bean.User;

import com.mysql.jdbc.Connection;

import dao.UserDaoImpl;
import db.DBConnection;

@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDaoImpl userDaoImpl=new UserDaoImpl();
    public ForgotPassword() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		RequestDispatcher rd=request.getRequestDispatcher("View/forgotpassword.jsp");
		rd.forward(request, response);
		
	}
	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    Connection conn = null;
		try {
			conn = (Connection) db.DBConnection.createConnection();
	    
	    String email=request.getParameter("forgotpass");
	    String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
	    System.out.println("capppppp"+gRecaptchaResponse);
	    System.out.println(email);
	    boolean verify = Captcha.verify(gRecaptchaResponse);
	    System.out.println(verify);
	    boolean checkexistsEmail=userDaoImpl.checkPasswordByEmail(conn, email);
	    if(checkexistsEmail&&verify){
	    	
	    	User user=userDaoImpl.getPasswordByEmail(conn, email);
	    	
	    	Random random=new Random();
	    	String newPass=random.nextInt()+"";
		    String passwordMd5=userDaoImpl.getMD5(newPass);
	    	user.setPassword(passwordMd5);
	    	userDaoImpl.updatenewPass(conn, user);
	    	
	    	String titleEmail="Username and password from shoeshop.";
	    	String contentMail="\tfor security reasons, we sent you a random system password.\nPlease update the new password to ensure security. Your random password is:\t";
	    	userDaoImpl.sendMail(email,titleEmail,"Hello:\t"+user.getName()+"," +contentMail+newPass+"\n Thanks you for using my website.");
	    	request.setAttribute("messageforgotpass", "Bạn hãy kiểm tra email");
	    	RequestDispatcher rd=request.getRequestDispatcher("View/forgotpassword.jsp");
			rd.forward(request, response);
	    	
	    	
	     }
	    else{
	    	
	    	if(verify==false){
	    		request.setAttribute("messageforgotpass", "Bạn hãy vui lòng nhập capcha.");
		    	RequestDispatcher rd=request.getRequestDispatcher("View/forgotpassword.jsp");
				rd.forward(request, response);
	    	}
	    	else{
	    	request.setAttribute("messageforgotpass", "Email không tồn tại trong hệ thống, mời nhập lại.");
	    	RequestDispatcher rd=request.getRequestDispatcher("View/forgotpassword.jsp");
			rd.forward(request, response);
	    	}
	    }
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		catch (RuntimeException e) {
			response.sendRedirect("View/outofconnectionpool.jsp");
	    }
		finally {
			DBConnection.pool.releaseConnection(conn);
		}
	}

}
