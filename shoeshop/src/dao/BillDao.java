package dao;

import java.util.List;

import com.mysql.jdbc.Connection;

import bean.Bill;
import bean.Item;

public interface BillDao {
	public List<Bill> getListBill(Connection conn);
	public List<Item> getListItemBillDetails(Connection conn, int id_Bill);
}
