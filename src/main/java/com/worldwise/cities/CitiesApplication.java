package com.worldwise.cities;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import io.github.cdimascio.dotenv.Dotenv;

@SpringBootApplication
public class CitiesApplication {

	public static void main(String[] args) {
		Dotenv dotenv = Dotenv.load();
        System.setProperty("DOTENV_DB_HOST", dotenv.get("DOTENV_DB_HOST"));
        System.setProperty("DOTENV_DB_PORT", dotenv.get("DOTENV_DB_PORT"));
        System.setProperty("DOTENV_DB_NAME", dotenv.get("DOTENV_DB_NAME"));
        System.setProperty("DOTENV_DB_USER", dotenv.get("DOTENV_DB_USER"));
        System.setProperty("DOTENV_DB_PASSWORD", dotenv.get("DOTENV_DB_PASSWORD"));
		SpringApplication.run(CitiesApplication.class, args);
	}

}
