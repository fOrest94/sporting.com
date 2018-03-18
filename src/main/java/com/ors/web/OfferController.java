package com.ors.web;

import com.ors.model.Object;
import com.ors.service.ObjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-16.
 */
@Controller
public class OfferController {

    @Autowired
    ObjectService objectService;

    @RequestMapping(value = "/offer", method = RequestMethod.GET)
    public String contactService(Model model) {

        List<Object> object = objectService.findAll();

        model.addAttribute("offerList", object);
        return "offer";
    }

}
