package com.uca.capas.configuration;

import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;


public class SpringInitializer implements WebApplicationInitializer  {
	private static Logger logger = Logger.getLogger(SpringInitializer.class.getName());
	
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
		ctx.register(SpringConfiguration.class);
		ctx.setServletContext(servletContext);
		
		ServletRegistration.Dynamic servlet = servletContext.addServlet("spring-mfsa", new DispatcherServlet(ctx));
		
		servlet.addMapping("/");
		servlet.setLoadOnStartup(1);
		logger.info("Initalizating spring-capas dispatcher servlet: " + logger.getName());
	}
}
