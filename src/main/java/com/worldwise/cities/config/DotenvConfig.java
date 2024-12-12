package com.worldwise.cities.config;

import io.github.cdimascio.dotenv.Dotenv;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DotenvConfig {

    @Value("${DOTENV_FILE:.env}") // Permitir especificar um arquivo diferente se necessário
    private String dotenvFile;

    @jakarta.annotation.PostConstruct
    public void loadDotenv() {
        Dotenv dotenv = Dotenv.configure()
                .filename(dotenvFile)
                .ignoreIfMalformed()
                .ignoreIfMissing()
                .load();

        dotenv.entries().forEach(entry -> System.setProperty(entry.getKey(), entry.getValue()));
    }
}

