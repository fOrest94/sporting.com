package com.ors.web;

import com.ors.model.ObjectDutyHours;
import com.ors.service.ObjectDutyHoursService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;



@Controller
public class ObjectDutyHoursController
{
    @Autowired
    private ObjectDutyHoursService objectDutyHoursService;

    @RequestMapping(value = "/godziny_wszytkich_obiektow", method = RequestMethod.GET)
    public String dutyHoursOfAllObjects()
    {
        List<ObjectDutyHours> dutyHours = objectDutyHoursService.findAll();
        return "godziny_wszystkich_obiektow";
    }
}
