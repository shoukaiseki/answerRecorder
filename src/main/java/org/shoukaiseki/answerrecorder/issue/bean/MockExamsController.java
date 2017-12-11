package org.shoukaiseki.answerrecorder.issue.bean;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import org.apache.log4j.Logger;
import org.shoukaiseki.answerrecorder.issue.dao.IssueDao;
import org.shoukaiseki.answerrecorder.issue.model.Issue;
import org.shoukaiseki.answerrecorder.issue.model.MockExams;
import org.shoukaiseki.answerrecorder.issue.utils.StringKit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

/**
 * org.shoukaiseki.answerrecorder.issue.bean.MockExamsController <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-12-11 06:41:13<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
@RestController
@RequestMapping("/mockexams" )
@Scope("session")
public class MockExamsController {

    Logger log=Logger.getLogger("org.shoukaiseki.mockexams");

    @Autowired
    private IssueDao baseDao;

    private List<Issue> list;
    private int rownum=0;

    Issue rowdata=null;

    private Map<String,MockExams> exams= null;

    private  Set<Integer> errorList;
    private  Set<Integer> correctList;
    private  Set<Integer> sizeList;


    @RequestMapping(value="/index/{rownum}", method = RequestMethod.GET)
    public ModelAndView index(@PathVariable("rownum") int rownum, ModelMap model) {
        if(list==null){
            list = baseDao.getRandomList();
            exams=Maps.newLinkedHashMap()   ;
            errorList= Sets.newHashSet();
            correctList= Sets.newHashSet();
            sizeList=  Sets.newHashSet();

            rownum=1;
            for (int i=0;i<list.size();i++) {
                Issue issue=list.get(i);
                MockExams value = new MockExams();


                value.setIssue(issue);
                exams.put(StringKit.numberFormat.format(i+1), value);
            }

        }

        if(rownum<1){
            this.rownum=0;
        }else{
            MockExams mockExams = exams.get(StringKit.numberFormat.format(this.rownum+1));
            mockExams.setStatus("");
            if(StringKit.INSTANCE.isBlank(mockExams.getAnswer())){
                mockExams.setStatus("EOVWait");
            }else if(mockExams.getIssue().getAnswer().equalsIgnoreCase(mockExams.getAnswer())){
                mockExams.setStatus("EOVCorrect");
            }else{
                mockExams.setStatus("EOVError");
            }
            this.rownum=rownum-1;
        }
        MockExams mockExams = exams.get(StringKit.numberFormat.format(this.rownum+1));
        mockExams.setStatus("EOVHover");
        rowdata=list.get(this.rownum);
        model.addAttribute("mockexams",mockExams);
        model.addAttribute("exams", exams);
        model.addAttribute("model", rowdata);
        model.addAttribute("rownum",this.rownum);
        model.addAttribute("errorList",errorList);
        model.addAttribute("correctList",correctList);
        model.addAttribute("sizeList",sizeList);

//        System.out.println(CodeLineStackTrace.getStackTrace());
        log.debug("----------------------------- repeatpost index ----------------");
        ModelAndView mv=new ModelAndView();
        mv.setViewName("mockexams/index");
        return mv;
    }

    @RequestMapping(value="/previous", method = RequestMethod.GET)
    public ModelAndView previous(@RequestParam("answer") String answer, ModelMap model) {
        log.debug("answer="+answer);
        ModelAndView mv=new ModelAndView();
        if(exams==null){
            list=null;
            mv.setViewName("redirect:index/-1");
            return mv;
        }
        MockExams mockExams = exams.get(StringKit.numberFormat.format(this.rownum+1));
        if(mockExams!=null){
            mockExams.setAnswer(answer);
        }
        answerAction();
        int row=this.rownum;
        if(row<0){
           row=0;
        }
        mv.setViewName("redirect:index/"+StringKit.numberFormat.format(row));
        return mv;
    }

    @RequestMapping(value="/next", method = RequestMethod.GET)
    public ModelAndView next(@RequestParam("answer") String answer,ModelMap model) {
        log.debug("answer="+answer);
        ModelAndView mv=new ModelAndView();
        if(exams==null){
            list=null;
            mv.setViewName("redirect:index/-1");
            return mv;
        }
        MockExams mockExams = exams.get(StringKit.numberFormat.format(this.rownum+1));
        if(mockExams!=null){
            mockExams.setAnswer(answer);
        }
        answerAction();
        int row=this.rownum+2;
        if(rownum>exams.size()){
            row=0;
        }
        mv.setViewName("redirect:index/"+StringKit.numberFormat.format(row));
        return mv;
    }

    @RequestMapping(value="/reset", method = RequestMethod.GET)
    public ModelAndView reset(ModelMap model) {
        list=null;
        ModelAndView mv=new ModelAndView();
        mv.setViewName("redirect:index/-1");
        return mv;
    }

    public void answerAction(){
        if(rownum>=0&&rownum<exams.size()){
            MockExams mockExams = exams.get(StringKit.numberFormat.format(rownum+1));
            log.debug("mockExams="+mockExams);
            if(mockExams!=null){
                if(mockExams.getIssue().getAnswer().equals(mockExams.getAnswer())){
                    errorList.remove(rownum+1);
                    sizeList.add(rownum+1);
                    correctList.add(rownum+1);
                }else if(!StringKit.INSTANCE.isBlank(mockExams.getAnswer())){
                    correctList.remove((rownum+1));
                    sizeList.add((rownum+1));
                    errorList.add(rownum+1);
                }
            }
        }
        log.debug("errorList.size="+errorList.size());
        log.debug("correctList.size="+correctList.size());
        log.debug("sizeList.size="+sizeList.size());

    }
}
