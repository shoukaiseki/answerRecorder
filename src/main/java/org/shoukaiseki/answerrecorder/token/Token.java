package org.shoukaiseki.answerrecorder.token;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * org.shoukaiseki.token.Token <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-12-10 20:21:47<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Token {

    /**
     * 表单页面的 Controller 方法中 添加 from=true 注解生成本次from提交的token
     * @return
     */
    boolean from() default false;

    /**
     * post处理的 Controller 方法中 添加 post=true 注解生成本次from提交的token
     * @return
     */
    boolean post() default false;

    /**
     * true:post重复自行判断,session 中 answerrecorder_from_repeatsubmit 属性判断是否为重复提交
     * @return
     */
    boolean postCustomJudgment() default false;
}
