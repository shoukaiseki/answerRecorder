package org.shoukaiseki.answerrecorder.issue.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Chapter {
    private String chapterid;

    private String trainingname;

    private String coursetitle;

    private String chaptername;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createdate;

    private String createby;

    public String getChapterid() {
        return chapterid;
    }

    public void setChapterid(String chapterid) {
        this.chapterid = chapterid == null ? null : chapterid.trim();
    }

    public String getTrainingname() {
        return trainingname;
    }

    public void setTrainingname(String trainingname) {
        this.trainingname = trainingname == null ? null : trainingname.trim();
    }

    public String getCoursetitle() {
        return coursetitle;
    }

    public void setCoursetitle(String coursetitle) {
        this.coursetitle = coursetitle == null ? null : coursetitle.trim();
    }

    public String getChaptername() {
        return chaptername;
    }

    public void setChaptername(String chaptername) {
        this.chaptername = chaptername == null ? null : chaptername.trim();
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getCreateby() {
        return createby;
    }

    public void setCreateby(String createby) {
        this.createby = createby == null ? null : createby.trim();
    }
}