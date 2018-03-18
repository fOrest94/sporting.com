package com.ors.web;


import com.ors.DTO.SearchObjectDTO;
import com.ors.model.Contact;
import com.ors.model.User;
import com.ors.service.ContactService;
import com.ors.service.ObjectService;
import com.ors.service.RankingService;
import com.ors.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by DuduŚ on 2016-12-16.
 */
@Controller
public class ContactController {

    @Autowired
    private ContactService contactService;

    @Autowired
    private RankingService rankingService;

    @Autowired
    private ObjectService objectService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contactService(Model model) {

        model.addAttribute("contactForm", new Contact());
        return "contact";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.POST)
    public String contactService(@ModelAttribute("contactForm") Contact contact, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            return "/contact";
        }
        contact.setUserId(1L);
        contactService.saveMessage(contact);
        model.addAttribute("topObjects", rankingService.getTopSportObjects());
        model.addAttribute("showListOfObjectForm", new SearchObjectDTO());
        return "/index";
    }

    @RequestMapping(value = "/contact/{ObjectId}", method = RequestMethod.GET)
    public String contactObjectOwner(@PathVariable("ObjectId") Long ObjectId, Model model, HttpServletRequest request) {

        try{
            if(request.getUserPrincipal().getName() != null)
                model.addAttribute("userName",userService.findByUsername((request.getUserPrincipal().getName())));
        }
        catch (NullPointerException e){
            System.out.println("jebaj sie");
        }


        model.addAttribute("contactForm", new Contact());
        model.addAttribute("contactObject", objectService.findById(ObjectId));
        model.addAttribute("ownerOfObject", userService.findByObjectId(ObjectId).getId());
        return "contact";
    }

    @RequestMapping(value = "/contact/{ObjectId}", method = RequestMethod.POST)
    public String contactObjectOwnerSend(@PathVariable("ObjectId") Long ObjectId,@ModelAttribute("contactForm") Contact contact, Model model, HttpServletRequest request) {

        System.out.println("dsadasd");
        contactService.saveMessage(contact);

        model.addAttribute("topObjects", rankingService.getTopSportObjects());
        model.addAttribute("showListOfObjectForm", new SearchObjectDTO());
        return "/object/"+ObjectId;
    }
}
