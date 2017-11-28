package dao.answer;

import org.shoukaiseki.answerrecorder.model.Issue;

public interface IssueMapper {
    int insert(Issue record);

    int insertSelective(Issue record);
}