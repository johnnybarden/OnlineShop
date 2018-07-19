package com.epam.onlineshop;

import com.epam.onlineshop.entities.*;
import com.epam.onlineshop.repository.OrderRepository;
import com.epam.onlineshop.repository.ProductInOrderRepository;
import com.epam.onlineshop.repository.ProductRepository;
import com.epam.onlineshop.repository.UserRepository;
import com.epam.onlineshop.services.OrderService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

@SpringBootTest
@RunWith(SpringRunner.class)
public class OrderServiceTest {

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    ProductInOrderRepository productInOrderRepository;

    @Autowired
    OrderService orderService;

    private User user;
    private Product product;
    private Order expected;

    @Before
    public void setUp() {
        user = UserServiceTest.createUser();
        product = ProductInOrderServiceTest.createProduct();
        expected = ProductInOrderServiceTest.createOrder(user);

        userRepository.save(user);
        productRepository.save(product);
        orderRepository.save(expected);
        productInOrderRepository.save(ProductInOrderServiceTest.createProductInOrder(product, expected));
    }

    @Test
    public void shouldSetStatusById() {
        Order orderReceived = ProductInOrderServiceTest.createOrder(user);
        Status expected = Status.PREPAID;
        orderReceived.setStatus(expected);

        orderService.setStatusById(orderReceived, this.expected.getId());
        Status actual = orderRepository.findById(this.expected.getId()).get().getStatus();

        assertEquals(expected, actual);
    }

    @Test
    public void shouldFindOrderById() {
        Order expected = this.expected;
        Order actual = orderService.findById(this.expected.getId());

        assertEquals(expected.getId(), actual.getId());
        assertEquals(expected.getStatus(), actual.getStatus());
    }

    @Test
    public void shouldSaveOrder() {
        orderService.saveOrder(expected);
        Order actual = orderService.findById(expected.getId());

        assertNotNull(actual);
        assertEquals(expected.getId(), actual.getId());
        assertEquals(expected.getStatus(), actual.getStatus());
    }

    @Test
    public void shouldReturnAllOrders() {
        List<Order> expected = orderRepository.findAll();
        List<Order> actual = orderService.getAllOrders();

        assertEquals(expected.size(), actual.size());

        for (int i = 0; i < expected.size(); i++) {
            assertEquals(expected.get(i).getId(), actual.get(i).getId());
            assertEquals(expected.get(i).getStatus(), actual.get(i).getStatus());
        }
    }
}
