# Etapa 1: Construye la aplicación Spring Boot
FROM maven:3.8.4-openjdk-17-slim AS build

WORKDIR /app

COPY . .

RUN mvn clean install

# Etapa 2: Crea la imagen final
FROM openjdk:17-jdk-slim

# Configuración de PostgreSQL
ENV POSTGRES_DB=securitydb
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=admin

# Configuración opcional para permitir conexiones desde cualquier dirección IP (ajusta según tus necesidades)
ENV POSTGRES_HOST_AUTH_METHOD=trust

# Copia el JAR de la aplicación
COPY --from=build /app/target/tu-aplicacion.jar app.jar

# Expone el puerto de la aplicación Spring Boot
EXPOSE 8080

# Instala PostgreSQL y ajusta la configuración
RUN apt-get update && \
    apt-get install -y postgresql-client && \
    rm -rf /var/lib/apt/lists/*

# Comando para iniciar PostgreSQL y ejecutar la aplicación al iniciar el contenedor
CMD service postgresql start && java -jar app.jar