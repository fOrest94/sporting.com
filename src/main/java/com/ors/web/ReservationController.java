package com.ors.web;

import com.ors.model.*;
import com.ors.model.Object;
import com.ors.service.ObjectDutyHoursService;
import com.ors.service.ObjectService;
import com.ors.service.PriceListService;
import com.ors.service.ReservationService;
import com.ors.validator.ReservationValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by DuduŚ on 2016-12-11.
 */
@Controller
public class ReservationController {

    @Autowired
    private ReservationValidator validator;

    @Autowired
    private PriceListService priceListService;

    @Autowired
    private ObjectService objectService;

    @Autowired
    private ObjectDutyHoursService objectDutyHoursService;

    @Autowired
    private ReservationService reservationService;

    @RequestMapping(value = "/reservation", method = RequestMethod.GET)
    public String reservationAssignment(HttpServletRequest request, @RequestParam(value = "objectId", required = false) String objectId, Model model) {

        User user = priceListService.getUser(request.getUserPrincipal().getName());
        PriceList price = priceListService.findById(Long.valueOf(objectId));
        Object object = objectService.findById(price.getObjectId());
        ObjectDutyHours objectDutyHours = objectDutyHoursService.findByObjectId(object.getId());

        model.addAttribute("user", user);
        model.addAttribute("price", price);
        model.addAttribute("object", object);
        model.addAttribute("objectDutyHours", objectDutyHours);
        model.addAttribute("reservationForm", new Reservation());

        return "reservation";
    }

    @RequestMapping(value = "/reservation", method = RequestMethod.POST)
    public String reservationAssignment(@ModelAttribute("reservationForm") Reservation reservation, BindingResult bindingResult, Model model) {
        validator.validate(reservation,bindingResult);

        if (bindingResult.hasErrors()) {
            return "reservation";
        }
        /*System.out.println(reservation);
        List<Reservation> reservationList = reservationService.findAll();

        for (Reservation reserv: reservationList) {
            if(reserv.getDayOfReservation().equals(reservation.getDayOfReservation()) && reserv.getHourOfReservation().equals(reservation.))
        }
        if(reservationList.)*/
        reservationService.save(reservation);
        // Trzeba dodać walidacje co w wypadku jak juz istnieje taka rezerwacja
        System.out.print(reservation.toString());
        return "/index";
    }




}
