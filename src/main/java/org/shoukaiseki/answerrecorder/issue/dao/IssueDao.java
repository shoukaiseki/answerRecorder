package org.shoukaiseki.answerrecorder.issue.dao;

import org.apache.ibatis.annotations.Param;
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


    List<Issue> getRandomList();

    List<Issue> findIssueByLike(String keyword);

    /**
     * 分页显示,每页默认10条
     * @param page
     * @param pageSize
     * @return
     */
    List<Issue> getListPagingDisplay(@Param("pagenum") int page,@Param("pagesize") int pageSize);

}
