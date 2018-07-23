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

import java.util.List;
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
    private final static String ANOTHER_PRODUCT_NAME = "Reason";
    private final static Integer PRODUCT_PRICE = 10;
    private final static Category PRODUCT_CATEGORY = Category.STAR_TREK;
    private final static Integer PRODUCT_IN_ORDER_QUANTITY = 1;

    private User user;
    private Product productFromCatalog;
    private Product anotherProductFromCatalog;
    private Order orderInCart;
    private ProductInOrder expectation;


    public static ProductInOrder createProductInOrder(Product productFromCatalog, Order orderInCart) {
        return ProductInOrder.builder()
                .id(5L)
                .order(orderInCart)
                .product(productFromCatalog)
                .quantity(PRODUCT_IN_ORDER_QUANTITY)
                .build();
    }

    public static Product createProduct() {
        return Product.builder()
                .imageLink(PRODUCT_IMG_LINK)
                .name(PRODUCT_NAME)
                .price(PRODUCT_PRICE)
                .category(PRODUCT_CATEGORY)
                .build();
    }

    public static Product createAnotherProduct() {
        return Product.builder()
                .imageLink(PRODUCT_IMG_LINK)
                .name(ANOTHER_PRODUCT_NAME)
                .price(PRODUCT_PRICE)
                .category(PRODUCT_CATEGORY)
                .build();
    }

    public static Order createOrder(User user) {
        return Order.builder()
                .status(NEW)
                .user(user)
                .build();
    }

    @Before
    public void setUp() {
        user = userRepository.save(UserServiceTest.createUser());
        productFromCatalog = productRepository.save(createProduct());
        orderInCart = orderRepository.save(createOrder(user));
        expectation = createProductInOrder(productFromCatalog, orderInCart);

        anotherProductFromCatalog = createAnotherProduct();
        productRepository.save(anotherProductFromCatalog);
    }

    @Test
    public void shouldReturnAddedProductInOrderInCart() {

        Optional<ProductInOrder> productInOrderWithThisProduct = productInOrderRepository.findOneOrderInCartByUserAndProductId(expectation.getProduct().getId(), user);
        ProductInOrder actual;

        if (productInOrderWithThisProduct.isPresent()) {
            productInOrderService.addOrderInCart(productFromCatalog.getId(), user);
            actual = productInOrderWithThisProduct.get();

            assertEquals(expectation.getId(), actual.getId());
        } else {
            actual = productInOrderService.addOrderInCart(productFromCatalog.getId(), user);
        }

        assertEquals(expectation.getQuantity(), actual.getQuantity());

    }

    @Test
    public void shouldMakeAllNewOrdersPrepaid() {

        productInOrderService.makeOrder(user);
        List<ProductInOrder> userProductsInOrders = productInOrderRepository.findAllOrderedByUser(user);

        Status expected = Status.PREPAID;

        for (ProductInOrder productInOrder : userProductsInOrders) {
            Status actual = productInOrder.getOrder().getStatus();
            assertEquals(expected, actual);
        }
    }

    @Test
    public void shouldFindAllNewOrdersByUser() {
        List<ProductInOrder> expected = productInOrderRepository.findAllNewOrderByUser(user);
        List<ProductInOrder> actual = productInOrderService.findAllNewOrderByUser(user);

        assertEquals(expected.size(), actual.size());

        for (int i = 0; i < expected.size(); i++) {
            assertEquals(expected.get(i).getId(), actual.get(i).getId());
            assertEquals(expected.get(i).getQuantity(), actual.get(i).getQuantity());
        }
    }
}