package test.spring.city.dao;

import org.mybatis.spring.annotation.MapperScan;
import test.spring.city.model.City;

import java.util.List;

/**
 * test.spring.city.dao.CityDao <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-11-23 23:47:38<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
@MapperScan
public interface CityDao {

    //此处的方法名必须和mapper中的映射文件中的id同名
    //回去映射文件中通过com.hua.saf.dao.UserDao.getUser,即this.getClass().getName()+".getUser

    public List<City> getList();

    public List<City> getselectByCountry_id(Short country_id);
}

