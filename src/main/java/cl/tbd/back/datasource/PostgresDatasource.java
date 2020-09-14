package cl.tbd.back.datasource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.sql2o.Sql2o;

@Configuration
public class PostgresDatasource {

    @Value("${database1.url}")
    private String db1Url;

    @Value("${database.user}")
    private String dbUser;

    @Value("${database.password}")
    private String dbPass;

    @Bean
    public Sql2o sql2o() {
        return new Sql2o(db1Url, dbUser, dbPass); //TBDBACK1
    }

}