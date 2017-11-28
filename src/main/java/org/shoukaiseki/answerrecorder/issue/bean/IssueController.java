package org.shoukaiseki.answerrecorder.issue.bean;

import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;
import org.shoukaiseki.answerrecorder.issue.dao.IssueDao;
import org.shoukaiseki.answerrecorder.issue.model.Issue;
import org.shoukaiseki.answerrecorder.issue.validator.IssueValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.DataBinder;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 **/
@RestController
@RequestMapping("/issue" )
public class IssueController {
    Logger log=Logger.getLogger("org.shoukaiseki");

    @Autowired
    public IssueDao baseDao;

    @RequestMapping(value="/list", method = RequestMethod.GET)
    public ModelAndView getList(ModelMap model) {

        List<Issue> list = baseDao.getList();
//        System.out.println(JSONObject.toJSONString(list));
//        model.addAttribute("message", JSONObject.toJSONString(list));
        model.addAttribute("datas", list);

//        System.out.println(CodeLineStackTrace.getStackTrace());
        log.debug("-----------------------------linux asus----------------");
        ModelAndView mv=new ModelAndView();
        mv.setViewName("issue/list");
        return mv;
    }

    @InitBinder
    public void InitBinder(DataBinder binder){
        // 设置验证的类为 IssueValidator
        binder.setValidator(new IssueValidator());
    }

    @RequestMapping(value="/add",method=RequestMethod.GET)
    public ModelAndView add(ModelMap model){
        ModelAndView mv=new ModelAndView();
        Issue issue=new Issue();
        model.addAttribute("issue",issue);
        mv.setViewName("issue/edit");
        return mv;
    }

    /**
     * @Validated 验证时不能用 ModelMap 参数
     * @param issue
     * @param errors
     * @return
     */
    @RequestMapping(value="/add",method=RequestMethod.POST)
    public ModelAndView add(@Validated Issue issue,  Errors errors){

        log.debug("issue="+ JSONObject.toJSONString(issue));
        if (errors.hasFieldErrors()){
            ModelAndView mv=new ModelAndView();
            mv.setViewName("issue/edit");
            log.debug("------------11111111");
            return mv;

        }
        issue.setIssueid(UUID.randomUUID().toString());
        issue.setCreatedate(new Date());
        baseDao.add(issue);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("issue/edit");
        return mv;
    }

}
