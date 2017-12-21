package org.shoukaiseki.answerrecorder.issue.bean;

import com.google.common.collect.Lists;
import org.shoukaiseki.answerrecorder.issue.dao.IssueDao;
import org.shoukaiseki.answerrecorder.issue.model.Issue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * org.shoukaiseki.answerrecorder.issue.bean.FindIssueController <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-12-21 09:32:39<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
@RestController
@RequestMapping("/findissue" )
@Scope("session")
public class FindIssueController {

    @Autowired
    public IssueDao issueDao;

    String keyword="";
    public List<Issue> issueList= Lists.newArrayList();

    @RequestMapping(value="")
    public ModelAndView index(@RequestParam(value="keyword", required = false) String keyword, ModelMap model) {
        if(keyword!=null){
            this.keyword=keyword;
            keyword=keyword.replaceAll(" ","%");
            issueList=issueDao.findIssueByLike(keyword);

        }else{
            this.keyword="";
            issueList= Lists.newArrayList();
        }
        model.addAttribute("keyword",this.keyword);
        model.addAttribute("list",issueList);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("findissue/index");
        return mv;
    }

    @RequestMapping(value="find")
    public ModelAndView find(@RequestParam(value="keyword", required = false) String keyword, ModelMap model) {
        if(keyword!=null){
            this.keyword=keyword;
            issueList=issueDao.findIssueByLike(keyword);

        }else{
            this.keyword="";
            issueList= Lists.newArrayList();
        }

        ModelAndView mv=new ModelAndView();
        mv.setViewName("redirect:/findissue");
        return mv;
    }



}
