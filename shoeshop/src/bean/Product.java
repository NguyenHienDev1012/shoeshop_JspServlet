package bean;

public class Product {
	
	private int id;
	private String name;
	private String images;
	private double price;
	private int sale;
	private int quantity;// product is available => In stock
	private String description;
	private int tymNumber;
	private int id_Category;
	public Product(){};
	
	public Product(int id, String name, String images, double price, int sale,
			int quantity, String description, int tymNumber, int id_Category) {
		this.id = id;
		this.name = name;
		this.images = images;
		this.price = price;
		this.sale = sale;
		this.quantity = quantity;
		this.description = description;
		this.tymNumber = tymNumber;
		this.id_Category = id_Category;
	}
	public Product(String name, String images, double price, int sale,
			int quantity, String description, int tymNumber, int id_Category) {
		this.name = name;
		this.images = images;
		this.price = price;
		this.sale = sale;
		this.quantity = quantity;
		this.description = description;
		this.tymNumber = tymNumber;
		this.id_Category = id_Category;
	}
	

	//Constructor for bill details
	public Product(int id, String name, String images, double price) {
		this.id = id;
		this.name = name;
		this.images = images;
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getTymNumber() {
		return tymNumber;
	}

	public void setTymNumber(int tymNumber) {
		this.tymNumber = tymNumber;
	}

	public int getId_Category() {
		return id_Category;
	}

	public void setId_Category(int id_Category) {
		this.id_Category = id_Category;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", images=" + images
				+ ", price=" + price + ", sale=" + sale + ", quantity="
				+ quantity + ", description=" + description + ", tymNumber="
				+ tymNumber + ", id_Category=" + id_Category + "]";
	}

	
	
	
	
	
	
	
	

}
