package com.epam.onlineshop.services.impl;

import com.epam.onlineshop.entities.Product;
import com.epam.onlineshop.repository.ProductRepository;
import com.epam.onlineshop.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;

    private final static Logger logger = Logger.getLogger(ProductServiceImpl.class);

    @Override
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    @Override
    public boolean addNewProduct(Product product) {
        if (!isProductExist(product.getName())) {
            productRepository.save(product);
        }

        logger.info("Product " + product.getName() + " was added in DB.");
        return isProductExist(product.getName());
    }

    @Override
    public Product getProductById(Long id) {
        return productRepository.findById(id).get();
    }

    public boolean isProductExist(String name) {
        return productRepository.existsByName(name);
    }

    @Override
    public boolean saveProduct(Product product) {
        productRepository.save(product);
        return isProductExist(product.getName());
    }

    @Override
    public boolean deleteProductById(Long id) {
        Product product = getProductById(id);
        productRepository.delete(product);
        return (!isProductExist(product.getName()));
    }

    @Override
    public Product getById(Long id) {
        Optional<Product> result = productRepository.findById(id);
        return (result.isPresent()) ? result.get() : null;
    }
}
