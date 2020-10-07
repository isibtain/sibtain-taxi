package com.bonvoyage.service;
/**
 * @author Aser Ahmad
 * @author aaahmad@mum.edu
 *  * @version 1.0
 *  * @since 1.0
 *
 */

import com.bonvoyage.domain.User;
import com.bonvoyage.domain.UserRole;

import java.util.List;

public interface UserService {
    void saveUser(User user);

    User findUserById(Long id);

    List<User> findAllUsers();

    List<User> findUsersByRole(UserRole userRole);

    boolean usernameExists(String username);

    User findUserByUsername(String username);

    boolean isCurrentUser(String username, String password);

}
