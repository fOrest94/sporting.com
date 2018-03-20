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
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by DuduŚ on 2016-12-11.
 */
@Controller
public class ReservationController {

    @Autowired
    private ReservationValidator reservationValidator;

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

        System.out.println("1");
        User user = priceListService.getUser(request.getUserPrincipal().getName());System.out.println("1");
        //PriceList price = priceListService.findById(Long.valueOf(objectId));System.out.println("1");
        Object object = objectService.findById(objectId);System.out.println("1");
        //ObjectDutyHours objectDutyHours = objectDutyHoursService.findByObjectId(object.getId());System.out.println("1");

        model.addAttribute("user", user);
        //model.addAttribute("price", price);
        model.addAttribute("object", object);
        //model.addAttribute("objectDutyHours", objectDutyHours);
        model.addAttribute("reservationForm", new Reservation());

        return "reservation";
    }

    @RequestMapping(value = "/reservation/{objectId}", method = RequestMethod.POST)
    public String reservationAssignment(@ModelAttribute("reservationForm") Reservation reservation, @PathVariable("objectId") Long objectId, BindingResult bindingResult, Model model) {

        reservationValidator.validate(reservation,bindingResult);

        if (bindingResult.hasErrors()) {
            return "reservation";
        }

        int startTime = Integer.valueOf(reservation.getHourOfReservation().replace(":", ""));
        int endTime = Integer.valueOf(reservation.getHourOfEndReservation().replace(":",""));
        int date = Integer.valueOf(reservation.getDayOfReservation().replace("/",""));

        List<Reservation> reservationList = reservationService.findAllByObjectId(objectId);


        List<Reservation> reservationListProperDay = new ArrayList<>();
        for (Reservation reserv  : reservationList) {
            int tempDate = Integer.valueOf(reserv.getDayOfReservation().replace("/",""));

            if( (tempDate == date))
                reservationListProperDay.add(reserv);
        }

        if(reservationListProperDay.size() == 0){
            reservationService.save(reservation);
            model.addAttribute("topObjects", rankingService.getTopSportObjects());
            model.addAttribute("showListOfObjectForm", new SearchObjectDTO());
            return "index";
        }
        else {
            int counter = 0;
            int sizeOfCurrentReservation = reservationListProperDay.size();
            System.out.println("size cur "+sizeOfCurrentReservation);
            for (Reservation reserv: reservationListProperDay) {
                int tempStart = Integer.valueOf(reserv.getHourOfReservation().replace(":", ""));
                int tempEnd = Integer.valueOf(reserv.getHourOfEndReservation().replace(":",""));
                if(endTime <= tempStart){
                    counter++;System.out.println("xxx "+endTime+"  "+tempStart+"  ha "+ reserv.getObjectId());
                }
                else if (startTime >= tempEnd){
                    counter++;System.out.println("xxx "+startTime+"  "+tempEnd+"  ham "+ reserv.getObjectId());
                }
            }

            if(counter < sizeOfCurrentReservation){
                System.out.println("number is "+counter+" sdsds "+sizeOfCurrentReservation);
                model.addAttribute("topObjects", rankingService.getTopSportObjects());
                model.addAttribute("showListOfObjectForm", new SearchObjectDTO());
                bindingResult.rejectValue("dayOfReservation", "Reservation.noMoreFreePlace");
                return "reservation";
            }
            else {
                reservationService.save(reservation);
                model.addAttribute("topObjects", rankingService.getTopSportObjects());
                model.addAttribute("showListOfObjectForm", new SearchObjectDTO());
                return "index";
            }
        }
    }




}
