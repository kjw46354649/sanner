package com.framework.innodale.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.aspectj.lang.annotation.Aspect;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.aop.Advisor;
import org.springframework.aop.aspectj.AspectJExpressionPointcut;
import org.springframework.aop.support.DefaultPointcutAdvisor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.*;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.interceptor.DefaultTransactionAttribute;
import org.springframework.transaction.interceptor.RollbackRuleAttribute;
import org.springframework.transaction.interceptor.RuleBasedTransactionAttribute;
import org.springframework.transaction.interceptor.TransactionInterceptor;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

@Aspect
@Configuration
@EnableTransactionManagement
@EnableAspectJAutoProxy
@ComponentScan(
        basePackages = "com",
        includeFilters = {
                @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, classes = Service.class),
                @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, classes = Repository.class),
                @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, classes = Component.class)
        },
        excludeFilters = {
                @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, classes = Controller.class)
        }
)
public class ApplicationContextConfig {

    private static final int TX_METHOD_TIMEOUT = 600;

    @Autowired
    private Environment environment;

    /**
     * {@link javax.sql.DataSource}를 빈으로 등록한다.
     * BoneCP는 오픈소스 JDBC Pool 라이브러리이다.
     * 같은 일을 하는 라이브러리로 Tomcat JDBC Pool(Apache DBCP), c3p0 등이 있다.
     */
    @Bean
    public DataSource dataSource() {

        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(environment.getRequiredProperty("base.jdbc.driverClassName"));
        dataSource.setUrl(environment.getRequiredProperty("base.jdbc.url"));
        dataSource.setUsername(environment.getRequiredProperty("base.jdbc.username"));
        dataSource.setPassword(environment.getRequiredProperty("base.jdbc.password"));

        return dataSource;
    }

    /**
     * 스프링이 트랜잭션을 관리할때 사용하는 트랜잭션매니저를 등록한다.
     */
    @Bean
    public DataSourceTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dataSource());
    }

    @Bean
    public SqlSessionFactoryBean sqlSessionFactory(DataSource dataSource, ApplicationContext applicationContext) throws IOException {

        SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();

        // 마이바티스가 사용한 DataSource를 등록
        sqlSessionFactory.setDataSource(dataSource);

        // 마이바티스 설정파일 위치 설정
        sqlSessionFactory.setConfigLocation(applicationContext.getResource("classpath:xmlConfig/mybatisConfig.xml"));

        // spring.examples.model 패키지 이하의 model 클래스 이름을 짧은 별칭으로 등록
        // factoryBean.setTypeAliasesPackage("spring.examples.model");

        // META-INF/mybatis/mappers 패키지 이하의 모든 XML을 매퍼로 등록
        sqlSessionFactory.setMapperLocations(applicationContext.getResources("classpath:sqlMaps/*.xml"));

        return sqlSessionFactory;
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }


    @Bean
    public TransactionInterceptor txAdvice() {

        TransactionInterceptor txAdvice = new TransactionInterceptor();
        Properties txAttributes = new Properties();
        List<RollbackRuleAttribute> rollbackRules = new ArrayList<RollbackRuleAttribute>();
        rollbackRules.add(new RollbackRuleAttribute(Exception.class));

        /** If need to add additionall exceptio, add here **/
        DefaultTransactionAttribute readOnlyAttribute = new DefaultTransactionAttribute(TransactionDefinition.PROPAGATION_REQUIRED);

        readOnlyAttribute.setReadOnly(true);
        readOnlyAttribute.setTimeout(TX_METHOD_TIMEOUT);

        RuleBasedTransactionAttribute writeAttribute = new RuleBasedTransactionAttribute(TransactionDefinition.PROPAGATION_REQUIRED, rollbackRules);
        writeAttribute.setTimeout(600);

        String readOnlyTransactionAttributesDefinition = readOnlyAttribute.toString();
        String writeTransactionAttributesDefinition = writeAttribute.toString();

        txAttributes.setProperty("*", readOnlyTransactionAttributesDefinition);

        txAttributes.setProperty("create*", writeTransactionAttributesDefinition);
        txAttributes.setProperty("update*", writeTransactionAttributesDefinition);
        txAttributes.setProperty("save*", writeTransactionAttributesDefinition);
        txAttributes.setProperty("remove*", writeTransactionAttributesDefinition);
        txAttributes.setProperty("modify*", writeTransactionAttributesDefinition);
        txAttributes.setProperty("manager*", writeTransactionAttributesDefinition);

        txAdvice.setTransactionAttributes(txAttributes);
        txAdvice.setTransactionManager(transactionManager());

        return txAdvice;

    }

    @Bean
    public Advisor txAdviceAdvisor() {
        AspectJExpressionPointcut pointcut = new AspectJExpressionPointcut();
        pointcut.setExpression("within(@org.springframework.stereotype.Service *)");
        return new DefaultPointcutAdvisor(pointcut, txAdvice());

    }

    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(environment.getRequiredProperty("smtp_host"));
        mailSender.setPort(Integer.parseInt(environment.getRequiredProperty("smtp_port")));

        mailSender.setUsername(environment.getRequiredProperty("smtp_userid"));
        mailSender.setPassword(environment.getRequiredProperty("smtp_userpawd"));

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtps");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");

        return mailSender;
    }

}