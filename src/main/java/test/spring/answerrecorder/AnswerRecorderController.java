package test.spring.answerrecorder;

import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * test.spring.answerrecorder.AnswerRecorderController <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-11-02 20:39:13<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/

@RestController
@RequestMapping("/springanswerrecorder" )
@Scope("session")
public class AnswerRecorderController {

    private List<Topic> topics=new ArrayList<Topic>();
    private String topictemp=null;

    Logger log=Logger.getLogger("org.shoukaiseki");

    /**
    @PostConstruct
    public void init(){
        topics=new ArrayList<Topic>();
        log.debug("----------------init");
    }
    **/

    /**
     * 清空题目
     * @return
     */
    @RequestMapping(value="cleartopic")
    public String clearTopic(){
        topics.clear();
        topictemp=null;
        return "success";
    }


    /**
     * 提交本次题目标识/回答错误标识
     * @return
     */
    @RequestMapping(value="submitlogo")
    public String submitLogo(){
        for (Topic topic:topics) {
            List<String> answerrecommends = topic.getAnswerrecommends();
            //当前推荐答案
            String answerrecommend = answerrecommends.get(0);
            if(topic.isLogotopic()){
                if(topic.isLogowronganswer()){
                    //错误答案添加
                    if(!topic.getAnswerwrongs().contains(answerrecommend)){
                        topic.getAnswerwrongs().add(answerrecommend);
                    }

                    //设置下一个推荐答案
                    Map<String, String> options = topic.getOptions();
                    Iterator<Map.Entry<String, String>> keys=options.entrySet().iterator();
                    while (keys.hasNext()){
                        Map.Entry<String, String> entry= keys.next();
                        log.debug("key="+entry.getKey());
                        if(entry.getKey().equals(answerrecommend)){
                            break;
                        }
                    }
                    if(keys.hasNext()){
                        answerrecommend=keys.next().getKey();
                        answerrecommends=new ArrayList<String>();
                        topic.setAnswerrecommends(answerrecommends);
                        answerrecommends.add(answerrecommend);

                        log.debug("下个推荐答案为:"+answerrecommend);
                    }
                }else{
                    //正确答案添加,如果存在则不添加
                    if(!topic.getAnswercorrects().contains(answerrecommend)){
                        topic.getAnswercorrects().add(answerrecommend);
                    }
                }
            }

            //清除本次题目标识位
            topic.setLogotopic(false);
            topic.setLogowronganswer(false);
        }
        return "success";
    }

    /**
     * 答案错误标识
     * @return
     */
    @RequestMapping(value="logowrongtopic/{index}/{islogotopic}")
    public String logoWrongTopic(@PathVariable("index")int index,@PathVariable("islogotopic")boolean islogotopic){
        log.debug("index="+index+",islogotopic="+islogotopic);
        Topic topic = topics.get(index);
        if(topic!=null){
            if(topic.isLogotopic()){
                topic.setLogowronganswer(islogotopic);
            }
            return "success";
        }
        return "error";
    }

    /**
     * 本次题目标识
     * @return
     */
    @RequestMapping(value="logotopic/{index}/{islogotopic}")
    public String logoTopic(@PathVariable("index")int index,@PathVariable("islogotopic")boolean islogotopic){
        log.debug("index="+index+",islogotopic="+islogotopic);
        Topic topic = topics.get(index);
        if(topic!=null){
            topic.setLogotopic(islogotopic);
            return "success";
        }
        return "error";
    }

    /**
     * 设置所有本次题目标识
     * @return
     */
    @RequestMapping(value="setalllogotopic/{issetalllogotopic}")
    public String setAllLogoTopic(@PathVariable("issetalllogotopic")boolean issetalllogotopic){
        log.debug(",issetalllogotopic="+issetalllogotopic);
        for (Topic topic:topics ) {
            topic.setLogotopic(issetalllogotopic);
        }
        return "success";
    }



    //批量设置错误标识位
    @RequestMapping(value="settopicerror")
    public ModelAndView setTopicError(@RequestParam(value="topic", required = false) String topic,ModelMap model) {
        log.debug("--------------------- setTopicError.topic="+topic);
        if(!isBlank(topic)&&!topic.equalsIgnoreCase(topictemp)){
            topictemp=topic;
            String[] ts = topic.split("\n");
            for (String str:ts){
                str=str.trim();
                if(str.isEmpty()){
                    continue;
                }
                int indexPosition=-1;

                String title=str;
                indexPosition=str.indexOf("、");
                if(indexPosition!=-1){
                    String substring = str.substring(0, indexPosition);
                    log.debug("substring="+substring);
                    if(isNumeric(substring)){
                        title=str.substring(indexPosition+1,str.length());
                    }
                }
                indexPosition=str.indexOf(".");
                if(indexPosition!=-1){
                    String substring = str.substring(0, indexPosition);
                    log.debug("substring="+substring);
                    if(isNumeric(substring)){
                        title=str.substring(indexPosition+1,str.length());
                    }
                }
                for (Topic topicTemp:topics) {
                    if(title.equals(topicTemp.getTitle())){
                        topicTemp.setLogowronganswer(true);
                    }
                }

            }
        }

        model.addAttribute("topics",topics);
        model.addAttribute("intopic",topic);

        ModelAndView mv=new ModelAndView();
        mv.setViewName("redirect:/springanswerrecorder");
        return mv;

    }

