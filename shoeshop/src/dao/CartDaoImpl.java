package dao;

import java.util.ArrayList;

import bean.Item;
import bean.Product;

public class CartDaoImpl implements CartDao {
	int indexExistsProduct = 0;

	@Override
	public boolean addProductInCart(ArrayList<Product> listProducts,
			ArrayList<Item> listProductsInCart, int idProduct) {
		for (int i = 0; i < listProducts.size(); i++) {
			if (listProducts.get(i).getId() == idProduct) {
				if (checkExistsProductInCart(listProductsInCart, idProduct) == false) {
					listProductsInCart.add(new Item(listProducts.get(i), 1));
					return true;

				} else {
					if (checkExistsProductInCart(listProductsInCart, idProduct) == true) {
						listProductsInCart.get(indexExistsProduct).setQuantity(
								listProductsInCart.get(indexExistsProduct)
										.getQuantity() + 1);
						return true;
					}

				}
			}

		}

		return false;
	}

	@Override
	public boolean removeProductOutCart(ArrayList<Item> listProductsInCart,
			int idProduct) {
		for (int i = 0; i < listProductsInCart.size(); i++) {
			if (listProductsInCart.get(i).getProduct().getId() == idProduct) {
				listProductsInCart.remove(i);
				return true;
			}

		}
		return false;
	}

	@Override
	public boolean checkExistsProductInCart(ArrayList<Item> listProductsInCart,
			int idProduct) {
		for (int i = 0; i < listProductsInCart.size(); i++) {
			if (listProductsInCart.get(i).getProduct().getId() == idProduct) {
				indexExistsProduct = i;
				return true;
			}

		}
		return false;
	}

	public double totalPrice(Item item) {
		double totalPrice = (item.getProduct().getPrice()) * item.getQuantity();
		return totalPrice;

	}
	
	public double totalPriceOfCart(ArrayList<Item> listItem){
		double priceAll=0;
		for (int i = 0; i < listItem.size(); i++) {
			priceAll+=totalPrice(listItem.get(i));
		}
		return priceAll;
	}
   public int numberProductInCart(ArrayList<Item> listProductInCart){
	   int number=0;
	   for (int i = 0; i < listProductInCart.size(); i++) {
		   number+=listProductInCart.get(i).getQuantity();
	}
	return number;
	   
   }
}
