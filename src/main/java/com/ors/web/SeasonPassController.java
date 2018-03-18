package com.ors.web;

import com.ors.model.SeasonPass;
import com.ors.service.PriceListService;
import com.ors.service.SeasonPassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;


@Controller
public class SeasonPassController
{
    @Autowired
    private SeasonPassService seasonPassService;

    @RequestMapping(value = "/karnety/{userId}", method = RequestMethod.GET)
    public String userSeasonPasses(@PathVariable Long userId)
    {
        List<SeasonPass> seasonPasses = seasonPassService.findByUserId(userId);

        return "karnety_usera";
    }

    @RequestMapping(value = "/karnet")
    public String userSeasonPassForObject()
    {
        //SeasonPass seasonPass = seasonPassService.findByUserIdAndObjectId(userId, objectId);
        return "karnet_obiektu";
    }
}
