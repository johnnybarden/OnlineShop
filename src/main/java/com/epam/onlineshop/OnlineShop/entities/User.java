package com.epam.onlineshop.OnlineShop.entities;

import lombok.*;
import org.springframework.stereotype.Component;

import javax.persistence.*;

@Entity
@Component
@Getter
@Setter
@EqualsAndHashCode
@AllArgsConstructor
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, unique = true)
    private long id;

    @Column(name = "role", nullable = false)
    private String role;

    @Column(name = "username", nullable = false, unique = true)
    private String username;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "isBlocked")
    private boolean isBlocked;

    @Column(name = "address", nullable = false)
    private String address;

    public User() {
    }

    public User(String role, String username, String password, boolean isBlocked, String address) {
        this.role = role;
        this.username = username;
        this.isBlocked = isBlocked;
        this.address = address;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
}
