package test.spring;

import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.core.io.Resource;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.reactive.result.view.View;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * test.spring.HelloWorldController <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-10-18 17:43:10<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
@RestController
@RequestMapping("/test" )
public class HelloWorldController {

    Logger log=Logger.getLogger("org.shoukaiseki");
    protected final Log logger = LogFactory.getLog("org.shoukaiseki");

    //, produces="application/json"
    @RequestMapping(value="/hello", method = RequestMethod.GET)
    public ModelAndView printWelcome(ModelMap model) {
        model.addAttribute("message", "Spring 3 MVC Hello World");
        org.springframework.web.servlet.DispatcherServlet asfsd;
        System.out.println(CodeLineStackTrace.getStackTrace());
        log.debug("-----------------------------linux asus----------------");
        logger.debug("-----------------------------linux asus22----------------");
        ModelAndView mv=new ModelAndView();
        mv.setViewName("views/hello");


        return mv;
    }

    @RequestMapping(value = "/asus")
    public ModelAndView showJsp2() {
        System.out.println("MAVTest.java login()....");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("views/view2");
        mav.addObject("msg", "hello kitty");

        // List
        List<String> list = new ArrayList<String>();
        list.add("java");
        list.add("c++");
        list.add("oracle");
        mav.addObject("bookList", list);

        // Map
        Map<String, String> map = new HashMap<String, String>();
        map.put("zhangsan", "北京");
        map.put("lisi", "上海");
        map.put("wangwu", "深圳");
        mav.addObject("map", map);

        return mav;
    }


    /**
     * 中文乱码 添加 produces = "text/html;charset=UTF-8" 注解即可
     * @return
     */
    @RequestMapping(value = "/json",produces = "text/html;charset=UTF-8"  )
    public String showJson() {
        List<Object> jsonList = new ArrayList<Object>();
        // List
        List<String> list = new ArrayList<String>();
        list.add("java");
        list.add("c++");
        list.add("oracle");
        jsonList.add( list);

        // Map
        Map<String, String> map = new HashMap<String, String>();
        map.put("zhangsan", "北京");
        map.put("lisi", "上海");
        map.put("wangwu", "深圳");
        jsonList.add(map);


        String s = JSONObject.toJSONString(jsonList);
        logger.debug("-------------------------"+s);
        return s;
    }
}
