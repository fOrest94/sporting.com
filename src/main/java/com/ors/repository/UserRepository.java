package com.ors.repository;


import com.ors.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;

public interface UserRepository extends JpaRepository<User, Long> {

    @Transactional
    @Modifying()
    @Query("UPDATE User c SET c.username = :email WHERE c.id = :id")
    int updateEmail(@Param("email") String email, @Param("id") Long id);

    @Transactional
    @Modifying()
    @Query("UPDATE User c SET c.password = :password WHERE c.id = :id")
    int updatePassword(@Param("password") String password, @Param("id") Long id);

    @Transactional
    @Modifying()
    @Query("UPDATE User c SET c.numberOfPhone = :numberOfPhone WHERE c.id = :id")
    int updatePhone(@Param("numberOfPhone") String numberOfPhone, @Param("id") Long id);

    User findByUsername(String username);

    User findByObjectId(Long objectId);
}
