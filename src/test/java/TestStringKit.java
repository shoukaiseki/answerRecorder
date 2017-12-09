import org.shoukaiseki.answerrecorder.issue.utils.StringKit;

import java.util.Date;

public class TestStringKit {

    public static void main(String[] args) {

        Date date = new Date();
        String s = StringKit.INSTANCE.formatTime(date);
        System.out.println(s);
    }
}
