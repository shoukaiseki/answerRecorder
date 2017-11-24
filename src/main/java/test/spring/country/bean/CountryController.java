package test.spring.country.bean;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import test.spring.country.dao.CountryDao;
import test.spring.country.model.Country;

import java.util.List;

/**
 **/
@RestController
@RequestMapping("/country" )
public class CountryController {
    Logger log=Logger.getLogger("org.shoukaiseki");

    @Autowired
    public CountryDao baseDao;

    @RequestMapping(value="/list", method = RequestMethod.GET)
    public ModelAndView getList(ModelMap model) {

        List<Country> list = baseDao.getList();
//        System.out.println(JSONObject.toJSONString(list));
//        model.addAttribute("message", JSONObject.toJSONString(list));
        model.addAttribute("countrys", list);

//        System.out.println(CodeLineStackTrace.getStackTrace());
        log.debug("-----------------------------linux asus----------------");
        ModelAndView mv=new ModelAndView();
        mv.setViewName("country/list");
        return mv;
    }


    @RequestMapping(value="/randomlist", method = RequestMethod.GET)
    public ModelAndView getRandomList(ModelMap model) {

        List<Country> list = baseDao.getRandomList();
//        System.out.println(JSONObject.toJSONString(list));
//        model.addAttribute("message", JSONObject.toJSONString(list));
        model.addAttribute("countrys", list);

//        System.out.println(CodeLineStackTrace.getStackTrace());
        log.debug("-----------------------------linux asus----------------");
        ModelAndView mv=new ModelAndView();
        mv.setViewName("country/list");
        return mv;
    }
}
