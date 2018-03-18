package com.ors.service;

import com.ors.model.Contact;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-16.
 */
public interface ContactService {
    void saveMessage(Contact contact);
    List<Contact> getContactMess();
    List<Contact> getContactMessByUserId(Long id);
}
