package cl.tbd.back.datasource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.sql2o.Sql2o;

@Configuration
public class PostgresDatasource {

    @Value("${database1.url}")
    private String db1Url;

    @Value("${database2.url}")
    private String db2Url;

    @Value("${database3.url}")
    private String db3Url;

    @Value("${database.user}")
    private String dbUser;

    @Value("${database.password}")
    private String dbPass;

    @Bean
    @Qualifier("db1")
    public Sql2o db1() {
        return new Sql2o(db1Url, dbUser, dbPass);
    }

    @Bean
    @Qualifier("db2")
    public Sql2o db2() {
        return new Sql2o(db2Url, dbUser, dbPass);
    }

    @Bean
    @Qualifier("db3")
    public Sql2o db3() {
        return new Sql2o(db3Url, dbUser, dbPass);
    }

}