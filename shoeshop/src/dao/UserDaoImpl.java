package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import bean.Bill;
import bean.Comment;
import bean.Item;
import bean.Product;
import bean.User;

import com.mysql.jdbc.Connection;

public class UserDaoImpl implements UserDao {

	@Override
	public boolean register(Connection conn, User u) {
		PreparedStatement ptmt = null;
		String sql = "insert into user (username,email,password,role) values (?,?,?,?)";
		try {
			ptmt = conn.prepareStatement(sql);
			String username = u.getName();
			String email = u.getEmail();
			String password = u.getPassword();
			int role = u.getRole();
			ptmt.setString(1, username);
			ptmt.setString(2, email);
			ptmt.setString(3, password);
			ptmt.setInt(4, role);
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
	public boolean checkExistsUser(Connection conn, User u) {
		String sql = "select * from user where (username='" + u.getName() + "') or ( email='" + u.getEmail() + "')";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public String getMD5(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] messageDigest = md.digest(input.getBytes());
			return convertByteToHex(messageDigest);
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

	public String convertByteToHex(byte[] data) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < data.length; i++) {
			sb.append(Integer.toString((data[i] & 0xff) + 0x100, 16).substring(1));
		}
		return sb.toString();
	}

	@Override
	public boolean login(Connection conn, String username, String password) {
		String sql = "select * from user where username='" + username + "' and password='" + password + "'";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public int authorization(Connection conn, String username, String password) {
		int role = 0;
		PreparedStatement ptmt = null;
		String sql = "select role from user where username='" + username + "' and password='" + password + "'";
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();

			if (rs.next()) {
				role = rs.getInt("role");

			}
			ptmt.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return role;
	}

	@Override
	public boolean checkPasswordByEmail(Connection conn, String email) {
		PreparedStatement ptmt = null;
		String sql = "select * from user where email='" + email + "'";
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			if (rs.next()) {
				return true;
			}
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public User getPasswordByEmail(Connection conn, String email) {
		PreparedStatement ptmt = null;
		String sql = "select * from user where email='" + email + "'";
		User user = new User();
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();

			if (rs.next()) {
				String username = rs.getString("username");
				String password = rs.getString("password");
				user.setName(username);
				user.setEmail(email);
				user.setPassword(password);
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

	@Override
	public boolean updatenewPass(Connection conn, User u) {
		PreparedStatement ptmt = null;
		String sql = "update user set username=?, email=?, password=?, role=? where email='" + u.getEmail() + "'";
		try {
			ptmt = conn.prepareStatement(sql);
			String username = u.getName();
			String email = u.getEmail();
			String password = u.getPassword();
			int role = u.getRole();

			ptmt.setString(1, username);
			ptmt.setString(2, email);
			ptmt.setString(3, password);
			ptmt.setInt(4, 1);
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

	public static boolean sendMail(String to, String subject, String text) {
		Properties props = new Properties();
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("shoeshop.nlu@gmail.com", "shoeshop77");
			}
		});
		try {
			Message message = new MimeMessage(session);
			message.setHeader("Content-Type", "text/plain; charset=UTF-8");
			message.setFrom(new InternetAddress("shoeshop.nlu@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(text);
			Transport.send(message);
		} catch (MessagingException e) {
			return false;
		}
		return true;

	}

	@Override
	public User getUser(Connection conn, String username) {
		String sql = "select * from user where username='" + username + "'";
		PreparedStatement ps;
		User user = null;
		try {
			ps = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user = new User(rs.getInt("user_id"), rs.getString("username"), rs.getString("email"),
						rs.getString("password"), rs.getInt("role"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

	@Override
	public boolean updateUser(Connection conn, User u) {
		PreparedStatement ptmt = null;
		String sql = "update user set user_id=?, username=?, email=?, password=?, role=? where user_id='" + u.getId()
				+ "'";
		try {
			ptmt = conn.prepareStatement(sql);
			int id = u.getId();
			String username = u.getName();
			String email = u.getEmail();
			String password = u.getPassword();
			int role = u.getRole();
			ptmt.setInt(1, id);
			ptmt.setString(2, username);
			ptmt.setString(3, email);
			ptmt.setString(4, password);
			ptmt.setInt(5, role);
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
	public boolean removeUser(Connection conn, int id_user) {

		PreparedStatement ptmt = null;
		String sql = "delete from user where user_id='" + id_user + "'";
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
	public List<User> getListUser(Connection conn) {
		PreparedStatement ptmt = null;
		String sql = "select * from user";
		ArrayList<User> listUser = new ArrayList<>();
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				User user = new User(rs.getInt("user_id"), rs.getString("username"), rs.getString("email"),
						rs.getString("password"), rs.getInt("role"));
				listUser.add(user);
			}
			rs.close();
			ptmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listUser;
	}

	@Override
	public User getUser(Connection conn, int id_user) {
		String sql = "select * from user where user_id='" + id_user + "'";
		PreparedStatement ps;
		User user = null;
		try {
			ps = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user = new User(rs.getInt("user_id"), rs.getString("username"), rs.getString("email"),
						rs.getString("password"), rs.getInt("role"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

	@Override
	public boolean addUser(Connection conn, User u) {
		PreparedStatement ptmt = null;
		String sql = "insert into user (username,email,password,role) values (?,?,?,?)";
		try {
			ptmt = conn.prepareStatement(sql);
			int id = u.getId();
			String username = u.getName();
			String email = u.getEmail();
			String password = u.getPassword();
			int role = u.getRole();
			ptmt.setString(1, username);
			ptmt.setString(2, email);
			ptmt.setString(3, password);
			ptmt.setInt(4, role);
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
//		Connection conn = (Connection) db.DBConnection.createConnection();
//		UserDaoImpl u = new UserDaoImpl();
//		// System.out.println(sendMail("thanhhienpupils@gmail.com", "hehe",
//		// "Test"));
//		// System.out.println(u.getPasswordByEmail(conn,"thanhhienpupils@gmail.com"));
//		// User user=u.getPasswordByEmail(conn, "thanhhienpupils@gmail.com");
//		// System.out.println(u.updatenewPass(conn,user));
//		// System.out.println(u.getMD5("837338694"));
//		// System.out.println(u.getUser(conn, "nam"));
//		// System.out.println(u.updateUser(conn, u.getUser(conn, "nam")));
//		System.out.println(u.getListUser(conn));
//	}

	@Override
	public boolean dropHeart(Connection conn, int id_user, int id_product) {
		PreparedStatement ptmt = null;
		String sql = "insert into product_user_tym  (user_id_tym, product_id_tym) values (?,?)";
		try {
			ptmt = conn.prepareStatement(sql);
			int id_user_tym = id_user;
			int id_product_tym = id_product;
			ptmt.setInt(1, id_user_tym);
			ptmt.setInt(2, id_product_tym);
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
	public boolean removeProductUserDropHeart(Connection conn, int id_product_tym) {
		
		PreparedStatement ptmt = null;
		  String sql="delete from product_user_tym where product_id_tym='"+id_product_tym+"'";
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
	public ArrayList<Integer> getIdProductHeart(Connection conn, int id_user) {
		String sql = "select product_id_tym from product_user_tym where user_id_tym='" + id_user + "'";
		ArrayList<Integer> list_id_product_user_tym = new ArrayList<Integer>();
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int product_id_tym = rs.getInt("product_id_tym");
				list_id_product_user_tym.add(product_id_tym);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_id_product_user_tym;
	}

	@Override
	public boolean checkout(Connection conn, Bill bill) {
		PreparedStatement ptmt = null;
		String sql = "insert into bill (id_bill, name_user, numberphone, email, address, note, payment) values (?,?,?,?,?,?,?)";
		String sql2="insert into bill_details (id_bill, id_product, quantity_product, name_product,image_product, price_product) values (?,?,?,?,?,?)";
		int kt=0;
		try {
			
				ptmt = conn.prepareStatement(sql);
				String username = bill.getName();
				String numberphone = bill.getNumberPhone();
				String email = bill.getEmail();
				String address = bill.getAddress();
				String note = bill.getNote();
				int payment = bill.getPayment();
				
				ptmt.setInt(1, bill.getiDBill());
				ptmt.setString(2, username);
				ptmt.setString(3, numberphone);
				ptmt.setString(4, email);
				ptmt.setString(5,address);
				ptmt.setString(6,note);
				ptmt.setInt(7, payment);
				kt=ptmt.executeUpdate();
				ptmt=conn.prepareStatement(sql2);
			for (int i = 0; i < bill.getListItemInBill().size(); i++) {
				Item item = bill.getListItemInBill().get(i);
				ptmt.setInt(1, bill.getiDBill());
				ptmt.setInt(2,item.getProduct().getId());
				ptmt.setInt(3, item.getQuantity());
				ptmt.setString(4, item.getProduct().getName());
				ptmt.setString(5, item.getProduct().getImages());
				ptmt.setDouble(6, item.getProduct().getPrice());
			    kt= ptmt.executeUpdate();
			}
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
