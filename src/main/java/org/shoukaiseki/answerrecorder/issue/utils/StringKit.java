package org.shoukaiseki.answerrecorder.issue.utils;

import java.util.regex.Pattern;

/**
 * org.shoukaiseki.answerrecorder.issue.utils.StringKit <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-12-07 07:53:25<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
public class StringKit {

    /**
     * 是否为空或者null
     * @param str
     * @return
     */
    public static boolean isBlank(String str){
        return str==null||str.trim().isEmpty();
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

    /**
     * 时间差计算
     * @param starttime 毫秒
     * @param endtime 毫秒
     * @return **m**s**ms
     */
    public static String timeDifference(long starttime,long endtime){
        String s="";
        long timeTemp =  endtime-starttime;
        s= timeTemp/(1000*60)+"m"+(timeTemp/1000)%60+"s"+timeTemp%1000+"ms";
        return s;
    }
}
