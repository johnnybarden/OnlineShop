package com.epam.onlineshop;

import com.epam.onlineshop.entities.*;
import com.epam.onlineshop.repository.OrderRepository;
import com.epam.onlineshop.repository.ProductInOrderRepository;
import com.epam.onlineshop.repository.ProductRepository;
import com.epam.onlineshop.repository.UserRepository;
import com.epam.onlineshop.services.ProductInOrderService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

import static com.epam.onlineshop.entities.Status.NEW;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional
public class ProductInOrderServiceTest {

    @Autowired
    private ProductInOrderService productInOrderService;

    @Autowired
    private ProductInOrderRepository productInOrderRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private OrderRepository orderRepository;

    private final static String PRODUCT_IMG_LINK = "";
    private final static String PRODUCT_NAME = "Qwerty";
    private final static Integer PRODUCT_PRICE = 10;
    private final static Integer PRODUCT_IN_ORDER_QUANTITY = 1;

    private User user;
    private Product productFromCatalog;
    private Order orderInCart;
    private ProductInOrder expectation;

    private static ProductInOrder createProductInOrder(Product productFromCatalog, Order orderInCart) {
        return ProductInOrder.builder()
                .id(5L)
                .order(orderInCart)
                .product(productFromCatalog)
                .quantity(PRODUCT_IN_ORDER_QUANTITY)
                .build();
    }

    private static Product createProduct() {
        return Product.builder()
                .imageLink(PRODUCT_IMG_LINK)
                .name(PRODUCT_NAME)
                .price(PRODUCT_PRICE)
                .build();
    }

    private static Order createOrder(User user) {
        return Order.builder()
                .status(NEW)
                .user(user)
                .build();
    }

    @Before
    public void setUp(){
        user = userRepository.save(UserServiceTest.createUser());
        productFromCatalog = productRepository.save(createProduct());
        orderInCart = orderRepository.save(createOrder(user));
        expectation = createProductInOrder(productFromCatalog, orderInCart);
    }

    @Test
    public void shouldReturnAddedProductInOrderInCart() {

        ProductInOrder result = productInOrderService.addOrderInCart(productFromCatalog.getId(), user);

        Optional<ProductInOrder> actual = productInOrderRepository.findById(result.getId());

        assertNotNull(actual);
        assertEquals(expectation, actual.get());
    }
}