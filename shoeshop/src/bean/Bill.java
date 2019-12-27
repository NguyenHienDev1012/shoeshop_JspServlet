package bean;

import java.util.ArrayList;

public class Bill {
	private int iDBill;
	private String name;
	private String numberPhone;
	private String email;
	private String address;
	private String note;
	private int payment;
	private ArrayList<Item> listItemInBill = null;
	public Bill(String name, String numberPhone, String email, String address, String note, int payment,
			ArrayList<Item> listItemInBill) {
		this.name = name;
		this.numberPhone = numberPhone;
		this.email = email;
		this.address = address;
		this.note = note;
		this.payment = payment;
		this.listItemInBill = listItemInBill;
	}

	
	public Bill(int iDBill, String name, String numberPhone, String email,
			String address, String note, int payment,
			ArrayList<Item> listItemInBill) {
		this.iDBill = iDBill;
		this.name = name;
		this.numberPhone = numberPhone;
		this.email = email;
		this.address = address;
		this.note = note;
		this.payment = payment;
		this.listItemInBill = listItemInBill;
	}


	public Bill(int iDBill, String name, String numberPhone, String email, String address, String note, int payment) {
		this.iDBill = iDBill;
		this.name = name;
		this.numberPhone = numberPhone;
		this.email = email;
		this.address = address;
		this.note = note;
		this.payment = payment;
	}


	public int getiDBill() {
		return iDBill;
	}
	public void setiDBill(int iDBill) {
		this.iDBill = iDBill;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumberPhone() {
		return numberPhone;
	}
	public void setNumberPhone(String numberPhone) {
		this.numberPhone = numberPhone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public ArrayList<Item> getListItemInBill() {
		return listItemInBill;
	}
	public void setListItemInBill(ArrayList<Item> listItemInBill) {
		this.listItemInBill = listItemInBill;
	}

	@Override
	public String toString() {
		return "Bill [iDBill=" + iDBill + ", name=" + name + ", numberPhone="
				+ numberPhone + ", email=" + email + ", address=" + address
				+ ", note=" + note + ", payment=" + payment
				+ ", listItemInBill=" + listItemInBill + "]";
	}

	
	
	
}
