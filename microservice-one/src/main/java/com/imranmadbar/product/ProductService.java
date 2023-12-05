package com.imranmadbar.product;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class ProductService {

	public List<Product> getProduct() {
		
		List<Product> itemList = new ArrayList<>();
		itemList.add(new Product(1, "Item1"));
		itemList.add(new Product(2, "Item2"));
		itemList.add(new Product(3, "Item3"));

		return itemList;
	}
	
	public String productPurchases() {
		
		return "Successfully product purchase done !";
	}
	
	
	public String findProduct() {
		
		return "Product finding...";
	}


	
}
