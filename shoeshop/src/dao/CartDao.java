package dao;

import java.util.ArrayList;

import bean.Item;
import bean.Product;

public interface CartDao {
	public boolean checkExistsProductInCart(ArrayList<Item> listProductsInCart,int idProduct);
	public boolean addProductInCart(ArrayList<Product> listProducts,ArrayList<Item> listProductsInCart,int idProduct);
	public boolean removeProductOutCart(ArrayList<Item> listProductsInCart,int idProduct);
	public double totalPrice(Item item);
	public double totalPriceOfCart(ArrayList<Item> listItem);
	public int numberProductInCart(ArrayList<Item> listProductInCart);
}
