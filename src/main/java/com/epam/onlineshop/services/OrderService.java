package com.epam.onlineshop.services;

import com.epam.onlineshop.entities.Order;
import com.epam.onlineshop.entities.ProductInOrder;
import com.epam.onlineshop.entities.Status;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderService {

    List<Order> getAllOrders();
    Order findById(Long id);
    Order saveOrder(Order order);
    Integer setStatusById(Order order, Long id);
}
