package com.ors.repository;

import com.ors.model.Contact;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-16.
 */
public interface ContactRepository extends JpaRepository<Contact, Long> {
    List<Contact> findByUserId(Long id);
}
