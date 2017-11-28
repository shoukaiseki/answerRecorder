package org.shoukaiseki.answerrecorder.issue.model;

import java.io.Serializable;
import java.util.Date;

public class Issue implements Serializable{
    private String issueid;

    private String chapterid;

    private String question;

    private String answer;

    private String answerdescription;

    private Date createdate;

    private String createby;

    public String getIssueid() {
        return issueid;
    }

    public void setIssueid(String issueid) {
        this.issueid = issueid == null ? null : issueid.trim();
    }

    public String getChapterid() {
        return chapterid;
    }

    public void setChapterid(String chapterid) {
        this.chapterid = chapterid == null ? null : chapterid.trim();
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question == null ? null : question.trim();
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }

    public String getAnswerdescription() {
        return answerdescription;
    }

    public void setAnswerdescription(String answerdescription) {
        this.answerdescription = answerdescription == null ? null : answerdescription.trim();
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
