package dao.sakila;

import org.shoukaiseki.answerrecorder.model.Country;

public interface CountryMapper {
    int deleteByPrimaryKey(Short country_id);

    int insert(Country record);

    int insertSelective(Country record);

    Country selectByPrimaryKey(Short country_id);

    int updateByPrimaryKeySelective(Country record);

    int updateByPrimaryKey(Country record);
}