package org.shoukaiseki.answerrecorder.issue.bean;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import org.apache.log4j.Logger;
import org.shoukaiseki.answerrecorder.issue.dao.ChapterDao;
import org.shoukaiseki.answerrecorder.issue.dao.IssueDao;
import org.shoukaiseki.answerrecorder.issue.dao.IssueoptionDao;
import org.shoukaiseki.answerrecorder.issue.model.Chapter;
import org.shoukaiseki.answerrecorder.issue.model.Issue;
import org.shoukaiseki.answerrecorder.issue.model.Issueoption;
import org.shoukaiseki.answerrecorder.issue.plugin.impfile.File91huayiImp;
import org.shoukaiseki.answerrecorder.issue.utils.StringKit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.*;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 **/
@Controller()
@RequestMapping( "/impfiles" )
@Scope("session")
public class ImpFilesController {


    @Autowired
    public IssueDao issueDao;

    @Autowired
    public ChapterDao chapterDao;

    @Autowired
    public IssueoptionDao issueoptionDao;

    Logger log= Logger.getLogger("org.shoukaiseki");

    Chapter data=null;

    List<Chapter> chapters= Lists.newArrayList();

    @RequestMapping(value="/import/{chapterid}",method= RequestMethod.GET)
    public ModelAndView add(@PathVariable(value="chapterid",required=false) String chapterid, ModelMap model){
        log.debug("chapterid="+chapterid);
        ModelAndView mv=new ModelAndView();
        if("0".equals(chapterid)){
            if(data==null){
                data=new Chapter();
                data.setCreatedate(new Date());
            }
            model.addAttribute("chapter",data);
            model.addAttribute("isnew",true);
            model.addAttribute("chapters",chapters);
            mv.setViewName("impfiles/index");
        }
        return mv;
    }

    @RequestMapping("/fileUploadMultiple")
    public String fileUploadMul(@Validated Chapter chapter, @RequestParam("updateFiles") CommonsMultipartFile[] files, ModelMap model){
        log.debug("coursetitle="+chapter.getCoursetitle()+",trainingname="+chapter.getTrainingname());
        this.data=chapter;
        long startTime=System.currentTimeMillis();   //获取开始时间
        String msg="";
        if(files.length==0){
            msg="无附件";
        }
        for (CommonsMultipartFile file:files){
            if(!file.isEmpty()){
                try {
                    InputStream in = file.getInputStream();
                    BufferedInputStream bis = new BufferedInputStream(in);
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    int c;
                    byte[] respBuffer =null;
                    respBuffer = new byte[2048];
                    while (true) {
                        c = bis.read(respBuffer);
                        if (c == -1)
                            break;

                        baos.write(respBuffer, 0, c);
                    }
                    in.close();
                    byte[] data = baos.toByteArray();
                    baos.flush();
                    bis.close();
                    String dataStr = new String(data, "UTF-8");
                    log.debug("data="+ dataStr);
                    Chapter obj=new Chapter();
                    obj.setChapterid(UUID.randomUUID().toString());
                    Date createdate = new Date();
                    obj.setCreatedate(createdate);
                    obj.setCreateby("ARADMIN");
                    obj.setTrainingname(chapter.getTrainingname());
                    obj.setCoursetitle(chapter.getCoursetitle());
                    String chaptername = file.getOriginalFilename();
                    if(chaptername.indexOf(".txt")>-1){
                        chaptername=chaptername.substring(0,chaptername.indexOf(".txt"));
                    }
                    obj.setChaptername(chaptername);

                    Chapter chapterTemp = chapterDao.getModelByOnlyLimit(obj);
                    log.debug("chapterTemp="+chapterTemp);
                    if(chapterTemp==null){
                        chapterDao.insert(obj);
                    }else{
                        obj=chapterTemp;
                    }

                    File91huayiImp impFile = new File91huayiImp();
                    List<Issue> issues = impFile.parser(obj.getChapterid(), dataStr);
                    for (Issue issue:issues ) {
                        Issue issueTemp = issueDao.getModelByOnlyLimit(issue);
                        log.debug("issueTemp="+JSONObject.toJSONString(issueTemp));
                        log.debug("issue="+JSONObject.toJSONString(issue));
                        if(issueTemp==null){
                            issue.setCreatedate(createdate);
                            issue.setCreateby("ARADMIN");
                            issueDao.insert(issue);
                            for (Issueoption issueoption:issue.getIssueoptionList()){
                                issueoption.setCreatedate(createdate);
                                issueoption.setCreateby("ARADMIN");
                                issueoptionDao.insert(issueoption);
                            }
                        }else{
                            issue=issueTemp;
                        }
                        obj.getIssueList().add(issue);
                    }
                    chapters.add(obj);
                    msg="上传成功";

                } catch (Exception e) {
                    e.printStackTrace();
                    log.error("ImpFilesController",e);
                    msg="上传失败";
                }
            }
        }
        long endTime=System.currentTimeMillis(); //获取结束时间
        log.debug("上传文件共使用时间："+(endTime-startTime)+"ms");
        msg+="<br>"+"上传文件共使用时间："+(endTime-startTime)+"ms";
        msg+="<br>"+"上传文件共使用时间："+ StringKit.timeDifference(startTime,endTime)+"ms";
        model.addAttribute("msg",msg);
        model.addAttribute("chapters",chapters);
        return "impfiles/index";
    }
}
