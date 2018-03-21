package com.ors.web;

import com.ors.DTO.SearchObjectDTO;
import com.ors.model.Object;
import com.ors.model.Reservation;
import com.ors.model.User;
import com.ors.service.*;
import com.ors.validator.ReservationValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by cos on 07.12.2016.
 */
@Controller
public class ObjectController {
    @Autowired
    private ObjectService objectService;

    @Autowired
    private RankingService rankingService;

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private ObjectDutyHoursService objectDutyHoursService;

    @Autowired
    private PriceListService priceListService;

    @Autowired
    private ReservationValidator validator;

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String welcome(Model model) {

        model.addAttribute("topObjects", rankingService.getTopSportObjects());
        model.addAttribute("showListOfObjectForm", new SearchObjectDTO());
        return "/index";
    }

    @RequestMapping(value = {"/","/index"}, method = RequestMethod.POST)
    public String showListOfObject(@ModelAttribute("showListOfObjectForm") SearchObjectDTO searchObjectDTO, BindingResult bindingResult, Model model) {

        List<Object> objectList = objectService.findByPlace(searchObjectDTO.getObjectPlace());

        List<Reservation> reservationList = new ArrayList<>();
        for (Object object: objectList) {
            List<Reservation> temp = reservationService.findAllByObjectId(object.getId());
            for (Reservation tempPlus: temp) {
                if( tempPlus != null)
                    reservationList.add(tempPlus);
            }
        }

        int startTime = Integer.valueOf(searchObjectDTO.getStartTime().replace(":", ""));
        int endTime = Integer.valueOf(searchObjectDTO.getEndTime().replace(":",""));
        List<Object> objectListApprepiate = new ArrayList<>();

        for (Reservation reservation: reservationList) {
            int tempStart = Integer.valueOf(reservation.getHourOfReservation().replace(":", ""));
            int tempEnd = Integer.valueOf(reservation.getHourOfEndReservation().replace(":",""));

            if(searchObjectDTO.getDate().equals(reservation.getDayOfReservation()) && endTime <= tempStart)
                objectListApprepiate.add(objectService.findById(reservation.getObjectId()));
            else if (searchObjectDTO.getDate().equals(reservation.getDayOfReservation()) && startTime >= tempEnd)
                objectListApprepiate.add(objectService.findById(reservation.getObjectId()));
        }

       /* List<Object> newList = new ArrayList<>();

        for (Object object:objectListApprepiate) {

                for (Object object1:newList) {
                    if(object)
                }
        }*/

        model.addAttribute("objectList", objectListApprepiate);
        model.addAttribute("objectPlace", searchObjectDTO.getObjectPlace());
        return "objectList";
    }

    @RequestMapping(value = "/object/{id}", method = RequestMethod.GET)
    public String object(@PathVariable("id") Long id, Model model) {

        model.addAttribute("objectForm", objectService.findById(id));
        model.addAttribute("showListOfObjectForm", new SearchObjectDTO());
        model.addAttribute("objectDutyHours", priceListService.findByObjectId(id));
        return "object";
    }

    @RequestMapping(value = "/userObjectManagement", method = RequestMethod.GET)
    public String objectManagement(Model model, HttpServletRequest request) {

        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user",user);
        model.addAttribute("objectList", objectService.findAll());
        return "userObjectManagement";
    }

    @RequestMapping(value = "/userObjectManagement", method = RequestMethod.POST)
    public String objectManagementChange(@RequestParam("id") Long id, @RequestParam("operation") String operation ,Model model, HttpServletRequest request) {

        if(operation.equals("delete"))
            objectService.remove(id);
        else if (operation.equals("update"))
            objectService.acceptObject(id);

        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user",user);
        model.addAttribute("objectList", objectService.findAll());
        return "userObjectManagement";
    }

    @RequestMapping(value = "/rateObject/{id}", method = RequestMethod.POST)
    public String rateObject(@PathVariable("id") Long id, @RequestParam("stars") String stars ,Model model, HttpServletRequest request) {

        Object object = objectService.findById(id);
        int marksCount = Integer.valueOf(object.getMarkCount());

        if(marksCount == 0){
            objectService.updateMark(stars, String.valueOf(marksCount+1), id);
        }
        else {
            Double tempMark = Double.valueOf(object.getMark());
            String newMark = String.valueOf((Integer.valueOf(stars) + tempMark*marksCount)/(marksCount+1)).substring(0,3);
            objectService.updateMark(newMark, String.valueOf(marksCount+1), id);
        }
        model.addAttribute("objectForm", objectService.findById(id));
        model.addAttribute("showListOfObjectForm", new SearchObjectDTO());
        model.addAttribute("objectDutyHours", priceListService.findByObjectId(id));
        return "object";
    }
}



