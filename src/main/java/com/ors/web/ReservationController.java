package com.ors.web;

import com.ors.DTO.SearchObjectDTO;
import com.ors.model.*;
import com.ors.model.Object;
import com.ors.service.*;
import com.ors.validator.ReservationValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

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

    @Autowired
    private RankingService rankingService;

    @RequestMapping(value = "/reservation/{objectId}", method = RequestMethod.GET)
    public String reservationAssignment(@PathVariable("objectId") Long objectId, HttpServletRequest request, Model model) {

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

    @RequestMapping(value = "/reservation/{objectId}", method = RequestMethod.POST)
    public String reservationAssignment(@ModelAttribute("reservationForm") Reservation reservation, BindingResult bindingResult, Model model) {
        System.out.println("ssssssssssssss    cxvcxv "+reservation.getDayOfReservation()+"  "+reservation.getHourOfReservation()+"  "+reservation.getHourOfEndReservation());
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
        model.addAttribute("topObjects", rankingService.getTopSportObjects());
        model.addAttribute("showListOfObjectForm", new SearchObjectDTO());
        return "redirect:/index";
    }




}
