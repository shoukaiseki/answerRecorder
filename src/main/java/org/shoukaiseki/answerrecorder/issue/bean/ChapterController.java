package org.shoukaiseki.answerrecorder.issue.bean;

import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;
import org.shoukaiseki.answerrecorder.issue.dao.ChapterDao;
import org.shoukaiseki.answerrecorder.issue.model.Chapter;
import org.shoukaiseki.answerrecorder.issue.model.Issue;
import org.shoukaiseki.answerrecorder.issue.validator.ChapterValidator;
import org.shoukaiseki.answerrecorder.issue.validator.IssueValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.ui.ModelMap;
import org.springframework.validation.DataBinder;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * org.shoukaiseki.answerrecorder.issue.bean.ChapterController <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-11-29 02:17:35<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
@RestController
@RequestMapping("/chapter" )
@Scope("session")
public class ChapterController {
    Logger log=Logger.getLogger("org.shoukaiseki");

    Chapter data=null;

    @Autowired
    public ChapterDao baseDao;

    @RequestMapping(value="/list", method = RequestMethod.GET)
    public ModelAndView getList(ModelMap model) {

        List<Chapter> list = baseDao.getList();
        model.addAttribute("datas", list);

        ModelAndView mv=new ModelAndView();
        mv.setViewName("issue/list");
        return mv;
    }

    @InitBinder
    public void InitBinder(DataBinder binder){
        // 设置验证的类为 IssueValidator
        binder.setValidator(new ChapterValidator());
    }


    /**
     * PathVariable 参数不能为空
     */
    /**
    @ModelAttribute
    public String populateModel(@RequestParam String chapterid) {
        return chapterid;
    }
     **/

    @RequestMapping(value="/add/{chapterid}",method=RequestMethod.GET)
    public ModelAndView add(@PathVariable(value="chapterid",required=false) String chapterid, ModelMap model){
        log.debug("chapterid="+chapterid);
        ModelAndView mv=new ModelAndView();
        if("0".equals(chapterid)){
            if(data==null){
                data=new Chapter();
                data.setChapterid(UUID.randomUUID().toString());
                data.setCreatedate(new Date());
            }
            model.addAttribute("chapter",data);
            model.addAttribute("isnew",true);
            mv.setViewName("chapter/edit");
        }
        return mv;
    }

    /**
     * @Validated 验证时不能用 ModelMap 参数
     * @param data
     * @param errors
     * @return
     */
    @RequestMapping(value="/save",method=RequestMethod.POST)
    public ModelAndView add(@Validated Chapter data, Errors errors){

        log.debug("chapter="+ JSONObject.toJSONString(data));
        if (errors.hasFieldErrors()){
            ModelAndView mv=new ModelAndView();
            mv.setViewName("chapter/edit");
            log.debug("------------11111111");
            return mv;

        }
        this.data=data;
        baseDao.insert(data);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("chapter/edit");
        return mv;
    }

}
