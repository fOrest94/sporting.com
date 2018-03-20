package com.ors.validator;

import com.ors.DTO.SearchObjectDTO;
import com.ors.model.Reservation;
import com.ors.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Component
public class ReservationValidator implements Validator {

    @Autowired
    private ReservationService reservationService;

    private boolean isEndOfReservationLaterThanStartOfReserv(String startOfReservation, String endOfReservation) {
        Integer hourStartReservation = Integer.valueOf(startOfReservation.substring(0, startOfReservation.indexOf(":")));
        Integer hourEndOfReservation = Integer.valueOf(endOfReservation.substring(0, endOfReservation.indexOf(":")));
        if (hourEndOfReservation > hourStartReservation) {
            return true;
        }
        return false;
    }

    private boolean gotDateIsNotBeforeThanToday(String date) {
        if (date.length() < 2)
            return true;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
            Date gotDate = sdf.parse(date);
            Date currentDate = sdf.parse(sdf.format(new Date()));
            currentDate.setTime(currentDate.getTime() + 24 * 60 * 60 * 1000);
            if (gotDate.before(currentDate))
                return false;
            return true;
        } catch (ParseException e) {
            return false;
        }
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return aClass.isInstance(Reservation.class);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Reservation reservation = (Reservation) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dayOfReservation", "Reservation.emptyDate");

        if (!isEndOfReservationLaterThanStartOfReserv(reservation.getHourOfReservation(),
                reservation.getHourOfEndReservation())) {
            //errors.rejectValue("hourOfEndReservation", "Reservation.invalidHoursOfReservation");
        }
        else if (!gotDateIsNotBeforeThanToday(reservation.getDayOfReservation())) {
            //errors.rejectValue("dayOfReservation", "Reservation.invalidDateOfReservation");
        }

        else if (!gotDateIsNotBeforeThanToday(reservation.getDayOfReservation())) {
            //errors.rejectValue("dayOfReservation", "Reservation.invalidDateOfReservation");
        }

        else if (reservationService.findByProperTime(reservation.getDayOfReservation(), reservation.getHourOfReservation(), reservation.getHourOfEndReservation()).size() > 0) {
            errors.rejectValue("dayOfReservation", "Reservation.existInDatabase");
        }

        else if (reservationService.findByProperTime(reservation.getDayOfReservation(), reservation.getHourOfReservation(), reservation.getHourOfEndReservation()).size() > 0) {
            errors.rejectValue("dayOfReservation", "Reservation.existInDatabase");
        }
    }
}
