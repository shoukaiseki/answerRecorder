package org.shoukaiseki.answerrecorder.issue.dao;

import org.mybatis.spring.annotation.MapperScan;
import org.shoukaiseki.answerrecorder.issue.model.Chapter;

import java.util.List;

/**
 * org.shoukaiseki.answerrecorder.issue.dao.ChapterDao <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-11-29 01:29:46<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
@MapperScan
public interface ChapterDao {

    List<Chapter> getList();

    /**
    public List<Country> getRandomList();
     **/

    int insert(Chapter obj);

    Chapter getModelByOnlyLimit(Chapter obj);

}
