package com.ors.web;

import com.ors.DTO.SearchObjectDTO;
import com.ors.model.Object;
import com.ors.model.Reservation;
import com.ors.model.User;
import com.ors.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
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

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String welcome(Model model) {

        model.addAttribute("topObjects", rankingService.getTopSportObjects());
        model.addAttribute("showListOfObjectForm", new SearchObjectDTO());
        return "/index";
    }

    @RequestMapping(value = {"/","/index"}, method = RequestMethod.POST)
    public String showListOfObject(@ModelAttribute("showListOfObjectForm") SearchObjectDTO searchObjectDTO, BindingResult bindingResult, Model model) {
        List<Reservation> reservationList = reservationService.findByProperTime(searchObjectDTO.getDate(), searchObjectDTO.getStartTime(), searchObjectDTO.getEndTime());
        List<Object> objectList = new ArrayList<>();

        for (Reservation reservation: reservationList) {
            objectList.add(objectService.findById(reservation.getObjectId()));
        }

        model.addAttribute("objectList", objectList);
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
}
