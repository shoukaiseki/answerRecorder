package test.spring.answerrecorder;

import java.util.*;

/**
 * test.spring.answerrecorder.Topic <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-11-02 21:55:20<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
public class Topic {

    private  int sn;
    private String title;
    //<选项:A,B,C,D,选项内容:ABCD的内容>
    private Map<String,String> options= new LinkedHashMap<>();
    private List<String> answercorrects=new ArrayList<>();
    private List<String> answerrecommends= new ArrayList<>();
    private List<String> answerwrongs= new ArrayList<>();

    //本次题目标识
    private boolean logotopic =false;

    //答案错误标识
    private boolean logowronganswer=false;

    public boolean isLogowronganswer() {
        return logowronganswer;
    }

    public void setLogowronganswer(boolean logowronganswer) {
        this.logowronganswer = logowronganswer;
    }

    public boolean isLogotopic() {
        return logotopic;
    }

    public void setLogotopic(boolean logotopic) {
        this.logotopic = logotopic;
    }

    public int getSn() {
        return sn;
    }

    public void setSn(int sn) {
        this.sn = sn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Map<String, String> getOptions() {
        return options;
    }

    public void setOptions(Map<String, String> options) {
        this.options = options;
    }

    public List<String> getAnswercorrects() {
        return answercorrects;
    }

    public void setAnswercorrects(List<String> answercorrects) {
        this.answercorrects = answercorrects;
    }

    public List<String> getAnswerrecommends() {
        return answerrecommends;
    }

    public void setAnswerrecommends(List<String> answerrecommends) {
        this.answerrecommends = answerrecommends;
    }

    public List<String> getAnswerwrongs() {
        return answerwrongs;
    }

    public void setAnswerwrongs(List<String> answerwrongs) {
        this.answerwrongs = answerwrongs;
    }
}
