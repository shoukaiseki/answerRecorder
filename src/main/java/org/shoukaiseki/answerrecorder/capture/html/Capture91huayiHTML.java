package org.shoukaiseki.answerrecorder.capture.html;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.helper.StringUtil;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.nodes.TextNode;
import org.jsoup.select.Elements;
import org.jsoup.select.NodeTraversor;
import org.jsoup.select.NodeVisitor;
import test.spring.answerrecorder.Topic;

import javax.sound.midi.Soundbank;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * org.shoukaiseki.answerrecorder.capture.html.Capture91huayiHTML <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-12-19 12:22:32<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
public class Capture91huayiHTML {

    static Logger log=Logger.getLogger(Capture91huayiHTML.class);

    private List<Topic> topics=new ArrayList<Topic>();

    private String urlStr;

    public Capture91huayiHTML(String url){
       this.urlStr=url;
    }

    public void process() throws Exception {
        process(1);

    }


    static boolean lastCharIsWhitespace(StringBuilder sb) {
        return sb.length() != 0 && (sb.charAt(sb.length() - 1) == '\n'||sb.charAt(sb.length() - 1) == '\t'||sb.charAt(sb.length() - 1) == ' ');
    }


    static boolean preserveWhitespace(Node node) {
        if (node != null && node instanceof Element) {
            Element el = (Element)node;
            int i = 0;

            do {
                if (el.tag().preserveWhitespace()) {
                    return true;
                }

                el = el.parent();
                ++i;
            } while(i < 6 && el != null);
        }

        return false;
    }

    private static void appendNormalisedText(StringBuilder accum, TextNode textNode) {
        String text = textNode.getWholeText();
        text=text.trim();
        if(" ".equalsIgnoreCase(text)){
            text="";
        }
//        log.info("text=["+text+"]");
        if(!lastCharIsWhitespace(accum)&&accum.length()>0){
            accum.append("\n");
        }
        if (preserveWhitespace(textNode.parentNode())) {
            accum.append(text);
        } else {
            accum.append(text);
//            StringUtil.appendNormalisedWhitespace(accum, text, lastCharIsWhitespace(accum));
        }

    }

    public void process(int cyclesCount) throws Exception {
        for (int i=0;i<cyclesCount;i++){
            resolve();
        }

    }

    public void resolve() throws Exception {
        Document document = Jsoup.connect(urlStr).get();
        Element gvQuestion = document.getElementById("gvQuestion");
        Elements spans = gvQuestion.getElementsByTag("span");
        final StringBuilder accum = new StringBuilder();
        NodeTraversor.traverse(new NodeVisitor() {
            public void head(Node node, int depth) {
                if (node instanceof TextNode) {
                    TextNode textNode = (TextNode)node;
                    appendNormalisedText(accum, textNode);
                } else if (node instanceof Element) {
                    Element element = (Element)node;
                    if(element.tag().getName().equals("input")){
                        if(!lastCharIsWhitespace(accum)&&accum.length()>0){
                            accum.append("\n");
                        }
                        accum.append(element.val());
                    }
                    if (accum.length() > 0 && (element.isBlock() || element.tag().getName().equals("br")) && !lastCharIsWhitespace(accum)) {
                        if(!lastCharIsWhitespace(accum)&&accum.length()>0){
                            accum.append("\n");
                        }
                    }
                }

            }

            public void tail(Node node, int depth) {
            }
        }, gvQuestion);
        String text = accum.toString();
        log.debug("gvQuestion=\n"+text);

        String[] texts = text.split("\n");
        for (int i=0;i+11<texts.length;i=i+12){
            if(texts[i].indexOf("、")==-1)break;
            if(texts[i+5].indexOf("A、")==-1)break;
            if(texts[i+7].indexOf("B、")==-1)break;
            if(texts[i+9].indexOf("C、")==-1)break;
            if(texts[i+11].indexOf("D、")==-1)break;
            Topic topic = new Topic();
            topic.setTitle(texts[i+1]);
            if(hasTopic(topic)){
             continue;
            }
            String daan=texts[i+2];
            List<String> answercorrects= Lists.newArrayList();
            List<String> answerrecommends= Lists.newArrayList();

            if(daan.equals(texts[i+4])){
                answercorrects.add("A");
                answerrecommends.add("A");
            }else if(daan.equals(texts[i+6])){
                answercorrects.add("B");
                answerrecommends.add("B");
            }else if(daan.equals(texts[i+8])){
                answercorrects.add("C");
                answerrecommends.add("C");
            }else if(daan.equals(texts[i+10])){
                answercorrects.add("D");
                answerrecommends.add("D");
            }
            topic.setAnswercorrects(answercorrects);
            topic.setAnswerrecommends(answerrecommends);

            Map<String,String> options= new LinkedHashMap<>();
            String textQA = texts[i + 5];
            String textQB = texts[i + 7];
            String textQC = texts[i + 9];
            String textQD = texts[i + 11];
            options.put("A",textQA);
            options.put("B",textQB);
            options.put("C",textQC);
            options.put("D",textQD);
            topic.setOptions(options);
            addTopic(topic);
        }
    }

    public List<Topic> getTopics() {
        return topics;
    }


    public boolean hasTopic(Topic topic){
        boolean added=true;
        for (Topic topicObj:topics ) {
            if(topicObj.getTitle().equals(topic.getTitle())){
                return  true;
            }
        }
        return false;
    }

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

    public void process1() throws Exception {

        URL url = new URL(urlStr);
        HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
        InputStreamReader input = new InputStreamReader(httpConn
                .getInputStream(), "utf-8");
        BufferedReader bufReader = new BufferedReader(input);
        String line = "";
        StringBuilder contentBuf = new StringBuilder();
        while ((line = bufReader.readLine()) != null) {
            contentBuf.append(line);
        }
        log.debug("contentBuf="+contentBuf.toString());
    }

    public static void main(String[] args) throws Exception {
        Capture91huayiHTML captureHtml = new Capture91huayiHTML("http://wspx.91huayi.com/myexam/courseware_exam.aspx?cwid=00c4d79a-2586-438c-b1c1-e599253714f2&cwid2=5b7158f9-e391-4fac-8fe6-a7a000f37d6b&uid=ZTU3MjgxMWYtZGUzYy00NTVkLThjMDYtMWYzOWJmNGFlZjJi&ptid=9af73078-2eee-4dfd-96fa-a7a0010ef374");
        captureHtml.process(20);
        List<Topic> topics = captureHtml.getTopics();
        System.out.println(JSONObject.toJSONString(topics));

    }
}
