package com.epam.onlineshop;

import com.epam.onlineshop.entities.Role;
import com.epam.onlineshop.entities.User;
import com.epam.onlineshop.repository.UserRepository;
import com.epam.onlineshop.services.UserService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.Optional;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserServiceTest {

    @Autowired
    private UserService userService;
    @Autowired
    private UserRepository userRepository;

    private final static String USERNAME = "USERNAME";
    private final static String PASSWORD = "123";
    private final static String FIRSTNAME = "Alex";
    private final static String SECONDNAME = "Petrov";
    private final static String PHONENUMBER = "+ 7 999 021 06 14";
    private final static String ADDRESS = "aaa";


    private final static String FIRSTNAME_NEW = "Alex123";
    private final static String SECONDNAME_NEW = "Petrov123";
    private final static String PHONENUMBER_NEW = "+ 7 999 888 77 66";
    private final static String ADDRESS_NEW = "aaa123";

    private User expected;

    public static User createUser() {
        return User.builder().id(5L)
                .username(USERNAME)
                .password(PASSWORD)
                .role(Role.USER)
                .firstName(FIRSTNAME)
                .secondName(SECONDNAME)
                .phoneNumber(PHONENUMBER)
                .address(ADDRESS)
                .isBlocked(false)
                .build();
    }

    @Before
    public void setUp(){
        expected = createUser();
    }

    @Test
    public void shouldReturnNewUserFromDB() {
        userService.addUser(expected);

        User actual = userRepository.findByUsername(expected.getUsername());

        assertEquals(expected.getUsername(), actual.getUsername());
        assertEquals(expected.getAddress(), actual.getAddress());
        assertEquals(expected.getFirstName(), actual.getFirstName());
        assertEquals(expected.getRole(), actual.getRole());
        assertEquals(expected.getId(), actual.getId());
        assertEquals(expected.getIsBlocked(), actual.getIsBlocked());
    }

    @Test
    public void shouldReturnChangedStatusInUser() {
        User expected = createUser();
        userRepository.save(expected);

        expected.setIsBlocked(true);
        userService.changeBlockedStatus(expected);

        User actual = userRepository.findByUsername(expected.getUsername());

        assertEquals(expected.getUsername(), actual.getUsername());
        assertEquals(expected.getAddress(), actual.getAddress());
        assertEquals(expected.getFirstName(), actual.getFirstName());
        assertEquals(expected.getRole(), actual.getRole());
        assertEquals(expected.getId(), actual.getId());
        assertEquals(expected.getIsBlocked(), actual.getIsBlocked());
    }

    @Test
    public void shouldReturnUpdatedUser() {
        User expected = createUser();
        userRepository.save(expected);

        expected.setFirstName(FIRSTNAME_NEW);
        expected.setSecondName(SECONDNAME_NEW);
        expected.setAddress(ADDRESS_NEW);
        expected.setPhoneNumber(PHONENUMBER_NEW);
        userService.updateUser(expected);

        User actual = userRepository.findByUsername(expected.getUsername());

        assertEquals(expected.getUsername(), actual.getUsername());
        assertEquals(expected.getAddress(), actual.getAddress());
        assertEquals(expected.getFirstName(), actual.getFirstName());
        assertEquals(expected.getRole(), actual.getRole());
        assertEquals(expected.getId(), actual.getId());
        assertEquals(expected.getIsBlocked(), actual.getIsBlocked());
    }

    @Test
    public void shouldReturnFoundUserByUsername() {
        User newUser = createUser();
        userRepository.save(newUser);

        User expected = userService.findByUsername(newUser.getUsername());

        User actual = userRepository.findByUsername(newUser.getUsername());

        assertEquals(expected.getUsername(), actual.getUsername());
        assertEquals(expected.getAddress(), actual.getAddress());
        assertEquals(expected.getFirstName(), actual.getFirstName());
        assertEquals(expected.getRole(), actual.getRole());
        assertEquals(expected.getId(), actual.getId());
        assertEquals(expected.getIsBlocked(), actual.getIsBlocked());
    }

    @Test
    public void shouldReturnUserRoleByUsername() {
        User newUser = createUser();
        userRepository.save(newUser);

        Role expected = userService.getRoleByUsername(newUser.getUsername());

        Role actual = userRepository.findByUsername(newUser.getUsername()).getRole();

       assertEquals(expected, actual);
    }

    @Test
    public void shouldReturnAllUsers() {
        List<User> expected = userService.getAllUsers();
        List<User> actual = userRepository.findAll();

        assertEquals(expected.size(), actual.size());

        for (int i = 0; i < expected.size(); i++) {
            assertEquals(expected.get(i).getUsername(), actual.get(i).getUsername());
            assertEquals(expected.get(i).getAddress(), actual.get(i).getAddress());
            assertEquals(expected.get(i).getFirstName(), actual.get(i).getFirstName());
            assertEquals(expected.get(i).getRole(), actual.get(i).getRole());
            assertEquals(expected.get(i).getId(), actual.get(i).getId());
            assertEquals(expected.get(i).getIsBlocked(), actual.get(i).getIsBlocked());
        }
    }

    @Test
    public void shouldReturnFoundUserById() {
        User newUser = createUser();
        userRepository.save(newUser);

        User expected = userService.findById(newUser.getId());

        Optional<User> optionalActual = userRepository.findById(newUser.getId());
        assertNotNull(optionalActual);

        User actual = optionalActual.get();
        assertEquals(expected.getUsername(), actual.getUsername());
        assertEquals(expected.getAddress(), actual.getAddress());
        assertEquals(expected.getFirstName(), actual.getFirstName());
        assertEquals(expected.getRole(), actual.getRole());
        assertEquals(expected.getId(), actual.getId());
        assertEquals(expected.getIsBlocked(), actual.getIsBlocked());
    }
}