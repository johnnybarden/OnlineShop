package com.epam.onlineshop.services;

import com.epam.onlineshop.entities.Product;

import java.util.List;

public interface ProductService {

    List<Product> getAllProducts();

    boolean addNewProduct(Product product);
}
