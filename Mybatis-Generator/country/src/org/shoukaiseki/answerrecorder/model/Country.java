package org.shoukaiseki.answerrecorder.model;

import java.util.Date;

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
}