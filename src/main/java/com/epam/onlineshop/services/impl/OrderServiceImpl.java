package com.epam.onlineshop.services.impl;

import com.epam.onlineshop.entities.Order;
import com.epam.onlineshop.entities.Product;
import com.epam.onlineshop.repository.OrderRepository;
import com.epam.onlineshop.repository.ProductRepository;
import com.epam.onlineshop.services.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;

    @Override
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    @Transactional
    @Override
    public Order addOrder(Order order) {
        return orderRepository.save(order);
    }

    @Override
    public Order findById(Long id) {
        return orderRepository.findById(id).get();
    }
}
