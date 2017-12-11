package org.shoukaiseki.answerrecorder.token;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.util.UUID;

/**
 * org.shoukaiseki.answerrecorder.token.TokenInterceptor <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-12-10 20:22:39<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
public class TokenInterceptor extends HandlerInterceptorAdapter {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();
            Token annotation = method.getAnnotation(Token.class);
            if (annotation != null) {
                boolean needSaveSession = annotation.from();
                if (needSaveSession) {
                    request.getSession(false).setAttribute("answerrecorder_from_token", UUID.randomUUID().toString());
                }
                boolean needRemoveSession = annotation.post();
                if (needRemoveSession) {
                    boolean repeatSubmit = isRepeatSubmit(request);
                    if(annotation.postCustomJudgment()){
                        if(repeatSubmit){
                            request.getSession(false).setAttribute("answerrecorder_from_repeatsubmit","true");
                        }else{
                            request.getSession(false).setAttribute("answerrecorder_from_repeatsubmit","false");
                        }
                    }else{
                        if (repeatSubmit) {
                            return false;
                        }
                    }
                    request.getSession(false).removeAttribute("answerrecorder_from_token");
                }
            }
            return true;
        } else {
            return super.preHandle(request, response, handler);
        }
    }

    private boolean isRepeatSubmit(HttpServletRequest request) {
        String serverToken = (String) request.getSession(false).getAttribute("answerrecorder_from_token");
        if (serverToken == null) {
            return true;
        }
        String clinetToken = request.getParameter("answerrecorder_from_token");
        if (clinetToken == null) {
            return true;
        }
        if (!serverToken.equals(clinetToken)) {
            return true;
        }
        return false;
    }
}
