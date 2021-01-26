package com.framework.innodale.config;

import com.framework.innodale.component.AspectInterceptor;
import com.tomes.config.JwtAuthInterceptor;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.*;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.converter.BufferedImageHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.XmlViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import java.awt.image.BufferedImage;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import static org.springframework.context.annotation.ComponentScan.*;

@Configuration
@EnableWebMvc
@PropertySource("classpath:sysConfig/default.properties")
@ComponentScan(
        basePackages = "com",
        includeFilters = {
                @Filter(type = FilterType.ASSIGNABLE_TYPE, classes = Controller.class),
                @Filter(type = FilterType.ASSIGNABLE_TYPE, classes = Component.class)
        },
        excludeFilters = {
                @Filter(type = FilterType.ASSIGNABLE_TYPE, classes = Service.class),
                @Filter(type = FilterType.ASSIGNABLE_TYPE, classes = Repository.class)
        }
)
public class WebContextConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");

        registry.addResourceHandler("swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/");

        registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Bean
    public PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
        return new PropertySourcesPlaceholderConfigurer();
    }

    @Bean
    public XmlViewResolver xmlViewResolver() {
        XmlViewResolver resolver = new XmlViewResolver();
        Resource resource = new ClassPathResource("xmlConfig/viewResolver.xml");
        resolver.setLocation(resource);
        resolver.setOrder(0);
        return resolver;
    }

    @Bean
    public TilesViewResolver tilesViewResolver() {
        TilesViewResolver resolver = new TilesViewResolver();
        resolver.setViewClass(TilesView.class);
        resolver.setViewNames("**.tiles");
        resolver.setOrder(1);
        return resolver;
    }

    @Bean
    public TilesConfigurer tilesConfigurer() {
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        tilesConfigurer.setDefinitions(new String[] { "/WEB-INF/tiles/tiles.xml" });
        tilesConfigurer.setCheckRefresh(true);
        tilesConfigurer.setDefinitionsFactoryClass(CustomLocaleDefinitionsFactory.class);
        return tilesConfigurer;
    }

    @Bean
    public InternalResourceViewResolver internalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        resolver.setOrder(2);
        return resolver;
    }

    @Bean
    public HttpMessageConverter<BufferedImage> createImageHttpMessageConverter() {
        return new BufferedImageHttpMessageConverter();
    }

    /**
     * 파일 업로드시에 사용한다.
     * @return
     */
    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver getMultipartResolver() {
        return new CommonsMultipartResolver();
    }

    @Bean
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasenames("classpath:/messages/message-common",
                "classpath:/messages/exception");
//        messageSource.setBasenames("/WEB-INF/messages");
        messageSource.setDefaultEncoding("UTF-8");
        messageSource.setCacheSeconds(5);
        return messageSource;
    }

    @Bean
    public LocaleResolver localeResolver() {
        CookieLocaleResolver localeResolver = new CookieLocaleResolver();
        localeResolver.setDefaultLocale(Locale.KOREAN);
        localeResolver.setCookieName("lang");
        return localeResolver;
    }

    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
        localeChangeInterceptor.setParamName("lang");
        return localeChangeInterceptor;
    }

    @Bean
    public AspectInterceptor aspectInterceptor() {
        return new AspectInterceptor();
    }

    @Bean
    public JwtAuthInterceptor jwtAuthInterceptor() {
        return new JwtAuthInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        List<String> tomesList = new ArrayList<String>();

        tomesList.add("/tomes/**");
        tomesList.add("/swagger-ui.html/**");
        tomesList.add("/api/**");
        tomesList.add("/v2/**");
        tomesList.add("/swagger/**");
        tomesList.add("/webjars/**");
        tomesList.add("/swagger-resources/**");

        List<String> tomesAddPathList = new ArrayList<String>();
        tomesAddPathList.add("/tomes/**");

        List<String> tomesExcludePathList = new ArrayList<String>();
        tomesExcludePathList.add("/tomes/login");

        registry.addInterceptor(localeChangeInterceptor()).addPathPatterns("/**").excludePathPatterns(tomesList);
        // registry.addInterceptor(localeChangeInterceptor()).addPathPatterns("/**");
        registry.addInterceptor(aspectInterceptor()).addPathPatterns("/**").excludePathPatterns(tomesList);

        registry.addInterceptor(jwtAuthInterceptor()).addPathPatterns(tomesAddPathList).excludePathPatterns(tomesExcludePathList);
    }

}
