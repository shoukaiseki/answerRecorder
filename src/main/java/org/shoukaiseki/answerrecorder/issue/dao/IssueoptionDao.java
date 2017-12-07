package org.shoukaiseki.answerrecorder.issue.dao;

import org.mybatis.spring.annotation.MapperScan;
import org.shoukaiseki.answerrecorder.issue.model.Issue;
import org.shoukaiseki.answerrecorder.issue.model.Issueoption;

import java.util.List;

/**
 * org.shoukaiseki.answerrecorder.issue.dao.IIssueoptionDao<br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-12-07 17:50:562017-12-07グ17:51:11shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
@MapperScan
public interface IssueoptionDao {

    List<Issueoption> getList();

    /**
    public List<Country> getRandomList();
     **/

    int insert(Issueoption obj);

}
