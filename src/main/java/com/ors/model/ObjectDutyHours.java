package com.ors.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;


@Entity
@Table(name = "czas_otwarcia_obiektu")

public class ObjectDutyHours
{
    @Id
    @NotNull
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "id_obiektu")
    private Long objectId;

    @NotNull
    @Column(name = "poniedzialek_otwarcie")
    private String mondayOpening;

    @NotNull
    @Column(name = "poniedzialek_zamkniecie")
    private String mondayClosing;

    @NotNull
    @Column(name = "wtorek_otwarcie")
    private String tuesdayOpening;

    @NotNull
    @Column(name = "wtorek_zamkniecie")
    private String tuesdayClosing;

    @NotNull
    @Column(name = "sroda_otwarcie")
    private String wednesdayOpening;

    @NotNull
    @Column(name = "sroda_zamkniecie")
    private String wednesdayClosing;

    @NotNull
    @Column(name = "czwartek_otwarcie")
    private String thursdayOpening;

    @NotNull
    @Column(name = "czwartek_zamkniecie")
    private String thursdayClosing;

    @NotNull
    @Column(name = "piatek_otwarcie")
    private String fridayOpening;

    @NotNull
    @Column(name = "piatek_zamkniecie")
    private String fridayClosing;

    @NotNull
    @Column(name = "sobota_otwarcie")
    private String saturdayOpening;

    @NotNull
    @Column(name = "sobota_zamkniecie")
    private String saturdayClosing;

    @NotNull
    @Column(name = "niedziela_otwarcie")
    private String sundayOpening;

    @NotNull
    @Column(name = "niedziela_zamkniecie")
    private String sundayClosing;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getObjectId()
    {
        return objectId;
    }

    public void setObjectId(Long objectId)
    {
        this.objectId = objectId;
    }

    public String getMondayOpening()
    {
        return mondayOpening;
    }

    public void setMondayOpening(String mondayOpening)
    {
        this.mondayOpening = mondayOpening;
    }

    public String getMondayClosing()
    {
        return mondayClosing;
    }

    public void setMondayClosing(String mondayClosing)
    {
        this.mondayClosing = mondayClosing;
    }

    public String getTuesdayOpening()
    {
        return tuesdayOpening;
    }

    public void setTuesdayOpening(String tuesdayOpening)
    {
        this.tuesdayOpening = tuesdayOpening;
    }

    public String getTuesdayClosing()
    {
        return tuesdayClosing;
    }

    public void setTuesdayClosing(String tuesdayClosing)
    {
        this.tuesdayClosing = tuesdayClosing;
    }

    public String getWednesdayOpening()
    {
        return wednesdayOpening;
    }

    public void setWednesdayOpening(String wednesdayOpening)
    {
        this.wednesdayOpening = wednesdayOpening;
    }

    public String getWednesdayClosing()
    {
        return wednesdayClosing;
    }

    public void setWednesdayClosing(String wednesdayClosing)
    {
        this.wednesdayClosing = wednesdayClosing;
    }

    public String getThursdayOpening()
    {
        return thursdayOpening;
    }

    public void setThursdayOpening(String thursdayOpening)
    {
        this.thursdayOpening = thursdayOpening;
    }

    public String getThursdayClosing()
    {
        return thursdayClosing;
    }

    public void setThursdayClosing(String thursdayClosing)
    {
        this.thursdayClosing = thursdayClosing;
    }

    public String getFridayOpening()
    {
        return fridayOpening;
    }

    public void setFridayOpening(String fridayOpening)
    {
        this.fridayOpening = fridayOpening;
    }

    public String getFridayClosing()
    {
        return fridayClosing;
    }

    public void setFridayClosing(String fridayClosing)
    {
        this.fridayClosing = fridayClosing;
    }

    public String getSaturdayOpening()
    {
        return saturdayOpening;
    }

    public void setSaturdayOpening(String saturdayOpening)
    {
        this.saturdayOpening = saturdayOpening;
    }

    public String getSaturdayClosing()
    {
        return saturdayClosing;
    }

    public void setSaturdayClosing(String saturdayClosing)
    {
        this.saturdayClosing = saturdayClosing;
    }

    public String getSundayOpening()
    {
        return sundayOpening;
    }

    public void setSundayOpening(String sundayOpening)
    {
        this.sundayOpening = sundayOpening;
    }

    public String getSundayClosing()
    {
        return sundayClosing;
    }

    public void setSundayClosing(String sundayClosing)
    {
        this.sundayClosing = sundayClosing;
    }

}
