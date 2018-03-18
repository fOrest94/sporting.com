package com.ors.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by DuduŚ on 2016-12-12.
 */
@Entity
@Table(name = "rezerwacja")
public class Reservation {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "id_uzytkownika")
    private Long userId;

    @NotNull
    @Column(name = "id_obiektu")
    private Long objectId;

    @NotNull
    @Column(name = "dzien_rezerwacji")
    private String dayOfReservation;

    @NotNull
    @Column(name = "godzina_rezerwacji")
    private String hourOfReservation;

    @NotNull
    @Column(name = "godzina_zakonczenia_rezerwacji")
    private String hourOfEndReservation;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getObjectId() {
        return objectId;
    }

    public void setObjectId(Long objectId) {
        this.objectId = objectId;
    }

    public String getDayOfReservation() {
        return dayOfReservation;
    }

    public void setDayOfReservation(String dayOfReservation) {
        this.dayOfReservation = dayOfReservation;
    }

    public String getHourOfReservation() {
        return hourOfReservation;
    }

    public void setHourOfReservation(String hourOfReservation) {
        this.hourOfReservation = hourOfReservation;
    }

    public String getHourOfEndReservation() {
        return hourOfEndReservation;
    }

    public void setHourOfEndReservation(String hourOfEndReservation) {
        this.hourOfEndReservation = hourOfEndReservation;
    }

    @Override
    public String toString() {
        return "Reservation{" +
                "id=" + id +
                ", userId='" + userId + '\'' +
                ", objectId='" + objectId + '\'' +
                ", dayOfReservation='" + dayOfReservation + '\'' +
                ", hourOfReservation='" + hourOfReservation + '\'' +
                ", hourOfEndReservation='" + hourOfEndReservation + '\'' +
                '}';
    }
}
