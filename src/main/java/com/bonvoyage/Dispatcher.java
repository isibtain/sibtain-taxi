package com.bonvoyage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.*;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.bonvoyage.formatter.ZipCodeFormatter;
import com.bonvoyage.interceptor.NoticeInterceptor;
 
@EnableWebMvc
@Configuration
@ComponentScan(basePackages = { "com.bonvoyage.controller" })
@PropertySource(value="classpath:application.properties")
public class Dispatcher extends WebMvcConfigurerAdapter {
 
	@Autowired 
	Environment environment;

	
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(environment.getProperty("staticResourceAlias")).addResourceLocations(environment.getProperty("staticResourceLocation"));
    }
 
    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }
 
    @Bean
    public InternalResourceViewResolver jspViewResolver() {
        InternalResourceViewResolver bean = new InternalResourceViewResolver();
        bean.setPrefix(environment.getProperty("viewResolver.prefix"));
        bean.setSuffix(environment.getProperty("viewResolver.suffix"));
        return bean;
    }
 
    @Override
    public void addInterceptors(InterceptorRegistry registry) 
    {
      registry.addInterceptor(new NoticeInterceptor())
              .addPathPatterns("/login");
    }

    @Bean(name = "messageSource")
    public ReloadableResourceBundleMessageSource messageSource() {
        ReloadableResourceBundleMessageSource resource = new ReloadableResourceBundleMessageSource();
        resource.setBasename("classpath:messages");
        resource.setDefaultEncoding("UTF-8");
        return resource;
    }
 
    @Bean(name = "validator")
    public LocalValidatorFactoryBean validator() {
       LocalValidatorFactoryBean bean = new LocalValidatorFactoryBean();
       bean.setValidationMessageSource(messageSource());
       return bean;
    }

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
//        multipartResolver().setMaxUploadSizePerFile(1048576); //1MB
        resolver.setDefaultEncoding("utf-8");
        return resolver;
    }


    @Override
    public Validator getValidator(){
       return validator();
    }

//    @Bean
//    public MultipartResolver multipartResolver() {
//        CommonsMultipartResolver multipartResolver
//          = new CommonsMultipartResolver();
//        multipartResolver.setMaxUploadSize(1 * 1024 * 1024); //1 MB
//        return multipartResolver;
//    }

    public void addFormatters(FormatterRegistry registry) {

        registry.addFormatter(new ZipCodeFormatter());
    }
    
}
