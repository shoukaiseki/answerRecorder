package test.soap;

import org.springframework.stereotype.Service;

import javax.jws.WebService;

/**
 * test.soap.TestAOPServiceImp <br>
 *
 * @author 蒋カイセキ    Japan-Tokyo  2017-10-20 19:21:25<br>
 * ブログ http://shoukaiseki.blog.163.com/<br>
 * E-メール jiang28555@Gmail.com<br>
 **/
@WebService(targetNamespace = "http://www.asus.com/",endpointInterface="test.soap.TestAOPService", serviceName="TestAOPService")
public class TestAOPServiceImp implements TestAOPService{

    @Override
    public String hello(String name) {
        return "hello "+name;
    }

}
