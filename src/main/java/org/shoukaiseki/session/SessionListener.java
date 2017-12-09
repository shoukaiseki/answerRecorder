package org.shoukaiseki.session;

import org.apache.log4j.Logger;
import org.shoukaiseki.answerrecorder.issue.utils.StringKit;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.Date;

/**
 * org.shoukaiseki.session.SessionListener <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-12-10 02:41:46<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
public class SessionListener implements HttpSessionListener{

    private final static Logger log=Logger.getLogger("org.shoukaiseki.session");

    public void sessionCreated(HttpSessionEvent event) {
        HttpSession ses = event.getSession();
        String id=ses.getId()+";创建时间="+ StringKit.INSTANCE.formatTime(new Date(ses.getCreationTime()));
        log.debug("session 创建.id="+id); //创建会话时输出
    }


    public void sessionDestroyed(HttpSessionEvent event) {
        HttpSession ses = event.getSession();
        String id=ses.getId()+";失效时间="+StringKit.INSTANCE.formatTime(new Date(ses.getCreationTime()));
        synchronized (this) {
            log.debug("session 失效.id="+id);//失效时输出
        }
    }
}
