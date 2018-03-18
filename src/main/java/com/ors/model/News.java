package com.ors.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by cos on 15.12.2016.
 */
@Entity
@Table(name = "aktualnosci")
public class News {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "id_obiektu")
    private Long objectId;

    @Transient
    private Long objectId2;

    @NotNull
    @Column(name = "tytul")
    private String title;

    @NotNull
    @Column(name = "opis")
    private String description;

    @NotNull
    @Column
    private String data;

    public News() {
    }

    public News(Long id, Long objectId) {
        this.id = id;
        this.objectId = objectId;
    }

    public Long getObjectId2() {
        return objectId2;
    }

    public void setObjectId2(Long objectId2) {
        this.objectId2 = objectId2;
    }

    public Long getObjectId() {
        return objectId;
    }

    public void setObjectId(Long objectId) {
        this.objectId = objectId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", data='" + data + '\'' +
                ", objectId=" + objectId +
                '}';
    }
}
