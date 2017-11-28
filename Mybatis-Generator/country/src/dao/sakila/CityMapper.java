package dao.sakila;

import org.shoukaiseki.answerrecorder.model.City;

public interface CityMapper {
    int deleteByPrimaryKey(Short city_id);

    int insert(City record);

    int insertSelective(City record);

    City selectByPrimaryKey(Short city_id);

    int updateByPrimaryKeySelective(City record);

    int updateByPrimaryKey(City record);
}