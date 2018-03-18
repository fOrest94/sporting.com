package com.ors.model;

import javax.persistence.*;

/**
 * Created by DuduŚ on 2016-12-16.
 */

@Entity
@Table(name = "wiadomosci")
public class Contact {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @Column(name = "kontakt_imie")
    String contactName;

    @Column(name = "kontakt_email")
    String contactEmail;

    @Column(name = "kontakt_tresc")
    String contactContent;

    @Column(name = "user_id")
    private Long userId;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getContactContent() {
        return contactContent;
    }

    public void setContactContent(String contactContent) {
        this.contactContent = contactContent;
    }
}
