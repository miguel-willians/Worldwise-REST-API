FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn
COPY src ./src
RUN chmod 777 mvnw

# Argumentos para build
ARG DOTENV_DB_HOST
ARG DOTENV_DB_PORT
ARG DOTENV_DB_NAME
ARG DOTENV_DB_USER
ARG DOTENV_DB_PASSWORD

# Persistir como variáveis de ambiente no runtime
ENV DOTENV_DB_HOST=${DOTENV_DB_HOST}
ENV DOTENV_DB_PORT=${DOTENV_DB_PORT}
ENV DOTENV_DB_NAME=${DOTENV_DB_NAME}
ENV DOTENV_DB_USER=${DOTENV_DB_USER}
ENV DOTENV_DB_PASSWORD=${DOTENV_DB_PASSWORD}

# Build do Maven (sem testes)
RUN ./mvnw package -DskipTests -X

# Verificar o JAR gerado
RUN ls -l ./target

# Comando de execução
CMD ["java", "-jar", "target/cities-0.0.1-SNAPSHOT.war"]
