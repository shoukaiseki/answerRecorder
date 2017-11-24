package dao.sakila;

import model.sakila.Country;

public interface CountryMapper {
    int deleteByPrimaryKey(Short country_id);

    int insert(Country record);

    int insertSelective(Country record);

    Country selectByPrimaryKey(Short country_id);

    int updateByPrimaryKeySelective(Country record);

    int updateByPrimaryKey(Country record);
}