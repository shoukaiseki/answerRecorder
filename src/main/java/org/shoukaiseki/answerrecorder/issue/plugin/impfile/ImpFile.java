package org.shoukaiseki.answerrecorder.issue.plugin.impfile;

import org.shoukaiseki.answerrecorder.issue.model.Chapter;
import org.shoukaiseki.answerrecorder.issue.model.Issue;

import java.util.List;

/**
 * org.shoukaiseki.answerrecorder.issue.plugin.impfile.ImpFile <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-12-07 07:06:54<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
public interface ImpFile {

    List<Issue> parser(String chapterid,String str);

}
