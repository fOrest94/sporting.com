package com.ors.model;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.text.DecimalFormat;

/**
 * Created by cos on 07.12.2016.
 */

@Entity
@Table(name = "obiekt")
public class Object {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "nazwa")
    private String name;

    @NotNull
    @Column(name = "miasto")
    private String place;

    @NotNull
    @Column(name = "ulica")
    private String street;

    @NotNull
    @Column(name = "kod_pocztowy")
    private String postKey;

    @NotNull
    @Column(name = "opis")
    private String description;

    @Column(name = "cena")
    private String price;

    @Column(name = "zdjecie")
    private String picture;

    @Column(name = "cena_ulgowa")
    private Integer extraPrice;

    @Column(name = "cena_ulgowa_wartosc")
    private Integer extraPriceValue;

    @Column(name = "ocena")
    private String mark;

    @Column(name = "ocena_ilosc")
    private String markCount;

    @Column(name = "zatwierdzony")
    private String objectAccept;

    @Transient
    MultipartFile picture1;

    @Transient
    MultipartFile picture2;

    @Transient
    MultipartFile picture3;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getPostKey() {
        return postKey;
    }

    public void setPostKey(String postKey) {
        this.postKey = postKey;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Integer getExtraPrice() {
        return extraPrice;
    }

    public void setExtraPrice(Integer extraPrice) {
        this.extraPrice = extraPrice;
    }

    public Integer getExtraPriceValue() {
        return extraPriceValue;
    }

    public void setExtraPriceValue(Integer extraPriceValue) {
        this.extraPriceValue = extraPriceValue;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public String getMarkCount() {
        return markCount;
    }

    public void setMarkCount(String markCount) {
        this.markCount = markCount;
    }

    public String getObjectAccept() {
        return objectAccept;
    }

    public void setObjectAccept(String objectAccept) {
        this.objectAccept = objectAccept;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public MultipartFile getPicture1() {
        return picture1;
    }

    public void setPicture1(MultipartFile picture1) {
        this.picture1 = picture1;
    }

    public MultipartFile getPicture2() {
        return picture2;
    }

    public void setPicture2(MultipartFile picture2) {
        this.picture2 = picture2;
    }

    public MultipartFile getPicture3() {
        return picture3;
    }

    public void setPicture3(MultipartFile picture3) {
        this.picture3 = picture3;
    }

    @Override
    public String toString() {
        return "Object{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", place='" + place + '\'' +
                ", street='" + street + '\'' +
                ", postKey='" + postKey + '\'' +
                ", description='" + description + '\'' +
                ", picture='" + picture + '\'' +
                ", extraPrice=" + extraPrice +
                ", extraPriceValue=" + extraPriceValue +
                ", mark='" + mark + '\'' +
                ", markCount='" + markCount + '\'' +
                ", objectAccept='" + objectAccept + '\'' +
                '}';
    }
}
