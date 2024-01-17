# Etapa de construcción
FROM maven:3.8.4-openjdk-17-slim AS build

WORKDIR /app

COPY . .

# Empaqueta la aplicación con Maven
RUN mvn clean install

# Etapa de ejecución
FROM openjdk:17-jdk-slim

WORKDIR /app

EXPOSE 8080

# Copia el JAR construido desde la etapa de construcción
COPY --from=build /app/target/tu-aplicacion.jar app.jar

# Comando para ejecutar la aplicación al iniciar el contenedor
ENTRYPOINT ["java", "-jar", "app.jar"]