    //, produces="application/json"
    @RequestMapping(value="")
    public ModelAndView index(@RequestParam(value="topic", required = false) String topic,ModelMap model) {
        log.debug("--------------------- topic="+topic);
        List<Topic> topicsTemp=new ArrayList<>();
        if(!isBlank(topic)&&!topic.equalsIgnoreCase(topictemp)){
            topictemp=topic;
            String[] ts = topic.split("\n");
            Topic topicObj=null;
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
                                topicObj.getAnswercorrects().add(strTemp);
                            }
                        }
                        for (String strTemp:ls.get(1).split(",")){
                            if(!strTemp.isEmpty()){
                                topicObj.getAnswerrecommends().add(strTemp);
                            }
                        }
                        for (String strTemp:ls.get(2).split(",")){
                            if(!strTemp.isEmpty()){
                                topicObj.getAnswerwrongs().add(strTemp);
                            }
                        }
                    }
                }else{

                    indexPosition=str.indexOf("、");
                    if(indexPosition!=-1){
                        String substring = str.substring(0, indexPosition);
                        log.debug("substring="+substring);
                        if(substring.length()==1&&isLetter(substring)){
                            String option=substring;
//                            String optionContent=str.substring(indexPosition+1,str.length());
                            String optionContent=str;
                            topicObj.getOptions().put(option,optionContent);
                            istitle=false;
                        }
                    }
                    indexPosition=str.indexOf(".");
                    if(indexPosition!=-1){
                        String substring = str.substring(0, indexPosition);
                        log.debug("substring="+substring);
                        if(substring.length()==1&&isLetter(substring)){
                            String option=substring;
//                            String optionContent=str.substring(indexPosition+1,str.length());
                            String optionContent=str;
                            topicObj.getOptions().put(option,optionContent);
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
                        if(isNumeric(substring)){
                            title=str.substring(indexPosition+1,str.length());
                        }
                    }
                    indexPosition=str.indexOf(".");
                    if(indexPosition!=-1){
                        String substring = str.substring(0, indexPosition);
                        log.debug("substring="+substring);
                        if(isNumeric(substring)){
                            title=str.substring(indexPosition+1,str.length());
                        }
                    }
                    topicObj=new Topic();
                    topicObj.setTitle(title);
                    topicObj=addTopic(topicObj);
                    topicsTemp.add(topicObj);
                }

            }
        }

        int logotopicCount=0;
        int logowronganswerCount=0;
        int nocorrectsCount=0;
        for (Topic topicObj:topics) {
            if(topicObj!=null&&topicObj.getAnswerrecommends().size()==0){
                Map.Entry<String, String> first = topicObj.getOptions().entrySet().iterator().next();
                topicObj.getAnswerrecommends().add(first.getKey());
            }
            if( topicObj.isLogotopic()){
                logotopicCount++;
            }
            if(topicObj.isLogowronganswer()){
                logowronganswerCount++;
            }
            if(topicObj.getAnswercorrects().size()==0){
                nocorrectsCount++;
            }
        }


        model.addAttribute("nocorrectscount",nocorrectsCount);
        model.addAttribute("logowronganswercount",logowronganswerCount);
        model.addAttribute("logotopiccount",logotopicCount);
        model.addAttribute("topics",topics);
        model.addAttribute("intopic",topic);
        model.addAttribute("topicstemp",topicsTemp);

        log.debug("topicsTemp="+ JSONObject.toJSONString(topicsTemp));

        ModelAndView mv=new ModelAndView();
        mv.setViewName("springanswerrecorder/index");
        return mv;
    }

    /**
     * 添加题目,如果存在同标题的则不添加
     * @param topic
     * @return 不存在重复则添加
     */
    public Topic addTopic(Topic topic){
        boolean added=true;
        for (Topic topicObj:topics ) {
            if(topicObj.getTitle().equals(topic.getTitle())){
                topicObj.setLogotopic(true);
                return  topicObj;
            }
        }
        topic.setLogotopic(true);
        topics.add(topic);
        topic.setSn(topics.size());
        return topic;
    }


    /**
     * 是否为字母
     * @param str
     * @return
     */
    public static boolean isLetter(String str){
        Pattern pattern = Pattern.compile("[a-zA-Z]*");
        return pattern.matcher(str).matches();
    }

    /**
     * 是否为数字
     * @param str
     * @return
     */
    public static boolean isNumeric(String str){
        for (int i = 0; i < str.length(); i++){
            System.out.println(str.charAt(i));
            if (!Character.isDigit(str.charAt(i))){
                return false;
            }
        }
        return true;
    }

    public boolean isBlank(String str){
        return str==null||str.trim().isEmpty();
    }

}
