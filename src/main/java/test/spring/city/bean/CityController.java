package test.spring.city.bean;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import test.spring.CodeLineStackTrace;
import test.spring.city.dao.CityDao;
import test.spring.city.model.City;

import java.util.List;

/**
 * test.spring.maximo.mobileversion.bean.MobileVersionController <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-10-26 22:09:38<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
@RestController
@RequestMapping("/city" )
public class CityController {

    Logger log=Logger.getLogger("org.shoukaiseki");
    protected final Log logger = LogFactory.getLog("org.shoukaiseki");

    @Autowired
    public CityDao cityDao;

    @RequestMapping(value="/list", method = RequestMethod.GET)
    public ModelAndView getList(ModelMap model) {

        List<City> list = cityDao.getList();
//        System.out.println(JSONObject.toJSONString(list));
//        model.addAttribute("message", JSONObject.toJSONString(list));
        model.addAttribute("citys", list);

//        System.out.println(CodeLineStackTrace.getStackTrace());
        log.debug("-----------------------------linux asus----------------");
        logger.debug("-----------------------------linux asus22----------------");
        ModelAndView mv=new ModelAndView();
        mv.setViewName("city/list");
        return mv;
    }


}
