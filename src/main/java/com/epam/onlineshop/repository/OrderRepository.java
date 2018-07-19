package com.epam.onlineshop.repository;

import com.epam.onlineshop.entities.Order;
import com.epam.onlineshop.entities.Status;
import com.epam.onlineshop.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    @Query("select newOrder from Order as newOrder " +
            "where newOrder.user = :user and newOrder.status = 'NEW'")
    Order getOneNewOrderByUser(@Param("user") User user);

    Optional<Order> findById(Long id);

    @Query("update Order set status = :status where id = :id")
    @Modifying
    Integer setStatusById(@Param("status") Status status, @Param("id") Long id);
}

