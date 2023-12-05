package com.imranmadbar.product;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductController {

	Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductService productService;

	@GetMapping(value = "/product-list")
	public List productList() {
		logger.info("productList: "+productService.getProduct());
		return productService.getProduct();
	}
	
	
	@GetMapping(value = "/product-find")
	public String findProduct() {
		logger.info("findProduct: "+productService.findProduct());
		return productService.findProduct();
	}
	
	
	
	@GetMapping(value = "/product-purchase")
	public String purchaseProduct() {
		logger.info("purchaseProduct: "+productService.productPurchases());
		return productService.productPurchases();
	}
	

	
	


	@GetMapping(value = "/")
	public String welcomeMsg() {
		logger.info("Welcome to MicroserviceOneApplication");
		return "Welcome to MicroserviceOneApplication";
	}

}
