package org.shoukaiseki.answerrecorder.issue.plugin.impfile;

import com.google.common.collect.Lists;
import org.apache.log4j.Logger;
import org.jetbrains.annotations.NotNull;
import org.shoukaiseki.answerrecorder.issue.model.Issue;
import org.shoukaiseki.answerrecorder.issue.model.Issueoption;
import org.shoukaiseki.answerrecorder.issue.utils.StringKit;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * org.shoukaiseki.answerrecorder.issue.plugin.impfile.File91huayiImp <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-12-07 07:12:55<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
public class File91huayiImp implements ImpFile{

    Logger log=Logger.getLogger("org.shoukaiseki");

    @Override
    public List<Issue> parser(@NotNull String chapterid, String string) {
        ArrayList<Issue> list = Lists.newArrayList();
        if(!StringKit.INSTANCE.isBlank(string)){
            String[] ts = string.split("\n");
            Issue issueObj=null;
            for (String str:ts){
                str=str.trim();
                if(str.isEmpty()){
                    continue;
                }
                boolean istitle=true;
                int indexPosition=-1;
                if(str.indexOf("正确的答案:")>-1){
                    istitle=false;
                    //正确的答案,推荐的答案,错误的答案导入设置
                    List<String> ls=new ArrayList<String>();
                    Pattern pattern = Pattern.compile("(?<=\\[)(.*?)(?=\\])");
                    Matcher matcher = pattern.matcher(str);
                    while(matcher.find()){
                        ls.add(matcher.group());
                    }
                    if(ls.size()==3){
                        for (String strTemp:ls.get(0).split(",")){
                            if(!strTemp.isEmpty()){
                                issueObj.setAnswer(strTemp);
                            }
                        }
                        /**
                         *
                         //推荐的答案
                        for (String strTemp:ls.get(1).split(",")){
                            if(!strTemp.isEmpty()){
                                topicObj.getAnswerrecommends().add(strTemp);
                            }
                        }
                         //错误的答案
                        for (String strTemp:ls.get(2).split(",")){
                            if(!strTemp.isEmpty()){
                                topicObj.getAnswerwrongs().add(strTemp);
                            }
                        }
                         *
                         */
                    }
                }else{

                    indexPosition=str.indexOf("、");
                    if(indexPosition!=-1){
                        String substring = str.substring(0, indexPosition);
                        log.debug("substring="+substring);
                        if(substring.length()==1&& StringKit.INSTANCE.isLetter(substring)){
                            String option=substring;
//                            String optionContent=str.substring(indexPosition+1,str.length());
                            String optionContent=str.substring(indexPosition+1);
                            Issueoption issueoption = new Issueoption();
                            issueoption.setIssueoptionid(UUID.randomUUID().toString());
                            issueoption.setIssueid(issueObj.getIssueid());
                            issueoption.setOption(option);
                            issueoption.setOptiondescription(optionContent);
                            issueObj.getIssueoptionList().add(issueoption);
                            istitle=false;
                        }
                    }
                    indexPosition=str.indexOf(".");
                    if(indexPosition!=-1){
                        String substring = str.substring(0, indexPosition);
                        log.debug("substring="+substring);
                        if(substring.length()==1&& StringKit.INSTANCE.isLetter(substring)){
                            String option=substring;
//                            String optionContent=str.substring(indexPosition+1,str.length());
                            String optionContent=str.substring(indexPosition+1);
                            Issueoption issueoption = new Issueoption();
                            issueoption.setIssueoptionid(UUID.randomUUID().toString());
                            issueoption.setIssueid(issueObj.getIssueid());
                            issueoption.setOption(option);
                            issueoption.setOptiondescription(optionContent);
                            issueObj.getIssueoptionList().add(issueoption);
                            istitle=false;
                        }
                    }
                }


                if(istitle){
                    String title=str;
                    indexPosition=str.indexOf("、");
                    if(indexPosition!=-1){
                        String substring = str.substring(0, indexPosition);
                        log.debug("substring="+substring);
                        if(StringKit.INSTANCE.isNumeric(substring)){
                            title=str.substring(indexPosition+1);
                        }
                    }
                    indexPosition=str.indexOf(".");
                    if(indexPosition!=-1){
                        String substring = str.substring(0, indexPosition);
                        log.debug("substring="+substring);
                        if(StringKit.INSTANCE.isNumeric(substring)){
                            title=str.substring(indexPosition+1);
                        }
                    }
                    if(issueObj!=null&& StringKit.INSTANCE.isBlank(issueObj.getAnswerdescription())&&!StringKit.INSTANCE.isBlank(issueObj.getAnswer())){

                        for (Issueoption issueoptionTemp:issueObj.getIssueoptionList()) {
                            if(issueObj.getAnswer().equals(issueoptionTemp.getOption())){
                               issueObj.setAnswerdescription(issueoptionTemp.getOptiondescription());
                            }
                        }
                    }
                    issueObj=new Issue();
                    issueObj.setChapterid(chapterid);
                    issueObj.setQuestion(title);
                    issueObj.setIssueid(UUID.randomUUID().toString());
                    list.add(issueObj);
                }

            }
        }


        return list;
    }

}
