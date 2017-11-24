package test.spring.country.dao;

import org.mybatis.spring.annotation.MapperScan;
import test.spring.country.model.Country;

import java.util.List;

/**
 * test.spring.country.dao.CountryDao<br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-11-24 19:05:052017-11-24グ19:05:11shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
@MapperScan
public interface CountryDao {
    //此处的方法名必须和mapper中的映射文件中的id同名
    //回去映射文件中通过com.hua.saf.dao.UserDao.getUser,即this.getClass().getName()+".getUser

    public List<Country> getList();

    public List<Country> getRandomList();
}
