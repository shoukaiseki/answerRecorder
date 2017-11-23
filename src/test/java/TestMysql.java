import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 **/
public class TestMysql {
    public static final String url = "jdbc:mysql://120.78.205.6:3306/answer?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT";
    public static final String name = "com.mysql.cj.jdbc.Driver";
    public static final String user = "root";
    public static final String password = "asus";

    public Connection conn = null;
    public PreparedStatement pst = null;

    public void conn() {
        try {
            Class.forName(name);//指定连接类型
            conn = DriverManager.getConnection(url, user, password);//获取连接
            String sql = "select 'X'";
            sql="select * from sakila.city";
            pst = conn.prepareStatement(sql);//准备执行语句
            System.out.println("查询成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            this.conn.close();
            this.pst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public static void main(String[] args) {

        TestMysql mysql=new TestMysql();
        mysql.conn();
        mysql.close();

    }
}
