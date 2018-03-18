package com.ors.web;

        import com.ors.model.ObjectDutyHours;
        import com.ors.model.PriceList;
        import com.ors.service.ObjectDutyHoursService;
        import com.ors.service.PriceListService;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Controller;
        import org.springframework.ui.Model;
        import org.springframework.web.bind.annotation.RequestMapping;
        import org.springframework.web.bind.annotation.RequestMethod;
        import org.springframework.web.bind.annotation.RequestParam;

        import javax.servlet.http.HttpServletRequest;
        import java.util.List;


@Controller
public class PriceListController
{
    @Autowired
    private PriceListService priceListService;


    @RequestMapping(value = "/priceList", method = RequestMethod.GET)
    public String priceListsOfAllObjects(Model model)
    {
        List<PriceList> priceLists = priceListService.findAll();

        model.addAttribute("priceLists", priceLists);

        return "priceList";
    }
}