package com.imranmadbar.product;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CustomerService {

	public List<CustomerInfo> getProduct() {
		
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
		
		List<CustomerInfo> itemList = new ArrayList<>();
		itemList.add(new CustomerInfo(1, "Rohim"));
		itemList.add(new CustomerInfo(2, "Korim"));
		itemList.add(new CustomerInfo(3, "Imran"));

		return itemList;
	}
	
	public String productPurchases() {
		throw new RuntimeException("Customer get failed");
	}
	
	
	public String findProduct() {
		
		return "Customer found.";
	}


	
}
