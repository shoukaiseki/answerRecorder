package dao.answer;

import org.shoukaiseki.answerrecorder.model.Chapter;

public interface ChapterMapper {
    int insert(Chapter record);

    int insertSelective(Chapter record);
}