package dao;


import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

import bean.Bill;
import bean.Comment;
import bean.Item;
import bean.Product;
import bean.User;

public interface UserDao {
  public boolean register(Connection conn,User u);
  public boolean checkExistsUser(Connection conn,User u);
  public boolean login (Connection conn,String username, String password);
  public boolean updatenewPass(Connection conn, User u);
  public int authorization(Connection conn, String username, String password );
  public boolean checkPasswordByEmail(Connection conn, String email);
  public User getPasswordByEmail(Connection conn, String email);
  public boolean addUser(Connection conn,User u);
  public User getUser(Connection conn,String username);
  public User getUser(Connection conn, int id_user);
  public boolean updateUser(Connection conn,User u);
  public String getMD5(String input);
  public List<User> getListUser(Connection conn);
  public boolean removeUser(Connection conn, int id_user);
  public boolean dropHeart(Connection conn, int id_user, int id_product);
  public boolean removeProductUserDropHeart(Connection conn, int id_product_tym);
  public ArrayList<Integer> getIdProductHeart(Connection conn, int id_user);
  public boolean checkout(Connection conn, Bill bill);
}
