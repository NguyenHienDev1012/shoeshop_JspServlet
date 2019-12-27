package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
//	public static Connection createConnection() {
//		Connection con = null;
	//webbanhang2019.mysql.database.azure.com
	// String name="hien@webbanhang2019";
	//	String password = "Laptrinhweb!";
	//String url ="jdbc:mysql://webbanhang2019.mysql.database.azure.com:3306/LTW?useUnicode=true&amp;characterEncoding=utf8?autoReconnect=true&useSSL=true&requireSSL=false";
//      
//	   String name="root";
//	   String password = "passion";
//	   String url ="jdbc:mysql://localhost:3306/LTW?useUnicode=true&amp;characterEncoding=utf8";
//			
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			con = DriverManager.getConnection(url,name,password);
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//
//		return con;
		 public static ConnectionPool pool;

		    public static Connection createConnection() throws ClassNotFoundException, SQLException, SQLException {
		        Connection con = null;
		        if (pool == null) {
		            pool = BasicConnectionPool.create("jdbc:mysql://localhost:3306/LTW?useUnicode=true&amp;characterEncoding=utf8", "root", "passion");
		        }
		        con = pool.getConnection();
		        System.out.println("Size of connection pool: "+ pool.getNumCon());
		        System.out.println("Size of used connection: "+ pool.getUsesCon());
		        return con;
		    }

	

}
