package com.ors.service;

import com.ors.model.Contact;
import com.ors.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-16.
 */
@Component
public class ContactServiceImpl implements ContactService {

    @Autowired
    private ContactRepository contactRepository;

    @Override
    public void saveMessage(Contact contact) {
        contactRepository.save(contact);
    }

    @Override
    public List<Contact> getContactMess() {
        return contactRepository.findAll();
    }

    @Override
    public List<Contact> getContactMessByUserId(Long id) {
        return contactRepository.findByUserId(id);
    }
}
