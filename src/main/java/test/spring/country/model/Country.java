package test.spring.country.model;

import java.util.Date;
import java.util.List;

/**
 * test.spring.country.model.Country <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-11-24 15:13:29<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
public class Country {

    private Short country_id;

    private String country;

    private Date last_update;

    public Short getCountry_id() {
        return country_id;
    }

    public void setCountry_id(Short country_id) {
        this.country_id = country_id;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country == null ? null : country.trim();
    }

    public Date getLast_update() {
        return last_update;
    }

    public void setLast_update(Date last_update) {
        this.last_update = last_update;
    }



    private List<City> cityList;

    public List<City> getCityList() {
        return cityList;
    }

    public void setCityList(List<City> cityList) {
        this.cityList = cityList;
    }


}
