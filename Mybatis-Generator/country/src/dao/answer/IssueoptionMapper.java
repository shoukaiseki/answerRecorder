package dao.answer;

import org.shoukaiseki.answerrecorder.model.Issueoption;

public interface IssueoptionMapper {
    int insert(Issueoption record);

    int insertSelective(Issueoption record);
}