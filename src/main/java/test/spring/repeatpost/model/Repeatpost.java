package test.spring.repeatpost.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * test.spring.repeatpost.model.Repeatpost <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-12-10 20:32:37<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
public class Repeatpost {

    private String id;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date time;
    private String name;
    private String user;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
}
