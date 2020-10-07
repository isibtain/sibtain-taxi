package com.bonvoyage.repository;
/**
 * @author Aser Ahmad
 * @author aaahmad@mum.edu
 *  * @version 1.0
 *  * @since 1.0
 *
 */
import com.bonvoyage.domain.User;
import com.bonvoyage.domain.UserRole;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

    String USERS_BY_ROLE = "select u from User u where u.userRole = :role";
    String GET_USER_BY_USERNAME = "select u from User u where u.username = :un";
    String COUNT_OF_USER_BY_USERNAME_AND_PASSWORD = "select count(u) from User u " +
                                                    "where u.username = :un and u.password = :pw";

    @Query(value = USERS_BY_ROLE)
    List<User> findUsersByRole(@Param("role") UserRole userRole);

    @Query(value = GET_USER_BY_USERNAME)
    User findUserByUsername(@Param("un") String username);

    @Query(value=COUNT_OF_USER_BY_USERNAME_AND_PASSWORD)
    int isCurrentUser(@Param("un")String username, @Param("pw")String password);
}
