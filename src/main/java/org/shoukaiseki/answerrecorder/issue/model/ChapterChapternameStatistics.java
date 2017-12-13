package org.shoukaiseki.answerrecorder.issue.model;


/**
 * org.shoukaiseki.answerrecorder.issue.model.ChapterChapternameStatistics <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-12-14 05:08:32<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
public class ChapterChapternameStatistics {

    private String chapterid;

    private String trainingname;

    private String coursetitle;

    private String chaptername;

    private int issuecount;

    public String getChaptername() {
        return chaptername;
    }

    public void setChaptername(String chaptername) {
        this.chaptername = chaptername;
    }

    public int getIssuecount() {
        return issuecount;
    }

    public void setIssuecount(int issuecount) {
        this.issuecount = issuecount;
    }

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

}