package org.shoukaiseki.answerrecorder.issue.model;


/**
 * org.shoukaiseki.answerrecorder.issue.model.ChapterCoursetitleStatistics <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-12-14 04:35:39<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
public class ChapterCoursetitleStatistics {

    private String chapterid;

    private String trainingname;

    private String coursetitle;

    private int chapternamecount;

    public int getChapternamecount() {
        return chapternamecount;
    }

    public void setChapternamecount(int chapternamecount) {
        this.chapternamecount = chapternamecount;
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