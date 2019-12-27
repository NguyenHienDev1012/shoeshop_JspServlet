package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

import bean.Bill;
import bean.Item;
import bean.Product;
import bean.User;

public class BillDaoImpl implements BillDao {

	@Override
	public List<Bill> getListBill(Connection conn) {
		PreparedStatement ptmt = null;
		String sql = "select * from bill ";
		//String sql2="select * from bill_details";
		ArrayList<Bill> listBill = new ArrayList<>();
		ArrayList<Item> listItemInBill=new ArrayList<>();
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Bill bill = new Bill(rs.getInt("id_bill"), rs.getString("name_user"), rs.getString("numberphone"),
						rs.getString("email"), rs.getString("address"), rs.getString("note"), rs.getInt("payment"));
				listBill.add(bill);
//				listItemInBill.add(new Item(new Product(rs.getInt("bill_details.id_product"), rs.getString("bill_details.name_product"), "", rs.getDouble("bill_details.price_product"), 0, 0, "", 0, 0), rs.getInt("bill_details.quantity_product")));
//				bill.setListProductInBill(listItemInBill);
			}
			rs.close();
			ptmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listBill;
	}
//	public static void main(String[] args) {
//		BillDaoImpl n=new BillDaoImpl();
//		Connection conn=(Connection) db.DBConnection.createConnection();
//		System.out.println(n.getListBill(conn));
//		System.out.println("______________________");
//		System.out.println(n.getListItemBillDetails(conn, 311));
//		
//	}
	@Override
	public List<Item> getListItemBillDetails(Connection conn, int id_Bill) {
		PreparedStatement ptmt = null;
		String sql = "select * from bill_details where id_bill="+id_Bill;
		ArrayList<Item> listItemsInBill=new ArrayList<>();
		try {
			ptmt=conn.prepareStatement(sql);
			ResultSet rs=ptmt.executeQuery();
			while(rs.next()){
				Item item =new Item(new Product(rs.getInt("id_product"), rs.getString("name_product"), rs.getString("image_product"), rs.getDouble("price_product")), rs.getInt("quantity_product"));
				listItemsInBill.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return listItemsInBill;
	}

}
