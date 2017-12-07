package org.shoukaiseki.answerrecorder.issue.dao;

import org.mybatis.spring.annotation.MapperScan;
import org.shoukaiseki.answerrecorder.issue.model.Issue;

import java.util.List;

/**
 * org.shoukaiseki.answerrecorder.dao.IssueDao <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-11-27 23:32:15<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
@MapperScan
public interface IssueDao {

    List<Issue> getList();

    /**
    public List<Country> getRandomList();
     **/

    int insert(Issue obj);


    Issue getModelByOnlyLimit(Issue obj);


    List<Issue> findByChapterid(String chapterid);
}
