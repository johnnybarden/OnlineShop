package com.epam.onlineshop;

import org.apache.log4j.BasicConfigurator;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class OnlineShopApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(OnlineShopApplication.class);
	}

	public static void main(String[] args) {
		BasicConfigurator.configure();
		SpringApplication.run(OnlineShopApplication.class, args);
	}

}
