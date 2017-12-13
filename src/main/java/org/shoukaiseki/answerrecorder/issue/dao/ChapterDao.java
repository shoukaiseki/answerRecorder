package org.shoukaiseki.answerrecorder.issue.dao;

import org.mybatis.spring.annotation.MapperScan;
import org.shoukaiseki.answerrecorder.issue.model.Chapter;
import org.shoukaiseki.answerrecorder.issue.model.ChapterChapternameStatistics;
import org.shoukaiseki.answerrecorder.issue.model.ChapterCoursetitleStatistics;

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


    Chapter getModelById(String chapterid);

    /**
    public List<Country> getRandomList();
     **/

    int insert(Chapter obj);

    Chapter getModelByOnlyLimit(Chapter obj);


    List<Chapter> getListRelationship();


    List<ChapterCoursetitleStatistics> getCoursetitleStatisticsList();


    /**
     * 查询'培训名称'和'课程名称'对应的 所有章节,根据 chapterid 的 trainingname 和 coursetitle
     * @param chapterid
     * @return
     */
    List<ChapterChapternameStatistics> getChapternameStatisticsListByTC(String chapterid);

    /**
     * 查询'培训名称'对应的 所有章节,根据 chapterid 的 trainingname
     * @param chapterid
     * @return
     */
    List<ChapterChapternameStatistics> getChapternameStatisticsListByT(String chapterid);

    /**
     * 所有章节,根据 chapterid 的 trainingname
     * @return
     */
    List<ChapterChapternameStatistics> getChapternameStatisticsListAll();
}
