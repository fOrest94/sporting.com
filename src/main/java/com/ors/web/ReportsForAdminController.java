package com.ors.web;

import com.ors.model.ReportObj;
import com.ors.model.User;
import com.ors.service.PriceListService;
import com.ors.service.ReportsForAdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.List;


@Controller
public class ReportsForAdminController {

    @Autowired
    private ReportsForAdministratorService reportsForAdministratorService;

    @Autowired
    private PriceListService priceListService;


    @RequestMapping(value = "/reports", method = RequestMethod.GET)
    public String priceListsOfAllObjects(Model model, HttpServletRequest request) {

        User user = priceListService.getUser(request.getUserPrincipal().getName());
        List<ReportObj> reportObjs = Arrays.asList(reportsForAdministratorService.reportForNewUser(),
                reportsForAdministratorService.reportForReservations());

        model.addAttribute("user", user);
        model.addAttribute("reports", reportObjs);
        return "userProfileReports";
    }
}
