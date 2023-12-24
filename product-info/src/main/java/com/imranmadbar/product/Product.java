package com.imranmadbar.product;

public class Product {
	
    private int id;
    
    private String name;

    // Example constructor
    public Product(int id, String name) {
        this.id = id;
        this.name = name;
    }

    // Getter methods
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}