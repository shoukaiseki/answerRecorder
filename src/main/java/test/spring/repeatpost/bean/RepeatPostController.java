package test.spring.repeatpost.bean;

import org.apache.log4j.Logger;
import org.shoukaiseki.answerrecorder.token.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import test.spring.repeatpost.model.Repeatpost;

import javax.servlet.http.HttpServletRequest;
import java.rmi.Remote;
import java.util.Date;
import java.util.UUID;

@RestController
@RequestMapping("/repeatpost" )
@Scope("session")
public class RepeatPostController {


    @Autowired
    private  HttpServletRequest request;

    Repeatpost data=null;

    int count=0;

    Logger log=Logger.getLogger("org.shoukaiseki.session");

    @Token(from=true)
    @RequestMapping(value="/index", method = RequestMethod.GET)
    public ModelAndView index(ModelMap model) {
        if(data==null){
            Repeatpost repeatpost=new Repeatpost();
            repeatpost.setId(UUID.randomUUID().toString());
            repeatpost.setTime(new Date());
            this.data=repeatpost;
        }
        model.addAttribute("model", data);
        model.addAttribute("count",count);

//        System.out.println(CodeLineStackTrace.getStackTrace());
        log.debug("----------------------------- repeatpost index ----------------");
        ModelAndView mv=new ModelAndView();
        mv.setViewName("repeatpost/index");
        return mv;
    }

    @Token(post=true)
    @RequestMapping(value="/post", method = RequestMethod.POST)
    public ModelAndView post(@Validated Repeatpost data, ModelMap model){
        ModelAndView mv=new ModelAndView();
        this.data=data;
        model.addAttribute("model",data);
        model.addAttribute("count",++count);

        mv.setViewName("repeatpost/post");
        return mv;
    }

    @Token(post = true,postCustomJudgment = true)
    @RequestMapping(value="/show", method = RequestMethod.POST)
    public ModelAndView show(@Validated Repeatpost data,ModelMap model){
        log.debug("token="+request.getParameter("answerrecorder_from_token"));
        log.debug("token="+request.getSession(false).getAttribute("answerrecorder_from_token"));
        log.debug("answerrecorder_from_repeatsubmit="+request.getSession(false).getAttribute("answerrecorder_from_repeatsubmit"));
        log.debug("answerrecorder_from_repeatsubmit.if="+"false".equals(request.getSession(false).getAttribute("answerrecorder_from_repeatsubmit")));
        if("false".equals(request.getSession(false).getAttribute("answerrecorder_from_repeatsubmit"))){
            this.data=data;
            ++count;
        }
        ModelAndView mv=new ModelAndView();
        mv.setViewName("redirect:showget");
        return mv;
    }

    @RequestMapping(value="/showget")
    public ModelAndView showget(ModelMap model){
        model.addAttribute("model",this.data);
        model.addAttribute("count",count);

        ModelAndView mv=new ModelAndView();
        mv.setViewName("repeatpost/show");
        return mv;
    }


    @RequestMapping(value="/showinvalid")
    public ModelAndView showinvalid(@Validated Repeatpost data,ModelMap model){
        this.data=data;
        ++count;
        model.addAttribute("model",this.data);
        model.addAttribute("count",count);

        ModelAndView mv=new ModelAndView();
        mv.setViewName("repeatpost/show");
        return mv;
    }
}
