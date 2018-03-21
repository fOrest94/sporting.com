package com.ors.web;

import com.ors.model.File;
import com.ors.model.Object;
import com.ors.model.User;
import com.ors.service.*;
import com.ors.validator.FileValidator;
import com.ors.validator.ObjectValidator;
import com.ors.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class UserController {

    @Autowired
    private FileValidator fileValidator;

    @Autowired
    private ObjectService objectService;

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private ObjectValidator objectValidator;

    @Autowired
    private PriceListService priceListService;

    @Autowired
    private ContactService contactService;

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {

        model.addAttribute("userForm", new User());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {

        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }
        System.out.println(userForm.toString());
        userService.save(userForm);
        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "index";
    }

    @RequestMapping(value = "/addObject", method = RequestMethod.GET)
    public String registerObject(Model model) {

        model.addAttribute("objectForm", new Object());
        return "addObject";
    }

    @RequestMapping(value = "/addObject", method = RequestMethod.POST)
    public String registerObject(@ModelAttribute("objectForm") Object objectForm, BindingResult bindingResult, Model model) {

        objectValidator.validate(objectForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "addObject";
        }
        objectService.save(objectForm);

        User user = new User();
        user.setObjectId(objectService.findByName(objectForm.getName()).getId());
        model.addAttribute("userForm", user);
        return "registration";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = "/userProfile", method = RequestMethod.GET)
    public String userProfile(Model model, HttpServletRequest request) {
        System.out.println("mam downa");
        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user", user);
        return "userProfile";
    }

    @RequestMapping(value = "/userObject/{id}", method = RequestMethod.GET)
    public String userObjectShow(@PathVariable("id") Long id, Model model, HttpServletRequest request) {

        User user = priceListService.getUser(request.getUserPrincipal().getName());

        File fileModel = new File();

        model.addAttribute("fileBucket", fileModel);
        model.addAttribute("objectForm", objectService.findById(id));
        model.addAttribute("user", user);

        return "userObject";
    }

    @RequestMapping(value = "/userObject/{id}", method = RequestMethod.POST)
    public String userObjectUpdate(@Valid@ModelAttribute("objectForm") Object editedObject, @PathVariable("id") Long id, Model model, BindingResult bindingResult, HttpServletRequest request) {

        System.out.println("sssssssssssssssssadasdafdxsfsdfv ");
        objectValidator.validate(editedObject, bindingResult);

        if (bindingResult.hasErrors()) {
            User user = priceListService.getUser(request.getUserPrincipal().getName());
            model.addAttribute("objectForm", objectService.findById(id));
            model.addAttribute("user", user);
            return "userObject";
        }
        System.out.println("obiekt id "+editedObject.getId());
        try {

            if(editedObject.getPicture1() != null) {
                String uploadLocation = request.getSession().getServletContext().getRealPath("/") + "resources\\img\\";
                String fileName = editedObject.getId() + ".1.jpg";
                System.out.println("obiekt id "+fileName);
                MultipartFile multipartFile = editedObject.getPicture1();
                multipartFile.transferTo(new java.io.File(uploadLocation + fileName));
            }

            if(editedObject.getPicture2() != null) {
                String uploadLocation = request.getSession().getServletContext().getRealPath("/") + "resources\\img\\";
                String fileName = editedObject.getId() + ".2.jpg";
                System.out.println("obiekt id "+fileName);
                MultipartFile multipartFile = editedObject.getPicture2();
                multipartFile.transferTo(new java.io.File(uploadLocation + fileName));
            }

            if(editedObject.getPicture3() != null) {
                String uploadLocation = request.getSession().getServletContext().getRealPath("/") + "resources\\img\\";
                String fileName = editedObject.getId() + ".3.jpg";
                System.out.println("obiekt id "+fileName);
                MultipartFile multipartFile = editedObject.getPicture3();
                multipartFile.transferTo(new java.io.File(uploadLocation + fileName));
            }

        } catch (Exception e) {
            System.out.println("Brak zdjęcia");
        }

        objectService.update(editedObject);

        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("fileBucket", new File());
        model.addAttribute("objectForm", objectService.findById(id));
        model.addAttribute("user", user);

        return "userObject";
    }

    @InitBinder("fileBucket")
    protected void initBinderFileBucket(WebDataBinder binder) {
        binder.setValidator(fileValidator);
    }

    @RequestMapping(value = "/userProfileReservation", method = RequestMethod.GET)
    public String userProfileReservation(Model model, HttpServletRequest request) {

        User user = priceListService.getUser(request.getUserPrincipal().getName());

        model.addAttribute("listsofReservation", reservationService.findByUserId(user.getId()));
        model.addAttribute("listsofObjects", objectService.findAll());
        model.addAttribute("user", user);

        return "userProfileReservation";
    }

    @RequestMapping(value = "/userProfileMessages", method = RequestMethod.GET)
    public String userProfileMessages(Model model, HttpServletRequest request) {

        User user = priceListService.getUser(request.getUserPrincipal().getName());

        model.addAttribute("listsOfMessages", contactService.getContactMessByUserId(user.getId()));
        model.addAttribute("user", user);

        return "userProfileMessages";
    }

    @RequestMapping(value = "/userProfileEdit", method = RequestMethod.GET)
    public String userProfileEdit(Model model, HttpServletRequest request) {

        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user", user);
        return "userProfileEdit";
    }

    @RequestMapping(value = "/userProfileEditEmail", method = RequestMethod.POST)
    public String userProfileEditEmail(@RequestParam("userName") String name, @RequestParam("id") String id, Model model, HttpServletRequest request) {
        User user = priceListService.getUser(request.getUserPrincipal().getName());

        if (name != null) {
            userService.updateEmail(name, Long.parseLong(id));
        }


        model.addAttribute("user", user);
        return "userProfile";
    }

    @RequestMapping(value = "/userProfileEditStreet", method = RequestMethod.POST)
    public String userProfileEditStreet(@RequestParam("street") String street, @RequestParam("id") String id, Model model, HttpServletRequest request) {

       /* if (street != null) {
            userService.updateStreet(street, Long.parseLong(id));
        }*/

        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user", user);

        return "userProfile";
    }

    @RequestMapping(value = "/userProfileEditPhone", method = RequestMethod.POST)
    public String userProfileEditPhone(@RequestParam("phone") String phone, @RequestParam("id") String id, Model model, HttpServletRequest request) {



        if (phone != null) {
            userService.updateNumber(phone, Long.parseLong(id));
        }

        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user", user);

        return "userProfile";
    }

    @RequestMapping(value = "/userProfileEditPassword", method = RequestMethod.POST)
    public String userProfileEditPassword(@RequestParam("password1") String password1, @RequestParam("password2") String password2, @RequestParam("id") String id, Model model, HttpServletRequest request) {

        if (password1 != null && password2 != null) {
            System.out.println(password1+ "  "+password2);
            String passwordInput = bCryptPasswordEncoder.encode(password1);
            User user2 = priceListService.getUser(request.getUserPrincipal().getName());
            System.out.println(passwordInput+" 1!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            System.out.println(user2.getPassword()+" 1!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

            if(bCryptPasswordEncoder.matches(passwordInput,user2.getPassword())) {
                System.out.println(passwordInput+" 1!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                String newPassword = bCryptPasswordEncoder.encode(password2);
                userService.updatePassword(newPassword, Long.parseLong(id));

                User user = priceListService.getUser(request.getUserPrincipal().getName());
                model.addAttribute("user", user);
                return "userProfile";
            }

        }
        return "userProfileEdit";
    }


}
