import com.alibaba.fastjson.JSONObject;
import test.spring.answerrecorder.Topic;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 **/
public class TestString {

    public static void main(String[] args) {
        String sss="正确的答案:[B]\t\t推荐的答案:[B]\t\t错误的答案:[A]\t\t本次题目标识:  \t答案错误标识:  ";
        sss="正确的答案:[D]\t\t推荐的答案:[D]\t\t错误的答案:[A, B, C]\t\t本次题目标识:  \t答案错误标识:  ";
        List<String> ls=new ArrayList<String>();
        Pattern pattern = Pattern.compile("(?<=\\[)(.*?)(?=\\])");
        Matcher matcher = pattern.matcher(sss);
        while(matcher.find()){
            ls.add(matcher.group());
        }
        System.out.println(JSONObject.toJSONString(ls));
        Topic topicObj=new Topic();
        topicObj.getAnswercorrects().add("D");
        if(ls.size()==3){
            for (String strTemp:ls.get(0).split(",")){
                if(!strTemp.isEmpty()){
                    System.out.println("topicObj.getAnswercorrects().before="+JSONObject.toJSONString(topicObj.getAnswercorrects()));
                    topicObj.getAnswercorrects().add(strTemp);
                    System.out.println("topicObj.getAnswercorrects().before="+JSONObject.toJSONString(topicObj.getAnswercorrects()));
                }
            }
            System.out.println("topicObj.getAnswercorrects().before="+JSONObject.toJSONString(topicObj.getAnswercorrects()));
            for (String strTemp:ls.get(1).split(",")){
                if(!strTemp.isEmpty()){
                    topicObj.getAnswerrecommends().add(strTemp);
                }
            }
            System.out.println("topicObj.getAnswercorrects().before="+JSONObject.toJSONString(topicObj.getAnswercorrects()));
            for (String strTemp:ls.get(2).split(",")){
                if(!strTemp.isEmpty()){
                    topicObj.getAnswerwrongs().add(strTemp);
                }
            }
            System.out.println("topicObj.getAnswercorrects().before="+JSONObject.toJSONString(topicObj.getAnswercorrects()));
        }

        String chaptername="泌尿系统疾病（二）.txt";
        if(chaptername.indexOf(".txt")>-1){
            chaptername=chaptername.substring(0,chaptername.indexOf(".txt"));
        }
        System.out.println("chaptername="+chaptername);

        System.out.println("topicObj="+topicObj.getAnswercorrects());
        System.out.println("\n" +
                "\t\t         <label for=\"text-12\">Text input:</label>\n" +
                "\t\t           <input type=\"text\" name=\"text-12\" id=\"text-12\" value=\"\">");
    }
}
