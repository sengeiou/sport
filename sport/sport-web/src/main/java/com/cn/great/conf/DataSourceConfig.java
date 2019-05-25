package com.cn.great.conf;


import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

/**
 * @program: sport
 * @description: MySql数据库连接池配置
 * @author: Stamp
 * @create: 2019-03-26 13:57
 **/
@Configuration
@MapperScan(basePackages = "com.cn.great.mapper.**",sqlSessionFactoryRef = "sqlSessionFactory")
public class DataSourceConfig {
    @Bean(name = "dataSource")
    @ConfigurationProperties("mybatis.datasource")
    public DataSource dataSource(){
        return DataSourceBuilder.create().build();
    }

    @Bean(name = "sqlSessionFactory")
    public SqlSessionFactory sqlSessionFactory(@Qualifier("dataSource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
        sessionFactoryBean.setDataSource(dataSource);
        // 配置类型别名
        sessionFactoryBean.setTypeAliasesPackage("com.cn.great.model.**");
        sessionFactoryBean.setMapperLocations(new PathMatchingResourcePatternResolver()
                .getResources("classpath:/mapper/**/*Mapper.xml")
        );
        sessionFactoryBean.setConfigLocation( new DefaultResourceLoader().getResource("classpath:/mapper/config/sqlMapConfig.xml"));
        return sessionFactoryBean.getObject();
    }

}
