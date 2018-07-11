package com.epam.onlineshop.repository;

import com.epam.onlineshop.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
    User findByUsername(@Param("username") String username);

    @Query("SELECT CASE WHEN (count(u) > 0) THEN true ELSE false END FROM User u WHERE u.username = :username AND u.password = :password")
    boolean findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

}